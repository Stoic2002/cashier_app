class ProductModel {
  final int id;
  final int categoryId;
  final String name;
  final String image;
  final double price;
  final String description;
  final int stock;
  final int isAvailable;
  final DateTime createdAt;
  final DateTime updateAt;

  ProductModel(
      this.id,
      this.categoryId,
      this.name,
      this.image,
      this.price,
      this.description,
      this.stock,
      this.isAvailable,
      this.createdAt,
      this.updateAt);
}
