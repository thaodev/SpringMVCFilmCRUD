package com.skilldistillery.film.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

import com.skilldistillery.film.dao.DatabaseAccessor;
import com.skilldistillery.film.dao.DatabaseAccessorObject;

public class Film {
	private int filmId;
	private String title;
	private String description;
	private short releaseYear;
	private String language;
	private int rentDuration;
	private double rate;
	private int length;
	private double replacementCost;
	private String rating;
	private String features;
	
	DatabaseAccessor db = new DatabaseAccessorObject();	
	public Film() {
		
	}


	public Film(int filmId, String title, String description, short releaseYear, String language, int rentDuration,
			double rate, int length, double replacementCost, String rating, String features) {
		
		this.filmId = filmId;
		this.title = title;
		this.description = description;
		this.releaseYear = releaseYear;
		this.language = language;
		this.rentDuration = rentDuration;
		this.rate = rate;
		this.length = length;
		this.replacementCost = replacementCost;
		this.rating = rating;
		this.features = features;
	}


	public int getFilmId() {
		return filmId;
	}


	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public short getReleaseYear() {
		return releaseYear;
	}


	public void setReleaseYear(short releaseYear) {
		this.releaseYear = releaseYear;
	}


	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	public int getRentDuration() {
		return rentDuration;
	}


	public void setRentDuration(int rentDuration) {
		this.rentDuration = rentDuration;
	}


	public double getRate() {
		return rate;
	}


	public void setRate(double rate) {
		this.rate = rate;
	}


	public int getLength() {
		return length;
	}


	public void setLength(int length) {
		this.length = length;
	}


	public double getReplacementCost() {
		return replacementCost;
	}


	public void setReplacementCost(double replacementCost) {
		this.replacementCost = replacementCost;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getFeatures() {
		return features;
	}


	public void setFeatures(String features) {
		this.features = features;
	}


	public List<Actor> getActorList() {
		List<Actor> actorList;
		actorList = db.findActorsByFilmId(filmId);
		
		return actorList;
	}
	
	public String getCategory() {
		String category = db.findCategoryByFilmId(filmId);
		return category;
	}

//	public void getInventory() {
//		List<Inventory> inventoryList;
//		inventoryList = db.getFilmInventory(filmId);
//		
//		for (Inventory item: inventoryList) {
//			System.out.println(item);
//		}
//		
//	}

		@Override
	public String toString() {
		return " Film [title = " + title + ",\n description = " + description + ",\n releaseYear = "
				+ releaseYear + ",\n language = " + language + ",\n rate = " + rate
				+ ",\n rating = " + rating + "]"+ "\n Actor list: "  + getActorList() ;
	}
		
	
	@Override
	public int hashCode() {
		return Objects.hash(description, features, filmId, language, length, rate, rating, releaseYear, rentDuration,
				replacementCost, title);
	}


	public void displayFilmDetails() {
		System.out.println( "Film [filmId = " + filmId + ", title = " + title + ",\n description = " + description + ",\n releaseYear = "
				+ releaseYear + ", language = " + language + ",\n rentDuration = " + rentDuration + ", rate = " + rate
				+ ",\n length = " + length + ", replacementCost = " + replacementCost + ",\n rating = " + rating + ", features = "
				+ features + "]" + "\n Actor list: "  + getActorList() + "\n Category = " + getCategory() +"\n Inventory: "); getInventory();
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Film other = (Film) obj;
		return Objects.equals(description, other.description) && Objects.equals(features, other.features)
				&& filmId == other.filmId && language == other.language && length == other.length
				&& Double.doubleToLongBits(rate) == Double.doubleToLongBits(other.rate)
				&& Objects.equals(rating, other.rating) && releaseYear == other.releaseYear
				&& rentDuration == other.rentDuration
				&& Double.doubleToLongBits(replacementCost) == Double.doubleToLongBits(other.replacementCost)
				&& Objects.equals(title, other.title);
	}

}
