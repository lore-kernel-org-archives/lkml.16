Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD36B1E7C32
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369995; cv=none; b=KHVCdbTFTOn9pF07nln2ok5dEqOyGpnoP9rCE51yIrN1+2ngxUdXJIh6/A72DhlbCOMqxKpRntMc/JgZRLLARIPLhbY4U/f38fdc8XElx8HhR6DN2iP6RAmFE3BybOV0oMR3Joj/anSS2xteMJfltobMBMy816lgJg3FYEvBxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369995; c=relaxed/simple;
	bh=kwpUyFBVHVH3mQxD9NLWZ/XLO4s1HY+OwXvL71zm4S8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P1S7SIM46YnlAor2wFn/FGlqwhzCAh1rGXx+3MpxRfLqmpDESTFmKifdeFZm9Ukpi+YZrmICbDOGwgI3yTF/zF64Tlk9Nqz89uXCgYy19nrLYkjLv23YSuJbIxbAveaUDR3XGUOYWy8Ov8UFTRklhwhCmb/xkekfuSToTVSQDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMFbIUAI; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMFbIUAI"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912d9848a7so1515319f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744369991; x=1744974791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Lgm5mtopZUHh+OvHoZAMmyFy7ehYLsEEI4FINFuLZo=;
        b=SMFbIUAIeyf4GR5CUmsmXjA4MvFYLPbT0QkSVCNYslzXW3IZ2I4qG/Ayc9qL20gadw
         S+ZnGlcbh+SwJc7w5QTYT6DhUO5TEenz/oJ+OdvqOM0OZPjFsaGham0m/G/T/sL02DCI
         wGpztMjoBuDEXBccLyxPo1fFBMgxhHwl3UJXgBcvM//TOHBcS6yvg6x+C2mpjQi2IOVB
         8NIMSrLlgaNg1eQbIDvT8J4wowd3xY3CFqaT2M6PuxhR5KvCU9ctXYrn7mi+zM/0VRn3
         oITBzhBVg35g71bAfXYSokDxYf/K9MSLBiG78C8e14eU0o7jS+MsYanX2I+1/Xj1dI2c
         V5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369991; x=1744974791;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Lgm5mtopZUHh+OvHoZAMmyFy7ehYLsEEI4FINFuLZo=;
        b=fxGGjOvdMg/5WAZ+OmCqyJY/X+W26mzVfjSTOyqHQ/rjr9HD4GH+D15c6X6F43RUwz
         RYQf3Nd4qPgs5erDx+xLC9EpzJevQR626ocTsAlJ/md7H+csaQHWnb76oOBZg65qN0JI
         Lh6mOv/a2NBqjqFEFY0loFGGrss7PCex8xCog1yaOAG7zRcSsuO0VJwOHArRXk0PlBGu
         j3X5p3nHPznPl8FX48ca/dpddC7kMeKvL+SvvIXDReEjfUtgcLmvVgyAZ1bxuvqXRvO5
         eVlK5MQLU5Us8gfw3AJbIZERGYKfoOxOlUrQAy7ZojRxGuUHWb2ir/Hh2+x+Bkv/DUVf
         4kUA==
X-Forwarded-Encrypted: i=1; AJvYcCXg+28mi57p3c7yPuRhclLtd5Sv2oRXsmBu0dtzMbCSDNQysQXZQ/4mXxg/rJHuF0XhrY3mfuenVkEDkXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMafB47eWU/uZ8O2u2Jham6mBi9aG6o9amcVM6t75bMeLidXeY
	V3i/hu9x7JhIx4XiIGcGbrGVLuj6DSoEk1ZyAdvlwuzsolbVtHYZ0op8C5/MsNogqTDSIGAdLVY
	7Hd7fglFIMWKoPQ==
X-Google-Smtp-Source: AGHT+IEQo4gAyDD2xbDwEMYsMK8u+Qz1i4+DqmeCawqaDo8A81K37NC/brxRf02MMOwTZYuzLsnbYhVPnqZaVm4=
X-Received: from wmcn14.prod.google.com ([2002:a05:600c:c0ce:b0:43d:1dd4:37f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4021:b0:391:386d:5971 with SMTP id ffacd0b85a97d-39d8f46abe3mr5856622f8f.14.1744369991198;
 Fri, 11 Apr 2025 04:13:11 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:12:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB35+GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3fL8ouzC0tTSVN2U1JzESl0Tg9Qkg+QU82SzFAMloK6CotS0zAq widGxtbUAuCkyFGEAAAA=
X-Change-Id: 20250409-workqueue-delay-40eb0cd7c6d0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16937; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=kwpUyFBVHVH3mQxD9NLWZ/XLO4s1HY+OwXvL71zm4S8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn+Pk8kY+0PwfFYJQKNbsabsVG6nOG5H+VhYiRB
 LAChRf5mouJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/j5PAAKCRAEWL7uWMY5
 RrIqD/912mVGz5m9SzywZXfG8JL7ByP7cUyoQt84jBvqLxVFm+s+7QMSWZfd8j5maIDXfkU+qYj
 1uB+zVC99jt9Qu5Y2f0/dBummDMbIZ2H4gyax7G2gyNkWWLqqTV0ya7Ca73KSwFvLIRcxn+uVwg
 8da1vIgVioRFLiomQS5bSG3fjtuI1XhnmYDe47AbKGjsTdqPAmeq8gcASR01Nae/VNbQaVetbu2
 MzcHHOTdwpgifREpeGoKQ7NMueaHHmSuzAekcK8vBgPCbgzUJC2NaILq77vqX8g9SONRQXgANjB
 IGnGjBeKGp70juCd9O67G2ITkhG6l38D+eN5YeJhFtXNjn6FWakuzA7afmGUg0cHnRQ2VQ9foOC
 RH9KIvgzYPzJvAftb4dP+aqJIRzcygaH6Nv8tNZrK7ncjncvl6UYMe6sIwVPzQBESMRrBXz2JKc
 QprU1cCwH1f/LBOe/e137CCnHeHw9aoRUQXR2VOIVvI0eUmjqWZAdiy1lbVpwOVVq5C38YHB0x7
 bqZpG7DC1uWFw1eWPgJ5Yy9EdYg6d/Imfe+N03LaK5Urw8+zzWxk8TgEpntUAeLfvIWIIdCk1rT
 NAeTHqaBUD3kovDqCNwWIk+mGeBJiXdiy7D+J9rHUutDDQeWSNWd512uV6kKNOLv9R0cfcizQGn pMtlGvV7t5x9z0w==
X-Mailer: b4 0.14.2
Message-ID: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com>
Subject: [PATCH] workqueue: rust: add delayed work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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
This series depends on:
https://lore.kernel.org/all/20250409-no-offset-v2-0-dda8e141a909@gmail.com/
---
 rust/kernel/workqueue.rs | 327 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 324 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 1d640dbdc6ad1eb20ffffbc0fe60a093b5096ba6..c30fe0185e7a6a89943a5ba9f5b36a5bca3edb85 100644
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
@@ -501,6 +633,175 @@ unsafe fn work_container_of(
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
+                    bindings::init_timer_key(
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
@@ -562,6 +863,16 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
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
@@ -612,6 +923,16 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
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
base-commit: d63de17e2c9c73ad2b475e88935d7c044bdca409
change-id: 20250409-workqueue-delay-40eb0cd7c6d0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

