package com.skilldistillery.film.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
	@Autowired
	private DatabaseAccessor dba;

	@RequestMapping(path = "findFilmByID.do", method = RequestMethod.GET)
	public ModelAndView findFilmByID(int filmId) {
		Film film = dba.findFilmById(filmId);
		ModelAndView mv = new ModelAndView();
		if (film != null) {
			mv.addObject(film);
		}
		mv.setViewName("viewFilm");
		return mv;

	}

//	@RequestMapping(path = "findFilmByKeyword.do", method = RequestMethod.GET)
//	public ModelAndView findFilmByKeyword(String keyword, @ModelAttribute("films") ArrayList<Film> films, Model model) {
//		films = new ArrayList<>(dba.findFilmByKeyword(keyword));
//		ModelAndView mv = new ModelAndView();
//		mv.getModelMap().addAttribute("films", films);
//		mv.setViewName("viewFilmList");
//		return mv;
//
//	}
	
	@RequestMapping(path = "findFilmByKeyword.do", method = RequestMethod.GET)
	public ModelAndView findFilmByKeyword(String keyword) {
		Map<Integer, String> films = dba.findFilmByKeyword(keyword);
		ModelAndView mv = new ModelAndView();
		mv.addObject("films", films);
		mv.addObject("criteria", keyword);
		mv.addObject("numResults", films.size());
		mv.setViewName("viewFilmList");
		return mv;

	}

	@RequestMapping(path = "addFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		
		film = dba.createFilm(film);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:filmCreated.do");
		return mv;

	}

	@RequestMapping(path = "filmCreated.do", // mapping to handle Redirect
			method = RequestMethod.GET)
	public ModelAndView filmCreated() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result");
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
	
	@RequestMapping(path = "deleteFilm.do", method = RequestMethod.POST)
	public ModelAndView deleteFilm(int filmId) {
		boolean result = dba.deleteFilmById(filmId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("redirect:filmDeleted.do");
		return mv;
	}
	
	@RequestMapping(path = "filmDeleted.do", method = RequestMethod.GET)
	public ModelAndView filmDeleted(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletionResult");
		return mv;
	}
	
	@RequestMapping(path = "presentFilmForUpdate.do", method = RequestMethod.GET)
	public ModelAndView updateFilm(int filmId) {
		Film film = dba.findFilmById(filmId);
		ModelAndView mv = new ModelAndView();
		if (film != null) {
			mv.addObject(film);
		}
		mv.setViewName("updateFilm");
		return mv;
	}
	
	@RequestMapping(path = "updateFilm.do", method = RequestMethod.POST)
	public ModelAndView updateFilm(Film film) {
		System.out.println("in update film");
		boolean result = dba.updateFilm(film);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("redirect:filmUpdated.do");
		return mv;
	}
	
	@RequestMapping(path = "filmUpdated.do", method = RequestMethod.GET)
	public ModelAndView filmUpdated(){
		System.out.println("in film updated");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateResult");
		return mv;
	}

}
