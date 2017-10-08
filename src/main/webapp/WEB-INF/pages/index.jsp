<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    /*
     * ELB checks your application's health by periodically
     * sending an HTTP HEAD request to a resource in your application. By
     * default, this is the root or default resource in your application,
     * but can be configured for each environment.
     *
     * Here, we report success as long as the app server is up, but skip
     * generating the whole page since this is a HEAD request only. You
     * can employ more sophisticated health checks in your application.
     */
    if (request.getMethod().equals("HEAD")) return;
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>DevOps on AWS</title>
    <meta name="viewport" content="initial-scale=1.0">
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
    <link rel='stylesheet' href='css/theme.css'>
</head>
<body role="document">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">DevOps on AWS</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <% if (!((String) request.getAttribute("deploymentGroupName")).contains("demo")) { %>
    <div class="alert alert-info" role="alert">
      <p><strong>AWS CodeDeploy Application:</strong> ${applicationName}</p>
      <p><strong>AWS CodeDeploy Deployment Group:</strong> ${deploymentGroupName}</p>
      <ul>
        <% for (final String instance : (List<String>) request.getAttribute("instanceIds")) { %>
          <% if (((Map<String, String>) request.getAttribute("instanceStates")).containsKey(instance)) { %>
            <li> <%= instance %> - Instance Health: <%= ((Map<String, String>) request.getAttribute("instanceStates")).get(instance) %></li>
          <% } else { %>
            <li> <%= instance %> - Instance Health: Unknown</li>
          <% } %>
        <% } %>
      </ul>
    </div>
  <% } %>
  <div class="jumbotron">
      <h1>Application is live</h1>
      <p><i>it works! #buildwithAWS</i></p>
    </div>
  <div class="container theme-showcase" role="main">
    <% if (((String) request.getAttribute("deploymentGroupName")).contains("demo")) { %>
      <div class="alert alert-dismissible alert-warning">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h1>Grand Opening!</h1>
        <p>To celebrate our grand opening, this week only all suits are <b>25% off</b> and include <b>free shipping!</b></p>
        <div class="row">
          <h2><center>Transform your dog from silly to stylish!</center></h2>
          <div class="col-sm-4">
            <center><img src="images/sales-lobsterdog.png" style="width:287px;height:360px;"></center>
          </div>
          <div class="col-sm-4" style="font-size: 300px">
            <center>&#8594;</center>
          </div>
          <div class="col-sm-4">
            <center><img src="images/classy-dog1.png" style="width:268px;height:360px;"><center>
          </div>
        </div>
      </div>
    <% } %>
    
  </div>
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
