Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49421D63D3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273880; cv=none; b=QZGh2lAg90D+WNDaxAVCMs654zEijLsTMAIcwx0YJJHnZjQeVzHdRu4CRHZulQ5vkHZ0pCyV7tXuHdeU6rWwutGSceNOflalSzwu/D5KKAlL4FWnDcnCJZnEEuAt+hbAwjhbd9WPZZRSJ1/eYc47YV//Ce2is6y7VxKS+OnDsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273880; c=relaxed/simple;
	bh=itlT5b2XTrKzhjvIuJuhVAVCPA+FeNCUxakIFO2msm4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSy6QwB1fMEeyR0O0duA5eOkI6Yfn76Ov/iwFA4fU6KGgrDewhVKdPvolg/Pkb8Hwqzqy3kTvpRFGSzVASI+32sLw/NUg9oxb0dkVn6oWN9dnWGhdOG7212PWtWoIg+XkSrLtv1VHZ6qXaqsvh2wu47IYffnA8VpbCJCXBhTxrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OP8pvYo2; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OP8pvYo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273876; x=1745533076;
	bh=1vkTGyA1zdmJAb8MDaGP9PiFcRJIhuTCCFKfhptdvxU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OP8pvYo2kefWXDcDUYMtata9Lk5qPrtlAGjuXeNaxwfgDIFcgvIBcBklie9AYA21p
	 ZIBypu/sP63DD0bVmBa8XoSRr+PX75SfxlHXBtVUTreJAzGg5PF0YQ3KIJb70/3CRd
	 dbZdgUnvFCMW4zUOM8GIOfiByAXXEhwexola7UFj0mBcjOxMQSghhmrQokuBPHDeKl
	 s3hOLOWaxU0glXYAC5yU+gUHXw/httOdcpMZvTzqVn+vsITx5TKA0pDOjTtK1lG61N
	 AfqjSkkCPSeI3mY2aTV/sjE4fz0xI6WROoRyWNvbZ7YzRS/Rj+07EDLWioeuX2RdvE
	 0tZrpR3P61Egg==
Date: Mon, 21 Apr 2025 22:17:50 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] rust: pin-init: add `cast_[pin_]init` functions to change the initialized type
Message-ID: <20250421221728.528089-2-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 090927d2a73103e0e04ddc3bc806d1ccce825fd1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These functions cast the given pointer from one type to another. They
are particularly useful when initializing transparent wrapper types.

Link: https://github.com/Rust-for-Linux/pin-init/pull/39/commits/80c03ddee4=
1b154f1099fd8cc7c2bbd8c80af0ad
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/src/lib.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 0806c689f693..a880c21d3f09 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1216,6 +1216,38 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Resul=
t<(), E> {
     __internal::InitClosure(f, PhantomData)
 }
=20
+/// Changes the to be initialized type.
+///
+/// # Safety
+///
+/// - `*mut U` must be castable to `*mut T` and any value of type `T` writ=
ten through such a
+///   pointer must result in a valid `U`.
+#[expect(clippy::let_and_return)]
+pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> im=
pl PinInit<U, E> {
+    // SAFETY: initialization delegated to a valid initializer. Cast is va=
lid by function safety
+    // requirements.
+    let res =3D unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned=
_init(ptr.cast::<T>())) };
+    // FIXME: remove the let statement once the nightly-MSRV allows it (1.=
78 otherwise encounters a
+    // cycle when computing the type returned by this function)
+    res
+}
+
+/// Changes the to be initialized type.
+///
+/// # Safety
+///
+/// - `*mut U` must be castable to `*mut T` and any value of type `T` writ=
ten through such a
+///   pointer must result in a valid `U`.
+#[expect(clippy::let_and_return)]
+pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init=
<U, E> {
+    // SAFETY: initialization delegated to a valid initializer. Cast is va=
lid by function safety
+    // requirements.
+    let res =3D unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.c=
ast::<T>())) };
+    // FIXME: remove the let statement once the nightly-MSRV allows it (1.=
78 otherwise encounters a
+    // cycle when computing the type returned by this function)
+    res
+}
+
 /// An initializer that leaves the memory uninitialized.
 ///
 /// The initializer is a no-op. The `slot` memory is not changed.
--=20
2.48.1


