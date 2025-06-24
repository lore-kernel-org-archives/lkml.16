Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99B25B667;
	Tue, 24 Jun 2025 22:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803102; cv=none; b=UBtd3nYlWTMfOn1xOniLu3AbD6ECacdtB6BtUYgZSkIKF5h1YvLv3/Xkt+Exc1HteNBueUpmW8qqoIao7Ddi7WM3dxQGoAAYO7Rx0zezcEKlBftGzqDP25mByrGbPvJtARTaKtBoDr5ZXnzeq9+gcxpkdbuS9JHU8YZhRKyaOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803102; c=relaxed/simple;
	bh=J2wN034E1ANJf8z7zTgfPajB+DTsr36981US4k79sBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqtujbTtoAIPWj/TKVgD3eGaKwSW1BqdJCijomUyTzA1RboB1hNDhJgDDPGhhQb1PWEd2Xi3vXNPmy8aMOKZVDgGbUEv/yIpIMCoYd68ijnzxpD9fd+XK0zXYqnneX/eTFtG5oiqVMs+nbV2U9z50mBVVggw6WzuTfIdQd6EVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U24/A8Sc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U24/A8Sc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso231775b3a.1;
        Tue, 24 Jun 2025 15:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803100; x=1751407900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hExQIcvoKTg+0rOcrZXWVdh84oK5KeLOdM+0A3CpbHg=;
        b=U24/A8Sciib9eZGPOhA/1+xwTM4DMRU+nDLEfGXwG/KbcPsA5V5Nz3aUcMcHrZ0WAZ
         Pz/hIJzzVUt8Fwbx++68Hthw2ec8HKqBjp6EjFINR7yntgfp7MYhwjnNY3FacBoondHY
         shiBmWfon6GoTUz6O1N9ttrcxXjcGfZnNbUtXPONAp1/hYh8W+doErDn2NiGfTDClmxr
         sHfVVnRidlqcrnenenKc1xeMN9q8A11pm/jEv0RuHMq7NXPcBKfEZYaISfVuP032noD4
         +qj/lIh5DyLPcSwoLZM09uAC0pNCwevgzHlyNZ/qsxHD07RBM9Wjc1a0htOqhAY43HK7
         rw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803100; x=1751407900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hExQIcvoKTg+0rOcrZXWVdh84oK5KeLOdM+0A3CpbHg=;
        b=P8T+B6ua+VcmreLTwlm2Uj0CKmLNdjTqQt6Piw78ZWoqZKqjSAr/kUEiidogo88tjL
         AG1ViGX/2epsZWcNaYhwaRcRg9qdK5u+7KW9/o5OSpsK1wyovpPq7xYFnTIIqyACQiQJ
         qP2Ai4MKcSGjyMijhXR/uU9GUEKwNjkEIu8i2ym4P0YrufRp7p4nRSknT+ysBJqptHpg
         Jy8+tcRPbKYzuxTAXDG822zk6EebGe2mtbgviSPc0rTykgflTXQ53+9kUd0wotOai85z
         tj0r78hCO4HHetSinTYlamBN0GlDr+lSjjpIO9v6vsn5j5YM5RAEmgQb5rdBVgG7nVBZ
         aixw==
X-Forwarded-Encrypted: i=1; AJvYcCWiF4oSXi93eXQtepFASFZYvYbD4B2zGrTdo7lflgvPxRGrGJvnCB6U8hYmimx62lgCmWd4S5o+5+dZG/pXIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjeZLXHmrWqghAHrLMapjYVM9+glNRvuvYoj9KJem2y8KUG03
	FQFk8G9jh/HWg7VoyoHDmJvqyO91NLaO44X0KZqhXn7ZV9IAgbeWUCmc
X-Gm-Gg: ASbGncsFmC559dauJ/quE4eJDhUEvRfBQ8m8nf2K7GRKpsqN3hgM6wZ/Wy6lcbrhRB/
	w9rIy1p4NuQXRzE62AzC4nudVEk18TVOWwQ5WxBd0LURHKAe4TbdROqTTwI4p+utwdlHHEBRJHQ
	CUDcUjLct+8xkzRib1HFqWA5AuQNs4Dj3sFk4ZA2asbQLa2EmmloX2FrHn99nTE5oI/6YznZ5qp
	eadidf01fuBUjJr+PGzHbQ2Y7Y0RclhNScu+PwAN1nHS8XEkwHhP0UYndLdDhSaW353AiGb19ZN
	IW8463NxS+URFovTJTa7xMHWXCrsY5wgaa8nXJBB6mgl11Yu2vm/oOEM+renwWzJk0soLqPMPZc
	BwO+Yx43Xs5VobBLlQIcvdXL6RJ7DWyT8dmbs
X-Google-Smtp-Source: AGHT+IHWmfvN/QWU2UTaYOJYLgSEIUkW9IzlfVoIh8mrWtOInCaVWO4MlPJi/aEgerL1ApzcgujsRQ==
X-Received: by 2002:a17:902:e74b:b0:231:9817:6ec1 with SMTP id d9443c01a7336-2382538f63bmr10265625ad.17.1750803099689;
        Tue, 24 Jun 2025 15:11:39 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:39 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Tue, 24 Jun 2025 15:10:41 -0700
Subject: [PATCH 3/5] rust: percpu: add a rust per-CPU variable test
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rust-percpu-v1-3-9c59b07d2a9c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=6875;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=J2wN034E1ANJf8z7zTgfPajB+DTsr36981US4k79sBA=;
 b=T9fAvCAJVHSEYQDHB7G792IQxMvoy47XXOoUkieCxnkJnVW13uXJLW6GXVuMO6r3HY6Oe+S1I
 iOgQJ7l3wZ8BhpuLe0yGd6tUtiR8mnLqFRxz/ygj687J7mnS6V6qdps
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a short exercise for Rust's per-CPU variable API, modelled after
lib/percpu_test.c

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 lib/Kconfig.debug       |   9 ++++
 lib/Makefile            |   1 +
 lib/percpu_test_rust.rs | 120 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/helpers/percpu.c   |  11 +++++
 4 files changed, 141 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6..959ce156c601 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2418,6 +2418,15 @@ config PERCPU_TEST
 
 	  If unsure, say N.
 
+config PERCPU_TEST_RUST
+	tristate "Rust per cpu operations test"
+	depends on m && DEBUG_KERNEL && RUST
+	help
+	  Enable this option to build a test module which validates Rust per-cpu
+	  operations.
+
+	  If unsure, say N.
+
 config ATOMIC64_SELFTEST
 	tristate "Perform an atomic64_t self-test"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index c38582f187dd..ab19106cc22c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -288,6 +288,7 @@ obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
 
 obj-$(CONFIG_PERCPU_TEST) += percpu_test.o
+obj-$(CONFIG_PERCPU_TEST_RUST) += percpu_test_rust.o
 
 obj-$(CONFIG_ASN1) += asn1_decoder.o
 obj-$(CONFIG_ASN1_ENCODER) += asn1_encoder.o
diff --git a/lib/percpu_test_rust.rs b/lib/percpu_test_rust.rs
new file mode 100644
index 000000000000..a9652e6ece08
--- /dev/null
+++ b/lib/percpu_test_rust.rs
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+//! A simple self test for the rust per-CPU API.
+
+use core::ffi::c_void;
+
+use kernel::{
+    bindings::{on_each_cpu, smp_processor_id},
+    define_per_cpu,
+    percpu::{cpu_guard::*, *},
+    pr_info,
+    prelude::*,
+    unsafe_get_per_cpu,
+};
+
+module! {
+    type: PerCpuTestModule,
+    name: "percpu_test_rust",
+    author: "Mitchell Levy",
+    description: "Test code to exercise the Rust Per CPU variable API",
+    license: "GPL v2",
+}
+
+struct PerCpuTestModule;
+
+define_per_cpu!(PERCPU: i64 = 0);
+define_per_cpu!(UPERCPU: u64 = 0);
+
+impl kernel::Module for PerCpuTestModule {
+    fn init(_module: &'static ThisModule) -> Result<Self, Error> {
+        pr_info!("rust percpu test start\n");
+
+        let mut native: i64 = 0;
+        // SAFETY: PERCPU is properly defined
+        let mut pcpu: StaticPerCpu<i64> = unsafe { unsafe_get_per_cpu!(PERCPU) };
+        // SAFETY: We only have one PerCpu that points at PERCPU
+        unsafe { pcpu.get(CpuGuard::new()) }.with(|val: &mut i64| {
+            pr_info!("The contents of pcpu are {}\n", val);
+
+            native += -1;
+            *val += -1;
+            pr_info!("Native: {}, *pcpu: {}\n", native, val);
+            assert!(native == *val && native == -1);
+
+            native += 1;
+            *val += 1;
+            pr_info!("Native: {}, *pcpu: {}\n", native, val);
+            assert!(native == *val && native == 0);
+        });
+
+        let mut unative: u64 = 0;
+        // SAFETY: UPERCPU is properly defined
+        let mut upcpu: StaticPerCpu<u64> = unsafe { unsafe_get_per_cpu!(UPERCPU) };
+
+        // SAFETY: We only have one PerCpu pointing at UPERCPU
+        unsafe { upcpu.get(CpuGuard::new()) }.with(|val: &mut u64| {
+            unative += 1;
+            *val += 1;
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, val);
+            assert!(unative == *val && unative == 1);
+
+            unative = unative.wrapping_add((-1i64) as u64);
+            *val = val.wrapping_add((-1i64) as u64);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, val);
+            assert!(unative == *val && unative == 0);
+
+            unative = unative.wrapping_add((-1i64) as u64);
+            *val = val.wrapping_add((-1i64) as u64);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, val);
+            assert!(unative == *val && unative == (-1i64) as u64);
+
+            unative = 0;
+            *val = 0;
+
+            unative = unative.wrapping_sub(1);
+            *val = val.wrapping_sub(1);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, val);
+            assert!(unative == *val && unative == (-1i64) as u64);
+            assert!(unative == *val && unative == u64::MAX);
+        });
+
+        pr_info!("rust static percpu test done\n");
+
+        pr_info!("rust dynamic percpu test start\n");
+        let mut test: DynamicPerCpu<u64> = DynamicPerCpu::new(GFP_KERNEL).unwrap();
+
+        // SAFETY: No prerequisites for on_each_cpu.
+        unsafe {
+            on_each_cpu(Some(inc_percpu), (&raw mut test) as *mut c_void, 0);
+            on_each_cpu(Some(inc_percpu), (&raw mut test) as *mut c_void, 0);
+            on_each_cpu(Some(inc_percpu), (&raw mut test) as *mut c_void, 0);
+            on_each_cpu(Some(inc_percpu), (&raw mut test) as *mut c_void, 1);
+            on_each_cpu(Some(check_percpu), (&raw mut test) as *mut c_void, 1);
+        }
+
+        pr_info!("rust dynamic percpu test done\n");
+
+        // Return Err to unload the module
+        Result::Err(EINVAL)
+    }
+}
+
+extern "C" fn inc_percpu(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
+    // SAFETY: smp_processor_id has no preconditions
+    pr_info!("Incrementing on {}\n", unsafe { smp_processor_id() });
+
+    // SAFETY: We don't have multiple clones of pcpu in scope
+    unsafe { pcpu.get(CpuGuard::new()) }.with(|val: &mut u64| *val += 1);
+}
+
+extern "C" fn check_percpu(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
+    // SAFETY: smp_processor_id has no preconditions
+    pr_info!("Asserting on {}\n", unsafe { smp_processor_id() });
+
+    // SAFETY: We don't have multiple clones of pcpu in scope
+    unsafe { pcpu.get(CpuGuard::new()) }.with(|val: &mut u64| assert!(*val == 4));
+}
diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
index a091389f730f..0e9b2fed3ebd 100644
--- a/rust/helpers/percpu.c
+++ b/rust/helpers/percpu.c
@@ -1,9 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/percpu.h>
+#include <linux/smp.h>
 
 void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
 {
 	return __alloc_percpu(sz, align);
 }
 
+void rust_helper_on_each_cpu(smp_call_func_t func, void *info, int wait)
+{
+	on_each_cpu(func, info, wait);
+}
+
+int rust_helper_smp_processor_id(void)
+{
+	return smp_processor_id();
+}
+

-- 
2.34.1

