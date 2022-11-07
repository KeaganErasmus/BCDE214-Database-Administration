from geopandas import *
from geopy import *


locator = Nominatim(user_agent="myGeocoder")
location = locator.geocode("Champ de Mars, Paris, France")

print("Lattitude = {}, Longitude = {}".format(location.lattitude, location.longitude))