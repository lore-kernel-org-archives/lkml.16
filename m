Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E01221D94;
	Wed, 16 Apr 2025 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823758; cv=none; b=CiGfzaNpvWRrRAP2plkiiaBnduVykeAhQp+eRRonaINqx2aA3FvRP7dK6QsHK9yHr1dl1uVgFha3VX0FAfk7g1IXtVL8r10rnv6XjLPW+7MACNCvdoRgNmPkCiV3VU2woDscbfcsG6bOkeAwl8xes4no4cY73rPMn+FKX7oqGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823758; c=relaxed/simple;
	bh=HONVM/3gBdh6iNvjtIbFIPb2A1MgnYPmlfkaZFNDgT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gszoBkV05zcrCDkVTFWjS942qtmdhY/bVl5jcZ7StYElbYCZWt7U+QAHILS8teHYwJEUNF7Lfa2UxNLelTRMzh9zUfVyGDjM15VcZ/f+jNIMQRSMbjc8F0y/s8Wo/KQdisucUzvcwE9WYS1SPyIx46gXZcAvvI54004eiwQnw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9Cu6Asf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9Cu6Asf"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c559b3eb0bso332376285a.1;
        Wed, 16 Apr 2025 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823755; x=1745428555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eebxCf0do5RI0mDndq9BzvOFzHvt6jSVZ8J5rmAS1tI=;
        b=i9Cu6AsfNpWkxa37YXBSd8/TJvxkRZWQudCa9kNAWb+9CsHz79m5Xl9Ywpyz5MljEG
         v1Ko17ps3hs41wyiiF87g696UHjRkokguWMGWBZCdhBZASnkLoMScr59I5FOSz1PL0Mh
         +14rKlpf+DyuCOxa2FBf2+PKYX5L67H9x7Rj/m1ObmX4Lh7i4rEDzyMnMGJdybPvkrxk
         7hGAq9TBFmph8dcXNhLIBZShj1fVFIfDNrw36J3Jo3SB0VxR2D7Qe4vGSE36HmXMxF09
         GyYFfwAEy6/AS/vU4VwkZQRwyVLM5fZX+1Bcpz+y/5WrcQrckEruZPj7GGo+0mTpAkjz
         yUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823755; x=1745428555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eebxCf0do5RI0mDndq9BzvOFzHvt6jSVZ8J5rmAS1tI=;
        b=SMZ20nt49RM5DxtghxpImR3aMoTx/YJLjM5nY9qofDQjORHK/W+NACguwJEr2EBx4d
         K6QBvIMqfudonoRIBTUxdnQglFXVMVmbXkVJI0DikdsyVFMy7/pwYp7o+8MP/vpqwNGx
         f1JJREdWEZAqJnBtW10EKk5Ilgq3Brg6E7Dw4pOkHXJnlYPIFEx4ILJtpwddq+Gg3/+7
         1rMH6+mYyq2SC4sYjOcamtIepaUKcrX40hHCohhIyHOklRKsMuVe41/eGPg246dThSnG
         K4CuocPaaEayH83RIHhVw4L1Rzwzo+b/4iaJdViJidmXk75hMdFXvb5Bbxz0rPdCcovR
         ViWw==
X-Forwarded-Encrypted: i=1; AJvYcCUPzCxY2Jf3zQYj0jPdvJ35gNLwBU59U9gRxURyiR/rv6WSYnCYmW1rDhZH8CtNfIJKtkcH9d1HLCrW1Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjV8KMe1LchvYxZC7N52un5O5yJDyKIv4Wjcjkyy3rosrlYfhy
	7hSYrLREwHp1zJfl6qABMIXdevXr4B9Y3TRYxTPivkTq7/Fpk8sBxa9UhvtM
X-Gm-Gg: ASbGncvqZjyVUkT8PrU/45QEpM7bci7svHJ0AlqAj1HHJ1OrxzenKxL2nlWhp6tcGCL
	Jh6Ho4OJp77eV6xavIGpjJKRxTxjv+cibHnUqJsE13/GPlXFWSUq3wjuxefkwcuWxCZ5//eqQL9
	GLrLWgCw7nc7cz35dKGpwNS6GelVZA/l12OyDzkygnwbIKMIODkb2kNRDAlETyQ0HKpJEaAUBDC
	uuaaK2YkoAn/j+xKysaWX5lq0JgGLKqEcLpbO3pT3Lg7IfDpv79OumzyeB/9I5T2kHPAhE1MDVi
	7SY+m151WmWjYMVGnsLTqtS/56V7SKwOHykdN1earc5t78TOIWzhskwT+i7wgB13w36cFgDl0Tl
	beEU3xV5EuUVmnVLjRjnD3jcLLmwMKFzyKgG1goMu5bYx
X-Google-Smtp-Source: AGHT+IGuG697vPrZYBUJYZ8jq6lkxyIC5MFQzO5gQGWU6a19DuYPpQz+xfbwAAsfpA7POqntMoG1hg==
X-Received: by 2002:a05:620a:2611:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c9190057dcmr419158385a.33.1744823755425;
        Wed, 16 Apr 2025 10:15:55 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:a61d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm1084605185a.22.2025.04.16.10.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:15:54 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:15:43 -0400
Subject: [PATCH v4 4/4] rust: alloc: replace `Vec::set_len` with `inc_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-vec-set-len-v4-4-112b222604cd@gmail.com>
References: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
In-Reply-To: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Rename `set_len` to `inc_len` and simplify its safety contract.

Note that the usage in `CString::try_from_fmt` remains correct as the
receiver is known to have `len == 0`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 25 ++++++++++++-------------
 rust/kernel/str.rs        |  2 +-
 rust/kernel/uaccess.rs    |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 87dc37ecb94d..5798e2c890a2 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -185,20 +185,19 @@ pub fn len(&self) -> usize {
         self.len
     }
 
-    /// Forcefully sets `self.len` to `new_len`.
+    /// Increments `self.len` by `additional`.
     ///
     /// # Safety
     ///
-    /// - `new_len` must be less than or equal to [`Self::capacity`].
-    /// - If `new_len` is greater than `self.len`, all elements within the interval
-    ///   [`self.len`,`new_len`) must be initialized.
+    /// - `additional` must be less than or equal to `self.capacity - self.len`.
+    /// - All elements within the interval [`self.len`,`self.len + additional`) must be initialized.
     #[inline]
-    pub unsafe fn set_len(&mut self, new_len: usize) {
-        debug_assert!(new_len <= self.capacity());
-
-        // INVARIANT: By the safety requirements of this method `new_len` represents the exact
-        // number of elements stored within `self`.
-        self.len = new_len;
+    pub unsafe fn inc_len(&mut self, additional: usize) {
+        // Guaranteed by the type invariant to never underflow.
+        debug_assert!(additional <= self.capacity() - self.len());
+        // INVARIANT: By the safety requirements of this method this represents the exact number of
+        // elements stored within `self`.
+        self.len += additional;
     }
 
     /// Decreases `self.len` by `count`.
@@ -317,7 +316,7 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         // SAFETY: We just initialised the first spare entry, so it is safe to increase the length
         // by 1. We also know that the new length is <= capacity because of the previous call to
         // `reserve` above.
-        unsafe { self.set_len(self.len() + 1) };
+        unsafe { self.inc_len(1) };
         Ok(())
     }
 
@@ -521,7 +520,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
         // SAFETY:
         // - `self.len() + n < self.capacity()` due to the call to reserve above,
         // - the loop and the line above initialized the next `n` elements.
-        unsafe { self.set_len(self.len() + n) };
+        unsafe { self.inc_len(n) };
 
         Ok(())
     }
@@ -552,7 +551,7 @@ pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), All
         //   the length by the same number.
         // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
         //   call.
-        unsafe { self.set_len(self.len() + other.len()) };
+        unsafe { self.inc_len(other.len()) };
         Ok(())
     }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..d3b0b00e05fa 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -886,7 +886,7 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
 
         // SAFETY: The number of bytes that can be written to `f` is bounded by `size`, which is
         // `buf`'s capacity. The contents of the buffer have been initialised by writes to `f`.
-        unsafe { buf.set_len(f.bytes_written()) };
+        unsafe { buf.inc_len(f.bytes_written()) };
 
         // Check that there are no `NUL` bytes before the end.
         // SAFETY: The buffer is valid for read because `f.bytes_written()` is bounded by `size`
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..e4882f113d79 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -290,7 +290,7 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
 
         // SAFETY: Since the call to `read_raw` was successful, so the next `len` bytes of the
         // vector have been initialized.
-        unsafe { buf.set_len(buf.len() + len) };
+        unsafe { buf.inc_len(len) };
         Ok(())
     }
 }

-- 
2.49.0

