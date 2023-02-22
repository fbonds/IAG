import Alamofire

class TikTokUploader {
  
  func uploadVideo(videoURL: URL) {
    let headers: HTTPHeaders = [
      "Content-Type": "multipart/form-data"
    ]
    
    AF.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(videoURL, withName: "video")
    }, to: "https://api.tiktok.com/upload", method: .post, headers: headers)
      .responseJSON { response in
        switch response.result {
        case .success(let value):
          print("Successfully uploaded video: \(value)")
        case .failure(let error):
          print("Failed to upload video: \(error)")
        }
    }
  }
}
