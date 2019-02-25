package net.shbt.domain.boards;

public class SearchPaging extends Paging {

	private String title;
	private String fromDate;
	private String toDate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	
	@Override
	public String toString() {
		return "SearchPaging [title=" + title + ", fromDate=" + fromDate + ", toDate=" + toDate + "]";
	}	
}
