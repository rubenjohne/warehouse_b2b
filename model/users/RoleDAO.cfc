<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.users.Role">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	roleID, role, description
			from ts_roles
			where roleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.users.Role").init();
			obj.setroleID(qRead.roleID);
			obj.setrole(qRead.role);
			obj.setdescription(qRead.description);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.Role">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getrole()>
		<cfset var local2=arguments.bean.getdescription()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_roles(role, description)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select roleID
				from ts_roles
				where role = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and description = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				order by roleID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setroleID(qGetID.roleID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.users.Role">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_roles
			set role = <cfqueryparam value="#arguments.bean.getrole()#" cfsqltype="CF_SQL_VARCHAR" />,
				description = <cfqueryparam value="#arguments.bean.getdescription()#" cfsqltype="CF_SQL_VARCHAR" />
			where roleID = <cfqueryparam value="#arguments.bean.getroleID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.users.Role">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_roles
			where roleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getroleID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>