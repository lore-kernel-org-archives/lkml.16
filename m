Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6243148850;
	Fri, 30 May 2025 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638014; cv=none; b=uedwz9AtZZQASWn49wFdGZ4gvblXXQSseOGClDSQUc4skGXiz8/Q8HYZZa26HPeQWOSTU6Wl6Z79X4FhXXQV7j6Umy7O1qxUjW5j9VtB9eWco6WTmPQjGYWVe0k4ygygLMt/nSLwJNr/boRy6gHfWNEq74Uk5RtW1XYXtoNEn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638014; c=relaxed/simple;
	bh=SFRlmYh+6ofBFqIE2RKYxAEB1HsZDn6u6OmpOZY6Ihw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMg8NPjA5XAsEAwlhoWeloqvdOeBz61hTV9floHPsLfwOIaPsj1F6vm56sfC2yZET9XGgxcSwYJftIXJVpMgfE84l0PrvMF5MS7gB3TRzj/Hoy/AaPlE6VU97qXW44mNzJlaFqGkN7u93SFHH0bQd4Dh/F8unn/EXYTJwJ6Zw9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnhT+zWe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnhT+zWe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso19186105e9.2;
        Fri, 30 May 2025 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638011; x=1749242811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXKOxgUXd99UndQ/sdm1iF0yL3wtNosoi9ftAa8VQYM=;
        b=EnhT+zWe8C7R2IOB/W20pva1YgOFdPdpGU1MhIEuWiTh6UUckjsDo8pmk8sC/Yc4BF
         AkLeB4ZaID8tTNxbctf8dBFu4vHK/531okvdfBaz7+OBOkZpBJXPaX/ZpqoLMLohamBT
         HzxvV4+0Zop3GxkKzINPwfBs22ptpssFbv/XiTEfq7vidqnFSlWBaJ8XmLvfDPo1Zdvd
         JgSMvP9EncnXfL0GsTz6COaFXpzQFPU7Ymkdj7VnZzI7mGk+IXnCtpi5rDq/xE9JAi0f
         bs0JGQsJhi/+dAiDx7GLXl1yEnW6v1Hry69Dvey4lw4ZwYx+7QgKJDkyH9r8Hy0taW63
         UULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638011; x=1749242811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXKOxgUXd99UndQ/sdm1iF0yL3wtNosoi9ftAa8VQYM=;
        b=qBEaSoWpxLFDDDwAwHxNgFAyf46GABSI1ucqDe/efaHnjO9vqbQ9MEpScge30P/Akm
         tsDAce2HbhNP20uacIrkuPPlSVZu2lPfkXerNTiGBM6qc5d0I4XEAPnMsfTxgLmJhmNt
         +3dIWH8mMjip9iv3t8p+tLApwVd+kja052Am7Qh1Amm8QlTvpues0UXptOs4h474Tvfs
         qydvH/EHyXWT6GT+NuBra9+GjLnxQOdjyCDzKE+Q6usCn8si4sGHNP/1m1xT9auNwqx6
         Tjn4dSwRxsSpDX0oH9FRNY/a2oYgNoPSIaYaENCx7wHcgubqiWtkTdYxw/RJCrxL7jzp
         67Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU1fNoktrTR1xR0ernNZvaU2TfhyGBNz/1ClkIE/CgDw9sIFk33o77kr6DbmVRlJezu4+yjKJA0KdZmYBBCOLc=@vger.kernel.org, AJvYcCWCDIKHZKtDUR575TMNOWJJv4WDOqxQkUWQl6Ke+mZeRv20oDA0/aSfduv/pFEn/IMyCFkHCH0I/0zDedo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YHa0oDMkjH6IqckJTbw2B4V+ZXGGwOh4I2SPifbc5eZt7rHt
	l21Th2bGlSToqy8Irf51Cic4CYhmyNBWNWIgwO4dc2n9Ybjb+PaSMTMCUO3mwA==
X-Gm-Gg: ASbGncuVYAqMmMUdDgAsqwnI12i2PYf82C/MQGtMv0Ise974klAW5jZU7Hc6j5Gnum2
	k2IBsNQS3l9t6oIDwCkyeyPPTIDE7IxPJbLBkMpOZ4K66mf6Glar+tjctfNv8hYF94HLlaz2t87
	1SGy+a61KtZLUbeFo58P8a0UwdpECRP+yjVg8sSa4uK+QCSApHyH4dzNYHyLHqJEOdBqdnCxgi4
	ZVPIkTXmgAmALIc56Ah9nMq//o9xvB994bJVf721H26zC4t+s66HTHuWfLwJiIZTGUUgkg+FR9P
	y7E3C1Rrq9O7beEIAyz/WrJ/lz2h623vMf0/9AFd
X-Google-Smtp-Source: AGHT+IFi33nyLxjzry9z9CTrFkcpY6FmCNpbJwpsfa5mTciUHelZ8LThn0HAvz3SF98JAu7c2eLYVQ==
X-Received: by 2002:a05:600c:614a:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-450d64f57e7mr48318945e9.16.1748638010779;
        Fri, 30 May 2025 13:46:50 -0700 (PDT)
Received: from [10.0.1.162] ([2001:871:22a:cd68::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450d7fa21e4sm28045405e9.11.2025.05.30.13.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:46:50 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 30 May 2025 22:46:27 +0200
Subject: [PATCH v4 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-b4-rust_miscdevice_registrationdata-v4-1-d313aafd7e59@gmail.com>
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
In-Reply-To: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748638009; l=3233;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=SFRlmYh+6ofBFqIE2RKYxAEB1HsZDn6u6OmpOZY6Ihw=;
 b=7HkNtcPUX0a77Ck8dF9GuCPyQMNpXOibz/MY2IphO2XnWzqHT3kOQU/sn+iooeU9baNQoXQJZ
 Zy15puE48fQCdRx2GvOnuIp9xcfFko5Z06QA0RkFLwAkovy+Z07u4BF
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Moves the implementation for `pin-init` from an associated function
to the trait function of the `Wrapper` trait and extends the
implementation to support pin-initializers with error types.

Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
`pin-init` function. This is currently the only usage in the kernel.

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

