Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08682265286;
	Tue, 10 Jun 2025 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587284; cv=none; b=psDOIsHawT7DkRJ4zdFYrkfRa4EGiB7xJq7bdLj6HKj7LAKJQShXk0/8baX7SUU1xMf8wCgcm0LNmG/hSLZrxkqwJ7Y/esID7bxtzJaIjw2tXlF+MuhfcIkzX/+i/WE2hi8NZi1NV7WNSKsO/LLIa+523fCeoaSaU+lSKKqMVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587284; c=relaxed/simple;
	bh=LonEQDkG2vH+/s77vOSwjTPnV9muhPIPy/+YR2PeInA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtF7rPYVulXj6rcRu5CL/XZa+zZr0n94Orcu7eQkTYpksUtKYNN1O+q95Dscd4z2akrd0ITwwupmXSnP2MT8GCN4+Dkicc2guT/sj724bWoIHt8y46BGj5YVnLb5erS81Cq2wkIaqmQcXH6tn2HNYt7aLA/juR12IUB2/ST6xCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaavmk4d; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaavmk4d"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so10154357a12.0;
        Tue, 10 Jun 2025 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749587281; x=1750192081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QkJi5Kb0CSf/rX0SHuPAU2RuViLKIg14a3y6FbAPpQ=;
        b=jaavmk4dsLwo4ar6sf0rTTitPnqykqvw3DHaksWGTpllDDM4BcuZoxhc3phBi1tYZN
         38DMFn2NpEoh4hOFSE3NUxNfH7Qoa2/EGcaiVLfF9iV2qwrCZnqtVw3yqM5gblDHPwly
         aeXEDflD/ahC/PsVPAM86nwt9TneUGt5VR3XeWyDEyT+Z8GRk+OrIoq6boC07T5i139r
         kD7etJLppY3yAARY/1LUbgy77p3P1upmMgxzABRtsGk0EDyNTvNOQnfdvbSt0lDmtDYc
         Zqw8I5ZA0QvlKzBaCtsqgJBuDKpRmDiTDi5Gyn11p7f2eWATmJkURPUMBkWsEfTTyQrZ
         fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749587281; x=1750192081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QkJi5Kb0CSf/rX0SHuPAU2RuViLKIg14a3y6FbAPpQ=;
        b=SYDpgyyF+3ya+32sF635dBrE28eUvLfcLptlnTyPL/6HlcIaXjucycoFtd1MsRkjMY
         YFF1qAi1ttoKeODmUQnc1yEAiXXT/KXKgth3oZKDHNed5ahtVHWaK7IGVfB4lkzqT9B2
         c6gvovKniKC50fLYwzLBjasOygr/dYpMtXutKSilQe9Km9E/B+uJikriSD0QyFhAMhjY
         9NwU6N+v9AGH55HvvNIVFO8D67ULWRYAZBNslLWD77084NjM9o4GqmsYe8oRJjJDZnHu
         G7XWXN0RC1PYT/uEXk4x/CzTWOqcoKOzsn0YjrZymjXt//mhLZSBoHFgcUNYQLRcbFTO
         IvvA==
X-Forwarded-Encrypted: i=1; AJvYcCUcUmVyhOHRYpr4emPPsKQz0KL1fBTN9HKza+l7UMnRLlrKl7JnLKT/gIF0Ox5Bq58tBFz4444IjlpjRnQ=@vger.kernel.org, AJvYcCVkjaLtMA2l9OecT6uYemAQM+uNtLWKlBHIhxs/VJaxoQ9gnGF2vADwdNbfuqbxTQUhLggRxWBUPFjIKKpAi4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbHV1a0L8TyxN2WMy+sgLMXcaGH0QOepoV5Pid/1uLFg32/h4v
	3p46b7dSs8v8y9ZzRFftkjXw/NE8V/q/UgOeGa1eUjFY0XntebAX0MBM
X-Gm-Gg: ASbGnctRBmzy+P7pV7J4B38jamCu7ZOG8ybfGm6HbW5gBynrlbr7y3s9hm0c2NB6Id8
	FNGkKXdf8kwh/hsnN5OCLTPNreVmcaI7TIg7kNReTQ7kYdoWlAuV0Hh4QVp4sYizhTxIwB52lL+
	3Pq9LhPTVSFHewfkGwtZGdqBIez6kfkAIjrIRD/vwS17v5EdAEObWuV95hLuCc6PWgAmIn1Xk95
	Dv0M0Q+fJ7vKZQRtBQzOZjgidd54QScBu9lBdq7CtD3qiDzryxWSB/pzOzfDLlqPFZZlCe9TFtt
	9IGPJjyYShEr2uDaKmHwhkbRJ23i7bCJg+RwJrpWeecgwx1nl3D3Kfko6jbwGPMpPXE777w=
X-Google-Smtp-Source: AGHT+IH6LLm3evehYJR4G83oE8ls7DYPaeOM7N31fBeNBbMGUQgGEnS5QzHJndMSTEmydt5HyfIPjA==
X-Received: by 2002:a05:6402:84e:b0:607:d235:87b1 with SMTP id 4fb4d7f45d1cf-6084e9ee39dmr42953a12.32.1749587281202;
        Tue, 10 Jun 2025 13:28:01 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e67efsm6552678a12.78.2025.06.10.13.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:28:00 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Tue, 10 Jun 2025 22:27:55 +0200
Subject: [PATCH v6 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com>
References: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
In-Reply-To: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749587279; l=3445;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=LonEQDkG2vH+/s77vOSwjTPnV9muhPIPy/+YR2PeInA=;
 b=Kg+Aa/ssFoSotWR2iV0qnoWWo6Gtv1LxbtYwcxwR8aOQSiK4pzMloyIsym0Freg5pqERMDyYk
 wCfS1yVfpQJBqngS5EJW5HyNfcKzwm5PbQu6xGJjZE+m10fblsA//FS
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
This patch is also required for my `UnsafePinned`series. I'm not sure
how this should be handeld (in case both series make it in this cycle).
---
 rust/kernel/revocable.rs |  2 ++
 rust/kernel/types.rs     | 26 ++++++++++++++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index db4aa46bb1216d18868dcbdcb0b7033a757306b1..3d41374a911482385faa93170cd31a703bb0d42d 100644
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
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..3958a5f44d567bbf2ff4e3e891b27c065909431a 100644
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
@@ -353,17 +353,6 @@ pub const fn zeroed() -> Self {
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
@@ -415,6 +404,19 @@ pub const fn raw_get(this: *const Self) -> *mut T {
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
+
 /// Types that are _always_ reference counted.
 ///
 /// It allows such types to define their own custom ref increment and decrement functions.

-- 
2.49.0

