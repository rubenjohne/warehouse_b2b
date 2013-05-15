<cfcomponent extends="coldbox.system.eventhandler" output="false">

	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		

		<cfif event.isProxyRequest()>
			<cfif rc.mode EQ 1>
				<cfset rc.products = getPlugin("ioc").getBean("ProductCatalogGateway").getAllOnWeb()>
			<cfelse>
				<cfset rc.products = getPlugin("ioc").getBean("ProductCatalogGateway").getAllNotOnWeb()>	
			</cfif>
			<cfset event.noRender()>
		<cfelse>
			<cfset rc.products = getPlugin("ioc").getBean("ProductCatalogGateway").getAllAsQuery()>
			<cfset rc.boundaries = getPlugin("paging").getBoundaries()>
			<cfset event.setView("catalog/index")>		
		</cfif>
	</cffunction>


	<cffunction name="updateProducts" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset rc.products = getPlugin("ioc").getBean("ProductCatalogGateway").getAllAsQuery()>

		<cfset rc.boundaries = getPlugin("paging").getBoundaries()>

		<cfset event.setView("catalog/index")>
		
	</cffunction>
	

	<cffunction name="getAllDivisions" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.divisions = getPlugin("ioc").getBean("DivisionGateway").getDivisions()>
		
		<cfset event.noRender()>
				 
	</cffunction>

	<cffunction name="getAllClasses" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.classes = getPlugin("ioc").getBean("ClassGateway").getClasses()>
		
		<cfset event.noRender()>
				 
	</cffunction>
	
	<cffunction name="getAllColors" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.colors = getPlugin("ioc").getBean("ColorGateway").getAll()>
		
		<cfset event.noRender()>
				 
	</cffunction>
	
	
	<cffunction name="getAllDiscounts" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.discounts = getPlugin("ioc").getBean("DiscountGateway").getAll()>
		
		<cfset event.noRender()>
				 
	</cffunction>
	



</cfcomponent>