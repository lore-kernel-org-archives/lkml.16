Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A021B1AB;
	Sat, 26 Apr 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656779; cv=none; b=S68UGRZw6SSzDQbpSleMsGN4rlFeQGzRW/F2zOyrY46ZmBtq+7WCBdn1g1prFFl6PRsITrw5eNUtcPyR8D6XaE4PxP3ptm4/YDmATrNwRh2dVTWc/nozwaXZSeK0SVzRpqZ8+8X25Q9eoFnTFw2h/uAISAFJ3Ipf1gBfey8z41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656779; c=relaxed/simple;
	bh=rmWiYicz3YlChrAIO8kTKP/XvOdafRv3yv+Isf/zTco=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hREQzKKxXPNxdck+LINrFEXvuDBaWZ25ENmxssFmcLhuxGa7tnMqku7SdMBupg8H82lrXB9X4kBKkdTGmNLhJx6yAqt9j6sQw47jq80B5JulR3mqqp/k6Gnbe0J8J+i3bMzYF+czEESyJiMtP7ilvZVdKctGn09NtZVp5V75NV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LD6dKvX4; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LD6dKvX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745656768; x=1745915968;
	bh=km6ONS/sIh/vr7q64RmtGyzvF8m+1doewaFBRicXAhk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=LD6dKvX4SuWWoM3Nr6cw5O5k2hVEx40+qvJFj2e7SFvLHTWXQybyBNLRA7wVFnRbw
	 qyFXH2NHN6Y0gOdulPDFRvwksOAuSF4BI/z2MVq4ZJ1yMgxcCP98A79PgUUk6KaPI1
	 kVNbZyN2K18QL77GQrI88V4DRJMqNhpQET00xOG+h2IxTBua0lZbXn9azaFuNCgkdJ
	 ozpxZs9AkZj2OHP+wtd2WGHJNKQTSjgRDWynxQPH/OeJOLuCA4l0Lp9SjqPfF9GeKV
	 kKYV0QFihZ42pb7OgDjGpimd6Z6XFQijVqDnrjOUPXbatNVvlBEG2IDisfZsN0XFdg
	 Ti+acPa3450MQ==
Date: Sat, 26 Apr 2025 08:39:22 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: pin-init: fix typos
Message-ID: <20250426083901.13289-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b64ddfcf3de75fe4a9d27d64e82d564863470c2c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Correct two typos in the `Wrapper::pin_init` documentation.

Link: https://github.com/Rust-for-Linux/pin-init/pull/48/commits/fd0bf5e244=
b685188dc642fc4a0bd3f042468fdb
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
Second round of pin-init syncs for v6.16. Depends on

    https://lore.kernel.org/all/20250421221728.528089-1-benno.lossin@proton=
.me
---
 rust/pin-init/src/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 05a0cd6ad8f4..b5a295effd9c 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1580,7 +1580,7 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zero=
able for ($first, $($t),*)
 /// });
 /// ```
 pub trait Wrapper<T> {
-    /// Create an pin-initializer for a [`Self`] containing `T` form the `=
value_init` initializer.
+    /// Creates an pin-initializer for a [`Self`] containing `T` from the =
`value_init` initializer.
     fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E=
>;
 }
=20

base-commit: 39051adb070432b283e6c11b2b24937281b9f97f
--=20
2.48.1


