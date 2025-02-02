Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891AD38384;
	Sun,  2 Feb 2025 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501611; cv=none; b=qVDkk51aWwiTXH5SV7kxYztX2dLLpDTX0G2USXpf698H8sikm/9cCPY2v6S6bSEAGVBA5iW1njpjiO2gXmYq13yc+qk56m8M7SBWn/fnn1ujK5T4A5++a+As9mePGmWO2esrRjK3NOyNds0iSzfl4zmTbvaTl3S7kmxWGjQUw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501611; c=relaxed/simple;
	bh=/l/yqYUI25JHcLzcwMcBrWhtbhlMTOGAR488Z8bons4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCT2cQT7ShR46q+/ds0frBhgbbKEqpq3L7cOChfJh8dZ428Vqezz+mn+5E0/ZoDseHijb3RyAcuDGyGMi4HQ/3Mazs+ojnFV2NCblc+eAEHrSjvUVOWLquFP4bvMfLoslF4lP5priIhILqMVv1Up+DGqJksDtDbOuPA6+7YLm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=Q1d6zRTZ; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="Q1d6zRTZ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C0B3242CC4;
	Sun,  2 Feb 2025 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501607;
	bh=/l/yqYUI25JHcLzcwMcBrWhtbhlMTOGAR488Z8bons4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q1d6zRTZJ4O6vYmZeKYI/dMmURcPQcUkgzn7B0XvDog6QeDRPMPNjRMBp5Oh+dDWs
	 fBKDBU6JMWUawsCrpr+SCfTXQnkcnfb5I3cwQbqLHu2mf+BRrHDcBcJiTDnDY9siL6
	 m6p+zuQZoIez31D62jvfEf0R9fnoa3LDPuhdrc18zVYA6dsnHDASD8vVK2finjxFXD
	 9+GkECLq4Vigayi1UGdSEgoy4ynEWax1Q/RkcUFIlmWVZMgVh23du/1cBc8QyRdqhD
	 TMuB9MR8N2FLceLZtF6GbPWpGwVq+BarP2VPQSigR+sdaG+H5fFDHQ3bGFfzxgNb4L
	 +8SDCfsLI9j6Q==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:47 +0900
Subject: [PATCH 5/6] rust: page: Add physical address conversion functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Valentin Obst <kernel@valentinobst.de>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=5914;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=/l/yqYUI25JHcLzcwMcBrWhtbhlMTOGAR488Z8bons4=;
 b=smOvr2ghPdeB8WGsuSZMnK+RdiZl/ggO1sjUJa9nF7n897PX4BZqpGtxrsCgRD0xgyLMFsN4C
 lONdvO0e8EiCCt7Wqof9tOCVkpiKbnePQ+jExk4ZKxJ5pM1CvRROa5X
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

Add methods to allow code using the Page type to obtain the physical
address of a page, convert to and from an (owned) physical address, and
borrow a Page from a physical address. Most of these operations are, as
you might expect, unsafe.

These primitives are useful to implement page table structures in Rust,
and to implement arbitrary physical memory access (as needed to walk
arbitrary page tables and dereference through them). These mechanisms
are, of course, fraught with danger, and are only expected to be used
for core memory management code (in e.g. drivers with their own device
page table implementations) and for debug features such as crash dumps
of device memory.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/helpers/page.c | 26 +++++++++++++++++++++
 rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce7806329b8f040a7d4205bb3 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/io.h>
 #include <linux/gfp.h>
 #include <linux/highmem.h>
 
@@ -17,3 +18,28 @@ void rust_helper_kunmap_local(const void *addr)
 {
 	kunmap_local(addr);
 }
+
+struct page *rust_helper_phys_to_page(phys_addr_t phys)
+{
+	return phys_to_page(phys);
+}
+
+phys_addr_t rust_helper_page_to_phys(struct page *page)
+{
+	return page_to_phys(page);
+}
+
+unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
+{
+	return __phys_to_pfn(phys);
+}
+
+struct page *rust_helper_pfn_to_page(unsigned long pfn)
+{
+	return pfn_to_page(pfn);
+}
+
+bool rust_helper_pfn_valid(unsigned long pfn)
+{
+	return pfn_valid(pfn);
+}
diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de2be639ed8e1fbc2ba 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -3,6 +3,7 @@
 //! Kernel page allocation and management.
 
 use crate::{
+    addr::*,
     alloc::{AllocError, Flags},
     bindings,
     error::code::*,
@@ -10,6 +11,7 @@
     types::{Opaque, Ownable, Owned},
     uaccess::UserSliceReader,
 };
+use core::mem::ManuallyDrop;
 use core::ptr::{self, NonNull};
 
 /// A bitwise shift for the page size.
@@ -249,6 +251,69 @@ pub unsafe fn copy_from_user_slice_raw(
             reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) })
         })
     }
+
+    /// Returns the physical address of this page.
+    pub fn phys(&self) -> PhysicalAddr {
+        // SAFETY: `page` is valid due to the type invariants on `Page`.
+        unsafe { bindings::page_to_phys(self.as_ptr()) }
+    }
+
+    /// Converts a Rust-owned Page into its physical address.
+    ///
+    /// The caller is responsible for calling [`Page::from_phys()`] to avoid leaking memory.
+    pub fn into_phys(this: Owned<Self>) -> PhysicalAddr {
+        ManuallyDrop::new(this).phys()
+    }
+
+    /// Converts a physical address to a Rust-owned Page.
+    ///
+    /// # Safety
+    /// The caller must ensure that the physical address was previously returned by a call to
+    /// [`Page::into_phys()`], and that the physical address is no longer used after this call,
+    /// nor is [`Page::from_phys()`] called again on it.
+    pub unsafe fn from_phys(phys: PhysicalAddr) -> Owned<Self> {
+        // SAFETY: By the safety requirements, the physical address must be valid and
+        // have come from `into_phys()`, so phys_to_page() cannot fail and
+        // must return the original struct page pointer.
+        unsafe { Owned::from_raw(NonNull::new_unchecked(bindings::phys_to_page(phys)).cast()) }
+    }
+
+    /// Borrows a Page from a physical address, without taking over ownership.
+    ///
+    /// If the physical address does not have a `struct page` entry or is not
+    /// part of a System RAM region, returns None.
+    ///
+    /// # Safety
+    /// The caller must ensure that the physical address, if it is backed by a `struct page`,
+    /// remains available for the duration of the borrowed lifetime.
+    pub unsafe fn borrow_phys(phys: &PhysicalAddr) -> Option<&Self> {
+        // SAFETY: This is always safe, as it is just arithmetic
+        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
+        // SAFETY: This function is safe to call with any pfn
+        if !unsafe { bindings::pfn_valid(pfn) && bindings::page_is_ram(pfn) != 0 } {
+            None
+        } else {
+            // SAFETY: We have just checked that the pfn is valid above, so it must
+            // have a corresponding struct page. By the safety requirements, we can
+            // return a borrowed reference to it.
+            Some(unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) })
+        }
+    }
+
+    /// Borrows a Page from a physical address, without taking over ownership
+    /// nor checking for validity.
+    ///
+    /// # Safety
+    /// The caller must ensure that the physical address is backed by a `struct page` and
+    /// corresponds to System RAM. This is true when the address was returned by
+    /// [`Page::into_phys()`].
+    pub unsafe fn borrow_phys_unchecked(phys: &PhysicalAddr) -> &Self {
+        // SAFETY: This is always safe, as it is just arithmetic
+        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
+        // SAFETY: The caller guarantees that the pfn is valid. By the safety
+        // requirements, we can return a borrowed reference to it.
+        unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) }
+    }
 }
 
 // SAFETY: `Owned<Page>` objects returned by Page::alloc_page() follow the requirements of

-- 
2.47.1

