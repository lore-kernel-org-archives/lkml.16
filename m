Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05921B195
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937886; cv=none; b=odgFydDonu6V7/imO/Wri+fktSAvTvtF7zdLb4RQst/u9NBd2htcsm67bB0ySYvo+UC6Ru40pcqUFKuxEmECxkF2MyFOyYF+72KpNlgVR6IE1dvn4TQaEkTzRNYsypNegpcqvrqYnuIjMt/3AaKgdAPU+mZb/AE18utTC0R7OK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937886; c=relaxed/simple;
	bh=Hiakr7Y9aYp+t0qkrintpujLcwt0vMBhaVvBld3CMvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r6XhwvwzjqKVdwpDcK1bLk9OMpFagI7HkidJ1cwyZQUAv5WjDrqLXYizGtkRFzFiG5NeKZOw0peCQmf3oETuDp/m48+4qW1l/Gmq3qV8b3GC5mNo2P46H+JbrE18XVP/4edka+K/E3gWy2i/mANWJ++3kpOLQHIF/YWs6ObM9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A6wIORcY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A6wIORcY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ea256f039so45627885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937882; x=1746542682; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s939wDzCcsIUv32fGMnjwXbycHwC2LyhdpkAIZGUK8E=;
        b=A6wIORcY7pWBFLxQPxION0b/v80wbAr2uEwEIrOA5zKoVX6XzUVsCcGD35PUbLWZS3
         8PF7aXaYV2/By54Lwh0HmjGy2u7+sIvtQZLE5cGP0cywc86Ms9etckedWn6mnXUtkzq9
         XdAxsXp+yof5Fb/haJFKZMm3mqFwLO1G1YR5gvFaE0WikABtEWQkk5cSWyivnP/hCKtu
         ESWqOzJp/2PlI//epL0BTCYaYn4cDkebsmY4kTNk/Lid0r1AQSPkFdIIq1rIL4SDUY2u
         uV3h7GAh84zIhv5OSRP3yV6oU+wvnBxVkeB6/Ns/azTIXVyJpKzfEBZYmXwg+kPokDuc
         KLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937882; x=1746542682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s939wDzCcsIUv32fGMnjwXbycHwC2LyhdpkAIZGUK8E=;
        b=M9XOsEuS04Q+LlKZokAMhLW/y7q478Moj3v+6ewA1/8xQgLP5/kkNeNB3Up94Fe8Mg
         UcAONpzv7mgJ+143N9JubxK6UR7bSRHbhB+HBcOrb4469s+op/S0wMOpD7ndnSdEWFfO
         2FQ1PO/uslp6bTWwDKI09RTftTY9KWrbCY9uGIckBNwzx4upCF3lVp3psaZBZI094yuA
         9CZ+zyVCFyaFsXhPwo36V9KNxHc4JqdYoFrRllW/h0/p9X4Rm5DHN7h3bXSTLrjMd1DS
         +aG1HDvcGqrvSgNYyEELtu3WOfYAjL+c330y/5UTqHNjkIXeg9DzvQkVHRM5t9RWqG6w
         2wkg==
X-Forwarded-Encrypted: i=1; AJvYcCUMloU8i65gVMRpr5y2LhBeB2M+xISQiS2BE3DGSN0/DNql1iW/fWje1hxC1sNAGL5+/NV6d+OwMhGVQ/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YybRi2oMdK2ZJNRx9BHBPnMi+KRXPXr65b/lLD6G5ZekBbLg8nU
	gjB87Ir740uNo17ScWvJ9t3Npx+bG/lejww+Abrr/jxA9HYxDDKU86AfktWkQpfQBeR3Aseb91G
	8MEHgpvNB2xl1bA==
X-Google-Smtp-Source: AGHT+IFD19DC6VNFdYNHaJ5B7QYfDpABloUHji8YWEgBpm0M3wFbbm8SDhfVUUEtTh/LkNEshZM3o0hDQuHw7n0=
X-Received: from wmbbd17.prod.google.com ([2002:a05:600c:1f11:b0:440:5e10:a596])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0a:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-441ac84b420mr30698235e9.1.1745937881832;
 Tue, 29 Apr 2025 07:44:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:22 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Hiakr7Y9aYp+t0qkrintpujLcwt0vMBhaVvBld3CMvQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXSNUMSfaKjzrQ8//RXnlSgRBdfrVgIxEqPV
 n/6wNru+VKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0gAKCRAEWL7uWMY5
 RlmiEACIdJOy+8wpGjYitzbsFLExkryvyKH+MbykJsYTYqDZjsQGFdT4+9q0q2womW5yrrag8qP
 vixnqJ4xGGBaLv0xtMD41UESRvHuV4xXuQYarqGC6vbmVWajdOSPjxH9H7kd9k+py7a92Cak0iT
 IxRmZ5RpcV9rZ9WEdXOthMC/5NtNTa1/TmMY9PJWHdjknsOUPdJP7d6jvf9Qa4wxieDJclJOBTg
 lBpTb+9E8fi5bsw3QZLN7nMPZoHBeYQvyA+poQ8qluFTVrg97OJdhVe+yCvbMeuSRC2FtEG+OrN
 bUKSg0pyq37oNY1KIxrViGFDhdhpTrP4gevrhUbToGV4zga5t/f6P69AUx7vchrpp2IwPlNXz+A
 qZvGjeHtSU3fPq405GorDflI2r4cTg0QjvxE1uDJOj/IdTqvjtzD6p/ikwStTLPWpefMYhGOB0m
 +ihAflNQutzotktkTvmXo+9w277W9ZuHV0ymKr/IjM+M90waKuvFIfdtmDW4wcoENHhrY9mQ7+7
 HU/2+4d7ew1afSYyBjwW+20PlPEA4H7/8vI850aB0XEpvthp+pdRQ8hVmPtegeH0wpfXCiv0dSD
 rFTTLE93K9ycZ17yIPwhbAiarl+aHpUwCdn9egxavBn1CrTGt8mSVwLnq7dWKzJczWBkz4dgnci 5DsIGS28+xlpmDw==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-2-dad4436ff82d@google.com>
Subject: [PATCH v4 2/7] rust: alloc: add Vec::pop
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
2.49.0.901.g37484f566f-goog

