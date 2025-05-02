Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2D4255F39
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191991; cv=none; b=SPk3pFuQrjGTZgSAOBL/FdHKA78NyaHdT2zM4xIOkAT8NjRJYMsZU++2xGqKaA5XTPGyfhUZ1ff65F/xbCZo6AiDT0q+w5aBl5axjFf+1mVPn4jMDHfTXKoR0kN+Y7ybcW9dgYmEFM8VUYxD70nhybmfcK6IgEypG9ay2w9/DEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191991; c=relaxed/simple;
	bh=MXQYfazmKkQqgGylg+AFvYi72rjPBnY451sRoj98mHU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hWbNMy3kCzRjmCstiT+0BLaPvpNSKjuQuYbIpdJaKRDkpOjTBF0o+Fl0dYvmR5NxC5kqehe1ySy+WdU3bK0yCxPFWYzICxxCaMq3yQhiFbvzbtN6sayUPBcgxjuhreQpVl//3yHgjeK519Itlzkw1ktIH07zFjo+4wJrIWu/wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u+iYWXmx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u+iYWXmx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d733063cdso14482835e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191987; x=1746796787; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqmeFwn1Rj34pwx6jnFzRTB4vAw5UvMjZEUMYLZfhw4=;
        b=u+iYWXmx8anYaKW17xKMq4Z00d/vuaMbR1EWghM6sjRTXj5bVdydcdqCEMTvTW783u
         To1acmAEdCWBvZs1l8mmTMDiaTStTTTPP6kRSb0hdKTpl3qULri6ILswADOEhJvUH1Vr
         4UNj53TFexww2XXiqrHubzRg+SlaEWGIK4dLnc/2WnfGIKxOOj/Vo2UqsA8FE8bBK/na
         nh/1o0skoUybewUtt72hwmkJWQIMNzuBDKwqZfz+n3v4pXZ1hH1ShI3jXRDrZ1LFpqSj
         9OxSjQsk45slLtHdJ17vxKTzy/lJ4nTpLtDn2WgJ8icF+8YXviAyp+D5qyqNOkXS/alD
         gZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191987; x=1746796787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqmeFwn1Rj34pwx6jnFzRTB4vAw5UvMjZEUMYLZfhw4=;
        b=ENVUwPU4cE0077lZt4uN8pwTo7e9s+rTNHy6Xr35B9WmIoLOR+kYmGTFwG2j45VXAF
         +wU690ZVOhmY53COC7WVbbaN1nSso9r97z3LAmP1hqvG5o7l/fQtKgcv+PPV9To6vmOp
         7vG1LMdEH6sOWnbajYRmDIP2a8TWHtrFw6YfYZ++r6kja57u5IT6/LncTQ15BFb+kgm7
         JRD4z3xXiqdoFkd0kcZAh50Oonah5Hjs8fAxKuS12zGmB+iyS1yunDj9JApV9p7+CEFY
         F/xvnzyswMrldJvRTG0Se+nc9ob4ziFks87a+2Ovd9ySq4oegBihYp+M3ZqP8ncDkXAh
         u0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1tdjMby/RlVZJG6MPifHCKVZkvd+N8jeuf0sJ0cvtevA8f0rRWolLn5SP80p1RI52RDzl+LJDoLVKIT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcPZ0wjAbnn+ecad9ZC80FMNwADEY/vc/IRZWX4tlERU3bvNS
	+ic60RmgKmAeCNYfZF/G1Hfca15NVw8dbOAbdYywxSIfPzhei8A+4Q+IiGZ+VX8svQ5Eh2tG9pZ
	DDPJNP/iNaPW5Jg==
X-Google-Smtp-Source: AGHT+IHdXiLWdxIZ4Yqr6/Pv/iN43/E3gnSrF9FP5/rrTcGLwFIFHW42RprHgESHdFIvdvtzK5MckCDEno8bE4Q=
X-Received: from wmbay23.prod.google.com ([2002:a05:600c:1e17:b0:43d:522a:45e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e19:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-441bbec221fmr23679805e9.8.1746191987828;
 Fri, 02 May 2025 06:19:47 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:32 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MXQYfazmKkQqgGylg+AFvYi72rjPBnY451sRoj98mHU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZpWvL5GIFDNDcl2YOYjwYZ0d1nB5fG6xJ9c
 guC9afNJq6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaQAKCRAEWL7uWMY5
 Ru+3EACvzMUzAcbwDz8cGLCeCy7muqK6ol9STRrLrVcM/mHKecC/PamFlhFrDvLBFbKeAtFLi63
 tfvTtxOYreAtAx8txWykFe7kSYf8ukPCG2YmdDCoNR8zJib+Twv8UUdiv4Pam+ndFUP/FyIDuBm
 nkKO4fnEQR4fFgGAHSXZG5v8UECpV4M86CBFycmK7A71OXATGC9a+FRhD4vP9+yXRgU5J8Cpod+
 AIuPyGBXy67K5mxEAWwwuzNhz8hAqf0B/X+XgGgd8D/gMKI+Nbcx1IrMvORZJJ4r59XmWvQFj9P
 I8VS6yCT0h1jwv9nRgt35rlVxUwzRthTk02RR9AdNpZwEptFS8gxNq06jbd7+2T0mP8SfpNaOuK
 WCTGggVymxFdDzyevzmbJkoJilgB0VPY+9WBj5ot/RWbqQxrZXFgR+aOXZzKPEHgxkik9bNfiyt
 hlkGYnyce7Xhs/hApEcbeGAExRqe8sNNm77Q7k7C5/6iQQHlIb0zf1dvcANrhE2OapRFEKI65Gi
 VSzexYrdtuqHL4KmQBDit85dTL0Ek/araLalV1J25Uh9KDH+svxrH9QcMO/9rosvYo68EqgAjk0
 HaLFuyCSxbkHucE1M+q5ICHXRSt0BUUb17bb3s1zeH5l536rrxT79ctBbYbfxoSd98W6bftWfqC j2OZIBMkeBuxIsQ==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-4-06d20ad9366f@google.com>
Subject: [PATCH v5 4/7] rust: alloc: add Vec::drain_all
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is like the stdlib method drain, except that it's hard-coded to use
the entire vector's range. Rust Binder uses it in the range allocator to
take ownership of everything in a vector in a case where reusing the
vector is desirable.

Implementing `DrainAll` in terms of `slice::IterMut` lets us reuse some
nice optimizations in core for the case where T is a ZST.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index e9bf4c97a5a78fc9b54751b57f15a33c716c607b..7f75f3174ccb85daa3a9546d7b110da97f46063f 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -586,6 +586,30 @@ pub fn truncate(&mut self, len: usize) {
             unsafe { ptr::drop_in_place(ptr) };
         }
     }
+
+    /// Takes ownership of all items in this vector without consuming the allocation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![0, 1, 2, 3]?;
+    ///
+    /// for (i, j) in v.drain_all().enumerate() {
+    ///     assert_eq!(i, j);
+    /// }
+    ///
+    /// assert!(v.capacity() >= 4);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
+        // SAFETY: This does not underflow the length.
+        let elems = unsafe { self.dec_len(self.len()) };
+        // INVARIANT: The first `len` elements of the spare capacity are valid values, and as we
+        // just set the length to zero, we may transfer ownership to the `DrainAll` object.
+        DrainAll {
+            elements: elems.iter_mut(),
+        }
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
@@ -1073,3 +1097,38 @@ fn into_iter(self) -> Self::IntoIter {
         }
     }
 }
+
+/// An iterator that owns all items in a vector, but does not own its allocation.
+///
+/// # Invariants
+///
+/// Every `&mut T` returned by the iterator references a `T` that the iterator may take ownership
+/// of.
+pub struct DrainAll<'vec, T> {
+    elements: slice::IterMut<'vec, T>,
+}
+
+impl<'vec, T> Iterator for DrainAll<'vec, T> {
+    type Item = T;
+
+    fn next(&mut self) -> Option<T> {
+        let elem: *mut T = self.elements.next()?;
+        // SAFETY: By the type invariants, we may take ownership of this value.
+        Some(unsafe { elem.read() })
+    }
+
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        self.elements.size_hint()
+    }
+}
+
+impl<'vec, T> Drop for DrainAll<'vec, T> {
+    fn drop(&mut self) {
+        if core::mem::needs_drop::<T>() {
+            let iter = core::mem::take(&mut self.elements);
+            let ptr: *mut [T] = iter.into_slice();
+            // SAFETY: By the type invariants, we own these values so we may destroy them.
+            unsafe { ptr::drop_in_place(ptr) };
+        }
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

