<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "DivisionDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getdivisionID() eq 0 )
			{
				return createObject("component", "DivisionDAO").create(arguments.obj);
			} else {
				return createObject("component", "DivisionDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "DivisionDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="warehouse.model.products.Division[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select divisionID
			from ts_divisions
			order by divisionName
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "DivisionDAO").read(qRead.divisionID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>


	<cffunction name="getDivisions" output="false" access="remote" returntype="warehouse.model.products.Division[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select divisionID
			from ts_divisions
			where divisionNumber <> 40 <!--- exclude home collection --->
			order by divisionID
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "DivisionDAO").read(qRead.divisionID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>


	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="warehouse">
			select #arguments.fieldList#
			from ts_divisions
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>