import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5oU8LJIy912gOEwbg6ItwsMfP5dC8JA32gWBhxy1O7vLENxv4v6epLYQkOo6tAvpXyg&usqp=CAU").image,
              )
            ),
          ),
        
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 62,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     Image.asset('img/logo.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Jasa Service',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 3),
                            
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
              Image.asset('img/logoo.png'),
              SizedBox(
                height: 10,
              ),
                SizedBox(height: 30,),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network("data:image/png;base64,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",height: 120,),
                            Text('Service Mobil'),
                          ],
                        ),
                      ),
                     
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network("https://i0.wp.com/motogokil.com/wp-content/uploads/2018/10/motorbike-mechanic-2.jpg?fit=637%2C415&ssl=1",height: 120,),
                            Text('Service Motor'),
                          ],
                        ),
                      ),
                   
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network("https://lh3.googleusercontent.com/proxy/0-4Qha6D3R8F2BM5OBW6DZrr2YofvARirAX-cKEJIejZDik5YS-uv_xGa73IHBmX2OLOSGOn8vQa77t7BkKJOTEf4juwhtst3z31zK7gA5UP0dYvR-umcoEhPXBmDmQB0Wu5ZZS3r3ETHgIMJwvdlw",height: 120,),
                            Text('Service AC'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTku2oJC2M9rZu0jq3hLd7n_lgwUEFudUCVLu_XOo7bY0V_7ih5LsWA9p2LBVPFNkbVZx8&usqp=CAU",height: 120,),
                            Text('Logout'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}