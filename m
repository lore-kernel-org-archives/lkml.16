Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132D204C0C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584924; cv=none; b=ngpynVPd6dS2ZlywyURZqWoniTVGvqGIuFAo+VzwMa9MZPj/d8ftZClv2A30mAaTe5+sHvEUE9iQ+4I5eRvTa2XF0BlcKPLF8tW0noYrV3cAtzln8u4eqVg7DuopMjfejZVAg7V0HstN9on0D4H/MZLizWMxd7rolR1nvEi5G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584924; c=relaxed/simple;
	bh=4KqYDSUVevSLVAAHd54nWgHt2kwwb2fi92Kf30lYrZA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iKD8RTE+Q/ETMs3AouT+oPzkIT4VfZKEH9z310vqP7yiTy0qJe5pSXfQ8ZBmpbP9Aasfe4my3dVJoThUGGf1d7qP0c4Uzrga3NRb+xWK2+8J+gD0oTSw0ZxyvBVs+OGhNnelc/q7p/fyp0JmM7xrrTJ+Y0No+V51bl7bcTUszt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kr7d0Zpw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kr7d0Zpw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362153dcd6so21013935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584921; x=1739189721; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=agGGNAI6dzqkGe48/M6YrHXUKPC4ck0xMNLxp3OFHVg=;
        b=Kr7d0ZpwSm0xDobeRnH5OJVkkXqP0jnuOV8ZmUy4yYJmwQJ5YcA+RUOUwmvKIvs6Cu
         2f/C5BxqPmxYEiJYDz+gU0OjYpgFQSTaeXE3GHWxchwj0OLWTuf6zJaPPOt3UYwu/ovy
         7Nkx8EksY0046Qm4h0sly3UKN9gJcoxF7QGFPswmYKK+ylNor8+4kxrWWLbKngcxReCg
         8TqFw2GSwcDo5mm4F1R5Ql4Uqhh0wd4kPj7Rc6zQ7jOfvzYNKHAxM1tDqs1eU1za8gxj
         pAPymEclGnz3FipZm7s8XOJdVa3Afbv5UVPshjTTAfF7VzT2oCjRVXawqhpEdP9zTuXw
         6qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584921; x=1739189721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agGGNAI6dzqkGe48/M6YrHXUKPC4ck0xMNLxp3OFHVg=;
        b=XnbkJnd2S3cl5FQUvJw5xxgX/hq+OShd6w26ySmlTEwyu32ccdClyI4w79cJZMSTEe
         6PrbK/oa3OYI3t3FPlChCdK6V571v+QhN6RjtsJwEPQN29YGqXpY0tGRVQL5Ld6NmOhN
         mPsXJlozulqog65NcaME5HgrcjRD1Lq2ExErvJivwAM4WMXAcKpBCtsAXePN5L/qdkLp
         jJQ33oP9YsN4ascYV6hBFwcmRkiqS4NO04C0RuymrhCJgATCqFNfV+x9apaUp80XBZAD
         WFVDeKeYRqM/iyZau3BV3k5TPrRcG+vnSlFnmMof25XV5GdyrQn4wBSK+jSzUc3bs3ig
         GX7g==
X-Forwarded-Encrypted: i=1; AJvYcCUrClWWgJ6JAtjJ8GGWWtAhW2F90p0qyKxdDyvbtXnOe9xnz55dMddDKxAfKfl5NjxsBWJpsDdLFj0IHx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJNtK2OsZPovL+b6HWQBPGeQt0ljR+Pcub18T5PVsBdNrmdmN5
	JK6bDiRHUGqT14PtufaWYOoA5dUksbw5bex6ArV1PYP8RjNzgjUv4RM7SWV05zMd3FM0nTZbDIq
	SUc6KqruNxOnv+A==
X-Google-Smtp-Source: AGHT+IFE3v7o7/Sz3pTYj30D1OhHhtCVRBlS00wbtCjNS9IpojFNCzjRXbNgbN2xRkNUtsN78KvI86exjL/4/EU=
X-Received: from wmgg2.prod.google.com ([2002:a05:600d:2:b0:434:a7ab:5eea])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198b:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-438dc428740mr163084545e9.26.1738584921017;
 Mon, 03 Feb 2025 04:15:21 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:39 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4110; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4KqYDSUVevSLVAAHd54nWgHt2kwwb2fi92Kf30lYrZA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNLTSZ879yrBzzjRp+x2lwRObccwq8BnrIWd
 lf69cZ88PeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzSwAKCRAEWL7uWMY5
 Rm5ND/9PWT1+Eh/dfNIY7NIkFk6+Vbw7I0kgRvqoHU1ZGmP6M+gJ8foSrPKQZqPleKcy7VGrBV+
 xj9vOknJIzKNFILLuZE+BQjkcqJckAVx2VnWb+9Ow2q7nDrCa7cC914vve8qWv+6JFMvq6PqIyt
 5/J875aL+HC1hE41ROziRZQWZZCwq7KW5n1Jn/CqrXkSfsIrBse+DFUhhp3JNGj55YQ9BzJ5ZdQ
 LKyXDblmpmH/npz8Sqx0/Ea0UuDEM0+MEYHzZ1XUjzJzwBjoO6eSuQBHyxCppe1CgarpUzRABWj
 6f0ZsGQTIJbWK2IzLmYW++OoqjZZBghXwEM/uKfw/L6znFM6f1SMFwVG8OonHtPzKHdSPYZ+cUo
 0BJor8b1WM/bhTiUvmWJlAclvh/NlrkoRvPrFHgs6RK3S3G4AC49XeIUzKyjA7h7x5sEV9/c7VX
 npGgaAfRUCrcrFd2Ba8zf7ctDYAS7JwPrBe3friwZvgJPpHcHs/mJ2Hsy3qQERz1HFBJCAA6+iq
 SqQ/Co+NxC4gMDJLQhKtexo6uuB4JJvSlDOGKTCkCa/UYE+YYkDozLx9k91TAbPQxTvLQHxLJxP
 +ZfsAY3m+RZ36I+d4hnDCouPrz0VkieyDtcs1aZ226wR/2fx7WmRm0X/EMFPmtbLonr2DAQm5va E2EB41wG9r8vPDQ==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-4-2b998268a396@google.com>
Subject: [PATCH v13 4/8] mm: rust: add lock_vma_under_rcu
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

Currently, the binder driver always uses the mmap lock to make changes
to its vma. Because the mmap lock is global to the process, this can
involve significant contention. However, the kernel has a feature called
per-vma locks, which can significantly reduce contention. For example,
you can take a vma lock in parallel with an mmap write lock. This is
important because contention on the mmap lock has been a long-term
recurring challenge for the Binder driver.

This patch introduces support for using `lock_vma_under_rcu` from Rust.
The Rust Binder driver will be able to use this to reduce contention on
the mmap lock.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c |  5 +++++
 rust/kernel/mm.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7b72eb065a3e..81b510c96fd2 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -43,3 +43,8 @@ struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
 {
 	return vma_lookup(mm, addr);
 }
+
+void rust_helper_vma_end_read(struct vm_area_struct *vma)
+{
+	vma_end_read(vma);
+}
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index bd6ff40f106f..88167c0cbd93 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -18,6 +18,7 @@
 use core::{ops::Deref, ptr::NonNull};
 
 pub mod virt;
+use virt::VmAreaRef;
 
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
@@ -160,6 +161,36 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
+    /// Attempt to access a vma using the vma read lock.
+    ///
+    /// This is an optimistic trylock operation, so it may fail if there is contention. In that
+    /// case, you should fall back to taking the mmap read lock.
+    ///
+    /// When per-vma locks are disabled, this always returns `None`.
+    #[inline]
+    pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaReadGuard<'_>> {
+        #[cfg(CONFIG_PER_VMA_LOCK)]
+        {
+            // SAFETY: Calling `bindings::lock_vma_under_rcu` is always okay given an mm where
+            // `mm_users` is non-zero.
+            let vma = unsafe { bindings::lock_vma_under_rcu(self.as_raw(), vma_addr) };
+            if !vma.is_null() {
+                return Some(VmaReadGuard {
+                    // SAFETY: If `lock_vma_under_rcu` returns a non-null ptr, then it points at a
+                    // valid vma. The vma is stable for as long as the vma read lock is held.
+                    vma: unsafe { VmAreaRef::from_raw(vma) },
+                    _nts: NotThreadSafe,
+                });
+            }
+        }
+
+        // Silence warnings about unused variables.
+        #[cfg(not(CONFIG_PER_VMA_LOCK))]
+        let _ = vma_addr;
+
+        None
+    }
+
     /// Lock the mmap read lock.
     #[inline]
     pub fn mmap_read_lock(&self) -> MmapReadGuard<'_> {
@@ -228,3 +259,32 @@ fn drop(&mut self) {
         unsafe { bindings::mmap_read_unlock(self.mm.as_raw()) };
     }
 }
+
+/// A guard for the vma read lock.
+///
+/// # Invariants
+///
+/// This `VmaReadGuard` guard owns the vma read lock.
+pub struct VmaReadGuard<'a> {
+    vma: &'a VmAreaRef,
+    // `vma_end_read` must be called on the same thread as where the lock was taken
+    _nts: NotThreadSafe,
+}
+
+// Make all `VmAreaRef` methods available on `VmaReadGuard`.
+impl Deref for VmaReadGuard<'_> {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        self.vma
+    }
+}
+
+impl Drop for VmaReadGuard<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: We hold the read lock by the type invariants.
+        unsafe { bindings::vma_end_read(self.vma.as_ptr()) };
+    }
+}

-- 
2.48.1.362.g079036d154-goog

