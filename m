Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8AF264A74
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243379; cv=none; b=r/w4B9Ft7cV1tpn6CbA9icYJwMP4i1r08GK3aqIzdEdNUUlInx79YbHwUEglOa5svqAgvDopP5EEQtHT1A9wI/Yu8k+HD4htr9DKyJGEfT5Gt1TreEvY68R3Gm5BZODq/vfW9EqqKy5/PeeOmLAxtabKPmhGVlJnaUeRjEKofWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243379; c=relaxed/simple;
	bh=Ao5wNhKv03EPHv0aTteNWmI4WvjIiW9XUFZYal1nH/8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmqzuwH/qBLJPvjDMQ0Hp5BNpUuFuMrVzclSFn7XNl2FQ7qj6FzCRDYO7DO/LHfQrO2cCBW4sJ+76IMns15Me8COgjeB5RXGocoWYjGgaNzy1uuwX5K5jfZ5GmHRDztTvEq7+ADUr2/0HQBYQfaojGsYSAmn6k+y33HXPcz/mQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QQdBUYhG; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QQdBUYhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745243375; x=1745502575;
	bh=iieEZG1MGOqcpOcsMb508ZZimJzCm0BTdu+irT5HjF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QQdBUYhGs3oPe+Jt+YdDiKEmTRbDGwXiuVVj77VM79pE09oAq3xmrHXDQs6qzalpd
	 gbVuBgx3kfXaLv5c2IfAI6umfDP3LEvF73Wxc15xsjN6/KUMuJpl9vFtC4Wohtvq7F
	 qr3ttw2/olWtfNJlSKckYx5+KYUnvDcS9gJIOCXL7PKQrB7inyCVvIEnVioEGOQYpL
	 6NU8H4LqVjRNkVAlvtiy1Mb1FDzVXJKYYnDOC2cEteqUboRP7KJQplkTzpHyuUP+GU
	 UcHl86rWfnT9GeWtlbXQtdjQX1Cco2Aa0q2w1a3SuIQgUaLngGcZUT4kiGyVXcPGhc
	 OoM61E2eKQ5PQ==
Date: Mon, 21 Apr 2025 13:49:30 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Aliet Exposito Garcia <aliet.exposito@gmail.com>, Fiona Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] rust: transmute: add `cast_slice[_mut]` functions
Message-ID: <20250421134909.464405-2-benno.lossin@proton.me>
In-Reply-To: <20250421134909.464405-1-benno.lossin@proton.me>
References: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 39bf4a4fab2beb80b6346e71ebdc4e1e485cef0a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add functions to make casting slices only one `unsafe` block.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/transmute.rs | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 1c7d43771a37..242623bbb565 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -2,6 +2,8 @@
=20
 //! Traits for transmuting types.
=20
+use core::slice;
+
 /// Types for which any bit pattern is valid.
 ///
 /// Not all types are valid for all values. For example, a `bool` must be =
either zero or one, so
@@ -69,3 +71,42 @@ macro_rules! impl_asbytes {
     {<T: AsBytes>} [T],
     {<T: AsBytes, const N: usize>} [T; N],
 }
+
+/// Casts the type of a slice to another.
+///
+/// # Examples
+///
+/// ```rust
+/// # use kernel::transmute::cast_slice;
+/// #[repr(transparent)]
+/// #[derive(Debug)]
+/// struct Container<T>(T);
+///
+/// let array =3D [0u32; 42];
+/// let slice =3D &array;
+/// // SAFETY: `Container<T>` transparently wraps a `T`.
+/// let container_slice =3D unsafe { cast_slice(slice) };
+/// pr_info!("{container_slice}");
+/// ```
+///
+/// # Safety
+/// - `T` and `U` must have the same layout.
+pub unsafe fn cast_slice<T, U>(slice: &[T]) -> &[U] {
+    // CAST: by the safety requirements, `T` and `U` have the same layout.
+    let ptr =3D slice.as_ptr().cast::<U>();
+    // SAFETY: `ptr` and `len` come from the same slice reference.
+    unsafe { slice::from_raw_parts(ptr, slice.len()) }
+}
+
+/// Casts the type of a slice to another.
+///
+/// Also see [`cast_slice`].
+///
+/// # Safety
+/// - `T` and `U` must have the same layout.
+pub unsafe fn cast_slice_mut<T, U>(slice: &mut [T]) -> &mut [U] {
+    // CAST: by the safety requirements, `T` and `U` have the same layout.
+    let ptr =3D slice.as_mut_ptr().cast::<U>();
+    // SAFETY: `ptr` and `len` come from the same slice reference.
+    unsafe { slice::from_raw_parts_mut(ptr, slice.len()) }
+}
--=20
2.48.1


