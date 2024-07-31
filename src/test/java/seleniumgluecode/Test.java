package seleniumgluecode;


import io.cucumber.java.bs.A;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Test {
    private  ChromeDriver driver =Hooks.getDriver();

    @Given("el usuario esta en la pagina principal de Google")
    public void el_usuario_esta_en_la_pagina_principal_de_google() {
        String Titulo="Google";
        Assert.assertEquals(Titulo,driver.getTitle());

    }


    @When("el usuario ingresa {string} en la barra de busqueda")
    public void el_usuario_ingresa_en_la_barra_de_busqueda(String string) {
        WebElement searchTextBox = driver.findElement(By.xpath("//*[@id=\"APjFqb\"]"));
        searchTextBox.click();
        searchTextBox.sendKeys("Youtube");

    }
    @When("presiona el boton de busqueda")
    public void presiona_el_boton_de_busqueda() {
        WebElement searchBtn = driver.findElement(By.name("btnK"));
        searchBtn.click();

    }
    @Then("se deben mostrar resultados relacionados con {string}")
    public void se_deben_mostrar_resultados_relacionados_con(String string) {
        WebElement FirstResult = driver.findElement(By.xpath("//*[@id=\"rso\"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3"));
        Assert.assertTrue("no se muestran resultados relacionados",FirstResult.isDisplayed());
        Assert.assertEquals("YouTube: Inicio",FirstResult.getText());

    }
}
