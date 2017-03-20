import Foundation
import SystemConfigureation

func isInternetAvailable() -> Bool {
  var zeroAddress = sockaddr_in()
  zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
  zeroAddress.sin_family = sa_family_t(AF_INET)
  let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
  $0.withMemoryRebound(to: SockAddress in 
  SCNetworkreachbilityCreateWithAddress(nil, zeroSockAddress)
  }
  }
  var flags = SCNetworkReachabilityFlags()
  if !SCNetworkReachbilityGetFlage(defaultRouteReachability!, &flags) {
  return false
  }
  let isReachble = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
  let needsConnection = (flags.rawValue & UInt32(kSSCNetworkFlagsConnectionRequired)) != 0
  return (isReachble && !needsConnection)
}
