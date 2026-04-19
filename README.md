Before running the script;

Make sure you give executable permissions for the file.
chmod +x ask

Set the following environment variables:
export ASK_API_URL="https://api.groq.com/openai/v1/chat/completions"
export ASK_MODEL="llama-3.3-70b-versatile"
export ASK_API_KEY="your_api_key_here"

How to use the script?
Some examples: 

Usage 1: ./ask "explain how API works" 
API (Application Programming Interface) is a set of rules and protocols that allows different software systems to communicate with each other.
Here's how it works:
1. **Client Request**: A client (e.g. web application, mobile app) sends a request to the API with specific parameters.
2. **API Receiver**: The API receives the request and processes it.
3. **Data Retrieval**: The API retrieves the required data from a database or performs a specific action.
4. **Data Formatting**: The API formats the retrieved data into a specific format (e.g. JSON, XML).
5. **Response**: The API sends the formatted data back to the client as a response.
6. **Client Processing**: The client receives the response and processes it to display the data to the user.

Usage 2: echo "ls -l" | ./ask "explain"
ls -l is a Unix command that lists files and directories in a detailed format. 

-l stands for long format, which displays:
- file type and permissions
- number of links
- owner name
- group name
- file size
- timestamp
- file name

Usage 3:
alias ask-fix="./ask 'Correct any grammatical, spelling, or punctuation errors in the input text. Input text:'"
Command: ask-fix clouk
Return: cloud




