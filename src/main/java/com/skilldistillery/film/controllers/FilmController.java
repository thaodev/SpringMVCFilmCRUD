package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
	@Autowired
	private DatabaseAccessor dba;
	
	@RequestMapping(path="findFilmByID.do",
            method=RequestMethod.GET)
	public ModelAndView findFilmByID( int filmId) {
		Film film = dba.findFilmById(filmId); 
		ModelAndView mv = new ModelAndView();
		if (film != null) {
		mv.addObject(film);
		}
		mv.setViewName("viewFilm");
		return mv;

	}
	
	
	@RequestMapping(path="findFilmByKeyword.do",
            method=RequestMethod.GET)
	public ModelAndView findFilmByKeyword (String keyword,  @ModelAttribute("films") ArrayList<Film> films,
	        Model model) {
		films = new ArrayList<>(dba.findFilmByKeyword(keyword)); 
		ModelAndView mv = new ModelAndView();
		 mv.getModelMap().addAttribute("films", films);
		mv.setViewName("viewFilmList");
		return mv;

	}
	
	@RequestMapping(path="addFilm.do",
            method=RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		film = dba.createFilm(film); 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("success");
		return mv;

	}
	
//	@RequestMapping(value = "/getuserForm", produces = "text/html", method = RequestMethod.GET)
//	public ModelAndView returnUserForm(
//	        @ModelAttribute("managerList") List<Manager> managerList,
//	        Model model) {
//	    //how to include managerList
//	    ModelAndView mnv=  new ModelAndView("userForm");
//	    mnv.getModelMap().addAttribute("managerList", managerList);
//	    return mnv;
//	}

}
