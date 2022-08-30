package model;

import java.util.Date;

public class PetBoard {
	
	int postId;
	int postDisable;
	int postReportCnt;
	String postReportText;
	String userId;
	String tel;
	String content;
	String place;
	String regDate;
	String petName;
	int petGender;
	String petType;
	String petDate;
	String petImg;
	String petDetail;
	int readCnt;
	String boardId;
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
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
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	public String getPetDate() {
		return petDate;
	}
	public void setPetDate(String petDate) {
		this.petDate = petDate;
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
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	
	@Override
	public String toString() {
		return "PetBoard [postId=" + postId + ", postDisable=" + postDisable + ", postReportCnt=" + postReportCnt
				+ ", postReportText=" + postReportText + ", userId=" + userId + ", tel=" + tel + ", content=" + content
				+ ", place=" + place + ", regDate=" + regDate + ", petName=" + petName + ", petGender=" + petGender
				+ ", petType=" + petType + ", petDate=" + petDate + ", petImg=" + petImg + ", petDetail=" + petDetail
				+ ", readCnt=" + readCnt + ", boardId=" + boardId + "]";
	}
	
}
