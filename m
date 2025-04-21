Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13174224238
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273940; cv=none; b=AgsAZakd/3JyP429tG0/yXWJ1KRr7o/o0kXHTYmr430/sSp9HVyyiHbnW1f+G+6XBpwZ/cYF/WZpoQwgtwjHxnsZZ5ywf+SKr2GRGc+zTUmHiKerblQJL047eBaNMpaA5J81kXYgm6gNEMPgp+m4dItZ8ULOSuYvwhkNw31ZPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273940; c=relaxed/simple;
	bh=U2UZw3j/Kd1liUF+BkxLfMmTgTkOtQ+h9XZlaK3Xjtk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2iaeKSdJM68tm4zjJoqZbf9IFmIfoalrEUMhJHXsFahOujdLFsJUARCP6OgBxgjz6ivmmJZAz6w258kLTInmuQa5Op+g/q1j85MIrwifTvXTbOibpN1uEuCp4dVRczLiqkrNYPLGUdnZWq8MDLG5GCii0gcemWBzuU6gsKw+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=co4+BBVM; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="co4+BBVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=sxjlrzrgunhyjmljmxlu2hdng4.protonmail; t=1745273935; x=1745533135;
	bh=MVGdbV3SGd4Fc+ruEPlA5FCIdEosESgn9Mh12slh7pM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=co4+BBVM5gKI8dINGQ9isYTjYHmsytSFY0u5a0i5tpCDxENHEg4GqYAex/8/1ur2s
	 AMMPxRElMabv5A1dRGBiA+BxSBBN6qERBwz+7vSI0bZStnsja+OwXCzO7jg7owwmaL
	 H1uI1UQy4DkMyH7nOcyjvshiDjhETEEqcpVNT9bo2nENtlrXyhWAIwmS5bO+Z8Kxb9
	 iNbLhas98eRjYazVH0922i2I3eP+n/dZudGAF8Ej1iRS+pcM/JBXfTgdixjbx3bJBZ
	 ZKPxe5UiAUEQwIFSMsrigSrGzABgUbnFpHus0tN0CiMuqPbNnqMs17H4osue4jMpH+
	 VHspBajsHOB7A==
Date: Mon, 21 Apr 2025 22:18:52 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] rust: pin-init: add `MaybeZeroable` derive macro
Message-ID: <20250421221728.528089-9-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 944d9bbb8e5a36619444237dfba5f5ebf0d6f119
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This derive macro implements `Zeroable` for structs & unions precisely
if all fields also implement `Zeroable` and does nothing otherwise. The
plain `Zeroable` derive macro instead errors when it cannot derive
`Zeroable` safely. The `MaybeZeroable` derive macro is useful in cases
where manual checking is infeasible such as with the bindings crate.

Move the zeroable generics parsing into a standalone function in order
to avoid code duplication between the two derive macros.

Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/1165cdad1a=
391b923efaf30cf76bc61e38da022e
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/internal/src/lib.rs      |  5 +++
 rust/pin-init/internal/src/zeroable.rs | 27 +++++++++++-
 rust/pin-init/src/lib.rs               | 30 +++++++++++++
 rust/pin-init/src/macros.rs            | 59 ++++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src=
/lib.rs
index 56aa9ecc1e1a..297b0129a5bf 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -47,3 +47,8 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream)=
 -> TokenStream {
 pub fn derive_zeroable(input: TokenStream) -> TokenStream {
     zeroable::derive(input.into()).into()
 }
+
+#[proc_macro_derive(MaybeZeroable)]
+pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
+    zeroable::maybe_derive(input.into()).into()
+}
diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/interna=
l/src/zeroable.rs
index acc94008c152..e0ed3998445c 100644
--- a/rust/pin-init/internal/src/zeroable.rs
+++ b/rust/pin-init/internal/src/zeroable.rs
@@ -6,7 +6,14 @@
 use crate::helpers::{parse_generics, Generics};
 use proc_macro::{TokenStream, TokenTree};
=20
-pub(crate) fn derive(input: TokenStream) -> TokenStream {
+pub(crate) fn parse_zeroable_derive_input(
+    input: TokenStream,
+) -> (
+    Vec<TokenTree>,
+    Vec<TokenTree>,
+    Vec<TokenTree>,
+    Option<TokenTree>,
+) {
     let (
         Generics {
             impl_generics,
@@ -64,6 +71,11 @@ pub(crate) fn derive(input: TokenStream) -> TokenStream =
{
     if in_generic && !inserted {
         new_impl_generics.extend(quote! { : ::pin_init::Zeroable });
     }
+    (rest, new_impl_generics, ty_generics, last)
+}
+
+pub(crate) fn derive(input: TokenStream) -> TokenStream {
+    let (rest, new_impl_generics, ty_generics, last) =3D parse_zeroable_de=
rive_input(input);
     quote! {
         ::pin_init::__derive_zeroable!(
             parse_input:
@@ -74,3 +86,16 @@ pub(crate) fn derive(input: TokenStream) -> TokenStream =
{
         );
     }
 }
+
+pub(crate) fn maybe_derive(input: TokenStream) -> TokenStream {
+    let (rest, new_impl_generics, ty_generics, last) =3D parse_zeroable_de=
rive_input(input);
+    quote! {
+        ::pin_init::__maybe_derive_zeroable!(
+            parse_input:
+                @sig(#(#rest)*),
+                @impl_generics(#(#new_impl_generics)*),
+                @ty_generics(#(#ty_generics)*),
+                @body(#last),
+        );
+    }
+}
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 774f8ca033bc..05a0cd6ad8f4 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -413,6 +413,36 @@
 /// ```
 pub use ::pin_init_internal::Zeroable;
=20
+/// Derives the [`Zeroable`] trait for the given struct if all fields impl=
ement [`Zeroable`].
+///
+/// Contrary to the derive macro named [`macro@Zeroable`], this one silent=
ly fails when a field
+/// doesn't implement [`Zeroable`].
+///
+/// # Examples
+///
+/// ```
+/// use pin_init::MaybeZeroable;
+///
+/// // implmements `Zeroable`
+/// #[derive(MaybeZeroable)]
+/// pub struct DriverData {
+///     id: i64,
+///     buf_ptr: *mut u8,
+///     len: usize,
+/// }
+///
+/// // does not implmement `Zeroable`
+/// #[derive(MaybeZeroable)]
+/// pub struct DriverData2 {
+///     id: i64,
+///     buf_ptr: *mut u8,
+///     len: usize,
+///     // this field doesn't implement `Zeroable`
+///     other_data: &'static i32,
+/// }
+/// ```
+pub use ::pin_init_internal::MaybeZeroable;
+
 /// Initialize and pin a type directly on the stack.
 ///
 /// # Examples
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 332d7e08925b..935d77745d1d 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1443,3 +1443,62 @@ fn ensure_zeroable<$($impl_generics)*>()
         };
     };
 }
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! __maybe_derive_zeroable {
+    (parse_input:
+        @sig(
+            $(#[$($struct_attr:tt)*])*
+            $vis:vis struct $name:ident
+            $(where $($whr:tt)*)?
+        ),
+        @impl_generics($($impl_generics:tt)*),
+        @ty_generics($($ty_generics:tt)*),
+        @body({
+            $(
+                $(#[$($field_attr:tt)*])*
+                $field_vis:vis $field:ident : $field_ty:ty
+            ),* $(,)?
+        }),
+    ) =3D> {
+        // SAFETY: Every field type implements `Zeroable` and padding byte=
s may be zero.
+        #[automatically_derived]
+        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_g=
enerics)*>
+        where
+            $(
+                // the `for<'__dummy>` HRTB makes this not error without t=
he `trivial_bounds`
+                // feature <https://github.com/rust-lang/rust/issues/48214=
#issuecomment-2557829956>.
+                $field_ty: for<'__dummy> $crate::Zeroable,
+            )*
+            $($($whr)*)?
+        {}
+    };
+    (parse_input:
+        @sig(
+            $(#[$($struct_attr:tt)*])*
+            $vis:vis union $name:ident
+            $(where $($whr:tt)*)?
+        ),
+        @impl_generics($($impl_generics:tt)*),
+        @ty_generics($($ty_generics:tt)*),
+        @body({
+            $(
+                $(#[$($field_attr:tt)*])*
+                $field_vis:vis $field:ident : $field_ty:ty
+            ),* $(,)?
+        }),
+    ) =3D> {
+        // SAFETY: Every field type implements `Zeroable` and padding byte=
s may be zero.
+        #[automatically_derived]
+        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_g=
enerics)*>
+        where
+            $(
+                // the `for<'__dummy>` HRTB makes this not error without t=
he `trivial_bounds`
+                // feature <https://github.com/rust-lang/rust/issues/48214=
#issuecomment-2557829956>.
+                $field_ty: for<'__dummy> $crate::Zeroable,
+            )*
+            $($($whr)*)?
+        {}
+    };
+}
--=20
2.48.1


