//
//  Weather.swift
//  rtc_weather
//
//  Created by Андрей Королев on 02.05.2022.
//

import Foundation

struct Weather {
    
    var name: String = "city name"
    var temp: Double = 80.0
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0.0
    var tempMin: Int = 80
    var tempMax: Int = 80
    
    var conditionString: String {
        switch condition {
        case "clear" : return "Ясно"
        case "partly-cloudy": return "Малооблачно"
        case "cloudy" : return "Облачно с прояснениями"
        case "overcast" : return "Пасмурно"
        case "drizzle" : return "Морось"
        case "light-rain" : return "Небольшой дождь"
        case "rain" : return "Дождь"
        case "moderate-rain" : return "Умеренно сильный дождь"
        case "heavy-rain" : return "Сильный дождь"
        case "continuous-heavy-rain" : return "Длительный сильный дождь"
        case "showers" : return "Ливень"
        case "wet-snow" : return "Снег с дождем"
        case "light-snow" : return "Небольшой снег"
        case "snow" : return "Снег"
        case "snow-showers" : return "Снегопад"
        case "hail" : return "Град"
        case "thunderstorm" : return "Гроза"
        case "thunderstorm-with-rain" : return "Дождь с грозой"
        case "thunderstorm-with-hail" : return "Гроза и град"
        
        default: return "Загрузка..."
        }
    }
    
    init? (weatherData: WeatherData) {
        temp = weatherData.fact.temp
        conditionCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
    }
    
    init() {
        
    }
}
