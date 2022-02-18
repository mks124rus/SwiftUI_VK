//
//  NewsFeedCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 18.02.2022.
//

import SwiftUI

struct NewsFeedCellView: View {
    
    var body: some View {
        
        
        VStack(alignment:.leading){
            Header()
            Post()
            Footer(likeCount: 9768, commentsCount: 55, repostCount: 124)
        }
        
        
    }
}

struct NewsFeedCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedCellView()
    }
}


extension NewsFeedCellView {
    //    MARK: - Header
    private struct Header: View{
        
        var body: some View {
            HStack(){
                AvatarView(image: "")
                
                VStack{
                    HStack{
                        Text("Group or Friend name")
                            .lineLimit(1)
                            .font(Constants.init().font)
                        Spacer()
                    }
                    HStack{
                        Text("Date")
                            .lineLimit(1)
                        Spacer()
                    }
                }
            }
        }
    }
    //    MARK: - Post
    private struct Post: View {
        

        var body: some View {
            
            Text("Some text of News")
                .padding(Constants.init().edgeInstets)
            Image("fox")
                .resizable()
                .scaledToFit()
        }
    }
    //    MARK: - Footer
    private struct Footer: View{
        
        var likeCount: Int
        var commentsCount: Int
        var repostCount: Int
        
        var body: some View {
            HStack(spacing: 20){
                HStack(spacing: 5){
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.init(UIColor.darkGray))
                    
                    Text(String(likeCount))
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
                    
                    Text(String(repostCount))
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
                    
                    Text(String(commentsCount))
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



