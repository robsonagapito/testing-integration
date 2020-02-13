package steps;

import cucumber.api.java.en.Then;
import cucumber.api.java.pt.Então;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

import java.util.List;

public class GeneralSteps {

    @Then("^user should see (.*) with value \"([^\"]*)\"$")
    public void userShouldSeeLoginWithValue(String field, String value) throws Throwable {
        Assert.assertEquals(value, RESTSupport.key(field));
    }

    @Então("^o usuário deveria receber uma mensagem de \"([^\"]*)\"$")
    @Then("^user should see \"([^\"]*)\" message$")
    public void userShouldSeeMessage(String type) throws Throwable {
        LazyMap messageJson = new LazyMap();
        messageJson.put("save with success", 201);
        messageJson.put("success", 200);
        messageJson.put("no content", 204);
        messageJson.put("not found", 404);
        messageJson.put("unauthorized", 401);
        messageJson.put("salvo com sucesso", 201);
        messageJson.put("sucesso", 200);
        messageJson.put("sem informação", 204);
        messageJson.put("não encontrado", 404);
        messageJson.put("não autorizado", 401);

        Assert.assertEquals(messageJson.get(type),RESTSupport.getResponseCode());
    }

    @Then("^user should see fields below:$")
    public void userShouldSeeFieldsBelow(List<List<String>> table) {
            System.out.println(table);
            String field = "";
            String value = "";
            for (List<String> row: table){
                field = row.get(0);
                value = row.get(1);
                Assert.assertEquals(value, RESTSupport.key(field));
                System.out.println("Test case => " + row.get(0) + " >>> Field OK!");
            }

    }
}
