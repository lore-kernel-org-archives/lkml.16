Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE52214A9B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315576; cv=none; b=uSGKyokjunS8KvLcKVPUzJFnpIOrTA2WPVDp/wvyITE1jBvk9erBC3yrYUI73WAS1XYetCUEFiLg9mof5DDkosBf5vqZRZRckYdrGedJFrFhLSiJKvdLAigSavfdggUUM234kieY3TTpXgg8+Y50uM7SY2qjEI1mu/CjaK4INGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315576; c=relaxed/simple;
	bh=KAoN/I1B9bjZf9yqrwjjTVg4XFhQinQf/p7dHQd7M6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J+gv+Bg97uRYqf9SuzGUhBzrUzTeinpRzsOAd61Tx1G5z6ASJx2QRL0Md1xmq/0vcYFAnvWSx69vGoUthq5Mc59SNEIl3ou5GhOImFV5/DqsSpgcInSIT+8dHVFKvHcb28DH6wvt0DHclnAaAVHGEymonXe6jxAsT1hsWnpzIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4r2FX/4; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4r2FX/4"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-391492acb59so2291458f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315571; x=1745920371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKQLzqoWG+gLW7RSIJ9nPWEIDBNLgsckjy8Twrs/QCY=;
        b=Z4r2FX/4FZlIbgq/UpjIN1noeVta/fXs6gUJqRj/Hyv0WvVWO114sq9QXLPqCrhOZm
         1vsv2G98VDq4WovgMOVuwVGI+S3flf5UX/o6bCWxiAF5iN5+QsUWh8YBtO2y07z3zVY3
         rCitTgO9cX/+4/qjwf4x2Rp+UzQUal4Yg0L/DnhCFyNHrd/T6H464HvSVaQ9zq63VYtP
         xrWbvgDg0OTnG2zRLHYWlNw+Kyj4jUrrhTaCaeNCkSDBpXf1g1Srs3qhpzn6kTpiDRPy
         b7zApMGPNCF3nQ5KK+AMzkna6Yi4gP5EVm6t9fg2lpG01N6pkL0egSMRl2UmdB4AYEs7
         rIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315571; x=1745920371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKQLzqoWG+gLW7RSIJ9nPWEIDBNLgsckjy8Twrs/QCY=;
        b=taC5hvW23GsyfIBOdZopmuzZmEPzSTxPGIP0vrJvWvNP1BCsfPSAAq48Ir3d7req2q
         P/xlKOHsODehcLx4e5JfB/E6p4im3U9W630P6Mn67ZPdp1RgcDOhiPAvV9TVUnd1xnAa
         lXVgWW9A3GjtW+WPG+BC/jB18c1eI3CsxBPvVdFwNRsCFBXZfrJRcpY9QFjd04HTZ0ZX
         tk/34x1uMLwvgLTSREsBQQtZaVy9+FGGyGSEX6ClRwcMBCTxBsOsooLUiAeTImtQFZ+t
         BfiAoQ5IRjXcFbFFLxBqdMgCj9BAOVcd8SH5BOKFm+bN8kllN6z+ssuI/sBMGEb+8TJi
         dlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa/4uUsxwABGGfEW3/+ZKCiB53RoP4b53j/OHHYkDk4IozjZyCeupHHCa6+pc+kJS/h7M/ZhhDPfdqaKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhXh5F+mF/KSclcYpJpLmK2B6cC9BhTIXjdAuPgs6MnY9d0Bx
	xdIZdqBsHSiK1v0uKYY2vXUebWttRReHCZIx+gnRDYRS5o0mpi8zis5nyYh3uQmzphViTxdbzwj
	cU5e8aX1EtfNLmg==
X-Google-Smtp-Source: AGHT+IETKvRlhl6S7D4rhT2//lenejgCFrwc+s7AWMxUPkZSc8kEy7dq6FlkwpzrlC+tj63W1tyRhUWyh2QVE5A=
X-Received: from wrpx7.prod.google.com ([2002:adf:f647:0:b0:39a:bf11:dab0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2403:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39efba460f4mr11318079f8f.20.1745315571701;
 Tue, 22 Apr 2025 02:52:51 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:22 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=KAoN/I1B9bjZf9yqrwjjTVg4XFhQinQf/p7dHQd7M6I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgQFTDW6gduDB24/nGr91rXw4Ewq8GZMpj1
 TzIpatOEumJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 RrUuD/9A/S/Mp/5agMCAikeUZWTvoBaF9+18NvkiRTIbKjj1Jj7PBuHnkEyn6sKV0fkRjtMcDM4
 CRzFQhs7OM//DFERlSkjdyD4vO8ljqHqjqFMWwnCL25KYzqvrPAG4nTLi9SgrHgEAbqB4rEaPt/
 qJcuFkQvEocGFWYcz6UK73YA7903o28HCXiJ9jup0inWoUgdvHhbI+WwcGRwZJmYqJreJofQuhf
 ne3BwQs2E0xPcbXsdrdDTdzGc4AmuksU1ixwP0Im8kO51kJmg9QUwCktq17/7iYEKQtQFflEMfI
 pcetvKnSgOOryPW0rFveq/tfFPX4NG/towOh3HU5tpX0Qayht364XXJdJKy74ved3XJtw8jppyr
 A+ssVjm0GBYgzTSoon7le4EQ1uInYLO8Q+zfTWgvS2ZoYvmm70PgQT90rOMS7EvlATxftNZnsrv
 9jv9njRe9IARXIa+iq5e3m6JJqarICQqyNGw9hNv3Ksp9MGOXKHn7Q/n3PDkDGHUlIvV1r8uyO/
 nEBkEaObMTCU6X9GS8tHr8X4K7qOA6njkuCvJDR+o7iDinmkAO3Wumr0lP7cxX8SljtzPBLdj4h
 g9w8GjhvG3ms2tSUeUcV2UL0o2FNiDOTgn32Xkj8LB5FU9ddYHm6DA0z6DXgsCn0AMPEaHjA/4A zN7zNFtTre0R1Jg==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-7-deff5eea568a@google.com>
Subject: [PATCH v3 7/7] rust: alloc: add Vec::insert_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a variant of Vec::insert that does not allocate memory. This
makes it safe to use this function while holding a spinlock. Rust Binder
uses it for the range allocator fast path.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 2f28fda793e13841b59e83f34681e71ac815aff2..d96de01a7ab3c808f5aded067ad6f1e3ba8029ce 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
         unsafe { self.inc_len(1) };
     }
 
+    /// Inserts an element at the given index in the [`Vec`] instance.
+    ///
+    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
+    /// of bounds.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::with_capacity(10, GFP_KERNEL);
+    /// for i in 0..10 {
+    ///     v.push_within_capacity(i).unwrap();
+    /// }
+    ///
+    /// assert!(v.push_within_capacity(10).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn insert_within_capacity(&mut self, index: usize, element: T) -> Result<(), T> {
+        let len = self.len();
+        assert!(index <= len);
+
+        if len >= self.capacity() {
+            return Err(element);
+        }
+
+        // SAFETY: This is in bounds since `index <= len < capacity`.
+        let p = unsafe { self.as_mut_ptr().add(index) };
+        // INVARIANT: This breaks the Vec invariants by making `index` contain an invalid element,
+        // but we restore the invariants below.
+        // SAFETY: Both the src and dst ranges end no later than one element after the length.
+        // Since the length is less than the capacity, both ranges are in bounds of the allocation.
+        unsafe { ptr::copy(p, p.add(1), len - index) };
+        // INVARIANT: This restores the Vec invariants.
+        // SAFETY: The pointer is in-bounds of the allocation.
+        unsafe { ptr::write(p, element) };
+        // SAFETY: Index `len` contains a valid element due to the above copy and write.
+        unsafe { self.inc_len(1) };
+        Ok(())
+    }
+
     /// Removes the last element from a vector and returns it, or `None` if it is empty.
     ///
     /// # Examples

-- 
2.49.0.805.g082f7c87e0-goog

