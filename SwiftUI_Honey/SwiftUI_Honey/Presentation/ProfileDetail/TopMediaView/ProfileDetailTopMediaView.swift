//
//  ProfileDetailTopPhotoView.swift
//  SwiftUI_Honey
//
//  Created by BEYun on 2023/12/19.
//

import SwiftUI

struct ProfileDetailTopMediaView: View {
    @State private var currentPage: String = ""
    @State private var listOfPages: [Photo] = []
    
    // First, Last에 아이템 추가
    @State private var fakedPages: [Photo] = []
    
    var body: some View {
        NavigationView {
            GeometryReader {
                let size = $0.size
                
                TabView(selection: $currentPage, content: {
                    ForEach(fakedPages) { Page in
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Page.color.gradient)
                            .frame(width: 300, height: size.height)
                            .tag(Page.id.uuidString)
                            // Scroll Offset 계산하기
                            .offsetX(currentPage == Page.id.uuidString) { rect in
                                let minX = rect.minX
                                let pageOffset = minX - (size.width * CGFloat(fakeIndex(Page)))
                                // offset을 page로 변환
                                let pageProgress = pageOffset / size.width
                                print(pageProgress)
                                
//                                // 무한 스크롤 로직
//                                if -pageProgress < 1.0 {
//                                    // 첫번째 아이템의 복사본인 마지막 페이지로 이동
//                                    if fakedPages.indices.contains(fakedPages.count - 1) {
//                                        currentPage = fakedPages[fakedPages.count - 1].id.uuidString
//                                    }
//                                }
//
//                                if -pageProgress > CGFloat(fakedPages.count - 1) {
//                                    // 마지막 아이템의 복사본인 첫번째 페이지로 이동
//                                    if fakedPages.indices.contains(1) {
//                                        currentPage = fakedPages[1].id.uuidString
//                                    }
//                                }
                            }
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                .overlay(alignment: .bottom) {
                    PageControl(totalPages: listOfPages.count, currentPage: originalIndex(currentPage))
                        .offset(y: -15)
                }
            }
            .frame(height: 400)
            .onAppear {
                guard fakedPages.isEmpty else { return }
                
                for color in [Color.red, Color.blue, Color.yellow, Color.black, Color.brown] {
                    listOfPages.append(.init(color: color))
                }
                
                fakedPages.append(contentsOf: listOfPages)
                
                // id가 같으면 rendering 하지 않음
                if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
                    
                    currentPage = firstPage.id.uuidString
                    
                    firstPage.id = .init()
                    lastPage.id = .init()
                    
                    fakedPages.append(firstPage)
                    fakedPages.insert(lastPage, at: 0)
                }
            }
            .navigationViewStyle(.stack)
//            .navigationTitle("Infinite Carousel")
        }
    }
    
    func fakeIndex(_ of: Photo) -> Int {
        return fakedPages.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return listOfPages.firstIndex { page in
            page.id.uuidString == id
        } ?? 0
    }
}

struct ProfileDetailTopPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailTopMediaView()
    }
}
