//
//  ScreenTransitionable.swift
//
//  Created by Никита Красавин on 10/09/2019.
//  Copyright © 2019 Handsapp. All rights reserved.
//

import UIKit

protocol ScreenTransitionable: AnyObject {
    func showScreen(_ screen: UIViewController)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func presentScreen(_ screen: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func push(screen: UIViewController, animated: Bool)
}

extension ScreenTransitionable where Self: UIViewController {
    func showScreen(_ screen: UIViewController) {
        show(screen, sender: nil)
    }

    func dismissView(animated: Bool, completion: (() -> Void)?) {
        presentingViewController?.dismiss(animated: animated, completion: completion)
    }

    func presentScreen(_ screen: UIViewController, animated: Bool, completion: (() -> Void)?) {
        present(screen, animated: animated, completion: completion)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func push(screen: UIViewController, animated: Bool) {
        navigationController?.pushViewController(screen, animated: animated)
    }
}
