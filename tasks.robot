*** Settings ***
Documentation       Downloads JSON data from a remote API and writes it
...                 into a local Excel file.

Library             RPA.Excel.Files
Library             RPA.HTTP


*** Tasks ***
Create an Excel file with data from a remote API
    Create Workbook    comments.xlsx
    Set Worksheet Value    1    1    Post ID
    Set Worksheet Value    1    2    ID
    Set Worksheet Value    1    3    Name
    Set Worksheet Value    1    4    Email address
    Set Worksheet Value    1    5    Body
    ${response}=    Http Get    https://jsonplaceholder.typicode.com/comments
    Append Rows To Worksheet    ${response.json()}
    Save Workbook
