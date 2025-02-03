Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D82046A0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584928; cv=none; b=hthHXzJbUkXxuiyLL767oe3fehR/K05WFzsxHNlDlv8HEwNIcxQGBHgiXgwjJznb2euteCwgWVfl46T5mXYdhNMiqmnlh/AOGcXE+fgp5DE4SfKEzxTR3zGt7RQshKXorxwk+wPp1QfR3rbY1Rr1VgKLkgqFNT/s1iNOvv654Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584928; c=relaxed/simple;
	bh=10j5HcaR1gvtllAVfcw/qjMyimeHVca5LB2wpNGE6ec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gYKHel1Edo+iTGp+E9aop8BCkl+zM4BI9Y0TZ+bpQtK/WHgok7fEMKWo6cCKek5nhM6pKoSFjAPAF3Z9+12bYX1J+kXCVOF/Ty9dbEPCJ4Mz6Un0UEKOrovoXq11FjT+6Na5uddAeJf/K0d4GKtOYPtUA9ITgFEgRbq9s0L0MCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmHVsz6T; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmHVsz6T"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361f371908so31264115e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584925; x=1739189725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XdP0aoyoQaJRQDN9af3Ddles1mdACdpk6p9g2zjPnwA=;
        b=OmHVsz6T4Dfmj3fZU4mhDG3v2i6aIX3pdIoVFokpkv5bIVbGXqhJFD7Rn10NL9hlrL
         MWW7gUZOBSjfKpny23p6C4XAfG2w50BjFzkL6lbnLiWlC/GXzadA4oswxp3slo4N7k7j
         kGGc+Cssh3FmzfWGK/dgRMATTVMbAmzVX1A+cC96zbTLJ3UrVe6hvrXW4lu4viYc/Htb
         w/WZGK+mUKV1shOze/HcD0xW8SXznftQPGtF2Y1QEqB8x4pvt/1eOUBuQpS6hje5T4u2
         x+dMAEzwoLl3zYTEJq/Y1SkvCTkJOkQfKF5JJzpYXfOeYojCcJ27mLt53XtBay1EQoxJ
         kH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584925; x=1739189725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdP0aoyoQaJRQDN9af3Ddles1mdACdpk6p9g2zjPnwA=;
        b=A/ETvfyKWCs6CFmIwOm+ccGKHtqQOx/weqniLOTmssbmGrcZe8zrUlGwdX+6oMQfPL
         ftBgHNJ1pnCtmljvrYSTQgT3ylVa83b+VB1akYH7jA2rRAVHlCNV95Dg8B4hdCV1Q1WP
         jQA1np7uiB0xBp5o/ddwc548x7TNi9vJ9jIonKZMzqeV47OJLpUm89iVrMG0blPkJ/OX
         KfzNi5JsTJ7prybqkxX5FUDvcD53U2knLKl20P+rpyfMRnDWrqPklp00Z7YQSyA8PUA5
         2RHcVgRGwTN6DiEPVuev6Jx/8+qafb8UXyMEt7FNeQkiuc2peYN1wasA3+87o8a0/JIg
         AElA==
X-Forwarded-Encrypted: i=1; AJvYcCU1AJdr3jodA46gx+dp2f/NCbp4SGSyJPqSuWg3JMG4dk5KS0v8CW0KrQ6qkoErV8WoQOMwZFokQphCAw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzidtwcj59c+qmC0ilbPunsVRSQ12F6I6WeUafuC/5oX4P7Kzsw
	tMxAb+DGPAl1AnC9O+nN7CbrrIaXu2IE94lZW77VzTc0OYIMnLIvqcjJkgrmyX4oK2xSHuZIvV5
	ZDcCXv4vU4lirwA==
X-Google-Smtp-Source: AGHT+IGvdl8whkyeauBYNUqNHQEJqjDbvwD7qj3CFNWEf5tOxMDBlkY+hQX0TS488w7KyLPMULbm3wB/znwxHGc=
X-Received: from wmbay13.prod.google.com ([2002:a05:600c:1e0d:b0:434:f1d0:7dc9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca3:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-438e70d1b20mr96862455e9.1.1738584925233;
 Mon, 03 Feb 2025 04:15:25 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:41 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8625; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=10j5HcaR1gvtllAVfcw/qjMyimeHVca5LB2wpNGE6ec=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNMGRlshE36N0K5bQLrRASBsrP6ARR+Odgs+
 ZRuOZGqHeuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzTAAKCRAEWL7uWMY5
 Ru4uD/wIeJ7LbTTgDF1gzPyLQNw3NUUI95FbT/5jn7qRcfoX1WIuDkkZOzAx1vYs7CH5cQ9owzG
 Df2TJ9K+7Lnxmo1G8FMuGTYh5EL9q+IY6BVZvKypIv4hcp2Y8CI4BxfLffxKc/5keD7pfrkfA12
 QORea0pSlU8TnzABDyWYzGgBGd7pc49b3u58DEEEU1xM6UqVi++Xdme9jaaru5ZK5iGK4Fouk8c
 LVwgP/uUGgPED0mT8nIKkSY4oENMhC6ITdL3ZdKjIcB7ayb3xKWvLA9N9BNQd2TwawAUO7tcwwd
 a4YHEQOWCOkx/9Fnw1ajLC7Cq9mfKXSg96PgxyhBb808ZTOXnw+LVM0n2EtqMaK+HH125k8h9L5
 DsV5Ip7u9knjAPBBeTiyaSGd6EtGrH7btLvu+vxgJcmbkKQDqPNM38uIcfuzoWV3K+S+o6+nAwa
 /Hybvrol1Px6fYI0hXEF27zCRnvNxdUyJmNjIMB4oUJ6uuCcrx6g2VpjBUsUUe1xU/CR6YpS2IL
 IFsf0kRTRS0745iCwntfsNMjQxuaeonqEIXNebvIoZC4CYSMOAUXlsJaYtAFudhrXEWCmWMOCqa
 4PuWWNvljKGZJJHiaShbLSBOKTeAvIxcSGkhxMXN287wTwVCttn6nCpJgnyHSAUqwr7rcdhla7m ocD33DZ1yVXouqA==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-6-2b998268a396@google.com>
Subject: [PATCH v13 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
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

This type will be used when setting up a new vma in an f_ops->mmap()
hook. Using a separate type from VmAreaRef allows us to have a separate
set of operations that you are only able to use during the mmap() hook.
For example, the VM_MIXEDMAP flag must not be changed after the initial
setup that happens during the f_ops->mmap() hook.

To avoid setting invalid flag values, the methods for clearing
VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
the return value results in a compilation error because the `Result`
type is marked #[must_use].

For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
we add a VM_PFNMAP method, we will need some way to prevent you from
setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 186 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 64a0a47070a8..5847fe73db17 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -16,7 +16,7 @@
 
 use crate::{
     bindings,
-    error::{to_result, Result},
+    error::{code::EINVAL, to_result, Result},
     mm::MmWithUser,
     page::Page,
     types::Opaque,
@@ -203,6 +203,190 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
     }
 }
 
+/// A configuration object for setting up a VMA in an `f_ops->mmap()` hook.
+///
+/// The `f_ops->mmap()` hook is called when a new VMA is being created, and the hook is able to
+/// configure the VMA in various ways to fit the driver that owns it. Using `VmAreaNew` indicates
+/// that you are allowed to perform operations on the VMA that can only be performed before the VMA
+/// is fully initialized.
+///
+/// # Invariants
+///
+/// For the duration of 'a, the referenced vma must be undergoing initialization in an
+/// `f_ops->mmap()` hook.
+pub struct VmAreaNew {
+    vma: VmAreaRef,
+}
+
+// Make all `VmAreaRef` methods available on `VmAreaNew`.
+impl Deref for VmAreaNew {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        &self.vma
+    }
+}
+
+impl VmAreaNew {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is undergoing initial vma setup for the duration of 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *mut bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Internal method for updating the vma flags.
+    ///
+    /// # Safety
+    ///
+    /// This must not be used to set the flags to an invalid value.
+    #[inline]
+    unsafe fn update_flags(&self, set: vm_flags_t, unset: vm_flags_t) {
+        let mut flags = self.flags();
+        flags |= set;
+        flags &= !unset;
+
+        // SAFETY: This is not a data race: the vma is undergoing initial setup, so it's not yet
+        // shared. Additionally, `VmAreaNew` is `!Sync`, so it cannot be used to write in parallel.
+        // The caller promises that this does not set the flags to an invalid value.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.__vm_flags = flags };
+    }
+
+    /// Set the `VM_MIXEDMAP` flag on this vma.
+    ///
+    /// This enables the vma to contain both `struct page` and pure PFN pages. Returns a reference
+    /// that can be used to call `vm_insert_page` on the vma.
+    #[inline]
+    pub fn set_mixedmap(&self) -> &VmAreaMixedMap {
+        // SAFETY: We don't yet provide a way to set VM_PFNMAP, so this cannot put the flags in an
+        // invalid state.
+        unsafe { self.update_flags(flags::MIXEDMAP, 0) };
+
+        // SAFETY: We just set `VM_MIXEDMAP` on the vma.
+        unsafe { VmAreaMixedMap::from_raw(self.vma.as_ptr()) }
+    }
+
+    /// Set the `VM_IO` flag on this vma.
+    ///
+    /// This is used for memory mapped IO and similar. The flag tells other parts of the kernel to
+    /// avoid looking at the pages. For memory mapped IO this is useful as accesses to the pages
+    /// could have side effects.
+    #[inline]
+    pub fn set_io(&self) {
+        // SAFETY: Setting the VM_IO flag is always okay.
+        unsafe { self.update_flags(flags::IO, 0) };
+    }
+
+    /// Set the `VM_DONTEXPAND` flag on this vma.
+    ///
+    /// This prevents the vma from being expanded with `mremap()`.
+    #[inline]
+    pub fn set_dontexpand(&self) {
+        // SAFETY: Setting the VM_DONTEXPAND flag is always okay.
+        unsafe { self.update_flags(flags::DONTEXPAND, 0) };
+    }
+
+    /// Set the `VM_DONTCOPY` flag on this vma.
+    ///
+    /// This prevents the vma from being copied on fork. This option is only permanent if `VM_IO`
+    /// is set.
+    #[inline]
+    pub fn set_dontcopy(&self) {
+        // SAFETY: Setting the VM_DONTCOPY flag is always okay.
+        unsafe { self.update_flags(flags::DONTCOPY, 0) };
+    }
+
+    /// Set the `VM_DONTDUMP` flag on this vma.
+    ///
+    /// This prevents the vma from being included in core dumps. This option is only permanent if
+    /// `VM_IO` is set.
+    #[inline]
+    pub fn set_dontdump(&self) {
+        // SAFETY: Setting the VM_DONTDUMP flag is always okay.
+        unsafe { self.update_flags(flags::DONTDUMP, 0) };
+    }
+
+    /// Returns whether `VM_READ` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as readable.
+    #[inline]
+    pub fn readable(&self) -> bool {
+        (self.flags() & flags::READ) != 0
+    }
+
+    /// Try to clear the `VM_MAYREAD` flag, failing if `VM_READ` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma readable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYREAD` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_mayread(&self) -> Result {
+        if self.readable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYREAD` is okay when `VM_READ` is not set.
+        unsafe { self.update_flags(0, flags::MAYREAD) };
+        Ok(())
+    }
+
+    /// Returns whether `VM_WRITE` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as writable.
+    #[inline]
+    pub fn writable(&self) -> bool {
+        (self.flags() & flags::WRITE) != 0
+    }
+
+    /// Try to clear the `VM_MAYWRITE` flag, failing if `VM_WRITE` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma writable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYWRITE` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_maywrite(&self) -> Result {
+        if self.writable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYWRITE` is okay when `VM_WRITE` is not set.
+        unsafe { self.update_flags(0, flags::MAYWRITE) };
+        Ok(())
+    }
+
+    /// Returns whether `VM_EXEC` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as executable.
+    #[inline]
+    pub fn executable(&self) -> bool {
+        (self.flags() & flags::EXEC) != 0
+    }
+
+    /// Try to clear the `VM_MAYEXEC` flag, failing if `VM_EXEC` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma executable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYEXEC` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_mayexec(&self) -> Result {
+        if self.executable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYEXEC` is okay when `VM_EXEC` is not set.
+        unsafe { self.update_flags(0, flags::MAYEXEC) };
+        Ok(())
+    }
+}
+
 /// The integer type used for vma flags.
 #[doc(inline)]
 pub use bindings::vm_flags_t;

-- 
2.48.1.362.g079036d154-goog

