package net.shbt.domain.boards;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private Paging paging;
    
    private int displayPageNum = 10;
    
    public void setPaging(Paging paging) {
    	
    	this.paging = paging;
    }
    
    public void setTotalCount(int totalCount) {
    	
        this.totalCount = totalCount;
        calcData();
    }
    
    public void calcData() {
    	
        endPage = (int) (Math.ceil(paging.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) +1;
        int tempEndPage = (int) Math.ceil(totalCount/(double) paging.getPerPageNum());

        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * paging.getPerPageNum() >= totalCount ? false : true;
    }
    
    public String makeQuery(int page) {
    	
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", paging.getPerPageNum())
                .build();

        return uriComponents.toString();
    }
    
    public int getTotalCount() {
        return totalCount;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }
    
    public Paging getPaging() {
    	return paging;
    }
    
    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
    
    @Override
    public String toString() {
        return "PageMaker{" +
                "totalCount=" + totalCount +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", prev=" + prev +
                ", next=" + next +
                ", paging=" + paging +
                ", displayPageNum=" + displayPageNum +
                '}';
    }    
}
