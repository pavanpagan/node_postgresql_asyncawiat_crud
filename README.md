# node_postgresql_asyncawait_crud

# Simple Menu Api....

# Needed

* Node js Recent version

* postgresql 9.5.14

* Postman to test api or any other tool also fine

* Any Editor am using vscode recent version

# Links To Learn

* https://nodejs.org/en/  for node js

* https://www.postgresql.org/  for postgresql

* https://www.getpostman.com/  for postman

* https://code.visualstudio.com/  To download vscode

# Adding database file

To import that to your postgresql 

* First Create database with name "kotmaster"

# running
* command is ----- psql -d kotmaster -f /Your_file_path/kotmaster.sql
1.npm install

2. to run-------- npm start

3.First add item types to item_type table dynamically using sql queries
item type can be veg,nonveg

4.Api to add category http://localhost:5000/admin/AddItemCategory

---json data---format to add category---POST TYPE
**type_id should be exist

	{
	"data":
			{
			"category_Name":"paganss",
			"type_id":7
			}
	}


5.Api to add Item http://localhost:5000/admin/AddItem

---json data---to add item--POST TYPE
**c_id should be exist

	{
	"data":
			{
			    "item_name":"dosa",
			    "item_desc":"ddd",
			    "item_status":"available",
			    "c_id":1,
			    "image":"/jsjs",
			    "price":1000
			}
	}

6.Api to View Category http://localhost:5000/admin/ViewCategory

---GET TYPE--You will recieve json data --


7.Api to View Items http://localhost:5000/admin/ViewItems

---GET TYPE--You will recieve json data --


8.Api to Update Category http://localhost:5000/admin/updateCategory/:cid


--json data to pass---PUT type


	{
	"data":
			{
			    "category_name":"fffff",
			    "t_id":7
			}
	}

9.Api to Update Item http://localhost:5000/admin/updateItem/:i_id

--json data to pass--PUT type
**i_id is item item id 

	{
	"data":
			{
			    "item_name":"s",
			    "item_desc":"s",
			    "item_status":"s",
			    "c_id":1,
			    "image":"/s",
			    "price":10
			}
	}

10.Api to Delete Item http://localhost:5000/admin/deleteItem/:i_id

----just pass item id as parameter---DELETE Type



