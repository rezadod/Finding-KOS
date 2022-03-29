class Space {
  int id;
  String name;
  String imgUrl;
  int price;
  String city;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchen;
  int numberOfBedrooms;
  int numberOfWaredrop;
//* BUAT CONTAINER
  Space({
    this.id,
    this.name,
    this.imgUrl,
    this.price,
    this.city,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfKitchen,
    this.numberOfWaredrop,
    this.phone,
    this.photos,
  });
//* CONTRUCT
  // TODO inisial key = variable,value = field yang ada di API
  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    imgUrl = json['image_url'];
    price = json['price'];
    address = json['address'];
    rating = json['rating'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json["photos"];
    numberOfBedrooms = json["number_of_bedrooms"];
    numberOfKitchen = json["number_of_kitchens"];
    numberOfWaredrop = json["number_of_cupboards"];
  }
}
