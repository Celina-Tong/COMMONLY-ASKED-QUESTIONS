
//
//  ContentView.swift
//  blossomwords-commonlyaskedquestions
//
//  Created by Celina Tong on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    private var listOfQuestion = questionList
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(questions, id: \.self) { question in
                    HStack {
                        Text(question.capitalized)
                        Spacer()
                    }
                    .padding()
                    
                }
                
            }
           
            .searchable(text: $searchText)
            .navigationTitle("Common Questions")
            .font(.body)
            
            var questions: [String] {
                let lcQuestions = listOfQuestion.map { $0.lowercased()}
                
                return searchText == "" ? lcQuestions : lcQuestions.filter {
                    $0.contains(searchText.lowercased())
                }
                
            }
        }
        
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
