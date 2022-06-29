package page_objects;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class Google_page extends Base_page {

    By search_bar = By.name("q");
   // By accept_cookies = By.xpath("//div[text()='Acepto']/ancestor::button");

    public Google_page(WebDriver driver) {
        super(driver);
    }

    public void search_something(String text_to_search) {
        //buscaar en google
        WebElement search_bar_Element = this.driver.findElement(search_bar);
        search_bar_Element.sendKeys(text_to_search);
        search_bar_Element.sendKeys(Keys.ENTER);
    }

    public void accept_cookies() {
       // this.driver.findElement(accept_cookies).click();
        this.driver.findElement(By.id("L2AGLb")).click();
    }



}
