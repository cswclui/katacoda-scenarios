
Define `app.py` as follows.

<pre class="file" data-filename="app.py" data-target="replace">
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost", 
  port=33306, #default mysql server port is 3306
  user="root",
  password="12345"
)
mycursor = mydb.cursor(dictionary=True)
</pre>


Insert the following python code to create DB and tables.

<pre class="file" data-filename="app.py" data-target="insert" data-marker="#TODO-add_book">
mycursor.execute('DROP DATABASE IF EXISTS Sales');
mycursor.execute('CREATE DATABASE Sales');
mycursor.execute('CREATE TABLE Sales.Customer (Personid int NOT NULL AUTO_INCREMENT, Name varchar(50),  Age int, PRIMARY KEY (Personid))');
</pre>

Insert the following python code to insert sample data into the Customer table.

<pre class="file" data-filename="app.py" data-target="insert" data-marker="#TODO-add_book">
sql = "INSERT INTO Sales.Customer (Name, Age) VALUES (%s, %s)"
mycursor.execute(sql, ("Chan", 18))
mycursor.execute(sql, ("Pansy", 33))
mydb.commit()
</pre>


Insert the following python code to execute SELECT query and display the result in python.

<pre class="file" data-filename="app.py" data-target="insert" data-marker="#TODO-add_book">
mycursor.execute("select * from Sales.Customer")
myresult = mycursor.fetchall()
for x in myresult:
  print(x)
  print(f"PersonID:{x['Personid']}")
  print(f"Age:{x['Age']}")
</pre>