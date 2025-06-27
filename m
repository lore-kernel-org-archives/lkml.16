Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D855126C393
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017132; cv=none; b=G0BxEFkW7UIqW4y21p8BP25NXU0GG7IYq2VZU/8KCDajmTFm3auK/tnegyFRtMoFxed1BPqu5B5zKIOHnB+UyjX88+EoO2m/swzvwENeq1TwGPW921camRWeiEgzG62d/XG7FCGmUI43bTPE4nCwRqgV30tW4UnRrWcLMY471xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017132; c=relaxed/simple;
	bh=qdTiVE0dVTlQ7ENA+SM+8VVDLZVJzc23hKXd1dE6z1c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RjxmQh0OXbkuQLrKkSBfYx0h0hPO7Vh5BUnCBeumG4czyDOvxaWDBxytfTwVJlOt0YAYwb9YZyKnQbzml9faAhMuVuhNUuHwckuUOz0BK/5XHyP6fQ9/WJ9l5bGE4MGO/JouI5ig7cOn2xSR7biRY0bhgCMvJXpK+NnrNWq1K7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qTxz5FM9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qTxz5FM9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45311704d22so12072895e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751017128; x=1751621928; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEk+Z4eF/8a1kBPq1sIDMheBllpKKEGRgUE+OJkRuQ8=;
        b=qTxz5FM9IUx14LsWGC3BpuLuFiKpVEE1kHFqcNet5Ef0bON9O55Aojv2jnguE0O3lB
         LzkyM0b6WBDQ69l3U2GW88Jwqobv+Ju2ptCTH4I2t1JkxWe90xFXXXADZSL2MIqMvkUv
         RZrCWH4a/+eUr949EKr5Mhyx7yRNe4c3FVfMDC0et9LsDNrS4KfNTkhE7lna1CYEHwLy
         Ancmmk/VUCs2hNkCD/ML+57DKn+6GTfVvQ5oR6vI0iwBV9aaTGfgAUNlOYXtrreW0SUB
         oZUl6NprQTtL4a+UUzkICGM4BMPPze62CxFee8+XqJWEE/vBQ3zYUgx/6VQsCtTVMjKD
         VNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751017128; x=1751621928;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEk+Z4eF/8a1kBPq1sIDMheBllpKKEGRgUE+OJkRuQ8=;
        b=dtiEz4xqs90tOfUD9pM8I8v40fm0ZxbKBUta/hprXNFcpvb/hBzZJWod4Xc20GJpVo
         NUVqzW6MhHH31sJQGkuku5uJ07J7pktCeOQjyFRfgF8AAwPcXZ+v/3lG3TuhVFyRtj7Y
         djr/ur6khYKM/4wo4obvoIml641tIQvHOYPzGnWfKgNIgLH5gUCr8FTQtP0dHTQm3iLY
         ymknjcQAEC2mKpMkDWYczShvN9Olp0CNJwVkk/nm9H8qy3Tsf48IO3sPTvi6T5j83sui
         OLJvOoBqjV9U9FPFpfM4igB8tjBApz0ehQ6Kmejfl5iFW9asYH8c7GH3/5FD7adgvhYs
         n+fw==
X-Forwarded-Encrypted: i=1; AJvYcCVnmjaDMBSo75EFQtWexwdmc6pmatBVkpVyxxjo6AyamtR+9GQg8YxhKF2+XjqxZ7oYSKSOXYXHJbTxYYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAB5JIyzR8uPto7kGqvaI4XbJBw2nCJRFR+Xj6ffYZEPqN8TRm
	vGS+WZ613Rl6vdKIbECmtMlbnKFY4edSPvdA8JX4aGStQXa8JDJlcWuwHgsylWBe+JaZWwCFzpM
	+Dc7X3mCNdi5JvXZRvQ==
X-Google-Smtp-Source: AGHT+IF+d7RfP/ZP+d0RH+2C4jxBJYb7RFxnHxr6hbdVcvtywF0LG/RUuq9qPbsJbyfD3D8+ArbnNG5K58zjKzc=
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:453:8b14:6e00])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cb:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-4538ee71251mr22677255e9.28.1751017128314;
 Fri, 27 Jun 2025 02:38:48 -0700 (PDT)
Date: Fri, 27 Jun 2025 09:38:42 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKFmXmgC/2WNwQ6CMBAFf4Xs2ZptUyB48j8MB9qupREptoIS0
 n+3Em8eZ5I3b4NIwVGEU7FBoMVF58cM4lCA7rvREnMmMwgUJUps2MuH22OmmZihoVuZRFKoTa0
 rg5BXU6Cre+/FS5u5d/Hpw7ofLPxrfy3O/1oLZ5yJSjVS1IpjKc/WezvQUfs7tCmlD2QSZn2vA AAA
X-Change-Id: 20250409-workqueue-delay-40eb0cd7c6d0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=17282; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qdTiVE0dVTlQ7ENA+SM+8VVDLZVJzc23hKXd1dE6z1c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoXmaleOM9m8U13GY+Ks7O0plAMCuOfKCq0vNYZ
 ybQDY20J9OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaF5mpQAKCRAEWL7uWMY5
 Rj9GD/9QPxpQT7Idp65e8Xq2RktOfdW05wswsoMXUq2ZWV1P00V8HjWQA54ZZ+TXlTDZhCtp2Cp
 OEgadtIew7kCvjPdfLZmSHDG4Fj17zIl1xnAapK/Ug0RwshCXeZ1SOSyzpcuOKCAf3AlwULNUzm
 wUHkwXKbIqfwtnz87cn3dJ8eKBiLiQIoiUxy2cyTPIZogi/Rgmca4ZEatPdvt7DkfWQ9Is+Hbhf
 QQVROS/90OfRVNb6lo9Frc/9qLrj/iLQxXRKxDO/jV3rLKCs5Sfe05GYDPGF3Jqr0BcWlwRQmZT
 o2MBA8hvMjFh1LMSr6+ugJcfu3NEZJyL4K8FwTF5EgyqvfieD1HbxIII5tr6kqXZvi5pJpkEyeb
 Jsv8raiPsztpPKXB4ATgkShIAlcAeceDp1aubcibCedDzuDrQ5aObHBFI/NNfJJ7lB2b825OS7E
 DVQ9cwtUThyf72HCPO1OEtgnLY5yanmBVSDU0s8AqD5xU/+b2WJjdhAhkNXNTfLDYhQZvMNxO/t
 k58nJdvg6rJeCMCd7Az3IPxhvhZ2MIxl/PRvz+iYXjYC43UjG6EP7DP8h8o4JkXZOAv0kf5650b
 hRo/jjdBHrMwRFzdunOz0gtohWqz26OZRUN/EgBciyG1dIMK7bp+VUyrJDRXebud+C+HicfazkE Bnx5qS+OipI6G1Q==
X-Mailer: b4 0.14.2
Message-ID: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>
Subject: [PATCH v2] workqueue: rust: add delayed work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch is being sent for use in the various Rust GPU drivers that
are under development. It provides the additional feature of work items
that are executed after a delay.

The design of the existing workqueue is rather extensible, as most of
the logic is reused for delayed work items even though a different work
item type is required. The new logic consists of:

* A new DelayedWork struct that wraps struct delayed_work.
* A new impl_has_delayed_work! macro that provides adjusted versions of
  the container_of logic, that is suitable with delayed work items.
* A `enqueue_delayed` method that can enqueue a delayed work item.

This patch does *not* rely on the fact that `struct delayed_work`
contains `struct work_struct` at offset zero. It will continue to work
even if the layout is changed to hold the `work` field at a different
offset.

Please see the example introduced at the top of the file for example
usage of delayed work items.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebase on v6.16-rc2.
- There are no longer any dependencies as they were merged into
  v6-16-rc1.
- Fix some compilation errors related to changes to container_of! and
  lock class keys.
- Link to v1: https://lore.kernel.org/r/20250411-workqueue-delay-v1-1-26b9427b1054@google.com
---
 rust/kernel/workqueue.rs | 330 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 327 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index d092112d843f3225ea582e013581b39e36652a84..3a7ab7d078fc2091ad556bfde997b9f73f618773 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -131,10 +131,69 @@
 //! # print_2_later(MyStruct::new(41, 42).unwrap());
 //! ```
 //!
+//! This example shows how you can schedule delayed work items:
+//!
+//! ```
+//! use kernel::sync::Arc;
+//! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem};
+//!
+//! #[pin_data]
+//! struct MyStruct {
+//!     value: i32,
+//!     #[pin]
+//!     work: DelayedWork<MyStruct>,
+//! }
+//!
+//! impl_has_delayed_work! {
+//!     impl HasDelayedWork<Self> for MyStruct { self.work }
+//! }
+//!
+//! impl MyStruct {
+//!     fn new(value: i32) -> Result<Arc<Self>> {
+//!         Arc::pin_init(
+//!             pin_init!(MyStruct {
+//!                 value,
+//!                 work <- new_delayed_work!("MyStruct::work"),
+//!             }),
+//!             GFP_KERNEL,
+//!         )
+//!     }
+//! }
+//!
+//! impl WorkItem for MyStruct {
+//!     type Pointer = Arc<MyStruct>;
+//!
+//!     fn run(this: Arc<MyStruct>) {
+//!         pr_info!("The value is: {}\n", this.value);
+//!     }
+//! }
+//!
+//! /// This method will enqueue the struct for execution on the system workqueue, where its value
+//! /// will be printed 42 jiffies later.
+//! fn print_later(val: Arc<MyStruct>) {
+//!     let _ = workqueue::system().enqueue_delayed(val, 42);
+//! }
+//!
+//! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
+//! /// is equivalent to calling `enqueue_delayed` with a delay of zero.
+//! fn print_now(val: Arc<MyStruct>) {
+//!     let _ = workqueue::system().enqueue(val);
+//! }
+//! # print_later(MyStruct::new(42).unwrap());
+//! # print_now(MyStruct::new(42).unwrap());
+//! ```
+//!
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
-use crate::alloc::{AllocError, Flags};
-use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use crate::{
+    alloc::{AllocError, Flags},
+    container_of,
+    prelude::*,
+    sync::Arc,
+    sync::LockClassKey,
+    time::Jiffies,
+    types::Opaque,
+};
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
@@ -146,6 +205,33 @@ macro_rules! new_work {
 }
 pub use new_work;
 
+/// Creates a [`DelayedWork`] initialiser with the given name and a newly-created lock class.
+#[macro_export]
+macro_rules! new_delayed_work {
+    () => {
+        $crate::workqueue::DelayedWork::new(
+            $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!())),
+            $crate::static_lock_class!(),
+            $crate::c_str!(::core::concat!(
+                ::core::file!(),
+                ":",
+                ::core::line!(),
+                "_timer"
+            )),
+            $crate::static_lock_class!(),
+        )
+    };
+    ($name:literal) => {
+        $crate::workqueue::DelayedWork::new(
+            $crate::c_str!($name),
+            $crate::static_lock_class!(),
+            $crate::c_str!(::core::concat!($name, "_timer")),
+            $crate::static_lock_class!(),
+        )
+    };
+}
+pub use new_delayed_work;
+
 /// A kernel work queue.
 ///
 /// Wraps the kernel's C `struct workqueue_struct`.
@@ -206,6 +292,42 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
         }
     }
 
+    /// Enqueues a delayed work item.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    where
+        W: RawDelayedWorkItem<ID> + Send + 'static,
+    {
+        let queue_ptr = self.0.get();
+
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
+        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        //
+        // The call to `bindings::queue_delayed_work_on` will dereference the provided raw pointer,
+        // which is ok because `__enqueue` guarantees that the pointer is valid for the duration of
+        // this closure, and the safety requirements of `RawDelayedWorkItem` expands this
+        // requirement to apply to the entire `delayed_work`.
+        //
+        // Furthermore, if the C workqueue code accesses the pointer after this call to
+        // `__enqueue`, then the work item was successfully enqueued, and
+        // `bindings::queue_delayed_work_on` will have returned true. In this case, `__enqueue`
+        // promises that the raw pointer will stay valid until we call the function pointer in the
+        // `work_struct`, so the access is ok.
+        unsafe {
+            w.__enqueue(move |work_ptr| {
+                bindings::queue_delayed_work_on(
+                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
+                    queue_ptr,
+                    container_of!(work_ptr, bindings::delayed_work, work),
+                    delay,
+                )
+            })
+        }
+    }
+
     /// Tries to spawn the given function or closure as a work item.
     ///
     /// This method can fail because it allocates memory to store the work item.
@@ -298,6 +420,16 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
         F: FnOnce(*mut bindings::work_struct) -> bool;
 }
 
+/// A raw delayed work item.
+///
+/// # Safety
+///
+/// If the `__enqueue` method in the `RawWorkItem` implementation calls the closure, then the
+/// provided pointer must point at the `work` field of a valid `delayed_work`, and the guarantees
+/// that `__enqueue` provides about accessing the `work_struct` must also apply to the rest of the
+/// `delayed_work` struct.
+pub unsafe trait RawDelayedWorkItem<const ID: u64>: RawWorkItem<ID> {}
+
 /// Defines the method that should be called directly when a work item is executed.
 ///
 /// This trait is implemented by `Pin<KBox<T>>` and [`Arc<T>`], and is mainly intended to be
@@ -407,7 +539,7 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
     }
 }
 
-/// Declares that a type has a [`Work<T, ID>`] field.
+/// Declares that a type contains a [`Work<T, ID>`].
 ///
 /// The intended way of using this trait is via the [`impl_has_work!`] macro. You can use the macro
 /// like this:
@@ -506,6 +638,178 @@ unsafe fn work_container_of(
     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
 }
 
+/// Links for a delayed work item.
+///
+/// This struct contains a function pointer to the [`run`] function from the [`WorkItemPointer`]
+/// trait, and defines the linked list pointers necessary to enqueue a work item in a workqueue in
+/// a delayed manner.
+///
+/// Wraps the kernel's C `struct delayed_work`.
+///
+/// This is a helper type used to associate a `delayed_work` with the [`WorkItem`] that uses it.
+///
+/// [`run`]: WorkItemPointer::run
+#[pin_data]
+#[repr(transparent)]
+pub struct DelayedWork<T: ?Sized, const ID: u64 = 0> {
+    #[pin]
+    dwork: Opaque<bindings::delayed_work>,
+    _inner: PhantomData<T>,
+}
+
+// SAFETY: Kernel work items are usable from any thread.
+//
+// We do not need to constrain `T` since the work item does not actually contain a `T`.
+unsafe impl<T: ?Sized, const ID: u64> Send for DelayedWork<T, ID> {}
+// SAFETY: Kernel work items are usable from any thread.
+//
+// We do not need to constrain `T` since the work item does not actually contain a `T`.
+unsafe impl<T: ?Sized, const ID: u64> Sync for DelayedWork<T, ID> {}
+
+impl<T: ?Sized, const ID: u64> DelayedWork<T, ID> {
+    /// Creates a new instance of [`DelayedWork`].
+    #[inline]
+    pub fn new(
+        work_name: &'static CStr,
+        work_key: Pin<&'static LockClassKey>,
+        timer_name: &'static CStr,
+        timer_key: Pin<&'static LockClassKey>,
+    ) -> impl PinInit<Self>
+    where
+        T: WorkItem<ID>,
+    {
+        pin_init!(Self {
+            dwork <- Opaque::ffi_init(|slot: *mut bindings::delayed_work| {
+                // SAFETY: The `WorkItemPointer` implementation promises that `run` can be used as
+                // the work item function.
+                unsafe {
+                    bindings::init_work_with_key(
+                        core::ptr::addr_of_mut!((*slot).work),
+                        Some(T::Pointer::run),
+                        false,
+                        work_name.as_char_ptr(),
+                        work_key.as_ptr(),
+                    )
+                }
+
+                // SAFETY: The `delayed_work_timer_fn` function pointer can be used here because
+                // the timer is embedded in a `struct delayed_work`, and only ever scheduled via
+                // the core workqueue code, and configured to run in irqsafe context.
+                unsafe {
+                    bindings::timer_init_key(
+                        core::ptr::addr_of_mut!((*slot).timer),
+                        Some(bindings::delayed_work_timer_fn),
+                        bindings::TIMER_IRQSAFE,
+                        timer_name.as_char_ptr(),
+                        timer_key.as_ptr(),
+                    )
+                }
+            }),
+            _inner: PhantomData,
+        })
+    }
+
+    /// Get a pointer to the inner `delayed_work`.
+    ///
+    /// # Safety
+    ///
+    /// The provided pointer must not be dangling and must be properly aligned. (But the memory
+    /// need not be initialized.)
+    #[inline]
+    pub unsafe fn raw_as_work(ptr: *const Self) -> *mut Work<T, ID> {
+        // SAFETY: The caller promises that the pointer is aligned and not dangling.
+        let dw: *mut bindings::delayed_work =
+            unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).dwork)) };
+        // SAFETY: The caller promises that the pointer is aligned and not dangling.
+        let wrk: *mut bindings::work_struct = unsafe { core::ptr::addr_of_mut!((*dw).work) };
+        // CAST: Work and work_struct have compatible layouts.
+        wrk.cast()
+    }
+}
+
+/// Declares that a type contains a [`DelayedWork<T, ID>`].
+///
+/// # Safety
+///
+/// The `HasWork<T, ID>` implementation must return a `work_struct` that is stored in the `work`
+/// field of a `delayed_work` with the same access rules as the `work_struct`.
+pub unsafe trait HasDelayedWork<T, const ID: u64 = 0>: HasWork<T, ID> {}
+
+/// Used to safely implement the [`HasDelayedWork<T, ID>`] trait.
+///
+/// This macro also implements the [`HasWork`] trait, so you do not need to use [`impl_has_work!`]
+/// when using this macro.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::Arc;
+/// use kernel::workqueue::{self, impl_has_delayed_work, DelayedWork};
+///
+/// struct MyStruct<'a, T, const N: usize> {
+///     work_field: DelayedWork<MyStruct<'a, T, N>, 17>,
+///     f: fn(&'a [T; N]),
+/// }
+///
+/// impl_has_delayed_work! {
+///     impl{'a, T, const N: usize} HasDelayedWork<MyStruct<'a, T, N>, 17>
+///     for MyStruct<'a, T, N> { self.work_field }
+/// }
+/// ```
+#[macro_export]
+macro_rules! impl_has_delayed_work {
+    ($(impl$({$($generics:tt)*})?
+       HasDelayedWork<$work_type:ty $(, $id:tt)?>
+       for $self:ty
+       { self.$field:ident }
+    )*) => {$(
+        // SAFETY: The implementation of `raw_get_work` only compiles if the field has the right
+        // type.
+        unsafe impl$(<$($generics)+>)?
+            $crate::workqueue::HasDelayedWork<$work_type $(, $id)?> for $self {}
+
+        // SAFETY: The implementation of `raw_get_work` only compiles if the field has the right
+        // type.
+        unsafe impl$(<$($generics)+>)? $crate::workqueue::HasWork<$work_type $(, $id)?> for $self {
+            #[inline]
+            unsafe fn raw_get_work(
+                ptr: *mut Self
+            ) -> *mut $crate::workqueue::Work<$work_type $(, $id)?> {
+                // SAFETY: The caller promises that the pointer is not dangling.
+                let ptr: *mut $crate::workqueue::DelayedWork<$work_type $(, $id)?> = unsafe {
+                    ::core::ptr::addr_of_mut!((*ptr).$field)
+                };
+
+                // SAFETY: The caller promises that the pointer is not dangling.
+                unsafe { $crate::workqueue::DelayedWork::raw_as_work(ptr) }
+            }
+
+            #[inline]
+            unsafe fn work_container_of(
+                ptr: *mut $crate::workqueue::Work<$work_type $(, $id)?>,
+            ) -> *mut Self {
+                // SAFETY: The caller promises that the pointer points at a field of the right type
+                // in the right kind of struct.
+                let ptr = unsafe { $crate::workqueue::Work::raw_get(ptr) };
+
+                // SAFETY: The caller promises that the pointer points at a field of the right type
+                // in the right kind of struct.
+                let delayed_work = unsafe {
+                    $crate::container_of!(ptr, $crate::bindings::delayed_work, work)
+                };
+
+                let delayed_work: *mut $crate::workqueue::DelayedWork<$work_type $(, $id)?> =
+                    delayed_work.cast();
+
+                // SAFETY: The caller promises that the pointer points at a field of the right type
+                // in the right kind of struct.
+                unsafe { $crate::container_of!(delayed_work, Self, $field) }
+            }
+        }
+    )*};
+}
+pub use impl_has_delayed_work;
+
 // SAFETY: The `__enqueue` implementation in RawWorkItem uses a `work_struct` initialized with the
 // `run` method of this trait as the function pointer because:
 //   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
@@ -567,6 +871,16 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
+// `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
+// the `delayed_work` has the same access rules as its `work` field.
+unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasDelayedWork<T, ID>,
+{
+}
+
 // SAFETY: TODO.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
@@ -617,6 +931,16 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
+// `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
+// the `delayed_work` has the same access rules as its `work` field.
+unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasDelayedWork<T, ID>,
+{
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250409-workqueue-delay-40eb0cd7c6d0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

