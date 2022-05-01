package newlyReleased;

import java.sql.Timestamp;

public class NewlyReleased {
    private int newlyReleasedId;
    private String newlyReleasedName;
    private Timestamp newlyReleasedReleaseDate;
    private String newlyReleasedImageURL;
    private double[] newlyReleasedPrice = new double[4];

    public void setNewlyReleasedId(int id) {this.newlyReleasedId =id;}
    public int getNewlyReleasedId(){ return newlyReleasedId; }
    public void setNewlyReleasedName(String name) {this.newlyReleasedName =name;}
    public String getNewlyReleasedName() {return newlyReleasedName;}
    public void setNewlyReleasedReleaseDate(Timestamp releaseDate) {this.newlyReleasedReleaseDate =releaseDate;}
    public Timestamp getNewlyReleasedReleaseDate() {return newlyReleasedReleaseDate;}
    public void setNewlyReleasedImageURL(String newlyReleasedImageURL) {this.newlyReleasedImageURL = newlyReleasedImageURL;}
    public String getNewlyReleasedImageURL() {return newlyReleasedImageURL;}
    public void setNewlyReleasedPrice(int index, double price) {newlyReleasedPrice[index]=price;}
    public double getNewlyReleasedPrice(int index) {return newlyReleasedPrice[index];}
}
