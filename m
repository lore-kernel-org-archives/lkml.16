Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77826267738
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139674; cv=none; b=AsbmXyvP1noJOyC+ubNS4yCDaEGSmKi7fP1KMuldQy1xw/u5NQfWCK3S2Q/q5T1aQhSXUpCJXn6NJMqlr6E2CXH9aa123WhaSHwP2F4QA0IvC58BityDQb76Iqtvr2POzsOkjwkphxgXUiacs4BZfosiDFXF5EUuLrtVnE2L68c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139674; c=relaxed/simple;
	bh=Kux678it5JwswESl98vCNed292y211bNittJAL641JM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b2mHL1yb60A+bEjOP9JkyLdmvESF8hVni3Dk81twPBFmsnpz14s9f+dBz69SN6/WKU+FLPxTcTLsLXZ3wFNjrK+jlAT61x7AaXQJRkv/zSmE9oLTV2ACmyQxb2s1Kzoo+JgGj/oZBZPvQajqzLLnw4ZtmqzFJv1Uu4JhTi++rOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TODPacFG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TODPacFG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-224364f2492so13125315ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746139672; x=1746744472; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmtC1RujjIPLNELPkpAAOYKIfd0scSadrJC8Lm1a8Ww=;
        b=TODPacFG0JQuEGODYTt4K2Al76KvyoT7DVRvW5BlzX1DiKM5Wqlnt/19khdet1Lt+J
         UaCiUTw9wmY5OzYo8ic4X1/RrZuYIbDmHsB1qW+qPGz4lfsqHJr1mcmvTcJJ9KlLo1WO
         Ay9aDiMx82ArVltfK0uP7bSb07+LVYRjNxclw1JDZesCfpUBlHsJZNeDoa1DLpQzBjvc
         bGuvh9Uw8zIZsXnzUwk2G2PsX3O2g+uD5uMKLsskg6MYPS9IoBmYzXvzDmIU8ck/QjMx
         oxTjoPkXjIA8k6WoY4FZACbH9NPq7y5Jxfb2ZAwmLTscuQ6mQ4g/oqBTNcvKnFjWMoPL
         +EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746139672; x=1746744472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmtC1RujjIPLNELPkpAAOYKIfd0scSadrJC8Lm1a8Ww=;
        b=te16P73hOUcuGyrb4eoKZEcJR6tp5+rIMGEdk5z+1Fp6AoNOLNd4KDwPtakif3tYGe
         CFiord0GYu/4hYkZ1+5BwZCK4xqruTze0DijFJgfI7oXmv52vczpjxXkf1Di1lQDEqi+
         w9HWre+ncTzHV6p4LJ+yv/9H85IbSIeuUzZIzX0ACnp6W/zXjSyMOgc/wyaHMObPYzvv
         Td83xuH00D0X1kaEFFjAQZNlx7U1osSC93OG8C3pXU/wzVeExFDvdSzywtCx6TauJycS
         nDcc/k70fSSS43x7/JcB8rfvInkKXcOpEgzmWurvpWWRq5WYa1LnMwz7I3ew2Dati4Rw
         jSSA==
X-Gm-Message-State: AOJu0Ywnf7sFCwjMpq690lJ93VTdknKIuJHCF2kUN0Myh0MYBC3w/w33
	8RIor0zexSmC5mLumQFbQunVpaIKutj8ELOsJp4gsOoBCX1v2YNEBocjZlapJta7AlPFwHu1YVK
	xIiUSsg==
X-Google-Smtp-Source: AGHT+IGRSoPIUWL5vu0fwQaTzDohYuzNK1EdjKDNo2MIULwo4EUZv4IW6G+QuI2GRpfgFpdbKPcqjGSXRgo/
X-Received: from plbkt6.prod.google.com ([2002:a17:903:886:b0:223:4fa3:bcbd])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:198c:b0:224:2175:b0cd
 with SMTP id d9443c01a7336-22e1032d8e5mr9648405ad.26.1746139671837; Thu, 01
 May 2025 15:47:51 -0700 (PDT)
Date: Thu, 01 May 2025 22:47:44 +0000
In-Reply-To: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746139663; l=4627;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Kux678it5JwswESl98vCNed292y211bNittJAL641JM=; b=2KCYhVvZke5bDHRUAfSbO1GTxTBP/DKHmRyy2lmaF0oiqMwDU7IbaIY4t1EP3O99TO+EcbgKT
 GOG7N053QKyAhjUQmQh57lN+t8cUOqjSmYTLdbqx8gKAj5zlU4Ns9lz
X-Mailer: b4 0.14.2
Message-ID: <20250501-debugfs-rust-v3-4-850869fab672@google.com>
Subject: [PATCH v3 4/4] rust: samples: Add debugfs sample
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
 samples/rust/rust_debugfs.rs | 54 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)

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
index 0000000000000000000000000000000000000000..b22255667f3bb91b10555ac8b91be850cd5f172e
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,54 @@
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
+    _debugfs: Dir,
+}
+
+static EXAMPLE: AtomicU32 = AtomicU32::new(8);
+
+impl kernel::Module for RustDebugFs {
+    fn init(_this: &'static ThisModule) -> Result<Self> {
+        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
+        let debugfs = Dir::new(c_str!("sample_debugfs"));
+
+        // Create a subdirectory, so "sample_debugfs/subdir" now exists.
+        let sub = debugfs.subdir(c_str!("subdir"));
+
+        // Create a single file in the subdirectory called "example" that will read from the
+        // `EXAMPLE` atomic variable.
+        sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
+            writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
+        });
+        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 8\n" when read.
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

