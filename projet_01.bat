:: This script calls the Azure Langage detection API to detect the language of a text.
:: How to use:
:: 1) set the API key to the API_KEY environment variable, e.g. : set API_KEY=123456789abcde
:: 2) put the text to be analyzed in a .txt file. Only the first line (limited by \n) will be treted. E.g.: 
:: echo Never gonna give you up, never gonna let you down>test.txt 
:: Call the script with he text file name as argument, e.g. : projet_01.bat test.txt


@ECHO OFF

IF "%1"=="" (
	ECHO Please pass the name of the text file as argument to the script, e.g. : projet_01.bat test.txt
	EXIT /B 0
	)

IF "%API_KEY%"=="" (
	ECHO Please set the environment variable API_KEY with the expected value, e.g. : set API_KEY=123456789abcde
	EXIT /B 0
	)

SET FILE_NAME=%1
SET /p TEXT=<%FILE_NAME%

curl -X POST "https://api.cognitive.microsofttranslator.com/detect?api-version=3.0" ^
    -H "Ocp-Apim-Subscription-Key: %API_KEY%" ^
    -H "Content-Type: application/json"       ^
    -d "[{'Text':'%TEXT%'}]"