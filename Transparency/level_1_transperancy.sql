
-- Department = UN(department1,department2)
-- department1 @Gulshan
-- department2 @Dhanmondi

--for @Gulshan
  select * from department1 union select * from department2 @Dhanmondi;
  
--for @Dhanmondi
 select * from department1 @Gulshan union select * from department2;
 
 
 -- Doctor = UN(doctor1,doctor2)
 -- doctor1 @Gulshan
 -- doctor2 @Dhanmondi

--for @Gulshan
  select * from doctor1 union select * from doctor2 @Dhanmondi;
  
--for @Dhanmondi
 select * from doctor1 @Gulshan union select * from doctor2;