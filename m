Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329F1DFF8;
	Sat,  8 Feb 2025 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738975171; cv=none; b=s9R6H58/jWTxt15d39uyp9Yq/9S7xxsrwtjgCZtJlWL+k8ODYtFZJVuL8p8ZpxtKDa/UVMHYo8S2CBitPoEvlJ3G3td1xihliWPDmCigXENi75Og7oSX5F1K/kXnXi3SlazWOdFs+RLp6CfNTdvEATuOQMZso6MqGCWHvYRFY2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738975171; c=relaxed/simple;
	bh=C/vVu3COiTt/m6HlxA78pvaH2S7qifvRX8blF9tfFno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jItEJml2f5sqkRIX1u7U87yCSFNDmVzQBLKfHMnUC7MN9Uh0a9KTinpmnMHcKpd8Gcs4kgLLy1bZaOkS7gtxo8oyBoPUlJhrWD8Qa0WVsUKeac1IUp0vKxXkT04Yzz+hpHRpE56JfQW5zz0FuGsr6ptQn//Z9MgjK6fOatauNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUQS92lX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUQS92lX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f5268cf50so18775365ad.1;
        Fri, 07 Feb 2025 16:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738975169; x=1739579969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf8HGM7pVKpl2nnRoL5XE5HS3M8Cp6SRU7ZAEcV5HyQ=;
        b=KUQS92lX6daPXhA1XUA6vfMwRiH4o8NP7DfbNaYwMa3HTt5DlDyXtcpN4/bdizpoGK
         qedzoocyiJGn7npGAfXAC+/nWlSE7Xw9dLhKzZ2kSlhP7GjXim1p+Gd9hhRuw+Ej345K
         AfoI4hDlGOOKKo2WfVMJMruTLOKS8cDBBtd8mn7WTQZJ5OlQMC15P3fURxvVWhA4r+WG
         Lb1PkextJ09FPOzsvi9i5AT02MZUPJ2eNfk7C0JHVouF1COOqwe19YXajUlQPbHfwNCN
         rGCjfzbB7Gn6PokvLPGjnRND8ZV2sF7EWcXl9095q6jl9qz5HTTuT8gcXI1MVb4f3y7i
         mmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738975169; x=1739579969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hf8HGM7pVKpl2nnRoL5XE5HS3M8Cp6SRU7ZAEcV5HyQ=;
        b=lboOFx+mF9m5ouMimbvouKd0KpwONkHoIVTO3ZBuB+ukrDJRkaVS/2m05rczR/ABE4
         G9V5F1OZR2W+elKvXjCFxoHltUvuXDvyVthBDg+lgNEzdOQLqVSDYJmPMHeliqswUpoh
         FYW/+MhdZx4ZYabPP1hdhEgRKax/1eyvfp7xTZ25B8FGjR8q2XAe/55qiSohYthVKqG3
         G6juvrLTWzNmAJW9lHvkdtiX6Bg8OKEkvzDvRh22aMBqxzquObh9tXtuuLCCqfdA24qO
         +LZwNYkx6EukYnIuuWn96D6th1XKQCVpMh/2nuh5Edtwo6IRQeJE6y+Bs94+5umHqxP9
         UOqg==
X-Forwarded-Encrypted: i=1; AJvYcCUP5823qhMOVHAuOqLXO9j9FxGbFkKmmlzcGaayfB+VLaJRGmAfGaqETY/jIbOmimNTfNMgnfcGvm43qKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJnlK78MqU0ZsnVb6O3OCkA5UeudVVX0kwowjSY88DQo9D1Yun
	JFR/T+NzyFx+ydxSbiAGXAr7FuPjLkGrN2Gl+2dOqr5F7sPgQw2UhgJWbs+Q
X-Gm-Gg: ASbGncvyXVNO9xfrqLpWtQ/Hr0NqDsjRZx6OAk0uNcLkPsTdRlj+1cu01i3bVaShL4n
	Fxb8Vbps7sPKhQ6DL7Boatseks/2jOI1qbj1g3LZCJp/n69R9kdfmXWRygqyV35gVmgizlyKoEG
	B1uHigMMVG5ruL7TQyh9BVQ1j8ZoTB0OZYeDLdVUA6MaehbMecEnsZxvl1Y55KNOlYu/ijsFohB
	rpR6zPa04m6SLm6hQgEu1z0BXzqOnIMgVMxY4g6aZt+UjZxPa1iDA/EhqhDU3FzhmIoyEqHPlRW
	ulSdSCnJBhpyOOupaQQrZg==
X-Google-Smtp-Source: AGHT+IET/NzLvtv0Qv5IRQUZdTdzTjud6WnfKDAifHvHieYJFgu0QBh8DTLDq9kOMjEVk+Lqtdd45Q==
X-Received: by 2002:a17:902:d548:b0:21f:4b01:b985 with SMTP id d9443c01a7336-21f4e770bcemr81436555ad.45.1738975169039;
        Fri, 07 Feb 2025 16:39:29 -0800 (PST)
Received: from mitchelllevy. ([131.107.8.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36511106sm36521545ad.5.2025.02.07.16.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:39:28 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 07 Feb 2025 16:39:09 -0800
Subject: [PATCH v4 2/2] rust: lockdep: Use Pin for all LockClassKey usages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-rust-lockdep-v4-2-7a50a7e88656@gmail.com>
References: <20250207-rust-lockdep-v4-0-7a50a7e88656@gmail.com>
In-Reply-To: <20250207-rust-lockdep-v4-0-7a50a7e88656@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738975167; l=9520;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=C/vVu3COiTt/m6HlxA78pvaH2S7qifvRX8blF9tfFno=;
 b=xzrQqMWAIQDPE9yz3Y8cvyX2gtBEazt7etpjmq66D6zJNQUPC2/fcj+ypq49W9CmtpGSLkzgU
 4XdiAC9JldlD1SmWC+CWFZZXbpZRxLUPkT/R7V3/zkZSthPkJeBkNeU
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Reintroduce dynamically-allocated LockClassKeys such that they are
automatically (de)registered. Require that all usages of LockClassKeys
ensure that they are Pin'd.

Currently, only `'static` LockClassKeys are supported, so Pin is
redundant. However, it is intended that dynamically-allocated
LockClassKeys will eventually be supported, so using Pin from the outset
will make that change simpler.

Closes: https://github.com/Rust-for-Linux/linux/issues/1102
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c          |  1 +
 rust/helpers/sync.c             | 13 ++++++++++
 rust/kernel/sync.rs             | 57 ++++++++++++++++++++++++++++++++++++++---
 rust/kernel/sync/condvar.rs     |  5 ++--
 rust/kernel/sync/lock.rs        |  9 +++----
 rust/kernel/sync/lock/global.rs |  5 ++--
 rust/kernel/sync/poll.rs        |  2 +-
 rust/kernel/workqueue.rs        |  2 +-
 8 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..4c1a10a419cf 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -30,6 +30,7 @@
 #include "signal.c"
 #include "slab.c"
 #include "spinlock.c"
+#include "sync.c"
 #include "task.c"
 #include "uaccess.c"
 #include "vmalloc.c"
diff --git a/rust/helpers/sync.c b/rust/helpers/sync.c
new file mode 100644
index 000000000000..ff7e68b48810
--- /dev/null
+++ b/rust/helpers/sync.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/lockdep.h>
+
+void rust_helper_lockdep_register_key(struct lock_class_key *k)
+{
+	lockdep_register_key(k);
+}
+
+void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
+{
+	lockdep_unregister_key(k);
+}
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 16eab9138b2b..4104bc26471a 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -5,6 +5,8 @@
 //! This module contains the kernel APIs related to synchronisation that have been ported or
 //! wrapped for usage by Rust code in the kernel.
 
+use crate::pin_init;
+use crate::prelude::*;
 use crate::types::Opaque;
 
 mod arc;
@@ -23,15 +25,64 @@
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
-pub struct LockClassKey(Opaque<bindings::lock_class_key>);
+#[pin_data(PinnedDrop)]
+pub struct LockClassKey {
+    #[pin]
+    inner: Opaque<bindings::lock_class_key>,
+}
 
 // SAFETY: `bindings::lock_class_key` is designed to be used concurrently from multiple threads and
 // provides its own synchronization.
 unsafe impl Sync for LockClassKey {}
 
 impl LockClassKey {
+    /// Initializes a dynamically allocated lock class key. In the common case of using a
+    /// statically allocated lock class key, the static_lock_class! macro should be used instead.
+    ///
+    /// # Example
+    /// ```
+    /// # use kernel::{c_str, stack_pin_init};
+    /// # use kernel::alloc::KBox;
+    /// # use kernel::types::ForeignOwnable;
+    /// # use kernel::sync::{LockClassKey, SpinLock};
+    ///
+    /// let key = KBox::pin_init(LockClassKey::new_dynamic(), GFP_KERNEL)?;
+    /// let key_ptr = key.into_foreign();
+    ///
+    /// {
+    ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
+    ///         0,
+    ///         c_str!("my_spinlock"),
+    ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
+    ///         // `from_foreign()` has not yet been called.
+    ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
+    ///     ));
+    /// }
+    ///
+    /// // SAFETY: We dropped `num`, the only use of the key, so the result of the previous
+    /// // `borrow` has also been dropped. Thus, it's safe to use from_foreign.
+    /// unsafe { drop(<Pin<KBox<LockClassKey>> as ForeignOwnable>::from_foreign(key_ptr)) };
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn new_dynamic() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: lockdep_register_key expects an uninitialized block of memory
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::lockdep_register_key(slot) })
+        })
+    }
+
     pub(crate) fn as_ptr(&self) -> *mut bindings::lock_class_key {
-        self.0.get()
+        self.inner.get()
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for LockClassKey {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: self.as_ptr was registered with lockdep and self is pinned, so the address
+        // hasn't changed. Thus, it's safe to pass to unregister.
+        unsafe { bindings::lockdep_unregister_key(self.as_ptr()) }
     }
 }
 
@@ -44,7 +95,7 @@ macro_rules! static_lock_class {
             // SAFETY: lockdep expects uninitialized memory when it's handed a statically allocated
             // lock_class_key
             unsafe { ::core::mem::MaybeUninit::uninit().assume_init() };
-        &CLASS
+        $crate::prelude::Pin::static_ref(&CLASS)
     }};
 }
 
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7df565038d7d..29289ccf55cc 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -15,8 +15,7 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::marker::PhantomPinned;
-use core::ptr;
+use core::{marker::PhantomPinned, pin::Pin, ptr};
 use macros::pin_data;
 
 /// Creates a [`CondVar`] initialiser with the given name and a newly-created lock class.
@@ -101,7 +100,7 @@ unsafe impl Sync for CondVar {}
 
 impl CondVar {
     /// Constructs a new condvar initialiser.
-    pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self> {
+    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
         pin_init!(Self {
             _pin: PhantomPinned,
             // SAFETY: `slot` is valid while the closure is called and both `name` and `key` have
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..6dafe338bbc7 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,12 +7,9 @@
 
 use super::LockClassKey;
 use crate::{
-    init::PinInit,
-    pin_init,
-    str::CStr,
-    types::{NotThreadSafe, Opaque, ScopeGuard},
+    init::PinInit, pin_init, str::CStr, types::NotThreadSafe, types::Opaque, types::ScopeGuard,
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned};
+use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
 use macros::pin_data;
 
 pub mod mutex;
@@ -129,7 +126,7 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self> {
+    pub fn new(t: T, name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
         pin_init!(Self {
             data: UnsafeCell::new(t),
             _pin: PhantomPinned,
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 480ee724e3cc..d65f94b5caf2 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -13,6 +13,7 @@
 use core::{
     cell::UnsafeCell,
     marker::{PhantomData, PhantomPinned},
+    pin::Pin,
 };
 
 /// Trait implemented for marker types for global locks.
@@ -26,7 +27,7 @@ pub trait GlobalLockBackend {
     /// The backend used for this global lock.
     type Backend: Backend + 'static;
     /// The class for this global lock.
-    fn get_lock_class() -> &'static LockClassKey;
+    fn get_lock_class() -> Pin<&'static LockClassKey>;
 }
 
 /// Type used for global locks.
@@ -270,7 +271,7 @@ impl $crate::sync::lock::GlobalLockBackend for $name {
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
 
-            fn get_lock_class() -> &'static $crate::sync::LockClassKey {
+            fn get_lock_class() -> Pin<&'static $crate::sync::LockClassKey> {
                 $crate::static_lock_class!()
             }
         }
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d5f17153b424..c4934f82d68b 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -89,7 +89,7 @@ pub struct PollCondVar {
 
 impl PollCondVar {
     /// Constructs a new condvar initialiser.
-    pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self> {
+    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
         pin_init!(Self {
             inner <- CondVar::new(name, key),
         })
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 0cd100d2aefb..6b6f3ad08951 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -369,7 +369,7 @@ unsafe impl<T: ?Sized, const ID: u64> Sync for Work<T, ID> {}
 impl<T: ?Sized, const ID: u64> Work<T, ID> {
     /// Creates a new instance of [`Work`].
     #[inline]
-    pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self>
+    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self>
     where
         T: WorkItem<ID>,
     {

-- 
2.34.1

