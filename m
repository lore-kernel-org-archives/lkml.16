Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC41DE3CA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382954; cv=none; b=XVrljQbpiaorSqgoBMMtBW9/gjVtGRVX8slLMOtQKQLiCIa4BSc5mJecfK1rZIHXwWZ6AzEwUxyKKq5/q828mgRbqsQTCHYCBb1txs0dKU8HTB+zgF3UswUvsn0L0StWaxCgGAqIxDM0MCqp4s9KXbqKWDp3K7qzneUjC4lf1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382954; c=relaxed/simple;
	bh=bad1qvyasee/qjsnPyhujssg6fQyYoyoImcyzL4OdTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPlnf7hYAGlgEVpGLsw0PSRXvFe3PUUglkBcMRMUfkh+feNfS0HrkLlAoE89nhXLUVI0+P4ASulGW12JK74b5S2/et3yNWmHmSwW8dXsy6okqjv7pgEbrCWuGcjQWxDXwaTMgOHWjAkmxd1LAkfRd/EpbvH5IsUevWuFluSj/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dugarreau.fr; spf=pass smtp.mailfrom=dugarreau.fr; dkim=pass (2048-bit key) header.d=dugarreau.fr header.i=@dugarreau.fr header.b=K8yXeP9x; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=qDeriehw; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dugarreau.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dugarreau.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dugarreau.fr header.i=@dugarreau.fr header.b="K8yXeP9x";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="qDeriehw"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=K8yXeP9x6jdT6oWnF6OzK7XTw4nmFaYvxs7pNmjGy8AwdFukD4dWiWxvZlchtjT93IyT0fqxiJRMU1kmWztj7ravDnUOhOyns/miNWFswAGUJLhc6X2uQTtD9zYkNQXjggiZrRVAk2jW68R806r+T13Jkjbbj56ZWl/J3jpXVow+l+yXIxLBl13bqeJVuAMXwleN9O83IA6e5i6MS3uZZWVo2X/vKHW1HPb4WyBPbtjUNeDbeAuzefLyH4sd7WrY/l4RhR0XhIW2qP7EQRfMgAY2JYmnGMrdm9giZ02J+7tn09dvJ9ycI1C5lEuDcdcOEz7VlptNNFExn/w2ic6Y7w==; s=purelymail3; d=dugarreau.fr; v=1; bh=bad1qvyasee/qjsnPyhujssg6fQyYoyoImcyzL4OdTo=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=qDeriehwxoC0ac1vEYbl5RejoAaprdnkd2lwMeYXEQy3V5u91EKVmhyAys28/ePLOXt4ZcO/rsSHEJcb+1y8xtni4TZzldgmUVBVxcNO7mOPTF7q+ev21+6X+2wI7c+pPJ8ia25LvzxEGAb3s5Hb4cWod6+D+8QzcxiKSEGcMi+RglpCgVuyjJwT5YTXD9W9FG76PwQjwba0agpwrUrtX1wzyl2OgpAGFgaU25t1pzpJ5RID2sbXrc22JI6RuwmX7dM0zOvFzE0G500nPqmX8NgOy5c4iB6VWbhLsdfbuaSPm6KzCOLx58d2mpb8b/xcB/igK98BJ9SIxNDL6eEzVQ==; s=purelymail3; d=purelymail.com; v=1; bh=bad1qvyasee/qjsnPyhujssg6fQyYoyoImcyzL4OdTo=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 78338:10797:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1701894474;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 27 May 2025 21:55:03 +0000 (UTC)
From: =?UTF-8?q?Beno=C3=AEt=20du=20Garreau?= <benoit@dugarreau.fr>
To: Benno Lossin <lossin@kernel.org>
Cc: =?UTF-8?q?Beno=C3=AEt=20du=20Garreau?= <benoit@dugarreau.fr>,
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
	Michael Vetter <jubalh@iodoru.org>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] rust: pin-init: rename `zeroed` to `init_zeroed`
Date: Tue, 27 May 2025 23:54:09 +0200
Message-ID: <20250527215424.26374-1-benoit@dugarreau.fr>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523145125.523275-2-lossin@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

On Fri, 23 May 2025 16:50:57 +0200 Benno Lossin <lossin@kernel.org> wrote:

> The name `zeroed` is a much better fit for a function that returns the
> type by-value.
>=20
> Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/7dbe3868=
2c9725405bab91dcabe9c4d8893d2f5e
> [ also rename uses in `rust/kernel/init.rs` - Benno]
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/kernel/init.rs                           |  8 +++---
>  rust/pin-init/README.md                       |  2 +-
>  rust/pin-init/examples/big_struct_in_place.rs |  4 +--
>  rust/pin-init/src/lib.rs                      | 28 +++++++++----------
>  rust/pin-init/src/macros.rs                   | 16 +++++------
>  5 files changed, 29 insertions(+), 29 deletions(-)
>=20
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index 8d228c237954..15a1c5e397d8 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -206,7 +206,7 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> er=
ror::Result<Self>
>  ///
>  /// ```rust
>  /// use kernel::error::Error;
> -/// use pin_init::zeroed;
> +/// use pin_init::init_zeroed;
>  /// struct BigBuf {
>  ///     big: KBox<[u8; 1024 * 1024 * 1024]>,
>  ///     small: [u8; 1024 * 1024],
> @@ -215,7 +215,7 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> er=
ror::Result<Self>
>  /// impl BigBuf {
>  ///     fn new() -> impl Init<Self, Error> {
>  ///         try_init!(Self {
> -///             big: KBox::init(zeroed(), GFP_KERNEL)?,
> +///             big: KBox::init(init_zeroed(), GFP_KERNEL)?,
>  ///             small: [0; 1024 * 1024],
>  ///         }? Error)
>  ///     }
> @@ -264,7 +264,7 @@ macro_rules! try_init {
>  /// ```rust
>  /// # #![feature(new_uninit)]
>  /// use kernel::error::Error;
> -/// use pin_init::zeroed;
> +/// use pin_init::init_zeroed;
>  /// #[pin_data]
>  /// struct BigBuf {
>  ///     big: KBox<[u8; 1024 * 1024 * 1024]>,
> @@ -275,7 +275,7 @@ macro_rules! try_init {
>  /// impl BigBuf {
>  ///     fn new() -> impl PinInit<Self, Error> {
>  ///         try_pin_init!(Self {
> -///             big: KBox::init(zeroed(), GFP_KERNEL)?,
> +///             big: KBox::init(init_zeroed(), GFP_KERNEL)?,
>  ///             small: [0; 1024 * 1024],
>  ///             ptr: core::ptr::null_mut(),
>  ///         }? Error)
> diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
> index 2d0cda961d45..a4c01a8d78b2 100644
> --- a/rust/pin-init/README.md
> +++ b/rust/pin-init/README.md
> @@ -125,7 +125,7 @@ impl DriverData {
>      fn new() -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
>              status <- CMutex::new(0),
> -            buffer: Box::init(pin_init::zeroed())?,
> +            buffer: Box::init(pin_init::init_zeroed())?,
>          }? Error)
>      }
>  }
> diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-ini=
t/examples/big_struct_in_place.rs
> index b0ee793a0a0c..c05139927486 100644
> --- a/rust/pin-init/examples/big_struct_in_place.rs
> +++ b/rust/pin-init/examples/big_struct_in_place.rs
> @@ -21,7 +21,7 @@ pub struct ManagedBuf {
> =20
>  impl ManagedBuf {
>      pub fn new() -> impl Init<Self> {
> -        init!(ManagedBuf { buf <- zeroed() })
> +        init!(ManagedBuf { buf <- init_zeroed() })
>      }
>  }
> =20
> @@ -30,7 +30,7 @@ fn main() {
>      {
>          // we want to initialize the struct in-place, otherwise we would=
 get a stackoverflow
>          let buf: Box<BigStruct> =3D Box::init(init!(BigStruct {
> -            buf <- zeroed(),
> +            buf <- init_zeroed(),
>              a: 7,
>              b: 186,
>              c: 7789,
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 9ab34036e6bc..3bb0700355df 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -148,7 +148,7 @@
>  //!     fn new() -> impl PinInit<Self, Error> {
>  //!         try_pin_init!(Self {
>  //!             status <- CMutex::new(0),
> -//!             buffer: Box::init(pin_init::zeroed())?,
> +//!             buffer: Box::init(pin_init::init_zeroed())?,
>  //!         }? Error)
>  //!     }
>  //! }
> @@ -742,7 +742,7 @@ macro_rules! stack_try_pin_init {
>  /// - Fields that you want to initialize in-place have to use `<-` inste=
ad of `:`.
>  /// - In front of the initializer you can write `&this in` to have acces=
s to a [`NonNull<Self>`]
>  ///   pointer named `this` inside of the initializer.
> -/// - Using struct update syntax one can place `..Zeroable::zeroed()` at=
 the very end of the
> +/// - Using struct update syntax one can place `..Zeroable::init_zeroed(=
)` at the very end of the
>  ///   struct, this initializes every field with 0 and then runs all init=
ializers specified in the
>  ///   body. This can only be done if [`Zeroable`] is implemented for the=
 struct.
>  ///
> @@ -769,7 +769,7 @@ macro_rules! stack_try_pin_init {
>  /// });
>  /// let init =3D pin_init!(Buf {
>  ///     buf: [1; 64],
> -///     ..Zeroable::zeroed()
> +///     ..Zeroable::init_zeroed()
>  /// });
>  /// ```
>  ///
> @@ -805,7 +805,7 @@ macro_rules! pin_init {
>  /// ```rust
>  /// # #![feature(allocator_api)]
>  /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
> -/// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, zeroed}=
;
> +/// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, init_ze=
roed};
>  ///
>  /// #[pin_data]
>  /// struct BigBuf {
> @@ -817,7 +817,7 @@ macro_rules! pin_init {
>  /// impl BigBuf {
>  ///     fn new() -> impl PinInit<Self, Error> {
>  ///         try_pin_init!(Self {
> -///             big: Box::init(zeroed())?,
> +///             big: Box::init(init_zeroed())?,
>  ///             small: [0; 1024 * 1024],
>  ///             ptr: core::ptr::null_mut(),
>  ///         }? Error)
> @@ -866,7 +866,7 @@ macro_rules! try_pin_init {
>  /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
>  /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
>  /// # use pin_init::InPlaceInit;
> -/// use pin_init::{init, Init, zeroed};
> +/// use pin_init::{init, Init, init_zeroed};
>  ///
>  /// struct BigBuf {
>  ///     small: [u8; 1024 * 1024],
> @@ -875,7 +875,7 @@ macro_rules! try_pin_init {
>  /// impl BigBuf {
>  ///     fn new() -> impl Init<Self> {
>  ///         init!(Self {
> -///             small <- zeroed(),
> +///             small <- init_zeroed(),
>  ///         })
>  ///     }
>  /// }
> @@ -913,7 +913,7 @@ macro_rules! init {
>  /// # #![feature(allocator_api)]
>  /// # use core::alloc::AllocError;
>  /// # use pin_init::InPlaceInit;
> -/// use pin_init::{try_init, Init, zeroed};
> +/// use pin_init::{try_init, Init, init_zeroed};
>  ///
>  /// struct BigBuf {
>  ///     big: Box<[u8; 1024 * 1024 * 1024]>,
> @@ -923,7 +923,7 @@ macro_rules! init {
>  /// impl BigBuf {
>  ///     fn new() -> impl Init<Self, AllocError> {
>  ///         try_init!(Self {
> -///             big: Box::init(zeroed())?,
> +///             big: Box::init(init_zeroed())?,
>  ///             small: [0; 1024 * 1024],
>  ///         }? AllocError)
>  ///     }
> @@ -1170,7 +1170,7 @@ pub unsafe trait Init<T: ?Sized, E =3D Infallible>:=
 PinInit<T, E> {
>      ///
>      /// ```rust
>      /// # #![expect(clippy::disallowed_names)]
> -    /// use pin_init::{init, zeroed, Init};
> +    /// use pin_init::{init, init_zeroed, Init};
>      ///
>      /// struct Foo {
>      ///     buf: [u8; 1_000_000],
> @@ -1183,7 +1183,7 @@ pub unsafe trait Init<T: ?Sized, E =3D Infallible>:=
 PinInit<T, E> {
>      /// }
>      ///
>      /// let foo =3D init!(Foo {
> -    ///     buf <- zeroed()
> +    ///     buf <- init_zeroed()
>      /// }).chain(|foo| {
>      ///     foo.setup();
>      ///     Ok(())
> @@ -1469,7 +1469,7 @@ pub unsafe trait PinnedDrop: __internal::HasPinData=
 {
>  /// this is not UB:
>  ///
>  /// ```rust,ignore
> -/// let val: Self =3D unsafe { core::mem::zeroed() };
> +/// let val: Self =3D unsafe { core::mem::init_zeroed() };

This looks like a find/replace that was a bit too eager :)

>  /// ```
>  pub unsafe trait Zeroable {}
> =20
> @@ -1484,11 +1484,11 @@ pub unsafe trait ZeroableOption {}
>  // SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
>  unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
> =20
> -/// Create a new zeroed T.
> +/// Create an initializer for a zeroed `T`.
>  ///
>  /// The returned initializer will write `0x00` to every byte of the give=
n `slot`.
>  #[inline]
> -pub fn zeroed<T: Zeroable>() -> impl Init<T> {
> +pub fn init_zeroed<T: Zeroable>() -> impl Init<T> {
>      // SAFETY: Because `T: Zeroable`, all bytes zero is a valid bit patt=
ern for `T`
>      // and because we write all zeroes, the memory is initialized.
>      unsafe {
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 935d77745d1d..9ced630737b8 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -1030,7 +1030,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*=
>
>  ///
>  /// This macro has multiple internal call configurations, these are alwa=
ys the very first ident:
>  /// - nothing: this is the base case and called by the `{try_}{pin_}init=
!` macros.
> -/// - `with_update_parsed`: when the `..Zeroable::zeroed()` syntax has b=
een handled.
> +/// - `with_update_parsed`: when the `..Zeroable::init_zeroed()` syntax =
has been handled.
>  /// - `init_slot`: recursively creates the code that initializes all fie=
lds in `slot`.
>  /// - `make_initializer`: recursively create the struct initializer that=
 guarantees that every
>  ///   field has been initialized exactly once.
> @@ -1059,7 +1059,7 @@ macro_rules! __init_internal {
>              @data($data, $($use_data)?),
>              @has_data($has_data, $get_data),
>              @construct_closure($construct_closure),
> -            @zeroed(), // Nothing means default behavior.
> +            @init_zeroed(), // Nothing means default behavior.
>          )
>      };
>      (
> @@ -1074,7 +1074,7 @@ macro_rules! __init_internal {
>          @has_data($has_data:ident, $get_data:ident),
>          // `pin_init_from_closure` or `init_from_closure`.
>          @construct_closure($construct_closure:ident),
> -        @munch_fields(..Zeroable::zeroed()),
> +        @munch_fields(..Zeroable::init_zeroed()),
>      ) =3D> {
>          $crate::__init_internal!(with_update_parsed:
>              @this($($this)?),
> @@ -1084,7 +1084,7 @@ macro_rules! __init_internal {
>              @data($data, $($use_data)?),
>              @has_data($has_data, $get_data),
>              @construct_closure($construct_closure),
> -            @zeroed(()), // `()` means zero all fields not mentioned.
> +            @init_zeroed(()), // `()` means zero all fields not mentione=
d.
>          )
>      };
>      (
> @@ -1124,7 +1124,7 @@ macro_rules! __init_internal {
>          @has_data($has_data:ident, $get_data:ident),
>          // `pin_init_from_closure` or `init_from_closure`.
>          @construct_closure($construct_closure:ident),
> -        @zeroed($($init_zeroed:expr)?),
> +        @init_zeroed($($init_zeroed:expr)?),
>      ) =3D> {{
>          // We do not want to allow arbitrary returns, so we declare this=
 type as the `Ok` return
>          // type and shadow it later when we insert the arbitrary user co=
de. That way there will be
> @@ -1196,7 +1196,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) =
{}
>          @data($data:ident),
>          @slot($slot:ident),
>          @guards($($guards:ident,)*),
> -        @munch_fields($(..Zeroable::zeroed())? $(,)?),
> +        @munch_fields($(..Zeroable::init_zeroed())? $(,)?),
>      ) =3D> {
>          // Endpoint of munching, no fields are left. If execution reache=
s this point, all fields
>          // have been initialized. Therefore we can now dismiss the guard=
s by forgetting them.
> @@ -1300,11 +1300,11 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T=
) {}
>      (make_initializer:
>          @slot($slot:ident),
>          @type_name($t:path),
> -        @munch_fields(..Zeroable::zeroed() $(,)?),
> +        @munch_fields(..Zeroable::init_zeroed() $(,)?),
>          @acc($($acc:tt)*),
>      ) =3D> {
>          // Endpoint, nothing more to munch, create the initializer. Sinc=
e the users specified
> -        // `..Zeroable::zeroed()`, the slot will already have been zeroe=
d and all field that have
> +        // `..Zeroable::init_zeroed()`, the slot will already have been =
zeroed and all field that have
>          // not been overwritten are thus zero and initialized. We still =
check that all fields are
>          // actually accessible by using the struct update syntax ourselv=
es.
>          // We are inside of a closure that is never executed and thus we=
 can abuse `slot` to
>=20
> base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
> prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-=
2-lossin@kernel.org
> prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-=
3-lossin@kernel.org
> prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-=
4-lossin@kernel.org
> --=20
> 2.49.0

Beno=C3=AEt du Garreau
