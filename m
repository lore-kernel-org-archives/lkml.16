Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691D26561C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104250; cv=none; b=tzdR8dYJ/1E9Uc531KML3tNhNr5VBD7VDHotIUFrA5fl5XuvwdLuT2lGvAZs0fpxBA3Mp5rW5yp+9j3uZAsFQghCDnLSRen4iPU6wB95G86I3uwiO5+TPK41jyQ/lhJGtNpckEJkODj078ti8Xk95aOpJtOBQLdytAL+z2n4EVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104250; c=relaxed/simple;
	bh=gF1ckMqCWHCjQXFknkNdHEiUzDYS1Ku+dCA1Sq6IckY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IJfXqHcnflcRxvXbB6ZnV14WjtKgRc2+UGfKoalZLjudZNJEnLFYddbMK0ItPmlqNmPQkfbdDQv35CzkMDaMmzADz9szMwORTQokM8tcjMuOaE2xeTyo1VErwpnrnyu+gsJWz1VUGwd+dCq7j+w2u+Utb3+HuZY9ZneYgKQBFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYn5j2U5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYn5j2U5"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so29596745e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104247; x=1744709047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSV463Hzq4lcGHaBMKwzfTcjqbOdgyFN9gtovsbYOqc=;
        b=pYn5j2U5ZASKvI6FYYcER187Tjg6VBWXYoPS18s7YsbAmnymxfUSLLetRLD9pylEB+
         DAv8ZKYYU59L+lAnf40tXD5IxD1+75LY4TM+3+21AXqKGrGPF02g+qlv8Ok4cj8195tV
         f6XzEVwhe75xNdsvlWYDA5fVCmDFDQgJs3mH6LXuTgpHpyVMI+tmyyZevqHG0y0I7Dds
         rW+uDjc0l9qTG4gEa+Ku4Uc+Y1V5vcMJmXvZMRfl2zz6o+Z/Sw+Za5wZReBBaAoEGnQp
         uwhEnxKJNUkNniNM/j2EkMoIBTRLZCJAaFRV3GvNch8PWICx50vAXye3GkKSC8qe7Q2w
         b32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104247; x=1744709047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSV463Hzq4lcGHaBMKwzfTcjqbOdgyFN9gtovsbYOqc=;
        b=mWrZCR1418bzLmwRUmSeLlENv/3kjuE/jHPzF1e8HsqtOcLInow7YsDxfbM+639srC
         iIM3taajjFcX4zxGcqUQV88DRzCbGVksB/42LLTsJ/pxe/Y4S0E6umSPEPYyRt7OfNGc
         uxRPuSBjGYC4z+6ZoodVb216/0ITsEWAkdk7JNMBevIh17ekmNBXXXMG+eMk46InMWCY
         qAgzWw6z+DtSJK9FsjDVQmiacmUfhUe2xr2jwPEV6REYCvJ1KVDirGMhOoxt11HBe1hB
         72hbzYFvCwUBElU+09IYnjPTs4CV4bPyOXpBYDbuWvPvnXVIpWtT+H+ApgslLep1kemL
         WPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9m3aEAZQak2s9tIPM0VLpGLoyw9/Y7bqXzAYeVZ9tRpDBOsOVmVmVrSBbFt3MwJWONzgzvoyMYGJ/RnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzL023vyO03ewwXS6NdTUFYXrCDJCDTIVVmS+/nXNzjZ5GgiL/
	4XJ2Wq9AlNoahOzOsqrWg9TnzNqW9RbHQGrefPP41Lgw/MgmbFqTRGWjV/FOBafuoZ/vRUojvEI
	iQgcgHlz+sdW0KQ==
X-Google-Smtp-Source: AGHT+IGpYx8GY+CcPqdjvQeTUdadbSh+V6DOVo+9tIk10BZYKUulfM4YzPVOn2JdHxlRFKSX0lPoXYX9f1ZU4sI=
X-Received: from wmbgx9.prod.google.com ([2002:a05:600c:8589:b0:43d:5264:3cf8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f07:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ecfa04a8emr120987995e9.27.1744104247078;
 Tue, 08 Apr 2025 02:24:07 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:41 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4299; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gF1ckMqCWHCjQXFknkNdHEiUzDYS1Ku+dCA1Sq6IckY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9Osn3jxbpIs+xoCWpCoObHsxRS9D60krCSnYT
 liiyaW/aLiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrJwAKCRAEWL7uWMY5
 RoLCEACYidsumhaA9miV4nPn5brjSwUFAg1VPkCXuULdVYpR98jJerXgW0o+C/JgnKudQsmOGPJ
 B7MEnQur02LcSgPW71ukNXp86bWc9dSnuMZIJRiK/wCi4UEJeVVaxOUu+id75fPxyCMPS+TzNWQ
 QuuKW3KOwpcwFr3fW601D3P4jKIJnca7mC8wuMxunrbFpz5pkVJ/bLGhrasFOUH70F1VjBussqq
 ZvnZWyn9z0Ij1HBgqvzUwNNtUVq27ul92aCNCiSMf7GTLqNV9EM6W1fIKAOC4s9bA9/usTrp02V
 T5BEZ5zGhMzQ1uOoAUgyH1229eWh5Un0A65JrF0XHe2ZJKS2Gsbv6iVSX5CCL4m+BtcRszMLJ5z
 wndBdwWT2DDDJyyshSoi3FOe9bfUFnCdoZ5cNTQxrD+Rz32PN9kJ5qiPBsQp+jS2HcqTFZ/mCKe
 xIpYVQcyhcnRstMU/N81m1h8c/SYGx2U46nPiQXpN3Pqb4wrIDQQpMxwsnh9ON7ewaaoYEI8/2C
 VBeETIom53ABUiJaI7b5R/ysuayAGNljta5PvwhvI94/KVaxcg5Ys2grjswEly5jp8O/36vVuE1
 LstY/UxTleVJNGEycPlzy9gTvstP2u79n1tNOhKrVQ7IKwH84lR60sVjU1jArF8+cp9zjjBb4FL LkKtiYSl9CTjJ7w==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-4-d8b446e885d9@google.com>
Subject: [PATCH v16 4/9] mm: rust: add lock_vma_under_rcu
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
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c |  5 +++++
 rust/kernel/mm.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7b72eb065a3e1173c920f02a440053cf6e93814e..81b510c96fd2692dcb7ab4705f790bd3a41a630e 100644
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
index f1689ccb374078a3141489e487fc32cd97c9c232..c160fb52603f8d4b349000451e2200fb477d98a6 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -19,6 +19,7 @@
 use core::{ops::Deref, ptr::NonNull};
 
 pub mod virt;
+use virt::VmaRef;
 
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
@@ -161,6 +162,36 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
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
+                    vma: unsafe { VmaRef::from_raw(vma) },
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
@@ -231,3 +262,32 @@ fn drop(&mut self) {
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
+    vma: &'a VmaRef,
+    // `vma_end_read` must be called on the same thread as where the lock was taken
+    _nts: NotThreadSafe,
+}
+
+// Make all `VmaRef` methods available on `VmaReadGuard`.
+impl Deref for VmaReadGuard<'_> {
+    type Target = VmaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmaRef {
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
2.49.0.504.g3bcea36a83-goog

