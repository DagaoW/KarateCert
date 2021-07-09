package examples.fakeshop;

import com.intuit.karate.junit5.Karate;

class FakeshopRunner {
    
    @Karate.Test
    Karate products() {
        return Karate.run("products").relativeTo(getClass());
    }    

    @Karate.Test
    Karate logIn() {
        return Karate.run("logIn").relativeTo(getClass());
    }    

    @Karate.Test
    Karate getCart() {
        return Karate.run("getCart").relativeTo(getClass());
    }    


}
