<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%!  public String getCookieValue(Cookie[] cookies, String cookieName) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals(cookieName)) {
					return cookie.getValue();
				}
			}
			return null;
		}
	%>
 <% 
 	Cookie[] cookies = request.getCookies();
  	String cookieUserId = getCookieValue(cookies, "userId");
  	
  	if(cookieUserId != null) {
  		 session.setAttribute("userId", cookieUserId);
  	}
  %>
