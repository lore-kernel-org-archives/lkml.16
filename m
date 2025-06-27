Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1609292B5E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066345; cv=none; b=hJEK7T1okez/2l7SCqoPaEi8ETFG/zSlgpQq+CYHUAqS7We68/Z/t4wBHWGd7RjYLdmJu5KosplgUz+83oMsqwACUEZrgJf0WyxFfeUjMIbAkT543A29gMNVZ9QMLP+6+e0GRUOA6EKymvTj3ZMaWQ7NW2EDqpEpSlXLFFIYEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066345; c=relaxed/simple;
	bh=zLOPr23btb/P2Q+bNErI5riOTp9hfWGYj59cKhKyl3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lE3DTCYa8iZDH7uF1S3XxIKvaMUfgWnAbHx/+muujp0HCQKvvC3BSJfhzcJb5rsd67Bo+XnU1IMDKhb7xwbDYNbLWxk3kte+XgBAA4f56ogBuO/iwEpXSYXfo7yhHojJAmd2G6Eo5DC0di3CfHUOoEXj7eRLtWZ85tT+2dOaOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwTE/p1f; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwTE/p1f"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso2355677a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066343; x=1751671143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYSKWILaHkU1OfYdFyMg39AM+0yljyAGiysqEp8n70A=;
        b=MwTE/p1fE75+Zz3OTjavzk7dUKmYmGiXFNVKVKs/6SFre2H2BADlGlLUrsX+zFzp2/
         N+YDFO5ZHJ/M/n9BzQR+6vBmCXQOFpyN3jI+7xDajJiMTXODzyTTnE/D3AyGB3T//JWM
         XLet1tOLlnuuhQ/C0b3SzOxEUWvZguZHe1GqaPZxLSNlJ7NRgst9/4BXlfswQMQz5yAC
         FrGIs+G4IqBkEP48pkPMzFFCZyCh8Yio9Z9g7Y+yBnu9hwljz4V1yAF2tvT4I9tqu+4+
         gki0liqlrvjt9cOYIOlRIIAgWTYovqXEO45h31ozSeWyCVJWdqWk53CFgG3PhVhSTc5S
         Uw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066343; x=1751671143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYSKWILaHkU1OfYdFyMg39AM+0yljyAGiysqEp8n70A=;
        b=sluc7MEnJ1Gb2sNCc39O4/lE0jMGbgEt3kQfeLf8tVBJaBbmqdUe8yJyViVyFVDi7B
         edJ7l9iSzeoV8vYosLLcUKwgXsDRlAvJwCQ4hSQLHmOWnBC4d3nNjr7yJV9nbD1Yd+DB
         QRsXfycrXeJCOgpsjN7po2P48O/U73Idlzw90Ij3i7Pf315N60rYTjz0P0YiZyR0NC2k
         gC0SvNBKAm2jVvPz2xT6RIUumVvt+ajJQGcvL9+cmlwVk1i5+zkC9NJFikPdX8jlRpyp
         TlgK2ji1vlDpZGvzP73nUOYJVaWKlLPoqzbxawXYWnxSVo7I2kFYID5oBjgF3jO5jrUB
         MGAA==
X-Gm-Message-State: AOJu0Ywqgddeov6VWUKw6QrH9CuOnvIYy8vsOlLNXWXi/vLSYVlV0omd
	MEQcivXyVT98DjFX1hP9BUc7Vtgi2ew0xlyLwOMjJWo8S+rH64VFrtGfLu2GmUGUuw5ZEwOzO1g
	3pVn/RWMp7w==
X-Google-Smtp-Source: AGHT+IE+Y7GHm/K1Vq+yCasbBH4sgxeF6wx8bTZ4uGjwS1XAJoUvWQvS6NqJ5QvX+Ml437xKVT5J2EZTcIUG
X-Received: from pjj5.prod.google.com ([2002:a17:90b:5545:b0:314:3438:8e79])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b0d:b0:311:df4b:4b93
 with SMTP id 98e67ed59e1d1-318c9106951mr7504640a91.7.1751066343031; Fri, 27
 Jun 2025 16:19:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:29 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=5627;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=zLOPr23btb/P2Q+bNErI5riOTp9hfWGYj59cKhKyl3M=; b=0pqWdWwjSCuBN0BzLJf896SS+iXUk/wx513y49aaWkud6WntkFbHaaTEzJ1okWZl0yAKgDKY2
 cpJ61WNa5RoBZzpH4tAt/d5kBHlIlf1bHGfak58BZiRVYx4zJ/U4V2L
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-6-c6526e413d40@google.com>
Subject: [PATCH v8 6/6] rust: samples: Add debugfs sample
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

Provides an example of using the Rust DebugFS bindings.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                  |  1 +
 samples/rust/Kconfig         | 11 +++++++
 samples/rust/Makefile        |  1 +
 samples/rust/rust_debugfs.rs | 76 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 551e3a6a16d9051a2d58a77614c458287da2bdcc..f55c99cb2907655d109cb1fa248cdec803b5ce9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7374,6 +7374,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
 
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee0a8f67dca99c836596709a70c4fa..01101db41ae31b08a86d048cdd27da8ef9bb23a2 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DEBUGFS
+	tristate "DebugFS Test Module"
+	depends on DEBUG_FS
+	help
+	  This option builds the Rust DebugFS Test module sample.
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
index bd2faad63b4f3befe7d1ed5139fe25c7a8b6d7f6..61276222a99f8cc6d7f84c26d0533b30815ebadd 100644
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
index 0000000000000000000000000000000000000000..6af9177c711a07764f0323e03a72d115287f1205
--- /dev/null
+++ b/samples/rust/rust_debugfs.rs
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Sample DebugFS exporting module
+
+use core::sync::atomic::{AtomicU32, Ordering};
+use kernel::c_str;
+use kernel::debugfs::{Dir, File};
+use kernel::prelude::*;
+use kernel::sync::{new_mutex, Arc};
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
+    // As we only hold these for drop effect (to remove the directory/files) we have a leading
+    // underscore to indicate to the compiler that we don't expect to use this field directly.
+    _debugfs: Dir,
+    _subdir: Dir,
+    _file: File,
+    _file_2: File,
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
+        // We `forget` the result to avoid deleting the file at the end of the scope.
+        let file = sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
+            writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
+        });
+        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 8\n" when read.
+
+        // Change the value in the variable displayed by the file. This is intended to demonstrate
+        // that the module can continue to change the value used by the file.
+        EXAMPLE.store(10, Ordering::Relaxed);
+        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 10\n" when read.
+
+        // In addition to globals, we can also attach any kind of owned data. Most commonly, this
+        // will look like an `Arc<MyObject>` as those can be shared with the rest of the module.
+        let my_arc = Arc::pin_init(new_mutex!(10), GFP_KERNEL)?;
+        // An `Arc<Mutex<usize>>` doesn't implement display, so let's give explicit instructions on
+        // how to print it
+        let file_2 = sub.fmt_file(c_str!("arc_backed"), my_arc.clone(), &|val, f| {
+            writeln!(f, "locked value: {:#010x}", *val.lock())
+        });
+
+        // Since it's an `Arc` and we cloned it, we continue to have access to `my_arc`. If this
+        // were real, we'd probably stash it in our module struct and do something with it when
+        // handling real calls.
+        *my_arc.lock() = 99;
+
+        // Save the handles we want to preserve to our module object. They will be automatically
+        // cleaned up when our module is unloaded.
+        Ok(Self {
+            _debugfs: debugfs,
+            _subdir: sub,
+            _file: file,
+            _file_2: file_2,
+        })
+    }
+}

-- 
2.50.0.727.gbf7dc18ff4-goog

