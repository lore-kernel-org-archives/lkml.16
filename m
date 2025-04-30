Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5B22B8A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055934; cv=none; b=ZIp4Sln0uFTjgKxPnpWjlNbY+psC3HLKJQUZs4wKKr1wof705Yl2gaK8tUItx9Jb0tSR20g0kTTeoE5VtMzxeeO8/5YW6kBOYQEv4tIL/JXSNCtOYsh58rJBP6/hh4EviGG52JlejRV4/RDgd7A3F8JEHV6Ew8EXK5COMYQjSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055934; c=relaxed/simple;
	bh=0r3nnpv1r4BIBg/qPhAuVRymuwLZn71zdPHeXEpfV10=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQ3Q3QmmHuPpBnFW2IvYTidokGgGQ2M1yCK+M5L278cftJJsYlNsz2mR8Meu+w0b0XmOKEeeSkY0zM+2GLNKPUZxcbuBEHIF2vbSsc4uhinm7d5YofBYGrZSbmnvbLNNYeJHOCjMSEpiSelnQDdNQO85tpq3kyT+MKYehMFRNjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jiFmfyKf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jiFmfyKf"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224191d9228so4626025ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746055932; x=1746660732; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjhzEGURkcn9UbWg5KxOT29i9wmd1rs0Wo265/N8Qzc=;
        b=jiFmfyKfOdFHFo3rl40BAW92XUmsbZMS1xu1dYmfGDkrhF0ofspycnsXtvbPylxf4R
         /6fhZLdeai1VOD33BrzYWQoWaFPgTHtZSnpv9HrTjVJZhulHvYRIuZAnnCPRV3WlIZe2
         Zwa2vuZbcMyZieq/9tTTvVCSkiFIryLESi25LduPLw6QDPIvVCnBlFx8d+d9UCm/o53Y
         mV6L2Vv3/NaEuY0ac43IDZ2QOyqKFo6gdkuZJSu0IrUi1Wt6yE+3IRwNOdRZTceAao5f
         9mKZMDun5Pv7TSlLgNpr0khJFXfT2v5zE0ypla9P5IzxrMpBTNpfRTs9AhPRpUx1Jso9
         43wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055932; x=1746660732;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjhzEGURkcn9UbWg5KxOT29i9wmd1rs0Wo265/N8Qzc=;
        b=rH14erVmsZEvSdlha/vsIxnsgg032cjWMIZr8f9XJp0JNVng5ZrvgkVFAzSsNH9/l6
         gLyDKhKbbpDZ1acPTH2UDoM07HsxIJxBk3himhYb3dwEWKd3oUxPar/7K3j1j5Oy/uda
         ylgVMwR9+G0+jdHSOBH+j98aYZm8jpaEruTW/tup6Fpo6grFVGmSamhoSGwt6wqzYPqZ
         0TmtDJzD18dddMVl1IHI4IoSGXYEgM4LjWi+wV+gJkDSqVrqjuYoprRNZVlFzJ9MihwE
         BcgpI+bISjZMe6Q+e3gbZRlJTXqb8wI3QTwMlyIkq/piU/PK8ofGcySSOI0qWIBS1Yx5
         r2aw==
X-Gm-Message-State: AOJu0Yx4qgDx8Qcz7H155DS1mE5xujpV7D4Beg+WG/PbBEhl4cvFOMaf
	dc3+fjyBLLJreQaIi+N4Q9kjBkyiN8FXxJTKkNtIMFUEo/n7Y1yZiC25c1gb3uaWak7LKYwFOu0
	rd14zCw==
X-Google-Smtp-Source: AGHT+IE8feJ0hYlz4K66uJTpWFrcCx5lvXCT8nMGqCSSGEuNtR5RCbSNQcRmo9E607OGsVe8FQHuOlLyawFU
X-Received: from plps2.prod.google.com ([2002:a17:902:9882:b0:229:2f8a:d4ba])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94b:b0:224:f12:3734
 with SMTP id d9443c01a7336-22e0843cc0emr5975785ad.30.1746055931999; Wed, 30
 Apr 2025 16:32:11 -0700 (PDT)
Date: Wed, 30 Apr 2025 23:31:59 +0000
In-Reply-To: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746055923; l=3391;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=0r3nnpv1r4BIBg/qPhAuVRymuwLZn71zdPHeXEpfV10=; b=I6kD3xrVQb/NIjm0rtd0YHTEZJB+Y6zLAf79Jd53bVqEhNtlEq1IOqQJoGfMacyXm98jjfZQP
 4rGLnLbqW5MBrzivSatV3K8WWOxEH0V7HrzQuArPHxphFGAkX/CfSDV
X-Mailer: b4 0.14.2
Message-ID: <20250430-debugfs-rust-v2-4-2e8d3985812b@google.com>
Subject: [PATCH v2 4/4] rust: samples: Add debugfs sample
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Provides an example of using the Rust DebugFS bindings.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                  |  1 +
 samples/rust/Kconfig         | 11 +++++++++++
 samples/rust/Makefile        |  1 +
 samples/rust/rust_debugfs.rs | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a3b835e427b083a4ddd690d9e7739851f0af47ae..426bcdac025134e20911de8e2cf5c9efb0591814 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7278,6 +7278,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
 
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 43cb72d72631bb2d6e06185e1d88778edff6ee13..6c42ed73f842cda26256039e6917bb443738d3f1 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -51,6 +51,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DEBUGFS
+	tristate "DebugFS Test Driver"
+	depends on DEBUG_FS
+	help
+	  This option builds the Rust DebugFS Test driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_debugfs.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6a466afd2a21eba84a3b7b2be29f25dce44e9053..b1fc4677ed53fcf7d0f5a3dbf322f65851bc1784 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -4,6 +4,7 @@ ccflags-y += -I$(src)				# needed for trace events
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ce3e1a997bf314f63026446f5a6d2a00579c602a
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Sample DebugFS exporting module
+
+use core::sync::atomic::{AtomicU32, Ordering};
+use kernel::c_str;
+use kernel::debugfs::Dir;
+use kernel::prelude::*;
+
+module! {
+    type: RustDebugFs,
+    name: "rust_debugfs",
+    authors: ["Matthew Maurer"],
+    description: "Rust DebugFS usage sample",
+    license: "GPL",
+}
+
+struct RustDebugFs {
+    _debugfs: Dir,
+}
+
+static EXAMPLE: AtomicU32 = AtomicU32::new(8);
+
+impl kernel::Module for RustDebugFs {
+    fn init(_this: &'static ThisModule) -> Result<Self> {
+        let debugfs = Dir::new(c_str!("sample_debugfs"));
+        debugfs
+            .fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
+                writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
+            })
+            .keep();
+        EXAMPLE.store(10, Ordering::Relaxed);
+        Ok(Self { _debugfs: debugfs })
+    }
+}

-- 
2.49.0.906.g1f30a19c02-goog

