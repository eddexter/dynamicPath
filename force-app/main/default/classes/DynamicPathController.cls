public without sharing class DynamicPathController {
    
    @AuraEnabled (Cacheable=true)
    public static ResultDTO getValueFieldByObjectId(Id idObj, String field){
        if(String.isEmpty(idObj) || String.isEmpty(field)) {
            throw new AuraHandledException('Unfilled values.');
        }
        
        String sObjName = idObj.getSObjectType().getDescribe().getName();
        String strquery = 'SELECT Id, ' + field + ' FROM ' + sObjName + ' WHERE Id = \'' + idObj + '\' LIMIT 1';
        sObject sobj;
        try {
            sobj = Database.query(strquery);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        ResultDTO res = new ResultDTO();
        res.fieldValue = (String)sobj.get(field);
        return res;
    }

    public class ResultDTO {
        @AuraEnabled
        public String fieldValue {get;set;}
    }
}