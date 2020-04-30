import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:crescenttv/model/Article.dart';

class DetailPage extends StatelessWidget {
  Article article;
  DetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LATEST NEWS"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.bookmark_border,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.open_in_new
                ),
              )
          ),
        ],
      ),
      body: Container(child:
      ListView(
        children: <Widget>[
          //Text(article.title),
          //Expanded(child: Image.network(article.urlToImage)),
          CachedNetworkImage(
            imageUrl: "http://www.channelstv.com/wp-content/uploads/2020/04/eu-Nigeria.jpg",
            imageBuilder: (context, imageProvider) {
              return Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.publishedAt+" "),
                  ),
                ),
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => Container(
              width: 72.0,
              height: 72.0,
              child: Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              '',
              fit: BoxFit.cover,
              width: 72.0,
              height: 72.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Html(
                defaultTextStyle: TextStyle(fontFamily: 'HelveticaNeue', fontSize: 18.0),

                customTextAlign: (d){
                  return TextAlign.justify;
                },
                onLinkTap: (url) {
                  // open url in a webview
                  print(url);
                },
                data: """
            <p><em><strong>The European Union has donated 50 million Euros to Nigeria for the fight against the COVID-19 pandemic.</strong></em></p><p>Ambassador Ketil Karlsen who led the delegation made the announcement on Tuesday during a visit to President Muhammadu Buhari at the Presidential Villa.</p><p>He said that the donation is the single largest donation to any African country.</p><p>President Muhammadu Buhari on his part, commended the European Union for donating the sum of N21 billion (50 million Euros) to support Nigeria’s efforts at controlling the spread of the coronavirus pandemic.</p><p><strong>READ ALSO:</strong> <a href="https://www.channelstv.com/2020/04/14/buhari-praises-eu-for-giving-nigeria-n21bn-to-fight-covid-19/"><em>Buhari Praises EU For Giving Nigeria N21bn To Fight COVID-19</em></a></p><p>He said the donation would go a long way in supporting Nigeria’s efforts at controlling and containing the virus to prevent community spread, as well as revitalise the national health care systems.</p><p>The President used the occasion to express sincere condolences of the Government and people of Nigeria to EU-member countries and families who lost their loved ones as a result of the COVID-19 pandemic.</p><p>‘‘Our thoughts and prayers are with the families, friends and communities impacted. We are confident from history that the resilience of Europe and our global collective will enable us to emerge stronger from this tragedy.</p><p>‘‘Although the EU is facing significant challenges due to this pandemic, I am indeed touched and grateful that the European Union still had the vision and foresight to remember its friends, partners and allies across the world,’’ he said.</p><p>The President also lauded EU on the recent launch of the “Team Europe” package to support countries in the fight against the coronavirus pandemic and its consequences.</p><p>He noted that the intervention, which is a collaboration between EU, its member states, and financial institutions such as the European Investment Bank and the European Bank for Reconstruction and Development, would go a long way in ensuring the impact of this pandemic was controlled and contained.</p><p>‘‘Indeed, this brotherly support will save millions of lives. Nigeria, Africa and many beneficiary countries across the world will remain grateful for generations to come,’’ he said.</p><p>The President told the delegation that his administration had done a lot to date in the fight against COVID-19.</p><p>‘‘So far, the number of confirmed cases in Nigeria is 343. Our efforts as a Government have focused on controlling and containing the virus to prevent community spread.</p><p>‘‘I want to assure you that in this fight, Nigerians are united and by the grace of God and the continued support from our partners, we shall succeed,’’ he said.</p><p>In his remarks, Ambassador Karlsen described the donation, channelled through the UN COVID-19 basket fund as, so far, the largest single contribution to the response in Nigeria and the largest support that EU is providing anywhere outside Europe.</p><p>‘‘We heard your call for assistance and the EU has reacted swiftly as a demonstration of our true partnership,’’ he said.</p><p>The EU Ambassador congratulated the President for ‘‘a very powerful address to the nation last night’’, stressing ‘‘indeed the current situation is no joke and we wish to commend you for taking bold and necessary measures.’’</p><p>He also announced that the Union was mobilising other sources of funding, noting that they have already paid 1.2 million Euros to UNICEF, and goods purchased through that funding are expected in the country soon.</p>
            """
            ),
          )
        ],
      )),
    );
  }
}
