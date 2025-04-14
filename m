Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4128DEEC;
	Mon, 14 Apr 2025 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658940; cv=none; b=Q4/LqT7Cx/+d0hIZLhfUzOPDuSMacJzhhjk0yJVWAfneLbKxxVZVbHCDCMatStWQQ4KHWMZ6KQheF7zjbGMWOZNX7VlrWi+I2LhM6VcapyPoyt0k5igAuDRpPFMKCJeeFm1LiexEnOV1ob9UFIwsXKHS88mvd66bPjz05XTpdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658940; c=relaxed/simple;
	bh=jCbJ9Ju2A01cc4n5ifjcDJwihXlezFkUcuPbDwroyfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJnUjO9Fbz6ibu+lQ7W8ohzyumFTzbTfPvurXt+zjOCDe49kQitXbPbLwH8Bp6j0BIJUN0n99S01xt63SDY69JdtB54VHcGhMOsrqa2ov+NQs7L1IwPzSqvhdAxMWJ7iyJNdeA3HpfeWGSr5D1fSuqj1/FCiC2tuo+Embe77hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/k2Am3r; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/k2Am3r"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4221133b3a.0;
        Mon, 14 Apr 2025 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658938; x=1745263738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/mennYIPZF3DS9iChk0/U5hjKR2MUh3UXar0f5WEiM=;
        b=H/k2Am3rvKnqdK8LFvV9lTBNQU9YPyGgOasHTssOMyQEC9HINa7FKdXpp/dacpx6ZK
         Ta3gG2QRCkUiW/rwYJFtkfs2ai/wihu0uczr9nlUCt5AjoWyhd+ZChqgIY2q5Xh9l8rv
         BEz7v1s/wv+EHNg5lPhbsyPK9m8jdguGIdfUj1FGbTW4yx+6HJbDjAcZlTvYm1e3XLor
         /DbEDskAVUVNflYZC0Zfx97TaTW4f6NGl3HBkkbNY869DwE/XUA7WRQGgwNH5wqvDK2S
         nhSLRQjjq5jlBopdYz0wzMul3p+TmFO49ozFFk2crPK9TAnxfl24Pu45Ln+fvKtv1dXu
         WO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658938; x=1745263738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/mennYIPZF3DS9iChk0/U5hjKR2MUh3UXar0f5WEiM=;
        b=EFT3I8r9Mtw7u+htXGFPa7nCI9SCAol2ZqX77Vpk9Mt+VWr1Vdw+jtMqCeusmQs8IL
         hXC8yGGF90ArLOjj6YIISH+T1H2FggUcNxQBtn/RWy5GlarAXlDuRKjnewTcigbGFUGM
         M1B4CT3zIVNulXOjSfJZdk6n2+U8cV/97uS7jn9EghR/8l6cyP8+C3EOMGmbW9QiZDj3
         MIkWEhev+FHT1EDX8Ops+Mj/Iv0ALcM5cnf9VJK/HpOZvl8JuSAy/J9OytjrjCi/iL2R
         FcFwBLzzmoO59k389sK291Lyj9recK6HPuZMeyXDl87zjc+AAERi777gX2jCiwWMnRaL
         EZGg==
X-Forwarded-Encrypted: i=1; AJvYcCX1lHC8m4W4LqSsn3arEENU48PYgKH1iuIDhy53EbFV+4DMQfL/aj6U+0Ouhtvm6spqI02aeZSzxZ4pQnW+1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3kEknoqiDSUprn6WI56unvPiAGXyDGrdtpvhE0LxV7BsBsuJ
	lBabFg9uY21uQumottvTwPU0/4mhovzn27LAFJd/ru7GYoH+Oqf3
X-Gm-Gg: ASbGnctIC6Wah/uetLgxaKcUM2KhgVX7JO6LjWcEX6cKj4PU/cRPsRXTU1ci4cfr0LV
	KgAIA/14/XakOJmASt9xD/GmoiCcdma+upBtM8hB0oq4bDcXsTHiDDZI/DBdIoGJEBjcKzpd2Qa
	EZTphCFBCKAqxprTOaX8d7EPhe2eH3tlAmv6KaXzNorA7O25vw4MRv1uNDF+Elb2BZmZGGy9Vmw
	KPWX6upeYfpGSpj62IbBFAg2Figf9Y3TBFFndIE4ZxS0SD4NFeGR5rr7CQpzxyAyV2zmWaIiFwy
	ruYudasHRv5kGduOygrdfNX69D1vYP+zlayrHlk99q6xq3NHe3WK9oMXPLnHlWzB
X-Google-Smtp-Source: AGHT+IF2jXebg/XL2QOp/eyO3oOLF0IGjbAWPIX7okQuwLMuQ16NI0xIuE6tUWtNH2OfaY4zanw7xw==
X-Received: by 2002:a05:6a00:843:b0:730:d5ca:aee with SMTP id d2e1a72fcca58-73bd12cdb7emr18252533b3a.23.1744658938132;
        Mon, 14 Apr 2025 12:28:58 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.174.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f9bsm7223159b3a.104.2025.04.14.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:28:57 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Mon, 14 Apr 2025 12:28:29 -0700
Subject: [PATCH RFC v2 3/3] rust: percpu: add a rust per-CPU variable test
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-rust-percpu-v2-3-5ea0d0de13a5@gmail.com>
References: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
In-Reply-To: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744658935; l=6739;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=jCbJ9Ju2A01cc4n5ifjcDJwihXlezFkUcuPbDwroyfA=;
 b=sGBKWzZWhvyS5Y/xpTGMugCj54OqxHR1MKEJ1uB/Sf4oro6WvMkLggCiGpStCYZjtFSjP7wLR
 2FRu+zieWL+Csuvr9gnA3zGbJN53iNA41Izub6f+nh5IdXqDWINfDZ5
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a short exercise for Rust's per-CPU variable API, modelled after
lib/percpu_test.c

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 lib/Kconfig.debug       |   9 ++++
 lib/Makefile            |   1 +
 lib/percpu_test_rust.rs | 119 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/helpers/percpu.c   |  11 +++++
 4 files changed, 140 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index df9587aa5c5e..e9fa12940cf2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2425,6 +2425,15 @@ config PERCPU_TEST
 
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
index f07b24ce1b3f..adace4f3ae63 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -289,6 +289,7 @@ obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
 
 obj-$(CONFIG_PERCPU_TEST) += percpu_test.o
+obj-$(CONFIG_PERCPU_TEST_RUST) += percpu_test_rust.o
 
 obj-$(CONFIG_ASN1) += asn1_decoder.o
 obj-$(CONFIG_ASN1_ENCODER) += asn1_encoder.o
diff --git a/lib/percpu_test_rust.rs b/lib/percpu_test_rust.rs
new file mode 100644
index 000000000000..61d8793b1cb0
--- /dev/null
+++ b/lib/percpu_test_rust.rs
@@ -0,0 +1,119 @@
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
+        let mut pcpu: PerCpu<i64> =
+            unsafe { unsafe_get_per_cpu!(PERCPU, CpuGuard::new()).unwrap() };
+        // SAFETY: We only have one PerCpu that points at PERCPU
+        unsafe { pcpu.get(CpuGuard::new()) }.with(|val: &mut i64| {
+            pr_info!("The contents of pcpu are {}", val);
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
+        let mut upcpu: PerCpu<u64> =
+            unsafe { unsafe_get_per_cpu!(UPERCPU, CpuGuard::new()).unwrap() };
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
+        let mut test: PerCpu<u64> = PerCpu::new().unwrap();
+
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
+unsafe extern "C" fn inc_percpu(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const PerCpu<u64> and PerCpu<u64> is Send.
+    let mut pcpu = unsafe { (&*(info as *const PerCpu<u64>)).clone() };
+    // SAFETY: smp_processor_id has no preconditions
+    pr_info!("Incrementing on {}\n", unsafe { smp_processor_id() });
+
+    // SAFETY: We don't have multiple clones of pcpu in scope
+    unsafe { pcpu.get(CpuGuard::new()) }.with(|val: &mut u64| *val += 1);
+}
+
+unsafe extern "C" fn check_percpu(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const PerCpu<u64> and PerCpu<u64> is Send.
+    let mut pcpu = unsafe { (&*(info as *const PerCpu<u64>)).clone() };
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

