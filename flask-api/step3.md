Add the following code to app.py.

<pre class="file" data-filename="app.py" data-target="insert" data-marker="#TODO-add_book">
@app.route('/books', methods=['POST'])
def add_books():
    print("add a book")
    data = request.json #json from request body
    new_book ={
         'title': data["title"],
         'author': data["author"],
         'rating': data["rating"]
    }
    books.append(new_book)
    return jsonify({'status':'success'}),200 
</pre>

Create a JSON document book.json and define the following JSON object.

<pre class="file" data-filename="book.json" data-target="replace">
{
    "title": "Machine Learning",
    "author": "Author 3",
    "rating": 9.5
}
</pre>

Open a second terminal (T2). 

Add a book by running the following command in T2.

`curl -X POST -d @book.json -H "Content-Type: application/json" http://localhost:5000/books`{{execute T2}}


In terminal 2, use the following command to verify the result.

`curl http://localhost:5000/books`{{execute T2}}


Visit localhost:5000/books in browser to show the list of books.

https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/books 



> **Exercise**:
> Use the API to create a book "MySQL in a Nutshell" with rating 9 and author "Author".
>
> Visit localhost:5000/books in browser to check if new book is added.
>
> https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/books 


