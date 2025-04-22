Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6720C03F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315565; cv=none; b=VhUijBQ8OO/OSDoGHCoSoV6BTrT2lWtnoXxTlL0nmnkCvr8MEyDPwIHGApb6cv5I0a8L5q0a7NIQQrN1tpspH73+Xg0fkxI150xKOjc4a5kDAO8aKczLrx2mSD2msGDlVzJkJjvWps/i9FsfMRgnWyyjlIfbn9ExuaHgrt310oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315565; c=relaxed/simple;
	bh=Svvb6G9RffI3Cl0nzUci32sxhHJsb8RTcvqHt6zeN7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bwDFMEm6karHrhHTIX2EqsnXKKqwchK8yjrvWDKKzglPe0qs10VIiXLp4AlgZz1ABmhYthONMTdt7MYJG8hhJUrDz+shHy+SAFbp/vxb/YPJGsObqC8r3nds8UYSljxwBp2sm8xB9iwzLSYg1b9DDRimXLFD9rB+vPxyqqm7npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U+RIQXYL; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U+RIQXYL"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39135d31ca4so2055371f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315561; x=1745920361; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8CL1yXQxtA+pJZQvwCMlCRVvSsYDtyq7QmVaWssZTI=;
        b=U+RIQXYLXnzlWEr+eBUzz9jNZnhISDqrMtfYRrb4ohFf7ER9AqLcH8JUUQLMk5nKw8
         ZMD6Gp3W8tFexagHsy7fku5dWZhLqm1CwXRQrB5bQtRx8MP5iwi/7da2WTqg4nIvB/uP
         mXO4zfZuMMbCXtLUbByQVUJZ8MbE3HmEEfH/8MOijVrQe0S70MSqrAuPRgPMvRnR3fGE
         wsxhQE+z5MQH39G47uipXHhcn5NM86S6QxmYPQ18zI+ybMTeY8ocrSmmJ+62DP4w35AD
         y97lN/frjEXHBMi7hGDY75irB+rmttn2xPlIi2eJ/A/0A0Y8QzyjT4vvAn0Vthf8w4pb
         OUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315561; x=1745920361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8CL1yXQxtA+pJZQvwCMlCRVvSsYDtyq7QmVaWssZTI=;
        b=RabtPnC07rH9G1hj8AnCqMWMRnIW2kQML4XslaQOR0JqpAGbfjnf1Xtp7OC7I9ucIN
         ZCDWVCQ62/JnTtXVjBhMrlG3hXqIhxQY0anwjBX7XavEFhTRdxWSGI/jgJSc3HaomYM1
         hitEdoPAZjmsOorkqN+q3/UBY3Fcy0RHucS0P56M6vC3g7o4ER530CLSuJxKLb+wDpxE
         GMXgY3SQ8oTHurFEn5hMTtYTmeJjD8KqL2soy1/OEHqDJgVOlHQPPm8/DiDckqTzYeLL
         FBxdoYbwxci2CJrUUK0O1iDrhqByImzuasUSZ/D/j8TZxwQTZ8LiA3Xb+S+YB6ghuLOa
         X5tw==
X-Forwarded-Encrypted: i=1; AJvYcCX154Te3fpxhVF1fuaAXUVBE/MhizOFYFcOul0SNX+J33X5SnvmlVPMWHgAX1/A+o7Ahs24IpZO4XUcX3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32PjkTdNOSZUO8dBEgMJln6To8iVCH4Xx+v++hVozHNQrqljP
	PXcdfo4sHHS32F47S5s4qvepGNo0Xyuq/uyCjQZDS2RXlg5hiOfaj3y09K8LglqhXgFO9uhI85m
	VCCuvxHVW/HAasg==
X-Google-Smtp-Source: AGHT+IFRbE7AmbHyodmXbb8GFc9/L/JqiwoJ4fe/wsfpmnT9qV+y8d/ZjbqvIcLCZBxx8Vq/Fe32tK7Itj4ll04=
X-Received: from wrsg12.prod.google.com ([2002:a5d:46cc:0:b0:39a:cd99:1be0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400f:b0:39c:1f02:44d8 with SMTP id ffacd0b85a97d-39efbd5a27fmr11349108f8f.4.1745315561655;
 Tue, 22 Apr 2025 02:52:41 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:18 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Svvb6G9RffI3Cl0nzUci32sxhHJsb8RTcvqHt6zeN7A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bfqUvKvbba5UFmw6yfUXkD5n17ruk/4uKwb
 +O/ziGnYveJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm3wAKCRAEWL7uWMY5
 RmoFEAC2L84f89HGHLg0Lz1dyzkaJPXPEYHxX4wOHFdpmeni3UVoieE6QvDncQdVdY7fxZHvshT
 GgO0XLLXzcKrx8LlVXXH/t05lPz7zDgWKrr+Ly06G1lakTDdzCfYnKMc6Lpl9Z5RCNVRG6lq0My
 PeAJUz71y0Gkg5J0WONTZegW0vxyNudyP6qpkQDs8TXu/JQdp4Z8QMJv/H5oJ8k5fYWfeJgN5Bw
 r5y79cJ/JIPC4yndeQqEFhu75Hb01ey+mzuPclEQc98Kl54UojIxXAyUXlxJMbbFsEzv22I1yAP
 Cnli7Cu0AQDZCkcBDD6d4LVlOEfB/c+ETKEGlDYlA216+Bt2/T2zwSkE6qpvb7RWMqrXVJqnXc2
 PILw+JkrNssRUeyjIDM5FKQdId+fzc1GXsODJvbUf2J8BRBrdimGbSdscHa2pB0qhOHbGbFSPCS
 GY5IF4HoEm2S8Z3OMf3X0ilLUUp5hve78b5oHLcFyjjdM0LWuzFUWisoKz4ZsFFkqlo9K5r5vkI
 A1RQ/ibIRTaWY86WuHeBhkyvEjlfULiKxcX7YywJWhc0OBa1MnedqpXdHt+cn+zJMXU9avSg6AW
 NUGvCMsEXGOlOfVt3X1c+qofNgg1mt8A20Rnzq3aAEn9Ip9kpWuJv9jXfaq9GNsxU9/LbtL4Uy/ hjCO1xwKZeiHgrA==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-3-deff5eea568a@google.com>
Subject: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This introduces a new method called `push_within_capacity` for appending
to a vector without attempting to allocate if the capacity is full. Rust
Binder will use this in various places to safely push to a vector while
holding a spinlock.

The implementation is moved to a push_within_capacity_unchecked method.
This is preferred over having push() call push_within_capacity()
followed by an unwrap_unchecked() for simpler unsafe.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..a005a295262cb1e8b7c118125ffa07ae252e257c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -307,17 +307,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
     /// ```
     pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         self.reserve(1, flags)?;
+        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
+        // than the length.
+        unsafe { self.push_within_capacity_unchecked(v) };
+        Ok(())
+    }
+
+    /// Appends an element to the back of the [`Vec`] instance without reallocating.
+    ///
+    /// Fails if the vector does not have capacity for the new element.
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
+    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
+        if self.len() < self.capacity() {
+            // SAFETY: The length is less than the capacity.
+            unsafe { self.push_within_capacity_unchecked(v) };
+            Ok(())
+        } else {
+            Err(v)
+        }
+    }
 
+    /// Appends an element to the back of the [`Vec`] instance without reallocating.
+    ///
+    /// # Safety
+    ///
+    /// The length must be less than the capacity.
+    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
         let spare = self.spare_capacity_mut();
 
         // SAFETY: The call to `reserve` was successful so the spare capacity is at least 1.
         unsafe { spare.get_unchecked_mut(0) }.write(v);
 
         // SAFETY: We just initialised the first spare entry, so it is safe to increase the length
-        // by 1. We also know that the new length is <= capacity because of the previous call to
-        // `reserve` above.
+        // by 1. We also know that the new length is <= capacity because the caller guarantees that
+        // the length is less than the capacity at the beginning of this function.
         unsafe { self.inc_len(1) };
-        Ok(())
     }
 
     /// Removes the last element from a vector and returns it, or `None` if it is empty.

-- 
2.49.0.805.g082f7c87e0-goog

