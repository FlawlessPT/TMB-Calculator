//
//  ActivityLevelsInfosViewController.swift
//  TMB-Calculator
//
//  Created by ISTEC on 17/07/2020.
//  Copyright © 2020 Flawless. All rights reserved.
//

import UIKit

class ActivityLevelsInfosViewController: UIViewController {
    
    @IBOutlet weak var infosLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfos()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadInfos() {
        infosLabel.text = "- Sedentários -> pouco ou nenhum exercício.\n- Levemente ativo -> exercício leve 1 a 3 dias por semana.\n- Moderadamente ativo -> exercício moderado, faz esportes 3 a 5 dias por semana.\n- Altamente ativo -> exercício pesado de 5 a 6 dias por semana.\n- Extremamente ativo -> exercício pesado diariamente e até 2 vezes por dia."
    }
}
