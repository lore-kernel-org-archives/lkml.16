Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFFB221D8B;
	Sat, 10 May 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869591; cv=none; b=Tl5vH2QcIW1vRABkiuwtJE0ciUJBHbgLNV5A/HBORlo+LtpImjzVgB9cY4ufY5AsPxShpa+KCQUbA1HJc57qwrqi0iwt58SQW2vmcUnJ87yDaNsBB2vqu+6F7oVj6Q5jGqPNhu9IudVoafw/s2OyCE89OzsD7WeAyUd6HqyWv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869591; c=relaxed/simple;
	bh=OgwyE3W4j5m9tlImAIMzZFHkRczAKc1EPWHJolrN6PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEW4UKD2v3CLqKpOFqZ6D6ndTSRgt8uqpXs/XSdsSJvzXmTOFZSRbPAoApMyvOr5SetoWvfrh6spnfrJAMqcf9LPO86ikdsqoAFpLIXwakkV5Rg/J28yYBbipjk8WMDU/Wkvcr9+4lVQd6OGA4WiXYHPGaRqKR9Bx4Vfxr+m7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+1hr038; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+1hr038"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so20371715e9.2;
        Sat, 10 May 2025 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869588; x=1747474388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2gCa+XcfQ3b3bjRPwVH7s9yFYkkubMVDYMxKJoALEk=;
        b=F+1hr038QLvFRGU4V+JGYz7jJdE6Q2FYk37SF8AbdZN6cXV+1Eu4HaG+esOgLNIRXO
         lY73L5rd72Yif9zZ7oEQxNkVHZV5w1bhd7FudZTcYm6NjedDncxgttqaNDk+UOlRMiL9
         AHe8oJvTykvboUDj4D8MDDTjNH25ckapnkDIM9KoDBKS857YkXyi313s+y9LA8GRvrTQ
         5HB/v7xTlTkRS9Lxxaq4IYC+ePfpfqNIXTpKBOKDjzVuOQ6Fb/Ro0bQvh7bWOUYas988
         K88HxiPuBP518NOO0hZcuJ+DZZ3svPqGMYY3KjzjpC3R6ZyD2fxgQoo+NZS/L/m/y9sG
         cNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869588; x=1747474388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2gCa+XcfQ3b3bjRPwVH7s9yFYkkubMVDYMxKJoALEk=;
        b=qlLz7ozcNbtloXnhgPEdpbokbkXAIX8jGXF+gSXC09FyivcbXCv4rmZwDnVs8NV24o
         bEOzI3Wio2Mg4cQMx4k1Yi2b7SGKH020PJxG8PtiuVvDwYpCyYBYZEFgdNZhQRruaPga
         cipGJ2aebXSLXOHXHDswqC8niq87Mkz4rscSjwew1Pm9ZiSRGLzwx1f/uF0sNRE++EEV
         ALMCivztI9rFhp01/DLHgGrg8CjYWvEM2CDulBL66Xtvw2/bRzpQAcsOtdqNZuNCpL7O
         C1sx1w1uzrLSZWaKX8rBcpHyGv5yqh/UFcUg+fKZtt0gbizFFcp/p93cOlLwFzaa2bry
         DaLw==
X-Forwarded-Encrypted: i=1; AJvYcCWgg7pwHF9l1aA1QR2FeRqG6jjC/QQXCq+ncE7yEAEc1/y3ljDzHRH/tm50rEGewP3aSxUfGdEKG/HxFzxQ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3mB548nH5idUML2VXgTPPY4QXzsD8CH+CkUjMLDtvqgutagkN
	EBbUCTOi0ubon2NZGHhNchDu/qtoA/DeYAAAV1nhy+Cyy9xNYr6j95ERS3LC
X-Gm-Gg: ASbGnctXwIXbUfusfNhoFvz3ATKqk0QMXjRUIIjRQL8zApeDUoLv9WF+3a2p8vZ5eQg
	ECFLwIak2KU5iCdVWq4AhE2St0RMFS11CIqNyO24hRtg//c40hZsQN9Ow4Owi3x3SPsr+YdtrGJ
	H9pwrpfQGAve5Zz9tSN/awSRLd8BjRc1ZlSKBePAHjLSPqXyeu34rXzzCAPJHy04W+XSL3zAMtE
	apHrpt5smXcg5hGjzHMxzyyjZym2/giNBQtWgbEFVdw4hkW81Z9RbkW6VGoC4bumy6s3ZoXOs4O
	cjYWAPh64n8bUMAsy/Kx6AkvZdralVph0vtjcSo=
X-Google-Smtp-Source: AGHT+IGCm+4I7ZaGlYHiR2J16ZZQIaYmQgSVd6mmPWOubr1d7yq4g5DXGnEX67rQPLE0Uax9YD4P1g==
X-Received: by 2002:a05:6000:2dc6:b0:3a1:f537:2206 with SMTP id ffacd0b85a97d-3a1f6488450mr5070543f8f.45.1746869588131;
        Sat, 10 May 2025 02:33:08 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm5981485f8f.14.2025.05.10.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:33:07 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 10 May 2025 11:32:27 +0200
Subject: [PATCH v3 2/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250510-rust_unsafe_pinned-v3-2-57ce151123f9@gmail.com>
References: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
In-Reply-To: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746869583; l=3333;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=OgwyE3W4j5m9tlImAIMzZFHkRczAKc1EPWHJolrN6PY=;
 b=fKi+kNNz853y23QUsUt4vMcszaYEaMI/4LXUXy3T0Tur8/tSKH8R36WcSvmAWK+AGJbKB/9Du
 ESDtg4zvXkHAn680z4jVmkiscF2SUb6WO6kRj7jNQmYcKH5VEBT2XqY
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

