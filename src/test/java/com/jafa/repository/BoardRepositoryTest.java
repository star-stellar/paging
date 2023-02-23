package com.jafa.repository;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;
import com.jafa.domain.Criteria;

import lombok.extern.log4j.Log4j;

@Log4j
public class BoardRepositoryTest extends AppTest{

	@Autowired
	BoardRepository boardRepository;
	
	@Test
	public void listTest() {
		Criteria criteria = new Criteria();
		criteria.setPage(4);
//		criteria.setCategory("free");
		criteria.setType("T");
		criteria.setKeyword("전기");
		boardRepository.list(criteria);
	}
	
	@Test
	public void countTest() {
		Criteria criteria = new Criteria();
		criteria.setPage(4);
//		criteria.setCategory("free");
		criteria.setType("T");
		criteria.setKeyword("기사");
		boardRepository.getTotalCount(criteria);
	}

}
