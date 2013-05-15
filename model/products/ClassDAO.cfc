<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Class">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	classID, classCode, classDescription
			from ts_class
			where classID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Class").init();
			obj.setclassID(qRead.classID);
			obj.setclassCode(qRead.classCode);
			obj.setclassDescription(qRead.classDescription);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Class">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getclassCode()>
		<cfset var local2=arguments.bean.getclassDescription()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_class(classCode, classDescription)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select classID
				from ts_class
				where classCode = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and classDescription = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				order by classID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setclassID(qGetID.classID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Class">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_class
			set classCode = <cfqueryparam value="#arguments.bean.getclassCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				classDescription = <cfqueryparam value="#arguments.bean.getclassDescription()#" cfsqltype="CF_SQL_VARCHAR" />
			where classID = <cfqueryparam value="#arguments.bean.getclassID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Class">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_class
			where classID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getclassID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>