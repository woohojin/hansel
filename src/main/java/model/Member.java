package model;

public class Member {
	String userId;
	String pwd;
	String tel;
	String email;
	String address;
	String petName;
	int login;
	int userType;
	int userReportCnt;
	int userReportText;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public int getLogin() {
		return login;
	}
	public void setLogin(int login) {
		this.login = login;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserReportCnt() {
		return userReportCnt;
	}
	public void setUserReportCnt(int userReportCnt) {
		this.userReportCnt = userReportCnt;
	}
	public int getUserReportText() {
		return userReportText;
	}
	public void setUserReportText(int userReportText) {
		this.userReportText = userReportText;
	}
	
	
}
