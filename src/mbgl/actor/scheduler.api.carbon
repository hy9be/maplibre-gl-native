// CARBON_TODO: Verify package and import syntax.
package Mbgl.Actor;

// CARBON_TODO: Verify import syntax for standard library types.
import Carbon.Function;
import Carbon.SharedPtr;
import Carbon.WeakPtr;
import Carbon.Exception; // For std::exception_ptr
// CARBON_TODO: Import for mapbox::base::WeakPtr if different
// import Mapbox.Base.WeakPtr;
// CARBON_TODO: Import for mbgl::util::SimpleIdentity
// import Mbgl.Util.SimpleIdentity;

// CARBON_TODO: Verify abstract class and method syntax.
public abstract class Scheduler {
    // Abstract methods (pure virtual in C++)
    abstract fn Schedule(task: Fn<void()>) -> void;

    // CARBON_TODO: Assuming SimpleIdentity is a type. If not, its definition or import is needed.
    abstract fn ScheduleWithTag(tag: Util.SimpleIdentity, task: Fn<void()>) -> void;

    // CARBON_TODO: mapbox::base::WeakPtr equivalent. For now, using Carbon.WeakPtr.
    abstract fn MakeWeakPtr() -> WeakPtr<Scheduler>;

    // Virtual methods with default implementations in C++
    // CARBON_TODO: Verify if Carbon supports default implementations in abstract classes/interfaces
    // or if these should be non-abstract in a base class if Scheduler remains purely abstract.
    public virtual fn RunOnRenderThread(tag: Util.SimpleIdentity, task: Fn<void()>) -> void {
        // Default implementation is empty
    }

    // CARBON_TODO: [[maybe_unused]] attribute. Assuming Carbon handles unused parameters implicitly or has specific syntax.
    public virtual fn RunRenderJobs(tag: Util.SimpleIdentity, closeQueue: bool //= false // CARBON_TODO: Default parameters
                                  ) -> void {
        // Default implementation is empty
    }

    // CARBON_TODO: Default parameters need Carbon equivalent.
    abstract fn WaitForEmpty(tag: Util.SimpleIdentity //= Util.SimpleIdentity.Empty
                           ) -> void;

    // Non-virtual methods from C++
    // CARBON_TODO: This was a non-virtual public member in C++.
    // It captures `this` (or a weak_ptr to it), so its placement in a purely abstract class needs thought.
    // It might be better as a free function or require a concrete base if `this` is needed directly.
    // For now, assuming it can be part of the abstract class definition.
    public fn BindOnce(task: Fn<void()>) -> Fn<void()>;

    // Template method
    // CARBON_TODO: Verify generic method syntax.
    // CARBON_TODO: `Assert.IsTrue(GetCurrent().IsValid());` equivalent.
    // CARBON_TODO: `std::is_invocable_v` equivalent.
    // CARBON_TODO: `std::forward` equivalent.
    // public fn ScheduleAndReplyValue<TaskFn, ReplyFn>(tag: Util.SimpleIdentity, task: TaskFn, reply: ReplyFn) -> void
    //     where TaskFn: Fn() -> auto, ReplyFn: Fn(auto) -> void;
    // The C++ implementation calls a private template method. This detail might be handled differently.

    // Static methods
    // CARBON_TODO: Verify static method syntax.
    // CARBON_TODO: RunLoop equivalent needed for default GetCurrent initialization.
    static fn GetCurrent(init: bool //= true // CARBON_TODO: Default parameters
                        ) -> Scheduler?; // Returns raw pointer in C++, Optional<SharedPtr<Scheduler>> might be better.
    static fn SetCurrent(scheduler: Scheduler?) -> void; // Takes raw pointer in C++

    // CARBON_TODO: ThreadPool, SequencedScheduler equivalents needed.
    static fn GetBackground() -> SharedPtr<Scheduler>;
    static fn GetSequenced() -> SharedPtr<Scheduler>;

    // Exception handler
    // CARBON_TODO: Verify syntax for function properties and std::exception_ptr equivalent.
    protected handler: Optional<Fn<void(ExceptionPtr)>>; // std::function<void(const std::exception_ptr)>
    public fn SetExceptionHandler(handler_fn: Fn<void(ExceptionPtr)>) -> void;

    // CARBON_TODO: Implement destructor if Carbon requires explicit declaration for abstract classes
    // virtual ~Scheduler() = default;
}

// CARBON_TODO: Verify class syntax.
public class TaggedScheduler {
    public tag: Util.SimpleIdentity; // CARBON_TODO: Verify public member syntax and SimpleIdentity type
    public scheduler: SharedPtr<Scheduler>;

    // Constructor
    // CARBON_TODO: Verify constructor syntax.
    // public TaggedScheduler(scheduler_val: SharedPtr<Scheduler>, tag_val: Util.SimpleIdentity);

    // Methods
    // CARBON_TODO: Verify method syntax.
    public fn Get() -> SharedPtr<Scheduler>;
    public fn Schedule(task: Fn<void()>) -> void;
    public fn RunOnRenderThread(task: Fn<void()>) -> void;
    // CARBON_TODO: Default parameters
    public fn RunRenderJobs(closeQueue: bool //= false
                          ) -> void;
    public fn WaitForEmpty() -> void;

    // Template method
    // public fn ScheduleAndReplyValue<TaskFn, ReplyFn>(task: TaskFn, reply: ReplyFn) -> void
    //     where TaskFn: Fn() -> auto, ReplyFn: Fn(auto) -> void;
}

// CARBON_TODO: Define auxiliary types like Util.SimpleIdentity, ThreadPool, RunLoop, SequencedScheduler
// if their definitions are necessary for compiling this API file, or ensure they are correctly imported.
// Example:
// public class Util.SimpleIdentity { public static var Empty: Util.SimpleIdentity; ... }
// public class ExceptionPtr { ... }
