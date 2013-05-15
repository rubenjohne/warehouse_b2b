<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.users.User">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	userID, accountNumber, accountName, firstName, lastName, email, 
					password, roleID
			from ts_users
			where userID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.users.User").init();
			obj.setuserID(qRead.userID);
			obj.setaccountNumber(qRead.accountNumber);
			obj.setaccountName(qRead.accountName);
			obj.setfirstName(qRead.firstName);
			obj.setlastName(qRead.lastName);
			obj.setemail(qRead.email);
			obj.setpassword(qRead.password);
			obj.setroleID(qRead.roleID);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.User">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local0=arguments.bean.getuserID()>
		<cfset var local1=arguments.bean.getaccountNumber()>
		<cfset var local2=arguments.bean.getaccountName()>
		<cfset var local3=arguments.bean.getfirstName()>
		<cfset var local4=arguments.bean.getlastName()>
		<cfset var local5=arguments.bean.getemail()>
		<cfset var local6=arguments.bean.getpassword()>
		<cfset var local7=arguments.bean.getroleID()>

		<cfquery name="qCreate" datasource="warehouse">
			insert into ts_users(userID, accountNumber, accountName, firstName, lastName, email, password, roleID)
			values (
				<cfqueryparam value="#local0#" cfsqltype="CF_SQL_INTEGER" null="#iif((local0 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
				<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
				<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
				<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
				<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
				<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
				<cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
			)
		</cfquery>

		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.User">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_users
			set userID = <cfqueryparam value="#arguments.bean.getuserID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getuserID() eq ""), de("yes"), de("no"))#" />,
				accountNumber = <cfqueryparam value="#arguments.bean.getaccountNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getaccountNumber() eq ""), de("yes"), de("no"))#" />,
				accountName = <cfqueryparam value="#arguments.bean.getaccountName()#" cfsqltype="CF_SQL_VARCHAR" />,
				firstName = <cfqueryparam value="#arguments.bean.getfirstName()#" cfsqltype="CF_SQL_VARCHAR" />,
				lastName = <cfqueryparam value="#arguments.bean.getlastName()#" cfsqltype="CF_SQL_VARCHAR" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />,
				password = <cfqueryparam value="#arguments.bean.getpassword()#" cfsqltype="CF_SQL_VARCHAR" />,
				roleID = <cfqueryparam value="#arguments.bean.getroleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getroleID() eq ""), de("yes"), de("no"))#" />
			where userID = <cfqueryparam value="#arguments.bean.getuserID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.users.User">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_users
			where userID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getuserID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>