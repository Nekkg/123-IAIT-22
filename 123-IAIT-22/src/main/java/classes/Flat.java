package classes;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Flat {
    public double RoomAmount, StoreyAmount, Storey, FlatArea, KitchenArea, MetroDistance;
    public int Price;
    public boolean Balcony;
    public String Location, Segment, WallsMaterial, Condition;

    @Override
    public String toString() {
        return "classes.Flat{" +
                "RoomAmount=" + RoomAmount +
                ", StoreyAmount=" + StoreyAmount +
                ", Storey=" + Storey +
                ", FlatArea=" + FlatArea +
                ", KitchenArea=" + KitchenArea +
                ", MetroDistance=" + MetroDistance +
                ", Balcony=" + Balcony +
                ", Location='" + Location + '\'' +
                ", Segment='" + Segment + '\'' +
                ", WallsMaterial='" + WallsMaterial + '\'' +
                ", Condition='" + Condition + '\'' +
                ", Price='" + Price + '\'' +
                '}';
    }

    public static List<Flat> ParseExcel(InputStream inputStream) throws IOException, InvalidFormatException {
        XSSFSheet ExcelSheet = new XSSFWorkbook(inputStream).getSheetAt(0);
        List<Flat> Flats = new ArrayList<>();

        int counter = 1;
        try {
            while (ExcelSheet.getRow(counter).getCell(0) != null) {
                counter += 1;
            }
        } catch (Exception e) {
            counter -= 1;
        }

        for (int Index = 0; Index < counter; Index++) {
            Flat ThisFlat = new Flat();
            ThisFlat.Location = ExcelSheet.getRow(Index + 1).getCell(0).getStringCellValue().toLowerCase();
            if (ExcelSheet.getRow(Index + 1).getCell(1).getCellType() == 0)
                ThisFlat.RoomAmount = ThisFlat.RoomAmount = ExcelSheet.getRow(Index + 1).getCell(1).getNumericCellValue();
            else
                ThisFlat.RoomAmount = 0; //RoomAmount == 0 -> студия
            ThisFlat.Segment = ExcelSheet.getRow(Index + 1).getCell(2).getStringCellValue().toLowerCase();
            ThisFlat.StoreyAmount = ExcelSheet.getRow(Index + 1).getCell(3).getNumericCellValue();
            ThisFlat.WallsMaterial = ExcelSheet.getRow(Index + 1).getCell(4).getStringCellValue().toLowerCase();
            ThisFlat.Storey = ExcelSheet.getRow(Index + 1).getCell(5).getNumericCellValue();
            ThisFlat.FlatArea = ExcelSheet.getRow(Index + 1).getCell(6).getNumericCellValue();
            ThisFlat.KitchenArea = ExcelSheet.getRow(Index + 1).getCell(7).getNumericCellValue();
            ThisFlat.Balcony = ExcelSheet.getRow(Index + 1).getCell(8).getStringCellValue().equalsIgnoreCase("да");
            ThisFlat.MetroDistance = ExcelSheet.getRow(Index + 1).getCell(9).getNumericCellValue();
            ThisFlat.Condition = ExcelSheet.getRow(Index + 1).getCell(10).getStringCellValue().toLowerCase();
            try {
                ThisFlat.Price = (int) ExcelSheet.getRow(Index + 1).getCell(11).getNumericCellValue();
            } catch (Exception e) {
                ThisFlat.Price = 0;
            }

            Flats.add(ThisFlat);
        }
        return Flats;
    }

    static public double Adjust(double Reference, double Analog, double[][] Adjustments, double[] Graduation){
        for (int i = 1; i <= Adjustments.length; i++)
            for (int j = 0; j <= Adjustments[0].length; j++) {
                if (Reference < Graduation[i] && Reference >= Graduation[i - 1])
                    if (Analog < Graduation[j] && Analog >= Graduation[j - 1])
                        return Adjustments[i - 1][j - 1];
            }
        return 0;
    }

    static public double AdjustAll(Flat Reference, List<Flat> Analog){
        double AdjustedPrice = 0;
        double ACondition = 0;
        double MiddlePrice = 0;

        for (int i = 0; i < Analog.size(); i++) {
            double ABargain = -4.5 / 100 + 1;

            double KitchenAreaAdjustments[][] =
                    {{0, -2.9, -8.3},
                            {3, 0, -5.5},
                            {9, 5.8, 0}};
            double KitchenAreaGraduation[] = {0, 7, 10, 15 + 1};
            double AKitchenArea = Adjust(Reference.KitchenArea, Analog.get(i).KitchenArea, KitchenAreaAdjustments, KitchenAreaGraduation) / 100 + 1;

            double FlatAreaAdjustments[][] =
                    {{0, 6, 14, 21, 28, 31},
                            {-6, 0, 7, 14, 21, 24},
                            {-12, -7, 0, 6, 13, 16},
                            {-17, -12, -6, 0, 6, 9},
                            {-22, -17, -11, -6, 0, 3},
                            {-24, -19, -13, -8, -3, 0}};
            double FlatAreaGraduation[] = {0, 30, 50, 65, 90, 120, Double.POSITIVE_INFINITY};
            double AFlatArea = Adjust(Reference.FlatArea, Analog.get(i).FlatArea, FlatAreaAdjustments, FlatAreaGraduation) / 100 + 1;

            double StoreyAdjustments[][] =
                    {{0, -7, -3.1},
                            {7.5, 0, -4.2},
                            {3.2, -4, 0}};
            double StoreyGraduation[] = {0, 1.5, Reference.StoreyAmount, Reference.StoreyAmount + 1};
            double AStorey = Adjust(Reference.Storey, Analog.get(i).Storey, StoreyAdjustments, StoreyGraduation) / 100 + 1;

            double ABalcony = 0;
            if (Reference.Balcony == false && Analog.get(i).Balcony == false) ABalcony = 0 / 100 + 1;
            if (Reference.Balcony == true && Analog.get(i).Balcony == false) ABalcony = 5.3 / 100 + 1;
            if (Reference.Balcony == false && Analog.get(i).Balcony == true) ABalcony = -5 / 100 + 1;
            if (Reference.Balcony == true && Analog.get(i).Balcony == true) ABalcony = 0 / 100 + 1;

            double MetroAdjustments[][] =
                    {{0, 7, 12, 17, 24, 29},
                            {-7, 0, 4, 9, 15, 20},
                            {-11, -4, 0, 5, 11, 15},
                            {-15, -8, -5, 0, 6, 10},
                            {-19, -13, -10, -6, 0, 4},
                            {-22, -17, -13, -9, -4, 0}};
            double MetroGraduation[] = {0, 5, 10, 15, 30, 60, 90};
            double AMetro = Adjust(Reference.MetroDistance, Analog.get(i).MetroDistance, MetroAdjustments, MetroGraduation) / 100 + 1;

            double CondAdjustments[][] =
                    {{0, -13400, -20100},
                            {13400, 0, -6700},
                            {20100, 6700, 0}};
            ACondition = CondAdjustments[Reference.ConditionTAG()][Analog.get(i).ConditionTAG()];

            AdjustedPrice +=
                    (Analog.get(i).Price / Analog.get(i).FlatArea) *
                            ((ABargain +
                                    AKitchenArea +
                                    AFlatArea +
                                    AStorey +
                                    ABalcony +
                                    AMetro) / 6);
        }

        return ((AdjustedPrice / Analog.size()) + ACondition) * Reference.FlatArea ;
    }

    static public List<Flat> Selection(Flat Reference, List<Flat> Analogs) {
        //Reference.RoomAmount, Reference.Segment, Reference.StoreyAmount, Reference.WallsMaterial
        List<Flat> SelectedFlats = new ArrayList<>();

        for (int i = 0; i < Analogs.size(); i++) {
            if (Analogs.get(i).RoomAmount == Reference.RoomAmount &&
                    Analogs.get(i).Segment.equals(Reference.Segment) &&
                    Analogs.get(i).StoreyAmount == Reference.StoreyAmount &&
                    Analogs.get(i).WallsMaterial.equals(Reference.WallsMaterial))
                SelectedFlats.add(Analogs.get(i));
        }

        return SelectedFlats;
    }

    private int ConditionTAG() {
        int cond = 0;
        if (Condition.equals("без отделки"))
            cond = 1;
        if (Condition.equals("муниципальный ремонт") || Condition.equals("муниципальная отделка") || Condition.equals("муниципальный отделка") || Condition.equals("муниципальный") || Condition.equals("муниципальная"))
            cond = 2;
        if (Condition.equals("современная отделка") || Condition.equals("с современной отделкой") || Condition.equals("с современная отделка") || Condition.equals("современная"))
            cond = 3;

        return cond;
    }
}
