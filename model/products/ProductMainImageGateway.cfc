<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ProductMainImageDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="getByProductID" output="false" access="remote">
		<cfargument name="productid" required="true" />
		<cfquery name="qProductID" datasource="warehouse">
			SELECT productImageID
			FROM ts_productMainImages
			WHERE productID = #arguments.productid#
		</cfquery>
		<cfif qProductID.recordcount GT 0>
			<cfreturn createObject("component", "ProductMainImageDAO").read(qProductID.productImageID)>
		<cfelse>
			<cfreturn createObject("component", "ProductMainImage")>					
		</cfif>
 		
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getproductImageID() eq 0 )
			{
				return createObject("component", "ProductMainImageDAO").create(arguments.obj);
			} else {
				return createObject("component", "ProductMainImageDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ProductMainImageDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="warehouse.model.products.ProductMainImage[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="warehouse">
			select productImageID
			from ts_productMainImages
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "ProductMainImageDAO").read(qRead.productImageID);
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
			from ts_productMainImages
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>