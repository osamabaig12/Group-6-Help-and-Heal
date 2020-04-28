import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'my_flutter_app_icons.dart';
import 'forum_second.dart';
class Posts{
  String userName;
  String userImage;
  String feedTime;
  String feedText;
  String feedImage;
  int likes;
  List comments = [];
  Posts({this.userName, this.userImage, this.feedTime, this.feedText, this.feedImage, this.likes, this.comments});
}
void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForumPage(),
    )
);
final List entries = [Posts(userName: 'Azamat Zhanisov',
    userImage: 'lib/se/icons8-female-profile-100.png',
    feedTime: '3 mins ago',
    feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
    feedImage: '',
    likes: 40,
    comments: [],
), ];

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  String result = '';
  int _curIndex = 0;
/*  makeFeed(
  userName: 'Azamat Zhanisov',
  userImage: 'lib/se/icons8-female-profile-100.png',
  feedTime: '3 mins ago',
  feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
  feedImage: ''
  ),
*/
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.start,
                  //onTap: (){},
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 22,fontWeight: FontWeight.bold, ),
                    hintText: "Hello! Hope you're doing great today!",

                  ),
                )
            ),
            Container(
              height: 100,
              width: queryData.size.width/1.55,
              padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 50),
              child: Row(
                children: <Widget>[
                  /*Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200]
                      ),
                      child: Text(
                        ),
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(81, 200, 196, 1.0)
                      ),
                      child: TextField(
                        onTap: (){},
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/forum');
                            },
                          ),//Icon(Icons.search, color: Colors.white,),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Monterrat'),
                          hintText: "Search for a Post",
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 20,),
                  /*Icon(Icons.camera_alt, color: Colors.grey[800], size: 30,)*/
                ],
              ),
              //HERE WE'LL ADD CREATE POST BAR

            ),

            Container(
              height: 90,

              padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image(image: AssetImage('lib/se/icons8-male-user-150.png')),

                  //Icon(Icons.person, color: Colors.grey,),
                  SizedBox(width: queryData.size.width/20,),
                  Expanded(
                    child: Container(
                      width: queryData.size.width/1.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,

                        border: Border.all(
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          width: 2,
                        ),
                      ),
                      //shape: BoxShape.circle,


                      child: TextField(
                        onTap: ()async {
                          result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForumDetailPage()),
                          );
                          //Navigator.of(context).pushNamed('/forumpost');

                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          //prefixIcon: Icon(Icons.search, color: Colors.grey,),

                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                          hintText: "What's on your mind?",
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              //HERE WE'LL ADD CREATE POST BAR

            ),
                Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //<< any widgets added
                      Container(
                        height: queryData.size.height/2.5,
                        child: ListView.builder(

                          //scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        //here your code
                        scrollDirection: Axis.vertical,
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                              return makeFeed(
                                  userName: (entries[index].userName).toString(),
                                  userImage : (entries[index].userImage),
                                  feedTime: (entries[index].feedTime).toString(),
                                  feedText: (entries[index].feedText).toString(),
                                  feedImage : (entries[index].feedImage).toString(),
                                  likes:  (entries[index].likes).toString(),
                                  index_of_post : index.toString(),

                              );/*Container(
                              height: 100,
                              color: Colors.amber[colorCodes[index]],
                              child: Center(child: Text('Entry ${entries[index]}')),
                              );*/
                        },
                        //separatorBuilder: (BuildContext context, int index) => const Divider(),
                        )
                        ),

                        //Divider(),//<< any widgets added
                        ],
                        ),

            /*Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      *//*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text("Stories", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.2),),
                          Text("See Archive"),
                        ],
                      ),*//*
                      //SizedBox(height: 20,),
                      *//*Container(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeStory(
                                storyImage: 'assets/images/story/story-1.jpg',
                                userImage: 'assets/images/aatik-tasneem.jpg',
                                userName: 'Aatik Tasneem'
                            ),
                            makeStory(
                                storyImage: 'assets/images/story/story-3.jpg',
                                userImage: 'assets/images/aiony-haust.jpg',
                                userName: 'Aiony Haust'
                            ),
                            makeStory(
                                storyImage: 'assets/images/story/story-4.jpg',
                                userImage: 'assets/images/averie-woodard.jpg',
                                userName: 'Averie Woodard'
                            ),
                            makeStory(
                                storyImage: 'assets/images/story/story-5.jpg',
                                userImage: 'assets/images/azamat-zhanisov.jpg',
                                userName: 'Azamat Zhanisov'
                            ),
                          ],
                        ),
                      ),
                      *//*SizedBox(height: 40,),
                      makeFeed(
                          userName: 'R Van Persie',
                          userImage: 'lib/se/icons8-male-user-150.png',
                          feedTime: '1 hr ago',
                          feedText: result,
                          feedImage: ''
                      ),
                      makeFeed(
                          userName: 'Aiony Haust',
                          userImage: 'lib/se/icons8-male-user-150.png',
                          feedTime: '1 hr ago',
                          feedText: 'All the Lorem Ipsum generators on the Internet tend to repeat predefined.',
                          feedImage: ''
                      ),
                      makeFeed(
                          userName: 'Azamat Zhanisov',
                          userImage: 'lib/se/icons8-female-profile-100.png',
                          feedTime: '3 mins ago',
                          feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                          feedImage: ''
                      ),
                      makeFeed(
                          userName: 'Azamat Zhanisov',
                          userImage: 'lib/se/icons8-female-profile-100.png',
                          feedTime: '3 mins ago',
                          feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                          feedImage: ''
                      ),
                    ],
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        items:
        [
          BottomNavigationBarItem(
            icon: new Icon(Icons.spa,color: Colors.white,size: 50,),
            title: Text(' ',style: TextStyle(color: _curIndex == 0 ? Colors.white : Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message,color: Colors.white,size: 50,),
            title: Text(' ',),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
            switch (_curIndex) {
              case 0:
                Navigator.of(context).pushNamed('/inhale');
                break;
              case 1:
                Navigator.of(context).pushNamed('/login');
                break;
              case 2:
                Navigator.of(context).pushNamed('/forum');
                break;
              case 3:
                Navigator.of(context).pushNamed('/chat');
                break;
              case 4:
                Navigator.of(context).pushNamed('/inhale');
                break;
            }
          });
        },
      ),
    );

  }


  /*Widget makeStory({storyImage, userImage, userName}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(storyImage),
              fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.1),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: AssetImage(userImage),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Text(userName, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
*/
  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage, likes,index_of_post}) {
    var queryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(right: 20 ,left:20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(
                            image: AssetImage(userImage),

                            //fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(userName, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
                      SizedBox(height: 3,),
                      Text(feedTime, style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, size: 30, color: Color.fromRGBO(81, 200, 196, 1.0),),
                onPressed: () {

                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(feedText, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5, letterSpacing: .7),),
          SizedBox(height: 20,),
          feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(feedImage),
                    fit: BoxFit.cover
                )
            ),
          ) : Container(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
                //key: ,
                children: <Widget>[
                  makeLike(),
                  Transform.translate(
                    offset: Offset(-5, 0),
                  ),
                  SizedBox(width: 5,),

                  Text('$likes', style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
                ],
              ),
              Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Row(
          children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 2,),
          //borderRadius: BorderRadius.circular(50),
        ),
        child: GestureDetector(

          child: Center(
            child: Row(

              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: queryData.size.width/10,
                ),
                Icon(Icons.thumb_up, color: Color.fromRGBO(81, 200, 196, 1.0), size: 18),
                SizedBox(width: queryData.size.width/40,),
                Text("Like", style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0)),textAlign: TextAlign.center,),
                SizedBox(width: queryData.size.width/9,
                ),
              ],
            ),
          ),
          onTap: ()  {
            print("here");
            setState(() {
              int y = int.parse(likes);
              y++;
              print(y);
              likes = int.parse(likes);
              likes = y;
              //likes = y.toString();
              print(likes);
              entries[int.parse(index_of_post)].likes = likes;
            });

          },
        )
    ),
    Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 2,),
    //borderRadius: BorderRadius.circular(50),
    ),
    child: GestureDetector(
    onTap: () {},
    child: Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
    SizedBox(width: queryData.size.width/25,
    ),
    Icon(Icons.chat, color: Color.fromRGBO(81, 200, 196, 1.0), size: 18),
    SizedBox(width: queryData.size.width/40,),
    Text("Comment", style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0)),textAlign: TextAlign.center,),
    SizedBox(width: queryData.size.width/15,
    ),
    ],
    ),
    ),
    )
    ),
    ]),
              //makeCommentButton(),
              //makeShareButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Color.fromRGBO(81, 200, 196, 1.0),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }

 /* Widget makeLikeButton({likes_at_post}) {
    var queryData = MediaQuery.of(context);
    return;
  }
*/
/* Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
            SizedBox(width: 60,),
            Text("Comment", style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
}

  Widget makeShareButton() {
    *//*return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share, color: Colors.grey, size: 18),
            SizedBox(width: 5,),
            Text("Share", style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );*//*
  }*/
}

class ForumDetailPage extends StatelessWidget {
  int current_index = 0;
  String post = 'How are you';
  final List<Widget> children = [];
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    String post_content = '';
    return new Scaffold(

      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {

            return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Create a Post", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 200, 196, 1.0), fontSize:
                              35.0), )
                            ],
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: queryData.size.width/3,
                                padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Color.fromRGBO(81, 200, 196, 1.0),
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {Navigator.pushNamed(context, '/forum');},
                                    child: Center(
                                      child: Text(
                                        'back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                              SizedBox(width: queryData.size.width/3),
                              Container(
                                height: 100.0,
                                width: queryData.size.width/3,
                                padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Color.fromRGBO(81, 200, 196, 1.0),
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () async {
                                    if(_formKey.currentState.validate()) {
                                       _formKey.currentState.save();

                                       entries.add(Posts(userName: username,
                                           userImage: 'lib/se/icons8-male-user-150.png',
                                           feedTime: '1 s ago',
                                           feedText: post_content,
                                           feedImage: '',
                                           likes: 0
                                       )
                                        //   Navigator.pushNamed(context, '/forum');
                                       );
                                       Navigator.pushNamed(context, '/forum');
                                    }
    //Navigator.pop(context, post);
                                      //Navigator.pushNamed(context, '/forum');
                                    },
                                    child: Center(
                                      child: Text(
                                        'post',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),

                              )
                            ]
                        ),
                        /*Container(

                    padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.minimize),
                        iconSize: 100,
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/forum');
                        },
                      )
                    ],
                              ),
                      ),*/
                        Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('lib/se/icons8-male-user-150.png'),
                              height: 50,

                            ),
                            SizedBox(width: queryData.size.width/20),
                            Text(
                              username,
                              style: TextStyle(
                                  color: Color.fromRGBO(81, 200, 196, 1.0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: queryData.size.width/20),
                              Container(
                                  height: queryData.size.height/5,
                                  width: queryData.size.width/1.1225,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueAccent)
                                  ),
                                  child:  Form(
                                    key: _formKey,

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: <Widget>[
                                        TextFormField(

                                          style:TextStyle(
                                              fontSize: 20.0,
                                              height: 3.0,

                                              color: Colors.black
                                          ),
                                          decoration: const InputDecoration(
                                            //icon: Icon(Icons.person),
                                            contentPadding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                                            border: InputBorder.none,
                                            hintText: 'Please type in your post here',

                                          ),
                                          validator: (value){
                                            if (value == null || value.isEmpty) {
                                              return 'Posts can\'t be empty.';
                                            }
                                            return null;

                                          },
                                          onSaved: (val) => post_content = val,

                                        ),

                                      ],
                                    ),
                                  )
                              ),
                              SizedBox(width: queryData.size.width/20)
                            ]
                        ),

                      ] ),
                )
            );
          }
      ),
/*
     bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
    //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
         items:
    [
    BottomNavigationBarItem(

    icon: Icon(Icons.home),
    title: Text('Home'),
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.white,size: 60,),
        title: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        title: Text('Business'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        title: Text('School'),
      ),
    ]
    )*/


    );
  }
}
/*
class BottomNavigationBar extends StatefulWidget {


  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}



class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          onTap:() {} ,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          items:
          [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,size: 60,),
              title: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ]
      )
      ],
    ),);
  }
}*/

/*
class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override


  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return new Scaffold(

        appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
    title: new Text(
    "Comments",
    textScaleFactor: 1.3,
    ),
    ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //<< any widgets added
          Container(
              height: queryData.size.height/2.2,
              child: ListView.builder(

                //scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                //here your code
                scrollDirection: Axis.vertical,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeFeed(
                    userName: (entries[index].userName).toString(),
                    userImage : (entries[index].userImage).toString(),
                    feedTime: (entries[index].feedTime).toString(),
                    feedText: (entries[index].feedText).toString(),
                    feedImage : (entries[index].feedImage).toString(),
                    likes:  (entries[index].likes).toString(),
                    index_of_post : index.toString(),

                  );*/
/*Container(
                              height: 100,
                              color: Colors.amber[colorCodes[index]],
                              child: Center(child: Text('Entry ${entries[index]}')),
                              );*//*

                },
                //separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
          ),

          //Divider(),//<< any widgets added
        ],
      ),

      Expanded(

        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromRGBO(81, 200, 196, 1.0)
          ),
          child: TextField(
            onTap: (){},
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/forum');
                },
              ),//Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
              hintText: "Search for a Post",
            ),
          ),
        ),
      ),


    );
  }
  Widget makeComment({userName, userImage, feedTime, feedText, feedImage, likes,index_of_post, comment}) {
    var queryData = MediaQuery.of(context);
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            username+": ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(width: queryData.size.width/20 ),
          Text(comment,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),),
        ],
      ),

    );
  }

}
*/
