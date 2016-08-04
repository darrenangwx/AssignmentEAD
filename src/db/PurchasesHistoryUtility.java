package db;
import java.sql.*;
import java.util.ArrayList;

public class PurchasesHistoryUtility {
	public ArrayList<PurchasesHistoryModel> displayPurchases(String userID){
		ArrayList<PurchasesHistoryModel> displayPDetails = new ArrayList<PurchasesHistoryModel>();
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT title, tg.quantity, price, timestamp FROM games g, transaction t, transaction_game tg where g.gameID = tg.gameID and t.transactionID = tg.transactionID and userID =?");
			pstmt.setString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				PurchasesHistoryModel PurchasesHistoryModel = new PurchasesHistoryModel();
				PurchasesHistoryModel.setTitle(rs.getString("title"));
				PurchasesHistoryModel.setQuantity(rs.getInt("quantity"));
				PurchasesHistoryModel.setPrice(rs.getDouble("price"));
				PurchasesHistoryModel.setDate(rs.getString("timestamp"));
				displayPDetails.add(PurchasesHistoryModel);
				System.out.println(rs.getString("title"));
				System.out.println(displayPDetails);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return displayPDetails;
		
	}
}
