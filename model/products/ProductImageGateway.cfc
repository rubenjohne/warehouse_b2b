<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ProductImageDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="getByProductID" output="false" access="remote" returntype="warehouse.model.products.ProductImage[]">
		<cfargument name="productid" required="true" />
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productImageID
			from ts_productimages
			where productID = #productid#
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductImageDAO").read(qRead.productImageID);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>

	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getproductImageID() eq 0 )
			{
				return createObject("component", "ProductImageDAO").create(arguments.obj);
			} else {
				return createObject("component", "ProductImageDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ProductImageDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="warehouse.model.products.ProductImage[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productImageID
			from ts_productimages
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductImageDAO").read(qRead.productImageID);
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
			from ts_productimages
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>