abstract class WeatherState{}

class InitialStateWeather extends WeatherState{}

class LoadingWeather extends WeatherState{}
class SuccessWeather extends WeatherState{}
class ErrorWeather extends WeatherState{}