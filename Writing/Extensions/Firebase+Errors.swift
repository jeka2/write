enum FirebaseErrors: Error {
    case encodingError, decodingError
    
    var errorMessage: String {
        switch self {
        case .encodingError:
            return AllStrings.firebaseEncodingError
        case .decodingError:
            return AllStrings.firebaseDecodingError
        }
    }
}
