<cfcomponent hint="this is the user handler" extends="coldbox.system.eventhandler" output="false">

	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset rc.users = getPlugin("ioc").getBean("UserGateway").getAll()>

		<cfset event.noRender()>
		
	</cffunction>

	<cffunction name="get" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset rc.user = getPlugin("ioc").getBean("UserGateway").getById(#rc.userId#)>

		<cfset event.noRender()>
		
	</cffunction>

	<cffunction name="save" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
				
		<cfset var user = getModel("users.user")>
		<cfset var userGateway = getPlugin("ioc").getBean("UserGateway")>		
		<cfset getPlugin("beanFactory").populateBean(user)>		
		<cfset userGateway.save(user)>		
		
		<cfset event.noRender()>
		
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
				
		<cfset var userGateway = getPlugin("ioc").getBean("UserGateway")>		
		<cfset rc.user = userGateway.getById(#rc.userId#)>
		<cfset userGateway.deleteById(#rc.userId#)>		
		
		<cfset event.noRender()>
		
	</cffunction>
	

	<cffunction name="login" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var userGateway = getPlugin("ioc").getBean("UserGateway")>		
		<cfset var roleGateway = getPlugin("ioc").getBean("RoleGateway")>		

		<cfquery name="qUser" datasource="#getDatasource('warehouse').getName()#">
			SELECT userID
			FROM ts_users
			WHERE email = '#rc.email#' AND
				  password = '#rc.password#'
		</cfquery>

		<cfif qUser.RecordCount IS 1>
			<!--- get the user information from the database --->
			<cfset rc.user = userGateway.getById(#qUser.userID#)>
			<!--- get the role information from the database --->
			<cfset rc.role = roleGateway.getById(#rc.user.getRoleID()#)>				
			<!--- login the user --->
	 		<cflogin>						
				<cfloginuser name="#rc.user.getFirstName()# #rc.user.getLastName()#" password="#rc.user.getPassword()#" roles="#rc.role.getRole()#">
			</cflogin>

			<cfset saveLogin(#rc.user#)>
			
			<cfset rc.authUser = #getAuthUser()#>
			
		<cfelse>
			<cfset rc.loginFailed = "the username or password you entered is incorrect">				
		</cfif>
			
		<cfset event.noRender()>
		
	</cffunction>

	<!--- private function to save the login information --->
	<cffunction name="saveLogin" access="private" returntype="void" output="false">
		<cfargument name="user" type="warehouse.model.users.User">
				
		<cfset loginGateway = getPlugin("ioc").getBean("LoginGateway")>
						
		<cfset loginInfo = getModel("users.login")>
		<cfset loginInfo.setUserId(#user.getUserID()#)>
		<cfset loginInfo.setEmail(#user.getEmail()#)>								
		<cfset loginInfo.setLoginDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
		<cfset loginInfo.setLoginTime(#TimeFormat(CreateODBCDate(Now()),"hh:mm:ss")#)>

		<cfset loginGateway.save(loginInfo)>					
						
	</cffunction>


	<cffunction name="logout" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset rc.currentUser = #getAuthUser()#>
		
		<cflogout/>
					
		<cfset event.noRender()>
		
	</cffunction>




</cfcomponent>