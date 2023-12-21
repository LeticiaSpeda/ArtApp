import Foundation
import Alamofire

protocol HomeServiceModeling: GenericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

final class HomeService: HomeServiceModeling {
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            } catch {
                completion(nil, Error.fileDecodingFaliled(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNoFound(name: "HomeData"))
        }
    }

    func getHome(completion: @escaping completion<NFTData?>) {
        let url = "https://run.mocky.io/v3/bd98a852-013f-48e3-ad62-caedde430650"

        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in

            switch response.result {
            case .success(let sucess):
                print("Sucesso -> \(#function)")
                completion(sucess, nil)
            case .failure(let error):
                print("Error -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
}
