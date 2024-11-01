@isTest
public with sharing class DynamicPathControllerTest {
    
    @isTest
    public static void getValueFieldByObjectIdTest() {
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;

        DynamicPathController.ResultDTO result = DynamicPathController.getValueFieldByObjectId(acc.Id, 'Name');
        System.assertEquals(result.fieldValue, 'Test', 'Incorrect name');
    }
}
