class CategoryAndItemModel {
  String? category;
  List<Item>? item;

  CategoryAndItemModel({this.category, this.item});

  CategoryAndItemModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(new Item.fromJson(v));
      });
    }
  }
}

class Item {
  int? itemId;
  String? itemImage;
  String? itemName;
  int? itemCategory;

  Item({this.itemId, this.itemImage, this.itemName, this.itemCategory});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemImage = json['item_image'];
    itemName = json['item_name'];
    itemCategory = json['item_category'];
  }
}
