package com.ssafy.ssafit.dao;

import java.util.List;

import com.ssafy.ssafit.dto.Video;

public interface VideoDao {
	public List<Video> selectAll();
	public List<Video> selectAllByViews();
	public List<Video> selectPart(String part);
	public Video selectOne(int no);
	public void updateViewCnt(int no);
}
