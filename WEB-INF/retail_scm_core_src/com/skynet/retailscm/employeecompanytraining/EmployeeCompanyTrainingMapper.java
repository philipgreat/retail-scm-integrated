
package com.skynet.retailscm.employeecompanytraining;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import com.skynet.retailscm.BaseRowMapper;
import com.skynet.retailscm.scoring.Scoring;
import com.skynet.retailscm.companytraining.CompanyTraining;
import com.skynet.retailscm.employee.Employee;

public class EmployeeCompanyTrainingMapper extends BaseRowMapper<EmployeeCompanyTraining>{
	
	protected EmployeeCompanyTraining internalMapRow(ResultSet rs, int rowNumber) throws SQLException{
		EmployeeCompanyTraining employeeCompanyTraining = getEmployeeCompanyTraining();		
		 		
 		setId(employeeCompanyTraining, rs, rowNumber); 		
 		setEmployee(employeeCompanyTraining, rs, rowNumber); 		
 		setTraining(employeeCompanyTraining, rs, rowNumber); 		
 		setScoring(employeeCompanyTraining, rs, rowNumber); 		
 		setCurrentStatus(employeeCompanyTraining, rs, rowNumber); 		
 		setVersion(employeeCompanyTraining, rs, rowNumber);

		return employeeCompanyTraining;
	}
	
	protected EmployeeCompanyTraining getEmployeeCompanyTraining(){
		return new EmployeeCompanyTraining();
	}		
		
	protected void setId(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
	
		//there will be issue when the type is double/int/long
		String id = rs.getString(EmployeeCompanyTrainingTable.COLUMN_ID);
		if(id == null){
			//do nothing when nothing found in database
			return;
		}
	
		employeeCompanyTraining.setId(id);
	}
		 		
 	protected void setEmployee(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
 		String employeeId = rs.getString(EmployeeCompanyTrainingTable.COLUMN_EMPLOYEE);
 		if( employeeId == null){
 			return;
 		}
 		if( employeeId.isEmpty()){
 			return;
 		}
 		Employee employee = employeeCompanyTraining.getEmployee();
 		if( employee != null ){
 			//if the root object 'employeeCompanyTraining' already have the property, just set the id for it;
 			employee.setId(employeeId);
 			return;
 		}
 		employeeCompanyTraining.setEmployee(createEmptyEmployee(employeeId));
 	}
 	 		
 	protected void setTraining(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
 		String companyTrainingId = rs.getString(EmployeeCompanyTrainingTable.COLUMN_TRAINING);
 		if( companyTrainingId == null){
 			return;
 		}
 		if( companyTrainingId.isEmpty()){
 			return;
 		}
 		CompanyTraining companyTraining = employeeCompanyTraining.getTraining();
 		if( companyTraining != null ){
 			//if the root object 'employeeCompanyTraining' already have the property, just set the id for it;
 			companyTraining.setId(companyTrainingId);
 			return;
 		}
 		employeeCompanyTraining.setTraining(createEmptyTraining(companyTrainingId));
 	}
 	 		
 	protected void setScoring(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
 		String scoringId = rs.getString(EmployeeCompanyTrainingTable.COLUMN_SCORING);
 		if( scoringId == null){
 			return;
 		}
 		if( scoringId.isEmpty()){
 			return;
 		}
 		Scoring scoring = employeeCompanyTraining.getScoring();
 		if( scoring != null ){
 			//if the root object 'employeeCompanyTraining' already have the property, just set the id for it;
 			scoring.setId(scoringId);
 			return;
 		}
 		employeeCompanyTraining.setScoring(createEmptyScoring(scoringId));
 	}
 	
	protected void setCurrentStatus(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
	
		//there will be issue when the type is double/int/long
		String currentStatus = rs.getString(EmployeeCompanyTrainingTable.COLUMN_CURRENT_STATUS);
		if(currentStatus == null){
			//do nothing when nothing found in database
			return;
		}
	
		employeeCompanyTraining.setCurrentStatus(currentStatus);
	}
		
	protected void setVersion(EmployeeCompanyTraining employeeCompanyTraining, ResultSet rs, int rowNumber) throws SQLException{
	
		//there will be issue when the type is double/int/long
		Integer version = rs.getInt(EmployeeCompanyTrainingTable.COLUMN_VERSION);
		if(version == null){
			//do nothing when nothing found in database
			return;
		}
	
		employeeCompanyTraining.setVersion(version);
	}
		
		

 	protected Employee  createEmptyEmployee(String employeeId){
 		Employee employee = new Employee();
 		employee.setId(employeeId);
 		return employee;
 	}
 	
 	protected CompanyTraining  createEmptyTraining(String companyTrainingId){
 		CompanyTraining companyTraining = new CompanyTraining();
 		companyTraining.setId(companyTrainingId);
 		return companyTraining;
 	}
 	
 	protected Scoring  createEmptyScoring(String scoringId){
 		Scoring scoring = new Scoring();
 		scoring.setId(scoringId);
 		return scoring;
 	}
 	
}


