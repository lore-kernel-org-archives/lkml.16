Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0641A238C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213707; cv=none; b=oLQ6DS4dm6vh4Ol7NWevu0TEVsuTM9xn5qZrMK44VcGdeI14oAWt6IgkpnyIUuAimL4TaKyRMEdUQz2qNn0/s7wcc7k38ALpgfnRROsQZxa6HoUVT13bZDTkpabsmWZoKf6D9hn3ti3sNorF47AXiAdGIcuNpvgqlxXfyXw1nLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213707; c=relaxed/simple;
	bh=HZtfPBC4n0E27+dbcVZVZ57XQoajwE/SYNBOe9gGdCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E021GsBCsho/Qk+oA7IdtKN1jTbwM51ooSzZQ1Ccbgb//oTzRtU6xC43WWbJKBV4R9JO+PyGMhrUTNtRZpn/9E5P633ESm0Ru2PMjSY8faBWkeL8yvLdxqur+hOcuveGoMDqs67aHC8dfU20yhJaL9RBO931HlIck5p3lQAZPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geIOGMQX; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geIOGMQX"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311e7337f26so4840307a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213703; x=1750818503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Q8Nw6mlyBHF9qBVYKCPAg9oNZqZ6LaJAuX3s9e570=;
        b=geIOGMQXdjkim59obsi87FbgMjlBTnwcvbWhjSyRAnYBZ6b5wlmx5KZDFddHxJruJB
         BQosrHrOCENHXLbs7V4j67kuh1L4YJNAALQVtb+p5wZ0I+gy/jfoIxmJAjf9/iBlEiK6
         0WnutmZDWlTdt3bdp/vOup7sXDdJWzBHCWkAEhwRVXcTAG2sUeTa7S7FL0girZoUThGY
         FKBZw+rglk2H9umEVOVlwLCO2OE3PR9jlCdmrB7sbrZuFODpCydd9+hY3+cSyyajkmqb
         s7ZKSkLCi7cwKWHlpWFkpm60J6CZnvv0aurm6GZeORI0pOIEVJ+W1JAbhhYJ90TGcJyz
         meLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213703; x=1750818503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Q8Nw6mlyBHF9qBVYKCPAg9oNZqZ6LaJAuX3s9e570=;
        b=rp4BwB7c+7ohzJ91DqOjrXpPhfBkgCG0UtS8RitQrZWHZwbTkj7lJRRFBPjx94U8fX
         8Jr7xO473syt81CbWSFc2sA94E/pVpqSLngahSM57BM40K7IXA1WoixwGBuqu20mtNp4
         AFrKso3rgAwjAOzjbUXFMatXU+YXhkD1eOMS0ubtgqbRJU2Xh7+iY6+l3WmeuzF4N28m
         nWY5l9mJnwgEjS3y7TuLOPHQIzU6D2YnHu2l1QM+sQnzVGBjiy8GItGDGgoYLOMHb3FZ
         1amT5oBmNgbzz/GPpt6pPDl3l/Dfo11Bnr6JuzFpTQ6C30Mmxs7AdFFR4+YYKknGPueh
         1dzw==
X-Gm-Message-State: AOJu0Ywu09LZa5EEIIOjW1in2ZxrftlRVrBxuKQAtyTFpiLLmtd1EwRt
	d3+UyhwEwVK/ysvmBqNDLxZxSbh5jrJVooNGYjJdhYalgB15pr0d8B6UMV9PXFsorOQiqC+x3P5
	j7rFqMrGCpQ==
X-Google-Smtp-Source: AGHT+IGMrocnmpZoKTP5CgUfolQB0XBI3kC+HyC17pQsyW5dUa36ShR993kUy5qzOR4MNM5qDUQa7TyU0WUa
X-Received: from pjboh15.prod.google.com ([2002:a17:90b:3a4f:b0:311:485b:d057])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52c7:b0:311:eb85:96df
 with SMTP id 98e67ed59e1d1-313f1ca8c36mr26423642a91.17.1750213703508; Tue, 17
 Jun 2025 19:28:23 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:17 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=5582;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=HZtfPBC4n0E27+dbcVZVZ57XQoajwE/SYNBOe9gGdCY=; b=vOdS7amzhEE+WxWKkSQfdNvmMAOmuUiZelrtNUFxVti2MQ21qFT2joyBN0EsX5s6IgB7FY/K+
 xuMaZYoWqCsBr0b42v/0XQF3VfN2PB6cp2Q6kFbb0f9vqLgR9UVhgl5
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-5-72cae211b133@google.com>
Subject: [PATCH v6 5/5] rust: samples: Add debugfs sample
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Provides an example of using the Rust DebugFS bindings.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                  |  1 +
 samples/rust/Kconfig         | 11 +++++++
 samples/rust/Makefile        |  1 +
 samples/rust/rust_debugfs.rs | 76 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fda422023e30fe8821e4cd79b503693ecc6eb48c..7faa088cc08514acfec371b043d324bb52d2e7ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7382,6 +7382,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
 
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee0a8f67dca99c836596709a70c4fa..8eb2088b66b0646c7a1fba9cdccc9a6bb328defb 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
 
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
2.50.0.rc2.696.g1fc2a0284f-goog

