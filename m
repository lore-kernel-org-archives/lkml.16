Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A176136;
	Tue, 24 Jun 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750739290; cv=none; b=ht6HfL0OqA/av4aq7vanRI6LMAFN3Sk/LW4L/Lehp4827YTncWR0PaCI00sqe83q36CccQqEaURInNR9dr6win99Dn5hn2HFVLMLmTYE5TUjXeFH1ypZ5ayC8Vg7di919cnev+aSUfK0LFIvXvhfchLPfu4Iez36Ww1+oDnfkZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750739290; c=relaxed/simple;
	bh=qDq+KroKdv6fd4RFczineFXJjUXv3l3EBcPo11dsWpE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bEpQKluIhQ135AU8d/M/nKbzMuKDbCmfuJNXbyDzhuGopUL+kgxas+zCwrs5q/wfHrZdllwEQk1bxdPxZPXh+5Ow1floEgZGyWZWnb8Us03GaLtt6QfmS+3tM37qD/oymF7+Cra3hB9CW0VEuVmxDT6vYb6fUdsy+60bExaMnco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFl2xlDt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFl2xlDt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313336f8438so648471a91.0;
        Mon, 23 Jun 2025 21:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750739288; x=1751344088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmSIN6ze48fHLAU7HddzL1LXnxd1gMl3vk8ikqqzThg=;
        b=gFl2xlDtmQGOqWwBSnrd7N6S+kD8Lx2jrCiOLcCoVKwkzRfeBUPR0ABxsVEkfaLeRx
         y19CvSWZ6dataJOSVoCapPKTbHEV185eHg4yZ2ZKIPmkRO7C5P0va7GCqvaGwc6rbPIW
         J2NOd0mg1bG69D5rl9iPiZWCbbDsvgOZlQokATI9FxTcoyQ611RkJTacaJ5AztgUG0EV
         9qiDYCYdQtCwcTwL5MHAlGonbOxEKfIzQYLgyQaP/voQcCcWlToWuZm0KToVlpo9aLLz
         XjjY02gPUrcuaNqYoVL6/wotvYFitXMoB6iD1BKw6UlN1kh0gCEJTvy50Io25jZEXVz+
         F/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750739288; x=1751344088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmSIN6ze48fHLAU7HddzL1LXnxd1gMl3vk8ikqqzThg=;
        b=E2QVfPdMSqB6a+H9hbciy0nWJlTQfBswex8/uK7clK/s/o2YWUFXCN8wSstHGrzQAo
         003JgjfmrGo4u5yPcUI1C57sxa1sNHrrs0W1afLXFipU3keNkYqgXMSi8oVksH/Qclvs
         07tCPDn0XObgbfjQhG+gZYC5BCykubiodKT2VhNTIm8+B9aPcSPF/DMyloAx3Nv1od+Y
         xN4Yg9C7IqkeW74IlBL2gO3ArNB7Frr+VoJprzsFaMZLxbm2pbmmOBMx18XSezLq3sUM
         jl1F+NqhwX6giIM4vH2f4R0eMt9QAZeurVF1OX67Qeon7Rf3zuBZrTXPgjcPE6c2Td9p
         ZsQw==
X-Forwarded-Encrypted: i=1; AJvYcCU2fISER5fCKOmbQrlrRzhkA8YIGOJ2aRRTvmXY5c3D3yhR55kwDGFaNnYbj8acwL7npH9TIHgxTrFKkfCRDtM=@vger.kernel.org, AJvYcCVKLMLN+5LyLKmtnBrR2ya/ByRJB/MOq9Z42xT4NFXb9T116gjXEnuMdcCWvq4oDu3m8XXBVOxN4H/VvjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2EuB0jecKvCC5faxiiwafq3IPhRVU9ID/dJzaZddoGuVIOZlK
	hdTLf11hAI/arV/7FBNPE4b7OuAeVieYxC87znteS86R0sMZu8QGLxPm
X-Gm-Gg: ASbGncsV2Uwq+tdA8xEd1s1Ml3gYB1ddvGR2h3LKJ4frzt6jEYQjO0QzsQicvUFORVi
	Qs7ZLJ6w4rXiTLJeaeZnRvNDzp1yxQFHluuqunOI9iCWImK8xF8Srba/Nr19KhVJthlrccoNLaJ
	zQGOh057bKgKZ/ZJSsNwlm0hvahggAVGTkE/HO4IpG2pqklLpk36z6kuGhqUZ/GBxrYQTcEqXvc
	HhlO4POXUkXx42qS4Vmrx9ZnQzcfg/qnO/LORgsItVLVbg9GZUWPcfQmgEA3UzW+jleIPtHFtkd
	Xu/ktcmVBYdep5f6OYQbyZO1OCjtfF9FAxDy2TWQXvU+Poz9HDqgPu8MDGkT4wqQd2RzAOYd3w5
	umCFrO7BilBWv6HQ=
X-Google-Smtp-Source: AGHT+IEs6EWS+EoVH2MIVJCKKApIeloHaAs25Uc47CI0bKqoK2OdgPgy0frPAhiLvltO/93opV0rYQ==
X-Received: by 2002:a17:903:32c3:b0:234:8e54:2d5f with SMTP id d9443c01a7336-237d9ac4532mr88230265ad.13.1750739288464;
        Mon, 23 Jun 2025 21:28:08 -0700 (PDT)
Received: from localhost.localdomain ([138.94.103.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d874fe39sm96363105ad.251.2025.06.23.21.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 21:28:08 -0700 (PDT)
From: "Christian S. Lima" <christiansantoslima21@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht,
	richard120310@gmail.com
Subject: [PATCH v8] rust: transmute: Add methods for FromBytes trait
Date: Tue, 24 Jun 2025 01:28:02 -0300
Message-ID: <20250624042802.105623-1-christiansantoslima21@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two methods added take a slice of bytes and return those bytes in a
specific type. These methods are useful when we need to transform the
stream of bytes into specific type.

The `FromBytesSized` trait was added to make it easier to implement other
user defined types within the codebase. With the current implementation,
there's no way to interact without implementing `from_bytes` and
`from_mut_bytes`for every new type, and this would end up generating a lot
of duplicate code. By using FromBytesSized as a proxy trait, we can avoid
this without generating a direct dependecy. If necessary, the user can
simply implement `FromBytes`if needed. For more context please, check the
[1] and [2].

[1] https://lore.kernel.org/rust-for-linux/DANSZ6Q476EC.3GY00K717QVUL@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/DAOESYD6F287.3U3M64X0S1WN5@nvidia.com/

Link: https://github.com/Rust-for-Linux/linux/issues/1119
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>
---
Changes in v2:
- Rollback the implementation for the macro in the repository and implement
  methods in trait
- Link to v2: https://lore.kernel.org/rust-for-linux/20241012070121.110481-1-christiansantoslima21@gmail.com/

Changes in v3:
- Fix grammar errors
- Remove repeated tests
- Fix alignment errors
- Fix tests not building
- Link to v3: https://lore.kernel.org/rust-for-linux/20241109055442.85190-1-christiansantoslima21@gmail.com/

Changes in v4:
- Removed core::simd::ToBytes
- Changed trait and methods to safe Add
- Result<&Self, Error> in order to make safe methods
- Link to v4: https://lore.kernel.org/rust-for-linux/20250314034910.134463-1-christiansantoslima21@gmail.com/

Changes in v5:
- Changed from Result to Option
- Removed commentaries
- Returned trait impl to unsafe
- Link to v5: https://lore.kernel.org/rust-for-linux/20250320014041.101470-1-christiansantoslima21@gmail.com/

Changes in v6:
- Add endianess check to doc test and use match to check
success case
- Reformulated safety comments
- Link to v6: https://lore.kernel.org/rust-for-linux/20250330234039.29814-1-christiansantoslima21@gmail.com/

Changes in v7:
- Add alignment check
- Link to v7: https://lore.kernel.org/rust-for-linux/20250615072042.133290-1-christiansantoslima21@gmail.com/

Changes in v8:
- Add the new FromBytesSized trait
- Change the implementation of FromBytes trait methods
- Move the cast to pointer earlier and use `is_aligned()` instead manual alignment check
---
 rust/kernel/transmute.rs | 100 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 1c7d43771a37..832c65a1239c 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -9,27 +9,115 @@
 ///
 /// It's okay for the type to have padding, as initializing those bytes has no effect.
 ///
+/// # Examples
+///
+/// ```
+/// use kernel::transmute::FromBytes;
+///
+/// let foo = [1, 2, 3, 4];
+///
+/// let result = u32::from_bytes(&foo)?;
+///
+/// #[cfg(target_endian = "little")]
+/// assert_eq!(*result, 0x4030201);
+///
+/// #[cfg(target_endian = "big")]
+/// assert_eq!(*result, 0x1020304);
+/// ```
+///
 /// # Safety
 ///
 /// All bit-patterns must be valid for this type. This type must not have interior mutability.
-pub unsafe trait FromBytes {}
+pub unsafe trait FromBytes {
+    /// Converts a slice of bytes to a reference to `Self` when possible.
+    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
+
+    /// Converts a mutable slice of bytes to a reference to `Self` when possible.
+    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes;
+}
 
-macro_rules! impl_frombytes {
+/// Just a proxy trait for FromBytes, if you need an implementation for your type use this instead.
+///
+/// # Safety
+///
+/// All bit-patterns must be valid for this type. This type must not have interior mutability.
+pub unsafe trait FromBytesSized: Sized {}
+
+macro_rules! impl_frombytessized {
     ($($({$($generics:tt)*})? $t:ty, )*) => {
         // SAFETY: Safety comments written in the macro invocation.
-        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
+        $(unsafe impl$($($generics)*)? FromBytesSized for $t {})*
     };
 }
 
-impl_frombytes! {
+impl_frombytessized! {
     // SAFETY: All bit patterns are acceptable values of the types below.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
 
     // SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
     // patterns are also acceptable for arrays of that type.
-    {<T: FromBytes>} [T],
-    {<T: FromBytes, const N: usize>} [T; N],
+    {<T: FromBytesSized, const N: usize>} [T; N],
+}
+
+// SAFETY: All bit patterns are acceptable values of the types and in array case if all bit patterns
+// are acceptable for individual values in an array, then all bit patterns are also acceptable
+// for arrays of that type.
+unsafe impl<T> FromBytes for T
+where
+    T: FromBytesSized,
+{
+    fn from_bytes(bytes: &[u8]) -> Option<&Self> {
+        let slice_ptr = bytes.as_ptr().cast::<T>();
+        if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(&*slice_ptr) }
+        } else {
+            None
+        }
+    }
+
+    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes,
+    {
+        let slice_ptr = bytes.as_mut_ptr().cast::<T>();
+        if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(&mut *slice_ptr) }
+        } else {
+            None
+        }
+    }
+}
+
+// SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
+// patterns are also acceptable for arrays of that type.
+unsafe impl<T: FromBytes> FromBytes for [T] {
+    fn from_bytes(bytes: &[u8]) -> Option<&Self> {
+        let slice_ptr = bytes.as_ptr().cast::<T>();
+        if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(::core::slice::from_raw_parts(slice_ptr, bytes.len())) }
+        } else {
+            None
+        }
+    }
+
+    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes,
+    {
+        let slice_ptr = bytes.as_mut_ptr().cast::<T>();
+        if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(::core::slice::from_raw_parts_mut(slice_ptr, bytes.len())) }
+        } else {
+            None
+        }
+    }
 }
 
 /// Types that can be viewed as an immutable slice of initialized bytes.
-- 
2.49.0

