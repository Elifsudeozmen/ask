* The code is vulnerable to SQL injection attacks due to the use of string formatting in SQL queries.
* Database connections are not handled properly, with connections being opened and closed repeatedly, which can lead to performance issues and potential errors.
* The `get_user` function does not handle the case where the user is not found, and will return `None` in this case, which can lead to errors downstream.
* The `save_user` function does not validate the input data, which can lead to potential errors and security issues.
* The code does not follow the DRY (Don't Repeat Yourself) principle, with database connection code being duplicated in multiple places.
* The `load_config` function is not used anywhere in the code, which makes it unnecessary and can be removed.
* Error handling is missing throughout the code, which can make it difficult to diagnose and fix issues that may arise.
