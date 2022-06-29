package page_objects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.assertEquals;

public class Stratio_page extends Base_page {


    By button_cookies_stratio = By.xpath("//div[@id='cookies']//div[@class='controls']/button[1]");
    By dropDown_Solutions = By.xpath("//div[@class='menu-option option-solutions npa-font--14 ng-tns-c11-0 ng-star-inserted']");
    By getDropDown_Governance= By.xpath("//div[@class='npa-dropdown npa-font--14 ng-star-inserted display show columns']/div[2]//div[4]");
    public Stratio_page(WebDriver driver){
        super(driver);
    }

    public void accept_cookies_stratio_and_check(String title) {
        this.driver.findElement(button_cookies_stratio).click();
        assertEquals(title, driver.getTitle());
    }

    public void click_Solutions(){
        this.driver.findElement(dropDown_Solutions).click();
    }
    public void click_Governance(){
        this.driver.findElement(getDropDown_Governance).click();
    }


}
