Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E5221568
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937897; cv=none; b=Sz5o9YHkt/GXeRCpxP2zNRsaJpwFSoMgtRlnTxgkU99plFIJ13KHjyUwN+Pr7KjaKZ+KxeuCPTqZNvkI2Ml+/XuXbEYslif+VqbyVvNgrf8251rodcGmODGBrhgBWPHTaC6Wq3QLTH9v0FfklbQxQSep8GAmvHphWdAP7TsAAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937897; c=relaxed/simple;
	bh=lpvEgUX7rF9U71IW1suFe1v4Cuv24FiswYAVVSqnMAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QJzPSA5JhCvhp5ubl8DGocVwV9+lo4akny/GV9R1XMZlcZMFeIwNOnM3BuKSW42luiZ4nWtiHIRD9Z7jOyx/zZM2STpnpdESYyNk//NEi2xJ9szNcvEHaBw3ZheqvVeVK5JMfrhrQMB0bzCMN/GYIGbu8PJw7c+WaPq1bBr62Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvlZDzz3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvlZDzz3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso35947645e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937894; x=1746542694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mv0mTLyyjWQP9SGntPKBVZR+DB04+FyoS2G+H2BmFJ0=;
        b=tvlZDzz3ukQ3vTg2SUon8s9Z0Cq5CruGNVGrep90WD5E94XrVyQExrHPIPIB+ZYZY0
         ibzZ3OGuT6tPY+9yhS+XjsFSEM0uI5UPLMhAkz4EtG0WijxQ6XXAo1ix1Ax5Af+XZZNo
         OEURh2iNyiQctPIpQP/OwG6mSN7BMh0XQPgh2kgvsnywDRA5jWvj2IdTKw1s1W304YGE
         EcKgYaxCwVg3zyMvu12v2giTfxK53dT8dYdit5eIdR+S8GbEK4/YagjLjQnfRfigUKJp
         SPxjlWeazYSbDZeqlhulHtlrB9wOBXUEe4G/2USyZpoC3YUQZp9OLTCRFsaqQimZIGUT
         7mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937894; x=1746542694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mv0mTLyyjWQP9SGntPKBVZR+DB04+FyoS2G+H2BmFJ0=;
        b=F1FSIT+i6Uv5XsFt1r1rIyqTV3VAphrJuUn/K4wLAz/PYFWgdM699Cm5N1dzfOv8cw
         7cqf37XVsAzB14JbO+YW9bvH7hPiYfoyYWU6gUeiAMSp6B3FNtql8Efu/QonNV6R8Qy0
         43wtX7PwKXDPO1k4Eq1fVm8P3Mem2SoGIg9J3jIu6kpBo4+pU/QD96HoXdpkSUxKQBzO
         3FGTxyb725YHDaldAxZbGhS63NT6FNIdLN+pUSoOtKPusjc6VCLjPuwI2aDln524eTgq
         JqYXXEQ7qmQ584HvM/SpN2TlsVMF9IC07VfBDHrfR5UKrBxApYHft0F1JKaPQrTYA+fz
         SJGw==
X-Forwarded-Encrypted: i=1; AJvYcCV7+YMhzj4zoXhUcl+CUTMw5YbfLdGrKFk8QgNrT+pWGJ+BKv/SVHMv4mftQ+mnyn2kfE2rEc5jRr9vJeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziHHb86tTN6cI4IsL4zmAKcO3dIPx2+ptfWyDgekO6ounun6h9
	vvhQPBH3EoTkAPafyNsmGtyQqjArClxW4Zt08hc0g1Zs3YJ1wM6OEk+7mDdfk67o0MvE9gDqvyK
	yJJFRD/Vv8ro0Og==
X-Google-Smtp-Source: AGHT+IHViXi3ljRbYG2m6vfiPDON6W7Vxy1R4JL3IYK+GjqIdY8+eCKx52Eukzwa6FjuinT7d/AtH+SSZ1gEPOU=
X-Received: from wmbfk10.prod.google.com ([2002:a05:600c:cca:b0:43e:9aac:5a49])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e08:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-441ac84f24fmr42492955e9.3.1745937894297;
 Tue, 29 Apr 2025 07:44:54 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:27 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=lpvEgUX7rF9U71IW1suFe1v4Cuv24FiswYAVVSqnMAc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXTRPhf6cCev8g4j060AgJ76gK1QzLdyxK0f
 4YqZNhNs4KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0wAKCRAEWL7uWMY5
 RvPkEACfBVeHtNA2xPFiTyRXzGAHM4EB6ppgpUbOQir5lqebvXV433YXljMDZUOsjjgXkGV91tO
 B7/80rZDUge3NIO9ZPmIPX3T1xnhkj6NSg9Er8Pg/0PsA2T7YtB1RIfpRS+uAULwFZIgZy/lTJD
 bjhnDqLgClNSJwE4Bs7xSTDLLmE+QKgrQ3Qiw8jySc7Q91Fk0huJ1A6OmlbK8GMgyXUTcPIJyrA
 2iB2AF3EIyXWOBB1BDp2q381TbzW52YsqOCHYRJfWpqy0yodvcfZQ/In9qwiFetZu3vEs6JMOkj
 GGVRl7x80+6PZkSp8IDKl9AnGXCNbchpwjMsHDhiaG829+xBzqr0Z4Pn6LHefKlqO4+8JCBos3E
 DI++awdf37mmXB1xiNN81/D8BUrQ+9hCapWEkfv8uUdkRF80z+Z7fIidZWIQHkjKr4w7ApFEhV1
 NDst3ZSWdnHIR1R60oMZE2WCfVuDnDLLFkjl6p7qptaRekVxWZvvnpg1wXqMkKB96HStclJBGBe
 SvTCqNRwWsoyObBspnMOXczcNmjz3W6uJarpVs3lUQM2cus/rZTNZkCTo7WTGDBmjq5mVkEsdbh
 nK9RjzpxKLhzLVsbMey+LoAwaH35y7vCU82N3BCxs10ajv/ailknDcaWt/8XTUEzA5lKmQeLoc0 1waSih/EtTefziQ==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-7-dad4436ff82d@google.com>
Subject: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
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
index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
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
+    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
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
2.49.0.901.g37484f566f-goog

