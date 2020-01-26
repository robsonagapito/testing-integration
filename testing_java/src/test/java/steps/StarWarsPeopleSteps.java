package steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import definition.StarWarPeople;
import support.RESTSupport;

public class StarWarsPeopleSteps {

    @Given("^user would like to see people number (.*)$")
    public void userWouldLikeToSeeAllPlaceholder(int codePeople) throws Throwable {
        StarWarPeople.setPeople(codePeople);
    }

    @When("^user clicks on find people button into Star Wars series$")
    public void userClicksOnFindButton() throws Throwable {
        RESTSupport.executeGet(StarWarPeople.getEndPoint()
                                            + StarWarPeople.getPeople() );
    }
}
