package steps;

import io.cucumber.java8.En;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import page_objects.Google_Search_page;
import page_objects.Google_page;
import page_objects.Governance_page;
import page_objects.Stratio_page;

import java.util.concurrent.TimeUnit;

public class MyStepdefs implements En {

    WebDriver driver;

    public MyStepdefs() {

        //INICIALIZO EL DRIVER DE FIREFOX Y WWW.GOOGLE.COM
        Before(() -> {
            System.setProperty("webdriver.gecko.driver", "drivers/geckodriver");
            driver = new FirefoxDriver();
            try {
                Thread.sleep(3000);
            } catch (Exception e) {
            }
            driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
            driver.get("https://www.google.com");

        });

        //COMIENZO A DARLE IMPLEMENTACION A LOS PASOS DE GHERKIN

        Given("Google abierto y acepto cookies", () -> {
            //ABRO GOOGLE Y ACEPTO LAS COOKIES
            Google_page googlePage = new Google_page(driver);
            googlePage.accept_cookies();
        });

        And("Escribo Stratio en el buscador y pulso enter", () -> {
            //BUSCO STRATIO EN EL BUSCADOR
            Google_page google_page = new Google_page(driver);
            google_page.search_something("Stratio");
        });

        And("Click en el primer enlace", () -> {
            //PRIMER ENLACE Y COMPROBAMOS QUE SEA LA URL ESPERADA
            Google_Search_page search_page = new Google_Search_page(driver);
            search_page.click_first_result_and_check("https://www.stratio.com/");

        });
        And("Acepto cookies de pagina de Stratio", () -> {
            //DENTRO DE LA PAG DE STRATIO ACEPTO LAS COOKIES
            //COMPRUEBO QUE ES EL TITULO ESPERADO DE LA PAGINA
            Stratio_page stratio_page = new Stratio_page(driver);
            stratio_page.accept_cookies_stratio_and_check("Stratio ::Transform and build your digital strategy around Big Data and AI");
        });

        When("Hago click en el drop down Solutions y Governance", () -> {
            //CLICK EN SOLUCIONES DROP DOWN
            Stratio_page stratio_page = new Stratio_page(driver);
            stratio_page.click_Solutions();
            stratio_page.click_Governance();
        });
        Then("Imprimo Titulo de primer caso de uso", () -> {
            //ESPERAR A QUE CARGUE Y COMPROBAR LA PAGINA
            //IMPRIMIR EL TITULO DEL PRIMER USE CASE
            Governance_page governance_page = new Governance_page(driver);
            Thread.sleep(4000);
            governance_page.check_governance("Data reliability is the base of successful companies");
            governance_page.getTitleCasoUso();
        });

        //CIERRO EL DRIVER PARA QUE NO SE QUEDE ABIERTO
        After(() -> {
            driver.quit();
        });
    }
}
