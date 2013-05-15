<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Division">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	divisionID, divisionNumber, divisionName, divisionDescription
			from ts_divisions
			where divisionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Division").init();
			obj.setdivisionID(qRead.divisionID);
			obj.setdivisionNumber(qRead.divisionNumber);
			obj.setdivisionName(qRead.divisionName);
			obj.setdivisionDescription(qRead.divisionDescription);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Division">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getdivisionNumber()>
		<cfset var local2=arguments.bean.getdivisionName()>
		<cfset var local3=arguments.bean.getdivisionDescription()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_divisions(divisionNumber, divisionName, divisionDescription)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select divisionID
				from ts_divisions
				where divisionNumber = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and divisionName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and divisionDescription = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				order by divisionID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setdivisionID(qGetID.divisionID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Division">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_divisions
			set divisionNumber = <cfqueryparam value="#arguments.bean.getdivisionNumber()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdivisionNumber() eq ""), de("yes"), de("no"))#" />,
				divisionName = <cfqueryparam value="#arguments.bean.getdivisionName()#" cfsqltype="CF_SQL_VARCHAR" />,
				divisionDescription = <cfqueryparam value="#arguments.bean.getdivisionDescription()#" cfsqltype="CF_SQL_VARCHAR" />
			where divisionID = <cfqueryparam value="#arguments.bean.getdivisionID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Division">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_divisions
			where divisionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getdivisionID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>