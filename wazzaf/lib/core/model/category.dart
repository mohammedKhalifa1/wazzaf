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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['category'] = this.category;
  //   if (this.item != null) {
  //     data['item'] = this.item!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['item_id'] = this.itemId;
  //   data['item_image'] = this.itemImage;
  //   data['item_name'] = this.itemName;
  //   data['item_category'] = this.itemCategory;
  //   return data;
  // }
}
