<%@ Page Title="Prediction" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Prediction.aspx.cs" Inherits="Prediction" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Select Date to Predict</h2>
    </hgroup>

    <article>
        <asp:Calendar ID="dateCalendar" runat="server" OnSelectionChanged="dateCalendar_SelectionChanged"></asp:Calendar>
        <p>
            <asp:Label ID="predictLabel" runat="server" Text="Pridict Date:"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </p>
        <asp:Label ID="maxLabel" runat="server" Text="Maximum Humidity:"></asp:Label>
        <asp:TextBox ID="max" runat="server" Text="" ForeColor="Red" Width="6em"></asp:TextBox>
        <br />
        <asp:Label ID="minLabel" runat="server" Text="Minimum Humidity:"></asp:Label>
        <asp:TextBox ID="min" runat="server" Text="" ForeColor="#00CC00" Width="6em"></asp:TextBox>
        <br />
        <asp:Label ID="aveLabel" runat="server" Text="Average Humidity:"></asp:Label>
        <asp:TextBox ID="ave" runat="server" Text="" ForeColor="#0099FF" Width="6em"></asp:TextBox>
    </article>

    <aside>
        <h3>About</h3>
        <p>In order to predict future weather condition, we take last week before our target and a week with largest similarity from previous year to calculate the mean variation of each day’s weather condition. If we regard the predicted value as the real value, this algorithm turns into continuous sliding algorithm, which produce the result for the this website.  <a href="About.aspx#H2">Learn more…</a> </p>
    </aside>
    </asp:Content>