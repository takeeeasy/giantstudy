<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
setTimeout("location.href='http://www.example.com/'",5000);

</script>
</head>
<body>
   <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        
        <h4>"${exception.getMessage()}"</h4>

		<ul>${exception.getStackTrace()}"
			<li>"${est.toString()}"</li>
		</ul>

    </section>
</body>
</html>