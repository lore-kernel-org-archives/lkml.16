Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0194A20B20A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315562; cv=none; b=aRq+CGTVQEXvbJpA2+GPZSZGOD4xM8F/3Zh2K+Kg3ynubr+F3FjKF7gSIKTTgmd4XDqwwT02QTNQ6jZ3lPOYWcSBrlxfUligBlYcD2vogQdPSGV1Fqp7bJN/FbdZrmTGk7+Pamk2WIjc8wwRqSzjqXs3A7MahbtsV9UtHmfuzr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315562; c=relaxed/simple;
	bh=3tfYucmdrXplIUc4VSHw+JRcor66PuJ268AQJ8tOuVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pwSx4WChgXZsvVda5tesBmlzs4399PcrAb9V92//bsaZX0Zec9+L+OZJ34hvXFEU7AVBYSelbHpgMQnCLDIlZcb9sC0muhJNJg/ogbLqG7z0QctFC5QjV414UnqvCx2uTWn0Ep9ChsX3a84Ic7pnE/wU34sxEI2saXTIx5T+2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uWs/aenl; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uWs/aenl"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso26560495e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315559; x=1745920359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciqTuORwuoEpSdVkNzMFiat/RoMWqsQLwZDvTI4Aq+E=;
        b=uWs/aenllz+y/zO6yb65dch0fxAWB5Za6bN5LdBWKgn3NCge+V3ZxDbvbMNJCWcbDd
         YtwSVhtoxJF3A0AjRMoN1dQfyNXtctIuVZ7ho/3m25gwD9EaNmPPpdLN5ewWRqk99OD8
         sIyCbRbFFyYyUYABppeykod0yKrXYz7hwrYQV7FSEwwcIYcPOswygdlJJAB7Jj5a5WD/
         l09jQe4MYB+1o99oCCZcBg6X2HHgp1M42BdjZOCkhbBaPl87giXzqmJ4jk85KdYl2KSP
         zlIuVeme7TF76wIYUZ0gzswO7k3ki3iYdoMkALq+UZwvVKYyqvl3RT86T86qg6GBfSbM
         ylYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315559; x=1745920359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciqTuORwuoEpSdVkNzMFiat/RoMWqsQLwZDvTI4Aq+E=;
        b=AuVXREwWlfSKHC4EkUPF7NHb/r8Uw3K7moRggr0LFGAk5JkL4tOYLIJ6hgC7behGXV
         4Z+sxr+RxYIYjSaubP417yo8GcgL81I+iZVFUlDhO0JrJ4hwfbnKXLADd0xERyVc5msv
         livmjn/3DCCEEnorHyyyBughgmok3OltAMtUqxlyfdoOCGBXRG2ijS+rGwh/6nJhNMFf
         krMmv3RF815nIsZTFuzpy03lGwW2te64/81+T12FxJlAIP/dr7louO0CeDdz7g1OQbuh
         YUJTseqTvMUE5ZxDIs3u081JvKcETouzoVeaSXQBpGp+lOXJX1mkZed3jdEBeQEj5gv9
         LFTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFuS1w5C6SnPUJY+vpX56zRe07Ba2TnDWgXwfal8A3CVLVc4hGuClop7ZNXSEiuFo1vs/6wpyZKDYVd7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YywErx1jLuz6pR34JXdiFykhYce3OhNxqT83Zu6VZ6HiqZZk1wj
	oBGVFPNa8AtNQ4iesd0FcXSAV3qBBelkDUQ7SXbcyiKg4WQiBrG/DzMQS4/EHRbKXj8DLTx0W0M
	rEgCt3tBXXfr32Q==
X-Google-Smtp-Source: AGHT+IHuxz729QwBf3SD7YyBTYw4Q0wkAdfK2nCJfDLoh0jtArfMd7mAM0Ni8PdsVg1ubU3K1FB0voA3BlI67pU=
X-Received: from wmbhg23.prod.google.com ([2002:a05:600c:5397:b0:43d:44cf:11f8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c87:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-4406aba2c6cmr138720545e9.14.1745315559470;
 Tue, 22 Apr 2025 02:52:39 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:17 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3tfYucmdrXplIUc4VSHw+JRcor66PuJ268AQJ8tOuVo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bffPl/slSxUpzd0wNgPhj4xxtJEPm1Wm/zU
 q5dJ6NJjKWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm3wAKCRAEWL7uWMY5
 RmmYD/0bypuWyiDN9HHeI0cxu3nrZoy/Lv53uCNMAo1Fl5eIKT/y/Q2dahESfTC2L/yF4kvun2Y
 G1spyLAUSAcAuot4RTn/CB5AWtwcBUxLVuCNFKSLtXG1LWqT7cwQqnFvOzHKxkgHmZkUyXMNtNz
 61yPX9qV8eiZICiZV63HInfZ3jR0rX/fm4Qqz3WhTLibf1AVyHCJvEH/7ZFTxVzZvWRSUCBCytY
 KIvxxeVz8MCuUpZWvYylJIjj+jveYdC3d6qkbxfMnDYip1lRzZ1qUqAT+AdGPJ92Za9z6UxU4IE
 0DgemFV3ghTTYmYt+WO1GQdMfMpDZiAtizZsfMOWhvaNaOvjKbzXZwOIXnqcE1aIjxKFaTu0JPJ
 0zH4nDdn0GsBdNyCGEppKZJwbNraCl8PHHqUbHz9Uvvi9B3YMGxHGhxoZ3WlV/XDHekL340vrRW
 go0vWFQQddC2371LpQv2PNILrew0JF8aprM76/R60E+NG/NUV+j/QH6kx7TxY6PW+AZ/KjeN6wF
 cWecG42rhI+w5cGyuqpF38HXMi1BMaFcFCIDIuvGaPcdDb+J+N2b2Sjiq9lPIo9AY0a9Gpi2To+
 i0LeaY43ZVy9w6Vs8uwwZtJNU/Dgfbfw/aH2YuLR9dLXJBK0AQAuE22OwnvwXvWKGQ/C7cJpc1I /xYpN/9KQDzzK6Q==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-2-deff5eea568a@google.com>
Subject: [PATCH v3 2/7] rust: alloc: add Vec::pop
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
2.49.0.805.g082f7c87e0-goog

