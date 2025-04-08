Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772F265CC3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104254; cv=none; b=mgZyORsNXqMtPrR1ijbFVeVXlDW06z7+4AVq2g/oteH5MqHdcdArLuMWbpwRO2LP4n+bjlgX6sEJ2gPniwS8ZH+DxujKLowSMUDy+tKkeHPFSCpbQOGQQAC/XDRGXaXZkr6zPQc6Sw1JsBgB/CKCqCVmw39IcZenR/1b7qBIDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104254; c=relaxed/simple;
	bh=y7o7ZyQ2dPEky50Ue+6FuWOqrOt6CBr0m5lqB46eSLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jcIZwjyxgvJnln1mlqBurBT9SjzsFyqWRFaA2LTO2mNrAuc5JP5ioICWUprXREEDIogofJQnfv4wajO3f9RW5mwUrTSPuy1EVSnPE2UGvGyCHdEYfg33+IyWt7741MIrPfnJqAKOUyLBpl7LrkQpsoD9BJs1OywtfUt/6JclQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NPkzp5KJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NPkzp5KJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so35605645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104251; x=1744709051; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NbS7MAhMYKAe1fvQnX5I031aFw3fZNHXs82c8Rh/ZM8=;
        b=NPkzp5KJl1rteYHXmiPCKlp9XzTS6x4GJY+29RoOuYCMoaOwh8Jxti4hbLzunyriki
         s+Hv2UcniMkGnYYSWfvwlQCBi3eyLAGcMg1UJ6Em+P39f78VHC7ow2GROTZs70AiIe5O
         87hxX2JmUuXfDGCdBGxVe6Ps8kDMrW7FZ6nSVtZNzg9sCSTrxmf19wj4Sc7akV0xAokp
         vLaKRmpLHInJAqJEjADEV5PXsjfvpPnBDuOgym4KWubVss1Z2skaBP7wlKZct2xR5VDC
         RwqNhKjcgYu4bQpC6+aqXlt1aKeggZd+PqhUfLuyYFyo423Phl8hNy+TewH9lNhb3lQh
         8s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104251; x=1744709051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbS7MAhMYKAe1fvQnX5I031aFw3fZNHXs82c8Rh/ZM8=;
        b=uYtVQTBCFvnYvIkasovztkmHgmdnWqzm3EspZ0TvsIoaI4fZQY1HjQfeeL2LuhqxjX
         Wp9hBOLz9oPd3GSGsR556sxdWnNjIEMTkpgWdGWKk/NurM8BB8JY6t9mGIcTHrgF+Gnr
         v1Kr00pWnWO2wVVQhGqH5Xylo8zCgpERL95hkKQF2giJib+AkNoZqIuaj/gljvjY7eS4
         Z2PGs3GvQ6PNaLYS0IDFfIpDyDeHwiDirbifPeuQd2AfCbQ6HIANUC8yYpZ1cJ0fc+d1
         Z2y2bZyYqyTQ7PzVxCcmXBRExpgBVg9hrm+/h8Y2RQnLAXs6tH/1yc6JqysF3DlM1Dx+
         4qhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwUgDSdNspgjCwpswm5wAFzLu6cemMueIl6YwwsVruLONsCRMDJlxFZ7tj7fA11OFMfdvWsi+RdubNa/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YysjZr6XqY2Qelrz5bVhBFysrgDB51tzjQscXFq1XjSx7RKTy/G
	CF4V4m+QPK+DKauX44e8IeWmNuVhLXQw3kuDDxoZ0zgJshejHpNQ454zvdqbij8/yfNBr7wbGX/
	ZQPFTqGUM7+98Uw==
X-Google-Smtp-Source: AGHT+IE4W/KsQEJrmEgz9IsoTLynGVEAhAHKzspx/nbrSFmIxb6oHbD2e0Mgj+efPoxDwU0BvGGyyufB1Mi07JA=
X-Received: from wma7.prod.google.com ([2002:a05:600c:8907:b0:43d:4038:9229])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr135840695e9.19.1744104251264;
 Tue, 08 Apr 2025 02:24:11 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:43 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8695; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=y7o7ZyQ2dPEky50Ue+6FuWOqrOt6CBr0m5lqB46eSLI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9OspqQy5WgY/Qd+8dWuqTUfQ3HnCwBb8dVD05
 EA6Kry80NiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrKQAKCRAEWL7uWMY5
 RgG+D/4imuYCLk7UElHu8hBZPmO6nTzNlNaQKt0LiTcGYywxsrABM/WJ8sMq5nF56+zZSR06nuc
 56Kmkc7+8F2O1qfjff8l3mHCzT0J9cf6wAYYALBXOkz5KvBs7hWsjNTdnJzWZn++ZEjrRbTdrvq
 yg+RSfCLjZlIhNX6Qd/XZpMrLipc6MkzjLWxzEujf6AnkG17xmf4E8Kg02holVGJXsTKo+qM766
 seqiZkbFJzPBajPN6woE0fyAqN8+JidK+UJmAYYNB/Xdfl4yGudLtE7gjgbrHNhlS1anVWwuFZC
 FdSApqsObE8OK9MNeI6RuiAjuro8QX9Qw/jocbWr0aBk1+Pn7TnOFobEil62TNdBYyA+8peUYAG
 jh93VskPs3P8of4BOr051oLK5kwcG25LOWkkStYuiYb3Emdi6ep3U/6tAcPb5MGnFCl5lBjr++/
 UDPMjSqUQdpDlqWBx7rNRwDmCe2sMGlf7qo5K8Oly0cNdX+wmfJZ7/sKVg9sVXfAmH5RoKej18i
 LgUdXmjLd8L1exfbJ5E35i+jFmbusUl3F1xK+8ontqpt4uMc17eaMyDYaBc4ao+gqBIk2U3Nzgj
 LLd9Y59W9MRwdX2jJf8mifll5w1o9piYo9LgxbM7KFZHEPIIHAOfsvTSGIK/N3PmMbd89l33pKn WLK3RhVfl1Zx/4g==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-6-d8b446e885d9@google.com>
Subject: [PATCH v16 6/9] mm: rust: add VmaNew for f_ops->mmap()
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

This type will be used when setting up a new vma in an f_ops->mmap()
hook. Using a separate type from VmaRef allows us to have a separate set
of operations that you are only able to use during the mmap() hook. For
example, the VM_MIXEDMAP flag must not be changed after the initial
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
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 186 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 3e2eabcc21450497a02ffa1ed1f31f3e7e7e1b6b..31803674aecc57408df7960def17cfdc2cebcd6c 100644
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
@@ -198,6 +198,190 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
     }
 }
 
+/// A configuration object for setting up a VMA in an `f_ops->mmap()` hook.
+///
+/// The `f_ops->mmap()` hook is called when a new VMA is being created, and the hook is able to
+/// configure the VMA in various ways to fit the driver that owns it. Using `VmaNew` indicates that
+/// you are allowed to perform operations on the VMA that can only be performed before the VMA is
+/// fully initialized.
+///
+/// # Invariants
+///
+/// For the duration of 'a, the referenced vma must be undergoing initialization in an
+/// `f_ops->mmap()` hook.
+pub struct VmaNew {
+    vma: VmaRef,
+}
+
+// Make all `VmaRef` methods available on `VmaNew`.
+impl Deref for VmaNew {
+    type Target = VmaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmaRef {
+        &self.vma
+    }
+}
+
+impl VmaNew {
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
+        // shared. Additionally, `VmaNew` is `!Sync`, so it cannot be used to write in parallel.
+        // The caller promises that this does not set the flags to an invalid value.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.__vm_flags = flags };
+    }
+
+    /// Set the `VM_MIXEDMAP` flag on this vma.
+    ///
+    /// This enables the vma to contain both `struct page` and pure PFN pages. Returns a reference
+    /// that can be used to call `vm_insert_page` on the vma.
+    #[inline]
+    pub fn set_mixedmap(&self) -> &VmaMixedMap {
+        // SAFETY: We don't yet provide a way to set VM_PFNMAP, so this cannot put the flags in an
+        // invalid state.
+        unsafe { self.update_flags(flags::MIXEDMAP, 0) };
+
+        // SAFETY: We just set `VM_MIXEDMAP` on the vma.
+        unsafe { VmaMixedMap::from_raw(self.vma.as_ptr()) }
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
2.49.0.504.g3bcea36a83-goog

