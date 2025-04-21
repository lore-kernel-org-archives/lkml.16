Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABD224238
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273903; cv=none; b=g0drsAZ1ezmsh29ObH94AbejAhWauCa78OhzobarFOJov2l921ffHZaph5HbsXOr9iDUFba3M1Mi74Koiq9OQjXJiula5db+ZYgvKsy5ULlD++6am7qYLOtvygOJ3wg+BCidSe/fsNdhTrGVdLoqhYg0HmsLMhrXoY9TjyHvb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273903; c=relaxed/simple;
	bh=0H4Jsl/gZJaBEJqpSuXyidyxIMe6AXilJK73cNm+HMI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIpuD3tpM/tsuGTbiUFA1HgWmmNOA2ttRGF6Gi1bTWvryd6lv8UCsXniGvqE8bPk5ivlF+7uP7EECX5GER2peh4uJ0P7AhDCj7lkSZei6i3WoiBSXUChT2T9Mjp96g+pBqC2JhQsGYUX9evknTeFUJaUi4lkuJDhaZ3mc7FsuuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=iXbYDexU; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iXbYDexU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273899; x=1745533099;
	bh=kjp3xQRU5JG9aERqKDEknd4Bv1nP/rNrmVt6fThWMBk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iXbYDexUB08bPokrpHLwOO88hGGyqCp1TVio2qLPm5sL4SNv8EsS0VU0qzZhXQZ7o
	 47sAzA6yPBlKxIZ+fZGZvMxuyU5cCaCG/7fUA2s7Cdy+bexmDfxWiDAOd4mo0WvFfL
	 kuFGxmgAaWOCq58rW90HawmWOp+hMQHdFkHsKq/LbKM53tuoZwaGbDWldKevYhOabw
	 KXUH3b87sJppsAO8n+nuFlpuP1ymzaWekPwRma3f1jUS3UKtm5lAGrrcgPEY2Gc2Q8
	 ekEPqJR6OUxorseeSqz3WmmtnQSpC7WYHWmPOcXfE9N0J7TOnTqvEQoTGlIVsk5skP
	 zeYVinaESQACQ==
Date: Mon, 21 Apr 2025 22:18:13 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] rust: pin-init: Update Changelog and Readme
Message-ID: <20250421221728.528089-5-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: cf6830c055eb29ec4022be703e63237e361a4dda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Christian Schrefl <chrisi.schrefl@gmail.com>

Add Changelog entry for the `Wrapper` trait and document the
`unsafe-pinned` feature in the Readme.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/986555f564=
645efb238e8092c6314388c859efe5
[ Fixed commit authorship. - Benno ]
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/README.md  | 6 ++++++
 rust/pin-init/src/lib.rs | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 24d0f0a3f8fb..1a03b200d4ce 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -40,6 +40,12 @@ However, using the crate on stable compilers is possible=
 by disabling `alloc`. I
 will require the `std` feature, because stable compilers have neither `Box=
` nor `Arc` in no-std
 mode.
=20
+### Nightly needed for `unsafe-pinned` feature
+
+This feature enables the `Wrapper` implementation on the unstable `core::p=
in::UnsafePinned` type.
+This requires the [`unsafe_pinned` unstable feature](https://github.com/ru=
st-lang/rust/issues/125735)
+and therefore a nightly compiler. Note that this feature is not enabled by=
 default.
+
 ## Overview
=20
 To initialize a `struct` with an in-place constructor you will need two th=
ings:
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 745cf534d239..1521500a46b1 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -32,6 +32,12 @@
 //! will require the `std` feature, because stable compilers have neither =
`Box` nor `Arc` in no-std
 //! mode.
 //!
+//! ## Nightly needed for `unsafe-pinned` feature
+//!
+//! This feature enables the `Wrapper` implementation on the unstable `cor=
e::pin::UnsafePinned` type.
+//! This requires the [`unsafe_pinned` unstable feature](https://github.co=
m/rust-lang/rust/issues/125735)
+//! and therefore a nightly compiler. Note that this feature is not enable=
d by default.
+//!
 //! # Overview
 //!
 //! To initialize a `struct` with an in-place constructor you will need tw=
o things:
--=20
2.48.1


