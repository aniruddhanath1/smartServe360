public class LeadConversionHandler {
    
    @InvocableMethod
    public static List<LeadConversionResultWrapper>  convertQualifiedLeads(List<Id> leadIds) {
        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
        for (Id leadId : leadIds) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(leadId);
            lc.setDoNotCreateOpportunity(false);
            leadConverts.add(lc);
        }
        List<Database.LeadConvertResult> results = Database.convertLead(leadConverts, false);
        LeadConversionResultWrapper wrapper = new LeadConversionResultWrapper();
        wrapper.accId = results[0].getAccountId();
        wrapper.conId = results[0].getContactId();
        wrapper.isSuccess = results[0].isSuccess();
        // return wrapper;
        return null;
    }
    
    
    public class LeadConversionResultWrapper {
        @InvocableVariable
        public Id accId ;
        @InvocableVariable
        public Id conId;
        @InvocableVariable
        public Id oppId;
        @InvocableVariable
        public Boolean isSuccess;
        
        
    }

}