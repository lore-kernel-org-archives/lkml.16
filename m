Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED4255E4D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191989; cv=none; b=kRExF6FU/4GyL/oFRl8SE+vKkPp4U9f64Ne1katvvKIj1ioLhkLJEc7q1JN7ctXVHx8Q3Vck4JTwq3BMjaXqPoFhvDqbq52pHt//GOf+omya+R9UQoOXviRLqI0V/T9sUdwAyCsuR392m6jBV61Y1o84bBiYvAGhlliaHJij/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191989; c=relaxed/simple;
	bh=+Q2XjTWHwCfoLlwubHIATQqjUcgilGTTvVMpLQ5kNoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t4OrT0FAwcdJ4Rn53Jhp51B7HnDFqglAcvbq/pXmm4WbqN6qibx2cqdjZm1/ErL05dH0mdeU9XIkKBXHlVvbKx1XOh+jlFjujqs6ClnexYEg9JrDTiN/sHatfRwlwi1/443CE/iDO7WaRZUB87eshVM33RGr4pMNhzjaotSGmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0snNOZMU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0snNOZMU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so8794435e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191985; x=1746796785; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bbk+dXSasxE2+5UsRYscIfb+Bcs8iWgnzx9jGxiqBZA=;
        b=0snNOZMUSR+S340iGjfcIa47PYELp/TinZZ+H8lQZGB9ubGyS4LgbvW6BhIf2MafcD
         3mFIGskqtdPs9hT7tAQRepflsRBdKXSQEg6GGQJiyIJg/UVexAL+g6dtWE9OK3UHPukB
         d1eo+O3goySIr6jLxxi6f9t8fgeQEcZRZ9PU7dsCoyNbPV52bUtX+BA4qVi7RvdwwO2i
         XU3WhzYl5JbhF+VD38z6mYTOsNC5sCVhpnNHaKVXkEPNd6alhMcU+lxThaO+TXXAlb+o
         xIKWh40JQBYSvzNDfPojCxm8Xwarw3YaD48l8NVZWpSDaRBZoWE35BgtLzkrEc+HGaQK
         07SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191985; x=1746796785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbk+dXSasxE2+5UsRYscIfb+Bcs8iWgnzx9jGxiqBZA=;
        b=k1wX/ippw9Mud8e6ZLGIUAjsnbA786MLqHCWJDoSPm4FPlU95XpONz0kDCfqt/pYP7
         q3r0OKcRhXh53SbuWvfD1mhHhK5qbIhCzWKffdq5VzMuZUcdDXWRC9809av8MGpn0EKK
         b9iclBsmG4r4B+mcMLbyWmgyVJoTcqjkV124jUCsZzu+nDls3J6H+acCE2CLt9dCE7VG
         fM3guRrOSNyG48m4yJtGdOrDecSthq2YujPHTdg3MmnwejONpYiN2ylR06bff3W/4khB
         MhHQ5m6bKlcf0vzlTIPMSYT9fK8NIOTaN97DvjR6B/pQo58iXAPuCt9RDSmwSW2IXB3M
         sN3g==
X-Forwarded-Encrypted: i=1; AJvYcCWo/XOfyC8EYMTjNasQeb7is4kgMuIlSsorplTm0bd+0xR+Jo1OqU1M0sztNMVFoCjzA4NeyKJG5hwpcE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTngQCnxFG9M9uwwTJ3e8u/eJgGO8/CdC8JPXkzMeJrrct7KN
	+lfvsjhkm30jIqw1oYCN43bZpgggVOcf97nrjDLrhbNf02UjEqEM5o3GcYStgaKY609EpyDfg24
	q3cD5BiBReqyeUQ==
X-Google-Smtp-Source: AGHT+IGveiyur1EXCtMYwtOpwsJwYHZqUEzCRlV7GV9o+pqLu88Ln8BrBrrQCO9Y/ysGBU+D2T1w9oj2V9Uwtno=
X-Received: from wmbay12.prod.google.com ([2002:a05:600c:1e0c:b0:43d:1dd4:37f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e02:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-441bbf33b3emr22730035e9.22.1746191985797;
 Fri, 02 May 2025 06:19:45 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:31 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4725; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+Q2XjTWHwCfoLlwubHIATQqjUcgilGTTvVMpLQ5kNoY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZo2H1t/IpH48gsDLFYMZhiI/D1C1tt/QonY
 u2pzqdwyHqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaAAKCRAEWL7uWMY5
 Rj9tD/4l4umhgik/NJELACTCS6I5YHeFBKaxER2M5dFQqYIfY3wguZcYKGAXIkBFOeIILFgs+T0
 PKNE/wQypSEbOfUqVpnOP3GtEMFULcAjsLmYxrUv8jyxgnZauixE0N9wjm6wLr691oxrEHeVpBt
 RQeZdG02AuUm9ZNph680Q7QcFOeOhXCtmq6KBWOqx17tscHRJzA4pftJwklGFBZs3DYG3dUH1GB
 FwRtyUe4Q5S6jaIBRaw8i2HB/y4nj8jSKBDG3KmPJCu+/EkpRzuLagiBvwJBzIZDLxMocZuK7tk
 xSp55CAPgmUOJeRb+Ub5obfMHmOGHU1ZTOOGmWgykBF2BlTv/Es5ODx4ePSxwf5i2wos8H0oyoj
 5YPn6TPRSntpM+mGjRxER3/icfMkOyvFhto3MppGCfct7bzbmjCnFrzFS73AQ1eI0JrxLpa27UM
 6jFRS3abdAeNAAq8TFk7IuA5WHDuF7xm5/ep5F71gk+gIV+MSfsowttRDkI0PsnwYetkepgmntN
 Yz8MPGCxk27Zrmj1H16V0Ujo4n0yO9ZwwD7Zw+6pzYPkvw2ZRt3JYwP4c616ucHm9MgT/bDie9o
 uuCo9bLOhNIecGuwjXxeNJVF3r5zWcBzISdHw8PcO4G/hcthtmoIMASHRGOgcO7dbWiN6atjk6q cTPHnWnQ/+w3Wnw==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-3-06d20ad9366f@google.com>
Subject: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
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

Panics in the kernel are best avoided when possible, so an error is
returned if the vector does not have sufficient capacity. An error type
is used rather than just returning Result<(),T> to make it more
convenient for callers (i.e. they can use ? or unwrap).

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs        | 46 ++++++++++++++++++++++++++++++++++++----
 rust/kernel/alloc/kvec/errors.rs | 23 ++++++++++++++++++++
 2 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..e9bf4c97a5a78fc9b54751b57f15a33c716c607b 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -21,6 +21,9 @@
     slice::SliceIndex,
 };
 
+mod errors;
+pub use self::errors::PushError;
+
 /// Create a [`KVec`] containing the arguments.
 ///
 /// New memory is allocated with `GFP_KERNEL`.
@@ -307,17 +310,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
     /// ```
     pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         self.reserve(1, flags)?;
+        // SAFETY: The call to `reserve` was successful, so the capacity is at least one greater
+        // than the length.
+        unsafe { self.push_within_capacity_unchecked(v) };
+        Ok(())
+    }
 
+    /// Appends an element to the back of the [`Vec`] instance without reallocating.
+    ///
+    /// Fails if the vector does not have capacity for the new element.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
+    /// for i in 0..10 {
+    ///     v.push_within_capacity(i)?;
+    /// }
+    ///
+    /// assert!(v.push_within_capacity(10).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn push_within_capacity(&mut self, v: T) -> Result<(), PushError<T>> {
+        if self.len() < self.capacity() {
+            // SAFETY: The length is less than the capacity.
+            unsafe { self.push_within_capacity_unchecked(v) };
+            Ok(())
+        } else {
+            Err(PushError(v))
+        }
+    }
+
+    /// Appends an element to the back of the [`Vec`] instance without reallocating.
+    ///
+    /// # Safety
+    ///
+    /// The length must be less than the capacity.
+    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
         let spare = self.spare_capacity_mut();
 
-        // SAFETY: The call to `reserve` was successful so the spare capacity is at least 1.
+        // SAFETY: By the safety requirements, `spare` is non-empty.
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
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
new file mode 100644
index 0000000000000000000000000000000000000000..84c96ec5007ddc676283cbce07f4d670c3873c1e
--- /dev/null
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Errors for the [`Vec`] type.
+
+use core::fmt::{self, Debug, Formatter};
+use kernel::prelude::*;
+
+/// Error type for [`Vec::push_within_capacity`].
+pub struct PushError<T>(pub T);
+
+impl<T> Debug for PushError<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+        write!(f, "Not enough capacity")
+    }
+}
+
+impl<T> From<PushError<T>> for Error {
+    fn from(_: PushError<T>) -> Error {
+        // Returning ENOMEM isn't appropriate because the system is not out of memory. The vector
+        // is just full and we are refusing to resize it.
+        EINVAL
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

