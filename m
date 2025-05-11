Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6825B1EF;
	Sun, 11 May 2025 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987718; cv=none; b=fuy4NEhJ7jmdxloaOzk4PGdyfahC+Ex5yrdWwen2RauPDmmFJQXc2q1npRZMcPKvZgmAfyeGymHTc4+SHl/izgW9siinN8w+4DndNpuuNs8tSOe5QsX3IrTLMlk80c6Smzcrw70hN3E9qGjLu3mnNI17BVfi/AFfc4VrD5mQeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987718; c=relaxed/simple;
	bh=OgwyE3W4j5m9tlImAIMzZFHkRczAKc1EPWHJolrN6PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubCZHBzX1qHvgSaTsDVm3KCYzbeEmpiIJ/J47qLQRcbop4HrwE0ljtLtTNZGgsymURaFgXc6f5+RiuM4O41XLrJCakqvjlEOVNKQv8sSlD8yqqduXd99IDXBqj3oy+kOrsKJdhTAxiUrQlf5HbIG5nilFlpGfVo0/2WJ44RjPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTyEeUHP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTyEeUHP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so2560435f8f.1;
        Sun, 11 May 2025 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746987714; x=1747592514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2gCa+XcfQ3b3bjRPwVH7s9yFYkkubMVDYMxKJoALEk=;
        b=RTyEeUHPjb9WXdPTIhkm7G8KhlAsM+ghzIgPcstbUwROdcSnbfSqtAH/Jf8i4ajn1W
         KbyzV1m3PNH/btunV8S3ao5nxjIDD+alRV6OGOz+PmwJjGv6t7nNKwAk7MVvz7SFV9yj
         F4tTvOlCBWQBZoWUsVO+f85ErOQ/6bbSafVLcLlexLrNlAkqIiI3iIbqbeyEmvDnYKfS
         BijLDEfOMvkvwxUBhuai59xmVncg3wjg2tfsLkV4mcZ9OonWv54wnZ2EHtVn0SQfRirz
         MLeJq74E2dBLacy2z7+YE9cRKFqUBJOG0B7/oEP5OB+MI+wY10sEydxUg96W+yNVAQcj
         imTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746987714; x=1747592514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2gCa+XcfQ3b3bjRPwVH7s9yFYkkubMVDYMxKJoALEk=;
        b=ucJtSTDhGlQpl0J9PBTzB1BCQ9CcBB8tYWWTxoGDyI3Bh+PAix8+PGsyU2alIP2p+w
         6DysOlCpsoYbPAgNZm8wTYkosdC6F+7axTI6DbiKh9e2mZ75pjuIBeJZpshEPEqZoozJ
         hk+iDcfpXYaxk3YS12L9NbhQePO4J7xVkbM2R1PHyAoL8HjH1v2iHPi5soYHdLEW31KX
         j5esdrAiTLjE1bYHmFytlFvMK3SzhxFgzDbX4MQ7gr6T5TINIBaeCM2tNlHR8GFEvw5O
         lQuGmD1rZCp42ynr3Akh5PZG5rPMY7+HctL+8jhhC08/h+YN5dk/pdWSCX2AA4PAWrlh
         8RzA==
X-Forwarded-Encrypted: i=1; AJvYcCV3qLmVv+sq17nB/0lRWON6udyigGUpFyjpcKmuPER1d5aPqOhoR2cT9OCcRSk345ZWtbO5Q6kyGVLPAzfgQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydL6kn0irF6iXLnT45uu4BVfAvO1jojg2wDPRf8JbRU8YPNqj1
	7suG7igMk0C032WNRwgCIybGQ1r4XCzUsL1jL9aPXH9BJw5ajEiD
X-Gm-Gg: ASbGnctQOHT4SzK7FgEDnSKe3DLkUiJXewwfqCWOlBa3fadnLHDjNE74WO1Gu75XAG1
	IxK5K7CLm/BRenXWyqphwlKmJA/uaXJNZ/XO+wOrqMwAhjiE4BdERUzr68F3rpwqzbsz3gTSQOo
	xLrD5jkxqPhIg1xrX1b67rSKjrbxDH02s7z+43dMaeXRPPRvtSpWzTbqCNW7zVsDYJIV/Kzam33
	XNWDs8iWquYGd+X8foZmQfw10YHYzFoZKL0e98xNc6UxQSyLj0gZYODFxkI3WkffahQvEI4Wyf2
	AVLVHzMxuYwZ6IgWuu/6lAv/4ikUpN4xSXKeS7U=
X-Google-Smtp-Source: AGHT+IFk4orcZxm8m6VOZ/CaABjz8qCDMIPUSwoACoqLJ5T45mVs4hLOHnXTk18hBisaLHChxoUInw==
X-Received: by 2002:a05:6000:3113:b0:3a0:88e4:3d2f with SMTP id ffacd0b85a97d-3a1f643acc9mr8479425f8f.5.1746987714295;
        Sun, 11 May 2025 11:21:54 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm100418495e9.4.2025.05.11.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:21:53 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 11 May 2025 20:21:39 +0200
Subject: [PATCH v4 2/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com>
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746987711; l=3333;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=OgwyE3W4j5m9tlImAIMzZFHkRczAKc1EPWHJolrN6PY=;
 b=bhSblH/q4GVo8aFGdyfkctXedJwqvUEKwxXtKvw7mYUMyusB+BYFVfKxP/df4T7SGwxE9LM3r
 w7gxr2VKBfECWarqiT1d+DI17735COPXzjLaUrO7pIKWqZYVUjCZksm
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

