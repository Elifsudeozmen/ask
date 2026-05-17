.PHONY: all clean

all: action.plan.md

# =========================================
# Phase 1 — FAN-OUT (Parallel Analysis)
# =========================================

quality.md: codebase.txt
	cat codebase.txt | ./ask "Analyze this codebase for code quality issues. Focus on readability, structure, maintainability, naming, duplication, and bad practices. Return 5-7 bullet points in markdown format." > quality.md

perf.md: codebase.txt
	cat codebase.txt | ./ask "Analyze this codebase for performance problems. Focus on bottlenecks, memory usage, inefficient loops, unnecessary computations, and scalability. Return 5-7 bullet points in markdown format." > perf.md

security.md: codebase.txt
	cat codebase.txt | ./ask "Analyze this codebase for security vulnerabilities. Focus on unsafe patterns, injection risks, insecure storage, authentication problems, and sensitive data exposure. Return 5-7 bullet points in markdown format." > security.md

# =========================================
# Phase 2 — LOCAL SUMMARIZATION
# =========================================

quality.sum.md: quality.md
	cat quality.md | ./ask "Compress this into exactly 5 concise actionable bullet points." > quality.sum.md

perf.sum.md: perf.md
	cat perf.md | ./ask "Compress this into exactly 5 concise actionable bullet points." > perf.sum.md

security.sum.md: security.md
	cat security.md | ./ask "Compress this into exactly 5 concise actionable bullet points." > security.sum.md

# =========================================
# Phase 3 — CONCAT REPORT (No LLM)
# =========================================

concatenated.md: quality.sum.md perf.sum.md security.sum.md
	echo "## Code Quality" > concatenated.md
	cat quality.sum.md >> concatenated.md
	echo "\n## Performance" >> concatenated.md
	cat perf.sum.md >> concatenated.md
	echo "\n## Security" >> concatenated.md
	cat security.sum.md >> concatenated.md

# =========================================
# Phase 4 — FAN-IN #1 (LLM Refine)
# =========================================

refined.md: concatenated.md
	cat concatenated.md | ./ask "Refine this engineering report. Remove duplicate items, keep only high-signal issues, and organize the output into Code Quality, Performance, and Security sections." > refined.md

# =========================================
# Phase 5 — FAN-IN #2 (Final Action Plan)
# =========================================

action.plan.md: refined.md
	cat refined.md | ./ask "Generate a final Engineering Action Plan. Include prioritized actions (High/Medium/Low), effort estimates (Small/Medium/Large), and recommended execution order." > action.plan.md

# =========================================
# CLEAN
# =========================================

clean:
	rm -f *.md
