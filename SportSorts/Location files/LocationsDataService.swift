import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Ледена Пързалка Юнак",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.68652812795484, longitude: 23.333239901742818),
            description: "Ледена пързалка ,,ЮНАК'' е открита с площ от 1,300 кв.м. и предлага чисто нови кънки под наем за всички любители на зимните спортове. С възможност за обучение на деца и начинаещи, както и учебни пособия за улеснение. ОЧАКВАМЕ ВИ с огледален лед, уютна атмосфера, отзивчив персонал и добро настроение!",
            imageNames: [
                "iunak-1",
                "iunak-2",
                "iunak-3",
            ],
            link: "https://www.yunak.bg/"),
        Location(
            name: "Ice Park Sofia",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.691734008698944, longitude: 23.335685811156765),
            description: "Леден парк „София“ е мястото за ледена разходка в центъра на столицата. Паркът е най-голямата ледена атракция до момента, както в София, така и в България. В основата на парка е ледено поле голямо 3500 кв.м., представляващо две ледени пързалки свързани помежду си с ледени алеи, намиращи се в Княжеската градина.",
            imageNames: [
                "icepark-1",
                "icepark-2",
                "icepark-3",
            ],
            link: "https://www.icepark.bg/"),
        Location(
            name: "Walltopia",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.66583856373108, longitude: 23.3743824049723),
            description: "Walltopia Climbing Center впечатлява с дизайн, мащаб и иновативна система за управление на маршрутите (e-walls). Със своите 1950 кв.м. катеруема площ това е най-голямата зала за катерене в България. Основният фокус е върху високите стени (1455кв.м.), с височина на стените от 13 до 19 метра в най-високата част на залата, а Боулдър зоната разполага в 500 кв.м. катеруема площ.",
            imageNames: [
                "walltopia-1",
                "walltopia-2",
                "walltopia-3",
            ],
            link: "https://walltopiaclimbingcenter.eu/bg/nachalo/"),
    ]
    
}
