// The MIT License (MIT)
//
// Copyright (c) 2016 Luke Zhao <me@lkzhao.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

@objc public protocol HeroTabBarControllerDelegate {
  @objc optional func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
  @objc optional func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
  @objc optional func heroTabWillStartAnimatingFrom(viewController: UIViewController)
  @objc optional func heroTabDidEndAnimatingFrom(viewController: UIViewController)
  @objc optional func heroTabDidCancelAnimatingFrom(viewController: UIViewController)
  
  @objc optional func heroTabWillStartTransition()
  @objc optional func heroTabDidEndTransition()
  @objc optional func heroTabDidCancelTransition()
  
  @objc optional func heroTabWillStartAnimatingTo(viewController: UIViewController)
  @objc optional func heroTabDidEndAnimatingTo(viewController: UIViewController)
  @objc optional func heroTabDidCancelAnimatingTo(viewController: UIViewController)
}

// delegate helper
internal extension HeroTransition {
  func closureProcessForHeroTabDelegate<T: UIViewController>(vc: T, closure: (HeroTabBarControllerDelegate) -> Void) {
    if let parent = vc.parent,
      let delegate = parent as? HeroTabBarControllerDelegate {
      closure(delegate)
    }
  }
}

