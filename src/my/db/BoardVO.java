package my.db;
import java.util.*;

public class BoardVO {
	private int main_num;			//번호
	private String main_writeday;		//작성일
	private String main_option;		//항목 (지출, 수입)
	private String main_account;	//계정과목
	private String main_content;	//내용
	private String main_price;			//금액
	private String main_id;
	private String sum_spend;
	private String sum_import;
	private String tot_spend; //총 지출
	private String tot_import; // 총 수입
	
	public String getM_id() {
		return main_id;
	}
	public void setM_id(String m_id) {
		this.main_id = m_id;
	}
	public int getMain_num() {
		return main_num;
	}
	public void setMain_num(int main_num) {
		this.main_num = main_num;
	}
	public String getMain_writeday() {
		return main_writeday;
	}
	public void setMain_writeday(String main_writeday) {
		this.main_writeday = main_writeday;
	}
	public String getMain_option() {
		return main_option;
	}
	public void setMain_option(String main_option) {
		this.main_option = main_option;
	}
	public String getMain_account() {
		return main_account;
	}
	public void setMain_account(String main_account) {
		this.main_account = main_account;
	}
	public String getMain_content() {
		return main_content;
	}
	public void setMain_content(String main_content) {
		this.main_content = main_content;
	}
	public String getMain_price() {
		return main_price;
	}
	public void setMain_price(String main_price) {
		this.main_price = main_price;
	}
	public String getMain_id() {
		return main_id;
	}
	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}
	public String getTot_spend() {
		return tot_spend;
	}
	public void setTot_spend(String tot_spend) {
		this.tot_spend = tot_spend;
	}
	public String getTot_import() {
		return tot_import;
	}
	public void setTot_import(String tot_import) {
		this.tot_import = tot_import;
	}
	public String getSum_spend() {
		return sum_spend;
	}
	public void setSum_spend(String sum_spend) {
		this.sum_spend = sum_spend;
	}
	public String getSum_import() {
		return sum_import;
	}
	public void setSum_import(String sum_import) {
		this.sum_import = sum_import;
	}
	
	
	
}
