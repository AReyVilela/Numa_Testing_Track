package page_objects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class Governance_page extends Base_page {

    By titulo_url = By.xpath("//main//h1");
    By titulo_caso_uso = By.xpath("//section[3]/div/descendant::h2");

    public Governance_page(WebDriver driver) {
        super(driver);
    }

    public void check_governance(String title) {

       String check_title_governance = this.driver.findElement(titulo_url).getText();
        assertEquals(title, check_title_governance);
    }


    public void getTitleCasoUso() {

        String titulo_case = this.driver.findElement(titulo_caso_uso).getText();
        System.out.println("El titulo del 'Use Case' es : " + titulo_case);
    }

}
