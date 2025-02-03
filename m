Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B662045A2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584922; cv=none; b=E6YNeYu+EaTU0bHMe0/Y+PAwbKSLLnkiqkyq980C9egA/fpF5NjSmx86kpnRPiizTO4Oy0MMPL+/3uCOQoQNRfBP4FHPq3RG8uSPvlHLisJXX4SLMe/Rx7ZIXTTt2LcQ6vopMquJnFHSJGUXr4wIt8d+IJ7ZPtBYpsc8X2PUuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584922; c=relaxed/simple;
	bh=7WepNBMO3VHpBbUgOZ7CBvykk1H/XsDvQNuHzOoGaDg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JWTnXym9vyKGk6Wtp3IzXiivFf04DL+EdS5KC06Qlil5Jx69Mjoxk7sg3B7Aqy5c5/+UdBSfug9Ao8eiQ35Lwo75/1ITNlk0bTNLOQBlxCsjRxhUBEdbvDK7AFwgFs3ZgDZ43DP02IYTqha8yJR5tDy3MBMim/ILvQsiB7i/rGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3mNHeMXI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3mNHeMXI"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43626224274so22352505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584919; x=1739189719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghNopB/ovoE7UI8P7ondlQHgR2/c2oc3ISyJfF1pYKk=;
        b=3mNHeMXIm84vySPBXmfOpm7KEZmC20W5C9jWgB5LUdhQTaZEKCOohUJ8+Kbbl/ShPm
         Ee3jgSO89w1nemtIUb4UIFeXfCVXNly7QvBL7MRYhLadTPKv8VNS2hEichRb9JMITM5I
         Yc6W6fHp3MI9Mb8d8Ma9C1upxbSGUx4ydzhvcqf6h5yefLiVMt8a9xUMORZZPWq2m1dt
         +lrX2+Bm+UHcl6XyfFmuBAxlJljsot/P8l04tXtVwsbxC17KRQf+JcHeDK7kSSKgkS9G
         VwZAZeba8u2oab7wGAhz9O72gojtJG7fxIiNM2oRB9I5BeNtk5K3DBzBLdwzZ7PQnDIK
         iNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584919; x=1739189719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghNopB/ovoE7UI8P7ondlQHgR2/c2oc3ISyJfF1pYKk=;
        b=YXAR6mwjSa2Z0tMfqIHLULfb4Pyzr2ZhJxy3U3P2H8+tE0WxsKl2hBpMZIzdn/zN/p
         LPiZaQnl6XWz+t4U+XhKljRjtyRANBUwMPbDOosS67Qwlncy6L1x1aHntVkXfHhJHj/T
         xOklNDU9x2zWouiCMQX8HYQ2eBRAAFuITkrAluuF3aIgva+03jNk2ZV8jYvvs2FotXuC
         zV2Sk2Mv+/RU3Z0EDtwZeIZ+/qE/el/OFaVsfqJKoEjrwy0UpfqIur+n/z4LJbBjVYqh
         iyhRmcngohg3DvyfNntdXd+fk7kA4A8R5qGpcvZwAoShOrSlEVs9AWbt55ouUNnAg4Gk
         wsyA==
X-Forwarded-Encrypted: i=1; AJvYcCURNBx9ZjlsYeopGOpZPJPPdp3PemeWfqHUxPnNM2XQI0mXD4FJsLyhjsNxwSkS4+drOqkLVvflZZ1u1Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeYOQ9mYHZkTqpgI+VnnwA1HKI3AXlSpmrGst4707jWbq5Hef
	aguvARh/n8Mm66iHf4f71ow54t+RKQeWlrVIG25++0iJT7gsfX7zLzvExr1+SmW1JRnxteZb/zg
	iBSwY6FUuW0AaCg==
X-Google-Smtp-Source: AGHT+IHc83C8k0kWyFW4B7jVylfVU4gtl0Vj6eJsSbBowS4jYe9JFHSyrYsbEeWgcs2CoUj+GFAgp46bZhkRTJQ=
X-Received: from wmqd12.prod.google.com ([2002:a05:600c:34cc:b0:435:21e:7bec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c12:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-438dc3cc378mr206991585e9.16.1738584918711;
 Mon, 03 Feb 2025 04:15:18 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:38 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4198; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7WepNBMO3VHpBbUgOZ7CBvykk1H/XsDvQNuHzOoGaDg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNKxtxYKi99rKgHmqWkRH4nWkPittKx4tZr1
 V2PKQs0+sWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzSgAKCRAEWL7uWMY5
 Rs6nD/9iQkAZn6Vn+uopIfzFcx5caHl87DWWgkBI+qGs0DLDUpqfdZDDlnPBuD/dIBc3jKZ+uo/
 Lh/A/voziPGDymGXzHHnNm3JY90Ik7PLD0SLTpzLw2wr12kKYE7LB9Q/xjIVchr710cvfcBhhpn
 P20GzEcAMsY437I0tnAMaqFRIcIKMO5HVJiXPNJf4akkxzze/3S5i+I76xujCoQiwlO9hACF9x+
 tw9+DxI+r62S0RiAUPYSKIEpHWeBCg86V+YKbjn8v50FOXF5ABV+2X8jb/AEVQC6JtVA6DoUNF0
 K1+5WN0lBG+em72x4Vcyng5VBjsKX+mQcRpqPbf34ClRqkcbuTtHrDI5Epdwq+xqc5waUutF4Zt
 8KBwkMqh9PdEKoFWBw1/6ERz52tmjV8oGdbf6tEgsDgorhKWMEy0HiAeTSLDE6kyujBfFGnCOFm
 N6eGYTpbEALKFem+VPN4SFR25IHNffR1fF2Pf/Al0m69SBcsOwtAffp5xdxC8au4qiF7nfhuSW7
 MHl5N3G7w4IGSxRAlse7Oes7RJKU3nViNhOjCSncG6LfUE7Rf+O6eog2MP62j3dvJJ67znZCm+d
 EX1c6LqELEE0UFq/3MT9Sn8Qw9H1jmYZFsOFYY9hgAVSfYVUKSwpK17WB+dP17CvpWB3wwlVa/P KQKZVuibB3ekJag==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-3-2b998268a396@google.com>
Subject: [PATCH v13 3/8] mm: rust: add vm_insert_page
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

The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
flag, so we introduce a new type to keep track of such vmas.

The approach used in this patch assumes that we will not need to encode
many flag combinations in the type. I don't think we need to encode more
than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
becomes necessary, using generic parameters in a single type would scale
better as the number of flags increases.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 79 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index dfe147cafdb3..64a0a47070a8 100644
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
@@ -124,6 +132,75 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
             )
         };
     }
+
+    /// If the [`VM_MIXEDMAP`] flag is set, returns a [`VmAreaMixedMap`] to this VMA, otherwise
+    /// returns `None`.
+    ///
+    /// This can be used to access methods that require [`VM_MIXEDMAP`] to be set.
+    ///
+    /// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+    #[inline]
+    pub fn as_mixedmap_vma(&self) -> Option<&VmAreaMixedMap> {
+        if self.flags() & flags::MIXEDMAP != 0 {
+            // SAFETY: We just checked that `VM_MIXEDMAP` is set. All other requirements are
+            // satisfied by the type invariants of `VmAreaRef`.
+            Some(unsafe { VmAreaMixedMap::from_raw(self.as_ptr()) })
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
+/// This struct is identical to [`VmAreaRef`] except that it must only be used when the
+/// [`VM_MIXEDMAP`] flag is set on the vma.
+///
+/// # Invariants
+///
+/// The caller must hold the mmap read lock or the vma read lock. The `VM_MIXEDMAP` flag must be
+/// set.
+///
+/// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+#[repr(transparent)]
+pub struct VmAreaMixedMap {
+    vma: VmAreaRef,
+}
+
+// Make all `VmAreaRef` methods available on `VmAreaMixedMap`.
+impl Deref for VmAreaMixedMap {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        &self.vma
+    }
+}
+
+impl VmAreaMixedMap {
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
2.48.1.362.g079036d154-goog

