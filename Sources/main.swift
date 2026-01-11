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
                Text { count }
            }

            // Controls
            Div(attributes: { ["className": "counter-buttons"] }) {

                Button(
                    attributes: { ["className": "button"] },
                    onClick: {
                        count.value += 1
                    }
                ) {
                    Text { "👍 Increment" }
                }

                Button(
                    attributes: { ["className": "button secondary"] },
                    onClick: {
                        count.value -= 1
                    }
                ) {
                    Text { "👎 Decrement" }
                }
            }
        }
    }
}

// MARK: - Mount

let renderer = DomRenderer(root: CounterApp().render())
renderer.mount()
