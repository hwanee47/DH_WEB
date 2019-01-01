package com.daehan.common.logger;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect

public class LoggerAspect {

	// LoggerAspect : Controller, Service 실행 될 때, 어떤 계층의 어떤 메소드가 실행되었는지 보여주는 역할

	protected Log log = LogFactory.getLog(LoggerAspect.class);

	static String name = "";

	static String type = "";

	// joinpoint는 메소드

	// 해당 메소드의 클래스 이름을 반환

	// package 구조 : first.common.controller.jungaController.junga 같은

	@Around("execution(* com.daehan..*.*Controller.*(..)) or execution(* com.daehan..service.*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
	
		type = joinPoint.getSignature().getDeclaringTypeName(); //해당 메소드의 클래스이름을 반환
		
		if(type.indexOf("Controller") > -1){ //'Controller' 문자열이 포함되어 있으면
		
			name = "Controller \t";
		
		}else if(type.indexOf("Service")>-1){
		
			name = "Service \t";
		
		}
		
		log.debug(name + type + "." + joinPoint.getSignature().getName() + "()"); //메소드이름
		return joinPoint.proceed();
	
	}

}