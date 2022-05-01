trigger ContactTrigger on Contact (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            ContactTriggerHandler.beforeInsert(Trigger.new);
        }
        else if(Trigger.isUpdate){
            ContactTriggerHandler.beforeUpdate(Trigger.new);
        }        
    }  
}