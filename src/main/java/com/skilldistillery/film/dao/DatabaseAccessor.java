package com.skilldistillery.film.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.skilldistillery.film.entities.*;

/*
 * Included some of the abstract methods defined in the
 * DatabaseAccess interface from our FilmQuery project.
 * 
 * TODO:	Create actor class OR delete referenced to Actor
 * 			in this interface.
 */

public interface DatabaseAccessor {
	public Film createFilm(Film film);
	public Film findFilmById(int filmId);
	public List<Film> findFilmByKeyword(String keyword);
	public Map<String, Set<Integer>> getFilmInventory(int filmId);
//	public Actor findActorById(int actorId);
//	public List<Actor> findActorsByFilmId(int filmId);
}
