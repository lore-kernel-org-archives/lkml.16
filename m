Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7F21B9C2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937887; cv=none; b=io7VwKc64JqcTVrEN4oijZtBMoQHe69BQXhBQKNSkTL7YGUuzpNBEzcVn4jMfQ/VJkgGk1obvMlL7GWMOufkTb78KY8JEYsI9ksEy2eB3ASpT0soYgfxsawwZ7XXWY9Qxd40S8asLeKGkI1gFwwM55qofS0zok8FMo+AKM8/Spc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937887; c=relaxed/simple;
	bh=D9q72Tm7LijWnbymPuTzwtfVCSEeFnm/o1uM8aRtROw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J1pe+8T7eiy8gkVY/gKfv4A64594GDXkym6niFPnLaGTatfkffz1sRYunl/qYA6cev3qA6C9ZZN/zYvL3Iw9sB4VIChR3RNsbfClp8O4oS3GZ7/xZEpoNRjw+Xn3lF3dn3/4SBOurpB48R+/BVLIziCmBUnfxS1lykdeuKbaJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uaCm+t5I; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaCm+t5I"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-44059976a1fso24536175e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937884; x=1746542684; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiSfQ27fj5IBPSxh2S/xTxj4UGqPN2v0kl/9jDk2lMc=;
        b=uaCm+t5IafJoKGQhclJDeKXzAHr4lTeb+q1Y7wkY6O9vqJTT/Wu9CI5bCJryIZO4vR
         XufnvM3LiF2zCq9V0kaFJK8xERDAWcNT5kB05DDxADM/sYp5kGA4qzZyt46/No6HEPCl
         pWte1bmqmIP6ghXhhiue0LP2NXQWhwULaYBsmk2MQCB4fxVEYYjrzl/VJJq66h40ZPRN
         udxO2Xnh9Wv3Ju0i4K8FXVndfb6kfKw0c3xilK2tCopFEesBXU+rfker61mnVWo4Bal0
         j1fcLDLmFOhANPx3gZGLZTDwrQ3lOhCZFU0TuFkvHgd/0Nxio0eHT6DEznX980S4CkSo
         YuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937884; x=1746542684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiSfQ27fj5IBPSxh2S/xTxj4UGqPN2v0kl/9jDk2lMc=;
        b=LKgRnmPZMl+vap0seWr4IhcGcdrnuy3APNm36x124XX214RBrEKBBuwB3OQmfuJn8X
         1QD0vloER4IOJ6AMOQTCzHd3fFzrhjeI9+4mbw3PgdiMAArlxLE2ftypApmNFIvivqtg
         pUX0LORgzdRMGCbWEpWM7NtHTwXPaO22yKuA6ZIn05kcY51efL8tjpHZHuXcWwBxaz2a
         HHZlBHYD3FNDHOBdXlHlLDDLxNRxMypWtwbcaMTSHOs3wd7Y1AVbtiZFEZrwaAbSkE1s
         JX+101SwWSZBmMXYDGXrpLWVZKqH3N6JfBaGOwQfMboGVNcU77yGJiIi6Fe1kKnrUYJV
         PbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE8pKNjiqLDmzgfunlsQcHK/R7nrwVUKC9QSIHQuk8unigvCELlWBFKv+qrlIJD7Z1DQKmnzX77dUowcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwk3Os3zZ/sBuEmm3mOvYIhJe5le1kN8RMgtT1IsSB1DDfaB4J
	+c22q9eBYn99FHInCo+VLJKI9o6n8JflO9lf0zO7Vl0c/WcY2gaR9thDKmjCWJHanDjbhdmlu7C
	qhVBqIDwGuEnBug==
X-Google-Smtp-Source: AGHT+IFW8oPuiDi4AxR/k5oC+wq4WdArS/W0TAkFwKimwoaNCA6P3cmgo99NtWs7vVEgqJD8BPJ4WuLbuqbzZqQ=
X-Received: from wmbbi8.prod.google.com ([2002:a05:600c:3d88:b0:43d:1ef1:b314])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-441ac8f6276mr34688715e9.16.1745937884207;
 Tue, 29 Apr 2025 07:44:44 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:23 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=D9q72Tm7LijWnbymPuTzwtfVCSEeFnm/o1uM8aRtROw=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGgQ5dKil7OziBsp/gjNDysCANqEFAme6m5Lm0BBoV6lIHn5f
 YkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJoEOXSAAoJEARYvu5YxjlGhIEP/0vk
 IWevYIbWyuqO5bUIN/IN75Qn4wkxSCMEDwT7rU1NeTo5qe9zYzcglv/ukXIybFC1Hr3rro2cw1/
 wp+PQesE2htTDeACEgjmntpNRG0QNlJE91ilno7Vdm3EmRKw5Vb5fPalq5aS6wcmQTxYtjhohFX
 hAsL4jSSUSWkMKPPI0ykoOnNzeHTZouVoUKVSj1h1ZcBivtC1vpP9kWlnDn1mJuqtrz0bCKbVNg
 8nenqSNGN0y76ulOl9z32MrbtZWSIi+/sRfOzcoFXK3kbeEUP8K1m3LOf7fbz+GyIBceNcbrZZ+
 P1HLDXmVTMqAcCqtvqBVHWEyCaAnI9/bV44lTtFxdkAP1SbvulSbN5ETNJim1z8SsXwrMWgdxdU
 asAM9KrmVmEHH6xwKlTWpxUIs9/di52hOFcaUqSFQ3BDdmdKDeP5mCA8anE5Asm1dJvfDhZ5HAC
 wbtWVzas2g7dDKtIyVJJtBkDE878Lygd7X/aBlbb/wmiVt0aR1+T4VyWznfxMpknZ3QRshM0oR3
 Ph6pP06tCqs1lC87YH6P1VctGmvtB7bcgX8QhJ3QtUNmCOjjrX+ViCyxamJJqOf79f4e5oi0u8Q
 Xhq95KuE+tVJmCagQlcqwQwwTLOENa2o8O5fYVxsn7vTA7caotPLRZLTJvEZo9FgFEfdn9tUGUu YgkTn
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-3-dad4436ff82d@google.com>
Subject: [PATCH v4 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"

This introduces a new method called `push_within_capacity` for appending
to a vector without attempting to allocate if the capacity is full. Rust
Binder will use this in various places to safely push to a vector while
holding a spinlock.

The implementation is moved to a push_within_capacity_unchecked method.
This is preferred over having push() call push_within_capacity()
followed by an unwrap_unchecked() for simpler unsafe.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 43 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..78a602e0f00494a52df0e0aa5eedc68967a3011e 100644
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
+    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
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

-- 
2.49.0.901.g37484f566f-goog

