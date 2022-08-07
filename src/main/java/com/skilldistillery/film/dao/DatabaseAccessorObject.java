package com.skilldistillery.film.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class DatabaseAccessorObject implements DatabaseAccessor {
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=US/Mountain";
	private final String user = "student", pass = "student";

	public DatabaseAccessorObject() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
	}

	// CREATE
	public Film createFilm(Film film) {
		Film filmAdded = film;
		String sql = "INSERT INTO film (title, description," + "release_year," + " language_id"
				+ ", rental_duration, rental_rate, length," + " replacement_cost, rating, special_features" + ")"
				+ " VALUES(?, ?," + "?," + "?" + ", ?, ?, ?," + "?, ?, ?" + ")";
		System.out.println(sql);
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);

			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			stmt.setString(1, film.getTitle() == null ? "" : film.getTitle());

			stmt.setString(2,
					film.getDescription().length() == 0 || film.getDescription() == null ? "" : film.getDescription());

			stmt.setInt(3, film.getReleaseYear() == null || film.getReleaseYear().getYear() == 0 ? 2022
					: film.getReleaseYear().getYear());

			stmt.setInt(4, film.getLanguageId());

			stmt.setByte(5, film.getRentalDuration() == 0 ? (byte) 3 : film.getRentalDuration());

			stmt.setBigDecimal(6, film.getRentalRate() == null ? BigDecimal.valueOf(0) : BigDecimal.valueOf(4.99));

			stmt.setShort(7, film.getLength() == 0 ? Short.valueOf("0") : Short.valueOf(film.getLength()));

			stmt.setBigDecimal(8,
					film.getReplacementCost() == null ? BigDecimal.valueOf(19.99) : film.getReplacementCost());

			stmt.setString(9, film.getRating() == null || film.getRating().length() == 0 ? "G" : film.getRating());
			System.out.println(film.getRating());

			stmt.setString(10, film.getSpecialFeatures() == null || film.getSpecialFeatures().length() == 0 ? ""
					: film.getSpecialFeatures());
			System.out.println(film.getSpecialFeatures());

			// System.out.println(stmt.toString());
//			stmt.executeUpdate();

			int updateCount = stmt.executeUpdate();
			System.out.println(updateCount + " film created.");
			// Now get the auto-generated actor ID:
			
			
			if (updateCount == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				if (keys.next()) {
					System.out.println("New film ID: " + keys.getInt(1));
				}
//				ResultSet keyList = stmt.getGeneratedKeys();
				filmAdded.setId(keys.getInt(1));
				conn.commit();
				System.out.println("" + filmAdded.getTitle() + "' added.");
				return filmAdded;
			} else {
				System.out.println("Error: " + updateCount + " films added.");
				conn.rollback();
			}
		} catch (SQLException sqle1) {
			sqle1.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.out.println("Error: Unable to roll back transaction.");
					sqle2.printStackTrace();
				}
			}
//				throw new RuntimeException("Error inserting film " + film.getTitle());
		} finally {
			try {
				conn.close();
			} catch (SQLException sqle3) {
				sqle3.printStackTrace();
			}
		}
		return filmAdded;
	}

	// READ
	@Override
	public Film findFilmById(int filmId) {
		String sql = "SELECT film.*, language.name, category.name "
				+ "FROM film JOIN language ON film.language_id = language.id "
				+ "JOIN film_category ON film.id = film_category.film_id "
				+ "JOIN category ON film_category.category_id = category.id " + "WHERE film.id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new Film(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
						rs.getDate("release_year").toLocalDate(), rs.getShort("language_id"),
						rs.getString("language.name"), rs.getString("category.name"), rs.getByte("rental_duration"),
						rs.getBigDecimal("rental_rate"), rs.getShort("length"), rs.getBigDecimal("replacement_cost"),
						rs.getString("rating"), rs.getString("special_features"),
						this.findActorsByFilmId(rs.getInt("id")), this.getFilmInventory(filmId));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Film> findFilmByKeyword(String keyword) {
		List<Film> films = new ArrayList<Film>();
		String sql = "SELECT film.*, language.name, category.name "
				+ "FROM film JOIN language ON film.language_id = language.id "
				+ "JOIN film_category ON film.id = film_category.film_id "
				+ "JOIN category ON film_category.category_id = category.id "
				+ "WHERE UPPER(film.title) LIKE UPPER(?) OR UPPER(film.description) LIKE UPPER(?)";

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				films.add(new Film(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
						rs.getDate("release_year").toLocalDate(), rs.getShort("language_id"),
						rs.getString("language.name"), rs.getString("category.name"), rs.getByte("rental_duration"),
						rs.getBigDecimal("rental_rate"), rs.getShort("length"), rs.getBigDecimal("replacement_cost"),
						rs.getString("rating"), rs.getString("special_features"),
						this.findActorsByFilmId(rs.getInt("id")), this.getFilmInventory(rs.getInt("film.id"))));
				System.out.println(films.get(0));
			}
			return films;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return null;
	}

	public Map<String, Set<Integer>> getFilmInventory(int filmId) {
		Map<String, Set<Integer>> inventory = new HashMap<String, Set<Integer>>();

		String sql = "SELECT id, media_condition FROM inventory_item WHERE film_id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String condition = rs.getString("media_condition");
				int id = rs.getInt("id");
				if (condition == "NULL") {
					condition = "Unknown";
				}
				if (inventory.get(condition) != null) {
					inventory.get(condition).add(id);
				} else {
					Set<Integer> idSet = new HashSet<Integer>();
					idSet.add(id);
					inventory.put(condition, idSet);
				}
			}
			return inventory;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

		return null;
	}

	public Actor findActorById(int actorId) {
		String sql = "SELECT * FROM actor WHERE id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new Actor(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return null;
	}

	public List<Actor> findActorsByFilmId(int filmId) {
		String sql = "SELECT actor.id, first_name, last_name "
				+ "FROM film JOIN film_actor ON film.id = film_actor.film_id "
				+ "JOIN actor ON actor.id = film_actor.actor_id " + "WHERE film.id = ?";
		List<Actor> actors = new ArrayList<Actor>();

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				actors.add(this.findActorById(rs.getInt("actor.id")));
			}
			return actors;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return null;
	}

}
