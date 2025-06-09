Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B72236E9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506128; cv=none; b=duQ5gaXAvLnvEzFWR6tu4U/ZPpeCew8dsMM9Utar4wPgsJ6KMGLhuoNMgewsQw6Wnz8ZYdLEMmWhQAqOXSsPMkgF34fL25OZRbmjsCfJf9z/Lz5YOiw1DcSAwHb95I07wjFXlQTl4lncQG/S0hvO01tjNXk68f4pDoBFV39mEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506128; c=relaxed/simple;
	bh=90T6ejJVsDBvxIbRYg9P0PhiOGWoRm1F4hXTbYJcEBo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=C9T0n4NrPr8PsICSNcQ7/D23NzsGXPpsyUKu9JNGIZj7sJP+DSVyw7CcTnBm9Nox7EQHzZCFtWQmedcEyee/y6y2NZQTNgh6XSpVM28pnEyDLwYwB6eTn9/xicd59V1xf74WiZAWgZtlqwsX0hjafP2vxHdkTj3uldpgcjyG44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tnFFEMCg; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tnFFEMCg"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250609215524euoutp0286389ec992f8c3c2acb982f9a11cf40e~Hfo0LAsBm0630506305euoutp02n
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:55:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250609215524euoutp0286389ec992f8c3c2acb982f9a11cf40e~Hfo0LAsBm0630506305euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749506124;
	bh=6FDigIrzvT9N27pIlfQrnhaWXpE1+J7Dii4QKfGowac=;
	h=From:Date:Subject:To:Cc:References:From;
	b=tnFFEMCgSqvFuTxqBx/lY7egFQTq6LvfnB8BBbuJutlSIveTzKUZQAG1eOXcSB4kl
	 cVnyUiNsoEVtyQQ9ujD93s2cSXejnNZzdHAzKlVGRQ1x01QerDcVBWReFvxApzVqIU
	 dTygi89ikLezO+oTCA2dXbhz861cEbfGsF6cQaHM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9~HfozB2_zh0459404594eucas1p2N;
	Mon,  9 Jun 2025 21:55:23 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250609215522eusmtip243b4c206faaf6705a2082bfe335359c7~HfoyeJlhe2095520955eusmtip2Y;
	Mon,  9 Jun 2025 21:55:22 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 09 Jun 2025 23:53:19 +0200
Subject: [PATCH] rust: math: Add KernelMathExt trait with a mul_div helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
X-B4-Tracking: v=1; b=H4sIAM5XR2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
	vPSU3UzU4B8JSMDI1MDMwNL3dzEkgzdotLiEt0yQ90UY0sLS1ND01Rjo1QloJaCotS0zAqwcdG
	xtbUA8S9/B14AAAA=
X-Change-ID: 20250609-math-rust-v1-d3989515e32e
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,  Danilo Krummrich
	<dakr@kernel.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9
X-EPHeader: CA
X-CMS-RootMailID: 20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9
References: <CGME20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9@eucas1p2.samsung.com>

The PWM subsystem and other kernel modules often need to perform a
64 by 64-bit multiplication followed by a 64-bit division. Performing
this naively in Rust risks overflow on the intermediate multiplication.
The kernel provides the C helper 'mul_u64_u64_div_u64' for this exact
purpose.

Introduce a safe Rust wrapper for this function to make it available to
Rust drivers.

Following feedback from the mailing list [1], this functionality is
provided via a 'KernelMathExt' extension trait. This allows for
idiomatic, method style calls (e.g. val.mul_div()) and provides a
scalable pattern for adding helpers for other integer types in the
future.

The safe wrapper is named 'mul_div' and not 'mul_u64_u64_div_u64' [2]
because its behavior differs from the underlying C function. The C
helper traps on a division by zero, whereas this safe wrapper returns
`None`, thus exhibiting different and safer behavior.

This is required for the Rust PWM TH1520 driver [3].

[1] - https://lore.kernel.org/all/DAFQ19RBBSQL.3OGUXOQ0PA9YH@kernel.org/
[2] - https://lore.kernel.org/all/CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPLSQfXXLW7X3cw@mail.gmail.com/
[3] - https://lore.kernel.org/all/20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com/

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..d652c92633b82525f37e5cd8a040d268e0c191d1 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -85,6 +85,7 @@
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;
+pub mod math;
 pub mod miscdevice;
 pub mod mm;
 #[cfg(CONFIG_NET)]
diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b89e23f9266117dcf96561fbf13b1c66a4851b48
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Samsung Electronics Co., Ltd.
+// Author: Michal Wilczynski <m.wilczynski@samsung.com>
+
+//! Safe wrappers for kernel math helpers.
+//!
+//! This module provides safe, idiomatic Rust wrappers for C functions, whose
+//! FFI bindings are auto-generated in the `bindings` crate.
+
+use crate::bindings;
+
+/// An extension trait that provides access to kernel math helpers on primitive integer types.
+pub trait KernelMathExt: Sized {
+    /// Multiplies self by `multiplier and divides by divisor.
+    ///
+    /// This wrapper around the kernel's `mul_u64_u64_div_u64` C helper ensures that no
+    /// overflow occurs during the intermediate multiplication.
+    ///
+    /// # Returns
+    /// * Some(result) if the division is successful.
+    /// * None if the divisor is zero.
+    fn mul_div(self, multiplier: Self, divisor: Self) -> Option<Self>;
+}
+
+impl KernelMathExt for u64 {
+    fn mul_div(self, multiplier: u64, divisor: u64) -> Option<u64> {
+        if divisor == 0 {
+            return None;
+        }
+        // SAFETY: The C function `mul_u64_u64_div_u64` is safe to call because the divisor
+        // is guaranteed to be non-zero. The FFI bindings use `u64`, matching our types.
+        Some(unsafe { bindings::mul_u64_u64_div_u64(self, multiplier, divisor) })
+    }
+}

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-math-rust-v1-d3989515e32e

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

