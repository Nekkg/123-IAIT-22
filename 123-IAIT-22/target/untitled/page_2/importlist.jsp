<% if (session.getAttribute("References") == null) response.sendRedirect(request.getContextPath()); %>
<%@ page language="java" contentType="text/html;charset=utf-8"%>

<%
response.setContentType("text/html;charset=windows-1251");
response.getWriter().write(

"<!DOCTYPE html>" +

"<html>" +
    "<head>" +
        "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">" +
        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>" +
        "<link rel=\"stylesheet\" href=\"#\">" +
        "<title>123-IAIT-22</title>" +

        "<style>" +
          "div{" +
            "padding: 5px;" +
            "margin: 5px;" +
          "}" +
            ".test{" +
                "background-color: white;" +
                "border-radius: 15px;" +
                "border: 2px slategrey solid;" +
                "padding: 5px;" +
                "margin: 5px;" +
            "}" +

            "#one{" +
                "background-color: rgb(152, 152, 211);" +
                "border-radius: 15px;" +
                "border: 2px slategrey solid;" +
                "padding: 5px;" +
                "margin: 5px;" +
            "}" +
            ".similar{" +
                "border: 2px slategrey solid;" +
                "padding: 5px;" +
                "margin: 5px;" +
                "border-radius: 15px;" +
            "}" +
        "</style>" +

    "</head>" +
    "<body>" +
      "<div style=\"background-color: white;\">" +
        "<div class=\"container\" style=\"height: auto;\">" +
          "<div class=\"row\" style=\"margin-bottom: 3px;\">" +


              "<div class=\"col l12 m12 s12\">" +
                "<div style=\"font-size: 24px;\">Импортированные объекты:</div>" +
              "</div>"
);
%>

<%@ page import="classes.Flat" %>
<%
String bal; String stud;
Object[] references = (Object[]) session.getAttribute("References");
for (int i = 0; i < references.length; i++) {
   if (((Flat) references[i]).Balcony) bal = "есть";
   else bal = "нет";

   if (((Flat) references[i]).RoomAmount == 0) stud = "студия";
   else stud = "" + (int) ((Flat) references[i]).RoomAmount;

   response.setContentType("text/html;charset=windows-1251");
   response.getWriter().write(

              "<div class=\"col l12 m12 s12 hide-on-small-only hide-on-med-only similar\">" +
                "<div style=\"font-size: 18px;\">Адрес: " + ((Flat) references[i]).Location + "</div>" +
                "<div>" +

                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr>" +
                      "<th>" + "комнат: " + stud + "</th>" +
                      "<th>" + "материал стен: " + ((Flat) references[i]).WallsMaterial + "</th>" +
                      "<th>" + "балкон: " + bal + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "сегмент: " + ((Flat) references[i]).Segment + "</th>" +
                      "<th>" + "площадь квартиры: " + ((Flat) references[i]).FlatArea + "</th>" +
                      "<th>" + "до метро: " + (int) ((Flat) references[i]).MetroDistance + " минут" + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "этаж: " + (int) ((Flat) references[i]).Storey + "/" + (int) ((Flat) references[i]).StoreyAmount + "</th>" +
                      "<th>" + "площадь кухни: " + ((Flat) references[i]).KitchenArea + "</th>" +
                      "<th>" + "состояние: " + ((Flat) references[i]).Condition + "</th>" +
                    "</tr> " +
                  "</table>" +
                "</div>" +

                "<input type=\"button\" value=\"Рассчитать\" onClick='location.href=\"import_of_analogs" + "?flatindex=" + i + "\"'>" +
                "<br><br>" +

              "</div>" +

              "<div class=\"col l12 m12 s12 hide-on-small-only hide-on-large-only similar\">" +
                "<div style=\"font-size: 18px;\">Адрес: " + ((Flat) references[i]).Location + "</div>" +
                "<div>" +
                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr>" +
                      "<th>" + "комнат: " + stud + "</th>" +
                      "<th>" + "площадь кухни: " + ((Flat) references[i]).KitchenArea + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "сегмент: " + ((Flat) references[i]).Segment + "</th>" +
                      "<th>" + "балкон: " + bal + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "этаж: " + (int) ((Flat) references[i]).Storey + "/" + (int) ((Flat) references[i]).StoreyAmount + "</th>" +
                      "<th>" + "до метро: " + (int) ((Flat) references[i]).MetroDistance + " минут" + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "материал стен: " + ((Flat) references[i]).WallsMaterial + "</th>" +
                      "<th>" + "состояние: " + ((Flat) references[i]).Condition + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "площадь квартиры: " + ((Flat) references[i]).FlatArea + "</th>" +
                    "</tr>" +
                  "</table>" +
                "</div>" +

                "<input type=\"button\" value=\"Рассчитать\" onClick='location.href=\"import_of_analogs" + "?flatindex=" + i + "\"'>" +
                "<br><br>" +

              "</div>" +

              "<div class=\"col l12 m12 s12 hide-on-med-only hide-on-large-only similar\">" +
                "<div style=\"font-size: 18px;\">Адрес: " + ((Flat) references[i]).Location + "</div>" +
                "<div>" +
                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr><th>" + "комнат: " + stud + "</th></tr>" +
                    "<tr><th>" + "сегмент: " + ((Flat) references[i]).Segment + "</th></tr>" +
                    "<tr><th>" + "этаж: " + (int) ((Flat) references[i]).Storey + "/" + (int) ((Flat) references[i]).StoreyAmount + "</th></tr>" +
                    "<tr><th>" + "материал стен: " + ((Flat) references[i]).WallsMaterial + "</th></tr>" +
                    "<tr><th>" + "площадь квартиры: " + ((Flat) references[i]).FlatArea + "</th></tr>" +
                    "<tr><th>" + "площадь кухни: " + ((Flat) references[i]).KitchenArea + "</th></tr>" +
                    "<tr><th>" + "балкон: " + bal + "</th></tr>" +
                    "<tr><th>" + "до метро: " + (int) ((Flat) references[i]).MetroDistance + " минут" + "</th></tr>" +
                    "<tr><th>" + "площадь квартиры: " + ((Flat) references[i]).FlatArea + "</th></tr>" +
                  "</table>" +
                "</div>" +

                "<input type=\"button\" value=\"Рассчитать\" onClick='location.href=\"import_of_analogs" + "?flatindex=" + i + "\"'>" +
                "<br><br>" +

              "</div>");
}
%>
          </div>
        </div> 
      </div>  
    </body>
</html>