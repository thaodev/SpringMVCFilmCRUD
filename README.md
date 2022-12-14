# SpringMVCFilmCRUD

###Team

* Thao Nguyen
* Ryan Prime
* Joseph Marulli

## Overview

This website project functions by showing a webpage to the user once run from SpringToolSuite4 that offers two film searches. One search take a film ID as input and the other takes a keyword; both display all fields of a film, as well as an option to delete or update. The "delete" feature allows the user to delete an added film from the database while the "update" feature allow for the user to make changes to a film's fields (discounting its ID number).


### Detailed Analysis of Function

This website operates using index.html combined with Gradle to show a homepage with two search bars accompanied by buttons bearing a description of their function once data is entered. The first will search the database for a film's ID by linking the user input to the DAO, activating its method recognizably named for this function; here the DAO prepares a SQL query in Java to be executed through the FilmQuery servlet, which will also add the proper prefix and suffix to given SQL. If the query has fields for the "result set" to connect with, each will be displayed to the following web page by way of linking the DAO to each correspondingly named pieces of code in the linked Java Server Page by way of the FilmController. The second search bar acts in the same manner, with the only notable differences being the name of the method in the DAO and the logic written to make the SQL query match keywords in a film's fields instead of an ID; both load the inputed data to a film display page. 
  On the page displaying all of a Film's fields, two buttons are found above the film title (provided from the viewFilm JSP): one inscribed delete and one update. If the delete button is clicked, a page is loaded with a message displayed saying the delete was successful; however, this will only delete films added by the user, as the original database films has dependencies elsewhere that make their deletion impossible for this app. This all is accomplished by the "form" in the viewFilm JSP that links to the DAO method with its ModelAndView method in the Controller which utilizes the logic written in the DAO for deletion. The update button, when clicked, will load a page allowing the user to change the fields of the selected film by the continued linking of the DAO updateFilm method through the Controller's ModelAndView to the new updateFilm JSP. After the chosen fields have been selected by the user, a button on the bottom entitled "Update Film" can be pressed, which will reload the page having the selected fields saved. The updated page is loaded via the updateResult JSP, and a continual flow between  the updateFilm and updateResult JSPs, DAO's updateFilm method and Controller's "GET" filmUpdated  and "POST" updateFilm methods allow the user to change and reload saved fields as many times as desired. 

## Technologies/Frameworks Used

* Java
* Spring MVC
* MySQL
* JDBC
* HTML
* CSS
* Bootstrap
* Javascript

## Lessons Learned

#### Thao:
##### - Divide big tasks to smaller tasks in order to narrow down the problem.
##### - Debug using println to console.
##### - Load images emoji to the web, using bootstrap for variety purposes.
##### - Understand the workflow in spring MVC, where spring create instances, how each part carry its own responsibilities and communicate with other parts.
##### - Teamwork


#### Joe:
##### - Debugging is best done incrementally, addressing just one facet at a time.
##### - Push to Github after each logical and successful unit of work.
##### - A project can get complex quickly. Good organization and cleanliness are important.
##### - Keep trying. Most solutions can be found. They just may cost you headaches and frustration.
##### - A good team can accomplish a lot (and can make an arduous process feel less arduous).

#### Ryan: 
#####Seeing this project from the big picture was a major weakness for me. After trying to figure out where a beginning was, I discovered that it didn't matter so much where I began, but only that each part of the objective was created and linked together. 