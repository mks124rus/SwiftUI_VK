//
//  NewsFeedCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 18.02.2022.
//

import SwiftUI
import Kingfisher
import Grid

struct NewsFeedCellView: View {
    
    var news: News
    
    var body: some View {
        
        
        VStack(alignment:.leading){
            Header(news: news)
            Post(news: news)
            Footer(news: news)
        }
        
        
    }
}

extension NewsFeedCellView {
    //    MARK: - Header
    private struct Header: View{
        var news: News
        var body: some View {
            
            HStack(){
                
                AvatarView(url: news.avatarURL)
                
                VStack{
                    HStack{
                        Text(news.name ?? "Error name")
                            .lineLimit(1)
                            .font(Constants.init().font)
                        Spacer()
                    }
                    HStack{
                        Text(DateFormatter.newsFeedFormat(for: news.date ))
                            .lineLimit(1)
                        Spacer()
                    }
                }
            }
        }
    }
    //    MARK: - Post
    private struct Post: View {
        
        var news: News
        
        var body: some View {
            
            Text(news.text)
            
            if let attacments = news.attachments  {
                if let url = attacments[0].photo?.url{
                    KFImage(url)
                        .resizable()
                        .scaledToFill()
                }
            }
        }
    }
    //    MARK: - Footer
    private struct Footer: View{
        
        var news: News
        
        var body: some View {
            HStack(spacing: 20){
                HStack(spacing: 5){
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.init(UIColor.darkGray))
                    
                    Text(String(news.likes.count))
                        .lineLimit(1)
                        .foregroundColor(Color.init(UIColor.darkGray))
                }
                .padding([.top, .bottom, .leading, .trailing], 10)
                .background(Color.init(UIColor.secondarySystemBackground))
                .cornerRadius(30)
                .onTapGesture {
                    print("Tap like...")
                }
                
                HStack(spacing: 5){
                    Image(systemName: "bubble.middle.bottom")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.init(UIColor.darkGray))
                    
                    Text(String(news.reposts.count))
                        .lineLimit(1)
                        .foregroundColor(Color.init(UIColor.darkGray))
                }
                .padding([.top, .bottom, .leading, .trailing], 10)
                .background(Color.init(UIColor.secondarySystemBackground))
                .cornerRadius(30)
                .onTapGesture {
                    print("Tap comments...")
                }
                
                HStack(spacing: 5){
                    Image(systemName: "arrowshape.turn.up.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.init(UIColor.darkGray))
                    
                    Text(String(news.comments.count))
                        .lineLimit(1)
                        .foregroundColor(Color.init(UIColor.darkGray))
                }
                .padding([.top, .bottom, .leading, .trailing], 10)
                .background(Color.init(UIColor.secondarySystemBackground))
                .cornerRadius(30)
                .onTapGesture {
                    print("Tap repost...")
                }
            }
        }
    }
}
