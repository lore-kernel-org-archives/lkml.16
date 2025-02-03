Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5E6204689
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584920; cv=none; b=Sfn/WDswBZ+2mQT3+Sb7z/OCLF04bX2vQ2ViKQPvKx3MesWLClICxE6Fczgfm7iSipRMb8Tcl6kLtHO7srFCjqMydQ+HUqT+d8N0bz6RlikdzYZ8sq85vDB21HtnqtZxhS9IVlzAorKlcd4ru7dXzrYhA6WkdE/SXOFfILeGQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584920; c=relaxed/simple;
	bh=/iebTH4KyLdhY2vEuCqOUZUvZGhbmsvxzfHd3W6xGAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sKEKkKNs1ra4UCvq2bSkYOYpdbrXYzKlPkRhHDRcLHWXXPw8BRWEj24Cgb7p8dUClgd19ST9vxpzmRMdmGViXOhj28pd7kyJsgUyKY38k6m38tE9r4DgPT9b1uymOh4WhrOnL26gPTdD+T83/SCVJkHVtyPsn2pmEUg0EN7w9vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooMUGhUV; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooMUGhUV"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38634103b0dso2712855f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584916; x=1739189716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsKBb44x7fv9WNumP7fvjTBcr8RrxO1zg/m2ciN2/Jk=;
        b=ooMUGhUVKcBmyVxGl2L/8wDPs3uL0GsXbUSVSSDD3k0VV5eAsNPqASv9ap1gMy5+Sh
         j4JqoKN/I4EtE73q1LoxoAu0P3kgKpcqJqF+fRM3Usz4DQevodJom0OdzfqNJeKuy5m/
         eL5KLQu3erP0QJLWVn7vzOe6cpSSt9ZeWNb2PU4bwaW5wOG1OF8i394fD7sWIFSJge/N
         Q2ZVM2u7WkRZ2TRjPPeAW5dLrvOrbEhnrwjzutK622JFb54t9k0XZwK/ySGGirZ/M1Hg
         Pi4Gh7m1YmaFNYjDf3fnloX0XdLIAhfrL2x8AidmaGWvLpODF18jSca1NUubvUu9j+Gw
         K+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584916; x=1739189716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsKBb44x7fv9WNumP7fvjTBcr8RrxO1zg/m2ciN2/Jk=;
        b=jJTdKO0CdsgGfZyNDZNS16IeOUVBdqvYoy1swU4vTjaHEG6d2Fua1IbewTtM8529Jf
         /ooKAlGB6Lxh7GMxIZe2cHNiHv3HleOPdW0433owmL5ykNKDNrOcjAkrx2qAk6MCqHlX
         D+MQjImIxizl7MlZuC5QRPrFnn1OZrzBdu6tKXQEuO6lvx1gf7Y9HDY1CvZ+trocsCDE
         20xxOkgO61uZCPs2YeMc7xIKrFnnlFpLXAoiJ+Z8eKCnyVf+WmvAwMsK1KaFwWVxJAdL
         8KgoGfPWoUg+CaY6SZgh2KoJh4yqVzBszX9Sq0E6m/QaF7PvSc3vM4v7teuUK99Dx3nc
         7tMA==
X-Forwarded-Encrypted: i=1; AJvYcCUpweTvdKgLotKPsVsZQzb1eMQ3ZjTj80TJyApYG0bdDgEaXLnQHDFI2Vb6axAGQPPHFK437wTKiONuorY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAQ74L5t5Hp13FFK/ic4XB0lJrh5nhmf70Bwj8oFi5mTBDC+z
	GVi3Vb/kPeqr0L4g0BwlB5Dbdq2Vvm8MPI1+LswUHXa1cSRVdbfHDwNRJQJbS16lRaer5ctoVUL
	KFdAwg7wNbo9wdg==
X-Google-Smtp-Source: AGHT+IGOresZtCVdJKJ16Ys67mlWuwAfUZhBuPWvVIUcEJB1FfKeHTp8NIO1djUpkZoFwaOzxSKnCdpKbygHPEE=
X-Received: from wmbbd13.prod.google.com ([2002:a05:600c:1f0d:b0:436:d819:e4eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e4:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38c51951c62mr17694566f8f.22.1738584916380;
 Mon, 03 Feb 2025 04:15:16 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:37 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11755; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/iebTH4KyLdhY2vEuCqOUZUvZGhbmsvxzfHd3W6xGAw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNJRZfEeR3BWa35+Ak8WITPcMAAKc+QWrycD
 kjuKVWdrXCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzSQAKCRAEWL7uWMY5
 RrjdD/9d3vmLpQxCmf2tyIFTe9dQwpb1iBMSAvRFzmKu4O1tCa5YWfrnaXETZ4zvdhKTX3g2KKb
 3ToivU/ExeDSdC3XpbFd2TrTitpNFUSYhuRbE3cVssUotjcfwhhJGblejNUYaxktpljVRyWObMD
 O5rGkdtaDB1BvhYoKzFlGK/3SwId0AmDQ29cFKVdYh28Uk+edlT8idXS0b46aRkmqvY39kjG2Gt
 b+HtofyaMg3gqzMGgfIv2avEIm2WGpcxrTMou87zLGpzfbpWknwXhLiOrX9zxtte6CyZPB5gNm6
 rht0AEZXCEOPEN2ISN0zBoITZR7B5yrQJmlZ06JaRSzX5wfTObamyJbJmys9FCoLfAI2tQfQG5d
 7t98kzkwdYl8XfmEBFT9e/7Kld5Hpa1XzQ+RSkBXYbjY3vmhKti5Ev7eX1YVMx42sGFgO7LvxNv
 cErtZCKMWoqxs6SfRz8WYi0ES19Ip63L1qWPda2Uu28USt3UBuPHHgxDgq1Vcbj+RmivpQaF/4I
 C7tBYlQevnitMD7q0YsGC6wMGRlLJ9ZbpVxOcw838c2tMn59KGT35NlRMzhzocKXlvnL9Nc7ndj
 /6FzQf6+ugL4N3/zCXMT1W1u6AaAoYY0WqgsLPNNQj3F0Prz2+BvJCloJ1aRSlhUBoquwK23CQ6 h5I822DNznDWZSg==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-2-2b998268a396@google.com>
Subject: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that require
 read access
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a type called VmAreaRef which is used when referencing a vma
that you have read access to. Here, read access means that you hold
either the mmap read lock or the vma read lock (or stronger).

Additionally, a vma_lookup method is added to the mmap read guard, which
enables you to obtain a &VmAreaRef in safe Rust code.

This patch only provides a way to lock the mmap read lock, but a
follow-up patch also provides a way to just lock the vma read lock.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c      |   6 ++
 rust/kernel/mm.rs      |  21 +++++
 rust/kernel/mm/virt.rs | 215 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7201747a5d31..7b72eb065a3e 100644
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
index 2fb5f440af60..bd6ff40f106f 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -17,6 +17,8 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+pub mod virt;
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This represents the address space of a userspace process, so each process has one `Mm`
@@ -200,6 +202,25 @@ pub struct MmapReadGuard<'a> {
     _nts: NotThreadSafe,
 }
 
+impl<'a> MmapReadGuard<'a> {
+    /// Look up a vma at the given address.
+    #[inline]
+    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmAreaRef> {
+        // SAFETY: We hold a reference to the mm, so the pointer must be valid. Any value is okay
+        // for `vma_addr`.
+        let vma = unsafe { bindings::vma_lookup(self.mm.as_raw(), vma_addr) };
+
+        if vma.is_null() {
+            None
+        } else {
+            // SAFETY: We just checked that a vma was found, so the pointer is valid. Furthermore,
+            // the returned area will borrow from this read lock guard, so it can only be used
+            // while the mmap read lock is still held.
+            unsafe { Some(virt::VmAreaRef::from_raw(vma)) }
+        }
+    }
+}
+
 impl Drop for MmapReadGuard<'_> {
     #[inline]
     fn drop(&mut self) {
diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
new file mode 100644
index 000000000000..dfe147cafdb3
--- /dev/null
+++ b/rust/kernel/mm/virt.rs
@@ -0,0 +1,215 @@
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
+//! [`VmAreaRef`] is used when you hold the mmap or vma read lock. Using the appropriate struct
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
+pub struct VmAreaRef {
+    vma: Opaque<bindings::vm_area_struct>,
+}
+
+// Methods you can call when holding the mmap or vma read lock (or stronger). They must be usable
+// no matter what the vma flags are.
+impl VmAreaRef {
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
+            bindings::zap_page_range_single(
+                self.as_ptr(),
+                address,
+                size,
+                core::ptr::null_mut(),
+            )
+        };
+    }
+}
+
+/// The integer type used for vma flags.
+#[doc(inline)]
+pub use bindings::vm_flags_t;
+
+/// All possible flags for [`VmAreaRef`].
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
2.48.1.362.g079036d154-goog

