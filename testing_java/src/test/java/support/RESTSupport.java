package support;

import static com.jayway.restassured.RestAssured.given;

import java.util.Map;

import com.jayway.restassured.http.ContentType;
import com.jayway.restassured.response.Header;
import com.jayway.restassured.response.Response;
import com.jayway.restassured.specification.RequestSpecification;

import groovy.json.internal.LazyMap;

public class RESTSupport {

    private static Response response;

    public static Response getResponse() {
        return response;
    }

    private static void setResponse(Response response) {
        RESTSupport.response = response;
    }

    private static RequestSpecification buildBaseRequestSpecification() {

        RequestSpecification rs = given()
        .when()
        .contentType(ContentType.JSON)
        .accept(ContentType.JSON);
        return rs;
    }

    private static void addHeader(Header h, RequestSpecification rs) {
        if (h != null) {
            rs.header(h);
        }
    }

    private static void addCookies(Map<String, String> c, RequestSpecification rs) {
        if (c != null) {
            rs.cookies(c);
        }
    }

    public static void executeGet(String endpoint, Integer statusCode) {
        response = buildBaseRequestSpecification()
                .accept("*/*")
                .get(endpoint)
                .then()
                .statusCode(statusCode)
                .extract().response();
        printLog(response.getBody().asString(),endpoint,"");
        setResponse(response);
    }

    public static Response executeGet(String endpoint) {
        response = buildBaseRequestSpecification()
                .accept("*/*")
                .get(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint,"");
        return response;
    }

    public static Response executePost(String endpoint, Integer statusCode, LazyMap json) {
        System.out.println("JSON -> " + json.toString());

        response = buildBaseRequestSpecification()
                .body(json)
                .post(endpoint)
                .then()
                .statusCode(statusCode)
                .extract().response();
        printLog(response.getBody().asString(),endpoint, json.toString());
        return response;
    }

    public static Response executePost(String endpoint, LazyMap json) {
        System.out.println("JSON -> " + json.toString());

        response = buildBaseRequestSpecification()
                .body(json)
                .post(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint, json.toString());
        return response;
    }

    public static Response executePut(String endpoint, LazyMap json) {
        System.out.println("JSON -> " + json.toString());

        response = buildBaseRequestSpecification()
                .body(json)
                .put(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint, json.toString());
        return response;
    }

    public static Response executeDelete(String endpoint) {

        response = buildBaseRequestSpecification()
                .delete(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint, "");
        return response;
    }

    public static Response executeOptions(String endpoint) {
        response = buildBaseRequestSpecification()
                .options(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint,"");
        return response;
    }

    public static Response executePatch(String endpoint, LazyMap json) {
        System.out.println("JSON -> " + json.toString());

        response = buildBaseRequestSpecification()
                .body(json)
                .patch(endpoint)
                .then()
                .extract().response();
        printLog(response.getBody().asString(),endpoint, json.toString());
        return response;
    }

    private static void printLog(String response, String url, String json){
        System.out.println("");
        System.out.println("====================================");
        System.out.println("");
        System.out.println("Endpoint => "+ url);
        System.out.println("");
        System.out.println("Body - Request => " + json);
        System.out.println("");
        System.out.println("Response => "+ response);
    }

    public static Integer getResponseCode() {
        return response.getStatusCode();
    }

    public static Object key(String field) {
        return response.getBody().jsonPath().get(field);
    }
}
