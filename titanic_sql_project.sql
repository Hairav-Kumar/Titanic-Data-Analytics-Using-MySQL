select * from titanic;
-- Q1 Show the first and last  10 rows of the dataset?
select * from titanic limit 10;
select * from titanic order by PassengerId desc limit 10;

-- Q2 Find the number of passengers who survived?
select count(*) as no_of_passengers from titanic where Survived=1;

-- Q3 Find the average age of all passengers?
select round(avg(age)) as average_age from titanic;

-- Q4 Find the number of passengers in each class?
select Pclass,count(*) as number_of_pass from titanic group by pclass;

-- Q5 Find the first 10 rows of the dataset sorted by passenger class in descending order?
select * from titanic order by PassengerId desc limit 10;

-- Q6 Find the number of passengers in each class sorted by result in ascending order?
select Pclass,count(*) as no_of_pass from titanic group by pclass order by no_of_pass asc;

-- Q7 Find the average fare paid by passengers in each class?
select Pclass,round(avg(Fare),0) as avg_fare from titanic group by pclass;

-- Q8 Find the name of the passenger with the highest fare?
select name, fare from titanic where fare = (select max(fare) from titanic);

-- Q9 Find the name of the passenger who had the highest age among the survivors?
select Name,age from titanic where age = (select max(Age) from titanic where Survived=1);

-- Q10 Find the number of passengers who paid more than the average fare?
select count(*)as no_of_pssn from titanic where fare > (select avg(fare) from titanic);

-- Q11 Find the name of the passenger who had the most parents or children on board?
select name from titanic where Parch = (select max(Parch) from titanic);

-- Q12 Find the number of male and female passengers who survived and order the results in ascending order?
select Sex,count(*) as no_of_pssn from titanic where Survived = 1 group by sex order by no_of_pssn asc;

-- Q13 Find the name, age, and fare of the oldest passenger who survived?
select name,age,fare from titanic where age = (select max(age) from titanic where Survived=1);

-- Q14 Find the name and age of the youngest female passenger who survived in third class?
select name,age from titanic where Sex="female" and  Survived=1 and Pclass=3 and age= (select min(age) from titanic where Sex="female" and Survived=1 and Pclass=3);

-- Q15 Find Number of male and female passengers?
select sum(case when sex="male" then 1 else 0 end) as male_count, sum(case when sex="female" then 1 else 0 end) as female_count from titanic;

-- Q16 Select all passengers who traveled in a cabin that was not shared by other passengers?
select * from titanic where Cabin not in (select Cabin from titanic group by cabin having count(*) >1);


