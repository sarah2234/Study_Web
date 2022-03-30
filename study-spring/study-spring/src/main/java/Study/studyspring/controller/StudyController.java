package Study.studyspring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyController {
    // GetMapping에서 Get은 HTTP 프로토콜의 GET 메소드
    @GetMapping("hello") // 웹 어플리케이션에서 "hello"가 들어오면 아래의 메소드 호출 (localhost:8000/hello)
    public String hello(Model model) {
        model.addAttribute("data", "hello!!"); // hello.html에서 ${data}가 "hello!!"로 치환됨
        return "hello"; // View Resolver가 resources/templates에서 hello.html을 찾음
        // resources:templates/ + {ViewName} + '.html'
    }
}
