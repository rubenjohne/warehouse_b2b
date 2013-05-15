<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ClassDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getclassID() eq 0 )
			{
				return createObject("component", "ClassDAO").create(arguments.obj);
			} else {
				return createObject("component", "ClassDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ClassDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="warehouse.model.products.Class[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select classID
			from ts_class
			order by classDescription
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ClassDAO").read(qRead.classID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>

	<cffunction name="getClasses" output="false" access="remote" returntype="warehouse.model.products.Class[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select classID
			from ts_class
			where classCode not in ('DLD','HOM') <!--- exclude damage long dress and home collection class --->
			order by classDescription
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ClassDAO").read(qRead.classID);
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
			from ts_class
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>