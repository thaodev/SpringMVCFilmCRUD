package com.skilldistillery.film.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FilmController {
	
	@RequestMapping("findFilmByID.do")
	public ModelAndView processData(Film film, int filmId) {
		String allCaps = filmId.toUpperCase();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view.jsp");
		mv.addObject("result", allCaps);
		return mv;

 
 
}
