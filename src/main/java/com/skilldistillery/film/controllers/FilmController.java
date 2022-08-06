package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
	@Autowired
	private DatabaseAccessor dba;
	
	@RequestMapping("findFilmByID.do")
	public ModelAndView processData(Film film, int filmId) {
		film = dba.findFilmById(filmId); 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view");
		return mv;

	}
}
