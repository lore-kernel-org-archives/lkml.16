Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DB25F7B0;
	Mon, 12 May 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043784; cv=none; b=F+y+yfZho+gruHPXtPh7Y1ChspLhJFZqrzETe8NC/qJzacbwd5w36z7D1OEXRi/s8smzieswwZhama2D2keaTpmKYZ+iP3Ts8ahcr0tZjI6eeN7I+1L+A+hBodSEXcPHXU8qE70ZqeTQ3/tkn6SwoXSWwcSg4D2se2QiLLnsvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043784; c=relaxed/simple;
	bh=ejf98AvbP7eN6an6nx4oFHS9YFPFVtY+tLswFiJ3dpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkFnlCiXOgnM775o6cjKzN2hvgTM0Oxq2ahdsWP4vl5Ki6lEWzwBrJEubVtEeX+PO0EoelUhztPzU1l2rUwd7syTQ4Mrvcvi8ZhuuWrj88OYCNjkS/FvBShPrNHn0N31vMtfVLp3yzUCOEB3b41zfSLqvfHWeA7RhIFp8vgmG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOUMUozK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOUMUozK"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b1095625dso5062172e87.0;
        Mon, 12 May 2025 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747043779; x=1747648579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYgSrCKK+BvJRqo75FcRAGXeQz+yl7joXi6D74Qth+I=;
        b=OOUMUozKndrDLACNVsCzJBQleOLxQKHQLN3VzuQXAWXVPTAn4Bx1QSTOn9Ur0ChNtV
         IsGfAv8dIc7mU7wnRcUUcPmKzYa8X1C+a61jQC0M+H3bg+hk9U1RAQsF3LnhuFkyKeDv
         p0JqSvVRJWxry0+qQyiWKNzUbkqDjSXD1a5cyCIZoESK3tyLRFbCJ6HcEuGI2FykBgu5
         AsUVqCkTSQR5k0ifeDNS3zDwrnYegWaYL6dVU0Shfwiuoa9UxKn0wOhAOCDkZdsh1ZXk
         hdCGkPySZrflaz2EptI69ZW0tBA1DjCFLZu+Bb2Z6AMTRPbGjk0M6s31NkjRCLKvISrI
         8oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043779; x=1747648579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYgSrCKK+BvJRqo75FcRAGXeQz+yl7joXi6D74Qth+I=;
        b=KkHBqGmidDr+37RMH4mqeeLUz/lNLbT0r7pqn3OxZo53oDHqDspzpPlJaLDbnYEfOw
         uWOpZzqxbOC6cck00TVu1bDRe5NZhzFgf5ezzqLydqncWS7leELT041vLWOOrwUQQayg
         vKnqC+2zSyWtyTRMlFaVtVdrbfbzb75bG5hd2ThH14P3pfMamlonEbMygk/rM1z4Yas8
         BJ2BEewrML7oHvTqH9BnSH9mcUlVlBZnKVghRCA8jo8pDlus2uaMJ6xwxDBhRUAIQw1s
         bH7Vho4f1J467LPTxnXXE2xOQcK6kpAx8X7lhdfREbUU0c4m4e1wMqzYtZx8PNapk6ia
         RGVw==
X-Forwarded-Encrypted: i=1; AJvYcCUTR6H+9QOTDPgpZO+Z3FZCn4fjwoI+cbMZwOV5/+cCvw3l8z0pJnCG800o9uOCgGlWm9RerrFLpUReGw5HvRI=@vger.kernel.org, AJvYcCWVDUfUxw0U3wE37Lq0A115UcFgrCAVcwIVk4Xy+dqgRGnUYs7ho5Gb/EoeqpKbNjK6llZKuRr16Po7DOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ndbiv0QyCnDhwWuHpKKlGwNqe2kVZUS4DXmvyA+YctclXY0d
	bf3F/FqEw6VM46HMm8MeBJXP2Ha4/YIOkG+6eKTMtUd4xlAhicWu
X-Gm-Gg: ASbGnctP3jURhtAhztdba5E5nR8YZAY1l2AMfGxRUDZtzUHRcdoFbn5LxVGndJUNdrQ
	naHNpQFoeeXXBPlTVpT151JXTjfRvnbJS/YahOJWSdIX9oa+I0h+Eokq581RvkTx5Id0MWr6EP0
	7iieooA8uUcRwaWJ3wSPKSGz8t2/XQ9MMmS7tYWwVBgm2C6TWIbarCo749uwGklUVUdNX4uXNCI
	Iop8KfLWh8D4sjDZ4tCet2jAJ5Md9qpXF9GEggIwBw9vtsIsVyGG+UZZcGfxN+E4yFRKuMU4Nqr
	PYVDn3DeZWo9UY5UZxmz3skHpP+2SezofXXGt37wcG4b8Y6xNTrwVfjZB+JDhHmQBPRCjsEaX+v
	lN7FP6wuq8Hsd3W7Ssul/JrQZKV+v
X-Google-Smtp-Source: AGHT+IFhCvOibD9ZqY6X3LDMCpSjyzVb+l6WNUXcenaRu0cNcqFF9Q4iteyNTmKQ6b/sQGqxI75TMg==
X-Received: by 2002:a05:6512:6612:b0:54f:c66b:8b73 with SMTP id 2adb3069b0e04-54fc67b8e96mr3944219e87.13.1747043778800;
        Mon, 12 May 2025 02:56:18 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fa48sm1460449e87.1.2025.05.12.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:56:18 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: dakr@kernel.org,
	lyude@redhat.com
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [RFC PATCH 1/2] rust: add initial scatterlist bindings
Date: Mon, 12 May 2025 12:53:27 +0300
Message-ID: <20250512095544.3334680-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rust abstraction for scatterlist. This allows use of the C
scatterlist within Rust code which the caller can allocate themselves
or to wrap existing kernel sg_table objects.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/scatterlist.c      |  25 +++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 275 ++++++++++++++++++++++++++++++++
 5 files changed, 303 insertions(+)
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/scatterlist.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70..a7d3b97cd4e0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -14,6 +14,7 @@
 #include <linux/cred.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-direction.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 1e7c84df7252..f45a15f88e25 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -28,6 +28,7 @@
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
+#include "scatterlist.c"
 #include "security.c"
 #include "signal.c"
 #include "slab.c"
diff --git a/rust/helpers/scatterlist.c b/rust/helpers/scatterlist.c
new file mode 100644
index 000000000000..5ab0826f7c0b
--- /dev/null
+++ b/rust/helpers/scatterlist.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-direction.h>
+
+void rust_helper_sg_set_page(struct scatterlist *sg, struct page *page,
+			     unsigned int len, unsigned int offset)
+{
+	return sg_set_page(sg, page, len, offset);
+}
+
+dma_addr_t rust_helper_sg_dma_address(struct scatterlist *sg)
+{
+	return sg_dma_address(sg);
+}
+
+unsigned int rust_helper_sg_dma_len(struct scatterlist *sg)
+{
+	return sg_dma_address(sg);
+}
+
+void rust_helper_dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
+				   enum dma_data_direction dir, unsigned long attrs)
+{
+	return dma_unmap_sgtable(dev, sgt, dir, attrs);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fa852886d4d1..a8d5fcb55388 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -87,6 +87,7 @@
 pub mod print;
 pub mod rbtree;
 pub mod revocable;
+pub mod scatterlist;
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
new file mode 100644
index 000000000000..122a6f94bf56
--- /dev/null
+++ b/rust/kernel/scatterlist.rs
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scatterlist
+//!
+//! C header: [`include/linux/scatterlist.h`](srctree/include/linux/scatterlist.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{Error, Result},
+    page::Page,
+    types::{ARef, Opaque},
+};
+use core::ops::{Deref, DerefMut};
+
+/// A single scatter-gather entry, representing a span of pages in the device's DMA address space.
+///
+/// # Invariants
+///
+/// The `scatterlist` pointer is valid for the lifetime of an SGEntry instance.
+#[repr(transparent)]
+pub struct SGEntry(Opaque<bindings::scatterlist>);
+
+impl SGEntry {
+    /// Convert a raw `struct scatterlist *` to a `&'a SGEntry`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the `struct scatterlist` pointed to by `ptr` is valid for the lifetime
+    /// of the returned reference.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::scatterlist) -> &'a Self {
+        // SAFETY: The pointer is valid and guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Convert a raw `struct scatterlist *` to a `&'a mut SGEntry`.
+    ///
+    /// # Safety
+    ///
+    /// See safety requirements of [`SGEntry::as_ref`]. In addition, callers must ensure that only
+    /// a single mutable reference can be taken from the same raw pointer, i.e. for the lifetime of the
+    /// returned reference, no other call to this function on the same `struct scatterlist *` should
+    /// be permitted.
+    unsafe fn as_mut<'a>(ptr: *mut bindings::scatterlist) -> &'a mut Self {
+        // SAFETY: The pointer is valid and guaranteed by the safety requirements of the function.
+        unsafe { &mut *ptr.cast() }
+    }
+
+    /// Returns the DMA address of this SG entry.
+    pub fn dma_address(&self) -> bindings::dma_addr_t {
+        // SAFETY: By the type invariant of `SGEntry`, ptr is valid.
+        unsafe { bindings::sg_dma_address(self.0.get()) }
+    }
+
+    /// Returns the length of this SG entry.
+    pub fn dma_len(&self) -> u32 {
+        // SAFETY: By the type invariant of `SGEntry`, ptr is valid.
+        unsafe { bindings::sg_dma_len(self.0.get()) }
+    }
+
+    /// Set this entry to point at a given page.
+    pub fn set_page(&mut self, page: &Page, length: u32, offset: u32) {
+        let c: *mut bindings::scatterlist = self.0.get();
+        // SAFETY: according to the `SGEntry` invariant, the scatterlist pointer is valid.
+        // `Page` invariant also ensure the pointer is valid.
+        unsafe { bindings::sg_set_page(c, page.as_ptr(), length, offset) };
+    }
+
+    /// Obtain the raw `struct scatterlist *`.
+    pub fn as_raw(&self) -> *mut bindings::scatterlist {
+        self.0.get()
+    }
+}
+
+/// DMA mapping direction.
+///
+/// Corresponds to the kernel's [`enum dma_data_direction`].
+///
+/// [`enum dma_data_direction`]: srctree/include/linux/dma-direction.h
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[repr(u32)]
+pub enum DmaDataDirection {
+    /// Direction isn't known.
+    DmaBidirectional = bindings::dma_data_direction_DMA_BIDIRECTIONAL,
+    /// Data is going from the memory to the device.
+    DmaToDevice = bindings::dma_data_direction_DMA_TO_DEVICE,
+    /// Data is coming from the device to the memory.
+    DmaFromDevice = bindings::dma_data_direction_DMA_FROM_DEVICE,
+    /// No direction (used for debugging).
+    DmaNone = bindings::dma_data_direction_DMA_NONE,
+}
+
+/// The base interface for a scatter-gather table of DMA address spans.
+///
+/// This structure represents the Rust abstraction for a C `struct sg_table`. This implementation
+/// abstracts the usage of an already existing C `struct sg_table` within Rust code that we get
+/// passed from the C side.
+///
+/// # Invariants
+///
+/// The `sg_table` pointer is valid for the lifetime of an SGTable instance.
+#[repr(transparent)]
+pub struct SGTable(Opaque<bindings::sg_table>);
+
+impl SGTable {
+    /// Convert a raw `struct sg_table *` to a `&'a SGTable`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the `struct sg_table` pointed to by `ptr` is initialized and valid for
+    /// the lifetime of the returned reference.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::sg_table) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Obtain the raw `struct sg_table *`.
+    pub fn as_raw(&self) -> *mut bindings::sg_table {
+        self.0.get()
+    }
+
+    /// Returns a mutable iterator over the scather-gather table.
+    pub fn iter_mut(&mut self) -> SGTableIterMut<'_> {
+        SGTableIterMut {
+            // SAFETY: dereferenced pointer is valid due to the type invariants on `SGTable`.
+            pos: Some(unsafe { SGEntry::as_mut((*self.0.get()).sgl) }),
+        }
+    }
+
+    /// Returns an iterator over the scather-gather table.
+    pub fn iter(&self) -> SGTableIter<'_> {
+        SGTableIter {
+            // SAFETY: dereferenced pointer is valid due to the type invariants on `SGTable`.
+            pos: Some(unsafe { SGEntry::as_ref((*self.0.get()).sgl) }),
+        }
+    }
+}
+
+/// SAFETY: The `SGTable` should be `Send` across threads.
+unsafe impl Send for SGTable {}
+
+/// A mutable iterator through `SGTable` entries.
+pub struct SGTableIterMut<'a> {
+    pos: Option<&'a mut SGEntry>,
+}
+
+impl<'a> IntoIterator for &'a mut SGTable {
+    type Item = &'a mut SGEntry;
+    type IntoIter = SGTableIterMut<'a>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter_mut()
+    }
+}
+
+impl<'a> Iterator for SGTableIterMut<'a> {
+    type Item = &'a mut SGEntry;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.pos.take().map(|entry| {
+            let sg = entry.as_raw();
+            // SAFETY: `sg` is guaranteed to be valid and non-NULL while inside this closure. The calls
+            // to `SGEntry::as_mut` are unique for each scatterlist entry object as well.
+            unsafe {
+                let next = bindings::sg_next(sg);
+                self.pos = (!next.is_null()).then(|| SGEntry::as_mut(next));
+                SGEntry::as_mut(sg)
+            }
+        })
+    }
+}
+
+/// An iterator through `SGTable` entries.
+pub struct SGTableIter<'a> {
+    pos: Option<&'a SGEntry>,
+}
+
+impl<'a> IntoIterator for &'a SGTable {
+    type Item = &'a SGEntry;
+    type IntoIter = SGTableIter<'a>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter()
+    }
+}
+
+impl<'a> Iterator for SGTableIter<'a> {
+    type Item = &'a SGEntry;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.pos.map(|entry| {
+            let sg = entry.as_raw();
+            // SAFETY: `sg` is guaranteed to be valid and non-NULL while inside this closure.
+            unsafe {
+                let next = bindings::sg_next(sg);
+                self.pos = (!next.is_null()).then(|| SGEntry::as_ref(next));
+                SGEntry::as_ref(sg)
+            }
+        })
+    }
+}
+
+/// A scatter-gather table that owns the allocation and can be mapped for DMA operation using `Device`.
+pub struct DeviceSGTable {
+    sg: SGTable,
+    dir: DmaDataDirection,
+    dev: ARef<Device>,
+}
+
+impl DeviceSGTable {
+    /// Allocate and construct the scatter-gather table.
+    pub fn alloc_table(dev: &Device, nents: usize, flags: kernel::alloc::Flags) -> Result<Self> {
+        let sgt: Opaque<bindings::sg_table> = Opaque::uninit();
+
+        // SAFETY: The sgt pointer is from the Opaque-wrapped `sg_table` object hence is valid.
+        let ret = unsafe { bindings::sg_alloc_table(sgt.get(), nents as _, flags.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self {
+            sg: SGTable(sgt),
+            dir: DmaDataDirection::DmaNone,
+            dev: dev.into(),
+        })
+    }
+
+    /// Map this scatter-gather table describing a buffer for DMA.
+    pub fn dma_map(&mut self, dir: DmaDataDirection) -> Result {
+        // SAFETY: Invariants on `Device` and `SGTable` ensures that the `self.dev` and `self.sg`
+        // pointers are valid.
+        let ret = unsafe {
+            bindings::dma_map_sgtable(
+                self.dev.as_raw(),
+                self.sg.as_raw(),
+                dir as _,
+                bindings::DMA_ATTR_NO_WARN as _,
+            )
+        };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        self.dir = dir;
+        Ok(())
+    }
+}
+
+// TODO: Implement these as macros for objects that want to derive from `SGTable`.
+impl Deref for DeviceSGTable {
+    type Target = SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        &self.sg
+    }
+}
+
+impl DerefMut for DeviceSGTable {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.sg
+    }
+}
+
+impl Drop for DeviceSGTable {
+    fn drop(&mut self) {
+        if self.dir != DmaDataDirection::DmaNone {
+            // SAFETY: Invariants on `Device` and `SGTable` ensures that the `self.dev` and `self.sg`
+            // pointers are valid.
+            unsafe {
+                bindings::dma_unmap_sgtable(self.dev.as_raw(), self.sg.as_raw(), self.dir as _, 0)
+            };
+        }
+        // SAFETY: Invariant on `SGTable` ensures that the `self.sg` pointer is valid.
+        unsafe { bindings::sg_free_table(self.sg.as_raw()) };
+    }
+}
-- 
2.43.0

