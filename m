Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2E3265612
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104249; cv=none; b=QIsf17GaJaI40Z8dfk7ceskRqNQf2WvJfDBLlqfxRZq6ICUG1mXx+qkFxrUndfcDS/01t8BcIZJYcJp/HcYENEHOZr+6zLTJ/3CSxVcvCIxnMIGhr1rKxl0GKfNlFWqfrx0OeMn3uUKgvZFDi7fvsGQg8sunjzdggEZZukEX3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104249; c=relaxed/simple;
	bh=6cK8H0f1bjkfbBZECW+oXwSFALiwF8hLaYj708yZ9Vs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KtZQ9ZKyhGc6L8BZ3+hufshRUKwwgTEhl5ThArUeEf3WmV0WmG7F1tFIJo9kVx6BWJMs13+3x6oodLUmCmaQLPtCteIXBaY5TENpn+kflY/G4nLUarFXXJncbgY0L2GeJsilQvfnNLmkMW0xxcBk95P+lMbQZTduYILmrFiJkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9pHGTwn; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9pHGTwn"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so29979945e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104245; x=1744709045; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5w8I1p3Tb9DO8JsnIo9VM8qLIkaDI8pOQrbVUWT6uI=;
        b=v9pHGTwnWt/CIeVyoBV0Gse996PE34inGSro+PcqxGZqHfU0QYruROSvExS5BWWXOD
         BfQGqOmAJwHMAW4eKtqkNP4p9xdqeYcZC8WQslYUmHIDSf1A6KxM3Q34GWem01Zi04a4
         BLAG4J9G9XYY+R37KEXRQb6HCxWPwoO82NjJw7Gyvuxk1iAb88FkrBICuyjhapmkgl8F
         /5A1aMivzBSsCqWc7N8x1YnPlECclHUOQCeFDyphF1kDqZat2RaHCWkIVmeNG4cs6EDQ
         mwjtHncSavcb8+ggdvtQtLgR2lJVf8CJo3gadcSWAdfH9QM43rIatNykiSYo/q61HhCM
         V1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104245; x=1744709045;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5w8I1p3Tb9DO8JsnIo9VM8qLIkaDI8pOQrbVUWT6uI=;
        b=FAC3uN2ZBPTTySD1J94MxAkvT0sG1D2X9761hzFMzc0/Q3kISgRypU7JoopKAMDg2+
         0KKcFEzG5EtXHYIguClfTd5+GzORgPEaz1RjepfSe/jfjSKeptOsNlYvw05avtmFOfOB
         l4BQPI6N0zKnbYcjFPnnLnFKOWgiaJQ2EhQMi94ma4SAFdWaUA4pFycN4ji5/XWtMCka
         T9AoLgqnUpbH2oFi7p0pKisgQOR8N+UEY1o/WMgKF/ewvu0hmgwfhG/kN1wuyzJzLo+X
         6v4a22jTctO4TtaZobTnZYeN1VwgTMBwthiEGRJjlZvC1gaWYsl1vmltMtI6t7aD1qoZ
         Pcaw==
X-Forwarded-Encrypted: i=1; AJvYcCVpSrhrpdvXT+hpgpKKj1bCPhbAPeU27I1EYG6LXmooZr0U2NnM4aCKTvlZB29vmMoeQhNrr3UYBtSqH9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdqzufBwyUq4Ua/Qgj6nHJg/J/NNMzjuQ/pqvBzpVRdsrnxHs
	Qek/yq7j5Q9sde1e/6qifpbonKRZhK2tGB/A67m/gqeuMayu+AGrQjGVGfBjHDPuwbbDDtuvLvZ
	x8jm+kOIwSr4vZw==
X-Google-Smtp-Source: AGHT+IHpYdwjp62GC42TgJRjq1KuRmzOAAEOqv7lAljye6ysUkygRaxUq/uM+rb+EggvJF0qu6sb2cFi0FK4uNE=
X-Received: from wmbh6.prod.google.com ([2002:a05:600c:a106:b0:43c:eb09:3790])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5845:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43f0e59c566mr15047995e9.9.1744104244985;
 Tue, 08 Apr 2025 02:24:04 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:40 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4393; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6cK8H0f1bjkfbBZECW+oXwSFALiwF8hLaYj708yZ9Vs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9OsnO6hmFHtTeBdUk9KFgbrB2QrDLVOl+CpTX
 d6JGe8HUuKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrJwAKCRAEWL7uWMY5
 RldLEACSoWh10crAZ99JPh2xNve1MWXfeXmmLSD1NzqPq91mZuyNyd7KxvS8MCgtkDxjI4lf/EK
 yl3m+I12OBvL54nMiHw6/jwjv8z/14XNQeRQx0aDtU2N66XpXG1O+tQ3Ow12J7cTrqmQaPNRBry
 lEjdcqaKJCly/EPPyJjRdLHd42EKtbyJN/OCoXQu1p/a/GvwLVbOVhGRTzC/i9XHCIzn0Tl5G2F
 kIAi6g93MU6TMnO3GGvKqDdS5exJQllY+P5pd9MxDU/4O/mMoxbfVxHtIbw3zavFNbI7ifI2w+g
 hc65G3O7tEkNtCwmy19QiNF/BkS/dnDnqKgco1rsL1enCAJSxUK87DZHaQ4cfvO08iABgGfa8tA
 fEQFM0ry4n1mDKBHHr34ICS9Tmrrj+zqh8ydMudFmwBYAVGu4A6YDBYs3whhMDeDxFT5gOb6IwW
 fTcdaAwIvwLNDqd/5iXGY8t/zcdrngDyChZB6VbZCwln/MEEyh1mhh0sCKs3oVO+ixfj4JrBG8E
 E3NaAjrWqbNzifbv+AII4tSHJFmW3ExuWdgRDNxSkrBhGFPjNDw4/VRsFlMnXVUUjhZsEpDjyjJ
 CO4gGUAFnizx/292hDoxB8xe9gzUaUycfj4uGObs+4NHG6wkZiS4K7YrktZkNEw7AcV0CdW5Yip h29xzmoJxJ6uJMg==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-3-d8b446e885d9@google.com>
Subject: [PATCH v16 3/9] mm: rust: add vm_insert_page
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

The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
flag, so we introduce a new type to keep track of such vmas.

The approach used in this patch assumes that we will not need to encode
many flag combinations in the type. I don't think we need to encode more
than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
becomes necessary, using generic parameters in a single type would scale
better as the number of flags increases.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 79 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index a66be649f0b8d3dfae8ce2d18b70cb2b283fb7fe..3e2eabcc21450497a02ffa1ed1f31f3e7e7e1b6b 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -14,7 +14,15 @@
 //! ensures that you can't, for example, accidentally call a function that requires holding the
 //! write lock when you only hold the read lock.
 
-use crate::{bindings, mm::MmWithUser, types::Opaque};
+use crate::{
+    bindings,
+    error::{to_result, Result},
+    mm::MmWithUser,
+    page::Page,
+    types::Opaque,
+};
+
+use core::ops::Deref;
 
 /// A wrapper for the kernel's `struct vm_area_struct` with read access.
 ///
@@ -119,6 +127,75 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
             bindings::zap_page_range_single(self.as_ptr(), address, size, core::ptr::null_mut())
         };
     }
+
+    /// If the [`VM_MIXEDMAP`] flag is set, returns a [`VmaMixedMap`] to this VMA, otherwise
+    /// returns `None`.
+    ///
+    /// This can be used to access methods that require [`VM_MIXEDMAP`] to be set.
+    ///
+    /// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+    #[inline]
+    pub fn as_mixedmap_vma(&self) -> Option<&VmaMixedMap> {
+        if self.flags() & flags::MIXEDMAP != 0 {
+            // SAFETY: We just checked that `VM_MIXEDMAP` is set. All other requirements are
+            // satisfied by the type invariants of `VmaRef`.
+            Some(unsafe { VmaMixedMap::from_raw(self.as_ptr()) })
+        } else {
+            None
+        }
+    }
+}
+
+/// A wrapper for the kernel's `struct vm_area_struct` with read access and [`VM_MIXEDMAP`] set.
+///
+/// It represents an area of virtual memory.
+///
+/// This struct is identical to [`VmaRef`] except that it must only be used when the
+/// [`VM_MIXEDMAP`] flag is set on the vma.
+///
+/// # Invariants
+///
+/// The caller must hold the mmap read lock or the vma read lock. The `VM_MIXEDMAP` flag must be
+/// set.
+///
+/// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+#[repr(transparent)]
+pub struct VmaMixedMap {
+    vma: VmaRef,
+}
+
+// Make all `VmaRef` methods available on `VmaMixedMap`.
+impl Deref for VmaMixedMap {
+    type Target = VmaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmaRef {
+        &self.vma
+    }
+}
+
+impl VmaMixedMap {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is valid for the duration of 'a, and that the mmap read lock
+    /// (or stronger) is held for at least the duration of 'a. The `VM_MIXEDMAP` flag must be set.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Maps a single page at the given address within the virtual memory area.
+    ///
+    /// This operation does not take ownership of the page.
+    #[inline]
+    pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
+        // SAFETY: By the type invariant of `Self` caller has read access and has verified that
+        // `VM_MIXEDMAP` is set. By invariant on `Page` the page has order 0.
+        to_result(unsafe { bindings::vm_insert_page(self.as_ptr(), address, page.as_ptr()) })
+    }
 }
 
 /// The integer type used for vma flags.

-- 
2.49.0.504.g3bcea36a83-goog

