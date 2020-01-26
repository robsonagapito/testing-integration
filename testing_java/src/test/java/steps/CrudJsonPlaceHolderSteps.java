/**
 * Created by robson on 22/01/2018.
 */
package steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import support.RESTSupport;

public class CrudJsonPlaceHolderSteps {

    @When("^user clicks on find button$")
    public void userClicksOnFindButton() throws Throwable {
        RESTSupport.executeGet("https://jsonplaceholder.typicode.com/posts");
    }

    @Given("^user would like to see all json placeholder$")
    public void userWouldLikeToSeeAllPlaceholder() throws Throwable {

    }
}
