class ProductModel
{
  String? title,description,category,image;
  var id,price;
  ratingModel? r1;

  ProductModel({this.id,this.title,this.description,this.image,this.price,this.category,this.r1});

  ProductModel ProductFromJson(Map m1)
  {
    id = m1['id'];
    title = m1['title'];
    category = m1['category'];
    price = m1['price'];
    image = m1['image'];
    description = m1['description'];
    r1 = ratingModel().fromrating(m1['rating']);

    ProductModel p1 = ProductModel(id: id,title: title,description: description,image: image,price: price,category: category,r1: r1);
    return p1;
  }
}

class ratingModel
{
  var rate,count;

  ratingModel({this.rate,this.count});

  ratingModel fromrating(Map m1)
  {
    rate = m1['rate'];
    count = m1['count'];

    ratingModel r1 = ratingModel(count: count,rate: rate);

    return r1;
  }
}