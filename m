Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2528D82E;
	Wed, 14 May 2025 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250526; cv=pass; b=q9wIzonauigrQFV49Txe3VItwAjy7MALRG1gtxTYcScVRiJ1F5TVfepv16sH93iNKTS4LR2xGSSCkdIOrSWiLvKbmRmh1R3YmrP1lad88h2h1rPIpjMPgDHdCN0Rql6IAu3gAxsWqL96mWTexaujzlD8WHckrb4XzqOTPlycSK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250526; c=relaxed/simple;
	bh=Xwi0cAKU397L1g71406+7vd4lb2Js1cXkmrzJbQB7r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ss8yRRXMouDYot6ro0afhq9uqwN1iqfuqNaBgLtbJqruk2A/ljQyWLMQpWoSB/qNGhurLbXZrFmSKfz0FAVeBlnM9vY/3/k3oqUFaEQHbXvJt6zIzXOyKgRLjBWTjeUS6Qqdz4aF2+XhRcFTRu84iqboBhKDpiPatNMe4qlzUSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=El2WJ6G+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="El2WJ6G+"
ARC-Seal: i=1; a=rsa-sha256; t=1747250489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mw+bSoajMJrcLMHGjNrS2R3ckLCzLA3LHK8kwPaZVeYnL45dksuk8U+rT4WdpMUz5ary3HxbVTiBKAZH3rXEeTRQYM3754fBVkQC4IeSDSGQHhudPy8IMmjhh2ixyYA5bGWBWaJmRDwr1FVspaUQ7krBYf9fXRl2ohomK0edq2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747250489; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VnbUbKc2xDi0YCX1DyhPnZeDgMvBFcod7VTwrTEwzlY=; 
	b=iuh51/oO9wtA3EI1Nc/bsOfpYWLVOBpEthuAjOJmsfzh2byW2vNo99luMlTreROJbfxmS3Co9IRqyh11yPWM6iCGsNH0JXGMGb3NIXe9Mw+p8UqS4rjPswfMtw+Zp6boqY6IShQ5U+pebrAUMIcW0Q6wNL7eZWAu9j9DDIc4row=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747250489;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VnbUbKc2xDi0YCX1DyhPnZeDgMvBFcod7VTwrTEwzlY=;
	b=El2WJ6G+0rnm5jEuk9gl6shGauOGbel4coqgKl43+YJIQnMkhyHGPlb7AzzzWVsv
	nxW/loIUeqU1fM5YqUODAZ+RRjFMVi8J5pfQlMohgj86vyDrYtsDA0Y9G66Tl4tx9xv
	gzXSDca6F/1iZWRSndK94kEgD9CmFqxezAIpD59c=
Received: by mx.zohomail.com with SMTPS id 1747250486977302.73191471573443;
	Wed, 14 May 2025 12:21:26 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 14 May 2025 16:20:51 -0300
Subject: [PATCH v3 1/2] rust: irq: add support for request_irq()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
In-Reply-To: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Add support for registering IRQ handlers in Rust.

IRQ handlers are extensively used in drivers when some peripheral wants
to obtain the CPU attention. Registering a handler will make the system
invoke the passed-in function whenever the chosen IRQ line is triggered.

Both regular and threaded IRQ handlers are supported through a Handler
(or ThreadedHandler) trait that is meant to be implemented by a type
that:

a) provides a function to be run by the system when the IRQ fires and,

b) holds the shared data (i.e.: `T`) between process and IRQ contexts.

The requirement that T is Sync derives from the fact that handlers might
run concurrently with other processes executing the same driver,
creating the potential for data races.

Ideally, some interior mutability must be in place if T is to be
mutated. This should usually be done through the in-flight SpinLockIrq
type.

Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/irq.c              |   9 +
 rust/kernel/irq.rs              |  24 +++
 rust/kernel/irq/flags.rs        | 102 +++++++++
 rust/kernel/irq/request.rs      | 455 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 7 files changed, 593 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70d52e69b754bf855bc19911d156d8..37fff7476c81ed39fcfd280bfc432d043725df30 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -18,6 +18,7 @@
 #include <linux/ethtool.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
+#include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15b672c5e4ab10c4e4c01ed407fae6..8c6d00219fe021b2e2b3ca27ad1d5ccb58b365fd 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -15,6 +15,7 @@
 #include "cred.c"
 #include "device.c"
 #include "err.c"
+#include "irq.c"
 #include "fs.c"
 #include "io.c"
 #include "jump_label.c"
diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
new file mode 100644
index 0000000000000000000000000000000000000000..1faca428e2c047a656dec3171855c1508d67e60b
--- /dev/null
+++ b/rust/helpers/irq.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/interrupt.h>
+
+int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
+			    unsigned long flags, const char *name, void *dev)
+{
+	return request_irq(irq, handler, flags, name, dev);
+}
diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
new file mode 100644
index 0000000000000000000000000000000000000000..639690b7166f5201f5aaf52267ffe6e1e712d805
--- /dev/null
+++ b/rust/kernel/irq.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IRQ abstractions.
+//!
+//! An IRQ is an interrupt request from a device. It is used to get the CPU's
+//! attention so it can service a hardware event in a timely manner.
+//!
+//! The current abstractions handle IRQ requests and handlers, i.e.: it allows
+//! drivers to register a handler for a given IRQ line.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/interrupt.h)
+
+/// IRQ allocation and handling.
+pub mod request;
+
+/// Flags to be used when registering IRQ handlers.
+pub mod flags;
+
+pub use request::Handler;
+pub use request::IrqReturn;
+pub use request::Registration;
+pub use request::ThreadedHandler;
+pub use request::ThreadedIrqReturn;
+pub use request::ThreadedRegistration;
diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55ebcf4d52450c0052df30
--- /dev/null
+++ b/rust/kernel/irq/flags.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
+
+use crate::bindings;
+
+/// Flags to be used when registering IRQ handlers.
+///
+/// They can be combined with the operators `|`, `&`, and `!`.
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub struct Flags(u64);
+
+impl Flags {
+    pub(crate) fn into_inner(self) -> u64 {
+        self.0
+    }
+}
+
+impl core::ops::BitOr for Flags {
+    type Output = Self;
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl core::ops::BitAnd for Flags {
+    type Output = Self;
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
+impl core::ops::Not for Flags {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        Self(!self.0)
+    }
+}
+
+/// Use the interrupt line as already configured.
+pub const TRIGGER_NONE: Flags = Flags(bindings::IRQF_TRIGGER_NONE as u64);
+
+/// The interrupt is triggered when the signal goes from low to high.
+pub const TRIGGER_RISING: Flags = Flags(bindings::IRQF_TRIGGER_RISING as u64);
+
+/// The interrupt is triggered when the signal goes from high to low.
+pub const TRIGGER_FALLING: Flags = Flags(bindings::IRQF_TRIGGER_FALLING as u64);
+
+/// The interrupt is triggered while the signal is held high.
+pub const TRIGGER_HIGH: Flags = Flags(bindings::IRQF_TRIGGER_HIGH as u64);
+
+/// The interrupt is triggered while the signal is held low.
+pub const TRIGGER_LOW: Flags = Flags(bindings::IRQF_TRIGGER_LOW as u64);
+
+/// Allow sharing the irq among several devices.
+pub const SHARED: Flags = Flags(bindings::IRQF_SHARED as u64);
+
+/// Set by callers when they expect sharing mismatches to occur.
+pub const PROBE_SHARED: Flags = Flags(bindings::IRQF_PROBE_SHARED as u64);
+
+/// Flag to mark this interrupt as timer interrupt.
+pub const TIMER: Flags = Flags(bindings::IRQF_TIMER as u64);
+
+/// Interrupt is per cpu.
+pub const PERCPU: Flags = Flags(bindings::IRQF_PERCPU as u64);
+
+/// Flag to exclude this interrupt from irq balancing.
+pub const NOBALANCING: Flags = Flags(bindings::IRQF_NOBALANCING as u64);
+
+/// Interrupt is used for polling (only the interrupt that is registered
+/// first in a shared interrupt is considered for performance reasons).
+pub const IRQPOLL: Flags = Flags(bindings::IRQF_IRQPOLL as u64);
+
+/// Interrupt is not reenabled after the hardirq handler finished. Used by
+/// threaded interrupts which need to keep the irq line disabled until the
+/// threaded handler has been run.
+pub const ONESHOT: Flags = Flags(bindings::IRQF_ONESHOT as u64);
+
+/// Do not disable this IRQ during suspend. Does not guarantee that this
+/// interrupt will wake the system from a suspended state.
+pub const NO_SUSPEND: Flags = Flags(bindings::IRQF_NO_SUSPEND as u64);
+
+/// Force enable it on resume even if [`NO_SUSPEND`] is set.
+pub const FORCE_RESUME: Flags = Flags(bindings::IRQF_FORCE_RESUME as u64);
+
+/// Interrupt cannot be threaded.
+pub const NO_THREAD: Flags = Flags(bindings::IRQF_NO_THREAD as u64);
+
+/// Resume IRQ early during syscore instead of at device resume time.
+pub const EARLY_RESUME: Flags = Flags(bindings::IRQF_EARLY_RESUME as u64);
+
+/// If the IRQ is shared with a [`NO_SUSPEND`] user, execute this interrupt
+/// handler after suspending interrupts. For system wakeup devices users
+/// need to implement wakeup detection in their interrupt handlers.
+pub const COND_SUSPEND: Flags = Flags(bindings::IRQF_COND_SUSPEND as u64);
+
+/// Don't enable IRQ or NMI automatically when users request it. Users will
+/// enable it explicitly by `enable_irq` or `enable_nmi` later.
+pub const NO_AUTOEN: Flags = Flags(bindings::IRQF_NO_AUTOEN as u64);
+
+/// Exclude from runnaway detection for IPI and similar handlers, depends on
+/// `PERCPU`.
+pub const NO_DEBUG: Flags = Flags(bindings::IRQF_NO_DEBUG as u64);
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
new file mode 100644
index 0000000000000000000000000000000000000000..55f0ea8f9a93dc9ada67ce91af686a9634c8e8ed
--- /dev/null
+++ b/rust/kernel/irq/request.rs
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
+
+//! IRQ allocation and handling
+
+use core::marker::PhantomPinned;
+use core::ptr::addr_of_mut;
+
+use pin_init::pin_init_from_closure;
+
+use crate::alloc::Allocator;
+use crate::error::to_result;
+use crate::irq::flags::Flags;
+use crate::prelude::*;
+use crate::str::CStr;
+use crate::sync::Arc;
+
+/// The value that can be returned from an IrqHandler or a ThreadedIrqHandler.
+#[repr(u32)]
+pub enum IrqReturn {
+    /// The interrupt was not from this device or was not handled.
+    None = bindings::irqreturn_IRQ_NONE,
+
+    /// The interrupt was handled by this device.
+    Handled = bindings::irqreturn_IRQ_HANDLED,
+}
+
+/// Callbacks for an IRQ handler.
+pub trait Handler: Sync {
+    /// The actual handler function. As usual, sleeps are not allowed in IRQ
+    /// context.
+    fn handle_irq(&self) -> IrqReturn;
+}
+
+impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
+    fn handle_irq(&self) -> IrqReturn {
+        T::handle_irq(self)
+    }
+}
+
+impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
+    fn handle_irq(&self) -> IrqReturn {
+        T::handle_irq(self)
+    }
+}
+
+/// A registration of an IRQ handler for a given IRQ line.
+///
+/// # Examples
+///
+/// The following is an example of using `Registration`. It uses a
+/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior mutability.
+/// Note that Spinlocks are not safe to use in IRQ context as of now, but may be
+/// in the future.
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::irq::flags;
+/// use kernel::irq::Registration;
+/// use kernel::irq::IrqReturn;
+/// use kernel::sync::Arc;
+/// use kernel::sync::SpinLock;
+/// use kernel::c_str;
+/// use kernel::alloc::flags::GFP_KERNEL;
+///
+/// // Declare a struct that will be passed in when the interrupt fires. The u32
+/// // merely serves as an example of some internal data.
+/// struct Data(SpinLock<u32>);
+///
+/// // [`handle_irq`] takes &self. This example illustrates interior
+/// // mutability can be used when share the data between process context and IRQ
+/// // context.
+///
+/// type Handler = Data;
+///
+/// impl kernel::irq::request::Handler for Handler {
+///     // This is executing in IRQ context in some CPU. Other CPUs can still
+///     // try to access to data.
+///     fn handle_irq(&self) -> IrqReturn {
+///         // We now have exclusive access to the data by locking the
+///         // SpinLock.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         IrqReturn::Handled
+///     }
+/// }
+///
+/// // This is running in process context.
+/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
+///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
+///
+///     // You can have as many references to the registration as you want, so
+///     // multiple parts of the driver can access it.
+///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
+///
+///     // The handler may be called immediately after the function above
+///     // returns, possibly in a different CPU.
+///
+///     {
+///         // The data can be accessed from the process context too.
+///         let mut data = registration.handler().0.lock();
+///         *data = 42;
+///     }
+///
+///     Ok(registration)
+/// }
+///
+/// # Ok::<(), Error>(())
+///```
+///
+/// # Invariants
+///
+/// * We own an irq handler using `&self` as its private data.
+///
+#[pin_data(PinnedDrop)]
+pub struct Registration<T: Handler> {
+    irq: u32,
+    #[pin]
+    handler: T,
+    #[pin]
+    /// Pinned because we need address stability so that we can pass a pointer
+    /// to the callback.
+    _pin: PhantomPinned,
+}
+
+impl<T: Handler> Registration<T> {
+    /// Registers the IRQ handler with the system for the given IRQ number. The
+    /// handler must be able to be called as soon as this function returns.
+    pub fn register(
+        irq: u32,
+        flags: Flags,
+        name: &'static CStr,
+        handler: T,
+    ) -> impl PinInit<Self, Error> {
+        let closure = move |slot: *mut Self| {
+            // SAFETY: The slot passed to pin initializer is valid for writing.
+            unsafe {
+                slot.write(Self {
+                    irq,
+                    handler,
+                    _pin: PhantomPinned,
+                })
+            };
+
+            // SAFETY:
+            // - The callbacks are valid for use with request_irq.
+            // - If this succeeds, the slot is guaranteed to be valid until the
+            // destructor of Self runs, which will deregister the callbacks
+            // before the memory location becomes invalid.
+            let res = to_result(unsafe {
+                bindings::request_irq(
+                    irq,
+                    Some(handle_irq_callback::<T>),
+                    flags.into_inner() as usize,
+                    name.as_char_ptr(),
+                    &*slot as *const _ as *mut core::ffi::c_void,
+                )
+            });
+
+            if res.is_err() {
+                // SAFETY: We are returning an error, so we can destroy the slot.
+                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
+            }
+
+            res
+        };
+
+        // SAFETY:
+        // - if this returns Ok, then every field of `slot` is fully
+        // initialized.
+        // - if this returns an error, then the slot does not need to remain
+        // valid.
+        unsafe { pin_init_from_closure(closure) }
+    }
+
+    /// Returns a reference to the handler that was registered with the system.
+    pub fn handler(&self) -> &T {
+        &self.handler
+    }
+}
+
+#[pinned_drop]
+impl<T: Handler> PinnedDrop for Registration<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY:
+        // - `self.irq` is the same as the one passed to `reques_irq`.
+        // -  `&self` was passed to `request_irq` as the cookie. It is
+        // guaranteed to be unique by the type system, since each call to
+        // `register` will return a different instance of `Registration`.
+        //
+        // Notice that this will block until all handlers finish executing,
+        // i.e.: at no point will &self be invalid while the handler is running.
+        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
+    }
+}
+
+/// The value that can be returned from `ThreadedHandler::handle_irq`.
+#[repr(u32)]
+pub enum ThreadedIrqReturn {
+    /// The interrupt was not from this device or was not handled.
+    None = bindings::irqreturn_IRQ_NONE,
+
+    /// The interrupt was handled by this device.
+    Handled = bindings::irqreturn_IRQ_HANDLED,
+
+    /// The handler wants the handler thread to wake up.
+    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD,
+}
+
+/// Callbacks for a threaded IRQ handler.
+pub trait ThreadedHandler: Sync {
+    /// The actual handler function. As usual, sleeps are not allowed in IRQ
+    /// context.
+    fn handle_irq(&self) -> ThreadedIrqReturn;
+
+    /// The threaded handler function. This function is called from the irq
+    /// handler thread, which is automatically created by the system.
+    fn thread_fn(&self) -> IrqReturn;
+}
+
+impl<T: ?Sized + ThreadedHandler + Send> ThreadedHandler for Arc<T> {
+    fn handle_irq(&self) -> ThreadedIrqReturn {
+        T::handle_irq(self)
+    }
+
+    fn thread_fn(&self) -> IrqReturn {
+        T::thread_fn(self)
+    }
+}
+
+impl<T: ?Sized + ThreadedHandler, A: Allocator> ThreadedHandler for Box<T, A> {
+    fn handle_irq(&self) -> ThreadedIrqReturn {
+        T::handle_irq(self)
+    }
+
+    fn thread_fn(&self) -> IrqReturn {
+        T::thread_fn(self)
+    }
+}
+
+/// A registration of a threaded IRQ handler for a given IRQ line.
+///
+/// Two callbacks are required: one to handle the IRQ, and one to handle any
+/// other work in a separate thread.
+///
+/// The thread handler is only called if the IRQ handler returns `WakeThread`.
+///
+/// # Examples
+///
+/// The following is an example of using `ThreadedRegistration`. It uses a
+/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior mutability.
+/// Note that Spinlocks are not safe to use in IRQ context as of now, but may be
+/// in the future.
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::irq::flags;
+/// use kernel::irq::ThreadedIrqReturn;
+/// use kernel::irq::ThreadedRegistration;
+/// use kernel::irq::IrqReturn;
+/// use kernel::sync::Arc;
+/// use kernel::sync::SpinLock;
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::c_str;
+///
+/// // Declare a struct that will be passed in when the interrupt fires. The u32
+/// // merely serves as an example of some internal data.
+/// struct Data(SpinLock<u32>);
+///
+/// // [`handle_irq`] takes &self. This example illustrates interior
+/// // mutability can be used when share the data between process context and IRQ
+/// // context.
+///
+/// type Handler = Data;
+///
+/// impl kernel::irq::request::ThreadedHandler for Handler {
+///     // This is executing in IRQ context in some CPU. Other CPUs can still
+///     // try to access to data.
+///     fn handle_irq(&self) -> ThreadedIrqReturn {
+///         // We now have exclusive access to the data by locking the
+///         // SpinLockIrq.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         // By returning `WakeThread`, we indicate to the system that the
+///         // thread function should be called. Otherwise, return
+///         // ThreadedIrqReturn::Handled.
+///         ThreadedIrqReturn::WakeThread
+///     }
+///
+///     // This will run (in a separate kthread) if and only if `handle_irq`
+///     // returns `WakeThread`.
+///     fn thread_fn(&self) -> IrqReturn {
+///         // We now have exclusive access to the data by locking the SpinLock.
+///         //
+///         // Ideally, we should disable interrupts while we are doing this to
+///         // avoid deadlocks, but this is not currently possible.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         IrqReturn::Handled
+///     }
+/// }
+///
+/// // This is running in process context.
+/// fn register_threaded_irq(irq: u32, handler: Handler) -> Result<Arc<ThreadedRegistration<Handler>>> {
+///     let registration = ThreadedRegistration::register(irq, flags::SHARED, c_str!("my-device"), handler);
+///
+///     // You can have as many references to the registration as you want, so
+///     // multiple parts of the driver can access it.
+///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
+///
+///     // The handler may be called immediately after the function above
+///     // returns, possibly in a different CPU.
+///
+///     {
+///         // The data can be accessed from the process context too.
+///         //
+///         // Ideally, we should disable interrupts while we are doing this to
+///         // avoid deadlocks, but this is not currently possible.
+///         let mut data = registration.handler().0.lock();
+///         *data = 42;
+///     }
+///
+///     Ok(registration)
+/// }
+///
+///
+/// # Ok::<(), Error>(())
+///```
+///
+/// # Invariants
+///
+/// * We own an irq handler using `&self` as its private data.
+///
+#[pin_data(PinnedDrop)]
+pub struct ThreadedRegistration<T: ThreadedHandler> {
+    irq: u32,
+    #[pin]
+    handler: T,
+    #[pin]
+    /// Pinned because we need address stability so that we can pass a pointer
+    /// to the callback.
+    _pin: PhantomPinned,
+}
+
+impl<T: ThreadedHandler> ThreadedRegistration<T> {
+    /// Registers the IRQ handler with the system for the given IRQ number. The
+    /// handler must be able to be called as soon as this function returns.
+    pub fn register(
+        irq: u32,
+        flags: Flags,
+        name: &'static CStr,
+        handler: T,
+    ) -> impl PinInit<Self, Error> {
+        let closure = move |slot: *mut Self| {
+            // SAFETY: The slot passed to pin initializer is valid for writing.
+            unsafe {
+                slot.write(Self {
+                    irq,
+                    handler,
+                    _pin: PhantomPinned,
+                })
+            };
+
+            // SAFETY:
+            // - The callbacks are valid for use with request_threaded_irq.
+            // - If this succeeds, the slot is guaranteed to be valid until the
+            // destructor of Self runs, which will deregister the callbacks
+            // before the memory location becomes invalid.
+            let res = to_result(unsafe {
+                bindings::request_threaded_irq(
+                    irq,
+                    Some(handle_threaded_irq_callback::<T>),
+                    Some(thread_fn_callback::<T>),
+                    flags.into_inner() as usize,
+                    name.as_char_ptr(),
+                    slot.cast(),
+                )
+            });
+
+            if res.is_err() {
+                // SAFETY: We are returning an error, so we can destroy the slot.
+                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
+            }
+
+            res
+        };
+
+        // SAFETY:
+        // - if this returns Ok(()), then every field of `slot` is fully
+        // initialized.
+        // - if this returns an error, then the slot does not need to remain
+        // valid.
+        unsafe { pin_init_from_closure(closure) }
+    }
+
+    /// Returns a reference to the handler that was registered with the system.
+    pub fn handler(&self) -> &T {
+        &self.handler
+    }
+}
+
+#[pinned_drop]
+impl<T: ThreadedHandler> PinnedDrop for ThreadedRegistration<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY:
+        // - `self.irq` is the same as the one passed to `request_threaded_irq`.
+        // -  `&self` was passed to `request_threaded_irq` as the cookie. It is
+        // guaranteed to be unique by the type system, since each call to
+        // `register` will return a different instance of
+        // `ThreadedRegistration`.
+        //
+        // Notice that this will block until all handlers finish executing, so,
+        // at no point will &self be invalid while the handler is running.
+        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
+    }
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_irq`.
+unsafe extern "C" fn handle_irq_callback<T: Handler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `Registration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::handle_irq(data) as _
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_threaded_irq`.
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::handle_irq(data) as _
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_threaded_irq`.
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::thread_fn(data) as _
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5fe46fd89517e234b97a6590c8e93..4caa1a8f96c6c9a2ac6979bd7fcb60d2b6f55132 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -56,6 +56,7 @@
 pub mod init;
 pub mod io;
 pub mod ioctl;
+pub mod irq;
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;

-- 
2.49.0

