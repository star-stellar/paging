package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.repository.BoardRepository;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	private BoardRepository boardRepository;
		
	@RequestMapping(value = {"list","/list/{category}"})
	public String list(@PathVariable(required = false) String category,
			@ModelAttribute("cri") Criteria criteria, Model model ) {
		log.info(criteria);
		criteria.setCategory(category);
		model.addAttribute("list",boardRepository.list(criteria));
		model.addAttribute("p", new Pagination(criteria, boardRepository.getTotalCount(criteria)));
		return "board/list";
	}
}
