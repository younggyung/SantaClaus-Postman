package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.rFileDto;
import com.boot.jdbc.model.dto.ReviewDto;

public interface ReviewBiz {
	public List<ReviewDto> reviewList();
	public ReviewDto reviewDetail(int review_no);
	public int reviewInsert(ReviewDto reviewdto);
	public int fileInsert(rFileDto file);
	public int reviewUpdate(ReviewDto reviewdto);
	public int reviewDelete(int review_no);
	
}
