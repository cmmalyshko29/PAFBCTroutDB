<h1>Pennsylvania Fish and Boat Comission Trout Stream Database Design</h1>

<h2>Description</h2>
This project was designed to create a comprehensive database that stores data about both streams with naturally reproducing trout populations and streams stocked by the Pennsylvania Fish and Boat Commission 
(PAFBC) annually, which can help predict trout population health, abundance, and biomass throughout the waterways of Pennsylvania (PA). The initial data for this database was acquired from the Pennsylvania State University’s PA Spatial Data Access Portal (PASDA) from the 2024 Class A Wild Trout Streams and the 2024 Trout Stocked Streams data tables, components of the PAFBC Fisheries Resource Database.
<br />


<h2>Languages and Softwares Used</h2>

- <b>PostgreSQL </b> 
- <b>DBeaver</b>
- <b>QGIS<b/>


<h2>Figures From Final Report</h2>

<ins>  Entity Relationship Diagram (ERD) for the Final Database 
![Image](https://github.com/user-attachments/assets/15762417-8778-46a9-87bd-142e8e802361) 

*This figure is the Entity Relationship Diagram (ERD) for the final database. The main structure of the database is outlined here as each table’s, the rectangles, relationship is outlined using line connections from the primary key, i.e., the main unique identifier for the table, of one table to a foreign key in another table, i.e., an attribute referencing the primary key from the first table. The way two table are related is represented with a symbol. The primary symbols here are --|-- for an “one” relationship, i.e.,the data is related to only one set of attributes, and --<- for a “many” relationship, i.e., there are many attributes that can be combined in a relationship. For this ERD, the section table is the main table, and each section will only have one set of values from each of the other tables, but each table can supplement many sections.*



<ins> <b> Spatial Queries Peformed Using Designed Database 

<b> Trout Stream Sections in Pennsylvania Within One-Mile of Trail Heads
![Image](https://github.com/user-attachments/assets/0cb868cb-c076-4aab-bc58-f48738dc2f89)

*This figure represents the results of running a spatial query to return the stream sections in Pennsylvania that are within one mile of trail heads. The blue lines represent the selected stream sections that satisfy the query, the red diamonds are the trail heads within 1 mile, and the red circled region is the location of the right image. The image on the left shows the results across the entire state of Pennsylvania. The image on the right is a zoomed in view on the results of the query in Lehigh County, which was randomly chosen to depict the results.*
<b/>

<b> Trout Stream Sections Within Pennsylvania Classified as Best Fishing Waters
![Image](https://github.com/user-attachments/assets/b5ab59e1-1c01-4fee-bbb4-e1d85d76872f)

*This figure represents the results of running a spatial query to return the stream sections within Pennsylvania that are also classified as best fishing waters. The orange lines represent the stream sections from the project database, the purple lines represent the streams from the best fishing dataset, and the red circled region is the location of the right image. The image on the left shows the results across the entire state of Pennsylvania. The image on the right is a zoomed in view on the results of the query in Erie County, which was randomly chosen to depict the results.*
<b/>

<b> Three Closest PAFBC Stocked Stream Sections To Each Naturally Reproducing Stream Section Within Pennsylvania
![Image](https://github.com/user-attachments/assets/bb4774f2-9ada-4549-9bed-ac9c78e47870)

*This figure represents the results of running a spatial query to return the three closest stocked stream sections to each naturally reproducing stream section within Pennsylvania. The red lines represent the natural stream sections, the blue lines represent stocked stream sections, and the red rectangle region is the location of the right image. The image on the left shows the results across the entire state of Pennsylvania. The image on the right is a zoomed in view on the results of the query in Centre County, which was randomly chosen to depict the results.*
