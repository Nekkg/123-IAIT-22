import classes.Flat;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;


@MultipartConfig
@WebServlet("/import_references")
public class Import extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object[] References = null;
        for (Part part : req.getParts()) {
            try {
                References = Flat.ParseExcel(part.getInputStream()).toArray();
                session.setAttribute("References", References);
                resp.sendRedirect(req.getContextPath() + "/import_list");
            } catch (Exception e) {
                resp.sendRedirect(req.getContextPath() + "/?incorrect=1");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //RequestDispatcher dispatcher = req.getRequestDispatcher("main");
        //dispatcher.forward(req, resp);
        resp.sendRedirect(req.getContextPath());
    }
}
