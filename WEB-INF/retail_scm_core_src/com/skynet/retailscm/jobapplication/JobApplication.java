
package com.skynet.retailscm.jobapplication;


import java.util.Date;
import com.skynet.retailscm.BaseEntity;
import com.skynet.retailscm.SmartList;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.skynet.retailscm.employee.Employee;

@JsonSerialize(using = JobApplicationSerializer.class)
public class JobApplication extends BaseEntity implements  java.io.Serializable{

	
	public static final String ID_PROPERTY                    = "id"                ;
	public static final String APPLICATION_TIME_PROPERTY      = "applicationTime"   ;
	public static final String WHO_PROPERTY                   = "who"               ;
	public static final String COMMENTS_PROPERTY              = "comments"          ;
	public static final String VERSION_PROPERTY               = "version"           ;

	public static final String EMPLOYEE_LIST                            = "employeeList"      ;




	private static final long serialVersionUID = 1L;
	

	protected		String              	mId                 ;
	protected		Date                	mApplicationTime    ;
	protected		String              	mWho                ;
	protected		String              	mComments           ;
	protected		int                 	mVersion            ;
	
	
	protected		SmartList<Employee> 	mEmployeeList       ;
	
		
	public 	JobApplication(){
		//lazy load for all the properties
	}
	
	public 	JobApplication(Date applicationTime, String who, String comments
)
	{
		setApplicationTime(applicationTime);
		setWho(who);
		setComments(comments);

		this.mEmployeeList = new SmartList<Employee>();	
	}
	
	//Support for changing the property
	
	public void changePropery(String property, String newValueExpr) {
     	
		if(APPLICATION_TIME_PROPERTY.equals(property)){
			changeApplicationTimeProperty(newValueExpr);
		}
		if(WHO_PROPERTY.equals(property)){
			changeWhoProperty(newValueExpr);
		}
		if(COMMENTS_PROPERTY.equals(property)){
			changeCommentsProperty(newValueExpr);
		}

      
	}
    
    
	protected void changeApplicationTimeProperty(String newValueExpr){
		Date oldValue = getApplicationTime();
		Date newValue = parseDate(newValueExpr);
		if(equalsDate(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
        
 		setApplicationTime(newValue);
		//they are surely different each other
		this.onChangeProperty(APPLICATION_TIME_PROPERTY, oldValue, newValue);
		return;
             
	}
			
			
			
	protected void changeWhoProperty(String newValueExpr){
		String oldValue = getWho();
		String newValue = parseString(newValueExpr);
		if(equalsString(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
        
 		setWho(newValue);
		//they are surely different each other
		this.onChangeProperty(WHO_PROPERTY, oldValue, newValue);
		return;
             
	}
			
			
			
	protected void changeCommentsProperty(String newValueExpr){
		String oldValue = getComments();
		String newValue = parseString(newValueExpr);
		if(equalsString(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
        
 		setComments(newValue);
		//they are surely different each other
		this.onChangeProperty(COMMENTS_PROPERTY, oldValue, newValue);
		return;
             
	}
			
			
			


	
	
	
	public void setId(String id){
		this.mId = trimString(id);;
	}
	public String getId(){
		return this.mId;
	}
	
	
	public void setApplicationTime(Date applicationTime){
		this.mApplicationTime = applicationTime;;
	}
	public Date getApplicationTime(){
		return this.mApplicationTime;
	}
	
	
	public void setWho(String who){
		this.mWho = trimString(who);;
	}
	public String getWho(){
		return this.mWho;
	}
	
	
	public void setComments(String comments){
		this.mComments = trimString(comments);;
	}
	public String getComments(){
		return this.mComments;
	}
	
	
	public void setVersion(int version){
		this.mVersion = version;;
	}
	public int getVersion(){
		return this.mVersion;
	}
	
	
	public  SmartList<Employee> getEmployeeList(){
		if(this.mEmployeeList == null){
			this.mEmployeeList = new SmartList<Employee>();
		}
		return this.mEmployeeList;	
	}
	public  void setEmployeeList(SmartList<Employee> employeeList){
		for( Employee employee:employeeList){
			employee.setJobApplication(this);
		}
		
		this.mEmployeeList = employeeList;
		
	}
	
	public  void addEmployee(Employee employee){
		employee.setJobApplication(this);
		getEmployeeList().add(employee);
	}
	public  void addEmployees(SmartList<Employee> employeeList){
		for( Employee employee:employeeList){
			employee.setJobApplication(this);
		}
		getEmployeeList().addAll(employeeList);
	}
	
	public  void removeEmployee(Employee employee){
	
		boolean result = getEmployeeList().planToRemove(employee);
        if(!result){
        	String message = "Employee("+employee.getId()+") with version='"+employee.getVersion()+"' NOT found!";
            throw new IllegalStateException(message);
        }
	
       	//this.addItemToFlexibleList("toRemoveEmployeeList", employee);
		//the constant "toEmployee" will be replaced after refactoried.
	
	}
	
	public void copyEmployeeFrom(Employee employee) {
		// TODO Auto-generated method stub
		
        Employee employeeInList = findTheEmployee(employee);
        Employee newEmployee = new Employee();
        employeeInList.copyTo(newEmployee);
        newEmployee.setVersion(0);//will trigger copy
        getEmployeeList().add(newEmployee);
	}
	
	public  Employee findTheEmployee(Employee employee){
		
		int index =  getEmployeeList().indexOf(employee);
		//The input parameter must have the same id and version number.
        if(index < 0){
        	String message = "Employee("+employee.getId()+") with version='"+employee.getVersion()+"' NOT found!";
            throw new IllegalStateException(message);
        }
	
       	return  getEmployeeList().get(index);
		//Performance issue when using LinkedList, but it is almost an ArrayList for sure!
	}
	
	public  void cleanUpEmployeeList(){
		getEmployeeList().clear();
	}
	
	
	
	
 	
	
	public JobApplication copyTo(JobApplication dest){

		dest.setId(getId());
		dest.setApplicationTime(getApplicationTime());
		dest.setWho(getWho());
		dest.setComments(getComments());
		dest.setVersion(getVersion());
		dest.setEmployeeList(getEmployeeList());

		return dest;
	}
	
	public String toString(){
		StringBuilder stringBuilder=new StringBuilder(128);

		stringBuilder.append("job_application{");
		stringBuilder.append("\tid='"+getId()+"';");
		stringBuilder.append("\tapplication_time='"+getApplicationTime()+"';");
		stringBuilder.append("\twho='"+getWho()+"';");
		stringBuilder.append("\tcomments='"+getComments()+"';");
		stringBuilder.append("\tversion='"+getVersion()+"';");
		stringBuilder.append("}");

		return stringBuilder.toString();
	}
	
	
	
	
}

