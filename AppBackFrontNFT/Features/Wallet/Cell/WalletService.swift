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
        let url = "https://run.mocky.io/v3/0d88aed4-b24f-465c-bb70-087fab998e8c"

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
