<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Color">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	colorID, colorCode, colorDescription
			from ts_colors
			where colorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Color").init();
			obj.setcolorID(qRead.colorID);
			obj.setcolorCode(qRead.colorCode);
			obj.setcolorDescription(qRead.colorDescription);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Color">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getcolorCode()>
		<cfset var local2=arguments.bean.getcolorDescription()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_colors(colorCode, colorDescription)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select colorID
				from ts_colors
				where colorCode = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and colorDescription = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				order by colorID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setcolorID(qGetID.colorID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Color">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_colors
			set colorCode = <cfqueryparam value="#arguments.bean.getcolorCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				colorDescription = <cfqueryparam value="#arguments.bean.getcolorDescription()#" cfsqltype="CF_SQL_VARCHAR" />
			where colorID = <cfqueryparam value="#arguments.bean.getcolorID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Color">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_colors
			where colorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getcolorID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>