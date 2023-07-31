SQL for Data Science  - University of California, Davis 

WEEK 1  - SELECTING AND RETIREIVING DATA WITH SQL

Practice Questions 

To prepare for the graded coding quiz, you will be asked to execute a query, read the results, and select the correct answer you found in the results. 
This question is for you to practice executing queries. I have provided you the script for this query, a simple select statement. Think of this as a sandbox for you to practice. 
As you practice executing queries, take time to read the results in order to prepare for the quiz and get comfortable writing a basic select statement.

Q1) Run query: Retrieve all the data from the tracks table. Who is the composer for track 18?

Select *
From Tracks;

A) AC/DC

Q2) Run Query: Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?

Select *
From Artists;

A) I know 5 of the 25 artists displayed in the artists table

Q3)  Retrieve all data from the invoices table. What is the billing address for customer 31?

Select *
From Invoices;

A) 194A Chain Lake Drive

Q4) Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?

Select
distinct Name,
Playlistid 
From Playlists;

A) some playlist names are duplicates so there are 14 unique playlists names but 18 playlistsids

Q5) Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?

Select CustomerId,
InvoiceDate, 
BillingCity 
From Invoices;

A) Oslo associated with customerID = 4.
	Invoice date for the customer in Santiago = 2009-04-04 00:00:00 


Q6) Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?

Select FirstName, 
LastName, 
Email, 
Phone
From Customers;

A) +1 (604) 688-2255

Q7) Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?

Select TrackId, 
GenreId, 
Composer, 
UnitPrice 
From Tracks;

A) TrackId costs 0.99 each

Q8) Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?

Select *
From Playlist_track 
Limit 10;


A) If you just want a snapshot of your data without having to retrieve all records or using the LIMIT function is also good to show top/bottom records i.e. using the sum function and showing top/bottom 5 earners using LIMIT 5, order by DESC/ASC for example.

Q9) Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?

Select *
From Media_types
Limit 50;

A) No because the max amount of MediaTypeId is only 5

Q10) Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table? 
		What is the name of the 9th album in this list?

Select *
From Albums;

A) Plays Metallica By Four Cellos

---------------------------- 100% CORRECT -------------------------

Coding Questions

For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.

Q1) Retrieve all the records from the Employees table.

SELECT *
FROM Employees;

A) 590 Columbia Boulevard West, Lethbridge, AB, CANADA T1K 5N8

Q2) Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

SELECT 
FirstName, 
LastName, 
Birthdate, 
Address, 
City, 
State
FROM Employees;

A) Steve


Q3) Retrieve all the columns from the Tracks table, but only return 20 rows.

SELECT * 
FROM Tracks
LIMIT 20;

A) 375418

---------------------------- 100% CORRECT -------------------------

WEEK 2  - FILTERING, SORTING, AND CALCULATING DATA WITH SQL

Practice Questions 

For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a
single table titled: salary_range_by_job_classification. This table contains the
following columns:

SetID
Job_Code 
Eff_Date 
Sal_End_Date 
Salary_setID 
Sal_Plan 
Grade 
Step 
Biweekly_High_Rate 
Biweekly_Low_Rate 
Union_Code 
Extended_Step 
Pay_Type


Q1) Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query.

SELECT 
DISTINCT Extended_step
from salary_range_by_job_classification;

A) 5

Q2) Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.

Select 
min(Biweekly_high_Rate)
From salary_range_by_job_classification
where Biweekly_high_Rate IS NOT '$0.00';  

A) $100.00

Q3) What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.

SELECT 
Max(Biweekly_high_Rate) 
from salary_range_by_job_classification

A) $9726.38

Q4) What is the pay type for all the job codes that start with '03'? The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.

Select
job_code,
pay_type
from salary_range_by_job_classification
where job_code LIKE '03%';

A) B

Q5) Run a query to find the Effective Date (eff_date) or Salary End Date
(sal_end_date) for grade Q90H0? The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query. 

Select
Grade,
Eff_date,
Sal_end_date
from salary_range_by_job_classification
where Grade = 'Q90H0';

What is the Effective Date (eff_date) for grade Q90H0? (include date and time)

A) 12/26/2009 12:00:00 AM

Q6) Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query.

select Biweekly_Low_Rate
from salary_range_by_job_classification
order by Biweekly_Low_Rate asc;

Are these values properly sorted? 
A) No

Q7) Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? Hint: there are 6 lines to run this query.

select step, count(Step) as occurances
from salary_range_by_job_classification
where Job_Code between 0110 and 0400
group by Step;

A) 1

Q8) Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the
Biweekly Low Rate for job Code 0170?

select 
Job_code,
Biweekly_High_Rate,
Biweekly_Low_Rate,
(Biweekly_High_Rate - Biweekly_Low_Rate) as biweekly_net
from salary_range_by_job_classification
where Job_code = '0170';

A) 0

Q9) Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 

select Extended_Step,
Pay_Type
from salary_range_by_job_classification
where Pay_Type in ('M', 'D', 'H');

A) 0

Q10) Write and run a query, with no starter code or hints to answer this question: What is the step for
Union Code 990 and a Set ID of SFMTA or COMMN? 

select Step,
Union_Code,
SetID
from salary_range_by_job_classification
where Union_Code = '990' and SetID in ('SFMTA', 'COMMN');

A) 1

---------------------------- 100% CORRECT -------------------------

Coding Questions

All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

Q1) Find all the tracks that have a length of 5,000,000 milliseconds or more.

select TrackId,
Milliseconds
from Tracks
where Milliseconds >= 5000000;

How many tracks are returned?

A) 2

Q2) Find all the invoices whose total is between $5 and $15 dollars.

select InvoiceId,
Total
from Invoices
where Total between 5 and 15;

While the query in this example is limited to 10 records, running the query correctly will indicate how many total records there are - enter that number below.

A) 168

Q3) Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

select customerId,
State,
Company,
FirstName,
LastName
from Customers
where State in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

What company does Jack Smith work for?

A) Microsoft Corp

Q4) Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

select InvoiceId,
CustomerId,
InvoiceDate
from Invoices
where CustomerId = 56 OR 58 and total between 1 and 5 and InvoiceId = 315;

What was the invoice date for invoice ID 315?

A) 10-27-2012

Q5) Find all the tracks whose name starts with 'All'.

select TrackId,
Name
from Tracks
where Name like 'All%';

While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.

A) 15

Q6) Find all the customer emails that start with "J" and are from gmail.com.

select CustomerId,
Email
from Customers
where Email like 'J%gmail.com';

A) jubarnett@gmail.com

Q7)  Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

select InvoiceId,
BillingCity,
Total
from invoices
where BillingCity in ('Brasília', 'Edmonton', 'Vancouver')
order by InvoiceId desc;

What is the total invoice amount of the first record returned? Enter the number below without a $ sign. Remember to sort in descending order to get the correct answer.

A) 13.86

Q8) Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

select CustomerId,
count(CustomerId) as number_orders_placed
from Invoices
group by CustomerId
order by number_orders_placed desc;

What is the number of items placed for the 8th person on this list? Enter that number below.

A) 7

Q9) Find the albums with 12 or more tracks.

select albumid, count(trackid) as num_tracks
from tracks
group by albumid
having count(trackid) >= 12;

/* or */

select albums.albumid, count(tracks.trackid) as num_tracks, albums.title  
from albums
inner join tracks
on albums.albumid = tracks.albumid
group by albums.albumid
having count(tracks.trackid) >= 12;

While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.

A) 158

---------------------------- 100% CORRECT -------------------------

WEEK 3  - SUBQUERIES AND JOINS IN SQL

Practice Questions 

All of the questions in this
quiz pull from the open source Chinook Database. Please refer to the ER Diagram below and familiarize yourself with the table and
column names to write accurate queries and get the appropriate
answers.

Q1) How many albums does the artist Led Zeppelin have? 

select 
count(a.albumid) as albums_count, 
ar.name
from albums a 
inner join artists ar
on a.artistid = ar.artistid
where ar.name = "Led Zeppelin";

/* or */
select count(*) as albums_count from (
	select *
from artists a
left join albums ar
on ar.ArtistId = a.ArtistId
)
where Name = "Led Zeppelin";

A) 14

Q2) Create a list of album titles and the unit prices for the artist "Audioslave".
select 
a.title,
ar.name,
t.unitprice
from albums a 
inner join artists ar
on a.artistid = ar.artistid
inner join tracks t 
on a.albumid = t.albumid
where ar.name = "Audioslave";

How many records are returned?

Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.

A) 40

Q3) Find the first and last name of any customer who
does not have an invoice. Are there any customers returned from the query?  

select 
i.customerid,
c.firstname,
c.lastname
from customers c 
left join invoices i /* takes ALL customers and bring in matches with invoice */
on c.customerid = i.customerid
where i.customerid = NULL;


A) NO

Q4) Find the total price for each album.

select sum(t.unitprice) as total_price, t.albumid, t.name, a.title
from tracks t 
inner join albums a 
on t.albumid = a.albumid
group by t.albumid
having a.title = "Big Ones";

What is the total price for the album “Big Ones”?

A) 14.85

Q5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?

select count(i.InvoiceId)
from invoices i
cross join invoice_items;

Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.

A) 922880

---------------------------- 100% CORRECT -------------------------

Coding questions

All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

Q1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name
FROM Tracks
WHERE Albumid IN (
		SELECT Albumid
		FROM Albums
		WHERE Title = 'Californication'
		);

What is the title of the 8th track?

A) Porcelain

Q2) Find the total number of invoices for each customer along with the customers full name, city and email.

select 
sum(i.invoiceid) as number_invoices,
c.firstname, c.lastname, c.city, c.email 
from invoices i
inner join customers c
on i.customerid = c.customerid
group by c.customerid
limit 5;

After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).

A) frantisekw@jetbrains.com


Q3) Retrieve the track name, album, artistID, and trackID for all the albums.

select t.trackid, t.name, a.title, a.artistid
from albums a
inner join tracks t
on a.albumid = t.albumid
group by t.trackid
having t.trackid = 12;

/* or using a subquery wont be able to get title of album */

select name, trackid, albumid
from tracks
where albumid in(
    select albumid
    from albums
    where trackid = 12 
);


What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

A) Breaking The Rules

Q4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

select e.employeeid,
e.lastname,
e.reportsto,
e.title
from employees e
group by e.employeeid;

After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?

A) Callahan AND King

Q5) Find the name and ID of the artists who do not have albums. 

select ar.artistid, ar.name, a.albumid
from artists ar
left join albums a
on ar.artistid = a.artistid
where a.albumid is null and 
group by ar.artistid;


After running the query described above, two of the records returned have the same last name. Enter that name below.

A) Gilberto

Q6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

select firstname, lastname
from employees
union
select firstname, lastname
from customers 
order by lastname desc
limit 6;

After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.

A) Taylor

Q7) See if there are any customers who have a different city listed in their billing city versus their customer city.

select c.customerid, c.city, i.billingcity
from customers c 
inner join invoices i 
on c.customerid = i.customerid
where c.city <> i.billingcity;

A) No customers have a different city listed in their billing city versus customer city.

---------------------------- 100% CORRECT -------------------------

WEEK 4  - MODIFYING AND ANALYZING DATA WITH SQL

Coding Questions (there are no practice questions)

All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

A1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

select customerid,
upper(firstname || ' ' || lastname),
upper(city || ' ' || country)
from customers;

What is the city and country result for CustomerID 16?

A) MOUNTAIN VIEW USA

Q2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

select firstname, lastname, 
lower(substr(firstname,1,4) || substr(lastname,1,2)) as new_employee_id
from employees;

What is the final result for Robert King?

A) robeki

Q3) Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

select firstname, lastname, 
strftime('%Y %m %d', hiredate) as hiredate,
date('now') as today,
date('now')-strftime('%Y %m %d', hiredate) as years_worked
from employees
where years_worked >= 15
order by lastname asc;

What is the lastname of the last person on the list returned?

A) Peacock

Q4) Profiling the Customers table, answer the following question.

select
sum(case when firstname is Null then 1 else 0 end) as firstname,
sum(case when postalcode is Null then 1 else 0 end) as postalcode,
sum(case when fax is Null then 1 else 0 end) as fax,
sum(case when phone is Null then 1 else 0 end) as phone,
sum(case when company is Null then 1 else 0 end) as company,
sum(case when address is Null then 1 else 0 end) as address
from customers;

Are there any columns with null values? Indicate any below. Select all that apply (phone, postalcode, fax, company).

A) postalcode and fax and company

Q5) Find the cities with the most customers and rank in descending order.

select city,
count(city) as number_customers
from customers
group by city
having count(city) =2
order by count(city) desc;

Which of the following cities indicate having 2 customers?

A) London and Sao Paoulo and mountain View

Q6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

select 
(c.firstname || c.lastname || i.invoiceid ) as combined
from customers c
inner join invoices i 
on c.customerid = i.customerid
where combined like '%AstridGruber%';

Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.

A) AstridGruber273 and AstridGruber296 and AstridGruber370

---------------------------- 100% CORRECT -------------------------
