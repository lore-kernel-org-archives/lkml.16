Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9F1E9B06;
	Mon, 14 Apr 2025 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660837; cv=none; b=B5dv1HEEZPc49Yv6tQyGNTX21IfOobr6SLJ7SES3+l4kSCr4ZGXmAx0oaW86ceo6bTdUdqDsERSfYz8HLBIY0NYAsg+lCjHNvVHkjVVdPM9/+vnj1Pgw8X7LE2JzkBGv4sQOTHUKr9d0Noa4CQJvOxf2ZRZFQPkzOEaBQxqIBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660837; c=relaxed/simple;
	bh=TWJ0okZW+8/GK3f4fqiOFElTdvZJl4UY9KYhobizbVs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SINQJyynpW1q+gkiXtPV2AmEuqW1o7mgnnMATbdMYl9YPXet7xQRunOMCNhjOSKa/FywvtyFvhT7jG//51i+PMby+3cuQrH8QssBel2p89Xcl8VKRFJ+h3maiyZGgDdfhBBHCf+GP+7NMH4QQERI0gAw5sXPMCyLjFrm3y5aLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=j1gEZYUc; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="j1gEZYUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744660827; x=1744920027;
	bh=zdtxYtqOEBxCKBn2U8h77Y7hXVQ5/IOFpb5ARHsBxT4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=j1gEZYUcGNfLJw8kPfqcTnWKmNKhKyKNW5rwBoPRyaXuC/NbC7tcKxeBVo/J5W0Os
	 s4vchkdra+QT3/qfBedFLQGHqSEonT3iee2joc0s8P20CvIfh5PO+e6W4HEDJhr4P3
	 tjNtG5iKZWqSyIiVOeUOUIcvXQ8GNlKLEs4szrHjaXiltncZoaO7PpvxV+n0WMjIPm
	 uXQF1STuO/BB7UEmxKQu3MSgL4ddu94EcJnmdRX8o/GF6zq2Pd5+hvRjspsx1gSYWD
	 +c1vE0U5mEiwqAsRgsSC7479cirwUrPqsCCLPEFOYty9bCe3gby+snjqoCo0WKnwaB
	 1zt+LzAmqQdpw==
Date: Mon, 14 Apr 2025 20:00:20 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
Message-ID: <20250414195928.129040-3-benno.lossin@proton.me>
In-Reply-To: <20250414195928.129040-1-benno.lossin@proton.me>
References: <20250414195928.129040-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 124e4f129cbc0e3b05ca4734ec9e8509fcbb28f0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`lint_reasons` is unstable in Rust 1.80 and earlier, enable it
conditionally in the examples to allow compiling them with older
compilers.

Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/ec494fe686=
b0a97d5b59b5be5a42d3858038ea6a
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/examples/linked_list.rs   | 1 +
 rust/pin-init/examples/mutex.rs         | 1 +
 rust/pin-init/examples/pthread_mutex.rs | 2 ++
 rust/pin-init/examples/static_init.rs   | 1 +
 4 files changed, 5 insertions(+)

diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples=
/linked_list.rs
index 6d7eb0a0ec0d..0bbc7b8d83a1 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -2,6 +2,7 @@
=20
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
=20
 use core::{
     cell::Cell,
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex=
.rs
index 073bb79341d1..3e3630780c96 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -2,6 +2,7 @@
=20
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
 #![allow(clippy::missing_safety_doc)]
=20
 use core::{
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/exampl=
es/pthread_mutex.rs
index 9164298c44c0..f020dd266506 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -3,6 +3,8 @@
 // inspired by https://github.com/nbdd0121/pin-init/blob/trunk/examples/pt=
hread_mutex.rs
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+
 #[cfg(not(windows))]
 mod pthread_mtx {
     #[cfg(feature =3D "alloc")]
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples=
/static_init.rs
index 3487d761aa26..48531413ab94 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -2,6 +2,7 @@
=20
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
=20
 use core::{
     cell::{Cell, UnsafeCell},
--=20
2.48.1


