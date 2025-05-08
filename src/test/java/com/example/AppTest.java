package com.example;

import org.junit.Test;

public class AppTest {

    @Test
    public void testMainRunsWithoutException() {
        try {
            App.main(new String[]{"8085"});
        } catch (Exception e) {
            e.printStackTrace();
            throw new AssertionError("Main method should not throw exception");
        }
    }
}
