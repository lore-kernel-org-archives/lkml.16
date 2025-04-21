Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C726658C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243407; cv=none; b=UEZh6ieI68zC3XvhAyxxl9ZDA2jou78tqRqDJ1624f0jcTleFYhYD9pcbPj5Hv0NHe7W6AZuQT16+Q+9qSiFTXOfMmtwRXKUkjEg/mxkjx1O2GIKNjRyjylGzIfen631u0NwMHpqgCUX90npRAwbQWb3f/ygaKx4tWVJ/m2UK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243407; c=relaxed/simple;
	bh=Q9Fxr7G0Jn/628DA/iVnd27cKQDwagJyYw/wLDOxC0M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibX6u2N0TBWEEjV4+ir6zoqqexWkzBZrcwFKtskxmNqtQjKhBLKPnIPGUS/2hgMqScjWngvgXO5XCfHFYeHVjDm99oZWmJjFucI9YnE2yUVqPOVvdHyLOxkgBcHf154IiexIqL3p+E/JtsXGD0Dm2ewf99kVqst3tpSdgl+Zqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZqyzoUEb; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZqyzoUEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3iy34xvm5jch7hkvrzbifwkwbi.protonmail; t=1745243395; x=1745502595;
	bh=nZEpbSXmi2/SJJk1zOcLaNc18i7a6p+iLWp8MjXWdjk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZqyzoUEb0g5dCZZRVaXSwrAMTULGsUWs+7Z2wlIHXsgED1LnvlAaU7uZBAzhEhAku
	 BPhDTrTcZNOWnI0wqKvJn0zsBJi0WDNyfGiqa10RS3MU5TEw97AarUPHR4irs3/3vg
	 XzDAx6PvhoQKlEo5IxpDjmauwz4VSs6oYuo0ThgvnyypQ+sOspABUu49gLW7wSG+wu
	 ZCMW7taHOWjJXBiUpGc5PBbxciEQbbYX4HCxtBmzK6KsRC7+R2Ixxi+sZVce8hjXR+
	 9A+rux0Ed4jfcBYiHP9tQjujEXd3ZHFq3FCZXQAH+B6B/3lNxWVc02RYkwrLXvO/BA
	 lAmXte04ywUTQ==
Date: Mon, 21 Apr 2025 13:49:49 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] rust: validate: add `Validate` trait
Message-ID: <20250421134909.464405-4-benno.lossin@proton.me>
In-Reply-To: <20250421134909.464405-1-benno.lossin@proton.me>
References: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 30c2311e2ef1108c5dbe1fe6d908c628fbddafc8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce the `Validate<Input>` trait and functions to validate
`Untrusted<T>` using said trait. This allows one to access the inner
value of `Untrusted<T>` via `validate{,_ref,_mut}` functions which
subsequently delegate the validation to user-implemented `Validate`
trait.

The `Validate` trait is the only entry point for validation code, making
it easy to spot where data is being validated.

The reason for restricting the types that can be inputs to
`Validate::validate` is to be able to have the `validate...` functions
on `Untrusted`. This is also the reason for the suggestions in the
`Usage in API Design` section in the commit that introduced
`Untrusted<T>`.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/validate.rs | 61 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index 8b33716be0c7..eecac39365db 100644
--- a/rust/kernel/validate.rs
+++ b/rust/kernel/validate.rs
@@ -11,6 +11,9 @@
 //! APIs that write back into userspace usually allow writing untrusted by=
tes directly, allowing
 //! direct copying of untrusted user data back into userspace without vali=
dation.
 //!
+//! The only way to access untrusted data is to [`Validate::validate`] it.=
 This is facilitated by
+//! the [`Validate`] trait.
+//!
 //! # Rationale
 //!
 //! When reading data from an untrusted source, it must be validated befor=
e it can be used for
@@ -46,7 +49,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this r=
eason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is =
`Untrusted<KVec<T>>`, it
 /// derefs to `KVec<Untrusted<T>>`. Raw bytes however do not behave in thi=
s way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untruste=
d::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -101,6 +104,30 @@ pub fn new(value: T) -> Self
     {
         Self(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate<V: Validate<Self>>(self) -> Result<V, V::Err>
+    where
+        T: Sized,
+    {
+        V::validate(self.0)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate_ref<'a, V: Validate<&'a Self>>(&'a self) -> Result<V, =
V::Err> {
+        V::validate(&self.0)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    pub fn validate_mut<'a, V: Validate<&'a mut Self>>(&'a mut self) -> Re=
sult<V, V::Err> {
+        V::validate(&mut self.0)
+    }
 }
=20
 impl<T> Deref for Untrusted<[T]> {
@@ -140,3 +167,35 @@ fn deref_mut(&mut self) -> &mut Self::Target {
         unsafe { &mut *ptr }
     }
 }
+
+/// Marks valid input for the [`Validate`] trait.
+pub trait ValidateInput: private::Sealed {}
+
+impl<T: ?Sized> ValidateInput for Untrusted<T> {}
+
+impl<'a, T: ?Sized> ValidateInput for &'a Untrusted<T> {}
+
+impl<'a, T: ?Sized> ValidateInput for &'a mut Untrusted<T> {}
+
+mod private {
+    use super::Untrusted;
+
+    pub trait Sealed {}
+
+    impl<T: ?Sized> Sealed for Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a mut Untrusted<T> {}
+}
+
+/// Validate [`Untrusted`] data.
+///
+/// Care must be taken when implementing this trait, as unprotected access=
 to unvalidated data is
+/// given to the [`Validate::validate`] function. The implementer must ens=
ure that the data is only
+/// used for logic after successful validation.
+pub trait Validate<Input: ValidateInput>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Validate the raw input.
+    fn validate(raw: Input) -> Result<Self, Self::Err>;
+}
--=20
2.48.1


