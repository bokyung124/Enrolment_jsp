/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.75
 * Generated at: 2023-06-15 07:49:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class course_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/top_prof.jsp", Long.valueOf(1686813774000L));
    _jspx_dependants.put("/user.jsp", Long.valueOf(1686813774000L));
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link href=\"style.css?after\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>강의정보 수정</title>\n");
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
      out.write("			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n");
      out.write("			");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
      out.write("<link href = \"style.css?after\" rel = \"stylesheet\" type = \"text/css\">\n");
      out.write("</head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<div class = \"topButton\">\n");
      out.write("<table class=\"top\" width=\"75%\" align=\"center\">\n");
      out.write("	<tr>\n");
      out.write("		<td>강의 조회</td>\n");
      out.write("		<td><a href=\"course_update.jsp\">강의 수정</a></td>\n");
      out.write("		<td><a href=\"student_prof.jsp\">수강신청학생 조회</a></td>\n");
      out.write("		<td>지도학생 조회</td>\n");
      out.write("		<td>공지사항</td>\n");
      out.write("	</tr>\n");
      out.write("</table>\n");
      out.write("</div>");
      out.write("\n");
      out.write("	<br>\n");
      out.write("	");

	Connection myConn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String mySQL = "";
	PreparedStatement pstmt = null;
	int nYear = 0;
	int nSemester = 0;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "leebk";
	String passwd = "1124";
	String dbdriver = "oracle.jdbc.driver.OracleDriver"; 
	
	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		myConn.setAutoCommit(false);
		stmt = myConn.createStatement();
		
		CallableStatement cstmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		nYear = cstmt.getInt(1)-2000;
		
		CallableStatement cstmt2 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
		cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt2.execute();
		nSemester = cstmt2.getInt(1);
		
      out.write("\n");
      out.write("	<script>document.getElementById('semesterInfo').innerHTML = \"");
      out.print(nYear);
      out.write('년');
      out.write(' ');
      out.write(' ');
      out.print(nSemester);
      out.write("학기\";</script>\n");
      out.write("	");

	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	} catch (ClassNotFoundException ex) {
		System.err.println("ClassNotFoundException: " + ex.getMessage());
	} finally{
	      if(stmt != null)
		         try{myConn.commit(); stmt.close();
		         }catch(SQLException e){System.err.println("SQLException: " + e.getMessage());}
		   }
	
      out.write("\n");
      out.write("\n");
      out.write("	<br>\n");
      out.write("	<br>\n");
      out.write("\n");
      out.write("	<div>\n");
      out.write("		<input type=\"text\" id=\"semesterInfo\"\n");
      out.write("			value=\"");
      out.print( nYear );
      out.write('년');
      out.write(' ');
      out.print( nSemester );
      out.write("학기\" readonly></input>\n");
      out.write("	</div>\n");
      out.write("\n");
      out.write("	<br>\n");
      out.write("	<br>\n");
      out.write("\n");
      out.write("	");

	
 	mySQL = "select t.t_id, c.c_id, c.c_id_no, c.c_name, t.t_time, t.t_loc, t.t_max, t.p_id from teach t, course c where p_id = '" 
 			+ session_id 
 			+ "' and t.c_id = c.c_id and t.c_id_no = c.c_id_no and t_year = ? and t_semester = ?";
	
	
	pstmt = myConn.prepareStatement(mySQL);
	pstmt.setInt(1, nYear);
	pstmt.setInt(2, nSemester);
  	rs = pstmt.executeQuery();
	
      out.write("\n");
      out.write("\n");
      out.write("	<table width=\"70%\" align=\"center\" class=\"deleteTable\" border>\n");
      out.write("		<form method=\"post\" action=\"course_update_inside.jsp\">\n");
      out.write("			<br>\n");
      out.write("			<tr>\n");
      out.write("				<th>수업번호</th>\n");
      out.write("				<th>과목번호</th>\n");
      out.write("				<th>분반</th>\n");
      out.write("				<th>과목명</th>\n");
      out.write("				<th>교시</th>\n");
      out.write("				<th>장소</th>\n");
      out.write("				<th>수강정원</th>\n");
      out.write("				<th>수정</th>\n");
      out.write("			</tr>\n");
      out.write("			");

		
		while (rs.next()) {
			String tid = rs.getString("t_id");
			String cid = rs.getString("c_id");
			Integer cidno = rs.getInt("c_id_no");
			String cname = rs.getString("c_name");
			Integer ttime = rs.getInt("t_time");
			String tloc = rs.getString("t_loc");
			Integer tmax = rs.getInt("t_max");
		
		
      out.write("\n");
      out.write("\n");
      out.write("			<tr>\n");
      out.write("				<td>");
      out.print(tid);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(cid);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(cidno);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(cname);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(ttime);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(tloc);
      out.write("</td>\n");
      out.write("				<td>");
      out.print(tmax);
      out.write("</td>\n");
      out.write("				<td><a id=\"Wcolor\"\n");
      out.write("					href=\"course_update_inside.jsp?t_id=");
      out.print(tid);
      out.write("\"> 수정 </a></td>\n");
      out.write("					\n");
      out.write("				<script>\n");
      out.write("				document.getElementsByName(\"tid\")[0].value = '");
      out.print(tid);
      out.write("';\n");
      out.write("				</script>\n");
      out.write("\n");
      out.write("				");
      out.write("\n");
      out.write("\n");
      out.write("			</tr>\n");
      out.write("		</form>\n");
      out.write("		");

	}
			
	
		
      out.write("\n");
      out.write("\n");
      out.write("	</table>\n");
      out.write("\n");
      out.write("\n");
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
