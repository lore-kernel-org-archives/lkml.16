Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D058A31;
	Sat,  7 Jun 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298076; cv=none; b=FqTbXbIJL4DqAaVJVn4UwVDh+LhgzH/4I8Ipabam+XOBL8oNPrT0SNZURErs/JkNf4Fh4H/J2DGgn2DkeqbXKSDnO/DF2ZsCq1l5ySXS3b9Yqwk1VZvam/4xN1yHoGmPPHZZ09wMU7ecWBeuJBmu07eFKXg1ICbWC3uTZMVe0E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298076; c=relaxed/simple;
	bh=hWIHDYZlo+TxrAFSAAxaeABB8dsvBETnveG9vkSkrH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLr5OljPiqnbX6C9Ao5WlUteWL3x9Fyzt2XrAoePwooh9oZsSsdZwUWKAgKlgOgG92pAeZE91cqg7c4dn7tM7BgZi8kZs5XOL7bzFftpdGQwz2m7xNQTAp1U7TVhq1T3f52SF+oGSxXdAKKDs61BONDcJvqjjTwSk7dOJu5I6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZrw3cNU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZrw3cNU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a528243636so1657975f8f.3;
        Sat, 07 Jun 2025 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749298072; x=1749902872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59Q3SK7XyIYNXuzgz58DhQfTbMyEnTcQg5z5xjQeKdk=;
        b=EZrw3cNUw4ScAB79UOI8rZlEfTdSrSCxPWg9kg7TS5QD+D6AabYC7Su8e+J1N5e6vH
         XPbQebLG+S8BjiwOVBhtvSaS9EjKjouyspim3jVk1PXshMxDlh75TeJjpZ6HXLA6aZhS
         vGIMfuwgFt6CYl05I9G4JOtCSrA2vw9Gv4EhQgiOIMsEYg9QBtGfwibXCR8BGKeP7FFk
         AIRb6xkSvQQkov7HRyoDKdaRi+uN2G0nuq7vEjcUWKYcTw3Zk9mfqm6knAmrMmK0Kb7d
         GERzRPUJpyBRA7Bm2ktsDLU0D3geNxkH/RVhjNRF9DKBY2gle/+cl6kwI0hNyHO8ZDK2
         7QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749298072; x=1749902872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59Q3SK7XyIYNXuzgz58DhQfTbMyEnTcQg5z5xjQeKdk=;
        b=GW3bPBzriR/bCbCtK5Hp30WOAjsSqC07ZY5SQmd8EgamN4onz8SVDZ/l3U7qyAf8r9
         B1twYUTxN0Z9rGHDy5S+RFvMbo9z60E+xDZaChBZvz0OUCXKBafJbvn18URzK8TFIbJF
         dkQq0kbYRQ2cClAzW86YEagoMpqK6wGRgOm0LuKTAEGbAqKAOXxhTQE1Xd/K+M0muwdT
         psz8Z2E9k/NNq+QqheEm3TbYnHxf08QnXn+vpkMyceEJS0eg1+8IkU814GedcezyhaZT
         TAqxtDRBGkv8gcih+EJsL8YnMraTt24fvIS7bqcQ3uMX4TNp3o9cpWB9FMCflCJJ99aC
         9FYw==
X-Forwarded-Encrypted: i=1; AJvYcCXItT+x0QyGp5gKn+YAv6ZcuGtQPD4t0Pv1lA0dbffzONP8TA4rxSAGN5mr9p3Wfw+oXNwSbY7nQV/ur36ArNw=@vger.kernel.org, AJvYcCXxDiZWPLO31BD9H4mzGMF+WsG7ujyij5wM7pWGw4wmafc35IJ7kyM11hAi/TIWu2l4Xl6wj7vP5AzGg04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFyp6Q5LRmwbajeNCb4DTeS/rTxhPqty966Hem1+9UC5Ci+n3
	bQ4ufK6HeF9BQ6RbSUCLcMeCWhndMiqIHf33/q88GTG3j9v5jtnAYcFDR0uSQg==
X-Gm-Gg: ASbGncs6NdwEX0raoYxjV+F0DSYsuCEd6ELa3JMrE4iJ0raVX+88mIuW4BeVuEt0uaU
	zrNnuUpKBhyvEazv7GsNN+VGNpeDDUuPb9XEGM/L64+GfY2hMsegaOtga1d/s7tRZ4jOGYfRPG9
	hXqT9P1PZR9ewyl4iDxa3Ntn5ynrDPWhNPSFk/qi94Oo+LxLV2OqJt39wcBubxuZtbxDTTpMiom
	OF5LZXoceP+oYB1BAMe+yVc8VmXuW8K4cA/gF1a/yQ5MD84G1dhBhA/8F3Kl9v57OHUJqDQM96C
	QvBGh4VqfbdgSaiBP0Pdb7bN+Ko75N290xXWgfrItwaKaXhj9+w=
X-Google-Smtp-Source: AGHT+IHDYKgtPx8HblRV7SW1vLFu4HmsgrjaqnaPc/Pqi3Ejuh0P5+AzwSEtyAwrncwTLZ1PdJ3UWQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a5319b64b0mr4458048f8f.41.1749298072138;
        Sat, 07 Jun 2025 05:07:52 -0700 (PDT)
Received: from [10.0.1.160] ([2001:871:22a:3372::171c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm4538965f8f.91.2025.06.07.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 05:07:51 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 07 Jun 2025 14:07:30 +0200
Subject: [PATCH v5 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250607-b4-rust_miscdevice_registrationdata-v5-1-b77b5b7aab5b@gmail.com>
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
In-Reply-To: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Benno Lossin <lossin@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749298070; l=3282;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=hWIHDYZlo+TxrAFSAAxaeABB8dsvBETnveG9vkSkrH4=;
 b=KoyXDB+HIec1iDCfMwXAN0FbQbGzUvy4r4Q1GrNxfgvu2ktDbjfZ1CT/bDFdlc6hJMuyrU5L4
 m20uJ/GyPblCChwE3gnnOBGn37l9NRtodcEIlEmzZnJv4UVVQc9/rbb
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Moves the implementation for `pin-init` from an associated function
to the trait function of the `Wrapper` trait and extends the
implementation to support pin-initializers with error types.

Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
`pin-init` function. This is currently the only usage in the kernel.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/revocable.rs |  2 ++
 rust/kernel/types.rs     | 25 +++++++++++++------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b279b01f90b02997492aa4880d84f..4db68ea2207ebafcc09d082fdc1e281f31846a38 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -5,6 +5,8 @@
 //! The [`Revocable`] type wraps other types and allows access to them to be revoked. The existence
 //! of a [`RevocableGuard`] ensures that objects remain valid.
 
+use pin_init::Wrapper;
+
 use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
 use core::{
     marker::PhantomData,
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 86562e738eac85480a048041e979335b81c5e3c9..7ab70d5f76099c3442dce5b02c6b226fc74c851e 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -9,7 +9,7 @@
     ops::{Deref, DerefMut},
     ptr::NonNull,
 };
-use pin_init::{PinInit, Zeroable};
+use pin_init::{PinInit, Wrapper, Zeroable};
 
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
@@ -345,17 +345,6 @@ pub const fn uninit() -> Self {
         }
     }
 
-    /// Create an opaque pin-initializer from the given pin-initializer.
-    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
-        Self::ffi_init(|ptr: *mut T| {
-            // SAFETY:
-            //   - `ptr` is a valid pointer to uninitialized memory,
-            //   - `slot` is not accessed on error; the call is infallible,
-            //   - `slot` is pinned in memory.
-            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
-        })
-    }
-
     /// Creates a pin-initializer from the given initializer closure.
     ///
     /// The returned initializer calls the given closure with the pointer to the inner `T` of this
@@ -406,6 +395,18 @@ pub const fn raw_get(this: *const Self) -> *mut T {
         UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
 }
+impl<T> Wrapper<T> for Opaque<T> {
+    /// Create an opaque pin-initializer from the given pin-initializer.
+    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        Self::try_ffi_init(|ptr: *mut T| {
+            // SAFETY:
+            //   - `ptr` is a valid pointer to uninitialized memory,
+            //   - `slot` is not accessed on error,
+            //   - `slot` is pinned in memory.
+            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
+        })
+    }
+}
 
 /// Types that are _always_ reference counted.
 ///

-- 
2.49.0

