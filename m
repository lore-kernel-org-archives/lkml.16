Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED620E018
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315567; cv=none; b=cKg2yKV1js1SbPFIFOrlis+vY3Ts0fRmkJIR+pa0P3AQLb1ekKecFe8eYLKdghYsafJAhepWA0KyRAdeuKEUdFpY1MlcNr5+Px71WOgO7lGJ6S0EGczzWkbt6B+o3XFW0JVnKZr24o1Xc7SRldkCkD24WqOmBbA9heC5NUMgEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315567; c=relaxed/simple;
	bh=8ZUC3gqd3uqi13g9pBjPEPnu/V1zgisqYYMN8IZqCUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gLHnIErd9/N9Sg+w+ANf+Vezd+wJUf5XGXdg1MYOV8Szp85t8XqF97qPMltitGuWZRBBCb9DMHAuYE03sWvk90CpMqFqKnpVgTTA1acm9YvugJq/9SInzv2t6ylrvKCVJBSMYm4H11YGumqBpW4fIbnqSZ0NbPvLTwKaGab2Etk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ss5WTxRM; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ss5WTxRM"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so26648405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315564; x=1745920364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SJu7Tdk7cfiE89XShkLgjmmcC+lkao0tEu4y6mvgi0=;
        b=Ss5WTxRM+gm2xXKNszSsEP8PJUbUN4cJrCp78/M0DFeR6z0LL86geOQMUxMUl/Q7fy
         sBSLoY4zpOx2YdqnIoGsjyjQvW9KsGR7jZ3K6hJtEb1kIBgwQDmW/c4/geLgVtd7cSMM
         +0kiaz6ZUYg132HZA8p7S6Qux1/rL2QFKaXZHv5O0zeqMlu2zp7KuljOnS+cQe2+//ap
         YRU3kZ3qZt6XYZ1otIDxfYMBTd5HAXhhDn3lwCpEEUoLF9uPtlVUHR9fCOsBWCS6Jx9y
         9n+OGR6WHXXdJqOD1zDoHTxWbSe0fgPVhoF1CLpnr2uufPpRTSs6owEZ+8QGDzZprLBz
         ooGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315564; x=1745920364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SJu7Tdk7cfiE89XShkLgjmmcC+lkao0tEu4y6mvgi0=;
        b=e/pkycIyTllCwmMgjhoYeX6K8OiA04aq/PCauMfBWhTxG730kK9Z01VMvLTCv8pwG4
         fPWQGxIHdTjw5pgRlQLdQNvcLSTv/pVA2/UH7edf5CSkaQy54HsV6WBN3GW04ZCS4x2p
         9jNVUrZpWZnePdF9/TE5MvImCdWfyUmAp+fdVCabbrnHq6Y7oc1Ahzhs+03Irxmfrylp
         a+qn1NwYcq8YjI5aZFpf2WIjt0RuX5fMcQXFFLz8F69XcsnrKx6lEaMu5LYnPXLRAqhD
         T/PFYPi02Tt1HQnX5QV3kBksm2QWx/YakLPJksFs5Lal1mzEsr9b/5rTe17EXQ2YVLQA
         lnKg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Cv7JPBtb3j2p73VVCs+tUDIthjxeStLxJ1vIfAq1+NgMcckVcG2cIgDtVTdPw3b8esnLkHDwCOl69sA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5U7Dk0S6IE5c4CJAOLQ7r8tkbRL5em7byJ3BZlXze+xyaThl8
	Us4HIPUoiE7IwBuCJth/SIgFLCEQlDy3PJbBHuQlWvBKjLHYQzOtYtXWkKwiapzR1Uix186zmDo
	rB25PFvGV4mDJLQ==
X-Google-Smtp-Source: AGHT+IG8W+nUL5hyzHTDe2B9WWJOa3ITmAj7UJ1292j7J5WdiwVt7gfqUfJOJaiuqBKywNJpbK45nwF+fc4Z7dc=
X-Received: from wmhu12.prod.google.com ([2002:a05:600c:a36c:b0:43d:847a:8ccc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:cc4:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-4406ac0fcd2mr143221025e9.30.1745315563935;
 Tue, 22 Apr 2025 02:52:43 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:19 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8ZUC3gqd3uqi13g9pBjPEPnu/V1zgisqYYMN8IZqCUQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgJuzKXnvdoDlLRCw8v5UFwwu/GItjknRS1
 BIqHMeciLyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 RobQEACIr6+P52rGsnxOYwogdzlcq5zYTAbzx/Vl9ibzzTkdm1PpVUJ/KJI0Icp596xBk+4Z4Z9
 5/pyvQeBaT1MJcLLbjXLHN2mcOTXdZc8ZyHLLzZv8lzw1ftdnC9xUJbiGMdOnwzVF0v4b736ZW7
 q0PnQ3WEVZKQTgdpfB3zMzgImObxRnyg0Y5zk5iuhB/MqupWb+1WDYo7ZTPPwCpzFQxWuLTbbIk
 RCyodJ4h7/wwuUMozriIAH8aHWPUsE59MfpYX3Di6EV8qs7fW4XbzW7OpitKOUc/vXa6QaPACGL
 U9m7TRxhUaM6gKdu+1SkFmhbG/aNQ+gZxiqGxa+6VbzVGKZxBkHWH42OhuONky6O1sNTH541DKo
 Qnu/KghMvHIa2cqjVUvWZ3P5lIRb7uUR7ENBH8vf0GvzgOvyhIA/iD3EfAzpT7IC3UPsmPfEOwO
 lkS6pREpXGWaPGIWmRMYDIxL2WFXS6I+aZdMKtJ/sQBhSh/BJgemhZH1QUutkpEVOqGqewrFzeI
 vmlHI44iDD1Eny5e/tQZSMYEeg67i9NC84DevdRCkl8hqg8hoKg3tveMcIlQXNIo3MpQYJ5MpMo
 B1vOAgmmXaCePm3pC2TG68G38x0vVt4Nb/eYyT8YaP20zBjHdUZKsh8f3zOrtk89SjBgt72Fwq/ vbPeCklS0ZBos+A==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-4-deff5eea568a@google.com>
Subject: [PATCH v3 4/7] rust: alloc: add Vec::drain_all
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
index a005a295262cb1e8b7c118125ffa07ae252e257c..4a29ca6e7dedc3e93a58830938f3a51619c270ed 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -583,6 +583,30 @@ pub fn truncate(&mut self, len: usize) {
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
+    /// ```
+    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
+        let len = self.len();
+        // SAFETY: The length is not greater than the length.
+        let elems = unsafe { self.dec_len(len) };
+        // INVARIANT: The first `len` elements of the spare capacity are valid values, and as we
+        // just set the length to zero, we may transfer ownership to the `DrainAll` object.
+        DrainAll {
+            elements: elems.iter_mut(),
+        }
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
@@ -1070,3 +1094,38 @@ fn into_iter(self) -> Self::IntoIter {
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
2.49.0.805.g082f7c87e0-goog

