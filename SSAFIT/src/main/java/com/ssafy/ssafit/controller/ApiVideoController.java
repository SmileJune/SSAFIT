package com.ssafy.ssafit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.dao.VideoDao;
import com.ssafy.ssafit.dto.Video;

@RestController
@RequestMapping("/api")
public class ApiVideoController {
	
	@Autowired
	private VideoDao videoDao;
	
	@GetMapping("/")
	public List<Video> home() {
		return videoDao.selectAll();
	}
	
	@GetMapping("/{part}")
	public List<Video> upper(@PathVariable String part){
		return videoDao.selectPart(part);
	}
	
	@GetMapping("/favorite")
	public List<Video> favorite(){
		return videoDao.selectAllbyViews();
	}
}
