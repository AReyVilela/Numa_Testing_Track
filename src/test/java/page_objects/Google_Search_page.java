package page_objects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.assertEquals;

public class Google_Search_page extends Base_page {

    By first_result = By.xpath("//h3[text()='Stratio ::Transform and build your digital strategy around Big ...']");
    By getFirst_result_url = By.xpath("//div[@id='rso']//div[@class='yuRUbf']//descendant::a");

    public Google_Search_page(WebDriver driver) {
        super(driver);
    }

    public void click_first_result_and_check(String url) {
        //comprobar y despues click
        WebElement getFirst_result_url_aux = driver.findElement(getFirst_result_url);
        assertEquals(url, getFirst_result_url_aux.getAttribute("href"));
        this.driver.findElement(first_result).click();
    }
}
