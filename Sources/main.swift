import SwiftVan

// MARK: - Counter App

final class CounterApp {
    func render() -> AnyElement {
        let count = State(0)

        return Div(attributes: { ["className": "counter"] }) {

            // Logo
            Image(
                attributes: {
                    [
                        "src": "/assets/swiftvan.png",
                        "alt": "SwiftVan Logo",
                        "className": "logo",
                    ]
                }
            )

            // Counter value
            Div(attributes: { ["className": "counter-value"] }) {
                Text { "❤️ " }
                Text { "\(count.value)" }
            }

            // Controls
            Div(attributes: { ["className": "counter-buttons"] }) {

                Button(
                    { ["className": "button primary"] },
                    onclick: {
                        count.value += 1
                    }
                ) {
                    Text { "👍 Increment" }
                }

                Button(
                    { ["className": "button"] },
                    onclick: {
                        count.value -= 1
                    }
                ) {
                    Text { "👎 Decrement" }
                }
            }

            // Getting started hint
            Div(attributes: { ["className": "hint"] }) {
                Text {
                    #"To get started, edit "Sources/main.swift""#
                }
            }

            // Docs button
            HyperLink(
                attributes: {
                    [
                        "href": "https://github.com/GetAutomaApp/SwiftVan",
                        "target": "_blank",
                        "className": "button link",
                    ]
                }
            ) {
                Text { "📘 Documentation" }
            }
        }
    }
}

// MARK: - Mount

let renderer = DomRenderer(root: CounterApp().render())
renderer.mount()
