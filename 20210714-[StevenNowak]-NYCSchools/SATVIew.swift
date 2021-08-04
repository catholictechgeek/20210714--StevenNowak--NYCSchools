//
//  SATVIew.swift
//  20210714-[StevenNowak]-NYCSchools
//
//  Created by Steven Nowak on 7/16/21.
//

import SwiftUI

struct SATView: View {
    @State var details:School
    
    init(_ item:School) {
        details = item
    }
    
    //the basic data we are displaying here (besides the required SAT scores are name of school, address (and neighborhood), phone number, contact e-mail address, website, an overview of the school, AP classes offered, extracurricular activities offered, and sports for boys and girls
    var body: some View {
        VStack {
            Text(details.schoolName!).font(.title).underline().bold()
            Text("\(details.neighborhood!) Neighborhood")
            if let address = details.primaryAddressLine1, let city = details.city, let state = details.stateCode, let zip = details.zip {
                Text(address)
                Text("\(city), \(state) \(zip)")
            }
            if let phone = details.phoneNumber {
                Link(phone, destination: URL(string: "tel:\(phone.replacingOccurrences(of: "[^0-9]", with: ""))")!).padding(0.25)
            }
            if let email = details.schoolEmail {
                Link(email, destination: URL(string: "mailto:\(email)")!).padding(0.25)
            }
            //depending on the actual url provided for the website, we could have errors here (but as long as the website does not have the protocol at the beginning, we should be safe since all the sites out there use https as default these days)
            if let website = details.website {
                Link(website, destination: URL(string: "https://\(website)")!)
            }
            
            ScrollView(.vertical) {
                VStack(alignment:.leading) {
                    Text(details.overviewParagraph ?? "").padding(.bottom, 3)
                    if let ap = details.advancedplacementCourses {
                        HStack(alignment: .top) {
                            Text("Advanced Placement (AP) Courses:").bold()
                        Text(ap)
                        }
                    }
                    if let extracurricular = details.extracurricularActivities {
                        Spacer()
                        HStack(alignment: .top) {
                            Text("Extracurricular Activities:").bold()
                            Text(extracurricular )
                        }
                    }
                    if let boys = details.psalSportsBoys, let girls = details.psalSportsGirls {
                        Spacer()
                        HStack(alignment: .top) {
                            Text("Boy's Sports:").bold()
                            Text(boys)
                        }
                        Spacer()
                        HStack(alignment: .top) {
                            Text("Girl's Sports:").bold()
                            Text(girls)
                        }
                    }
                }
            }.padding(.top, 3)
            if let score = ScoreService.instance.get(details.dbn!) {
                Text("SAT Scores").underline()
                Text("Critical Reading Average: \(score.satCriticalReadingAvgScore)")
                Text("Math: \(score.satMathAvgScore)")
                Text("Writing: \(score.satWritingAvgScore)").padding(.bottom)
            }
        }.navigationBarTitle(Text("")).navigationBarTitle("", displayMode: .inline)
    }
}

struct SATVIew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SATView({
                //with over 300 columns in this table, the best way to probably handle preview data in this case may be just to use an object from the table (as json) and deserialize it for the SwiftUI preview)
                let json = "{\"dbn\":\"17K548\",\"school_name\":\"Brooklyn School for Music & Theatre\",\"boro\":\"K\",\"overview_paragraph\":\"Brooklyn School for Music & Theatre (BSMT) uses our academic program to accommodate the intellectual, social, and emotional needs of creative high school students. Our vision is to provide a model professional environment where respect is mutual, ideas are shared, and learning is not limited to the classroom. We prepare students for higher education through our rigorous academic program while simultaneously allowing them to develop professional careers in the music and theatre industries.\",\"school_10th_seats\":\"1\",\"academicopportunities1\":\"CTE program(s) in: Arts, A/V Technology & Communication\",\"academicopportunities2\":\"iLearnNYC: Program for expanded online coursework and self-paced learning\",\"academicopportunities3\":\"We offer highly competitive positions in our Drama, Chorus, and Dance Company classes\",\"academicopportunities4\":\"Students receive small group instruction focused on sharpening their skills while developing their professional portfolio for auditions\",\"ell_programs\":\"English as a New Language\",\"language_classes\":\"Spanish\",\"advancedplacement_courses\":\"AP English, AP Environmental Science, AP US History\",\"neighborhood\":\"Crown Heights South\",\"shared_space\":\"Yes\",\"campus_name\":\"Prospect Heights Educational Campus\",\"building_code\":\"K440\",\"location\":\"883 Classon Avenue, Brooklyn NY 11225 (40.669805, -73.960689)\",\"phone_number\":\"718-230-6250\",\"fax_number\":\"718-230-6262\",\"school_email\":\"prandaz@schools.nyc.gov\",\"website\":\"www.bkmusicntheatre.com\",\"subway\":\"2, 3, 4, 5 to Franklin Ave; B, Q to Prospect Park; F to Park Place; S to Botanic Garden\",\"bus\":\"B16, B41, B43, B44-SBS, B45, B48, B49, B69\",\"grades2018\":\"9-12\",\"finalgrades\":\"9-12\",\"total_students\":\"352\",\"start_time\":\"8:10am\",\"end_time\":\"3pm\",\"extracurricular_activities\":\"Chess, The Step Team, Fashion, Tech Team, WomenÂ’s Group; Extensive arts after-school program: Tech, Dance, Drama, and Chorus Companies; Crew program that trains students in running the lights, sound, video, and all backstage and pit crew responsibilities; Saturday and after-school classes for Regents Preparation; School Leadership Team; Student Government; At least three annual major school-wide productions; Two annual talent shows\",\"psal_sports_boys\":\"Baseball, Basketball, Cross Country, Indoor Track, Outdoor Track, Soccer, Swimming\",\"psal_sports_girls\":\"Basketball, Soccer\",\"psal_sports_coed\":\"Cricket, Double Dutch\",\"graduation_rate\":\"0.833000004\",\"attendance_rate\":\"0.889999986\",\"pct_stu_enough_variety\":\"0.689999998\",\"college_career_rate\":\"0.389999986\",\"pct_stu_safe\":\"0.649999976\",\"school_accessibility_description\":\"1\",\"prgdesc1\":\"Provides arts instruction to all students and integrates the arts into the core curriculum.\",\"offer_rate1\":\"Â—87% of offers went to this group\",\"program1\":\"Performing and Visual Arts\",\"code1\":\"K48A\",\"interest1\":\"Performing Arts\",\"method1\":\"Ed. Opt.\",\"seats9ge1\":\"90\",\"grade9gefilledflag1\":\"N\",\"grade9geapplicants1\":\"265\",\"seats9swd1\":\"18\",\"grade9swdfilledflag1\":\"N\",\"grade9swdapplicants1\":\"53\",\"seats101\":\"Yes-50\",\"admissionspriority11\":\"Priority to Brooklyn students or residents\",\"admissionspriority21\":\"Then to New York City residents\",\"grade9geapplicantsperseat1\":\"3\",\"grade9swdapplicantsperseat1\":\"3\",\"primary_address_line_1\":\"883 Classon Avenue\",\"city\":\"Brooklyn\",\"zip\":\"11225\",\"state_code\":\"NY\",\"latitude\":\"40.66981\",\"longitude\":\"-73.9607\",\"community_board\":\"9\",\"council_district\":\"35\",\"census_tract\":\"213\",\"bin\":\"3029686\",\"bbl\":\"3011870001\",\"nta\":\"Crown Heights South\",\"borough\":\"BROOKLYN\"}"
                let decoder = JSONDecoder()
                let decoded = try? decoder.decode(School.self, from: json.data(using: .utf8)!)
                let schola = decoded!
                ScoreService.instance.add(SATScore(dbn: schola.dbn!, schoolName: schola.schoolName!, numOfSatTestTakers: "100", satCriticalReadingAvgScore: "370", satMathAvgScore: "390", satWritingAvgScore: "320"))
                return schola
            }())
            SATView({
                let json = "{\"dbn\":\"17K548\",\"school_name\":\"Brooklyn School for Music & Theatre\",\"boro\":\"K\",\"overview_paragraph\":\"Brooklyn School for Music & Theatre (BSMT) uses our academic program to accommodate the intellectual, social, and emotional needs of creative high school students. Our vision is to provide a model professional environment where respect is mutual, ideas are shared, and learning is not limited to the classroom. We prepare students for higher education through our rigorous academic program while simultaneously allowing them to develop professional careers in the music and theatre industries.\",\"school_10th_seats\":\"1\",\"academicopportunities1\":\"CTE program(s) in: Arts, A/V Technology & Communication\",\"academicopportunities2\":\"iLearnNYC: Program for expanded online coursework and self-paced learning\",\"academicopportunities3\":\"We offer highly competitive positions in our Drama, Chorus, and Dance Company classes\",\"academicopportunities4\":\"Students receive small group instruction focused on sharpening their skills while developing their professional portfolio for auditions\",\"ell_programs\":\"English as a New Language\",\"language_classes\":\"Spanish\",\"advancedplacement_courses\":\"AP English, AP Environmental Science, AP US History\",\"neighborhood\":\"Crown Heights South\",\"shared_space\":\"Yes\",\"campus_name\":\"Prospect Heights Educational Campus\",\"building_code\":\"K440\",\"location\":\"883 Classon Avenue, Brooklyn NY 11225 (40.669805, -73.960689)\",\"phone_number\":\"718-230-6250\",\"fax_number\":\"718-230-6262\",\"school_email\":\"prandaz@schools.nyc.gov\",\"website\":\"www.bkmusicntheatre.com\",\"subway\":\"2, 3, 4, 5 to Franklin Ave; B, Q to Prospect Park; F to Park Place; S to Botanic Garden\",\"bus\":\"B16, B41, B43, B44-SBS, B45, B48, B49, B69\",\"grades2018\":\"9-12\",\"finalgrades\":\"9-12\",\"total_students\":\"352\",\"start_time\":\"8:10am\",\"end_time\":\"3pm\",\"extracurricular_activities\":\"Chess, The Step Team, Fashion, Tech Team, WomenÂ’s Group; Extensive arts after-school program: Tech, Dance, Drama, and Chorus Companies; Crew program that trains students in running the lights, sound, video, and all backstage and pit crew responsibilities; Saturday and after-school classes for Regents Preparation; School Leadership Team; Student Government; At least three annual major school-wide productions; Two annual talent shows\",\"psal_sports_boys\":\"Baseball, Basketball, Cross Country, Indoor Track, Outdoor Track, Soccer, Swimming\",\"psal_sports_girls\":\"Basketball, Soccer\",\"psal_sports_coed\":\"Cricket, Double Dutch\",\"graduation_rate\":\"0.833000004\",\"attendance_rate\":\"0.889999986\",\"pct_stu_enough_variety\":\"0.689999998\",\"college_career_rate\":\"0.389999986\",\"pct_stu_safe\":\"0.649999976\",\"school_accessibility_description\":\"1\",\"prgdesc1\":\"Provides arts instruction to all students and integrates the arts into the core curriculum.\",\"offer_rate1\":\"Â—87% of offers went to this group\",\"program1\":\"Performing and Visual Arts\",\"code1\":\"K48A\",\"interest1\":\"Performing Arts\",\"method1\":\"Ed. Opt.\",\"seats9ge1\":\"90\",\"grade9gefilledflag1\":\"N\",\"grade9geapplicants1\":\"265\",\"seats9swd1\":\"18\",\"grade9swdfilledflag1\":\"N\",\"grade9swdapplicants1\":\"53\",\"seats101\":\"Yes-50\",\"admissionspriority11\":\"Priority to Brooklyn students or residents\",\"admissionspriority21\":\"Then to New York City residents\",\"grade9geapplicantsperseat1\":\"3\",\"grade9swdapplicantsperseat1\":\"3\",\"primary_address_line_1\":\"883 Classon Avenue\",\"city\":\"Brooklyn\",\"zip\":\"11225\",\"state_code\":\"NY\",\"latitude\":\"40.66981\",\"longitude\":\"-73.9607\",\"community_board\":\"9\",\"council_district\":\"35\",\"census_tract\":\"213\",\"bin\":\"3029686\",\"bbl\":\"3011870001\",\"nta\":\"Crown Heights South\",\"borough\":\"BROOKLYN\"}"
                let decoder = JSONDecoder()
                let decoded = try? decoder.decode(School.self, from: json.data(using: .utf8)!)
                let schola = decoded!
                ScoreService.instance.add(SATScore(dbn: schola.dbn!, schoolName: schola.schoolName!, numOfSatTestTakers: "100", satCriticalReadingAvgScore: "370", satMathAvgScore: "390", satWritingAvgScore: "320"))
                return schola
            }())
            .previewDevice("iPhone 12 Pro Max")
        }
    }
}
