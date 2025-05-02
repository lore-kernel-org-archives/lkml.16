Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA70255233
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191986; cv=none; b=H7YNP2qZvj4pMQc+K/MvAtRiZ12ZIcr5t2p+42bTO/u9l56taFDoalABUrkrQmjUTAlLl3YQEbjBVkUhhOb0RZpUwZ5v22USWM1cKsAJJWzU1G1DF/Sn+/ZehLHha+ZKaNRSIvz43GvZbDWeJnx7w0if3CA+Z6MDmFurSGLugkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191986; c=relaxed/simple;
	bh=zedv0Ud5AXr6VBmDd8zA+6r8ej92u1QpNNcD/1j6Igg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGtAywx5Xm8HiP5UC5K+K3jfRwuNvCjVD1AYbTfyHVEU76nHapnI3mbJMQR42xWRSMSGHoDXHghOnX3UG1Dyd+Q5zbQpr5WwNzuUfqvFNM/fDWO+qI+EnT/46bLGbwznDw9pXspKt23ss9+Qhhz9w3ulV1KU4zaZOBxZBw+6QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ebGt8LWT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ebGt8LWT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d01024089so12513245e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191983; x=1746796783; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+L34cKVl/QWezEuUTAS3yiE8vFcujdL77woAc6rzSjw=;
        b=ebGt8LWTAfx/NeAJKg7GwbapU6S1Q/fdMmdqmeSxAKGfpjrSAxCXL1Z61zWEDyN5uJ
         LBdWmUqB5RS2VFObhzSUZJQqImB8bUJrB6UjHzHp6Js2hya8Xp+hamoXWI0UG1On32tE
         FjBKok6uzsX8sVYCmgpPU8SxRN5QsWdHCvAcHAK0xIe2oO/xuFWWBUSuzqe+Ne+yCVSL
         Se913SSNZm9IJTA87tDkNQdkkSDgmu7jbI1HCtjAHGeNXm3BFvyPMHcRrfo1tsxcUwGe
         3NdUfA8Tn0favvWBPOPdRwxcSkYZU9BC8CdDHRC3xumKXzo56QxAecuxiKDDI/8BBA+b
         rxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191983; x=1746796783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+L34cKVl/QWezEuUTAS3yiE8vFcujdL77woAc6rzSjw=;
        b=vG+bbFJMHOwySOjs9Q/csIYtoMI3BcwXDIPRdfJjeSzvZ890vu62SjuIAPqndLYgBQ
         vmP+vJF/Lvv7T+F5bis9hlB7bKYTYwFi8hMerGd3s5w72zhH6/i8TH2uVfkJ/RPwIiWc
         aM6FcW3yqfPJHAm1nBTiwlN/7JGfHYFuCgq+EONV+9YLd6LdLBLRlFUL6vQRe6Y/tRfv
         a+5Gp0ni7ojnsQtekldjzCYqvuJSK5aRjgCqGI5lYV4SSLKi7JdrWRGSltp3BdmU3dZb
         pqnPOd5ucuSDWPQAnIuo7gKBD8oEnCHYSIiTeOBLlQ+Z0qEBCFzTF0DCKWxP58wpv5jt
         iDow==
X-Forwarded-Encrypted: i=1; AJvYcCV+zX8WwPzNvFFGpEvWTUxoZMPquefSMyl2gMk0kEQdnX1/6CdhA2somMscG9pUwZNki0b1zRWheuUY/F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvqhGvix+l8UzCXg6g1jYMggXRacwSx3YoF/UH1BeALSPZHHV1
	9PbJyUtm4l3/gqOuJi6W9JAA4SH847yK8UuIvCXzZQjKqwfCJ/OkHvYa9eSbFjmPtLUnHjJVYNy
	1rS5Hip3F8S4pVw==
X-Google-Smtp-Source: AGHT+IEuKQNKvecGdhwHBbYCN97yW+PFD8r7ZBIumcauLOIO27gV4LIw4vjXZi46OZNwh2XT0C1pG7y6e/XwrNU=
X-Received: from wmpz12.prod.google.com ([2002:a05:600c:a0c:b0:43c:fd99:1b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e88:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-441bbeb3813mr22539795e9.11.1746191983770;
 Fri, 02 May 2025 06:19:43 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:30 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=zedv0Ud5AXr6VBmDd8zA+6r8ej92u1QpNNcD/1j6Igg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZo1RXcw8Sq8mWMOC1GnKtfjkg4D0uDr8nSO
 nY7OzkiZUWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaAAKCRAEWL7uWMY5
 RogXD/9KcwpDA3U5qoXW3BvFp4l3F1NrKDrLmMpvC3d69DwgcJx8IkHKhEeF7sv0xVwtrcvKmoS
 kzhPcQaO99mHFQeCEguPQgcabMjbGx5jyihq689LgYe3EzQNbjdRrxnWYb/dN81hREAj7C66s2j
 lVQXSt4e2a4jnlFe1IzAKFymyLNLF9ZqLim7ETRQruETTBbpgGQ3pwU77p+C2XdZ6lPNXttyfsx
 My1PyJQ/HgsWTyhjvxNOmmbeFMkozhG+/aZhs0yHkrlwWfPN+SUoiYBVtcEcfD9A90TxN9SSyVs
 KQL/0IX9zHDTwPlLWCmJp+N06YRg/kM4JGT5WSsuOWOD099f0jE/xSUICCmnTaExjb6A4aP+12e
 BFqG2FeZvgnTakHme8crge+PG9O/U/hPnQbOjAFVsNfY17+esW6XBCzbtlyP0aMGfL0AZikLY+Z
 YPB7S8+Xuxq0Tlr69XSJkEOxMo4HT4UkXML8tLAmo1Ee8la4ChtDQPPmxXAinyfymu3YCBWRTzX
 oKimKE2FcKkUQzhwEu0euCDgfaU3HiU/j3RN7XaBiJ/AUeKTKMik6mPRQ0n+oaUC79QVtmAcJQ6
 jzElr6EyTgYQcABI7Q/aMqZbVkyiiRhIqrPFzKIgM/zibPsbfP4QwfF+ktWrLw7T3ajcNYz3D/Q dW+EZ9lfvvChORw==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-2-06d20ad9366f@google.com>
Subject: [PATCH v5 2/7] rust: alloc: add Vec::pop
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This introduces a basic method that our custom Vec is missing. I expect
that it will be used in many places, but at the time of writing, Rust
Binder has six calls to Vec::pop.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 412a2fe3ce79a0681175bf358e8e0f628e77e875..ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -320,6 +320,37 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         Ok(())
     }
 
+    /// Removes the last element from a vector and returns it, or `None` if it is empty.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 2]);
+    ///
+    /// assert_eq!(v.pop(), Some(2));
+    /// assert_eq!(v.pop(), Some(1));
+    /// assert_eq!(v.pop(), None);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn pop(&mut self) -> Option<T> {
+        if self.is_empty() {
+            return None;
+        }
+
+        let removed: *mut T = {
+            // SAFETY: We just checked that the length is at least one.
+            let slice = unsafe { self.dec_len(1) };
+            // SAFETY: The argument to `dec_len` was 1 so this returns a slice of length 1.
+            unsafe { slice.get_unchecked_mut(0) }
+        };
+
+        // SAFETY: The guarantees of `dec_len` allow us to take ownership of this value.
+        Some(unsafe { removed.read() })
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples

-- 
2.49.0.967.g6a0df3ecc3-goog

