package br.com.portoseguro.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.portoseguro.model.Funcionario;

@WebServlet("/employee")
public class FuncionarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FuncionarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String nome = request.getParameter("txtNome");
			String data = request.getParameter("txtDataNasc");
			Date dataNasc = new SimpleDateFormat("yyyy-MM-dd").parse(data);

			String cargo = request.getParameter("txtCargo");

			double salario = Double.parseDouble(request.getParameter("txtSalario"));

			Funcionario funcionario = new Funcionario(nome, dataNasc, cargo, salario);
			
			request.setAttribute("funcionario", funcionario);
			
			request.getRequestDispatcher("/WEB-INF/pages/resultado.jsp").forward(request, response);
		} catch (Exception e) {
			
		}
	}

}
