package seleniumgluecode;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import org.openqa.selenium.chrome.ChromeDriver;

public class Hooks {

    private static ChromeDriver driver;

    @Before

    public void setup(){

        System.setProperty("webdriver.chrome.driver","./src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();
        driver.get("https://Google.com");
        driver.manage().window().maximize();

    }

    @After

    public void teardown(){
        driver.quit();
    }


    public static ChromeDriver getDriver(){
        return driver;
    }

}
