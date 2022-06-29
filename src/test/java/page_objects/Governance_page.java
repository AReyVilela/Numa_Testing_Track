package page_objects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class Governance_page extends Base_page {

    //section[3]/div/a

    //main//h1

    // By primer_caso_uso = By.xpath("//section[3]/div/a");
    By titulo_url = By.xpath("//main//h1");
    By titulo_caso_uso = By.xpath("//section[3]/div/descendant::h2");


    public Governance_page(WebDriver driver) {
        super(driver);
    }

    public void check_governance(String title) {

       WebElement check_title_governance = this.driver.findElement(titulo_url);
       String aux = check_title_governance.getText();
        assertEquals(title, aux);
    }


    public void getTitleCasoUso() {

        WebElement titulo_case = this.driver.findElement(titulo_caso_uso);
        String titulo = titulo_case.getText();
        System.out.println("El titulo del 'Use Case' es : " + titulo);
    }

}
