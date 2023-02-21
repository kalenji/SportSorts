import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Ледена Пързалка Юнак",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.68652812795484, longitude: 23.333239901742818),
            description: "Ледена пързалка ,,ЮНАК'' е открита с площ от 1,300 кв.м. и предлага чисто нови кънки под наем за всички любители на зимните спортове. С възможност за обучение на деца и начинаещи, както и учебни пособия за улеснение. ОЧАКВАМЕ ВИ с огледален лед, уютна атмосфера, отзивчив персонал и добро настроение!",
            workingTime: "Sunday, 10 AM–11:20 PM\nMonday, 10 AM–11:20 PM\nTuesday, 10 AM–11:20 PM\nWednesday, 10 AM–11:20 PM\nThursday, 10 AM–11:20 PM\nFriday, 10 AM–11:20 PM\nSaturday, 10 AM–11:20 PM",
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
            workingTime: "Sunday, 11 AM–10 PM\nMonday, 11 AM–10 PM\nTuesday, 11 AM–10 PM\nWednesday, 11 AM–10 PM\nThursday, 11 AM–10 PM\nFriday, 11 AM–10 PM\nSaturday, 11 AM–10 PM",
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
            workingTime: "Sunday, 10 AM–10 PM\nMonday, 7 AM–11 PM\nTuesday, 7 AM–11 PM\nWednesday, 7 AM–11 PM\nThursday, 7 AM–11 PM\nFriday, 7 AM–11 PM\nSaturday, 10 AM–10 PM",
            imageNames: [
                "walltopia-1",
                "walltopia-2",
                "walltopia-3",
            ],
            link: "https://walltopiaclimbingcenter.eu/bg/nachalo/"),
        Location(
            name: "Winter Palace of Sport",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.64493973717154, longitude: 23.343250766431616),
            description: "Зимният дворец на спорта е покрит комплекс със зали за зимни спортове на лед в София, район „Студентски“. Собственост е на държавното дружество „Академика 2011“ ЕАД, София. Намира се в ж.к. „Студентски град“, на ул. „Акад. Борис Стефанов“, в съседство с Националната спортна академия „Васил Левски“. Открит е през 1982 г. Има капацитет от 4600 души. Леденият стадион разполага с две ледени пързалки, позволяващи да се развиват зимни спортове като хокей на лед, фигурно пързаляне, шорттрек и др.",
            workingTime: "Sunday, 11 AM–12 AM\nMonday, 8 AM–11:55 PM\nTuesday, 8 AM–11:55 PM\nWednesday, 8 AM–11:55 PM\nThursday, 8 AM–11:55 PM\nFriday, 8 AM–11:55 PM\nSaturday, 8 AM–11:55 PM",
            imageNames: [
                "winterpalace-1",
                "winterpalace-2",
                "winterpalace-3",
            ],
            link: "http://academica2011.com/index.php?option=com_content&view=article&id=2&Itemid=6"),
        Location(
            name: "ПЛУВЕН БАСЕЙН СПАРТАК",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.67504087708594, longitude: 23.313241113250047),
            description: "Плувен комплекс Спартак е една от най-елитните спортни бази в страната. Разполага с открит и закрити плувни басейни, фитнес зала, зала за аеробика, карате, йога, зала за бойни изкуства, хотелски комплекс, детски площадки, стрелбищен комплекс. На Ваше разположение е Спа център, включващ всички необходими услуги, за да се чувствате пълноцеени.",
            workingTime: "Sunday, 8:30 AM–6 PM\nMonday, 7 AM–9 PM\nTuesday, 7 AM–9 PM\nWednesday, 7 AM–9 PM\nThursday, 7 AM–9 PM\nFriday, 7 AM–9 PM\nSaturday, 8:30 AM–6 PM",
            imageNames: [
                "spartak-1",
                "spartak-2",
                "spartak-3",
            ],
            link: "https://www.facebook.com/spartakswim"),
        Location(
            name: "Maleeva Tennis Club",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.66832203044144, longitude: 23.328091740594196),
            description: "Движение и грижа заедно със спорт, познание и отговорност",
            workingTime: "Sunday, 7 AM–10 PM\nMonday, 7 AM–10 PM\nTuesday, 7 AM–10 PM\nWednesday, 7 AM–10 PM\nThursday, 7 AM–10 PM\nFriday, 7 AM–10 PM\nSaturday, 7 AM–10 PM",
            imageNames: [
                "maleeva-1",
                "maleeva-2",
                "maleeva-3",
            ],
            link: "http://maleevaclub.com/"),
        Location(
            name: "Swimming pool Diana",
            cityName: "Sofia",
            coordinates: CLLocationCoordinate2D(latitude: 42.66584126920354, longitude: 23.344177254794126),
            description: "Плувният комплекс Диана е разположен на територията на Националния спортен комплекс Диана, който е част от Националната спортна база. Закритият плувен басейн на комплекса се използва от федерациите по плуване, петобой, триатлон и водна топка за тренировки и състезания. Капацитетът му е 500 души, а местата за сядане на трибуните - 320. Басейнът е с олимпийски размери, 50/20 м, с дълбочина 2,8 м и 8 коридора. Температурата на водата в него е 27 °С през цялата година. Достъп до басейна имат както професионални спортисти, така и всички любители на водните спортове. Освен басейна, на тяхно разположение са още фитнес зала, сауна, парна баня, джакузи и прилежащи тенис кортове. Трите открити плувни басейна на комплекса са с олимпийски размери и работят от 01.06. до 31.08. Те разполагат с филтърна инсталация, кула за скокове и две трибуни с капацитет 2 500 души. Допълнителен плюс на комплекса е наличието на магазини и безплатен паркинг.",
            workingTime: "Sunday, Closed\nMonday, 7 AM–7 PM\nTuesday, 7 AM–7 PM\nWednesday, 7 AM–7 PM\nThursday, 7 AM–7 PM\nFriday, 7 AM–7 PM\nSaturday, 8 AM–4 PM",
            imageNames: [
                "diana-1",
                "diana-2",
                "diana-3",
            ],
            link: "https://visitsofia.bg/en/cityinfrastructure/what-to-do/water-sports/swimming-complex-diana"),
    ]
    
}
