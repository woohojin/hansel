package model;

public class ReviewBoard {
	
	int reviewId;
	int postDisable;
	int postReportCnt;
	String postReportText;
	String userId;
	String subject;
	String content;
	String regDate;
	String petName;
	String petType;
	String petImg;
	
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	@Override
	public String toString() {
		return "ReviewBoard [reviewId=" + reviewId + ", postDisable=" + postDisable + ", postReportCnt=" + postReportCnt
				+ ", postReportText=" + postReportText + ", userId=" + userId + ", subject=" + subject + ", content="
				+ content + ", regDate=" + regDate + ", petName=" + petName + ", petType=" + petType + ", petImg="
				+ petImg + "]";
	}

	
}