# API

- [Introduction](/docs/)
- [REST API](/docs/api)

## Authentication

If you are the owner of a document you will be shown an API Key. This is an alphanumeric string to authenticate ownership of the document and execute actions via an HTTP interface.

The API key must be passed as a `Authorization` request header like so:

~~~
Authorization: Bearer <api key>
~~~

## `POST /api/v1/:id/run`

- **id** - the document ID

Run a qworp action on the document and respond with the results. The body should be a JSON object with a string named `cmd` containing the action. The `Content-Type` header should be `application/json` and it must be authenticated as specified above.

### Example

This curl command will request all blocks from a document.

~~~
curl https://qworp.com/api/v1/4zvEBQ/run \
	-H "Authorization: Bearer 4d592869eaa5f8adf4e02ff3e0b4a2f18d48e698cbf1" \
	-H "Content-Type: application/json" \
	-d '{"cmd": "all"}'
~~~