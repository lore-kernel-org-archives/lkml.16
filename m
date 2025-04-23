Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D571AD403
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415864; cv=none; b=H1rWPeMu7hMR0BN0ALkd3bRjt+AhBzETwqn8M++bjwrI0sAZ6Y0qEyB6uFZwv/tLIXjlXQ+YzmRzrF6GirKTuSDTdLIzAUqNOfwscjRgH4BCumQuWfCNVkZMsITzK1I9Q8sU6kt0of9z3JM37Z7gC1jfdf6pXrKmtzlMTWzyZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415864; c=relaxed/simple;
	bh=zIBrd9cUjoQVVk+8Lvk24Mej2FuVDpi1UZSLHkG2ZAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ns0LjJseqJoui97OjzYubEvOroxIaODRxtsMaHUcEuNfV7Md9WUKhN+CgAzSecDXHmhrZ/iELJ/YR79Xs75HsUP5fMNL4lv6ZckP5idxMFwfjYN20oIoPisQg9phUxVVTPm3kTMUhP6fBXj/mu9CcGQ/f8Nsy4/vrxWMZcVbezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXt/5suJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXt/5suJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43efa869b19so38672425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415861; x=1746020661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfk17Tkc59YjFunRiPIPE5CIF/uiu04j7BzaM2JExc4=;
        b=KXt/5suJLhcMXLmg85n/H/lJEX4aLDgoS7Kl6+IFpMbcCEzTK6c8kDv4b96iwDpkJI
         SXwVhldKaYHXNxf/E5TYc3hbd7v8qoATQmcZu5MfR2H3vOLN/anup/YRYawRN9kqM02t
         +TU1IdfWdEzuNOXmxDZBMwcYq+bq7+AeyXTj2jLkpqRmCwbnFlTO4VY0HvEg7fQqZY+7
         +jr3vm7fIosy/YiC3PiQ/9vlUHRIwDGlbL1EWCNrgn1kLtmKISbsZ17dKTJ13dO3Znkq
         WdQ86o+hbBDnk84LNogrMH6a47OfUlbgqRtN6IeZf0EhO/HsNYM448YSBAOBcZRL0wqY
         liXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415861; x=1746020661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfk17Tkc59YjFunRiPIPE5CIF/uiu04j7BzaM2JExc4=;
        b=G5LQxbROb4Ir/jTQjpUXmoQ35WAjL2DQ19DpgPl5Dvbdy5ZIy4YvjvZ1tmzyasyZxq
         nOqljCl4m+8z8RhEyqsKLnVASi2XSfj1STNtiX7r1agYKXCR36AcvCRQnEyHUaw3mNDY
         JYYOhViaD7puGjK7IYecms6mt5QW+tX7eajPZuoip52IwQYKlx61FiohsM8XwJF7eALi
         lqtCDWiBqMzWHJtBaZBjfJK1F+3ngGlIjS3JZsMH8ud/5Sx4XjMxtgpRgIwzvFXYZryN
         lM8hFzqAdzNUKve/rcJKj+FDl2/E18EnN5eZD6LLqvfSW2KeQhzsVzjtpJ5r9UxmUlJg
         zPbw==
X-Forwarded-Encrypted: i=1; AJvYcCWMsTqndTAsR5agsYCRfVcr0lQ9lxW8/c7CynyWrjub8UJQGGVVOESZElFsefwrI4+sKCaPIOeRM1qLZn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0fZMZNJYu2pUMJwrJHTQcc1vlS2MTjFYCMy+tlY467uS++Ti
	tgGQUdtpkb6ZGfckoT0xkNJOnZp6TpagMbucANWop76yZdFNJsptwP4IOEDXCDH1hA==
X-Google-Smtp-Source: AGHT+IGIu08dm+Tt3AGqyc1H2SHtSFX96IPz5UKg/uIMyofXTnftlGDvJAe6A/sn6BegLJRshngUyHU=
X-Received: from wmsd8.prod.google.com ([2002:a05:600c:3ac8:b0:43d:abd:278f])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ecc:b0:43c:f969:13c0
 with SMTP id 5b1f17b1804b1-4406ac17729mr158784665e9.29.1745415860859; Wed, 23
 Apr 2025 06:44:20 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:43:36 +0000
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423134344.3888205-6-bqe@google.com>
Subject: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Microbenchmark protected by a config FIND_BIT_BENCHMARK_RUST,
following `find_bit_benchmark.c` but testing the Rust Bitmap API.

We add a fill_random() method protected by the config in order to
maintain the abstraction.

Minor fix to the documentation of the corresponding C config
FIND_BIT_BENCHMARK, it was mentioning the wrong module name.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS                     |   1 +
 lib/Kconfig.debug               |  15 ++++-
 lib/Makefile                    |   1 +
 lib/find_bit_benchmark_rust.rs  | 102 ++++++++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/bitmap.rs           |  14 +++++
 6 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 lib/find_bit_benchmark_rust.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d107dc91390..d448b73c5934 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4140,6 +4140,7 @@ M:	Alice Ryhl <aliceryhl@google.com>
 M:	Burak Emir <bqe@google.com>
 R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
+F:	lib/find_bit_benchmark_rust.rs
 F:	rust/kernel/bitmap.rs
 
 BITOPS API
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f9051ab610d5..c1d4fc4a5f8f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2600,11 +2600,24 @@ config TEST_BPF
 config FIND_BIT_BENCHMARK
 	tristate "Test find_bit functions"
 	help
-	  This builds the "test_find_bit" module that measure find_*_bit()
+	  This builds the "find_bit_benchmark" module that measure find_*_bit()
 	  functions performance.
 
 	  If unsure, say N.
 
+config FIND_BIT_BENCHMARK_RUST
+	tristate "Test find_bit functions in Rust"
+	help
+	  This builds the "find_bit_benchmark_rust" module. It is a micro
+          benchmark that measures the performance of Rust functions that
+          correspond to the find_*_bit() operations in C. It follows the
+          FIND_BIT_BENCHMARK closely but will in general not yield same
+          numbers due to extra bounds checks and overhead of foreign
+          function calls.
+
+	  If unsure, say N.
+
+
 config TEST_FIRMWARE
 	tristate "Test firmware loading via userspace interface"
 	depends on FW_LOADER
diff --git a/lib/Makefile b/lib/Makefile
index f07b24ce1b3f..99e49a8f5bf8 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -62,6 +62,7 @@ obj-y += hexdump.o
 obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
+obj-$(CONFIG_FIND_BIT_BENCHMARK_RUST) += find_bit_benchmark_rust.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
 test_dhry-objs := dhry_1.o dhry_2.o dhry_run.o
 obj-$(CONFIG_TEST_DHRY) += test_dhry.o
diff --git a/lib/find_bit_benchmark_rust.rs b/lib/find_bit_benchmark_rust.rs
new file mode 100644
index 000000000000..9f4661baf70b
--- /dev/null
+++ b/lib/find_bit_benchmark_rust.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Benchmark for find_bit-like methods in Bitmap Rust API.
+
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::bindings;
+use kernel::bitmap::Bitmap;
+use kernel::error::{code, Result};
+use kernel::pr_err;
+use kernel::prelude::module;
+use kernel::time::Ktime;
+use kernel::ThisModule;
+
+const BITMAP_LEN: usize = 4096 * 8 * 10;
+// Reciprocal of the fraction of bits that are set in sparse bitmap.
+const SPARSENESS: usize = 500;
+
+/// Test module that benchmarks performance of traversing bitmaps.
+struct FindBitBenchmarkModule();
+
+fn test_find_next_bit(bitmap: &Bitmap) {
+    let mut time = Ktime::ktime_get();
+    let mut cnt = 0;
+    let mut i = 0;
+
+    loop {
+        cnt += 1;
+        if let Some(index) = bitmap.next_bit(i) {
+            i = index + 1;
+            if i == BITMAP_LEN {
+                break;
+            }
+        } else {
+            break;
+        }
+    }
+
+    time = Ktime::ktime_get() - time;
+    pr_err!("find_next_bit: {} ns, {} iterations\n", time.to_ns(), cnt);
+}
+
+fn test_find_next_zero_bit(bitmap: &Bitmap) {
+    let mut time = Ktime::ktime_get();
+    let mut cnt = 0;
+    let mut i = 0;
+    loop {
+        cnt += 1;
+        if let Some(index) = bitmap.next_zero_bit(i) {
+            i = index + 1;
+            if i == BITMAP_LEN {
+                break;
+            }
+        } else {
+            break;
+        }
+    }
+    time = Ktime::ktime_get() - time;
+    pr_err!(
+        "find_next_zero_bit: {} ns, {} iterations\n",
+        time.to_ns(),
+        cnt
+    );
+}
+
+fn find_bit_test() {
+    pr_err!("Start testing find_bit() Rust with random-filled bitmap\n");
+
+    let mut bitmap = Bitmap::new(BITMAP_LEN, GFP_KERNEL).expect("alloc bitmap failed");
+    bitmap.fill_random();
+
+    test_find_next_bit(&bitmap);
+    test_find_next_zero_bit(&bitmap);
+
+    pr_err!("Start testing find_bit() Rust with sparse bitmap\n");
+
+    let mut bitmap = Bitmap::new(BITMAP_LEN, GFP_KERNEL).expect("alloc sparse bitmap failed");
+    let nbits = BITMAP_LEN / SPARSENESS;
+    for _i in 0..nbits {
+        // SAFETY: BITMAP_LEN fits in 32 bits.
+        let bit: usize =
+            unsafe { bindings::__get_random_u32_below(BITMAP_LEN.try_into().unwrap()) as _ };
+        bitmap.set_bit(bit);
+    }
+
+    test_find_next_bit(&bitmap);
+    test_find_next_zero_bit(&bitmap);
+}
+
+impl kernel::Module for FindBitBenchmarkModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        find_bit_test();
+        // Return error so test module can be inserted again without rmmod.
+        Err(code::EINVAL)
+    }
+}
+
+module! {
+    type: FindBitBenchmarkModule,
+    name: "find_bit_benchmark_rust_module",
+    authors: ["Rust for Linux Contributors"],
+    description: "Module with benchmark for bitmap code!",
+    license: "GPL v2",
+}
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b6bf3b039c1b..f6ca7f1dd08b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -31,6 +31,7 @@
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/property.h>
+#include <linux/random.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/security.h>
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 79ddbef2b028..5d2f6978ee6e 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -106,6 +106,20 @@ pub fn len(&self) -> usize {
         self.nbits
     }
 
+    /// Fills this `Bitmap` with random bits.
+    #[cfg(CONFIG_FIND_BIT_BENCHMARK_RUST)]
+    pub fn fill_random(&mut self) {
+        // SAFETY: `self.as_mut_ptr` points to either an array of the
+        // appropriate length or one usize.
+        unsafe {
+            bindings::get_random_bytes(
+                self.as_mut_ptr() as *mut ffi::c_void,
+                usize::div_ceil(self.nbits, bindings::BITS_PER_LONG as usize)
+                    * bindings::BITS_PER_LONG as usize,
+            );
+        }
+    }
+
     /// Returns a mutable raw pointer to the backing [`Bitmap`].
     #[inline]
     fn as_mut_ptr(&mut self) -> *mut usize {
-- 
2.49.0.805.g082f7c87e0-goog

