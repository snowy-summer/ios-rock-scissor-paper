//
//  RPS.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class RPS
{
    var whichTurn: String = ""
    
    func play(_ gameResult: String) throws -> String
    {
        whichTurn = gameResult
        
        while true
        {
            startMessage()
            
            do
            {
                let user: Int = try checkInput()

                switch user
                {
                case 0:
                    print("게임 종료")
                    return "exit"
                case 1...3:
                    let gameResult: String = getResult(of: user)
                    return gameResult
                default:
                    throw ErrorCases.invalidInput
                }
            }
            catch ErrorCases.invalidInput
            {
                whichTurn = "컴퓨터"
                print("잘못된 입력입니다. 다시 입력해주세요")
            }
        }
    }
    
    func checkInput() throws -> Int
    {
        guard let user = readLine(), let user = Int(user) else
        {
            throw ErrorCases.invalidInput
        }
        
        return user
    }

    func getResult(of user: Int) -> String
    {
        let computer = Int.random(in: 1...3)
        
        if user == computer
        {
            print("비겼습니다")
            return "repeat"
        }
        else if isWin(of: user, versus: computer)
        {
            print("이겼습니다")
            return "사용자"
        }
        else
        {
            print("졌습니다")
            return "컴퓨터"
        }
    }
    
    func isWin(of user: Int, versus computer: Int) -> Bool
    {
        let winCase: [Int: Int] =
        [
            CasesOf.rock.rawValue: CasesOf.scissors.rawValue,
            CasesOf.paper.rawValue: CasesOf.rock.rawValue,
            CasesOf.scissors.rawValue: CasesOf.paper.rawValue
        ]
        
        if winCase[user] == computer
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func startMessage()
    {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
}
