// class Point {
//   int _x;
//   int _y;

//   Point(this._x, this._y);

//   @override
//   String toString() {
//     return "x=$_x, y=$_y";
//   }

//   void translate(int dx, int dy) {
//     _x += dx;
//     _y += dy;
//   }

//   int get x => _x;
//   int get y => _y;
// }

// class Rectangle {
//   Point top_left;
//   Point bottom_right;

//   Rectangle(this.bottom_right, this.top_left);

//   int width() => bottom_right.x - top_left.x;

//   int height() => top_left.y - bottom_right.y;

//   int area() => width() * height();

//   @override
//   String toString() {
//     return 'width:${width()}, height:${height()}, area:${area()}';
//   }
// }

// void main() {
//   Rectangle r1 = Rectangle(Point(2, 1), Point(1, 2));
//   r1.area();
//   r1.width();
//   r1.height();
//   print(r1);
// }





// class Person {
//   String first_name;
//   String last_name;

//   Person(this.first_name, this.last_name);

//   @override
//   String toString() {
//     return '$first_name $last_name';
//   }
// }

// void main() {
//   Person p1 = Person('Khy', 'Gio');
//   print(p1);
// }
