import requests
 
from datetime import datetime
 
api_key='b6e58e86b25a513ac8c0f2dcbab9f603'
 
 
location=input("Enter the city name:")
 
complete_api_link="https://api.openweathermap.org/data/2.5/weather?q="+location+"&appid="+api_key
 
api_link=requests.get(complete_api_link)
api_data=api_link.json()
 
#create variables to store and display data
temp_city=((api_data['main']['temp'])-273.15)
weather_desc=api_data['weather'][0]['description']
hmdt=api_data['main']['humidity']
Wind_spd=api_data['wind']['speed']
date_time=datetime.now().strftime("%d %b %Y | %I:%M:%S %p")
 
print("-----------------------------------------------------")
print("Weather Stats for - {} || {}".format(location.upper(),date_time))
print("-----------------------------------------------------")
 
 
print ("Current temperature is : {:.2f} deg C".format(temp_city))
print("Current weather desc :",weather_desc)
print("current Humidity     :",hmdt,'%')
print("Current wind speed   :",Wind_spd,'kmph')
 
 
 
text_file=open("weather_file.txt","a+")
text_file.write("\ntemperature:"+str(temp_city))
text_file.write("\nweather_dec:"+str(weather_desc))
text_file.write("\nHumidity:"+str(hmdt))
text_file.write("\nwind_spd:"+str(Wind_spd))
text_file.write("\ndate_time:"+str(date_time))
 
 
text_file.close()
text_file=open("weather_file.txt","r")
print("\ndata from text file\n")
print(text_file.read())
print()
text_file.close()
