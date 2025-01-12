package pet.store.apis.users;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.core.steps.UIInteractions;
import pet.store.apis.users.pojos.UserPojo;
import io.restassured.http.ContentType;
import static net.serenitybdd.rest.SerenityRest.given;
import static net.serenitybdd.rest.SerenityRest.when;
import static net.serenitybdd.rest.SerenityRest.then;
import org.hamcrest.Matchers;

public class ApiStoreActions extends UIInteractions {

    @Given("The user is created in the system")
    public void givenKittyIsAvailableInPetStore() {
        UserPojo user = new UserPojo( "alex","alejo","tab"
        ,"alejo@gmail.com", "1234","12313");
        String body = "{\n" +
                "  \"id\": 10,\n" +
                "  \"username\": \"theUser\",\n" +
                "  \"firstName\": \"John\",\n" +
                "  \"lastName\": \"James\",\n" +
                "  \"email\": \"john@email.com\",\n" +
                "  \"password\": \"12345\",\n" +
                "  \"phone\": \"12345\",\n" +
                "  \"userStatus\": 1\n" +
                "}";
        String response = given()
            .baseUri("http://localhost:8080/")
            .basePath("api/v3/user")
            .body(body)
            .accept(ContentType.JSON)
            .contentType(ContentType.JSON).post().getBody().prettyPrint();
    }

    @When("I ask for a existing user")
    public void whenIAskForAPetWithId() {
        //This info can be dynamic
        when().get("/theUser");
    }

    @Then("I get Kitty as result")
    public void thenISeeKittyAsResult() {
        then().body("username", Matchers.equalTo("theUser"));
    }
}
