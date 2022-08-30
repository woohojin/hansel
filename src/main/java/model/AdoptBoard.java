package model;

public class AdoptBoard {
	
	int adoptId;
	int postDisable;
	int postReportCnt;
	String postReportText;
	String userId;
	String tel;
	String content;
	String regDate;
	String petName;
	int petGender;
	String petType;
	String petImg;
	String petDetail;
	int vaccin;
	int neuter;
	int readCnt;
	
	public int getAdoptId() {
		return adoptId;
	}
	public void setAdoptId(int adoptId) {
		this.adoptId = adoptId;
	}
	public int getPostDisable() {
		return postDisable;
	}
	public void setPostDisable(int postDisable) {
		this.postDisable = postDisable;
	}
	public int getPostReportCnt() {
		return postReportCnt;
	}
	public void setPostReportCnt(int postReportCnt) {
		this.postReportCnt = postReportCnt;
	}
	public String getPostReportText() {
		return postReportText;
	}
	public void setPostReportText(String postReportText) {
		this.postReportText = postReportText;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public int getPetGender() {
		return petGender;
	}
	public void setPetGender(int petGender) {
		this.petGender = petGender;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public String getPetDetail() {
		return petDetail;
	}
	public void setPetDetail(String petDetail) {
		this.petDetail = petDetail;
	}
	public int getVaccin() {
		return vaccin;
	}
	public void setVaccin(int vaccin) {
		this.vaccin = vaccin;
	}
	public int getNeuter() {
		return neuter;
	}
	public void setNeuter(int neuter) {
		this.neuter = neuter;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	@Override
	public String toString() {
		return "AdoptBoard [adoptId=" + adoptId + ", postDisable=" + postDisable + ", postReportCnt=" + postReportCnt
				+ ", postReportText=" + postReportText + ", userId=" + userId + ", tel=" + tel + ", content=" + content
				+ ", regDate=" + regDate + ", petName=" + petName + ", petGender=" + petGender + ", petType=" + petType
				+ ", petImg=" + petImg + ", petDetail=" + petDetail + ", vaccin=" + vaccin + ", neuter=" + neuter
				+ ", readCnt=" + readCnt + "]";
	}
	
}
