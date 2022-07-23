int _quantity = 1;

int get quantity => _quantity;

void setQuantity() {
  _quantity++;
}

void lowQuantity() {
  if (_quantity <= 0) {
    _quantity = 1;
  }
  _quantity--;
}
