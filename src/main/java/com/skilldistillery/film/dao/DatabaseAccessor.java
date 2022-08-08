package com.skilldistillery.film.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface DatabaseAccessor {
	public Film createFilm(Film film);
	public Film findFilmById(int filmId);
	public Map<Integer, String> findFilmByKeyword(String keyword);
	public Map<String, Set<Integer>> getFilmInventory(int filmId);
	public Actor findActorById(int actorId);
	public List<Actor> findActorsByFilmId(int filmId);
	public boolean updateFilm(Film film);
	public boolean deleteFilmById(int filmId);
	public Actor createActor(Actor actor);
}
