<!-----------------------------------------------------------------------
Author 	 :	Your Name
Date     :	September 25, 2005
Description :
	This is a ColdBox event handler where all implicit methods can go.
	Thus its the main handler.

Please note that the extends needs to point to the eventhandler.cfc
in the ColdBox system directory.
extends = coldbox.system.eventhandler

----------------------------------------------------------------------->
<cfcomponent name="main" extends="coldbox.system.eventhandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<!--- This init is mandatory, including the super.init(). --->
	<cffunction name="init" access="public" returntype="main" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<!--- Any constructor code here --->
		<cfreturn this>
	</cffunction>

<!------------------------------------------- GLOBAL IMPLICIT EVENTS ONLY ------------------------------------------>
<!--- In order for these events to fire, you must declare them in the coldbox.xml.cfm --->
	
	<cffunction name="onAppInit" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- ON Application Start Here --->
	</cffunction>

	<cffunction name="onRequestStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- On Request Start Code Here --->
	</cffunction>

	<cffunction name="onRequestEnd" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- ON Request End Here --->
	</cffunction>
	
	<cffunction name="onSessionStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- ON session start Here --->
	</cffunction>
	
	<cffunction name="onSessionEnd" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- ON session End Here --->
		<cfset var sessionScope = event.getValue("sessionReference")>
		<cfset var applicationScope = event.getValue("applicationReference")>
		
	</cffunction>

	<cffunction name="onException" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- ON Exception Handler Here --->
		<cfscript>
			//Grab Exception From request collection, placed by ColdBox
			var exceptionBean = event.getValue("ExceptionBean");
			//Place exception handler below:

		</cfscript>
	</cffunction>


</cfcomponent>