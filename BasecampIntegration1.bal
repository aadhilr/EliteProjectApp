import ballerina.net.http;
import ballerina.lang.messages;

 @http:configuration {basePath:"/basecamp"}
service<http> BasecampService {

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/projects"}
    resource projects (message m) {
        // string method = http:getMethod(m);
        http:ClientConnector basecampAPI = create http:ClientConnector ("https://github.com/basecamp/bcx-api/tree/master/sections");

        message m1 = {};
        message firstGet = http:ClientConnector.get(basecampAPI, "/projects.md/projects.json",m1);
        json jsonMsg = messages:getJsonPayload(firstGet);
        message response = {};
        messages:setJsonPayload(response, jsonMsg);
        reply response;
}
}