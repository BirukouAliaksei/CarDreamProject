/**
 * Created by Bruss on 3/10/2021.
 */

public with sharing class Rate {
    public static HttpResponse makeGetCallout() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.nbrb.by/api/exrates/rates?periodicity=0');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug(res.getBody());

        return res;
    }

    public static List<Rate__c> getListRate() {
        List<JSON2Apex> sApexes = JSON2Apex.parse(makeGetCallout().getBody());
        List<Rate__c> rates = new List<Rate__c>();
        for (JSON2Apex o : sApexes) {
            rates.add(new Rate__c(Cur_ID__c = o.Cur_ID, Cur_Abbreviation__c = o.Cur_Abbreviation,
                    Cur_Name__c = o.Cur_Name, Cur_OfficialRate__c = o.Cur_OfficialRate, Cur_Scale__c = o.Cur_Scale));
        }
        return rates;
    }
}