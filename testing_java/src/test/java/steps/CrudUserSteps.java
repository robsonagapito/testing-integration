package steps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import definition.User;

import support.RESTSupport;

/**
 * Created by robson on 30/08/2017.
 */
public class CrudUserSteps {

    @Given("^user would like to save a user$")
    public void userWouldLikeToSaveAUser() throws Throwable {
        User.clearFields();
    }

    @And("^user informs (.*) with value equal \"([^\"]*)\"$")
    public void userInformsNameWithValueEqual(String field, String value) {
        User.addFields(field, value);
    }

    @When("^user clicks on save button$")
    public void userClicksOnSaveButton() throws Throwable {
        RESTSupport.executePost(User.getEndPoint(),User.getFields());
        User.setLastUser(RESTSupport.key("id").toString());
        User.clearFields();
    }

    @And("^user wants to see user information$")
    public void userWantsToSeeUserInformation() throws Throwable {
        RESTSupport.executeGet(User.getEndPoint() + User.getLastUser() + ".json");
    }

    @And("^user clicks on save button again$")
    public void userClicksOnSaveButtonAgain() throws Throwable {
        RESTSupport.executePut(User.getEndPoint() + User.getLastUser() + ".json",User.getFields());
    }

    @And("^user clicks on delete button$")
    public void userClicksOnDeleteButton() throws Throwable {
        RESTSupport.executeDelete(User.getEndPoint() + User.getLastUser() + ".json");
    }

    @And("^user clicks on save button with only one change$")
    public void userClicksOnSaveButtonWithOnlyOneChang() throws Throwable {
        RESTSupport.executePatch(User.getEndPoint() + User.getLastUser() + ".json",User.getFields());
    }
}
