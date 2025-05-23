Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA51202F9A;
	Fri, 23 May 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011908; cv=none; b=N3CBt1y7EF9UKcPCH9fQMry2H9e0Hww6V4pbk/3lLII/OHksAx6aZS8SaJ8hIhqNsPpJxZfDV/hdIRtPXkFYR2dUw1YFA/r532eVsiVL91eBzVrLhPXNhrBbH/q/VX4fRuxGxPLzZiJIiJbhFO8rFIFt9SKltKPQlpWuXclNDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011908; c=relaxed/simple;
	bh=3F/Ru6iZFtxoR2nxk9M2x+Wi4Ywb1kdABQiMVfx5a58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EP90XKisax5LG4LM03htgyPDjakNE+Ov8zwQb4Is4V9sLiEjjoRxwjmQq6ss4REpxE4Iymw7PAU0jqBNlTc3Y1eOr7X2YjlW9R+DhnGaxeYbUfXla189LHxOCYm0BZNVUfw3YFGOjz8Gh7J5L4XQZ96cf2MpN6b5erT4AGKaGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rp01RBIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp01RBIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3301C4CEE9;
	Fri, 23 May 2025 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011907;
	bh=3F/Ru6iZFtxoR2nxk9M2x+Wi4Ywb1kdABQiMVfx5a58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rp01RBIR0DdmD30Z+I8XRY0vuMZmR1YJ67TJmigj2wvqgPhpyG1hC9hXi/VSwdCzS
	 MQJ2McjbJ8ERBwZb46FA84NqIXJjyBVgNoxT/GextvqDowMeN09a1WbILlVePN+n11
	 pK2gHhTAOOEItzFV3nPCEcgtQ6GNUo+adJfmeMsS10ZkQehv7UK0hVvELHyUvdQgh8
	 eUMf1cYWLfG/ZSBLXlWQ2ej1/vuio7XVfEiswdHCF93wfRs0Oh48hF1jg8oFmHjMC1
	 EwfQd8A6LTGe9RccpAcubLkJRRwbhMJLivWGyWaQ+aAYbv+962gtPrl+XsehgRaFMw
	 khsfbR55ZKKqw==
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
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>,
	Michael Vetter <jubalh@iodoru.org>
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] rust: pin-init: rename `zeroed` to `init_zeroed`
Date: Fri, 23 May 2025 16:50:57 +0200
Message-ID: <20250523145125.523275-2-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>
References: <20250523145125.523275-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name `zeroed` is a much better fit for a function that returns the
type by-value.

Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/7dbe38682c9725405bab91dcabe9c4d8893d2f5e
[ also rename uses in `rust/kernel/init.rs` - Benno]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/init.rs                           |  8 +++---
 rust/pin-init/README.md                       |  2 +-
 rust/pin-init/examples/big_struct_in_place.rs |  4 +--
 rust/pin-init/src/lib.rs                      | 28 +++++++++----------
 rust/pin-init/src/macros.rs                   | 16 +++++------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 8d228c237954..15a1c5e397d8 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -206,7 +206,7 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
 ///
 /// ```rust
 /// use kernel::error::Error;
-/// use pin_init::zeroed;
+/// use pin_init::init_zeroed;
 /// struct BigBuf {
 ///     big: KBox<[u8; 1024 * 1024 * 1024]>,
 ///     small: [u8; 1024 * 1024],
@@ -215,7 +215,7 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
 /// impl BigBuf {
 ///     fn new() -> impl Init<Self, Error> {
 ///         try_init!(Self {
-///             big: KBox::init(zeroed(), GFP_KERNEL)?,
+///             big: KBox::init(init_zeroed(), GFP_KERNEL)?,
 ///             small: [0; 1024 * 1024],
 ///         }? Error)
 ///     }
@@ -264,7 +264,7 @@ macro_rules! try_init {
 /// ```rust
 /// # #![feature(new_uninit)]
 /// use kernel::error::Error;
-/// use pin_init::zeroed;
+/// use pin_init::init_zeroed;
 /// #[pin_data]
 /// struct BigBuf {
 ///     big: KBox<[u8; 1024 * 1024 * 1024]>,
@@ -275,7 +275,7 @@ macro_rules! try_init {
 /// impl BigBuf {
 ///     fn new() -> impl PinInit<Self, Error> {
 ///         try_pin_init!(Self {
-///             big: KBox::init(zeroed(), GFP_KERNEL)?,
+///             big: KBox::init(init_zeroed(), GFP_KERNEL)?,
 ///             small: [0; 1024 * 1024],
 ///             ptr: core::ptr::null_mut(),
 ///         }? Error)
diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 2d0cda961d45..a4c01a8d78b2 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -125,7 +125,7 @@ impl DriverData {
     fn new() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
             status <- CMutex::new(0),
-            buffer: Box::init(pin_init::zeroed())?,
+            buffer: Box::init(pin_init::init_zeroed())?,
         }? Error)
     }
 }
diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-init/examples/big_struct_in_place.rs
index b0ee793a0a0c..c05139927486 100644
--- a/rust/pin-init/examples/big_struct_in_place.rs
+++ b/rust/pin-init/examples/big_struct_in_place.rs
@@ -21,7 +21,7 @@ pub struct ManagedBuf {
 
 impl ManagedBuf {
     pub fn new() -> impl Init<Self> {
-        init!(ManagedBuf { buf <- zeroed() })
+        init!(ManagedBuf { buf <- init_zeroed() })
     }
 }
 
@@ -30,7 +30,7 @@ fn main() {
     {
         // we want to initialize the struct in-place, otherwise we would get a stackoverflow
         let buf: Box<BigStruct> = Box::init(init!(BigStruct {
-            buf <- zeroed(),
+            buf <- init_zeroed(),
             a: 7,
             b: 186,
             c: 7789,
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 9ab34036e6bc..3bb0700355df 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -148,7 +148,7 @@
 //!     fn new() -> impl PinInit<Self, Error> {
 //!         try_pin_init!(Self {
 //!             status <- CMutex::new(0),
-//!             buffer: Box::init(pin_init::zeroed())?,
+//!             buffer: Box::init(pin_init::init_zeroed())?,
 //!         }? Error)
 //!     }
 //! }
@@ -742,7 +742,7 @@ macro_rules! stack_try_pin_init {
 /// - Fields that you want to initialize in-place have to use `<-` instead of `:`.
 /// - In front of the initializer you can write `&this in` to have access to a [`NonNull<Self>`]
 ///   pointer named `this` inside of the initializer.
-/// - Using struct update syntax one can place `..Zeroable::zeroed()` at the very end of the
+/// - Using struct update syntax one can place `..Zeroable::init_zeroed()` at the very end of the
 ///   struct, this initializes every field with 0 and then runs all initializers specified in the
 ///   body. This can only be done if [`Zeroable`] is implemented for the struct.
 ///
@@ -769,7 +769,7 @@ macro_rules! stack_try_pin_init {
 /// });
 /// let init = pin_init!(Buf {
 ///     buf: [1; 64],
-///     ..Zeroable::zeroed()
+///     ..Zeroable::init_zeroed()
 /// });
 /// ```
 ///
@@ -805,7 +805,7 @@ macro_rules! pin_init {
 /// ```rust
 /// # #![feature(allocator_api)]
 /// # #[path = "../examples/error.rs"] mod error; use error::Error;
-/// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, zeroed};
+/// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, init_zeroed};
 ///
 /// #[pin_data]
 /// struct BigBuf {
@@ -817,7 +817,7 @@ macro_rules! pin_init {
 /// impl BigBuf {
 ///     fn new() -> impl PinInit<Self, Error> {
 ///         try_pin_init!(Self {
-///             big: Box::init(zeroed())?,
+///             big: Box::init(init_zeroed())?,
 ///             small: [0; 1024 * 1024],
 ///             ptr: core::ptr::null_mut(),
 ///         }? Error)
@@ -866,7 +866,7 @@ macro_rules! try_pin_init {
 /// # #[path = "../examples/error.rs"] mod error; use error::Error;
 /// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
 /// # use pin_init::InPlaceInit;
-/// use pin_init::{init, Init, zeroed};
+/// use pin_init::{init, Init, init_zeroed};
 ///
 /// struct BigBuf {
 ///     small: [u8; 1024 * 1024],
@@ -875,7 +875,7 @@ macro_rules! try_pin_init {
 /// impl BigBuf {
 ///     fn new() -> impl Init<Self> {
 ///         init!(Self {
-///             small <- zeroed(),
+///             small <- init_zeroed(),
 ///         })
 ///     }
 /// }
@@ -913,7 +913,7 @@ macro_rules! init {
 /// # #![feature(allocator_api)]
 /// # use core::alloc::AllocError;
 /// # use pin_init::InPlaceInit;
-/// use pin_init::{try_init, Init, zeroed};
+/// use pin_init::{try_init, Init, init_zeroed};
 ///
 /// struct BigBuf {
 ///     big: Box<[u8; 1024 * 1024 * 1024]>,
@@ -923,7 +923,7 @@ macro_rules! init {
 /// impl BigBuf {
 ///     fn new() -> impl Init<Self, AllocError> {
 ///         try_init!(Self {
-///             big: Box::init(zeroed())?,
+///             big: Box::init(init_zeroed())?,
 ///             small: [0; 1024 * 1024],
 ///         }? AllocError)
 ///     }
@@ -1170,7 +1170,7 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     ///
     /// ```rust
     /// # #![expect(clippy::disallowed_names)]
-    /// use pin_init::{init, zeroed, Init};
+    /// use pin_init::{init, init_zeroed, Init};
     ///
     /// struct Foo {
     ///     buf: [u8; 1_000_000],
@@ -1183,7 +1183,7 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     /// }
     ///
     /// let foo = init!(Foo {
-    ///     buf <- zeroed()
+    ///     buf <- init_zeroed()
     /// }).chain(|foo| {
     ///     foo.setup();
     ///     Ok(())
@@ -1469,7 +1469,7 @@ pub unsafe trait PinnedDrop: __internal::HasPinData {
 /// this is not UB:
 ///
 /// ```rust,ignore
-/// let val: Self = unsafe { core::mem::zeroed() };
+/// let val: Self = unsafe { core::mem::init_zeroed() };
 /// ```
 pub unsafe trait Zeroable {}
 
@@ -1484,11 +1484,11 @@ pub unsafe trait ZeroableOption {}
 // SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
 unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
 
-/// Create a new zeroed T.
+/// Create an initializer for a zeroed `T`.
 ///
 /// The returned initializer will write `0x00` to every byte of the given `slot`.
 #[inline]
-pub fn zeroed<T: Zeroable>() -> impl Init<T> {
+pub fn init_zeroed<T: Zeroable>() -> impl Init<T> {
     // SAFETY: Because `T: Zeroable`, all bytes zero is a valid bit pattern for `T`
     // and because we write all zeroes, the memory is initialized.
     unsafe {
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 935d77745d1d..9ced630737b8 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1030,7 +1030,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
 ///
 /// This macro has multiple internal call configurations, these are always the very first ident:
 /// - nothing: this is the base case and called by the `{try_}{pin_}init!` macros.
-/// - `with_update_parsed`: when the `..Zeroable::zeroed()` syntax has been handled.
+/// - `with_update_parsed`: when the `..Zeroable::init_zeroed()` syntax has been handled.
 /// - `init_slot`: recursively creates the code that initializes all fields in `slot`.
 /// - `make_initializer`: recursively create the struct initializer that guarantees that every
 ///   field has been initialized exactly once.
@@ -1059,7 +1059,7 @@ macro_rules! __init_internal {
             @data($data, $($use_data)?),
             @has_data($has_data, $get_data),
             @construct_closure($construct_closure),
-            @zeroed(), // Nothing means default behavior.
+            @init_zeroed(), // Nothing means default behavior.
         )
     };
     (
@@ -1074,7 +1074,7 @@ macro_rules! __init_internal {
         @has_data($has_data:ident, $get_data:ident),
         // `pin_init_from_closure` or `init_from_closure`.
         @construct_closure($construct_closure:ident),
-        @munch_fields(..Zeroable::zeroed()),
+        @munch_fields(..Zeroable::init_zeroed()),
     ) => {
         $crate::__init_internal!(with_update_parsed:
             @this($($this)?),
@@ -1084,7 +1084,7 @@ macro_rules! __init_internal {
             @data($data, $($use_data)?),
             @has_data($has_data, $get_data),
             @construct_closure($construct_closure),
-            @zeroed(()), // `()` means zero all fields not mentioned.
+            @init_zeroed(()), // `()` means zero all fields not mentioned.
         )
     };
     (
@@ -1124,7 +1124,7 @@ macro_rules! __init_internal {
         @has_data($has_data:ident, $get_data:ident),
         // `pin_init_from_closure` or `init_from_closure`.
         @construct_closure($construct_closure:ident),
-        @zeroed($($init_zeroed:expr)?),
+        @init_zeroed($($init_zeroed:expr)?),
     ) => {{
         // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
         // type and shadow it later when we insert the arbitrary user code. That way there will be
@@ -1196,7 +1196,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         @data($data:ident),
         @slot($slot:ident),
         @guards($($guards:ident,)*),
-        @munch_fields($(..Zeroable::zeroed())? $(,)?),
+        @munch_fields($(..Zeroable::init_zeroed())? $(,)?),
     ) => {
         // Endpoint of munching, no fields are left. If execution reaches this point, all fields
         // have been initialized. Therefore we can now dismiss the guards by forgetting them.
@@ -1300,11 +1300,11 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
     (make_initializer:
         @slot($slot:ident),
         @type_name($t:path),
-        @munch_fields(..Zeroable::zeroed() $(,)?),
+        @munch_fields(..Zeroable::init_zeroed() $(,)?),
         @acc($($acc:tt)*),
     ) => {
         // Endpoint, nothing more to munch, create the initializer. Since the users specified
-        // `..Zeroable::zeroed()`, the slot will already have been zeroed and all field that have
+        // `..Zeroable::init_zeroed()`, the slot will already have been zeroed and all field that have
         // not been overwritten are thus zero and initialized. We still check that all fields are
         // actually accessible by using the struct update syntax ourselves.
         // We are inside of a closure that is never executed and thus we can abuse `slot` to

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

