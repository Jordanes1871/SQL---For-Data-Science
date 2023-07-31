Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	
select
(select count(*)
from attribute) as attribute,
(select count(*)
from business) as business,
(select count(*)
from Category) as Category,
(select count(*)
from elite_years) as elite_years,
(select count(*)
from friend) as friend,
(select count(*)
from hours) as hours,
(select count(*)
from photo) as photo,
(select count(*)
from review) as review,
(select count(*)
from tip) as tip,
(select count(*)
from user) as user;


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1526
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 537
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

select
(select count(DISTINCT business_id)
from attribute) as attribute,
(select count(DISTINCT id)
from business) as business,
(select count(DISTINCT business_id)
from Category) as Category,
(select count(DISTINCT user_id)
from elite_years) as elite_years,
(select count(DISTINCT user_id)
from friend) as friend,
(select count(DISTINCT business_id)
from hours) as hours,
(select count(DISTINCT id)
from photo) as photo,
(select count(DISTINCT id)
from review) as review,
(select count(DISTINCT user_id)
from tip) as tip,
(select count(DISTINCT id)
from user) as user,
(select count(DISTINCT business_id)
from checkin) as checkin
;


3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	SQL code used to arrive at answer:
	
	SELECT 
SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) as id,
SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) as name,
SUM(CASE WHEN review_count IS NULL THEN 1 ELSE 0 END) as review_count,
SUM(CASE WHEN yelping_since IS NULL THEN 1 ELSE 0 END) as yelping_since,
SUM(CASE WHEN useful IS NULL THEN 1 ELSE 0 END) as useful,
SUM(CASE WHEN funny IS NULL THEN 1 ELSE 0 END) as funny,
SUM(CASE WHEN cool IS NULL THEN 1 ELSE 0 END) as cool,
SUM(CASE WHEN fans IS NULL THEN 1 ELSE 0 END) as fans,
SUM(CASE WHEN average_stars IS NULL THEN 1 ELSE 0 END) as average_stars,
SUM(CASE WHEN compliment_hot IS NULL THEN 1 ELSE 0 END) as compliment_hot,
SUM(CASE WHEN compliment_more IS NULL THEN 1 ELSE 0 END) as compliment_more,
SUM(CASE WHEN compliment_profile IS NULL THEN 1 ELSE 0 END) as compliment_profile,
SUM(CASE WHEN compliment_cute IS NULL THEN 1 ELSE 0 END) as compliment_cute,
SUM(CASE WHEN compliment_list IS NULL THEN 1 ELSE 0 END) as compliment_list,
SUM(CASE WHEN compliment_note IS NULL THEN 1 ELSE 0 END) as compliment_note,
SUM(CASE WHEN compliment_plain IS NULL THEN 1 ELSE 0 END) as compliment_plain,
SUM(CASE WHEN compliment_cool IS NULL THEN 1 ELSE 0 END) as compliment_cool,
SUM(CASE WHEN compliment_funny IS NULL THEN 1 ELSE 0 END) as compliment_funny,
SUM(CASE WHEN compliment_writer IS NULL THEN 1 ELSE 0 END) as compliment_writer,
SUM(CASE WHEN compliment_photos IS NULL THEN 1 ELSE 0 END) as compliment_photos
from user;

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	0	max:	2	avg: 0.0144
		
	
	ii. Table: Business, Column: Stars
	
		min:	0	max:	2000	avg: 24.2995
		
	
	iii. Table: Tip, Column: Likes
	
		min:	1	max:	5	avg: 3.6549
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	5	avg: 3.7082
		
	
	v. Table: User, Column: Review_count
	
		min:	1	max:	53	avg: 1.9414
		
select
min(stars) as min, max(stars) as max, avg(stars) as average
from review 
union
select
min(stars), max(stars), avg(stars)
from business
union
select
min(likes), max(likes), avg(likes)
from tip
union
select
min(count), max(count), avg(count)
from checkin
union
select
min(review_count), max(review_count), avg(review_count)
from user;

5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
select 
city, sum(review_count) as number_reviews
from business
group by city
order by number_reviews desc;
	
	Copy and Paste the Result Below:
	
Las Vegas

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

select stars,
count(stars) as count
from business
where city in ('Avon')
group by stars;

Copy and Paste the Resulting Table Below (2 columns – star rating and count):

stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |

ii. Beachwood

SQL code used to arrive at answer:

select stars,
count(stars) as count
from business
where city in ('Beachwood')
group by stars;

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
select id, name, sum(review_count) as review_count
from user
group by id
order by review_count desc
limit 3;

	Copy and Paste the Result Below:
		
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
select id, sum(review_count) as review_count, sum(fans) as fans_count
from user
group by id
order by review_count desc;

no strong correlation / direction between review and fans count  

id                     | review_count | fans_count |
+------------------------+--------------+------------+
| -G7Zkl1wIWBBmD0KRy_sCw |         2000 |        253 |
| -3s52C4zL_DHRK0ULG6qtg |         1629 |         50 |
| -8lbUNlXVSoXqaRRiHiSNg |         1339 |         76 |
| -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |        101 |
| -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |        126 |
| --2vR0DIsmQ6WfcSzKWigw |         1153 |        311 |
| -gokwePdbXjfS0iF7NsUGA |         1116 |         16 |
| -DFCC64NXgqrxlO8aLU5rg |         1039 |        104 |
| -8EnCioUmDygAbsYZmTeRQ |          968 |        497 |
| -0IiMAZI2SsQ7VmyzJjokQ |          930 |        173 |
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
more reviews with love than hate
	
	SQL code used to arrive at answer:

select 
sum(case when text like '%hate%' then 1 else 0 end) as hate,
sum(case when text like '%love%' then 1 else 0 end) as love
from review;

10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
select id, name, sum(fans) as fans
from user
group by id
order by fans desc
limit 10;

	Copy and Paste the Result Below:

 id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
city = Toronto; category = Arcades

i. Do the two groups you chose to analyze have a different distribution of hours?
There is only 1 business which operates at different hoursof the week, so this question is not applicable.

ii. Do the two groups you chose to analyze have a different number of reviews?
See above - 1busienss so same number of reviews.
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

There is only 1 arcade located in Toronto which has the same postcode.

SQL code used for analysis:

select 
b.name,
c.category,
b.id,
b.stars,
h.hours,
b.postal_code,
b.city,
b.review_count,
CASE
    when b.stars >= 2 and b.stars <=3 then 'low_rating'
    when b.stars >= 4 and b.stars <=5 then 'high_rating'
    else 'other'
end as star_group
from business b
LEFT JOIN category c ON b.id = c.business_id
LEFT JOIN hours h ON b.id = h.business_id
where c.category = 'Arcades' and b.city = 'Toronto';

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? 
List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
        
businesses that are closed has a lower average rating

ii. Difference 2:
         
businesses that are closed has a lower amount of funny reviews
         
SQL code used for analysis:

select
count (distinct b.id) as business_count,
avg(b.stars) as average_rating,
avg(r.funny) as funny_reviews_ave,
b.city,
CASE 
    when b.is_open = 0 then "business closed"
    else "business open"
    end business_status
from business b 
inner join review r on r.business_id = b.id
group by b.is_open;
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

Does the number of food photos taken at the business correlate with a higher restaurent rating?

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

The type of data I will need will be from both the category and photo table joined onto the business table. I aim to get the correct label i.e. food from the 
photo column in order to identify what type of photo was taken and the category will give a represntation of where it was took.
I want to explore if having a high rating is a consequence of people taking photos of the food. If you really enjoyed a meal, you would be more inclined
to take a picture and so those busienss might often be higher rated.        
                  
iii. Output of your finished dataset:
         
 number_photos | label | category               | star_rating    |
+---------------+-------+------------------------+----------------+
|             3 | food  | Restaurants            | high_rating    |
|             2 | food  | Sandwiches             | high_rating    |
|             1 | food  | American (New)         | high_rating    |
|             1 | food  | American (Traditional) | high_rating    |
|             1 | food  | Arabian                | high_rating    |
|             1 | food  | Bars                   | high_rating    |
|             1 | food  | Breakfast & Brunch     | high_rating    |
|             1 | food  | Burgers                | high_rating    |
|             1 | food  | French                 | high_rating    |
|             1 | food  | Gluten-Free            | high_rating    |
|             1 | food  | Halal                  | high_rating    |
|             1 | food  | Mediterranean          | high_rating    |
|             1 | food  | Nightlife              | high_rating    |
|             1 | food  | Salad                  | high_rating    |
|             1 | food  | Sushi Bars             | high_rating    |
|             1 | food  | Vegetarian             | high_rating    |
|             1 | food  | Bars                   | low_mid_rating |
|             1 | food  | Irish                  | low_mid_rating |
|             1 | food  | Nightlife              | low_mid_rating |
|             1 | food  | Pubs                   | low_mid_rating |
|             1 | food  | Restaurants            | low_mid_rating |

iv. Provide the SQL code you used to create your final dataset:

select 
count (p.label) as number_photos,
p.label,
c.category,
CASE
    when b.stars >= 1 and b.stars <=3 then 'low_mid_rating'
    when b.stars >3 then 'high_rating'
    else 'very_low_rating'
end as star_rating
from business b 
inner join photo p on b.id = p.business_id
inner join category c on b.id = c.business_id
where p.label = 'food' 
group by star_rating, c.category
order by number_photos desc;