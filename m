Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4F313041
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489107; cv=none; b=OoDQx3Ll0xc1rxtWzibVE35FEGa5s+YuzCMuxAE70qmUBQl6q0sC9/8HIA+0VEephi/y9Ux+NaNaKwfHDEm9xU3jopPx1YYQsV7Eg7vAlsVaT29kYtJQOHzO2S+kWeHcux7haARo+EzHTeRajvPCgZqe4pMZXshizp2NIFW8HQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489107; c=relaxed/simple;
	bh=1Czlpu5Zw+onSfmWVzbc7ubzKt2PZFY4w+8ny+bUfx0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JKazhyScA8FNa+hY0JD9/pj2c0Ia7VCpluNeFo288iislzMyKZUem82NZA24QYW817q3agWzFXboi6jY5Q3cI6xML1Zqh5lvfl4xRi0T3Es1H3XtDa87KA/ayKFy97ZJXkZg2IdkWdbfCJTeZSUPXz1KK/CKdp8D0tLe+NAseac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlWIUGxN; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlWIUGxN"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1f71ae2181so2632512a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746489104; x=1747093904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVFcCuEJ5alfPtNg/Xq1mbavgiLO3WAXess9THLNyv0=;
        b=VlWIUGxNJn3tCOeuKj5hTbQ/wDNSomgHekXRUgLFRJnNiFAByZqBPkKhinYFdhH+q0
         yjsWM0NheFRDECShWluFWi9mNkEd4IjIXupDWX23ErcEzdaw1YNJBtEQkBcA0bH1BFH4
         7o3fN4b0UwYhOZr+EwD1liDOQD5YP+F9VmGxBALwcTVsRrfNX595vnGa4Lv+JIUzRY/K
         eekhPkVbQ4becN56TBaeJsIUe/QAd5stOv6kicU0ArvTJ+0duSotwH+uDRggYTn107In
         r5zx2fzqXuzpZG9SyZriVoU14IMETQEsdFwli7ZTiHK7RAbdPCRpxQJ+FOBe7+rAbxOh
         PasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489104; x=1747093904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVFcCuEJ5alfPtNg/Xq1mbavgiLO3WAXess9THLNyv0=;
        b=r5rHAbTd7hK9CP/keoDgYQYFxSEonFub01ezrFIaUS+IWzDQzKy16EOu1jXJ2xROcD
         glfHagWRw3szLKzGWRSqN2XR2/WHIELGANndJYtRZb+rYUCS6yxvteSXqEoP46k+CJSM
         KsVZBCXZzDIO0k9m/vCb3NHxPf4e3okRENqnUh/LmxZ27/eVAn/cYTGz7aHJ/FMQhM/z
         3X4im8yTtGhpEFkCCq9xo8uNCDcAh976Wl7xGEcumdcJW5rJg2bQR387aeRjqMlMjNrW
         mntgoqtXqgN+0fGrEUgPw1p0M0Tdpyt7YqnjZf+oZ87/98uLCeq6SleHLnlQ0LD/LwFu
         n9/A==
X-Gm-Message-State: AOJu0YxFaGqiVBJb/VjroRG2ApgGZV2Vq9R7L1ggX36NCIUGxIqc81/N
	XkpDS9XHopS6EjYbmIpKatUEXj+ygG5VIlGVggSFh4GM8mftuWtkoT4DSVKjsWjFXCEVDmbqWmk
	V00Npvg==
X-Google-Smtp-Source: AGHT+IHhHeeJd9n5Zw7omC+WvKFKXAbgEziWfLrzNlmR3bEjX3KPOzvCbkNlX8p2OE6R7hdCj4z5Muub6Pbf
X-Received: from plhz4.prod.google.com ([2002:a17:902:d9c4:b0:220:ecac:27e5])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b2f:b0:223:54aa:6d15
 with SMTP id d9443c01a7336-22e1e8e5104mr161714215ad.12.1746489103754; Mon, 05
 May 2025 16:51:43 -0700 (PDT)
Date: Mon, 05 May 2025 23:51:37 +0000
In-Reply-To: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746489094; l=5037;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=1Czlpu5Zw+onSfmWVzbc7ubzKt2PZFY4w+8ny+bUfx0=; b=9DsYGfqkB44bJMw3Jc4sY+S7ingNR9ptF+1HkrZeHUix3jk0G2P5GA9QBUYyyyjDavOZBXfmR
 AGRN2rlofWOBQmJTKyGAx+GTLBwAfRLzS/3v59G0OMxBu29TqPDGFEn
X-Mailer: b4 0.14.2
Message-ID: <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
Subject: [PATCH v5 4/4] rust: samples: Add debugfs sample
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
 samples/rust/Kconfig         | 11 ++++++++
 samples/rust/Makefile        |  1 +
 samples/rust/rust_debugfs.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

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
index 0000000000000000000000000000000000000000..a4b17c8241330b2f6caf8f17a5b2366138de6ced
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Sample DebugFS exporting module
+
+use core::mem::{forget, ManuallyDrop};
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
+    // As we only hold this for drop effect (to remove the directory) we have a leading underscore
+    // to indicate to the compiler that we don't expect to use this field directly.
+    _debugfs: Dir<'static>,
+}
+
+static EXAMPLE: AtomicU32 = AtomicU32::new(8);
+
+impl kernel::Module for RustDebugFs {
+    fn init(_this: &'static ThisModule) -> Result<Self> {
+        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
+        let debugfs = Dir::new(c_str!("sample_debugfs"));
+
+        {
+            // Create a subdirectory, so "sample_debugfs/subdir" now exists.
+            // We wrap it in `ManuallyDrop` so that the subdirectory is not automatically discarded
+            // at the end of the scope - it will be cleaned up when `debugfs` is.
+            let sub = ManuallyDrop::new(debugfs.subdir(c_str!("subdir")));
+
+            // Create a single file in the subdirectory called "example" that will read from the
+            // `EXAMPLE` atomic variable.
+            // We `forget` the result to avoid deleting the file at the end of the scope.
+            forget(sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
+                writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
+            }));
+            // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 8\n" when read.
+        }
+
+        // Change the value in the variable displayed by the file. This is intended to demonstrate
+        // that the module can continue to change the value used by the file.
+        EXAMPLE.store(10, Ordering::Relaxed);
+        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 10\n" when read.
+
+        // Save the root debugfs directory we created to our module object. It will be
+        // automatically cleaned up when our module is unloaded because dropping the module object
+        // will drop the `Dir` handle. The base directory, the subdirectory, and the file will all
+        // continue to exist until the module is unloaded.
+        Ok(Self { _debugfs: debugfs })
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

