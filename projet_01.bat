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