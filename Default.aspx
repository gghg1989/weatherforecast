<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Weather Forcast.</h1>
                <h2>Using Data Mining Technology to discover weather mystery.</h2>
            </hgroup>
            <p>
                The weather prediction has always been considered to be very interesting and essential for everyday human activities and effect directly and indirectly almost every aspect of life. The task of weather prediction is mostly performed now a days with the help of weather radars and weather satellites where real time data as well as images are used for weather prediction. But prediction of weather using those two modes have their limitations so we cannot totally rely upon them and requires some statistically based prediction alongside the real time data for more accurate estimation. In order to perform this task, we have used the data available from past and used it to predict the future weather using data mining and machine learning methods alongside the meteorological data. We have predicted weather based on three attributes namely maximum, minimum temperature and average wetness as these three parameters play an important role in overall prediction of weather and are calculated more distinctly than the other attributes. KNN algorithm and sliding window methods are used for calculations. Matlab, Weka and Python are used for data retrieval and algorithm implementation and results validation.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Research Methodology:</h3>
    <ol class="round">
        <li id="one" class="one">
            <h5>Data Retrieval </h5>
           This step involves retrieving data from the NOAA website. We selected the data for Miami and Tallahassee for analysis from 2006 to 2014. We actually build our future prediction for the Miami weather and Tallahassee data was added to increase redundancy and countercheck our algorithms. There were many hindrances to extract the required data from the website. First one was to decide which weather attributes we should select from the website data. For that we selected those attributes that had non-zero for most of the time in the month as well as higher mean and variance for given months. We selected 12 weather attributes for our initial analysis.  The second task was assigning proper values to each weather conditions e.g. “RA” means rain at a particular day whereas “TSRA” means thunderstorm and rain etc. so those were classified as 0 and 1 with respect to their presence at a certain day or not.  
            <a href="About.aspx#stage1">Learn more…</a>
        </li>
        <li id="two" class="two">
            <h5>Data Preprocessing and KNN algorithm</h5>
            In this stage we passed the attributes that we have selected in the data retrieval stage in to the KNN algorithm. But before that we tuned our attributes using RankSearch and Zscore method. RankSearch was used to remove unwanted data and Zscore was used to normalize the values.
            <a href="About.aspx#H1">Learn more…</a>
        </li>
        <li id="three" class="three">
            <h5>Sliding Window Algorithm implementation</h5>
            The basic purpose of using the sliding window algorithm here is to use the concept that weather condition of a specific day is related to the fortnight around it. 
Now as we know that with particular set of attributes we will have maximum probability that the weather will come back or recur given the current condition so now we can use a sliding window in order to predict the future weather. For that we will select only three attributes instead of all 12 as we have processed before, as those attributes can best predict the future weather condition but also will scale down our measurements. The three attributes selected for future prediction are maximum temperature, minimum temperature, and average wet with smoothed fluctuations and normalized with Zscore as before.
            <a href="About.aspx#H2">Learn more…</a>
        </li>
    </ol>
</asp:Content>