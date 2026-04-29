#!/bin/bash
PORT=8000
FILE_TO_SERVE="${1:-./jarvis.ascii.txt}"
CONTENT_LENGTH=$(stat --format=%s $FILE_TO_SERVE)
HEADERS="HTTP/1.1 200 OK\r\nContent-Type:text/html;charset=UTF-8\r\nContent-Length:$CONTENT_LENGTH\r\n"
while true
do
    { echo -e $HEADERS; cat $FILE_TO_SERVE; } | netcat -l -p $PORT
done

