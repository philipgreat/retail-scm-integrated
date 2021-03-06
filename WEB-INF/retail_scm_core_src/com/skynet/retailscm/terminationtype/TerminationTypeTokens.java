
package com.skynet.retailscm.terminationtype;
import com.skynet.retailscm.CommonTokens;
import java.util.Map;
public class TerminationTypeTokens extends CommonTokens{

	static final String ALL="__all__"; //do not assign this to common users.
	static final String SELF="__self__";
	static final String OWNER_OBJECT_NAME="terminationType";
	
	public static boolean checkOptions(Map<String,Object> options, String optionToCheck){
		
		if(options==null){
 			return false; //completely no option here
 		}
 		if(options.containsKey(ALL)){
 			//danger, debug only, might load the entire database!, really terrible
 			return true;
 		}
		String ownerKey = getOwnerObjectKey();
		Object ownerObject =(String) options.get(ownerKey);
		if(ownerObject ==  null){
			return false;
		}
		if(!ownerObject.equals(OWNER_OBJECT_NAME)){ //is the owner? 
			return false; 
		}
		
 		if(options.containsKey(optionToCheck)){
 			//options.remove(optionToCheck);
 			//consume the key, can not use any more to extract the data with the same token.			
 			return true;
 		}
 		
 		return false;
	
	}
	protected TerminationTypeTokens(){
		//ensure not initialized outside the class
	}
	
	public TerminationTypeTokens merge(String [] tokens){
		this.parseTokens(tokens);
		return this;
	}
	
	public static TerminationTypeTokens mergeAll(String [] tokens){
		
		return allTokens().merge(tokens);
	}
	
	protected TerminationTypeTokens setOwnerObject(String objectName){
		ensureOptions();
		addSimpleOptions(getOwnerObjectKey(), objectName);
		return this;
	}
	
	
	public static TerminationTypeTokens start(){
		return new TerminationTypeTokens().setOwnerObject(OWNER_OBJECT_NAME);
	}
	
	protected static TerminationTypeTokens allTokens(){
		
		return start()
			.withCompany()
			.withTerminationList();
	
	}
	protected static TerminationTypeTokens withoutListsTokens(){
		
		return start()
			.withCompany();
	
	}
	
	public static Map <String,Object> all(){
		return allTokens().done();
	}
	public static Map <String,Object> withoutLists(){
		return withoutListsTokens().done();
	}
	public static Map <String,Object> empty(){
		return start().done();
	}

	protected static final String COMPANY = "company";
	public String getCompany(){
		return COMPANY;
	}
	public TerminationTypeTokens withCompany(){		
		addSimpleOptions(COMPANY);
		return this;
	}
	
	
	protected static final String TERMINATION_LIST = "terminationList";
	public String getTerminationList(){
		return TERMINATION_LIST;
	}
	public TerminationTypeTokens withTerminationList(){		
		addSimpleOptions(TERMINATION_LIST);
		return this;
	}	
		
}

