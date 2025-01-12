package pet.store.apis.users;

import net.serenitybdd.junit5.SerenityJUnit5Extension;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;

@ExtendWith(SerenityJUnit5Extension.class)
public class WhenUsingPetStoreApi {

    ApiStoreActions userActions;

    @Test
    public void interactWithApi(){
        userActions.givenKittyIsAvailableInPetStore();
        userActions.whenIAskForAPetWithId();
        userActions.thenISeeKittyAsResult();
    }
}
