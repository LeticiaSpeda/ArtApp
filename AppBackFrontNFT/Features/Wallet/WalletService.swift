import Foundation
import Alamofire

protocol WalletServing: GenericService {
    func getWalletFromJson(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}

final class WalletService:  WalletServing {
    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(nftData, nil)
            } catch {
                completion(nil, Error.fileDecodingFaliled(name: "WalletData", error))
            }
        } else {
            completion(nil, Error.fileNoFound(name: "WalletData"))
        }
    }

    func getWallet(completion: @escaping completion<WalletData?>) {
        let url = "https://run.mocky.io/v3/ca84d863-7fdd-4105-b1a9-ef157b120d77"

        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in

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
