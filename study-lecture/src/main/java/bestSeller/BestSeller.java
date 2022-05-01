package bestSeller;

import java.awt.*;
import java.sql.Timestamp;

public class BestSeller {
    private int bestSellerId;
    private String bestSellerName;
    private Timestamp bestSellerReleaseDate;
    private String bestSellerImageURL;
    private double[] bestSellerPrice = new double[4];

    public void setBestSellerId(int id) {this.bestSellerId=id;}
    public int getBestSellerId(){ return bestSellerId; }
    public void setBestSellerName(String name) {this.bestSellerName=name;}
    public String getBestSellerName() {return bestSellerName;}
    public void setBestSellerReleaseDate(Timestamp releaseDate) {this.bestSellerReleaseDate=releaseDate;}
    public Timestamp getBestSellerReleaseDate() {return bestSellerReleaseDate;}
    public void setBestSellerImageURL(String bestSellerImageURL) {this.bestSellerImageURL=bestSellerImageURL;}
    public String getBestSellerImageURL() {return bestSellerImageURL;}
    public void setBestSellerPrice(int index, double price) {bestSellerPrice[index]=price;}
    public double getBestSellerPrice(int index) {return bestSellerPrice[index];}
}
