// CARBON_TODO: Verify package and import syntax.
package Mbgl.Actor;

// CARBON_TODO: Verify import syntax for standard library types.
import Carbon.Atomic;
import Carbon.Function;
import Carbon.Optional;
import Carbon.SharedPtr;
import Carbon.UniquePtr;
// CARBON_TODO: Import for mapbox::base::WeakPtr equivalent
// import Mapbox.Base.WeakPtr; // Assuming a direct equivalent exists

// Forward declarations
// CARBON_TODO: Verify forward declaration syntax if needed, or rely on imports.
// class Scheduler;
// class Message;

// CARBON_TODO: Determine if Carbon has a direct equivalent for std::enable_shared_from_this.
// This will affect how `shared_from_this` and `weak_from_this` are implemented.
public class Mailbox {
    // Public constructors
    // CARBON_TODO: Verify constructor syntax.
    // Creates a "holding" mailbox.
    public fn Create() -> Mailbox;

    // CARBON_TODO: Need to define Scheduler and TaggedScheduler or their equivalents.
    // public fn CreateWithScheduler(scheduler: Scheduler) -> Mailbox;
    // public fn CreateWithTaggedScheduler(scheduler: TaggedScheduler) -> Mailbox;

    // Public methods
    // CARBON_TODO: Verify method syntax.
    // CARBON_TODO: Parameter types need to be Carbon equivalents.
    // public fn Open(scheduler: TaggedScheduler) -> void;
    // public fn OpenWithScheduler(scheduler: Scheduler) -> void;
    public fn Close() -> void;
    public fn Abandon() -> void; // New method from C++
    public fn IsOpen() -> bool;

    // CARBON_TODO: Define Message class or its equivalent.
    // public fn Push(message: UniquePtr<Message>) -> void;

    // CARBON_TODO: `receive` was private in C++, but seems to be used in a way
    // that might require it to be public or part of an interface if Carbon's
    // scheduling mechanism differs significantly. For now, keep as internal detail.
    // public fn Receive() -> void;
}

// CARBON_TODO: Define supporting classes/structs if they are part of the public API.
// For example, if Message is directly used by clients of Mailbox.
// public class Message { ... }

// Enum translated from C++ Mailbox::State
// CARBON_TODO: Verify enum syntax and scoping.
// Might be better inside the Mailbox class if Carbon supports nested types like C++.
enum MailboxState : u32 {
    Idle = 0,
    Processing,
    Abandoned,
}
