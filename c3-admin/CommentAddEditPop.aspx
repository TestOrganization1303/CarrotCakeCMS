﻿<%@ Page ValidateRequest="false" Title="Comment Add/Edit" Language="C#" MasterPageFile="MasterPages/MainPopup.Master" AutoEventWireup="true"
	CodeBehind="CommentAddEditPop.aspx.cs" Inherits="Carrotware.CMS.UI.Admin.c3_admin.CommentAddEditPop" %>

<%@ MasterType VirtualPath="MasterPages/MainPopup.Master" %>
<%@ Register Src="ucCommentAddEdit.ascx" TagName="ucCommentAddEdit" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
	Comment Add/Edit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
	<uc1:ucCommentAddEdit ID="ucCommentAddEdit1" runat="server" ReturnPage="CommentIndexPop.aspx" IsFullSite="false" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="NoAjaxContentPlaceHolder" runat="server">
</asp:Content>