//
//  TMBManager.swift
//  TMB-Calculator
//
//  Created by ISTEC on 16/07/2020.
//  Copyright © 2020 Flawless. All rights reserved.
//

import Foundation

struct TMBManager {
    var tmb: TMB?
    
    func getTMBValue() -> String {
        let convertValue = String(format: "%.0f", tmb?.tmbValue ?? 0.0)
        return convertValue
    }
    
    func getKeepWeightValue() -> String {
        let convertValue = String(format: "%.0f", tmb?.keepWeight ?? 0.0)
        return convertValue
    }
    
    func getLoseWeightValue() -> String {
        let convertValue = String(format: "%.0f", tmb?.loseWeight ?? 0.0)
        return convertValue
    }

    func getGainWeightValue() -> String {
        let convertValue = String(format: "%.0f", tmb?.gainWeight ?? 0.0)
        return convertValue
    }

    
    mutating func calculateTMB(gender: String, height: Float, weight: Float, age: Float, activityLevel: String) {
        
        var activityLevelValue: Float = 0.0
        var tmbValue: Float = 0.0
        
        if activityLevel == "Sedentário" {
            //- Sedentários = 1.2 (pouco ou nenhum exercício)
            activityLevelValue = 1.2
        }
        else if activityLevel == "Levemente Ativo" {
            //- Levemente ativo = 1.375 (exercício leve 1 a 3 dias por semana)
            activityLevelValue = 1.375
        }
        else if activityLevel == "Moderadamente Ativo" {
            //- Moderadamente ativo = 1.55 (exercício moderado, faz esportes 3 a 5 dias por semana)
            activityLevelValue = 1.55
        }
        else if activityLevel == "Altamente Ativo" {
            //- Altamente ativo = 1.725 (exercício pesado de 5 a 6 dias por semana)
            activityLevelValue = 1.725
        }
        else if activityLevel == "Extremamente Ativo" {
            //- Extremamente ativo = 1.9 (exercício pesado diariamente e até 2 vezes por dia)
            activityLevelValue = 1.99
        }
        
        if (gender == "Masculino") {
            //man tmb
            let getWeight: Float = Float(10 * weight)
            let getHeight: Float = Float(6.25 * height)
            let getAge: Float = Float(5 * age)
            tmbValue = getWeight + getHeight - getAge + 5
        }
        else {
            //women tmb
            let getWeight: Float = Float(10 * weight)
            let getHeight: Float = Float(6.25 * height)
            let getAge: Float = Float(5 * age)
            tmbValue = getWeight + getHeight - getAge + 161
        }
        
        let keepWeight = tmbValue * activityLevelValue
        let loseWeight = keepWeight - 500
        let gainWeight = keepWeight + 500
        
        tmb = TMB(tmbValue: tmbValue, keepWeight: keepWeight, loseWeight: loseWeight, gainWeight: gainWeight)
    }
    
    
}
