package com.example.cs3200fall2020team12.controllers.hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HelloController {
	
	private String message = "Hello Mike, Simon, and Anna!"; 
	
	@RequestMapping("/api/hello/string")
	public String sayHello() {
		return message;
	}
	@RequestMapping("/api/hello/object")
	public HelloObject sayHelloObject() {
		HelloObject obj = new HelloObject(message);
		return obj;
	}

}