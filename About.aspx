<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <article>
        <h2 id="introduction">Introduction</h2>
        <p>        
            Weather prediction has almost been a very exciting field that attracted human interest since very early times. One of the reason of its attraction is its profound importance in our everyday life. But unfortunately there is always some probability that is related to the results accuracy.  Almost every human activity is either directly or indirectly affected by weather, some of the human tasks require very specific and accurate weather predictions e.g. air traffic control application, where data of every minute is crucial especially during bad weather. Other applications requiring accurate prediction of weather include atmospheric changes study for satellite launches, storms and hurricane forecasts and energy consumption estimation for vehicles e.g. electric cars. The main sources of weather data are from weather radars and satellites, but there are some specific limitations of those e.g. radars measurements are dependent on radar beam characteristics as well as surrounding terrain and always affected by ground clutter. The measurements are always affected by the weather conditions e.g. the measurements in rain are quite troublesome due to fading problem, also in case of snow the measurements will depend on the physical structure of the ice while the radio waves are reflected back from it. The weather satellites are mainly of two types namely polar and geo based on which orbit they are in. The satellites in polar orbit though have a good view of the earth but there are frequent hand offs due to small foot print, in case of geo satellites though the footprint is large but due to large distance apart, there is always a chance that the satellite will misinterpret the weather conditions. So, we need some statistical based method that may predict future weather alongside those real time data in order to give redundancy in accurate weather prediction and filling up gaps in absence of weather data or spanning the weather data more for particular occasions than normal e.g. air traffic management in bad weather. 
        </p>

        <p>        
            In order to evaluate future based weather prediction we have used the concept of using past weather data variations for this task. The probability of weather condition on a particular day matching with the one in the past on the same year is very less but it is very highly probable that it will match with the weather conditions within a span of e.g. two weeks’ time in the previous year is quite high, so using that concept, so a sliding window is selected of particular size with respect to the size of two weeks weather condition taken from the previous year. The sliding window of every week is then matched with the current year window and the best matched window is selected to predict weather conditions for the current year future values.  The accuracy of result is dependent on the length of the span of the past data that we take in to consideration. We have collected data of past 9 years starting from 2006 to 2014 for our analysis from the NOAA (National Ocean and Atmospheric Administration) website. The data from the website was in raw from, we converted it in to usable form using Matlab data extraction methods. Out of the many attributes of weather available on the website we selected only 12 attributes initially for classification using KNN algorithm that is part of the training process. Using those attributes we will find what is the prediction probability that the weather will repeat given our current value. We then used Window sliding method to predict weather of three attributes after the KNN algorithm results to better refine our prediction and get the testing and validation based on it and using the best window obtained for prediction. The predictions are made on data on the basis of months for a span of 9 years. The reason only few weather attribute fields are selected for prediction is that those weather condition results are independent of the type of the algorithm used and are consistent over a large span of time based on empirical results. The results obtained using the above mentioned approach are quite high and accuracy is above 95%. 
        </p>

        <h2 id="methodology">Methodology</h2>
        <p>        
            The project can be divided in to three stages of implementation. The first stage is the extraction of relevant data from website and converting it to corresponding weather attributes to be used in later stages. In the second stage KNN algorithm is used for classification of the attributes selected before the window sliding can be applied. This step is used as part of reinforcing and add accuracy to our data results as compared to just applying the attributes directly to the window sliding algorithm. Before applying the KNN algorithm we pass it through the data preprocessing block. In the third stage window sliding algorithm is used to select the best window from traversing it over past data and that best window is used for predicting the three weather attributes for future. 
        </p>

        <h3 id="stage1">Stage1. Data Retrieval </h3>
        <p>
            This step involves retrieving data from the NOAA website. We selected the data for Miami and Tallahassee for analysis from 2006 to 2014. We actually build our future prediction for the Miami weather and Tallahassee data was added to increase redundancy and countercheck our algorithms. There were many hindrances to extract the required data from the website. First one was to decide which weather attributes we should select from the website data. For that we selected those attributes that had non-zero for most of the time in the month as well as higher mean and variance for given months. We selected 12 weather attributes for our initial analysis.  The second task was assigning proper values to each weather conditions e.g. “RA” means rain at a particular day whereas “TSRA” means thunderstorm and rain etc. so those were classified as 0 and 1 with respect to their presence at a certain day or not. The third task was exporting that data from the website, the data was quite large as we considered 9 years for the analysis so it was 3238 days data each with 10 attributes each. Matlab was used for extraction and loading of data in to meaningful weather attributes. 
        </p>
        <h3 id="H1">Stage2. Data Preprocessing and KNN algorithm  </h3>
        <p>
            In this stage we passed the attributes that we have selected in the data retrieval stage in to the KNN algorithm. But before that we tuned our attributes using RankSearch and Zscore method. RankSearch was used to remove unwanted data and Zscore was used to normalize the values. The tool used here is WEKA. The data preprocessing stage is shown below:
        </p>
        <img src="Images/1.png" width="100%" />
        <div class="tag">Figure 1: Data preprocessing block diagram</div>
        <p>
            As can be seen from figure1 that the data preprocessing module is before the actual loading of data in to the KNN. Rank Search of the selected weather attributes is shown below:
        </p>
        <img src="Images/2.jpg" width="100%" />
        <div class="tag">Figure 2: Weather attributes processing</div>
        <p>
            Where the attributes selected are Maximum temperature, Minimum Temperature, Average Temperature, Average wet, Averge dew, Heat in degrees, Coolness in degrees, Drizzle, Thunder storm in vicinity, Water equivalence in air, sea level and resultant direction of the wind. As can be easily seen that all those weather attributes are interlinked with each other closely and any other weather condition that may occur can be predicted by tracing the change in those attribute values. A snap of those attributes loaded with their repective values is shown below:
        </p>
        <img src="Images/3.jpg" width="100%" />
        <div class="tag">Figure 3: Weather attributes with their respective values</div>
        <ul class="nodotli">
            <li>Where for the Zscore method we have used</li>
            <li>Scope change： -2~+2</li>
            <li>Function：Z=(X-μ)/σ</li>
            <li>Where μ is the mean and σ  is the variance for each attribute X. </li>
            <li>After the data preprocessing step we get our attributes assigned new values based on RankSearch and Zscore as follows</li>
        </ul>
        <img src="Images/4.jpg" width="100%" />
        <div class="tag">Figure 4: Weather attributes after preprocessing</div>
        <p>
            Next the data is loaded in to the KNN algorithm that is based on Eucledian distance. The algorithm is written in Python. For classification and Predictions we have:
        </p>
        <ul class="nodotli">
            <li>Label = -1,0,1</li>
            <li>-1: Reduce the temperature</li>
            <li>0: The temperature did not change</li>
            <li>1: Temperature rise</li>
        </ul>
        <p>
            We have used temperature as our pivotal selection criteria in order to check whether the weather conditions will come back or recur again given the current weather condition. We test the real value in the process of comparing the return value. If not equal, the prediction error. On the other hand, the right.
        </p>
        <p>
            The projections for k = 1，3，4，8， 10，11，13，15，16，20，25，30，45，100. The following gives some examples of prediction：
        </p>
        <img src="Images/5.png" width="100%" />
        <span>Result:</span>
        <img src="Images/5r.png" width="50%" />
        <div class="tag">Figure 5: Weather projections for K=1</div>

        <p></p>
        <img src="Images/6.png" width="100%" />
        <span>Result:</span>
        <img src="Images/6r.png" width="50%" />
        <div class="tag">Figure 6: Weather projections for K=8</div>

        <p></p>
        <img src="Images/7.png" width="100%" />
        <span>Result:</span>
        <img src="Images/7r.png" width="50%" />
        <div class="tag">Figure 7: Weather projections for K=20</div>

        <p>
            The ultimate test result was when k=20, we can get the lowest error rate. The accuracy rate is 84.2%. So it was selected.
        </p>

        <h3 id="H2">Stage3. Sliding Window Algorithm implementation </h3>
        <p>
            The basic purpose of using the sliding window algorithm here is to use the concept that weather condition of a specific day is related to the fortnight around it. Now as we know that with particular set of attributes we will have maximum probability that the weather will come back or recur given the current condition so now we can use a sliding window in order to predict the future weather. For that we will select only three attributes instead of all 12 as we have processed before, as those attributes can best predict the future weather condition but also will scale down our measurements. The three attributes selected for future prediction are maximum temperature, minimum temperature, and average wet with smoothed fluctuations and normalized with Zscore as before. In order to predict weather conditions of a particular day we will consider the weather conditions associated in the previous week that is already known and also the condition of weather for seven previous and next upcoming seven days of previous year are considered for calculation. Next assume that we want to predict the weather condition of Jan 8th 2014, for current year, the last week before this date will be taken into consideration, and for previous year, the fortnight data around the Jan 8th will also be counted as:
        </p>

        <img src="Images/8-1.png" width="100%" />
        <img src="Images/8-2.png" width="100%" />
        <div class="tag">Figure 8: Sliding window calculations</div>
        <p>
            The sliding window is used to match the dependencies as seen previously with the variations of the current year throughout the week. The window that turns out to be the maximum or window with best matched is employed to make predictions for future weather conditions. The use of matching sliding window is because particular weather conditions relating to a year may not be exactly correlated with or lie with in the similar date of previous year. That is the reason of using previous one week or previous seven days. So in all we checked the fortnight period in total for the previous condition in order to find the similar one. Sliding window helps in capturing the variations that corresponds to variations of the current year.  
        </p>
        <p>
            For each year, we have 14 samples, as dictated by sliding window algorithm. Form ID number1 to ID number 7 is belongs to window 1 ,and from ID number 2 to ID number 8 it belongs to window 2.
        </p>
        <p>
            So overall, there are 8 windows for each year and 72 windows for 9 years.
        </p>

        <img src="Images/9.png" width="100%" />
        <div class="tag">Figure 9: Two sliding windows w1 and w2</div>
        <p>
            Following are the steps taken 
            (CD is 7 days data, PD(i) is the previous window)
        </p>
        <ul class="nodotli">
            <li>Step 1</li>  
            <li>for i = 1: 64</li>
            <li>if(sim(CD, PD(i)) > max_sim)</li>
            <li>max_sim  = sim(CD,PD) ;</li>
            <li>Step 2</li>
            <li>mean_var_CD = sum(var_CD(i))/ 6;</li>
            <li>mean_var_PD = sum(var_PD(i))/ 6;</li>
            <li>Step 3</li>
            <li>mean_var = (mean_var_CD + mean_var_PD)/2;</li>
            <li>Step 4</li>
            <li>Jan 8th 2014 = Jan 7th 2014 + mean_var;</li>
        </ul>
        <div class="tag">(*Mathematical calculations above taken from [2])</div>
        <p>
            The accuracy obtained using this approach is above 95%. 
            Error rate = (predict_value - real_value)/real_value
            Accuracy = 1 - Error rate
        </p>

        <h2 id="H3">Simulations and results</h2>
        <p>
            Matlab was used for the simulation of the sliding window algorithm for our approach. Following are the results we obtained from the simulations:
        </p>
        <img src="Images/10.png" width="100%" />
        <div class="tag">Figure 10: Graph between actual and calculated Max. Temp vs days. </div>
        <p></p>
        <img src="Images/11.png" width="100%" />
        <div class="tag">Figure 11: Graph between actual and calculated Min. Temp vs days.</div>
        <p></p>
        <img src="Images/12.png" width="100%" />
        <div class="tag">Figure 12: Graph between actual and calculated Wet vs days.</div>
        <p>
            This algorithm can also realize the continuous prediction by simple change the algorithm slightly. If we want to predict the weather condition after next day. We can predict the weather condition of next day first, then use the predicted next day weather condition as the real data. Then we can predict the day after that.
        </p>
        <img src="Images/13.png" width="100%" />
        <div class="tag">Figure 13: Graph between sliding and continuous sliding window.</div>

        <h2 id="H4">Conclusion</h2>
        <p>
            As can be seen from the results obtained that temperature for minimum and maximum and wet over range of whole year has been plotted between the previous values using the proposed methodology and the real values. Both of them (real value and calculated values ) are in coherence for most of the plot except for some rapid changing conditions. The algorithm can also predict the continuous weather as shown in figure 13 that the continuous sliding window is following the actual sliding window closely. The accuracy is quite high as depicted in the graphs. We can also tune the accuracy of the results by changing the window size. Increasing the window size tends to increase the accuracy but would incur a lot of overhead.
        </p>
        <p>
            There are certain limitations of the scheme especially for the cases where there are rapidly changing weather conditions. Also it performs poorly when the attributes have very large deviation within themselves e.g.
        </p>
        <img src="Images/14.png" width="30%" />
        <div class="tag">Figure 14: Large variations for the attribute rainfall.</div>
        <p>
            As can be seen that is large variation among the rainfall attributes, in that case the scheme does not properly follow the actual weather conditions. 
        </p>
        <h2 id="H5">Reference</h2>
        <ul class="nodotli">
            <li>[1]	J. K. Williams, D. A. Ahijevych, C. J. Kessinger, T. R. Saxen, M. Steiner, S. Dettling “A machine learning approach to finding weather regimes and skillful predictor combinations for short-term storm forecasting” National Center for Atmospheric Research, Boulder, Colorado</li>
            <li>[2]	P. Kapoor, S. S. Bedi “Weather forecasting using sliding window algorithm”. Research article,  ISRN Signal Processing Volume 2013, Article ID 156540  </li>
            <li>[3]	N. Sharma, P. Sharma, D. Irwin, P. Shenoy “Predicting Solar Generation from Weather Forecasts Using Machine Learning” Dept. of Comp. Science, University of Massachusetts Amherst</li>
            <li>[4]	T. Rao, N. Rajasekhar, T. V. Rajinikanth, “An efficient approach for Weather forecasting using Support Vector Machines” International Conference on Computer Technology and Science (ICCTS 2012) Singapore</li>
            <li>[5]	Angalakudati, Mallikarjun,  Calzada, Jorge, Farias, Vivek, Gonynor, Jonathan “Improving emergency storm planning using machine learning” T&D Conference and Exposition, 2014 IEEE PES, April 2014</li>
            <li>[6]	L. Al-Matarneh, A. Sheta , S. Bani-Ahmad , J. Alshaer, I. Al-oqily “Development of Temperature-based Weather Forecasting Models Using Neural Networks and Fuzzy Logic” International Journal of Multimedia and Ubiquitous Engineering, Vol. 9, No. 12 (2014), pp. 343-366.</li>
            <li>[7]	K. Rasouli,  W. W. Hsieh ,  A. J. Cannon “Daily streamflow forecasting by machine learning methods with weather and climate inputs” Journal of hydrology, Science Direct, volume 414-415, 11 January 2012, Pages 284–293.</li>
        </ul>
    </article>

    <aside>
        <h3>Content</h3>
        <ul>
            <li><a runat="server" href="#introduction">Introduction</a></li>
            <li><a runat="server" href="#methodology">Methodology</a></li>
            <li><a runat="server" href="#stage1">1.Data Retrieval</a></li>
            <li><a runat="server" href="#H1">2.Data Preprocessing and KNN algorithm</a></li>
            <li><a runat="server" href="#H2">3.Sliding Window Algorithm implementation</a></li>
            <li><a runat="server" href="#H3">Simulations and results</a></li>
            <li><a runat="server" href="#H4">Conclusion</a></li>
            <li><a runat="server" href="#H5">Reference</a></li>
        </ul>
    </aside>
    <script type="text/javascript">
        
        var menuLeft = $('aside').offset().left;	
        var stickyTop = $('aside').offset().top;	

        var stickyMenu = function () {

            // current distance top
            var scrollTop = $(window).scrollTop();
            //console.log(stickyTop + ":" + scrollTop);
            // if we scroll more than the navigation, change its position to fixed and add class 'fxd', otherwise change it back to absolute and remove the class
            if (scrollTop > stickyTop) {
                $('aside').css({ 'position': 'fixed', 'left': menuLeft, 'top': 0 });

            } else {
                $('aside').css({ 'top': stickyTop, 'left': menuLeft });
            }
        }
        $(window).scroll(function() {
            stickyMenu();
        });
    </script>
</asp:Content>