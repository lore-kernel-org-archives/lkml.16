Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761152206AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937895; cv=none; b=Ugj5RaFgJlsV9RyQe0KstUv0yKik3YP1FhFmk/iQRhXsCVyvp33eZwWS6M5f4/6vfCJhJbHtAQbHWcXqDJMM/d+NEJXuAZqY9Q+j69CqMVDw6bbQnx///PvWh3HkPntSQLVTfWa0f7OPf01n7o/AqeuO7QCOBc3sp7RL12vFwOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937895; c=relaxed/simple;
	bh=qKzOcKApDQ3/WTq2wvyZxabH+Dt7na3cpwPeiFsPJhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tROYq0QxW8WNrtTZw/EWviDhKRb/gOAYQhmqTMFJoe1dmBfN2orFkYn+xqpbiLR89LpYVnaVr4NijXBLbUPwyPVYw1cnu1drZneloEhAHzsydV7pmEHQCXBImRW62tLUAzsvqZ7Op/cw/NqwKhxKhvb11Vorjt/nP5a2x7B+EeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=neaVFTSk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="neaVFTSk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso34214735e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937892; x=1746542692; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3qwMBYZmHUsyj2Nk+6ObSDHgL4pbNZApkxHSNRkjQw=;
        b=neaVFTSkToD2VBt7XSDt1ZsfHfJXjMcAk8wOmfi5LIBmjSu9WLFoKpSFHXdTk43oUq
         Z2hWuGhy0pbfYjymL5jzCQ7SrUd9hwro4Qb8NSQEmjbIgnepFAH1p3XFdRxnsvylpY3Z
         HvVTY7HZv4YdptV53zmP5XBIdFnTD6ZWkruO7BAyCWFnRUtW3ATObrPJB474KnNJtxDu
         hQqEMiHKEUWaaB8VgrORT/sgQ8PEfm50Yt+41/u/SUnZBy+IqsxuSYFxPPvFmin46BO+
         ymBNZ0cK5rU9KlQJep85jGA2eYQV1O9mPyDBFXZq83hLV7schAxLduXD4gbKyT5EPUW9
         4h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937892; x=1746542692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3qwMBYZmHUsyj2Nk+6ObSDHgL4pbNZApkxHSNRkjQw=;
        b=KrLN7vGImj0Hfa8b3rG8U9XZPzoRmVaLAI2npuqBfflBMYCEyegF2E+F8woYeyCZon
         n8fKOh6Ei2t7hFoOZMHZTl8U6Bp/RIxaBTIdAdJxA9wJnpKLXytPJsrygIeOhMeBT3x+
         vOGEKu0vNkXYfCpAS9xd13VxFTFgsEHELJRPBabGTHnkaDTntypSv336xZ6yrMBx/w5o
         EYm5/D2BoxrC9KBkylNApH55TScwKJQRqdr85drnBCaxgNdebhHDtaHzRzhdLi/ZeoOK
         eSP9Mwj7ngXFqzxM70jw7DowrOX+qYpdt2RPd5THHagpyGcIaNDTCMJUyAi65J9TFaai
         6MFw==
X-Forwarded-Encrypted: i=1; AJvYcCWfTRNiVmXHcslljS2PLDnwtIaEkp1xUjBgVRaS9M+W1cxDKVRWJfIIbOaYtMMF6tV7W3zVDRYXSgrlon0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4SjQaV5XiuV901nvcBTbqzyWA6StuYVaA8ULorxiDP2LGWAP
	BPt038cZfYT4ROXLSaY472drbrRqv86J686eamYSsQvDl2RJVkc+f2J9gilX9YO2in+f24Xrnkl
	rDk1evL2RrRcBow==
X-Google-Smtp-Source: AGHT+IF2aNX1fNGdZZZeLNAlTaCENgmErVSBtsB1SZiKmphy6/obRIVI+1aIV/UvMVpUUrZubjzW42YxgrxWvxk=
X-Received: from wmbgw25.prod.google.com ([2002:a05:600c:8519:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4c:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-441ad3b5c21mr32584045e9.12.1745937892219;
 Tue, 29 Apr 2025 07:44:52 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:26 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qKzOcKApDQ3/WTq2wvyZxabH+Dt7na3cpwPeiFsPJhs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXT+A2THDjTmpUO+v5rehdFPXSy/pGAttWkA
 7Z9Y/QtX9OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0wAKCRAEWL7uWMY5
 RkHZEACzgHz49qQfBnO86qlMJR99vNVtvNkoh3Z7Gy8ZjJz5cqT3Qw+EnA9Himsww0udm8zRhue
 iTca1mnlEJ9b3/7QU8tE1sjCE79cAHC/IN04fMnsiTiyqJfYm/L73509w2eEFjGs2hVPCgfKK/p
 vgsLfC2Shi5FDo4SdhKZv60ol4M4fKCtGT5iKGVxJyh7rJYb+078zj2uP60xSHP7mKSyXvDvi50
 56ulAeQkrgBqGPyWAWBCQX36HFMSH2hkZSEGUoIjIeJbgRk1lewKXvCM30p7DMP8Pe6CFQYkO9o
 BqqrdSnUaW0CNKPty69x0CDi/4So34INVRkZLLqxgSq5sCBgaPcj4YMdq2Kmc1fwdQth4I1xHkX
 H2BEUQQBmichuDL4r/x6I9Z4EnQXocovZXI7HXZyeHhyVsvqqdNXpOY9v0iUN0WsNDRtgXq90qV
 C9MLMqb5qlT/AXN6siornmJ6ZcI1AgjugKQu5pRu8XccbzcpWYIzPXO2M0cpaS92MazG/y+o4pX
 W/ELrhJu1TVAtqTN4pbnLTMWC90JkWlqGTTQN96EDITJD6OBl0/voBptXtOjboZ2r5zLexluWhC
 yGeZ3NkTfhwCuL3ZoahEAIjWknzo34xqTRmn/CDOKk40bfEy15tFJybODFDDbcc/zz/VcQIDW0a nFnGNUO0TUZPk9w==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-6-dad4436ff82d@google.com>
Subject: [PATCH v4 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed by Rust Binder in the range allocator, and by upcoming
GPU drivers during firmware initialization.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 357f5a37c7b1d15b709a10c162292841eed0e376..0682108951675cbee05faa130e5a9ce72fc343ba 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -386,6 +386,42 @@ pub fn pop(&mut self) -> Option<T> {
         Some(unsafe { removed.read() })
     }
 
+    /// Removes the element at the given index.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the index is out of bounds.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// assert_eq!(v.remove(1), 2);
+    /// assert_eq!(v, [1, 3]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn remove(&mut self, i: usize) -> T {
+        // INVARIANT: This breaks the invariants by invalidating the value at index `i`, but we
+        // restore the invariants below.
+        // SAFETY: Since `&self[i]` did not result in a panic, the value at index `i` is valid.
+        let value = unsafe { ptr::read(&self[i]) };
+
+        // SAFETY: We checked that `i` is in-bounds.
+        let p = unsafe { self.as_mut_ptr().add(i) };
+
+        // INVARIANT: After this call, the invalid value is at the last slot, so the Vec invariants
+        // are restored after the below call to `dec_len(1)`.
+        // SAFETY: `p.add(1).add(self.len - i - 1)` is `i+1+len-i-1 == len` elements after the
+        // beginning of the vector, so this is in-bounds of the vector's allocation.
+        unsafe { ptr::copy(p.add(1), p, self.len - i - 1) };
+
+        // SAFETY: Since the access at the beginning of this call did not panic, the length is at
+        // least one.
+        unsafe { self.dec_len(1) };
+
+        value
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples

-- 
2.49.0.901.g37484f566f-goog

