package onSale;

import java.sql.Timestamp;

public class OnSale {
    private int onSaleId;
    private String onSaleName;
    private Timestamp onSaleReleaseDate;
    private String onSaleImageURL;
    private float onSaleSale;
    private double[] onSalePrice = new double[4];

    public void setOnSaleId(int id) {this.onSaleId =id;}
    public int getOnSaleId(){ return onSaleId; }
    public void setOnSaleName(String name) {this.onSaleName =name;}
    public String getOnSaleName() {return onSaleName;}
    public void setOnSaleReleaseDate(Timestamp releaseDate) {this.onSaleReleaseDate =releaseDate;}
    public Timestamp getOnSaleReleaseDate() {return onSaleReleaseDate;}
    public void setOnSaleImageURL(String onSaleImageURL) {this.onSaleImageURL = onSaleImageURL;}
    public String getOnSaleImageURL() {return onSaleImageURL;}
    public void setOnSaleSale(float sale) {this.onSaleSale=sale;}
    public float getOnSaleSale() {return onSaleSale;}
    public void setOnSalePrice(int index, double price) {onSalePrice[index]=price;}
    public double getOnSalePrice(int index) {return onSalePrice[index];}
}
