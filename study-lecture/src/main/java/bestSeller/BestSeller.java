package bestSeller;

import java.sql.Timestamp;

public class BestSeller {
    private int bestSellerId;
    private String bestSellerName;
    //private Timestamp bestSellerReleasedDate;
    private double bestSellerDollar;

    public void setBestSellerId(int id) {this.bestSellerId=id;}
    public int getBestSellerId(){ return bestSellerId; }
    public void setBestSellerName(String name) {this.bestSellerName=name;}
    public String getBestSellerName() {return bestSellerName;}
    //public void setBestSellerReleasedDate(Timestamp releasedDate) {this.bestSellerReleasedDate=releasedDate;}
    //public Timestamp getBestSellerReleasedDate() {return bestSellerReleasedDate;}
    public void setBestSellerDollar(double dollar) {bestSellerDollar=dollar;}
    public double getBestSellerDollar() {return bestSellerDollar;}
}
