import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL 생성하는데 도움을 주는 클래스
final uri = Uri.parse('https://dailylifethatsnormal.tistory.com/');

class HomeScreen extends StatelessWidget {
  // WebViewController 선언
  WebViewController webViewController = WebViewController()

      // Javascript 제한 없이 실행될 수 있도록 함
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      // WebViewController 의 loadRequest() 함수 실행
      ..loadRequest(uri); // 컨트롤러 변수 생성

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : Color(0xFFFFB8A2),
        title: Text('코딩 연습장'),
        centerTitle: true,

        // 왼쪽에 아이콘 버튼을 추가하기 위한 leading 속성
        // 여러 아이콘을 배치하기 위해 Row 사용
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: (){
                webViewController.goBack();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
              ),
            ),
            IconButton(
                onPressed: (){
                  webViewController.goForward();
                },
                icon: Icon(
                  Icons.arrow_forward_rounded,
                )
            ),
          ],
        ),

        // leadingWidth로 왼쪽의 아이콘들이 잘 배치될 수 있도록 공간 확보
        leadingWidth: 100,  // 필요한 만큼의 공간을 할당 (100 픽셀)

        // AppBar 에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
            // 아이콘을 눌렀을 때 실행할 콜백 함수
            onPressed: (){
              // 웹뷰 위젯에서 사이트 전환
              webViewController.loadRequest(uri);
            },
            // 홈 버튼 아이콘 설정
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      // AppBa
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}