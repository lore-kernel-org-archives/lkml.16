Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370D1EB189
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215394; cv=none; b=hJcap3MUF0UGxEo0STM75exLhTYtkbv3FRhIIW+i4IJf9DVfuuxRQ3eAyOzuo2fVH7Nxf8nF3imb5YUE0OmuD89TDSmPU7aRBvJnWK001H9iKLmwwGpKxwms126rvtFtUrDpSXxQT1/IeSkE4FvJE70qRoU43SRkjAPx+HB1m3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215394; c=relaxed/simple;
	bh=xZyMIcm7Emay+xFbC5MyxDcgqVO90WS4L99HXwW+6Hk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NoZdpX8fuVAt7OgMnGrNhvffBtyas31UztcpxkL7YZpUYAso1hCT+klDvERG9kb6SPtbO2zAD6urYbnKT7ZyQpcsYhSB1uwJ/3RVG5OQviCrVLzaLccE0TtRbohPtulsQJPxKm23ScUgGj7tJGeDwoteNGxWPO5DwvGQEwxMVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=awqCuMAx; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="awqCuMAx"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1627996a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746215392; x=1746820192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KrPFlgS27l600n2Kx8nhkVj8oNRd5F87R7Vo3kXSj00=;
        b=awqCuMAxQoxCxGwnUal89a0oqpmzwMOIrpVdo/V/6almKVMcreIlLHJxAY25a54icW
         h2FjLoiCPhwcYuerksd8mi6jYs4Ats92vXUZnjpwEiHGm8Zuqy7JwMMmzN5KFAp6ccPc
         2lMSS7mgzielnbpl9EkXuqVYQUr0J8hy0fLO2qOPZLqxPVvfXrLlnrJzddm8dDTPXLHv
         LxC8Xy5DjDeS58/tioh30cwWe5T7osHcChxhvAgQxqjN9oOzKVIdaNLOB0ONYv/2e625
         p/EBtJ+nSBYIpTu96MKI1WlwSyXHVqq4/VnaoNVZySOeThK3sfu8KyKt35a/ZqPVKcQC
         sQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215392; x=1746820192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrPFlgS27l600n2Kx8nhkVj8oNRd5F87R7Vo3kXSj00=;
        b=it9bW2PLBpoo85c0afeCQaObMssiQZxn4anQdSeE10wwuK+mcaawehNLg1CVJpKHmG
         KSADhyQ8ESujLk8zGmxxgN9QSFcVjyWDstNungrl+yLdVLjkOF0vYLPnpofldrFRDh/7
         abpjOOLp/SjKd4pxXsf++ggwK27wC16rDvqmz8AoZTI/WWJf+nI5y+gzKnkJUHTiVL79
         yZpWkicUqvMyiWaSqbwnIgp3/t5Vv0VuKPJIZmzynVnbWPEdwvLp38IoFkmrPFaAQDNU
         M6fXJeoc36JZw82F6mPO0wXQTO4+NjNAbdF2pCyrvPxa5+414x2RkSsI5uf1x1JoL4RH
         0wVw==
X-Gm-Message-State: AOJu0YwGlfMrNq4yxquMD6X5UUVbfhoZeVDJwRJK3R+jNWyoSitnsMZd
	wKh5RSbolDe6VJPA6EpN0i9NaITuNRz/I8FTG2Aci44oNEMSrRhxfiBomJD3f5Nb8122s6LwGiq
	BDUldHQ==
X-Google-Smtp-Source: AGHT+IHXzAQ0WN3eqj8p8jAhysAFEED88RC2eQV6j4qy4qcb8ln2EPYngNWWfRwpth67Jppnp+Djkykw9B7Y
X-Received: from pjx5.prod.google.com ([2002:a17:90b:5685:b0:308:7499:3dfc])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5252:b0:305:2d68:8d39
 with SMTP id 98e67ed59e1d1-30a5ae1afa1mr914287a91.12.1746215392233; Fri, 02
 May 2025 12:49:52 -0700 (PDT)
Date: Fri, 02 May 2025 19:49:33 +0000
In-Reply-To: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746215384; l=4692;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=xZyMIcm7Emay+xFbC5MyxDcgqVO90WS4L99HXwW+6Hk=; b=EE7UxGSeqBLFuYi+yvie2LinkeCeYpZpxuYWPqyO8OCcsvPCrI1h9hI1BIOR9p84mNRtiHFW+
 Le+23ZPbyJ0DBcgy29twB0lxwDruxd62NKpCltJwh4iTSgQvt2KjuMs
X-Mailer: b4 0.14.2
Message-ID: <20250502-debugfs-rust-v4-4-788a9c6c2e77@google.com>
Subject: [PATCH v4 4/4] rust: samples: Add debugfs sample
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
 samples/rust/Kconfig         | 11 +++++++++
 samples/rust/Makefile        |  1 +
 samples/rust/rust_debugfs.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

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
index 0000000000000000000000000000000000000000..2b1119b7281fd15109b542e6853d4206c2c80afc
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,56 @@
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
+            let sub = debugfs.subdir(c_str!("subdir"));
+
+            // Create a single file in the subdirectory called "example" that will read from the
+            // `EXAMPLE` atomic variable.
+            sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
+                writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
+            });
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
2.49.0.906.g1f30a19c02-goog

