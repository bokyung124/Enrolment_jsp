/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.75
 * Generated at: 2023-06-16 08:45:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class all_005fcourse_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/top.jsp", Long.valueOf(1686846378000L));
    _jspx_dependants.put("/user.jsp", Long.valueOf(1686846529000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');

int nTotalCourse = 0;
int nTotalUnit = 0;

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<title>수강신청 조회</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("	");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link href=\"style.css?after\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<table class=\"top\" width=\"500px\" align=\"right\">\n");
      out.write("	<tr>\n");
      out.write("		<td>\n");
      out.write("			");
 String session_id = (String) session.getAttribute("user");
		if (session_id == null) {
      out.write("\n");
      out.write("			<p>로그인을 해주세요.</p> ");
} else {
      out.write("\n");
      out.write("			<p>");
      out.print(session_id);
      out.write("님 방문을 환영합니다.\n");
      out.write("			</p>\n");
      out.write("		</td>\n");
      out.write("		<td>\n");
      out.write("			");
 if (session_id.length() == 7) {
      out.write(" <a href=\"update.jsp\">마이페이지</a> ");
} else if (session_id.length() == 5) {
      out.write("\n");
      out.write("			<a href=\"update_prof.jsp\">마이페이지</a> ");
 }
				else { 
      out.write("\n");
      out.write("				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> ");
} 
      out.write(' ');
}
      out.write("\n");
      out.write("		</td>\n");
      out.write("		<td>\n");
      out.write("			");
 String log;
			if (session_id == null)
			log = "<a href=login.jsp>로그인</a>";
			else log = "<a href=logout.jsp>로그아웃</a>"; 
      out.write("\n");
      out.write("			<p class=\"title\">");
      out.print(log);
      out.write("</p>\n");
      out.write("		</td>\n");
      out.write("\n");
      out.write("		<td></td>\n");
      out.write("	</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');
      out.write('	');
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link href=\"style.css?after\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<div class=\"topButton\">\n");
      out.write("	<table class=\"top\" width=\"75%\" align=\"center\">\n");
      out.write("		<tr>\n");
      out.write("			<td><a href=\"all_course.jsp\">전체과목 조회</a></td>\n");
      out.write("			<td><a href=\"insert.jsp\">수강신청 입력</a></td>\n");
      out.write("			<td><a href=\"delete.jsp\">수강신청 조회</a></td>\n");
      out.write("			<td><a href=\"cart.jsp\">장바구니</a></td>\n");
      out.write("			<td><a href=\"history.jsp\">개별수강 이력</a></td>\n");
      out.write("		</tr>\n");
      out.write("	</table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write('\n');
      out.write('	');

    
    if (session_id == null || session_id.isEmpty()) { // session_id가 null이거나 비어있을 경우 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
    } else {
        String dbdriver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "leebk"; 
        String passwd = "1124"; 
        
        try {
            Class.forName(dbdriver);
            Connection connection = DriverManager.getConnection(url, user, passwd);
            Statement statement = connection.createStatement();
            
            CallableStatement cstmt = connection.prepareCall("{? = call Date2EnrollYear(SYSDATE)}"); //stored function 이용
            cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
            
            CallableStatement cstmt2 = connection.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
            cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
            
            cstmt.execute();
            cstmt2.execute();
            
            int nYear = cstmt.getInt(1);
            int nSemester = cstmt2.getInt(1);
            
            String _param = request.getParameter("searchText");
            String _param2 = request.getParameter("searchMajor");
            
         
            String query =
                  "SELECT c.c_id, c.c_id_no, c.c_name, c_major, t.t_semester, t.t_time, t.t_loc, p.p_name "
                    + "FROM course c  "
                    + "JOIN teach t ON c.c_id = t.c_id JOIN professor p ON t.p_id = p.p_id AND c.c_id_no = t.c_id_no WHERE t.t_year = " + nYear%100 + " AND t.t_semester = " + nSemester ;
            if ( _param != null) {
               query += " AND c.c_name LIKE '%" + _param + "%'";
            }
            else if ( _param2 != null) {
                query += " AND c.c_major LIKE '%" + _param2 + "%'";
             }
            System.out.println("query : " + query);
                    /* + "JOIN enroll ON course.c_id = enroll.c_id AND course.c_id_no = enroll.c_id_no " */
                    /* + "WHERE enroll.s_id = '" + session_id + "'"; */
            ResultSet resultSet = statement.executeQuery(query);
            
            
      out.write("\n");
      out.write("	<br>\n");
      out.write("	<br>\n");
      out.write("	<br>\n");
      out.write("\n");
      out.write("	<table align=\"center\">\n");
      out.write("		<td>과목명</td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td>\n");
      out.write("\n");
      out.write("			<form action=\"./all_course.jsp\">\n");
      out.write("				<div id=\"SearchField\">\n");
      out.write("					<td><input type=\"text\" class=\"form-control\"\n");
      out.write("						placeholder=\"과목명 입력\" name=\"searchText\" maxlength=\"30\"></td>\n");
      out.write("					<td><button type=\"submit\" id=\"search\" class=\"searchButton\">검색</button></td>\n");
      out.write("\n");
      out.write("				</div>\n");
      out.write("			</form>\n");
      out.write("		</td>\n");
      out.write("\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td>전공</td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("		<td></td>\n");
      out.write("\n");
      out.write("		<td>\n");
      out.write("			<form action=\"./all_course.jsp\">\n");
      out.write("				<div id=\"SearchMajor\">\n");
      out.write("					<td><input type=\"text\" class=\"form-control\"\n");
      out.write("						placeholder=\"전공명 입력\" name=\"searchMajor\" maxlength=\"30\"></td>\n");
      out.write("					<td><button type=\"submit\" id=\"search\" class=\"searchButton\">검색</button></td>\n");
      out.write("\n");
      out.write("\n");
      out.write("				</div>\n");
      out.write("			</form>\n");
      out.write("		</td>\n");
      out.write("	</table>\n");
      out.write("\n");
      out.write("	<table width=\"70%\" align=\"center\" border class=\"deleteTable\">\n");
      out.write("		<br>\n");
      out.write("		<tr>\n");
      out.write("			<th>과목번호</th>\n");
      out.write("			<th>분반</th>\n");
      out.write("			<th>과목명</th>\n");
      out.write("			<th>전공</th>\n");
      out.write("			<th>교수</th>\n");
      out.write("			<th>학기</th>\n");
      out.write("			<th>시간</th>\n");
      out.write("			<th>장소</th>\n");
      out.write("		</tr>\n");
      out.write("		");
   
            while (resultSet.next()) {
                String c_id = resultSet.getString("c_id");
                int c_id_no = resultSet.getInt("c_id_no");
                String c_name = resultSet.getString("c_name");
                String p_name = resultSet.getString("p_name");
             	String c_major = resultSet.getString("c_major");
                int t_semester = resultSet.getInt("t_semester");
                String t_time = resultSet.getString("t_time");
                String t_loc = resultSet.getString("t_loc");
                
                
      out.write("\n");
      out.write("		<tr class=\"class_search\">\n");
      out.write("			<td>");
      out.print(c_id);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(c_id_no);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(c_name);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(c_major);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(p_name);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(t_semester);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(t_time);
      out.write("</td>\n");
      out.write("			<td>");
      out.print(t_loc);
      out.write("</td>\n");
      out.write("		</tr>\n");
      out.write("		");

                /* nTotalCourse++;
                nTotalUnit += 3; // 가정: 모든 과목은 3학점 */
            }
            
            resultSet.close();
            statement.close();
            connection.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
      out.write("\n");
      out.write("\n");
      out.write("	</table>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
