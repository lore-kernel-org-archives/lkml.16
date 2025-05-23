Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B952F3E;
	Fri, 23 May 2025 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004897; cv=none; b=BM80ORhCKVtd456tCaNFg0HyK9N31s4bc+M+xxo1xnxW+8gAZQIiO4XGt/pC99BCzennFLgW4qqfl8oQCFYi2y3KPzmWGv3bsDSRrA2Ch1jmktix+K1oKz0PY97thC+9nQDQrwyHhDeMbFOEXnlPReoxLrdNacfVTfiiSq+tme8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004897; c=relaxed/simple;
	bh=nRGcWesjQEXHVnOsVHCJ2xCltsk+4xmpqByowthqT/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2keSKr+jS8GpYT59ZPMNqZue6od7UfdCrvyrMLKDsjX2UO71Rjv2vzMlFufH4XO28f3zcwyGg5CfA0AxLF19Q5pbHcLxPkacbgI3M+gmiTTQ/3VZ9QPnhw4BZ7dujWkSa5wtGe6yd6/IfTm7vPQBh0U5vkFOtfwEhEO9I6xY6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyEYMkPz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyEYMkPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AF0C4CEE9;
	Fri, 23 May 2025 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004896;
	bh=nRGcWesjQEXHVnOsVHCJ2xCltsk+4xmpqByowthqT/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GyEYMkPzEr3ku3Ymhs2baaY8y7rw/745oNvKhBXcGaHOctiEvku/bRsCyC7v3BObE
	 MryZQ+OHqPIDu5MEy+o63dFmsRa+W2DqhCpt5NxGLWuTC4mX0Yq+VavxmWnsd5rL6h
	 dOcJHEuntiGESHIg/R6vy50TeSdI67T0r0JB2GMosYhN1b5337+P+ahc6/IngQjwtU
	 ALZ3Bb9dtpBu2yK0fRax1qG4elKMf/CcaqfVDftdEBkSaHZ8z1VMlEy4tUTMcG6j5z
	 kNMJtfrf6b6E+FKrFK8MDNxPmtnFIdozOKSNptZ4Hmy2LFh4gDDgN/tU39PHgFghNf
	 tV2BfNp4cDNXw==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>
Cc: Benno Lossin <benno.lossin@proton.me>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rust: pin-init: examples, tests: add conditional compilation in order to compile under any feature combination
Date: Fri, 23 May 2025 14:54:11 +0200
Message-ID: <20250523125424.192843-2-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523125424.192843-1-lossin@kernel.org>
References: <20250523125424.192843-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <benno.lossin@proton.me>

In the CI, all examples & tests should be run under all feature
combinations. Currently several examples & tests use `std` without
conditionally enabling it. Thus make them all compile under any feature
combination by conditionally disabling the code that uses e.g. `std`.

Link: https://github.com/Rust-for-Linux/pin-init/pull/50/commits/fdfb70efddbc711b4543c850ee38a2f5a8d17cb6
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/examples/big_struct_in_place.rs | 26 ++---
 rust/pin-init/examples/linked_list.rs         | 10 +-
 rust/pin-init/examples/mutex.rs               | 97 +++++++++++--------
 rust/pin-init/examples/pthread_mutex.rs       |  3 +
 rust/pin-init/examples/static_init.rs         | 75 +++++++-------
 5 files changed, 121 insertions(+), 90 deletions(-)

diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-init/examples/big_struct_in_place.rs
index 30d44a334ffd..b0ee793a0a0c 100644
--- a/rust/pin-init/examples/big_struct_in_place.rs
+++ b/rust/pin-init/examples/big_struct_in_place.rs
@@ -4,6 +4,7 @@
 
 // Struct with size over 1GiB
 #[derive(Debug)]
+#[allow(dead_code)]
 pub struct BigStruct {
     buf: [u8; 1024 * 1024 * 1024],
     a: u64,
@@ -25,15 +26,18 @@ pub fn new() -> impl Init<Self> {
 }
 
 fn main() {
-    // we want to initialize the struct in-place, otherwise we would get a stackoverflow
-    let buf: Box<BigStruct> = Box::init(init!(BigStruct {
-        buf <- zeroed(),
-        a: 7,
-        b: 186,
-        c: 7789,
-        d: 34,
-        managed_buf <- ManagedBuf::new(),
-    }))
-    .unwrap();
-    println!("{}", core::mem::size_of_val(&*buf));
+    #[cfg(any(feature = "std", feature = "alloc"))]
+    {
+        // we want to initialize the struct in-place, otherwise we would get a stackoverflow
+        let buf: Box<BigStruct> = Box::init(init!(BigStruct {
+            buf <- zeroed(),
+            a: 7,
+            b: 186,
+            c: 7789,
+            d: 34,
+            managed_buf <- ManagedBuf::new(),
+        }))
+        .unwrap();
+        println!("{}", core::mem::size_of_val(&*buf));
+    }
 }
diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index 0bbc7b8d83a1..f9e117c7dfe0 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -14,8 +14,9 @@
 
 use pin_init::*;
 
-#[expect(unused_attributes)]
+#[allow(unused_attributes)]
 mod error;
+#[allow(unused_imports)]
 use error::Error;
 
 #[pin_data(PinnedDrop)]
@@ -39,6 +40,7 @@ pub fn new() -> impl PinInit<Self, Infallible> {
     }
 
     #[inline]
+    #[allow(dead_code)]
     pub fn insert_next(list: &ListHead) -> impl PinInit<Self, Infallible> + '_ {
         try_pin_init!(&this in Self {
             prev: list.next.prev().replace(unsafe { Link::new_unchecked(this)}),
@@ -112,6 +114,7 @@ fn next(&self) -> &Link {
     }
 
     #[inline]
+    #[allow(dead_code)]
     fn prev(&self) -> &Link {
         unsafe { &(*self.0.get().as_ptr()).prev }
     }
@@ -137,8 +140,13 @@ fn set(&self, val: &Link) {
     }
 }
 
+#[allow(dead_code)]
+#[cfg(not(any(feature = "std", feature = "alloc")))]
+fn main() {}
+
 #[allow(dead_code)]
 #[cfg_attr(test, test)]
+#[cfg(any(feature = "std", feature = "alloc"))]
 fn main() -> Result<(), Error> {
     let a = Box::pin_init(ListHead::new())?;
     stack_pin_init!(let b = ListHead::insert_next(&a));
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index 3e3630780c96..9f295226cd64 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -12,14 +12,15 @@
     pin::Pin,
     sync::atomic::{AtomicBool, Ordering},
 };
+#[cfg(feature = "std")]
 use std::{
     sync::Arc,
-    thread::{self, park, sleep, Builder, Thread},
+    thread::{self, sleep, Builder, Thread},
     time::Duration,
 };
 
 use pin_init::*;
-#[expect(unused_attributes)]
+#[allow(unused_attributes)]
 #[path = "./linked_list.rs"]
 pub mod linked_list;
 use linked_list::*;
@@ -36,6 +37,7 @@ pub fn acquire(&self) -> SpinLockGuard<'_> {
             .compare_exchange(false, true, Ordering::Acquire, Ordering::Relaxed)
             .is_err()
         {
+            #[cfg(feature = "std")]
             while self.inner.load(Ordering::Relaxed) {
                 thread::yield_now();
             }
@@ -94,7 +96,8 @@ pub fn lock(&self) -> Pin<CMutexGuard<'_, T>> {
             // println!("wait list length: {}", self.wait_list.size());
             while self.locked.get() {
                 drop(sguard);
-                park();
+                #[cfg(feature = "std")]
+                thread::park();
                 sguard = self.spin_lock.acquire();
             }
             // This does have an effect, as the ListHead inside wait_entry implements Drop!
@@ -131,8 +134,11 @@ fn drop(&mut self) {
         let sguard = self.mtx.spin_lock.acquire();
         self.mtx.locked.set(false);
         if let Some(list_field) = self.mtx.wait_list.next() {
-            let wait_entry = list_field.as_ptr().cast::<WaitEntry>();
-            unsafe { (*wait_entry).thread.unpark() };
+            let _wait_entry = list_field.as_ptr().cast::<WaitEntry>();
+            #[cfg(feature = "std")]
+            unsafe {
+                (*_wait_entry).thread.unpark()
+            };
         }
         drop(sguard);
     }
@@ -159,52 +165,61 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 struct WaitEntry {
     #[pin]
     wait_list: ListHead,
+    #[cfg(feature = "std")]
     thread: Thread,
 }
 
 impl WaitEntry {
     #[inline]
     fn insert_new(list: &ListHead) -> impl PinInit<Self> + '_ {
-        pin_init!(Self {
-            thread: thread::current(),
-            wait_list <- ListHead::insert_prev(list),
-        })
+        #[cfg(feature = "std")]
+        {
+            pin_init!(Self {
+                thread: thread::current(),
+                wait_list <- ListHead::insert_prev(list),
+            })
+        }
+        #[cfg(not(feature = "std"))]
+        {
+            pin_init!(Self {
+                wait_list <- ListHead::insert_prev(list),
+            })
+        }
     }
 }
 
-#[cfg(not(any(feature = "std", feature = "alloc")))]
-fn main() {}
-
-#[allow(dead_code)]
 #[cfg_attr(test, test)]
-#[cfg(any(feature = "std", feature = "alloc"))]
+#[allow(dead_code)]
 fn main() {
-    let mtx: Pin<Arc<CMutex<usize>>> = Arc::pin_init(CMutex::new(0)).unwrap();
-    let mut handles = vec![];
-    let thread_count = 20;
-    let workload = if cfg!(miri) { 100 } else { 1_000 };
-    for i in 0..thread_count {
-        let mtx = mtx.clone();
-        handles.push(
-            Builder::new()
-                .name(format!("worker #{i}"))
-                .spawn(move || {
-                    for _ in 0..workload {
-                        *mtx.lock() += 1;
-                    }
-                    println!("{i} halfway");
-                    sleep(Duration::from_millis((i as u64) * 10));
-                    for _ in 0..workload {
-                        *mtx.lock() += 1;
-                    }
-                    println!("{i} finished");
-                })
-                .expect("should not fail"),
-        );
-    }
-    for h in handles {
-        h.join().expect("thread panicked");
+    #[cfg(feature = "std")]
+    {
+        let mtx: Pin<Arc<CMutex<usize>>> = Arc::pin_init(CMutex::new(0)).unwrap();
+        let mut handles = vec![];
+        let thread_count = 20;
+        let workload = if cfg!(miri) { 100 } else { 1_000 };
+        for i in 0..thread_count {
+            let mtx = mtx.clone();
+            handles.push(
+                Builder::new()
+                    .name(format!("worker #{i}"))
+                    .spawn(move || {
+                        for _ in 0..workload {
+                            *mtx.lock() += 1;
+                        }
+                        println!("{i} halfway");
+                        sleep(Duration::from_millis((i as u64) * 10));
+                        for _ in 0..workload {
+                            *mtx.lock() += 1;
+                        }
+                        println!("{i} finished");
+                    })
+                    .expect("should not fail"),
+            );
+        }
+        for h in handles {
+            h.join().expect("thread panicked");
+        }
+        println!("{:?}", &*mtx.lock());
+        assert_eq!(*mtx.lock(), workload * thread_count * 2);
     }
-    println!("{:?}", &*mtx.lock());
-    assert_eq!(*mtx.lock(), workload * thread_count * 2);
 }
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 5acc5108b954..c709dabba7eb 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -44,6 +44,7 @@ fn drop(self: Pin<&mut Self>) {
     pub enum Error {
         #[allow(dead_code)]
         IO(std::io::Error),
+        #[allow(dead_code)]
         Alloc,
     }
 
@@ -61,6 +62,7 @@ fn from(_: AllocError) -> Self {
     }
 
     impl<T> PThreadMutex<T> {
+        #[allow(dead_code)]
         pub fn new(data: T) -> impl PinInit<Self, Error> {
             fn init_raw() -> impl PinInit<UnsafeCell<libc::pthread_mutex_t>, Error> {
                 let init = |slot: *mut UnsafeCell<libc::pthread_mutex_t>| {
@@ -103,6 +105,7 @@ fn init_raw() -> impl PinInit<UnsafeCell<libc::pthread_mutex_t>, Error> {
         }? Error)
         }
 
+        #[allow(dead_code)]
         pub fn lock(&self) -> PThreadMutexGuard<'_, T> {
             // SAFETY: raw is always initialized
             unsafe { libc::pthread_mutex_lock(self.raw.get()) };
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index 48531413ab94..0e165daa9798 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -3,6 +3,7 @@
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![allow(unused_imports)]
 
 use core::{
     cell::{Cell, UnsafeCell},
@@ -12,12 +13,13 @@
     time::Duration,
 };
 use pin_init::*;
+#[cfg(feature = "std")]
 use std::{
     sync::Arc,
     thread::{sleep, Builder},
 };
 
-#[expect(unused_attributes)]
+#[allow(unused_attributes)]
 mod mutex;
 use mutex::*;
 
@@ -82,42 +84,41 @@ unsafe fn __pinned_init(
 
 pub static COUNT: StaticInit<CMutex<usize>, CountInit> = StaticInit::new(CountInit);
 
-#[cfg(not(any(feature = "std", feature = "alloc")))]
-fn main() {}
-
-#[cfg(any(feature = "std", feature = "alloc"))]
 fn main() {
-    let mtx: Pin<Arc<CMutex<usize>>> = Arc::pin_init(CMutex::new(0)).unwrap();
-    let mut handles = vec![];
-    let thread_count = 20;
-    let workload = 1_000;
-    for i in 0..thread_count {
-        let mtx = mtx.clone();
-        handles.push(
-            Builder::new()
-                .name(format!("worker #{i}"))
-                .spawn(move || {
-                    for _ in 0..workload {
-                        *COUNT.lock() += 1;
-                        std::thread::sleep(std::time::Duration::from_millis(10));
-                        *mtx.lock() += 1;
-                        std::thread::sleep(std::time::Duration::from_millis(10));
-                        *COUNT.lock() += 1;
-                    }
-                    println!("{i} halfway");
-                    sleep(Duration::from_millis((i as u64) * 10));
-                    for _ in 0..workload {
-                        std::thread::sleep(std::time::Duration::from_millis(10));
-                        *mtx.lock() += 1;
-                    }
-                    println!("{i} finished");
-                })
-                .expect("should not fail"),
-        );
-    }
-    for h in handles {
-        h.join().expect("thread panicked");
+    #[cfg(feature = "std")]
+    {
+        let mtx: Pin<Arc<CMutex<usize>>> = Arc::pin_init(CMutex::new(0)).unwrap();
+        let mut handles = vec![];
+        let thread_count = 20;
+        let workload = 1_000;
+        for i in 0..thread_count {
+            let mtx = mtx.clone();
+            handles.push(
+                Builder::new()
+                    .name(format!("worker #{i}"))
+                    .spawn(move || {
+                        for _ in 0..workload {
+                            *COUNT.lock() += 1;
+                            std::thread::sleep(std::time::Duration::from_millis(10));
+                            *mtx.lock() += 1;
+                            std::thread::sleep(std::time::Duration::from_millis(10));
+                            *COUNT.lock() += 1;
+                        }
+                        println!("{i} halfway");
+                        sleep(Duration::from_millis((i as u64) * 10));
+                        for _ in 0..workload {
+                            std::thread::sleep(std::time::Duration::from_millis(10));
+                            *mtx.lock() += 1;
+                        }
+                        println!("{i} finished");
+                    })
+                    .expect("should not fail"),
+            );
+        }
+        for h in handles {
+            h.join().expect("thread panicked");
+        }
+        println!("{:?}, {:?}", &*mtx.lock(), &*COUNT.lock());
+        assert_eq!(*mtx.lock(), workload * thread_count * 2);
     }
-    println!("{:?}, {:?}", &*mtx.lock(), &*COUNT.lock());
-    assert_eq!(*mtx.lock(), workload * thread_count * 2);
 }
-- 
2.49.0

