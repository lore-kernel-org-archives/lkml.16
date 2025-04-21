Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE79224889;
	Mon, 21 Apr 2025 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273894; cv=none; b=kJjXYqy/RrMiCCEkfvxuwkii6R1Oy23yZMEObdU4NKbSmBLGvBcPZH6qLdkNtrT6skCF8MZcGf4SD4n0KZ84QAaqgTpF6tfZZpHI1rXzMY0JeP9cJie6anScwZBeNfqHZpKOfx4ggs0KhUZ2ex7ZXa5TJZdZ6VLvKFk7REevV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273894; c=relaxed/simple;
	bh=HgS259GGNApkbFLaxZKTv2KugQhpNJimP4Lx9ZXZR9Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9d/IADlJYk6iL6gE37efu5LXX5hOVIqwWqHwVCCRfAqdE/4cmqsrsIo1ZQVthuO4EDBj3MM72WJB73F3UjJvk0NmttJd+FIJoEXGut6GXclxP2hf2Y/I1cjgk2gyNGgARz4WsISv2p/c3zLAX3gtZted6QLIXYHR/4AXs7WyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lvUcVaba; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lvUcVaba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273890; x=1745533090;
	bh=rSKoIFTqEPyzmnLIV4BYhWNstz2/wx56DmOTrH4EteU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lvUcVabal6V6fv5ZqKgb5CQD36RENX7f6MhMmT6dcdkOMb5OuTVsL7Bfckw+e5YHn
	 OF9eJP3CoQ6WKafXUiFaVlm1VNYm+TzitOZqjjT9m/MWxJ45tUrEMIWWkBZJTaZA3x
	 MOX+60dVWw/S55/d/dV/LoeG0bcQZGULmaL8LdmPEnpkKl0nsj5wmlG9xSRJ2deACh
	 FdaXHUS9qV70HZuTKDfx54nLcGr+V30dbKm4Pzv6gcK6dcIfy5L4gGASPXP2y3sNUr
	 66qw0IChJpj+7w2S0vUrkcbHI1sL+aq3Rf5CqI2pH13f/TV+nZvr9jNAOY0oQKCwQm
	 VGWH3SH6yF+dg==
Date: Mon, 21 Apr 2025 22:18:06 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature flag.
Message-ID: <20250421221728.528089-4-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 52d37176170fafc1a603fdedfa52364214c8e57e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Christian Schrefl <chrisi.schrefl@gmail.com>

Add the `unsafe-pinned` feature which gates the `Wrapper`
implementation of the `core::pin::UnsafePinned` struct.

For now this is just a cargo feature, but once `core::pin::UnsafePinned`
is stable a config flag can be added to allow the usage of this
implementation in the linux kernel.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/99cb193442=
5357e780ea5b0628f66633123847b8
[ Fixed commit authorship. - Benno ]
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/src/lib.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 467ccc8bd616..745cf534d239 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -269,6 +269,10 @@
 #![forbid(missing_docs, unsafe_op_in_unsafe_fn)]
 #![cfg_attr(not(feature =3D "std"), no_std)]
 #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+#![cfg_attr(
+    all(feature =3D "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED),
+    feature(unsafe_pinned)
+)]
=20
 use core::{
     cell::UnsafeCell,
@@ -1557,3 +1561,11 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) -> im=
pl PinInit<Self, E> {
         unsafe { cast_pin_init(value_init) }
     }
 }
+
+#[cfg(all(feature =3D "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
+impl<T> Wrapper<T> for core::pin::UnsafePinned<T> {
+    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
+        unsafe { cast_pin_init(init) }
+    }
+}
--=20
2.48.1


