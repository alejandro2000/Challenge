package pets.store.store;

import com.intuit.karate.junit5.Karate;

class StoreRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("store").relativeTo(getClass());
    }    

}
