import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:e_shop/models/product.dart';

class ProductView extends StatefulWidget {
  Product product;
  ProductView(this.product);
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductView'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              // shape:RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15.0),
              // ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          // height: 180,
                          //width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.network(
                            widget.product.imageLink,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: Obx(
                              () => CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  icon: widget.product.isFavorite.value
                                      ? Icon(Icons.favorite_rounded)
                                      : Icon(Icons.favorite_border),
                                  onPressed: () {
                                    widget.product.isFavorite.toggle();
                                  },
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.product.name,
                      // maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'avenir', fontWeight: FontWeight.w800),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    if (widget.product.rating != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.product.rating.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 8),
                    Text('\$${widget.product.price}',
                        style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            flex: 1,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Add to cart"))),
          )
        ],
      ),
    );
  }
}
