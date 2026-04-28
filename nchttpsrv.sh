#!/bin/bash
PORT=8000
FILE_TO_SERVE="${1:-./jarvis.banner.txt}"
CONTENT_LENGTH=$(ls -l $FILE_TO_SERVE | awk '{print $5}')
HEADERS="HTTP/1.1 200 OK\r\nContent-Type:text/html;charset=UTF-8\r\nContent-Length:$CONTENT_LENGTH\r\n"
while true
do
    { echo -e $HEADERS; cat $FILE_TO_SERVE; } | netcat -l -p $PORT
done

