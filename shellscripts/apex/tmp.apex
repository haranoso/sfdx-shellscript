Schema.SObjectType sot = Schema.getGlobalDescribe().get('Account');
Schema.DescribeSObjectResult dsr = sot.getDescribe();

Map<String, Schema.SObjectField> fsMap = dsr.fields.getMap();
for (Schema.SObjectField sof : fsMap.values()) {
    System.debug(sof.getDescribe().getName());
}