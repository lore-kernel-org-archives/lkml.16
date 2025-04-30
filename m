Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828EE2E401;
	Wed, 30 Apr 2025 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002203; cv=none; b=fpEhCc3xuefIR2UAe039bFlZ7VUKIbDHwpbMy4iHqKkgxsugiFSG4pU4+c6Nvf5lX2wTbGKfbRwMFDnrD9PmE1tDA74NaDLHDVkphbgXnj/d6H0lIeBwLR9whLNjem9uxNLOAX5BbRWyPkZNWDGjXmi2a2yb0mc1aQ7JOJU5dVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002203; c=relaxed/simple;
	bh=cVe8kuvlCNbyLI9zMHSiLyFxdXifsYArcpk8G7n9O2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJ20m/pRSCuxG8rSiUqIpU6kAQeu4+XitH5AuSasWfQVbGJNpAe0dqYqGKdJDk44cLOEaQIm6zf9awMiTYWD/v63UO77D8EsOmFZu+k2pBwc81Kmaz/+et2FeQZtBXiUnlL6z1hdepRAuZJAksM4P5JsW/UaDqzsXJI7rf/b0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIMTaBXi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIMTaBXi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so13102426a12.0;
        Wed, 30 Apr 2025 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746002200; x=1746607000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgNeM8GMoi8jL54+pCv76QajxazqTJJs9v1rfzlVu8k=;
        b=eIMTaBXiON6tJguvRY/GwwcK9gjXqLzSOfSkGEqOn05M/N8rcrRtODK7mYTzPt+3Ct
         Q565sDV23HaPWYGyPd+4qvIQcYh2OIxNr2VGiYFoNGUouWNx+OqMJbnAkxXfRQk3+mxW
         ohyUVDyyadsCdou3mpQxN4f1Hgz+APYK2Vu0fgqCAIfS9vu6todWeVyYxgZIXfO/l9zm
         PhvIz4v2brrNNxMuWm6vXCmYofY2FYwjobqXdtOQdaj6L5nd5L4L5SYOHRnUdeXOcKNu
         WRO5T3GXSEdOqD5G7ZPBbUU1zHf6jtgnwyJ97WuYEULTFXUld5dbcCJVRdrFjeiq0Cjd
         flAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002200; x=1746607000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgNeM8GMoi8jL54+pCv76QajxazqTJJs9v1rfzlVu8k=;
        b=qm1o1cWkzy0FW/8Cj19UiU8AtOYuyn3Wq8/vvuvkVjv1axqY+Sq2VNTu5QnfABvP3Z
         VvIpVunNMkXFDowgUKtr+jCBjqIaIGC816eRl14lbtrkURXcAMyQONWhM9v6dzpwft7L
         jbIQcpeGG90AotOiA8Ad/sxG8ahJxlt8YomlKGNwiUjHEDDKNQ592x2rVYf0lChOZxFs
         IAtP3JjQUIl1U/JeiwSd3WHKhsE2bWs0F0X5nmbE7dmiwcMNpLo10qUlWkmCRq3SqcZh
         Yn0oghgf31ck5CBTXXw3+tZ4yDOYaDxOWU9D9sfcSLsr9VdXE6TcIeKS3jGC6frFjI3H
         HMxg==
X-Forwarded-Encrypted: i=1; AJvYcCWw/xgklJYkl4VGVkRS3Z9YVwA579wteBTcfjLLXT5bUpPVvjlTAXJBp2PWWSsYVeoPQTGcnotLSSWMMxopFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2CMn1yhUL1Kp0OrIGMSC0nKRdpl2Mxmhxvns8ytsKSW8IGEE
	AIXsnaunXTdZl4mcb3lHNGu/AalngmIf6F1FjRiuc/fTDk1dS6+Y1rmR+QQiAVc=
X-Gm-Gg: ASbGncuK6tcI5J/2bft/zEF0zstMtE+Vp63a+v+fv9iydyS8xMF9JeB6OXSvY5vAxja
	k1cO0wsAEJUldQzI/NJSUXv9hqIJUWp1D+gIhZw1p9dz35fQ8vpxNGujLpS6lH+kOtALucNlkkp
	Qs8Msf3ch7Hl2kcWB3wyfH2XZsV+94oPPDzyeII8nK5NpJdOYDt4Mj1qQ26Rcw8i2eSODXhVQby
	SUvyFLpo3OdgWcGdEmdlkIb4CegPQmZgoCwmFkXCMssIdEhNuFLUdDFtbS/NVq4ICQg0cz5ZpOM
	xJYVbob9rLPw7+IsjJAwD0rz9DRQHSFBi5sB4zLSIZFjLW7xFkrp
X-Google-Smtp-Source: AGHT+IEE8cW3+kZaE37viMlIBGstOxXYMmzeK7yDZP9y1qVranwCRAo0KQPq5kMvXsX1cwz/asHLnA==
X-Received: by 2002:a05:6402:34d5:b0:5eb:534e:1c6c with SMTP id 4fb4d7f45d1cf-5f89b34b02cmr1908500a12.20.1746002199300;
        Wed, 30 Apr 2025 01:36:39 -0700 (PDT)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6424sm8653721a12.42.2025.04.30.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:36:38 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Wed, 30 Apr 2025 10:36:12 +0200
Subject: [PATCH v2 2/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-rust_unsafe_pinned-v2-2-fc8617a74024@gmail.com>
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746002196; l=3238;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=cVe8kuvlCNbyLI9zMHSiLyFxdXifsYArcpk8G7n9O2w=;
 b=xXZxc2yj/vgoE9aPMSRDfqsD1tEiutaCy1tMeJEfx+ubuzgpfqNZh6DvEl/jfabTleejUcdKW
 JhEBNiasT9BCCUuuTTchmV8qvyGBKbrjwOB3gLXDEPLtSEutF20nS4C
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Moves the implementation for `pin-init` from an associated function
to the trait function of the `Wrapper` trait and extends the
implementation to support pin-initializers with error types.

This allows to declare functions that are generic over `Wrapper`
types.

Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
`pin-init` function. This is currently the only usage in the kernel.

Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
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
index 705f420fdfbc4a576de1c4546578f2f04cdf615e..f06e8720e012102e5c41e79fd97b0607e927d71c 100644
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
@@ -332,17 +332,6 @@ pub const fn uninit() -> Self {
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
@@ -393,6 +382,18 @@ pub const fn raw_get(this: *const Self) -> *mut T {
         UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
 }
+impl<T> Wrapper<T> for Opaque<T> {
+    /// Create an opaque pin-initializer from the given pin-initializer.
+    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        Self::try_ffi_init(|ptr: *mut T| {
+            // SAFETY:
+            //   - `ptr` is a valid pointer to uninitialized memory,
+            //   - `slot` is not accessed on error; the call is infallible,
+            //   - `slot` is pinned in memory.
+            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
+        })
+    }
+}
 
 /// Types that are _always_ reference counted.
 ///

-- 
2.49.0

