# Getting Started with Spring Cloud Function

##  Setting Up the Spring Boot and Spring Cloud Function Locally
## Test the Function
You can use curl or Postman to test your function. Here I use Postman. You can download Postman at https://www.postman.com/downloads/.

* In Postman, choose POST, the http://localhost:8080/employeeConsumer URL, and the JSON format input.
```json
{
   "name": "banu",
   "employeeIdentifier":"1",
   "email": "banu@yahoo.com",
   "salary":"1000"
}
```
* Using curl.
```bash
curl --location 'http://localhost:8080/employeeConsumer' \
--header 'Content-Type: application/json' \
--data-raw '{
   "name": "banu",
   "employeeIdentifier":"1",
   "email": "banu@yahoo.com",
   "salary":"1000"
}'
```
* Using H2 console: `http://localhost:8080/h2-console/`
  * jdbc url: `jdbc:h2:mem:employee`