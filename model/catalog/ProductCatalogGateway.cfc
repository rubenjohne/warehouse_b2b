<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ProductCatalogDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getproductID() eq 0 )
			{
				return createObject("component", "ProductCatalogDAO").create(arguments.obj);
			} else {
				return createObject("component", "ProductCatalogDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ProductCatalogDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="warehouse.model.catalog.ProductCatalog[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productID
			from WebProductCatalogView
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductCatalogDAO").read(qRead.productID);
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
			from WebProductCatalogView
		</cfquery>

		<cfreturn qRead>
	</cffunction>


	<cffunction name="getAllOnWeb" output="false" access="remote" returntype="warehouse.model.catalog.ProductCatalog[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productID
			from WebProductCatalogView
			where OnWeb = 1
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductCatalogDAO").read(qRead.productID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>
	

	<cffunction name="getAllNotOnWeb" output="false" access="remote" returntype="warehouse.model.catalog.ProductCatalog[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productID
			from WebProductCatalogView
			where OnWeb = 0
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductCatalogDAO").read(qRead.productID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>
 



</cfcomponent>