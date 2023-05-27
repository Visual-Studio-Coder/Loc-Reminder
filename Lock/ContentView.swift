//
//  ContentView.swift
//  Lock
//
//  Created by Vaibhav Satishkumar on 4/25/23.
//

import SwiftUI





struct ContentView: View {
    
    @State var shouldShowOnboarding: Bool = true
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var spots: FetchedResults<Spots>
    
   
    
    var body: some View {
        NavigationView{
            VStack{
                Text("main app")
                    .padding()
            }
            .navigationTitle("Home")
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView()
        })
        
    }
}

struct OnboardingView: View {
    @State private var value = 1.0
    @State private var sasdasf = ""
    
    
    @State private var canTouchDown = true
    let impact = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedPage = 0
    
   
    
    var body: some View {
        
        
        
        ZStack{
            AuroraView()
                
            TabView(selection: $selectedPage, content: {
                //onboarding page one
                VStack() {
                    /*AuroraView()
                     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                     .edgesIgnoringSafeArea(.all)*/
                    
                    
                    VStack{
                        @ObservedObject var manager = MotionManager()
                        Image("LockReminderIcon")
                        
                            
                            .resizable()
                            
                            .cornerRadius(30)
                            .shadow(color: .blue, radius: 22)
                            .scaledToFit()
                            .padding(40)
                            .scaleEffect(value)
                            .frame(width: 400, height: 400)
                            
                            
                            
                            
                        
                        Text("Lock Reminder")
                            .font(.largeTitle
                                .bold())
                            .foregroundColor(.white)
                            .padding(10)
                        Text("Never forget to lock your home ever again!")
                            .frame(width: 332, height: 75)
                            .scaledToFill()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            
                            
                        Spacer()
                        Button("Continue"){
                            withAnimation(Animation.spring().delay(2)) { selectedPage += 1
                            }
                            
                        }
                        .padding([.leading, .bottom, .trailing], 20.0)
                        .frame(width: 332, height: 75)
                        .buttonStyle(threeDimensionalButton())
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2)) {
                                value = 1.1
                            }
                        }
                        
                        
                        
                        
                        
                        
                    
                    }
                    
                    .padding()
                    
                    
                    
                    
                }
                .tag(0)
                //onboarding page two
                VStack {
                    /*AuroraView()
                     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                     .edgesIgnoringSafeArea(.all)*/
                    
                    
                    VStack{
                        @ObservedObject var manager = MotionManager()
                        Image("location")
                        
                            .resizable()
                            .cornerRadius(30)
                            .shadow(color: Color(hue: 1.0, saturation: 0.303, brightness: 0.549), radius: 22)
                            .scaledToFit()
                            .padding(40)
                            .frame(width: 400, height: 400)
                            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 15))
                        
                        Text("Enable Location")
                            .font(.largeTitle
                                .bold())
                            .foregroundColor(.white)
                            .padding(10)
                        Text("Enable \"Always\" location access for notifications when you leave home, even when the app is closed.")
                            .frame(width: 332, height: 75)
                            .scaledToFill()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        Button("Continue"){
                            withAnimation(Animation.spring().delay(2)) { selectedPage += 1
                            }
                            
                        }
                        .padding([.leading, .bottom, .trailing], 20.0)
                        .frame(width: 332, height: 75)
                        .buttonStyle(threeDimensionalButton())
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2)) {
                                value = 1.1
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding()
                    
                }
                .tag(1)
                VStack{
                    @ObservedObject var manager = MotionManager()
                    Image("notification")
                    
                        .resizable()
                        .foregroundColor(.red)
                    
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 22)
                        .scaledToFit()
                        .padding(40)
                        .frame(width: 400, height: 400)
                        .modifier(ParallaxMotionModifier(manager: manager, magnitude: 15))
                    
                    Text("Enable Notifications")
                        .font(.largeTitle
                            .bold())
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Lock Reminder alerts you by delivering notifications if a location based event occurs.")
                        .frame(width: 332, height: 75)
                        .scaledToFill()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    Spacer()
                    Button("Continue"){
                        withAnimation(Animation.spring().delay(2)) { selectedPage += 1
                        }
                        
                    }
                    .padding([.leading, .bottom, .trailing], 20.0)
                    .frame(width: 332, height: 75)
                    .buttonStyle(threeDimensionalButton())
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)) {
                            value = 1.1
                        }
                    }
                    
                    
                    
                }
                .padding()
                
                
                .tag(2)
                NavigationStack{
                    
                    ZStack {
                        Color.clear
                                        .ignoresSafeArea()
                                    
                                    VStack {
                                        Text("Lock Reminder monitors spots. Depending on how you interact with these spots, Lock Reminder sends out a notification. Click the \"+\" to add your first spot.")
                                            .padding()
                                        Spacer()
                                    }
                                    .navigationTitle("Add Spots")
                                    .font(.title2)
                                }
                                .navigationBarTitleDisplayMode(.inline)
                        
                        
                    
                    
                    
                    
                
                }
                
                .tag(3)
                .padding()
                
            })
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
}

struct PageView: View {
    
    var title: String
    var subtitle: String
    var imageName: String
    
    
    var body: some View{
        VStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Push Notification")
                .font(.system(size: 42))
                .padding()
            
            Text("Enable them bozo.")
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        
        
        ContentView()
       
     
    }
}
     



extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
