# author: Bartlomiej "furas" Burek (https://blog.furas.pl)
# date: 2022.03.11
# [html - How to include a user_agent in my scraping loop - Stack Overflow](https://stackoverflow.com/questions/71423084/how-to-include-a-user-agent-in-my-scraping-loop/71428612#71428612)

> library(httr))  

> GET( paste0('https://httpbin.org/', 'get') )

Response [https://httpbin.org/get]
  Date: 2022-03-10 17:54
  Status: 200
  Content-Type: application/json
  Size: 373 B
{
  "args": {}, 
  "headers": {
    "Accept": "application/json, text/xml, application/xml, */*", 
    "Accept-Encoding": "deflate, gzip, br", 
    "Host": "httpbin.org", 
    "User-Agent": "libcurl/7.68.0 r-curl/4.3.2 httr/1.4.2", 
    "X-Amzn-Trace-Id": "Root=1-622a3b72-00b48f9c2c15da155db2e723"
  }, 
  "origin": "79.163.206.131", 
...

> GET( paste0('https://httpbin.org/', 'get'), user_agent('Mozilla/5.0') )

Response [https://httpbin.org/get]
  Date: 2022-03-10 17:52
  Status: 200
  Content-Type: application/json
  Size: 346 B
{
  "args": {}, 
  "headers": {
    "Accept": "application/json, text/xml, application/xml, */*", 
    "Accept-Encoding": "deflate, gzip, br", 
    "Host": "httpbin.org", 
    "User-Agent": "Mozilla/5.0", 
    "X-Amzn-Trace-Id": "Root=1-622a3ac6-41ace39e5aa032da3e312de9"
  }, 
  "origin": "79.163.206.131", 
...
