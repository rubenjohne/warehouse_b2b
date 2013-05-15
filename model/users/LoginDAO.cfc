<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.users.Login">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	loginID, userID, email, loginDate, loginTime
			from ts_logins
			where loginID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.users.Login").init();
			obj.setloginID(qRead.loginID);
			obj.setuserID(qRead.userID);
			obj.setemail(qRead.email);
			obj.setloginDate(qRead.loginDate);
			obj.setloginTime(qRead.loginTime);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.Login">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getuserID()>
		<cfset var local2=arguments.bean.getemail()>
		<cfset var local3=arguments.bean.getloginDate()>
		<cfset var local4=arguments.bean.getloginTime()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_logins(userID, email, loginDate, loginTime)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select loginID
				from ts_logins
				where userID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and email = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and loginDate = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and loginTime = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				order by loginID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setloginID(qGetID.loginID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.Login">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_logins
			set userID = <cfqueryparam value="#arguments.bean.getuserID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getuserID() eq ""), de("yes"), de("no"))#" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />,
				loginDate = <cfqueryparam value="#arguments.bean.getloginDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getloginDate() eq ""), de("yes"), de("no"))#" />,
				loginTime = <cfqueryparam value="#arguments.bean.getloginTime()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getloginTime() eq ""), de("yes"), de("no"))#" />
			where loginID = <cfqueryparam value="#arguments.bean.getloginID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.users.Login">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_logins
			where loginID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getloginID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>