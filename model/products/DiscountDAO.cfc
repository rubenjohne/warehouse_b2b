<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Discount">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	discountID, description, percent
			from ts_discounts
			where discountID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Discount").init();
			obj.setdiscountID(qRead.discountID);
			obj.setdescription(qRead.description);
			obj.setpercent(qRead.percent);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Discount">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getdescription()>
		<cfset var local2=arguments.bean.getpercent()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_discounts(description, percent)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select discountID
				from ts_discounts
				where description = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and percent = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				order by discountID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setdiscountID(qGetID.discountID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Discount">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_discounts
			set description = <cfqueryparam value="#arguments.bean.getdescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				percent = <cfqueryparam value="#arguments.bean.getpercent()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getpercent() eq ""), de("yes"), de("no"))#" />
			where discountID = <cfqueryparam value="#arguments.bean.getdiscountID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Discount">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_discounts
			where discountID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getdiscountID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>