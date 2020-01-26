package steps;

import cucumber.api.java.en.Then;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

public class GeneralSteps {

    @Then("^user should see (.*) with value \"([^\"]*)\"$")
    public void userShouldSeeLoginWithValue(String field, String value) throws Throwable {
        Assert.assertEquals(value, RESTSupport.key(field));
    }

    @Then("^user should see \"([^\"]*)\" message$")
    public void userShouldSeeMessage(String type) throws Throwable {
        LazyMap messageJson = new LazyMap();
        messageJson.put("save with success", 201);
        messageJson.put("success", 200);
        messageJson.put("no content", 204);
        messageJson.put("not found", 404);
        messageJson.put("unauthorized", 401);

        Assert.assertEquals(messageJson.get(type),RESTSupport.getResponseCode());
    }
}
