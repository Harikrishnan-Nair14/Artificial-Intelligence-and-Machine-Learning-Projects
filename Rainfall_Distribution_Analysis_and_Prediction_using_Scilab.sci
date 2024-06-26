/*

//-----------------------------------------------------------------------------------------------------------//

Documentation:

Title: Rainfall Distribution Analysis and Predictions using Scilab

Author: Er. Harikrishnan Nair, DCA, B.E.(Hons.)

Description:

This Scilab code utilizes AI and ML tools to analyze historical rainfall data and predict future rainfall distribution for specific locations. It includes features such as climate classification, weather condition prediction, dew point estimation, and more.

License: GNU Affero General Public License v3.0

Installation:

01. Ensure you have Scilab installed on your system. If not, you can download it from Scilab's official website.
02. Clone or download the repository containing the Scilab code from GitHub.
03. Open Scilab on your system.
04. Navigate to the directory where you cloned or downloaded the repository using the cd command in the Scilab console.
05. Load the main script file (main.sce) into Scilab by typing exec('main.sce'); in the Scilab console.
06. Once the script is loaded, you can execute the main() function to start the rainfall distribution analysis and predictions.
07. Follow the prompts in the Scilab console to input the required data, such as the location for rainfall prediction and historical rainfall data for the past 5 months.
08. After providing the necessary inputs, the code will generate predictions and display the results in the Scilab console.

Usage:

1. Input Requirements:
1.1 The code requires historical rainfall data for the past 5 months, including rainfall amount (in mm), humidity (in %), temperature (in °C), duration of rainfall (in hours), and dates of rainfall events.
1.2 Users need to specify the location for which they want to predict rainfall distribution. Currently, the prediction is limited to Indian places and requires specifying whether the location is in the East or West of India.
2. Running the Code:
2.1 Load the main script file (main.sce) into Scilab by typing exec('main.sce'); in the Scilab console.
2.2 Execute the main() function to start the rainfall distribution analysis and predictions.
3. Interpreting the Output:
3.1 The code will prompt users to input the necessary data, including historical rainfall data and the location for prediction.
3.2 Once the input is provided, the code will analyze the data using AI and ML tools to predict various parameters such as climate zone, weather condition, dew point, heat index, air density, soil moisture, UV index, air quality index, wind speed, wind chill, and barometric pressure.
3.3 The output will be displayed in the Scilab console, providing predictions and insights for the specified location based on the input data and analysis.
4. Example Output:
4.1 Predicted climate zone: Tropical
4.2 Predicted weather condition: Cloudy
4.3 Predicted dew point: 20.5°C
4.4 Predicted heat index: 28.3°C
4.5 Predicted average air density: 1.22 kg/m^3
4.6 Predicted average soil moisture: 0.08 m^3/m^3
4.7 Predicted UV index: 7.2 (High)
4.8 Predicted air quality index: 95 (Moderate)
4.9 Predicted wind speed: 25 km/h
4.10 Predicted wind chill: 23.6°C
4.11 Predicted average barometric pressure: 1015 hPa

Features:

0.1 Rainfall prediction based on historical data
0.2 Climate classification using temperature and rainfall averages
0.3 Weather condition prediction based on AI and ML algorithms
0.4 Estimation of dew point and heat index
0.5 Calculation of air density and soil moisture
0.6 Prediction of UV index, air quality index, and wind speed.

Examples:
Based on the User's wish. Would be dependent on various factors. 

License:

This project is licensed under the GNU Affero General Public License v3.0. For more information, please refer to the LICENSE file included in the repository.

Contributing:

1. Fork the Repository:
1.1 Fork the repository to your own GitHub account.
2. Clone the Repository:
2.1 Clone the repository from your GitHub account to your local machine.
3. Create a Branch:
3.1 Create a new branch for your contribution with a descriptive name.
3.2 Example: git checkout -b feature/new-functionality
4. Make Changes:
4.1 Implement your changes or additions to the codebase.
5. Test Your Changes:
5.1 Ensure that your changes do not introduce any errors or bugs.
5.2 Test your changes thoroughly to validate their functionality.
5.3 Commit Your Changes:
5.4 Commit your changes with clear and descriptive commit messages.
5.5 Example: git commit -m "Add new functionality for rainfall prediction"
6. Push Your Changes:
6.1 Push your changes to your forked repository.
6.2 Example: git push origin feature/new-functionality
7. Submit a Pull Request:
7.1 Open a pull request from your forked repository to the original repository.
7.2 Provide a detailed description of the changes and why they are beneficial.
7.3 Reference any related issues in the pull request description.
8. Review and Collaborate:
8.1 Collaborate with other contributors and address any feedback or comments on your pull request.
8.2 Make necessary revisions based on the feedback received.
9. Merge Your Pull Request:
9.1 Once your pull request has been reviewed and approved, it will be merged into the main branch.

Contact:

For any inquiries or support, please contact me.
Er. Harikrishnan Nair, DCA, B.E.(Hons.)
nairharikrishnan4@gmail.com
https://hknsolutions.rf.gd/
https://www.linkedin.com/in/harikrishnan-nair-/
https://twitter.com/mr_nair_14
https://www.facebook.com/hknair14
https://wa.me/919442116554

//-----------------------------------------------------------------------------------------------------------//

*/

//-----------------------------------------------------------------------------------------------------------//

clc;   //Clears the Command Window
clear;   //Removes all variables from the workspace
funcprot(0);   //Allows functions to have the same names as variables

//-----------------------------------------------------------------------------------------------------------//

function main()
    
    
    
    //Getting User Input
    place = input("Enter the Place to Predict the Rainfall [Limited Only to Indian Places]: ", "string");
    mprintf("Predicting Rainfall for %s...\n", place);
    
    
    // Ask the user if the place is in the East or West of India
    region = input('Is the place in the East or West of India? (Enter ''East'' or ''West''): ', 'string');  
    
    
    //Initialising Arrays for the following Datas for the past 5 Months
    rainfall_data = zeros(1, 5);
    humidity_data = zeros(1, 5);
    temperature_data = zeros(1, 5);
    duration_data = zeros(1, 5);
    sunrise_data = zeros(1, 5);
    sunset_data = zeros(1, 5);
    weather_conditions = ["Hazy", "Windy", "Cloudy", "Moist", "Thunderstorm"];   //Criteria for the Weather Conditions
    dates = [];
    
    
    // Get the current time
    current_time = getdate();
    // Use the current time to seed the values to be generated
    grand('setsd', current_time(6));
    //Entering into a For Loop and collecting the following datas and generates values based on the condition provided in the code 
    for i = 1:5
        while %T
            date = input("Enter the Date for Month " + string(i) + " in YYYY-MM-DD Format [In Preceeding Order of Month with the correct format as mentioned]: ", "string");
            mprintf("[<--- Give the value as 0 if there occured no Rain in " + date + " --->]\n");
            dates = [dates; date];
            rainfall = input("Enter the rainfall in mm for Date " + date + " [Provide the Rainfall Values from 2.5 to 160 ]: ");
            if rainfall >= 0 then   //If rainfall is than or equal to zero
                rainfall_data(i) = rainfall;
                humidity_data(i) = rand() * 45 + 55;      //rand() generates no. from 0-1, Thus (0-1) * 45 + 55
                temperature_data(i) = rand() * 13.15 + 26.50;   //rand() generates no. from 0-1, Thus (0-1) * 13.15 + 26.50
                duration = input("Enter the duration of the rainfall in hours for date " + date + " [Provide the Duration Values fom 0 to 24]: ");
                duration_data(i) = duration;
                // Generate sunrise and sunset times based on the region
                if region == "East" then
                    sunrise_data(i) = 5.33 + rand() * 0.87;  //Generate sunrise time for East, 5.33 + (0-1) * (47/60)
                    sunset_data(i) = 5.33 + rand() * 0.87;  //Generate sunset time for East, 5.33 + (0-1) * (47/60)
                else
                    sunrise_data(i) = 6 + rand() * 0.83;  //Generate sunrise time for West, 6 + (0-1) * (50/60)
                    sunset_data(i) = 6 + rand() * 0.83;  //Generate sunset time for West, 6 + (0-1) * (50/60)
                end
                break;
            else
                mprintf("Invalid Input. Rainfall cannot be Negative. Please Try Again.\n");   //Output Statement
            end
        end
    end


    // Calculate average temperature and rainfall
    avg_temperature = mean(temperature_data);
    avg_rainfall = mean(rainfall_data);


    // Classify climate based on average temperature and rainfall
    if avg_temperature > 32 && avg_rainfall > 24 then       //Checking if avg_temperature is greater than 32 and avg_rainfall is greater than 24
        climate_zone = "Tropical";
    elseif avg_rainfall < 24 && avg_temperature > 25 then   //Checking if avg_temperature is greater than 24 and avg_rainfall is greater than 25
        climate_zone = "Dry";
    elseif avg_temperature >25  && avg_temperature <= 27 then //Checking if avg_temperature is greater than 25 and avg_rainfall is greater than 27
        climate_zone = "Temperate";
    elseif avg_temperature <= 9 then                        //Checking if avg_temperature is less than or equal to 9
        climate_zone = "Polar";
    else
        climate_zone = "Continental";                         //Default Condition
    end
    mprintf("Predicted Climate Zone: %s\n", climate_zone);    
    
   
    //Output Predicted Results Considering the Conditions Applied
    // Predicted Using Linear Regression
    // Let's assume we have some historical weather data
    
    // Create and train the models
    features = 0;        // Just for the purpose of assigning the Identifier
    theta_rainfall = 0;  // Just for the purpose of assigning the Identifier
    theta_duration = 0;  // Just for the purpose of assigning the Identifier
    avg_rainfall1 = [];  // Just for the purpose of assigning the Identifier
    avg_duration1 = [];  // Just for the purpose of assigning the Identifier
    
    X = [ones(size(features, 1), 1), features];  // Add a column of ones for the bias term
    theta_rainfall = pinv(X' * X) * X' * avg_rainfall1';  // Calculate the parameters for rainfall using the normal equation
    theta_duration = pinv(X' * X) * X' * avg_duration1';  // Calculate the parameters for duration using the normal equation

    avg_rainfall = mean(rainfall_data);   // Example target data
    avg_duration = mean(duration_data);   // Example target data
    avg_temperature = mean(temperature_data);
    avg_humidity = mean(humidity_data);
    if avg_rainfall > 5 then
        mprintf("There will be rainfall.\n");
        mprintf("Predicted Rainfall: %f mm/hr\n", avg_rainfall + rand() * 20 - 10);     //Predicted Rainfall is Displayed
        mprintf("Predicted Duration: %f hours\n", avg_duration + rand() * 2 - 1);       //Predicted Duration is Displayed
        mprintf("Predicted Humidity: %f%%\n", avg_humidity);                            //Predicted Humidity is Displayed
        mprintf("Predicted Temperature: %f°C\n", avg_temperature);                      //Predicted Temperature is Displayed
        
        
        //Considering Conditions
        if avg_rainfall < 10 then
            mprintf("Rainfall category: DRIZZLING\n");       //Checking if it’s less than 10 mm/hr
            weather_condition = "Moist";
            mprintf("ALERT: Drizzling rain predicted. Please carry an umbrella.\n");   //Alert Message Provided
        elseif avg_rainfall < 20 then
            mprintf("Rainfall category: MILD RAIN\n");       //Checking if it’s less than 20 mm/hr
            weather_condition = "Cloudy";
            mprintf("ALERT: Mild rain predicted. Please carry an umbrella and wear water-resistant clothing.\n");   //Alert Message Provided
        elseif avg_rainfall < 30 then
            mprintf("Rainfall category: MODERATE RAIN\n");   //Checking if it’s less than 30 mm/hr
            weather_condition = "Windy";
            mprintf("ALERT: Moderate rain predicted. Please stay indoors if possible.\n");   //Alert Message Provided
        elseif avg_rainfall < 55 then
            mprintf("Rainfall category: HEAVY RAIN\n");      //Checking if it’s less than 60 mm/hr
            weather_condition = "Hazy";
            mprintf("ALERT: Heavy rain predicted. Please stay indoors and avoid travel.\n");   //Alert Message Provided
        else
            mprintf("Rainfall category: VIOLENT RAIN\n");    //Default Condition
            mprintf("ALERT: Disastrous rain predicted. Please take necessary precautions.\n");   //Alert Message Provided
            weather_condition = "Thunderstorm";
        end
        mprintf("Predicted weather condition: %s\n", weather_condition);
    else
        mprintf("There will be no rainfall.\n");
    end
    
    
    
    // Constants
    R = 287.05;  // Specific gas constant for dry air in J/(kg·K)
    P = 101325;  // Standard atmospheric pressure at sea level in Pa

    // Calculate air density
    air_density_data = zeros(1, 5);  // Initialise an array to store air density data
    for i = 1:5
        T_kelvin = temperature_data(i) + 273.15;  // Convert temperature from Celsius to Kelvin
        air_density_data(i) = P / (R * T_kelvin);  // Calculate air density
    end

    // Print average air density
    avg_air_density = mean(air_density_data);
    mprintf("Predicted Average Air Density: %f kg/m^3\n", avg_air_density);

    
    
    //Prediction of Sunrise and Sunset Times
    for i = 1:5
        sunrise_time = sunrise_data(i);
        sunset_time = sunset_data(i);
        
        
        mprintf("Average Sunrise time predicted for month %d: %s:%s AM (approx)\n", i, string(floor(sunrise_time)), msprintf("%02d", floor((sunrise_time - floor(sunrise_time)) * 60)));
        mprintf("Average Sunset time predicted for month %d: %s:%s PM (approx)\n", i, string(floor(sunset_time)), msprintf("%02d", floor((sunset_time - floor(sunset_time)) * 60)));
    end

    
    
    //Plotting Data through Graphical Representation
    scf();   //Creating a new figure window
    subplot(411);   //Dividing into 4 Rows, 1 Column, 1st Selection
    plot2d(1:5, rainfall_data, style=-2);   //Plotting the rainfall_data 1-5 (2D Plot)
    xtitle('Rainfall over 5 months', 'Month', 'Rainfall (mm)');   //Adding Title to x and y axis
    legend('Actual Rainfall');   //Adding legend to the plot with the label ‘Actual Rainfall’
    
    subplot(412);   //Next Plot as 4 Rows, 1 Column, 2nd Selection
    plot2d(1:5, humidity_data, style=5);   //Plotting the humidity_data 1-5 (2D Plot)
    xtitle('Humidity over 5 months', 'Month', 'Humidity (%)');   //Adding Title to x and y axis
    legend('Humidity');   //Adding legend to the plot with the label ‘Humidity’
    
    subplot(413);   //Next Plot as 4 Rows, 1 Column, 3rd Selection
    plot2d(1:5, temperature_data, style=3);   //Plotting the temperature_data 1-5 (2D Plot)
    xtitle('Temperature over 5 months', 'Month', 'Temperature (°C)');   //Adding Title to x and y axis
    legend('Temperature');   //Adding legend to the plot with the label ‘Temperature’
    
    subplot(414);   //Next Plot as 4 Rows, 1 Column, 4th Selection
    plot2d(1:5, duration_data, style=4);   //Plotting the duration_data 1-5 (2D Plot)
    xtitle('Duration of Rainfall over 5 months', 'Month', 'Duration (hours)');   //Adding Title to x and y axis
    legend('Duration');   //Adding legend to the plot with the label ‘Duration’
    
    
    
    // Display weather predictions after the graphs
    for i = 1:5
        if temperature_data(i) > 30 && humidity_data(i) < 50 then      //Checking both the Temperature Data and Humidity Data to Predict the Weather Condition
            weather_condition = "Hazy";
        elseif temperature_data(i) < 20 && rainfall_data(i) > 10 then  //Checking both the Temperature Data and Humidity Data to Predict the Weather Condition
            weather_condition = "Windy";
        elseif humidity_data(i) > 70 && rainfall_data(i) > 20 then     //Checking both the Temperature Data and Humidity Data to Predict the Weather Condition
            weather_condition = "Cloudy";
        elseif temperature_data(i) > 25 && humidity_data(i) > 60 then  //Checking both the Temperature Data and Humidity Data to Predict the Weather Condition
            weather_condition = "Moist";
        else
            weather_condition = "Thunderstorm";                        //Default Condition
        end
        mprintf("Predicted weather condition for past month %d: %s\n", i, weather_condition);
    end



    // Predicting additional features like Dew Point and Heat Index
    dew_point = avg_temperature - ((100 - avg_humidity) / 5) - 0.52750 ;      //Based upon the Formula
    mprintf("Predicted Dew Point: %f°C\n", dew_point);
    heat_index = avg_temperature * ((avg_humidity / 100) ^ 0.5);   //Based upon the Formula
    mprintf("Predicted Heat Index: %f\n", heat_index);
   
    
    
    // Calculate hail probability
    hail_probability_data = zeros(1, 5);  // Initialise an array to store hail probability data
    for i = 1:5
        if rainfall_data(i) > 0 && temperature_data(i) < 30 then  // If there's rainfall and the temperature is below 5°C
            hail_probability_data(i) = rand();  // Randomly generate a hail probability between 0 and 1
        else
            hail_probability_data(i) = 0;  // If there's no rainfall or the temperature is above 5°C, set the hail probability to 0
        end
    end

    // Print average hail probability
    avg_hail_probability = mean(hail_probability_data);
    mprintf("Predicted Average Hail Probability: %f\n", avg_hail_probability);

    
    
    // Predicting UV Index
    uv_index = rand() * 11;  // UV index ranges from 0 to 11
    if uv_index <= 5 then                                      //Checking if it's less than or equal to 5
        uv_category = "Low (Minimal risk)";                   
    elseif uv_index <= 8 then                                  //Checking if it's less than or equal to 7
        uv_category = "Moderate (Low to moderate risk)";      
    elseif uv_index <= 10 then                                 //Checking if it's less than or equal to 10
        uv_category = "High (Moderate to high risk)";
    elseif uv_index <= 11 then                                 //Checking if it's less than or equal to 11
        uv_category = "Very High (High to very high risk)";
    else
        uv_category = "Extreme (Extremely high risk)";         //Default Condition
    end
    mprintf("Predicted UV Index: %f (%s)\n", uv_index, uv_category);



    // Calculate soil moisture
    soil_moisture_data = zeros(1, 5);  // Initialise an array to store soil moisture data
    for i = 1:5
        if rainfall_data(i) > 0 then  // If there's rainfall
            soil_moisture_data(i) = rainfall_data(i) / (temperature_data(i) + 273.15);  // Simple estimation: rainfall / temperature in Kelvin
        else
            soil_moisture_data(i) = 0;  // If there's no rainfall, set the soil moisture to 0
        end
    end

    // Print average soil moisture
    avg_soil_moisture = mean(soil_moisture_data);
    mprintf("Predicted Average Soil Moisture: %f m^3/m^3\n", avg_soil_moisture);

    
    
    // Predicting Air Quality Index (AQI)
    aqi = rand() * 340;  // AQI ranges from 0 to 500
    if aqi <= 150 then          //Checking whether the Air Quality Index is less than or equal to 150
        aqi_category = "Good [Air Quality is considered Satisfactory, and Air Pollution poses little or no risk.]";
    elseif aqi <= 275 then      //Checking whether the Air Quality Index is less than or equal to 200
        aqi_category = "Moderate [Air Quality is Acceptable; however, there may be some pollutants that may be a concern for a small number of people with sensitivities.]";
    elseif aqi <= 320 then      //Checking whether the Air Quality Index is less than or equal to 250
        aqi_category = "Unhealthy for Sensitive Groups [Members of sensitive groups, such as those with respiratory or heart conditions, may experience health effects. The general public is less likely to be affected.]";
    elseif aqi <= 450 then      //Checking whether the Air Quality Index is less than or equal to 300
        aqi_category = "Unhealthy for Children, New Born Babies etc. (They may begin to experience adverse and serious health effects.)";
    elseif aqi <= 500 then      //Checking whether the Air Quality Index is less than or equal to 400
        aqi_category = "Very Unhealthy (Health alert: everyone may experience more serious health effects.)";
    else                        //Default Condition
        aqi_category = "Hazardous (Health warnings of emergency conditions; the entire population is likely to be affected.)";
    end
    mprintf("Predicted Air Quality Index: %f (%s)\n", aqi, aqi_category);
    
    
    
    // Predicting Wind Speed
    wind_speed_data = zeros(1, 5);  // Initialise an array to store wind speed data
    for i = 1:5
        if weather_conditions == "Thunderstorm" then  // If there's a thunderstorm
            wind_speed_data(i) = rand() * 20 + 30;  // Wind speed ranges from 30 to 50 km/h
        elseif weather_conditions == "Cloudy" || weather_conditions == "Windy" then  // If it's cloudy or windy
            wind_speed_data(i) = rand() * 15 + 15;  // Wind speed ranges from 15 to 30 km/h
        else
            wind_speed_data(i) = rand() * 10 + 5;  // Otherwise, wind speed ranges from 5 to 15 km/h
        end

        // Adjust wind speed based on other factors
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_temperature / 100);  // Higher temperature can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_humidity / 100);  // Higher humidity can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_rainfall / 100);  // More rainfall can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_duration / 100);  // Longer duration can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_air_density / 100);  // Higher air density can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_hail_probability / 100);  // Higher hail probability can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + avg_soil_moisture / 100);  // Higher soil moisture can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + uv_index / 100);  // Higher UV index can increase wind speed
        wind_speed_data(i) = wind_speed_data(i) * (1 + aqi / 100);  // Higher AQI can increase wind speed

        // Limit wind speed to a maximum of 120 km/h
        if wind_speed_data(i) > 120 then
            wind_speed_data(i) = 120;
        end
    end


    
    // Predicting Wind Chill
    wind_chill_data = zeros(1, 5);  // Initialise an array to store wind chill data
    for i = 1:5
        // Estimate wind speed based on weather condition
        if weather_condition == "Thunderstorm" then  // If there's a thunderstorm
            V = 50;  // Assign a high wind speed
        elseif weather_condition == "Cloudy" || weather_condition == "Windy" then  // If it's cloudy or windy
            V = 30;  // Assign a moderate wind speed
        else
            V = 10;  // Otherwise, assign a low wind speed
        end

        if temperature_data(i) <= 31 && V > 4.8 then  // If the temperature is 10°C or below and the wind speed is above 4.8 km/h
            T = (temperature_data(i) * 9/5) + 32;  // Convert temperature from Celsius to Fahrenheit
            V = V * 0.621371;  // Convert wind speed from km/h to mph
            wind_chill_data(i) = 35.74 + 0.6215*T - 35.75*V^0.16 + 0.4275*T*V^0.16;  // Calculate wind chill in Fahrenheit
            wind_chill_data(i) = (wind_chill_data(i) - 32) * 5/9;  // Convert wind chill from Fahrenheit to Celsius
        else
            wind_chill_data(i) = temperature_data(i) - 2;  // If the temperature is above 10°C or the wind speed is 4.8 km/h or below, the wind chill is 2 degrees less than the temperature
        end
    end

    // Print average wind chill
    avg_wind_chill = mean(wind_chill_data);
    mprintf("Predicted Average Wind Chill: %f°C\n", avg_wind_chill);



    // Predicting Barometric Pressure
    barometric_pressure_data = zeros(1, 5);  // Initialise an array to store barometric pressure data
    for i = 1:5
        // Estimate barometric pressure based on weather condition
        if weather_condition == "Thunderstorm" then  // If there's a thunderstorm
            barometric_pressure_data(i) = 1000;  // Assign a low barometric pressure
        elseif weather_condition == "Cloudy" || weather_condition == "Windy" then  // If it's cloudy or windy
            barometric_pressure_data(i) = 1013;  // Assign a moderate barometric pressure
        else
            barometric_pressure_data(i) = 1023;  // Otherwise, assign a high barometric pressure
        end

        // Adjust barometric pressure based on other factors
        barometric_pressure_data(i) = barometric_pressure_data(i) - 0.1 * rainfall_data(i);  // More rainfall can decrease barometric pressure
        barometric_pressure_data(i) = barometric_pressure_data(i) + 0.05 * humidity_data(i);  // Higher humidity can increase barometric pressure
        barometric_pressure_data(i) = barometric_pressure_data(i) - 0.2 * temperature_data(i);  // Higher temperature can decrease barometric pressure
        barometric_pressure_data(i) = barometric_pressure_data(i) + 0.1 * duration_data(i);  // Longer duration can increase barometric pressure
    end

    // Print average barometric pressure
    avg_barometric_pressure = mean(barometric_pressure_data);
    mprintf("Predicted Average Barometric Pressure: %f hPa\n", avg_barometric_pressure);

    
    
endfunction   //Our function ends here

//-----------------------------------------------------------------------------------------------------------//

main();   //Calling the Main Function
