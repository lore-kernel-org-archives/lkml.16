Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CB256C6A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191997; cv=none; b=moFmeCIuI2Oa5fFbslNL/9R39oJYJomqBsjqZGryQpWonxtqzjZil6dCPacEmwVoX2dKpOYDb4txmOTTyAufOGrEBGgncSlBnV7z2NhphGAPcN6HFjHa3mTwCHHoVjv5EhartbA+pMNr/21pfgxi1iJhF/S0ad5PW56Oq34oGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191997; c=relaxed/simple;
	bh=+9IyxSQyP27/emN3Z7piM0ajFLsCl/Pug5kGGN8P3Pw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HxuMD0XdXwOCVeE6D3KC//bPAKHM0hp9EX9crKkv6vICV7ExxRVjLiV6j7e41nMfBh/F5SEEMCXbma64iTS8OOPdXAPUc1mJFaFxp+XAouq4ts8wQSAGZEa7tU6O58gJt1XMkmd31A2yOp6Z+yz9DNFHpnXXiLISutFqhA5rBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCrXZ+Yv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCrXZ+Yv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43f405810b4so9703165e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191994; x=1746796794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgf/dSBfhJF3XyhZfIU4YTUHWPpbhjb3fOqzjou+aqs=;
        b=BCrXZ+Yv/b38M+1aSMn2fYdQpA8YdVW96o2qRB9/w7g7ynzNxdlCQkHNl3hEExLQKN
         G6Gc+7qZOKfWQxUUScQP+1NG2swBa/zAgC74I8kk85t5WNpi5zKcU9GCjjYAgZcFqQTg
         bSl0Rklu0Lc0ZD5/O1yz9G3y7MsnFZCsHuIXkC0vzCbE/s45gZHdpznBWc0t1BP8iydu
         f5k2YYgf1YrQ9K230nfB4wp3iRBVl3Tk0JIpWZBy2tL3AszscCidaDSyR9OEubxr+J3C
         tmeT/XmW1RMea+Ev1bcA14lDfB8IJlx+LgjS1V8KLllZQRQJN8lHfDf2MxFCe+BgkM6r
         GEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191994; x=1746796794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgf/dSBfhJF3XyhZfIU4YTUHWPpbhjb3fOqzjou+aqs=;
        b=DeKh2XHCHPsrtRp/9fp966PkjTB6/Wp1xUcTEw9vOKUIsB0ygwC11jsRI+dRRmfv34
         pq31BvcmS6C7dP6Dz0qpIzPg49CDmucxYD0LisvFmx1K6F68SZ1/JvhWLz9gjUsKnMRu
         qZ7AyRyCnoQxceNt4DuxvtMJgcscm9nS3Phu0ztli7s+i8D9fBlVMoT5s3EHBMpheQST
         h8xGlpGKSrghrdPhtLe7yu+pUoEk+EuTrWLOmLBgw2zJiSmRfjQLmdLjmVstfOhENDJm
         IQcbwq4Vq31/W2jlHzHzWEai2S6Mi444esnhjdTxBgQf2wx2Jy5AfbJTXQSQ0KP/XVdm
         oCuw==
X-Forwarded-Encrypted: i=1; AJvYcCU+B1dGm3LyocIcafyC/G1XM8qwpzCmuO5Pj8+0qYpeHxM4uIaS7ngo/GHfFBDf4Ru+0nxoqqTFpgr7lTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLLHs8EIbtXBEjW5VrUIbI44f9y3BZhw6ocZl/xHL1LSysG8k
	y+0S2hODvQg29kCzGfvbjd5Vhbm1Mga3JlxcXECKmyWcJXgizn2rVHrMycHRiO2JWFaqhPStcFD
	GLTgiO0Q1x8KBvw==
X-Google-Smtp-Source: AGHT+IGBP8X1327QOyf/N5JTak2KzCyZ3u2dbMq6hMfrVCBAcpWg7Vd3dSHLBCRIYSqFJaa16L7xos29pfG9a3c=
X-Received: from wmbjt7.prod.google.com ([2002:a05:600c:5687:b0:441:bc26:4d3f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d0c:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441bbeb36c5mr23309105e9.8.1746191994633;
 Fri, 02 May 2025 06:19:54 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:35 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4274; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+9IyxSQyP27/emN3Z7piM0ajFLsCl/Pug5kGGN8P3Pw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZpYNjX33Q2M4DoOnNQNvAPltogL1FOhVVJs
 ZUXgBheHm2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaQAKCRAEWL7uWMY5
 RkYsD/wM2urXyc5ZVl+H41WRyHPKUpnzguGEX5AirWP+jwy0PpgupptS8mxUE33Psw7aQvdLn9y
 uXDpQSKFw0sUsb2acfJC7b6hMaQN6NCa5dRqxFfFrBA4Waz+Di8vMK2mCETBmgMDvzx7WmK0rea
 6vUnKMjZuNaKv1RXEkAuc5DS5Sj+ISVQb+fI+MOUWNs+i1dBLIshBUP2LsWBreV0bCbi/EamEnX
 7gPodBJuu82aedqM4sj915ccsErzAsJAULzKmhqUzEN3eU53x9SBQ09Z2tt8nm3uxs8xq9bywdC
 T5Xw+2WBW36GUAmmrdqcgN7SNYtAo9fwkyOdvgiQt28QcNQyajJxj9XtrnDYHRG0PNnJiTAuNDd
 yU65QxVQO6BwpsoSTQgGjlNqoF9TgFeqKXLAhvplrJVwHgLEmcdc13Y0YbJ63xzltl4dBTn3J4z
 dIu3o9GQcs2C/N+XTGY1iVACNP/FK27skASha/0p+IjbBkHX1pJigRpNdHfmIjKRPCQiXf7aFlU
 tFt2l1ScjP67S1Hda8XlfAQQ1YxzCSABNX/dVdrYJNxhrjGTszdiShOur+j9+AsKVta1XC9X83c
 UltWl0DN3Y2sGDnPiu6RSoOp8u1Mr6aBLw14Nml4aBGo5us598kVWm5NE1WFpLqJCpzwIG/P88R HcxmH9psjmjekMQ==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-7-06d20ad9366f@google.com>
Subject: [PATCH v5 7/7] rust: alloc: add Vec::insert_within_capacity
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
 rust/kernel/alloc/kvec.rs        | 51 +++++++++++++++++++++++++++++++++++++++-
 rust/kernel/alloc/kvec/errors.rs | 23 ++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 8845e7694334b672476ff935580f3a9eb94d23fe..d2f3669c5417422dddaebcc7348543d3576b9ba8 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -22,7 +22,7 @@
 };
 
 mod errors;
-pub use self::errors::{PushError, RemoveError};
+pub use self::errors::{InsertError, PushError, RemoveError};
 
 /// Create a [`KVec`] containing the arguments.
 ///
@@ -358,6 +358,55 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
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
+    /// use kernel::alloc::kvec::InsertError;
+    ///
+    /// let mut v = KVec::with_capacity(5, GFP_KERNEL)?;
+    /// for i in 0..5 {
+    ///     v.insert_within_capacity(0, i)?;
+    /// }
+    ///
+    /// assert!(matches!(v.insert_within_capacity(0, 5), Err(InsertError::OutOfCapacity(_))));
+    /// assert!(matches!(v.insert_within_capacity(1000, 5), Err(InsertError::IndexOutOfBounds(_))));
+    /// assert_eq!(v, [4, 3, 2, 1, 0]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn insert_within_capacity(
+        &mut self,
+        index: usize,
+        element: T,
+    ) -> Result<(), InsertError<T>> {
+        let len = self.len();
+        if index > len {
+            return Err(InsertError::IndexOutOfBounds(element));
+        }
+
+        if len >= self.capacity() {
+            return Err(InsertError::OutOfCapacity(element));
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
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 06fe696e8bc6612a5e6aa2f6c28b685033acfa2f..348b8d27e102ca34a0d6194ae9d00b12c11547b4 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -36,3 +36,26 @@ fn from(_: RemoveError) -> Error {
         EINVAL
     }
 }
+
+/// Error type for [`Vec::insert_within_capacity`].
+pub enum InsertError<T> {
+    /// The value could not be inserted because the index is out of bounds.
+    IndexOutOfBounds(T),
+    /// The value could not be inserted because the vector is out of capacity.
+    OutOfCapacity(T),
+}
+
+impl<T> Debug for InsertError<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+        match self {
+            InsertError::IndexOutOfBounds(_) => write!(f, "Index out of bounds"),
+            InsertError::OutOfCapacity(_) => write!(f, "Not enough capacity"),
+        }
+    }
+}
+
+impl<T> From<InsertError<T>> for Error {
+    fn from(_: InsertError<T>) -> Error {
+        EINVAL
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

