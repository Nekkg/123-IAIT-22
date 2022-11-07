<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="classes.Flat" %>

<%
String bal; String stud;
Object[] references = (Object[]) session.getAttribute("References");
int flatindex = (int) request.getSession().getAttribute("FlatIndex");

if (((Flat) references[flatindex]).Balcony) bal = "есть";
else bal = "нет";

if (((Flat) references[flatindex]).RoomAmount == 0) stud = "студия";
else stud = "" + (int) ((Flat) references[flatindex]).RoomAmount;

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
                "border-radius: 15px; " +
            "}" +
        "</style>" +
    "</head>" +
    "<body>" +
      "<div style=\"background-color: white;\">" +
        "<div class=\"container\" style=\"height: auto;\">  " +
          "<div class=\"row\" style=\"margin-bottom: 3px;\">" +

              "<div id=\"one\" class=\"col l12 m12 s12 hide-on-small-only hide-on-med-only\">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) references[flatindex]).Location + "</div>" +
                "<div>" +

                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                                      "<tr>" +
                                        "<th>" + "комнат: " + stud + "</th>" +
                                        "<th>" + "материал стен: " + ((Flat) references[flatindex]).WallsMaterial + "</th>" +
                                        "<th>" + "балкон: " + bal + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "сегмент: " + ((Flat) references[flatindex]).Segment + "</th>" +
                                        "<th>" + "площадь квартиры: " + ((Flat) references[flatindex]).FlatArea + "</th>" +
                                        "<th>" + "до метро: " + (int) ((Flat) references[flatindex]).MetroDistance + " минут" + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "этаж: " + (int) ((Flat) references[flatindex]).Storey + "/" + (int) ((Flat) references[flatindex]).StoreyAmount + "</th>" +
                                        "<th>" + "площадь кухни: " + ((Flat) references[flatindex]).KitchenArea + "</th>" +
                                        "<th>" + "состояние: " + ((Flat) references[flatindex]).Condition + "</th>" +
                                      "</tr> " +
                  "</table>" +
                  "<div style=\"font-size: 24px; background-color: rgb(96, 96, 192); border-radius: 15px; width: 65%; padding: 5px\">" +
                    "Рекомендованная цена: " + request.getSession().getAttribute("CounselPrice") + " руб." +
                  "</div>" +

                "</div>" +
              "</div>" +

              "<div id=\"one\" class=\"col l12 m12 s12 hide-on-small-only hide-on-large-only \">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) references[flatindex]).Location + "</div>" +
                "<div>" +

                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                                      "<tr>" +
                                        "<th>" + "комнат: " + stud + "</th>" +
                                        "<th>" + "площадь кухни: " + ((Flat) references[flatindex]).KitchenArea + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "сегмент: " + ((Flat) references[flatindex]).Segment + "</th>" +
                                        "<th>" + "балкон: " + bal + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "этаж: " + (int) ((Flat) references[flatindex]).Storey + "/" + (int) ((Flat) references[flatindex]).StoreyAmount + "</th>" +
                                        "<th>" + "до метро: " + (int) ((Flat) references[flatindex]).MetroDistance + " минут" + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "материал стен: " + ((Flat) references[flatindex]).WallsMaterial + "</th>" +
                                        "<th>" + "состояние: " + ((Flat) references[flatindex]).Condition + "</th>" +
                                      "</tr>" +
                                      "<tr>" +
                                        "<th>" + "площадь квартиры: " + ((Flat) references[flatindex]).FlatArea + "</th>" +
                                      "</tr>" +
                  "</table>" +
                  "<div style=\"font-size: 24px; background-color: rgb(96, 96, 192); border-radius: 15px; width: 75%; padding: 5px\">" +
                    "Рекомендованная цена:" +
                  "</div>" +

                "</div>" +
              "</div>" +

              "<div id=\"one\" class=\"col l12 m12 s12 hide-on-med-only hide-on-large-only \">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) references[flatindex]).Location + "</div>" +
                "<div>" +

                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                                      "<tr><th>" + "комнат: " + stud + "</th></tr>" +
                                      "<tr><th>" + "сегмент: " + ((Flat) references[flatindex]).Segment + "</th></tr>" +
                                      "<tr><th>" + "этаж: " + (int) ((Flat) references[flatindex]).Storey + "/" + (int) ((Flat) references[flatindex]).StoreyAmount + "</th></tr>" +
                                      "<tr><th>" + "материал стен: " + ((Flat) references[flatindex]).WallsMaterial + "</th></tr>" +
                                      "<tr><th>" + "площадь квартиры: " + ((Flat) references[flatindex]).FlatArea + "</th></tr>" +
                                      "<tr><th>" + "площадь кухни: " + ((Flat) references[flatindex]).KitchenArea + "</th></tr>" +
                                      "<tr><th>" + "балкон: " + bal + "</th></tr>" +
                                      "<tr><th>" + "до метро: " + (int) ((Flat) references[flatindex]).MetroDistance + " минут" + "</th></tr>" +
                                      "<tr><th>" + "площадь квартиры: " + ((Flat) references[flatindex]).FlatArea + "</th></tr>" +
                  "</table>" +
                  "<div style=\"font-size: 24px; background-color: rgb(96, 96, 192); border-radius: 15px; width: auto; padding: 5px\">" +
                    "Рекомендованная цена:" +
                  "</div>" +

                "</div>" +
              "</div>" +


              "<div class=\"col l12 m12 s12\">" +
                "<div style=\"font-size: 24px;\">Аналоги:</div>" +
              "</div>"
); %>

<%@ page import="classes.Flat" %>
<%
Object[] analogs = (Object[]) session.getAttribute("Analogs");
for (int i = 0; i < analogs.length; i++) {
   if (((Flat) analogs[i]).Balcony) bal = "есть";
   else bal = "нет";

   if (((Flat) analogs[i]).RoomAmount == 0) stud = "студия";
   else stud = "" + (int) ((Flat) analogs[i]).RoomAmount;

   response.setContentType("text/html;charset=windows-1251");
   response.getWriter().write(

              "<div class=\"col l12 m12 s12 hide-on-small-only hide-on-med-only similar\">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) analogs[i]).Location + "</div>" +
                "<div>" +

                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr>" +
                      "<th>" + "комнат: " + stud + "</th>" +
                      "<th>" + "материал стен: " + ((Flat) analogs[i]).WallsMaterial + "</th>" +
                      "<th>" + "балкон: " + bal + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "сегмент: " + ((Flat) analogs[i]).Segment + "</th>" +
                      "<th>" + "площадь квартиры: " + ((Flat) analogs[i]).FlatArea + "</th>" +
                      "<th>" + "до метро: " + (int) ((Flat) analogs[i]).MetroDistance + " минут" + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "этаж: " + (int) ((Flat) analogs[i]).Storey + "/" + (int) ((Flat) analogs[i]).StoreyAmount + "</th>" +
                      "<th>" + "площадь кухни: " + ((Flat) analogs[i]).KitchenArea + "</th>" +
                      "<th>" + "состояние: " + ((Flat) analogs[i]).Condition + "</th>" +
                    "</tr> " +
                  "</table>" +
                "</div>" +

                "<div style=\"font-size: 18px;\">Цена: " + ((Flat) analogs[i]).Price + " руб." + "</div>" +
              "</div>" +

              "<div class=\"col l12 m12 s12 hide-on-small-only hide-on-large-only similar\">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) analogs[i]).Location + "</div>" +
                "<div>" +
                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr>" +
                      "<th>" + "комнат: " + stud + "</th>" +
                      "<th>" + "площадь кухни: " + ((Flat) analogs[i]).KitchenArea + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "сегмент: " + ((Flat) analogs[i]).Segment + "</th>" +
                      "<th>" + "балкон: " + bal + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "этаж: " + (int) ((Flat) analogs[i]).Storey + "/" + (int) ((Flat) analogs[i]).StoreyAmount + "</th>" +
                      "<th>" + "до метро: " + (int) ((Flat) analogs[i]).MetroDistance + " минут" + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "материал стен: " + ((Flat) analogs[i]).WallsMaterial + "</th>" +
                      "<th>" + "состояние: " + ((Flat) analogs[i]).Condition + "</th>" +
                    "</tr>" +
                    "<tr>" +
                      "<th>" + "площадь квартиры: " + ((Flat) analogs[i]).FlatArea + "</th>" +
                    "</tr>" +
                  "</table>" +
                "</div>" +

                "<div style=\"font-size: 18px;\">Цена: " + ((Flat) analogs[i]).Price + " руб." + "</div>" +
              "</div>" +

              "<div class=\"col l12 m12 s12 hide-on-med-only hide-on-large-only similar\">" +
                "<div style=\"font-size: 24px;\">Адрес: " + ((Flat) analogs[i]).Location + "</div>" +
                "<div>" +
                  "<table style=\"font-family: Times New Roman,Georgia,Serif; font-style: normal;\">" +
                    "<tr><th>" + "комнат: " + stud + "</th></tr>" +
                    "<tr><th>" + "сегмент: " + ((Flat) analogs[i]).Segment + "</th></tr>" +
                    "<tr><th>" + "этаж: " + (int) ((Flat) analogs[i]).Storey + "/" + (int) ((Flat) analogs[i]).StoreyAmount + "</th></tr>" +
                    "<tr><th>" + "материал стен: " + ((Flat) analogs[i]).WallsMaterial + "</th></tr>" +
                    "<tr><th>" + "площадь квартиры: " + ((Flat) analogs[i]).FlatArea + "</th></tr>" +
                    "<tr><th>" + "площадь кухни: " + ((Flat) analogs[i]).KitchenArea + "</th></tr>" +
                    "<tr><th>" + "балкон: " + bal + "</th></tr>" +
                    "<tr><th>" + "до метро: " + (int) ((Flat) analogs[i]).MetroDistance + " минут" + "</th></tr>" +
                    "<tr><th>" + "площадь квартиры: " + ((Flat) analogs[i]).FlatArea + "</th></tr>" +
                  "</table>" +
                "</div>" +

                "<div style=\"font-size: 18px;\">Цена: " + ((Flat) analogs[i]).Price + " руб." + "</div>" +
              "</div>");

}
%>

          </div>
        </div> 
      </div>  
    </body>
</html>