import classes.Flat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

import static java.lang.Math.round;

@MultipartConfig
@WebServlet("/transit")
public class Transit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Object[] references = (Object[]) session.getAttribute("References");
        int flatindex = (int) session.getAttribute("FlatIndex");

        //Object[] Analogs = null;
        List<Flat> Analogs = null;
        long CounselPrice = 0;
        for (Part part : req.getParts()) {
            try {
                Analogs = Flat.Selection((Flat) references[flatindex], Flat.ParseExcel(part.getInputStream()));
                session.setAttribute("Analogs", Analogs.toArray());

                CounselPrice = round(Flat.AdjustAll((Flat) references[flatindex], Analogs));
                session.setAttribute("CounselPrice", CounselPrice);

                resp.sendRedirect(req.getContextPath() + "/calculated");

            } catch (Exception e) {
                resp.sendRedirect(req.getContextPath() + "/import_of_analogs/?incorrect=1");
            }
        }
    }
}