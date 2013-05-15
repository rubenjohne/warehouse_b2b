<cfcomponent extends="coldbox.system.eventhandler">


	<cffunction name="save" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
				
		<cfset var retailer = getModel("retailers.retailer")>
		<cfset var retailerGateway = getPlugin("ioc").getBean("RetailerGateway")>				
		<cfset getPlugin("beanFactory").populateBean(retailer)>		
		<cfset retailerGateway.save(retailer)>		
		
		<cfset sendRetailerRequestEmail(retailer)>
		
		<cfset event.noRender()>
		
	</cffunction>


	<cffunction name="sendRetailerRequestEmail" access="private" returntype="void" output="false">
		<cfargument name="retailer" type="warehouse.model.retailers.Retailer">
		
		<cftry>
			<cfmail from="#retailer.getStoreName()# <#retailer.getEmail()#>" 
					to="deborah@tadashishoji.com,pablo@tadashishoji.com,customerservice@tadashishoji.com" 
					mailerid="Microsoft Outlook, Build 10.0.3416"
					subject="TADASHI SHOJI RETAILER INQUIRY" type="text/html">
					
					<!--- email content --->
				
					<table>
						<tr>
							<th>First Name :</th>
							<td>#retailer.getFirstName()#</td>
						</tr>
						<tr>
							<th>Last Name :</th>
							<td>#retailer.getLastName()#</td>
						</tr>
						<tr>
							<th>E-mail :</th>
							<td>#retailer.getEmail()#</td>
						</tr>
						<tr>
							<th>Phone :</th>
							<td>#retailer.getPhone()#</td>
						</tr>
						<tr>
							<th>Store Name :</th>
							<td>#retailer.getStoreName()#</td>
						</tr>
						<tr>
							<th>Website :</th>
							<td>#retailer.getWebsite()#</td>
						</tr>
						<tr>
							<th>Source :</th>
							<td>#retailer.getSource()#</td>
						</tr>
						<tr>
							<th>Comments :</th>
							<td>#retailer.getComments()#</td>
						</tr>
					</table>					
				  			  
			</cfmail>
		
		<cfcatch>
		
			<cfmail from="ruben@tadashishoji.com" to="customerservice@tadashishoji.com" subject="wrong email address">
				something is wrong with the retailer email. #retailer.getStoreName()# : #retailer.getEmail()# #retailer.getComments()#
			</cfmail>
		
		</cfcatch>	

		</cftry>
				
	</cffunction>
	
	
</cfcomponent>