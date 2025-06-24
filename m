Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2A25BF05;
	Tue, 24 Jun 2025 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803103; cv=none; b=OXYbczzy+uJkhPAl3v49zXQuAtDklaOS4YbkY2u+uriMSU10MnMPXu1Nd6Q5wOlfpMs5YAXqEoDq2YNDHrdFhI8VY7mRQ+LL6ZehkN0oQYulfxuDL7ERNBRljd+UvHtFZxq4EJ+5MRfBB86bURDFYwqGHIR1O3L0opjdZnySIyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803103; c=relaxed/simple;
	bh=YPpQN+Ft5ii+z9LN9DxUYct6G7gy1L7BlJzPkvs+pa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTT5UM5i41KyCsoQftz+9LvOLpRD/sJbFoutpYcoAtmyr4hDuCHArCwJ9xXs/eMNY+g9f53kBjYiBiGMFOhL9lGQtiS8cBLDCP9+T/jdH/l2k8kGcAmuhytH6HVxWenckeljYB3Pa7XHEvq349Y7Mu78ppxY6MNHbif2EZIcy50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtyLBy+L; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtyLBy+L"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234b440afa7so12699975ad.0;
        Tue, 24 Jun 2025 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803101; x=1751407901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZlCvx1CGiBR7gpIxHEH/qkJGdg3V+G7iQKh210683E=;
        b=FtyLBy+LGSsZkUOaUl1eef4MfPGwPg2FvGCMXyUQ2HYRq0AxBlT82Pp7bGl4kuU183
         rJkFfp8mKFMrhg4DtkDKZItdFGNqPkm6uOeCAlcYYa9G+wd8Q3ni7Jw1Py4g/FwegDHC
         pX9agmggrbVyJXjFnnEX03Vpli8YuepCCMLWf/q1ce2mTJHqCb7khdKBLlYkFw9YqWEl
         zwoWu8wfyDMvOiQ9B3feWQebiXkZ5s2djeBqwTMdQOGStpAn8HaaKkrAvJ4ikN7InWiT
         oOG2tk6dSF7Cj64DDUKtL7L9Nk6drq+BVaHKOl7mUtPuKqsFir57/pwpVQnU7ZH+XPAY
         Lcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803101; x=1751407901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZlCvx1CGiBR7gpIxHEH/qkJGdg3V+G7iQKh210683E=;
        b=BnUsgLGE2SPA41/uaoGpOGtgqX9SbUri7o2bBOpYiB4eHForvwFLfZGo8kufNczeOY
         Sgw0oQlF7iEFM18nQkJnZO+TvoNfDDEX9IYOLBLOhuZREECPddXOcnkvu0bgVhJXGBNR
         ZgMbZhQqC83RlGxt2jCSA3CHtwtAainPq3UJzNPxrOmkc1XF8LqXJz2RiWPrGpKJm2U3
         TZODzg2Eu+TrI3AgOIDHE+lYDia1P5BaJBZxjLLfxkrZxsFGxEYKynzu3G9/sdu3avMa
         rOVAeEcMhvRNnOEzZfbmvkXG43TESsavUrPpZXZ2MAqv5Rr5ebYOpKQzf6MgBjBBhj9n
         nJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwRbIfDfECT+EZQWx8dZ/WWnKmsLpw4SwN1DLZx3EdNAZmd+QkJJNtuLxeQ0DOrv5aJV9UNoOw52TyD8IHLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFq6LwMAxWxkVFdsRtA4MWQQlho3yCkh+0JrRcaJNs8qBq8lt
	DIuyGrasTiIlq5Nu1Z1iYGM6cB7/svmpLTCOTHpSLTfQTOwGXIDzqXtozigkdgb1
X-Gm-Gg: ASbGncu1vB2EZdsmBAjpp4F3VPWCE29f6yx6GpFF/CxvUoeXpk4MKsAtWJZRHQy+4PA
	Q1srlfWLKyEe6vy5gt41tp6BO96kH2GonPWNyoRNuZVo9g0zau5MzfiZFMkkX37q/mjVa7dIjCI
	LoWqwp17I0eB0mzNM/9BfABVlKkkY8Tyii0v5mkr04cX3QRXFkLIpZp86+LvTocA1awDfyor638
	a1RHRuuB7vIwPvCLj7j7+PfqLFXReT6wMQvgrSkO/zUy4daie1cfby18rsr7Swjw5VUOqdVli2L
	MO4NnPBCmRkKXLEy3vrw2H3JBjj1SXjqCywrtITzERKrDhrUj7d7oJxe9bx6H4YRu8Aj5pXaHIa
	DuBoRDW4pjoAerxBnJjbPkyCfsVubF5ij7RDE
X-Google-Smtp-Source: AGHT+IEbmYtniKHMhkflwBj9MjSeO29aJCWX2mEvIk6KM9I9b4UHYOZVqVk9S+c5+SdXbRQY80QERQ==
X-Received: by 2002:a17:903:198b:b0:233:ab04:27a with SMTP id d9443c01a7336-23824094ce2mr16400005ad.53.1750803101519;
        Tue, 24 Jun 2025 15:11:41 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:41 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Tue, 24 Jun 2025 15:10:42 -0700
Subject: [PATCH 4/5] rust: percpu: Add pin-hole optimizations for numerics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
In-Reply-To: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=8125;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=YPpQN+Ft5ii+z9LN9DxUYct6G7gy1L7BlJzPkvs+pa4=;
 b=72RLOn49lWvHD5dQo1lgVE6C04np3Nahgwl+XN/0/nxjN+3p+Qplvw1K9y82XK52dWg0C2OKr
 PpCyjPq8zViBVyeVjLEG/ASI20aH/vtoMvdllAXAaTrbYHwk+l5t3qu
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
optimized to save an instruction by avoiding having to compute
`this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
than

    u64 *x_ptr = this_cpu_ptr(&x);
    *x_ptr += 5;

the implementation of `this_cpu_add` is clever enough to make use of the
fact that per-CPU variables are implemented on x86 via segment
registers, and so we can use only a single instruction (where we assume
`&x` is already in `rax`)

    add gs:[rax], 5

Add this optimization via a `PerCpuNumeric` type to enable code-reuse
between `DynamicPerCpu` and `StaticPerCpu`.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 lib/percpu_test_rust.rs       |  36 +++++++++++++
 rust/kernel/percpu.rs         |   1 +
 rust/kernel/percpu/numeric.rs | 117 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)

diff --git a/lib/percpu_test_rust.rs b/lib/percpu_test_rust.rs
index a9652e6ece08..114015435a85 100644
--- a/lib/percpu_test_rust.rs
+++ b/lib/percpu_test_rust.rs
@@ -25,6 +25,26 @@
 define_per_cpu!(PERCPU: i64 = 0);
 define_per_cpu!(UPERCPU: u64 = 0);
 
+macro_rules! make_optimization_test {
+    ($ty:ty) => {
+        let mut test: DynamicPerCpu<$ty> = DynamicPerCpu::new(GFP_KERNEL).unwrap();
+        {
+            let _ = CpuGuard::new();
+            // SAFETY: No other usage of `test`
+            unsafe { test.get(CpuGuard::new()) }.with(|val: &mut $ty| *val = 10);
+            test.num().add(1);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 11));
+            test.num().add(10);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 21));
+            test.num().sub(5);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 16));
+        }
+    };
+}
+
 impl kernel::Module for PerCpuTestModule {
     fn init(_module: &'static ThisModule) -> Result<Self, Error> {
         pr_info!("rust percpu test start\n");
@@ -94,6 +114,22 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
 
         pr_info!("rust dynamic percpu test done\n");
 
+        pr_info!("rust numeric optimizations test start\n");
+
+        make_optimization_test!(u8);
+        make_optimization_test!(u16);
+        make_optimization_test!(u32);
+        make_optimization_test!(u64);
+        make_optimization_test!(usize);
+
+        make_optimization_test!(i8);
+        make_optimization_test!(i16);
+        make_optimization_test!(i32);
+        make_optimization_test!(i64);
+        make_optimization_test!(isize);
+
+        pr_info!("rust numeric optimizations test done\n");
+
         // Return Err to unload the module
         Result::Err(EINVAL)
     }
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index a912f74349e0..9659bff2d889 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -2,6 +2,7 @@
 //! This module contains abstractions for creating and using per-CPU variables from Rust.
 //! See the define_per_cpu! macro and the PerCpu<T> type.
 pub mod cpu_guard;
+pub mod numeric;
 
 use bindings::{alloc_percpu, free_percpu};
 
diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
new file mode 100644
index 000000000000..e4008f872af1
--- /dev/null
+++ b/rust/kernel/percpu/numeric.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Pin-hole optimizations for PerCpu<T> where T is a numeric type.
+
+use crate::percpu::*;
+use core::arch::asm;
+
+/// Represents a per-CPU variable that can be manipulated with machine-intrinsic numeric
+/// operations.
+pub struct PerCpuNumeric<'a, T> {
+    ptr: &'a PerCpuPtr<T>,
+}
+
+macro_rules! impl_ops {
+    ($ty:ty, $reg:tt) => {
+        impl DynamicPerCpu<$ty> {
+            /// Returns a `PerCpuNumeric` that can be used to manipulate the underlying per-CPU variable.
+            pub fn num(&self) -> PerCpuNumeric<'_, $ty> {
+                PerCpuNumeric { ptr: &self.alloc.0 }
+            }
+        }
+        impl StaticPerCpu<$ty> {
+            /// Returns a `PerCpuNumeric` that can be used to manipulate the underlying per-CPU variable.
+            pub fn num(&self) -> PerCpuNumeric<'_, $ty> {
+                PerCpuNumeric { ptr: &self.0 }
+            }
+        }
+
+        impl PerCpuNumeric<'_, $ty> {
+            /// Adds `rhs` to the per-CPU variable.
+            pub fn add(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
+                unsafe {
+                    asm!(
+                        concat!("add gs:[{off}], {val:", $reg, "}"),
+                        off = in(reg) self.ptr.0 as *mut $ty,
+                        val = in(reg) rhs,
+                    );
+                }
+            }
+        }
+        impl PerCpuNumeric<'_, $ty> {
+            /// Subtracts `rhs` from the per-CPU variable.
+            pub fn sub(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
+                unsafe {
+                    asm!(
+                        concat!("sub gs:[{off}], {val:", $reg, "}"),
+                        off = in(reg) self.ptr.0 as *mut $ty,
+                        val = in(reg) rhs,
+                    );
+                }
+            }
+        }
+    };
+}
+
+macro_rules! impl_ops_byte {
+    ($ty:ty) => {
+        impl DynamicPerCpu<$ty> {
+            /// Returns a `PerCpuNumeric` that can be used to manipulate the underlying per-CPU
+            /// variable.
+            pub fn num(&self) -> PerCpuNumeric<'_, $ty> {
+                PerCpuNumeric { ptr: &self.alloc.0 }
+            }
+        }
+        impl StaticPerCpu<$ty> {
+            /// Returns a `PerCpuNumeric` that can be used to manipulate the underlying per-CPU
+            /// variable.
+            pub fn num(&self) -> PerCpuNumeric<'_, $ty> {
+                PerCpuNumeric { ptr: &self.0 }
+            }
+        }
+
+        impl PerCpuNumeric<'_, $ty> {
+            /// Adds `rhs` to the per-CPU variable.
+            pub fn add(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
+                unsafe {
+                    asm!(
+                        concat!("add gs:[{off}], {val}"),
+                        off = in(reg) self.ptr.0 as *mut $ty,
+                        val = in(reg_byte) rhs,
+                    );
+                }
+            }
+        }
+        impl PerCpuNumeric<'_, $ty> {
+            /// Subtracts `rhs` from the per-CPU variable.
+            pub fn sub(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
+                unsafe {
+                    asm!(
+                        concat!("sub gs:[{off}], {val}"),
+                        off = in(reg) self.ptr.0 as *mut $ty,
+                        val = in(reg_byte) rhs,
+                    );
+                }
+            }
+        }
+    };
+}
+
+impl_ops_byte!(i8);
+impl_ops!(i16, "x");
+impl_ops!(i32, "e");
+impl_ops!(i64, "r");
+impl_ops!(isize, "r");
+
+impl_ops_byte!(u8);
+impl_ops!(u16, "x");
+impl_ops!(u32, "e");
+impl_ops!(u64, "r");
+impl_ops!(usize, "r");

-- 
2.34.1

