package page_objects;

import org.openqa.selenium.WebDriver;

public class Base_page {

    protected WebDriver driver;

    public Base_page(WebDriver driver) {
        this.driver = driver;
    }

    public String getTitle() {
        return this.driver.getTitle();
    }
}
