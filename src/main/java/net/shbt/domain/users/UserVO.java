package net.shbt.domain.users;

public class UserVO {

	private String userId;
	private String password;
	private String userNm;
	private String wDate;
	private String uDate;
	private String email;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}	
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getuDate() {
		return uDate;
	}
	public void setuDate(String uDate) {
		this.uDate = uDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", password=" + password + ", userNm=" + userNm + ", wDate=" + wDate
				+ ", uDate=" + uDate + ", email=" + email + "]";
	}

}
