Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B72512C5;
	Sat, 26 Apr 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656784; cv=none; b=cJl5I6z4On/J4590zYjk+2U+jtvBn/Bws/duES3rWqIFf9veB5NAWXmlzx9Gentt4fPQzupllgRotHJahi0eBcSnMCFcLDeFiDw2jAUrsXtxUNyoAUdENepDEtgj5QZetXamG3B/ZTJDyc0OTB/gDnYCsSFsU6FuEMEDALQjgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656784; c=relaxed/simple;
	bh=FjTz9k9z8B3i+6P0L0WCxyeklDmy3oWdigl+FK+4ji4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBOXsgEaXjfjvVIZ1DTpyMYfbp+9QI7aj+vt7e7kvySKmArQBGBPwLw8toABUg3PGxGTDESVVwPSuKzCYmlVmHgBoITczUcGWtZNFgF0omAr869U/xu7+Tu9feS7Qm1/4VA7Qwqxq/WUhwL+KLYlDjk8rKad91IjAbGvNkXsGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KlQQZjFF; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KlQQZjFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745656771; x=1745915971;
	bh=stIFv+urxFL09xLfZ26/cn1HEO1SFUWtH16yfcmux88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KlQQZjFF8vTWxL5nXISj5VewLSjhQexb1lN+xS4EoKLHyTPHwjRN52MRQrH3CXWhY
	 +9XQmxMqWc6hxlCb+ngSGSneAmuoYyVRxgBoeUNtcdGpMo7h8FyfiAYk4lVqqX2xuN
	 QyZxrb+Hd8gMcPXjK/5ZtQP2H8/cCy92/JhYnDbQlHPQp888R//i2HvHczKRzVzinH
	 X9++AFL71DNxvlYgWWXk8q/B0W98OPjEuj4I0SwCTGpmYtbyQB2FoyAU+N/0Zg1q9P
	 NI7FtKa1aE8zHY3i5drIDi/+vN6m8Y92WeUVhF8e/hnr98ijSB9PZM9U0eovbmp3px
	 jU92Q6Q517Xsw==
Date: Sat, 26 Apr 2025 08:39:28 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: pin-init: improve documentation for `Zeroable` derive macros
Message-ID: <20250426083901.13289-2-benno.lossin@proton.me>
In-Reply-To: <20250426083901.13289-1-benno.lossin@proton.me>
References: <20250426083901.13289-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 74d98f4754a9d359f3c36427129df1fdf94bc890
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Specify that both `MaybeZeroable` and `Zeroable` work on `union`s. Add a
doc example for a union. Also include an example with visibility on the
field.

Link: https://github.com/Rust-for-Linux/pin-init/pull/48/commits/ab0985a0e0=
8df06c60a32ca5888f74adcc2c1cf3
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
Also see the compile-fail & macro expansion tests added by this commit
(not included in the kernel, since the test files are only upstream):

    https://github.com/Rust-for-Linux/pin-init/pull/48/commits/278070d12b41=
f0fca1b0d6dff6c5f38f3cf46044
---
 rust/pin-init/src/lib.rs | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index b5a295effd9c..9ab34036e6bc 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -395,9 +395,10 @@
 /// ```
 pub use ::pin_init_internal::pinned_drop;
=20
-/// Derives the [`Zeroable`] trait for the given struct.
+/// Derives the [`Zeroable`] trait for the given `struct` or `union`.
 ///
-/// This can only be used for structs where every field implements the [`Z=
eroable`] trait.
+/// This can only be used for `struct`s/`union`s where every field impleme=
nts the [`Zeroable`]
+/// trait.
 ///
 /// # Examples
 ///
@@ -406,14 +407,25 @@
 ///
 /// #[derive(Zeroable)]
 /// pub struct DriverData {
-///     id: i64,
+///     pub(crate) id: i64,
 ///     buf_ptr: *mut u8,
 ///     len: usize,
 /// }
 /// ```
+///
+/// ```
+/// use pin_init::Zeroable;
+///
+/// #[derive(Zeroable)]
+/// pub union SignCast {
+///     signed: i64,
+///     unsigned: u64,
+/// }
+/// ```
 pub use ::pin_init_internal::Zeroable;
=20
-/// Derives the [`Zeroable`] trait for the given struct if all fields impl=
ement [`Zeroable`].
+/// Derives the [`Zeroable`] trait for the given `struct` or `union` if al=
l fields implement
+/// [`Zeroable`].
 ///
 /// Contrary to the derive macro named [`macro@Zeroable`], this one silent=
ly fails when a field
 /// doesn't implement [`Zeroable`].
@@ -426,7 +438,7 @@
 /// // implmements `Zeroable`
 /// #[derive(MaybeZeroable)]
 /// pub struct DriverData {
-///     id: i64,
+///     pub(crate) id: i64,
 ///     buf_ptr: *mut u8,
 ///     len: usize,
 /// }
@@ -434,7 +446,7 @@
 /// // does not implmement `Zeroable`
 /// #[derive(MaybeZeroable)]
 /// pub struct DriverData2 {
-///     id: i64,
+///     pub(crate) id: i64,
 ///     buf_ptr: *mut u8,
 ///     len: usize,
 ///     // this field doesn't implement `Zeroable`
--=20
2.48.1


