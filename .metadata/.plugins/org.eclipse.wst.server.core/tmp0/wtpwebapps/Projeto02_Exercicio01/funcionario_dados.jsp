<%@page import="br.com.portoseguro.model.Funcionario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	if (request.getMethod().equals("GET")) {
	%>
	<h1>Dados do Funcionário</h1>

	<form action="" method="post">
		<label>Nome</label><br /> <input type="text" name="txtNome"><br />
		<label>Data de Nascimento</label><br /> <input type="date"
			name="txtDataNasc"><br /> <label>Cargo</label><br /> <input
			type="text" name="txtCargo"><br /> <label>Salário</label><br />
		<input type="text" name="txtSalario"><br /> <input
			type="submit" value="Enviar">
	</form>

	<%
	} else {
	String nome = request.getParameter("txtNome");
	String data = request.getParameter("txtDataNasc");
	Date dataNasc = new SimpleDateFormat("yyyy-MM-dd").parse(data);

	String cargo = request.getParameter("txtCargo");

	double salario = Double.parseDouble(request.getParameter("txtSalario"));

	out.print("<h1>Dados do funcionário - JSP</h1>");
	
	Funcionario f = new Funcionario(nome, dataNasc, cargo, salario);
	%>
	
	<h1>Nome</h1>
	<label><%= nome %></label>
	<h1>Data de Nasc</h1>
	<label><%= dataNasc %></label>
	<h1>Cargo</h1>
	<label><%= cargo %></label>
	<h1>Salario</h1>
	<label><%= salario %></label>
	<h1>IRPF</h1>
	<label><%= nome %>${funcionario.irpf}</label>
	<h1>Salario Liquido</h1>
	<label><%= nome %>${funcionario.salarioLiquido}</label>

	<%
	}
	%>
</body>
</html>