author(
             book("The Hobbit", tolkien, publish(1937), fantasy),
             book("The Fall of Gondolin", tolkien, publish(2018), fantasy),
             [
               book("The Fellowship of the Ring", tolkien, publish(1954), fantasy), 
               book("The Two Towers", tolkien, publish(1954), fantasy),
               book("Return of the King", tolkien, publish(1954), fantasy)
             ]
         ).
author(
          book("A Christmas Carol", dickens, publish(1843), novella),
          book("Our Mutual Friend", dickens, publish(1864), fantasy),
          []
       ).

author(
          book("Harry Potter and the Philosopher's Stone", rowling, publish(1997), fantasy),
          book("The Ickabog", rowling, publish(2020), fantasy),
          [
            book("Harry Potter and the Philosopher's Stone", rowling, publish(1997), fantasy),
            book("Harry Potter and the Chamber of Secrets", rowling, publish(1998), fantasy),
            book("Harry Potter and the Prisoner of Azkaban", rowling, publish(1999), fantasy),
            book("Harry Potter and the Goblet of Fire", rowling, publish(2000), fantasy),
            book("Harry Potter and the Order of the Phoenix", rowling, publish(2003), fantasy),
            book("Harry Potter and the Half-Blood Prince", rowling, publish(2005), fantasy),
            book("Harry Potter and the Deathly Hallows", rowling, publish(2007), fantasy)
          ]
          ).

author(
          book("The Da Vinci Code", brown, publish(2003), mystery),
          book("Wild Symphony", brown, publish(2020), children),
          [
          	book("Angels and Demons", brown, publish(2000), mystery),
            book("The Da Vinci Code", brown, publish(2003), mystery),
            book("The Lost Symbol", brown, publish(2009), mystery),
            book("Inferno", brown, publish(2013), mystery),
            book("Origin", brown, publish(2017), mystery)
          ]
          ).


top_selling(X) :- author(X,_,_).
latest_book(X) :- author(_,X,_).
series(X) :- author(_,_,Serial), member(X, Serial).

exists(Books) :- top_selling(Books); latest_book(Books); series(Books).

publishyear(author(_,_,publish(Year),_),Year).

% print ALL book in the database
% -? exists( book(Title, Author,_,_)).

% find best selling book of said author
% -? author( book(Title,Author,_,_),_,_), Author == tolkien.

% find which author had their latest book after said year
% -? author( _,book(Name,Author,publish(Year),_),_), Year > 2000.

% find titles of books published before 1800
% -? exists( book(Title,Author,publish(Year),_)), Year =< 1800.

% which author wrote no serial books?
% -? author( book(_,Author,_,_),_,[])

% which author wrote at least 5 serial books?
% -? author( book(_,Author,_,_),_,[_,_,_,_,_|_])

% find fantasy books
% -? exists( book(Title,Author,_,Genre)), Genre == fantasy.

% find books published before 1900s with fantasy genre
% -? exists( book(Title,Author,publish(Year),fantasy)), Year < 1900.

% find books from brown which is not mystery
% -? exists( book(Title,brown,_,Genre)), Genre \= mystery.

% find books that are not fantasy
% -? exists( book(_,Author,_,Genre)), Genre \= fantasy.

