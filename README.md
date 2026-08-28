# Empty Iterator

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The iterator face of `Empty` — conforms the storage-less zero-element type to `Iterator.Protocol`, the iterator whose `next()` is always `nil`, for every element type.

---

## Quick Start

`Empty<Element>` (from `swift-empty`) carries no element and no behavior of its own. This package attaches its iterator-domain conformance: `Empty` becomes the iterator that is exhausted from construction — the neutral, zero-element case of iteration. Because it holds no storage, the conformance is unconditional over `Empty`'s full `~Copyable & ~Escapable` element domain, so the empty iterator exists even for element types that ordinary iterators cannot carry.

```swift
import Empty_Iterator

// `Empty` is now an iterator: the one that is already exhausted.
var iterator = Empty<Int>()
let value = iterator.next()   // nil — and nil on every subsequent call
```

The conformance sets `Failure` to `Never`: the empty iterator can never fail, so its `next()` does not throw. And because `Empty` has no element storage, the iterator exists for move-only and non-escaping elements too, where most iterators cannot:

```swift
import Empty_Iterator

struct Token: ~Copyable {}

// The empty iterator over a move-only element — no `Token` is ever produced.
var tokens = Empty<Token>()
// tokens.next() is always nil.
```

Importing `Empty_Iterator` re-exports both atom-owned `Empty` and `Iterator`, so a single import brings in the type and the protocol it satisfies.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-empty-iterator.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Empty Iterator", package: "swift-empty-iterator"),
    ]
)
```

Requires Swift 6.4 and macOS 27 / iOS 27 / tvOS 27 / watchOS 27 / visionOS 27 (or the matching Linux / Windows toolchain).

---

## Architecture

One library product. An integration package: it declares no types of its own, only the conformance bridging `swift-empty` to `swift-iterator`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Empty Iterator` | `Sources/Empty Iterator/` | Attaches the retroactive `Iterator.Protocol` conformance to `Empty<Element>` (`next()` always `nil`, `Failure == Never`) over the full `~Copyable & ~Escapable` element domain, and re-exports the current `Empty` and `Iterator` owners. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 27 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
