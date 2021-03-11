/**
 * Created by Bruss on 3/11/2021.
 */

public with sharing class JSON2Apex {

    public Integer Cur_ID;
    public String Cur_Abbreviation;
    public Integer Cur_Scale;
    public String Cur_Name;
    public Double Cur_OfficialRate;


    public static List<JSON2Apex> parse(String json) {
        return (List<JSON2Apex>) System.JSON.deserialize(json, List<JSON2Apex>.class);
    }
}