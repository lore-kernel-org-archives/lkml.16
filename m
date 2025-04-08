Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA9264F9B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104246; cv=none; b=E2fknNoMR6LnsjoRiuzJEkH3vl8W9IEHZ1WFW64csTMpBiD+er2E/ZR0AwNDDD/1kWbI2bxlDTD7zRcGBm2P1mjtBPbcDg3c/EtvsGRHSYiKdtDKbA/WwsJ3Y62SIDO00+mj/TA6xdRShpXVosD1APiDJ+PGUC7KzzjO0GOmp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104246; c=relaxed/simple;
	bh=GtH47wxbR+6d0aNTneO5pMigxZ/fp5PImw8k1ccf9Tg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p62iJ4HeCLzf/231cgDaqsHT+ucVDTNpnhS/ZvKj6F+hCT1qpCzxGq7aHFYzS5wbHJdOc61CnQgmCPhCdANDq7p+yWH9kSuUK/KR8nScgpzKQQgOPLvqdyzrp66YDjwJ2smWoDcKrn4pE53t6u1oubSJtUpzO84/u4aP/ty9I/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hS4XC6CF; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hS4XC6CF"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43eed325461so14243175e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104243; x=1744709043; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QyemcvIui2lVzxcGzSSLvwxhrDIAPa4Re4ibbE0iVw=;
        b=hS4XC6CFP/C5yFWMA2XlCssYWt9LoWKx8xYTL099tAxMdFARMsO73ZyiA2zsZlfVwB
         Lwp1iExQqNFNBJbb81wxlTkdy+znYN7ufD+wClloLgZucAc7lwCaDNxCmojnb53b8QSG
         ttED+FbiBz1BQWrhQGEFxSCIZZb4hWx1inZAb9odpCuQ3iSiRwLei6LZzG41OWnZfxnD
         AGQcxTO7yNr+JoYviyRPg10IUqU2nDIbZXDdH+IHib9yuY2j7YawOZmA2m0GPfm8dB9p
         kGBBkP4nIjhL0XXl2rUFcMxCKT0MS9DG3VILCmhwaoD5sbPbj8vIZAzykJQDBOGbAPHG
         BNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104243; x=1744709043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QyemcvIui2lVzxcGzSSLvwxhrDIAPa4Re4ibbE0iVw=;
        b=MQG2GZ0fAnHAN8arBcg5OCBe74Gz/hz559l1poMEZNhq/8JEzzQyss8jcrrmTpoSpW
         9pExqH1OSV4nZI1YfNMn0UpNT4rqkiRx29nO6yEQaE0jI4f9/8exNwwrY/csNaapSLVY
         rfhdMVqvqWDYBkp79NvWR8CETeRIqHzheeX9zaqffVzDJcCmN89Bs2h5l4GH0dIemVd8
         hFfKLvvbrb8EfF8pgw47wo2/e6eOtU0/8sBTsTLlpeUh9j6DhiQ6fsGtDzekCE4Oy52u
         iCVbtfcSLQfJ/okysSxLB8WPAyZqQ/Jn8+i22p06oT9OSquo0YzfOl49JA9nnv70dwtm
         aHFA==
X-Forwarded-Encrypted: i=1; AJvYcCUhWs1CXGl9fzw8sCW8xhfPdtNl2P5vwDh85+fTwH3bqyOwRtY/L8vk4TzJMMasrx82oo8epldoQtDqmw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFd0QQHWOPqHjAVATIAbP4fH97uGvyLAo/Sezuzt4zezD42Ek
	c9y1DCpHUBgFQ3I+1jb02mzdeDSKzGYZ8tbJnh6ze6aO3QTHUs3V8ajO5s0Bu1O6P/4dqkRiVfd
	cMTl19UeeACZLxQ==
X-Google-Smtp-Source: AGHT+IFxxFUu1qGOXyvkCU5XAz4kFicPKHdX0TfjTmS5tS8Ie5mgbTz+4dEhe4qW9IslRJpSem7hRyy9es0XXr0=
X-Received: from wmbh17.prod.google.com ([2002:a05:600c:a111:b0:43d:8f:dd29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b94:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f0ab8c6d2mr38195215e9.13.1744104242867;
 Tue, 08 Apr 2025 02:24:02 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:39 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=12083; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GtH47wxbR+6d0aNTneO5pMigxZ/fp5PImw8k1ccf9Tg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9OsmVSvhUiA913nl+JAw+MlOHGWc8EvMXmmCp
 FwIUbqzQCWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrJgAKCRAEWL7uWMY5
 RkWHEACjkc6iHWBOlrZetxMPhzthtkwd5NgmH0SN7rYXNpTp64E3opnX715hk0ef5PRZ5Nm/iIb
 OtkXcUfufrOdrLx+/qYdaVCOz06KYK7WD4uis3zU5B0Ri+aRTVulNIGlXRqepDmR3pYbp8PPF07
 0Bu1WvumxR1Xim2M9XHDCOtyAd4G0vry0F+zjHGvWeleJmyha06PKWRZYj2bfpj+dtj7CHk+sE8
 vaeAWQ91zCa0KwO8YUxDp2K1aQWMob4/+8GBkmrVq6XlGaWDd0cL6m6xqdcAaDXD9gBZ796xiaa
 tQyDvkO3tysYm+xTpw6NZ4pGfOIaFQugyjqhWbcLDuEPU7X6F67NZKIqf5ABJmqHcFniTyg8v9a
 8uH2eJawIb6+7ZFgtzUdd2jcAmZxI58iVRiO2mzS5DMqX/KaCN+9nyf04fqol4eSsbJUGJDyxkw
 y387YiEA7VvHmYLbmmL0MqGs/u4koer7PHf2RPIANMWwarx4bceJPj2cB1L/JekMsMd6kC3uDNV
 i/5sM6BW2h+/uyu8vQMJBdH5xkUx0Rh73TCsADJOR22xGNHWo2v+9JFZU7kB8PwQBJrK3Px5GIc
 qBcE0dFheejnjo5NRQabW0CDywfmxR0dq969Q79nhVQDdkCNFzCNY4rCQ1YJ0IZvdgzRzXKqXkH cL7GVSoLH/eHi7w==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-2-d8b446e885d9@google.com>
Subject: [PATCH v16 2/9] mm: rust: add vm_area_struct methods that require
 read access
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a type called VmaRef which is used when referencing a vma that
you have read access to. Here, read access means that you hold either
the mmap read lock or the vma read lock (or stronger).

Additionally, a vma_lookup method is added to the mmap read guard, which
enables you to obtain a &VmaRef in safe Rust code.

This patch only provides a way to lock the mmap read lock, but a
follow-up patch also provides a way to just lock the vma read lock.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c      |   6 ++
 rust/kernel/mm.rs      |  23 ++++++
 rust/kernel/mm/virt.rs | 210 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7201747a5d314b2b120b30c0b906715c04ca77a5..7b72eb065a3e1173c920f02a440053cf6e93814e 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -37,3 +37,9 @@ void rust_helper_mmap_read_unlock(struct mm_struct *mm)
 {
 	mmap_read_unlock(mm);
 }
+
+struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
+					      unsigned long addr)
+{
+	return vma_lookup(mm, addr);
+}
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index eda7a479cff7e79760bb49eb4bb16209bbfc6147..f1689ccb374078a3141489e487fc32cd97c9c232 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -18,6 +18,8 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+pub mod virt;
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This represents the address space of a userspace process, so each process has one `Mm`
@@ -201,6 +203,27 @@ pub struct MmapReadGuard<'a> {
     _nts: NotThreadSafe,
 }
 
+impl<'a> MmapReadGuard<'a> {
+    /// Look up a vma at the given address.
+    #[inline]
+    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmaRef> {
+        // SAFETY: By the type invariants we hold the mmap read guard, so we can safely call this
+        // method. Any value is okay for `vma_addr`.
+        let vma = unsafe { bindings::vma_lookup(self.mm.as_raw(), vma_addr) };
+
+        if vma.is_null() {
+            None
+        } else {
+            // SAFETY: We just checked that a vma was found, so the pointer references a valid vma.
+            //
+            // Furthermore, the returned vma is still under the protection of the read lock guard
+            // and can be used while the mmap read lock is still held. That the vma is not used
+            // after the MmapReadGuard gets dropped is enforced by the borrow-checker.
+            unsafe { Some(virt::VmaRef::from_raw(vma)) }
+        }
+    }
+}
+
 impl Drop for MmapReadGuard<'_> {
     #[inline]
     fn drop(&mut self) {
diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a66be649f0b8d3dfae8ce2d18b70cb2b283fb7fe
--- /dev/null
+++ b/rust/kernel/mm/virt.rs
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Virtual memory.
+//!
+//! This module deals with managing a single VMA in the address space of a userspace process. Each
+//! VMA corresponds to a region of memory that the userspace process can access, and the VMA lets
+//! you control what happens when userspace reads or writes to that region of memory.
+//!
+//! The module has several different Rust types that all correspond to the C type called
+//! `vm_area_struct`. The different structs represent what kind of access you have to the VMA, e.g.
+//! [`VmaRef`] is used when you hold the mmap or vma read lock. Using the appropriate struct
+//! ensures that you can't, for example, accidentally call a function that requires holding the
+//! write lock when you only hold the read lock.
+
+use crate::{bindings, mm::MmWithUser, types::Opaque};
+
+/// A wrapper for the kernel's `struct vm_area_struct` with read access.
+///
+/// It represents an area of virtual memory.
+///
+/// # Invariants
+///
+/// The caller must hold the mmap read lock or the vma read lock.
+#[repr(transparent)]
+pub struct VmaRef {
+    vma: Opaque<bindings::vm_area_struct>,
+}
+
+// Methods you can call when holding the mmap or vma read lock (or stronger). They must be usable
+// no matter what the vma flags are.
+impl VmaRef {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is valid for the duration of 'a, and that the mmap or vma
+    /// read lock (or stronger) is held for at least the duration of 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Returns a raw pointer to this area.
+    #[inline]
+    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
+        self.vma.get()
+    }
+
+    /// Access the underlying `mm_struct`.
+    #[inline]
+    pub fn mm(&self) -> &MmWithUser {
+        // SAFETY: By the type invariants, this `vm_area_struct` is valid and we hold the mmap/vma
+        // read lock or stronger. This implies that the underlying mm has a non-zero value of
+        // `mm_users`.
+        unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
+    }
+
+    /// Returns the flags associated with the virtual memory area.
+    ///
+    /// The possible flags are a combination of the constants in [`flags`].
+    #[inline]
+    pub fn flags(&self) -> vm_flags_t {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags }
+    }
+
+    /// Returns the (inclusive) start address of the virtual memory area.
+    #[inline]
+    pub fn start(&self) -> usize {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_start }
+    }
+
+    /// Returns the (exclusive) end address of the virtual memory area.
+    #[inline]
+    pub fn end(&self) -> usize {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
+    }
+
+    /// Zap pages in the given page range.
+    ///
+    /// This clears page table mappings for the range at the leaf level, leaving all other page
+    /// tables intact, and freeing any memory referenced by the VMA in this range. That is,
+    /// anonymous memory is completely freed, file-backed memory has its reference count on page
+    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
+    ///
+    /// It may seem odd that we clear at the leaf level, this is however a product of the page
+    /// table structure used to map physical memory into a virtual address space - each virtual
+    /// address actually consists of a bitmap of array indices into page tables, which form a
+    /// hierarchical page table level structure.
+    ///
+    /// As a result, each page table level maps a multiple of page table levels below, and thus
+    /// span ever increasing ranges of pages. At the leaf or PTE level, we map the actual physical
+    /// memory.
+    ///
+    /// It is here where a zap operates, as it the only place we can be certain of clearing without
+    /// impacting any other virtual mappings. It is an implementation detail as to whether the
+    /// kernel goes further in freeing unused page tables, but for the purposes of this operation
+    /// we must only assume that the leaf level is cleared.
+    #[inline]
+    pub fn zap_page_range_single(&self, address: usize, size: usize) {
+        let (end, did_overflow) = address.overflowing_add(size);
+        if did_overflow || address < self.start() || self.end() < end {
+            // TODO: call WARN_ONCE once Rust version of it is added
+            return;
+        }
+
+        // SAFETY: By the type invariants, the caller has read access to this VMA, which is
+        // sufficient for this method call. This method has no requirements on the vma flags. The
+        // address range is checked to be within the vma.
+        unsafe {
+            bindings::zap_page_range_single(self.as_ptr(), address, size, core::ptr::null_mut())
+        };
+    }
+}
+
+/// The integer type used for vma flags.
+#[doc(inline)]
+pub use bindings::vm_flags_t;
+
+/// All possible flags for [`VmaRef`].
+pub mod flags {
+    use super::vm_flags_t;
+    use crate::bindings;
+
+    /// No flags are set.
+    pub const NONE: vm_flags_t = bindings::VM_NONE as _;
+
+    /// Mapping allows reads.
+    pub const READ: vm_flags_t = bindings::VM_READ as _;
+
+    /// Mapping allows writes.
+    pub const WRITE: vm_flags_t = bindings::VM_WRITE as _;
+
+    /// Mapping allows execution.
+    pub const EXEC: vm_flags_t = bindings::VM_EXEC as _;
+
+    /// Mapping is shared.
+    pub const SHARED: vm_flags_t = bindings::VM_SHARED as _;
+
+    /// Mapping may be updated to allow reads.
+    pub const MAYREAD: vm_flags_t = bindings::VM_MAYREAD as _;
+
+    /// Mapping may be updated to allow writes.
+    pub const MAYWRITE: vm_flags_t = bindings::VM_MAYWRITE as _;
+
+    /// Mapping may be updated to allow execution.
+    pub const MAYEXEC: vm_flags_t = bindings::VM_MAYEXEC as _;
+
+    /// Mapping may be updated to be shared.
+    pub const MAYSHARE: vm_flags_t = bindings::VM_MAYSHARE as _;
+
+    /// Page-ranges managed without `struct page`, just pure PFN.
+    pub const PFNMAP: vm_flags_t = bindings::VM_PFNMAP as _;
+
+    /// Memory mapped I/O or similar.
+    pub const IO: vm_flags_t = bindings::VM_IO as _;
+
+    /// Do not copy this vma on fork.
+    pub const DONTCOPY: vm_flags_t = bindings::VM_DONTCOPY as _;
+
+    /// Cannot expand with mremap().
+    pub const DONTEXPAND: vm_flags_t = bindings::VM_DONTEXPAND as _;
+
+    /// Lock the pages covered when they are faulted in.
+    pub const LOCKONFAULT: vm_flags_t = bindings::VM_LOCKONFAULT as _;
+
+    /// Is a VM accounted object.
+    pub const ACCOUNT: vm_flags_t = bindings::VM_ACCOUNT as _;
+
+    /// Should the VM suppress accounting.
+    pub const NORESERVE: vm_flags_t = bindings::VM_NORESERVE as _;
+
+    /// Huge TLB Page VM.
+    pub const HUGETLB: vm_flags_t = bindings::VM_HUGETLB as _;
+
+    /// Synchronous page faults. (DAX-specific)
+    pub const SYNC: vm_flags_t = bindings::VM_SYNC as _;
+
+    /// Architecture-specific flag.
+    pub const ARCH_1: vm_flags_t = bindings::VM_ARCH_1 as _;
+
+    /// Wipe VMA contents in child on fork.
+    pub const WIPEONFORK: vm_flags_t = bindings::VM_WIPEONFORK as _;
+
+    /// Do not include in the core dump.
+    pub const DONTDUMP: vm_flags_t = bindings::VM_DONTDUMP as _;
+
+    /// Not soft dirty clean area.
+    pub const SOFTDIRTY: vm_flags_t = bindings::VM_SOFTDIRTY as _;
+
+    /// Can contain `struct page` and pure PFN pages.
+    pub const MIXEDMAP: vm_flags_t = bindings::VM_MIXEDMAP as _;
+
+    /// MADV_HUGEPAGE marked this vma.
+    pub const HUGEPAGE: vm_flags_t = bindings::VM_HUGEPAGE as _;
+
+    /// MADV_NOHUGEPAGE marked this vma.
+    pub const NOHUGEPAGE: vm_flags_t = bindings::VM_NOHUGEPAGE as _;
+
+    /// KSM may merge identical pages.
+    pub const MERGEABLE: vm_flags_t = bindings::VM_MERGEABLE as _;
+}

-- 
2.49.0.504.g3bcea36a83-goog

