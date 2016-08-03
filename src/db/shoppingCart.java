package db;

public class shoppingCart {

	private int gameID;
	private String title;
	private String company;
	private String imageLocation;
	private String preOwned;
	private double price;
	private int quantity;

	
	public void setshoppingCart(int gameID, String title, String company,double price,
			String imageLocation, String preOwned, int quantity) {
		this.gameID = gameID;
		this.title = title;
		this.company = company;
		this.imageLocation = imageLocation;
		this.preOwned = preOwned;
		this.price = price;
		this.quantity = quantity;
	}
	
	public int getGameID() {
		return gameID;
	}
	
	public String getTitle() {
		return title;
	}

	public String getCompany() {
		return company;
	}

	public String getImageLocation() {
		return imageLocation;
	}

	public String getPreOwned() {
		return preOwned;
	}
	
	public double getPrice(){
		return price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	
}