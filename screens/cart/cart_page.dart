import 'package:flutter/material.dart';

class Book {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  int quantity;

  Book({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class Cart {
  final List<Book> books;

  Cart(this.books);

  double get totalPrice {
    return books.fold(0, (total, book) => total + (book.price * book.quantity));
  }

  void addBook(Book book) {
    final existingBookIndex = books.indexWhere((b) => b.id == book.id);

    if (existingBookIndex != -1) {
      books[existingBookIndex].quantity += 1;
    } else {
      books.add(book);
    }
  }

  void removeBook(int bookId) {
    books.removeWhere((book) => book.id == bookId);
  }

  void clear() {
    books.clear();
  }
}

class CartPage extends StatefulWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.books.length,
              itemBuilder: (ctx, index) {
                final book = widget.cart.books[index];

                return ListTile(
                  leading: Image.asset('assets/images/trending_book_1.png',
                    width: 50,
                  ),
                  title: Text(book.title),
                  subtitle: Text('Price: \$${book.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (book.quantity == 1) {
                              widget.cart.removeBook(book.id);
                            } else {
                              book.quantity -= 1;
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('${book.quantity}'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            book.quantity += 1;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${widget.cart.totalPrice}'),
                ElevatedButton(
                  onPressed: () {
                    // code to execute when button is pressed
                  },
                  child: Text('Button Text'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
