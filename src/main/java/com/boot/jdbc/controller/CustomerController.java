package com.boot.jdbc.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.ArticleBiz;
import com.boot.jdbc.model.biz.QnaBiz;
import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.util.MD5Generator;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private ArticleBiz articlebiz;
	@Autowired
	private QnaBiz qnabiz;
	
	@GetMapping("/faq")
	public String faq() {
		return "customer/faq";
	}
	
	@GetMapping("/notice")
	public String selectList(Model model) {
		model.addAttribute("list", articlebiz.selectList());
		return "customer/notice";
	}
	
	@GetMapping("/notice_detail")
	public String selectOne(Model model, int no) {
		model.addAttribute("dto",articlebiz.selectOne(no));
		return "customer/notice_detail";
	}
	
	
	@GetMapping("/floatingMenu")
	public String floatingMenu() {
		return "customer/floatingMenu";
	}

	
	//QNA
	
	@GetMapping("/qnalist")
	public String qnaList(Model model) {
		model.addAttribute("qnalist",qnabiz.selectList());
		return "customer/qnalist";
	}

	
	@GetMapping("/qnainsertform")
	public String qna() {
		return "customer/qnainsert";
	}
	
	
	//qnainsert -> form태그 action에서 받아와서 실행
	//request URL이 qnainsert, view 페이지는 스트링 qnainsert
	@PostMapping("/qnainsert")
	public String insert(@RequestParam("file")MultipartFile files,QnaDto dto) throws NoSuchAlgorithmException {
		try {
			String file_oname = files.getOriginalFilename();
			String file_name = new MD5Generator(file_oname).toString();
			String file_path = System.getProperty("user.dir")+"\\file";
			
			if(qnabiz.insert(files,dto)>0) {
				return "redirect:/customer/qnalist";
			}else {
				return "redirect:/customer/qnainsert" ;
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/qnadetail")
	public String qnadetail(Model model, Integer qna_no) {
		model.addAttribute("dto",qnabiz.selectOne(qna_no));
		return "customer/qnadetail";
				
	}
}


	
	




	
			
	

		
