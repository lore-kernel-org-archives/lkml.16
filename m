Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D02CA9;
	Sun, 15 Jun 2025 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749972051; cv=none; b=nK9ILmRE1+SK6AWDF/OytO/3a+TK8k+Wj7fyiT03do5oBXCyowhQRVXs6LceuSpSu8noQ4ALvLPu1hASK71LwK1KhiWyyPVa2dsWqkuEZFkXPq3VIbnRHT82sHRgwhPCIinvyetv82CM6Ao4Wsc9o7snKw/XkGV3rjc5DrY4Ay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749972051; c=relaxed/simple;
	bh=4+xQXOUAQD5UvXYh04qLX0adg/QGiX9v0RVX/s6QK20=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eJSzeI6fTUg2psMqiT3olgfC5IrNlkyNxKsQLYEKjutGZ1tQc3j4+/3eEY0e0joLx96ZE34H2mtvvtLWUVKB8KSNbHVIW4ee4Qss0XhGzLgGEQnAcBf/XSmdrdt/UGM1AoZk4fLbN6TEAF6YWt0JdYzepcXlpcnpmUhwhMPLcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic/qAHrQ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic/qAHrQ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so200116a91.1;
        Sun, 15 Jun 2025 00:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749972049; x=1750576849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgeckXHexsoIw4PN9i3o08+SjXrSjGNfdD95DZmdeP8=;
        b=Ic/qAHrQY59Ydc9mTGcd8N/yJmi3YR279SrKcj5HX42wgM+ENkvKueWhFrx+Rqcv9n
         aF2E9xFXi7Iw1pl0mkBvLPBQTXhZWsVLOBv+J8KpSCi9+zGwbHUJTS5PAXVfDV8cL/1g
         PBKj8HZnGp4+IrepPa7kpZe2vIhE8DgNk0A2Mf9fTxOPZGipAic9S3C5tb4DE2TnT0X3
         /xo/cmFmE65SCGvFCMhx61zSruiNdzHeUPxfc13o6bgqGHtsq4yO76l2T3j/NL0g5i8P
         g0mPyZQDtsebRDFNjX4iMPbXQkgnu4gFh3Sy/GLjKtT23OHJD1WYYz3g1vML2YzPegJJ
         Birw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749972049; x=1750576849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgeckXHexsoIw4PN9i3o08+SjXrSjGNfdD95DZmdeP8=;
        b=CokZmw2sjX8R195aMyEXgCy9cXUyiZt3gz7Q8unekL3i+/4w/Zsm/KhQXyVg6M+nT0
         eUBPc7Tdz6bP6HvZIg2Z4EM155spXD06G/CkD9IWJ9802osw5WGU4iLVjN8ra3eTvJsO
         J64NB3bblJBjZmh59fyJQlgNjTIXI2Pa69VyOmuMZOPpU9LYmfq1GjuJdwKJT5oT5x/Q
         FmUssEF2mHHFFeuDoyU0JjPc5xyJWuFtYsBzVm3cjtT4c7vYmxax7R7nmxFHAEV1F95O
         2oL5KDZb+NAF5e3TV2XO/s7G5Y0Qh4F+XorXLQgcOWmo98IxJ8QQzUr3/v4itbYI/vNd
         1mYg==
X-Forwarded-Encrypted: i=1; AJvYcCXFRyYuHbj6UC4uRAcCEtfw47iX50ULyx5x2UInyXS2vF1WaH1VYMxoV0d+u0uQbKcFyZIVIgcIIr940Bg=@vger.kernel.org, AJvYcCXXIaIQluh3OVRNAmiAdvKPjn0YesAGIwkYDqzP/azWQzFCzC/MqJFaHxilXnjyUl+JX78x1Sksjkrves5Kyf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ef8Xm9N0T0v4nmuWuyEIc3nxnXrmMQpxLm2Y5aqG7EbEKnXF
	vuCsVz2ayjLgmqwr2WMC3fdTBzVfjz/Je6E72RiQ+EZa+YNLFdahg9KT
X-Gm-Gg: ASbGncsQEzNPnpg/Sxg318CXnWkOW4J32/Q0Kz7PGNBNxA2E54nF56OXpZwX9agkaNE
	Yj98gnzhypnRsnYEZ1KgSUAlB/UEIWJ0+6MRYGcsJAUAU8uGLRwjp3BJ3cU3HARkJYmw9sVIwJo
	5faPD0EUUN+dt5rFG9R89rQqgeau5odwc+2q95CqfUsJpzExkzQLmjm2MMqRI6Uzaz5K1S1vxn6
	9j9y/hAbc8vLUZQyJZ+y5ccfprW2ZJqOPgkQ76SVbPW3k+Q5gBYFe6DE6vp+EBmy+au+WtyaNaY
	A790vcd50UJLA1I9kQyLzspmPmw2212gd+c0XFzTeMSiRjHY++qk6ua8++fnCqfNLsmz0OwdojO
	CSgWJrcPo/lZkQOQ=
X-Google-Smtp-Source: AGHT+IGWhXzoTTOJHmOr4JMdRJ0u5IMehT4OInavwqJWkoM6kTXp8gh/zJlA6YjGejDvKyzJLrvbKw==
X-Received: by 2002:a17:903:2303:b0:234:8e54:2d5f with SMTP id d9443c01a7336-2366b16ed15mr27903975ad.13.1749972049011;
        Sun, 15 Jun 2025 00:20:49 -0700 (PDT)
Received: from localhost.localdomain ([138.94.103.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1fa0sm40001205ad.86.2025.06.15.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 00:20:48 -0700 (PDT)
From: Every2 <christiansantoslima21@gmail.com>
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
Subject: [PATCH v7] rust: transmute: Add methods for FromBytes trait
Date: Sun, 15 Jun 2025 04:20:42 -0300
Message-ID: <20250615072042.133290-1-christiansantoslima21@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Methods receive a slice and perform size check to add a valid way to make
conversion safe. An Option is used, in error case just return `None`.

Link: https://github.com/Rust-for-Linux/linux/issues/1119
Signed-off-by: Every2 <christiansantoslima21@gmail.com>
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
---
 rust/kernel/transmute.rs | 95 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 1c7d43771a37..5443355de17d 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -9,29 +9,112 @@
 ///
 /// It's okay for the type to have padding, as initializing those bytes has no effect.
 ///
+/// # Example
+/// ```
+/// let arr = [1, 2, 3, 4];
+///
+/// let result = u32::from_bytes(&arr);
+///
+/// #[cfg(target_endian = "little")]
+/// match result {
+///     Some(x) => assert_eq!(*x, 0x4030201),
+///     None => unreachable!()
+/// }
+///
+/// #[cfg(target_endian = "big")]
+/// match result {
+///     Some(x) => assert_eq!(*x, 0x1020304),
+///     None => unreachable!()
+/// }
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
 
 macro_rules! impl_frombytes {
     ($($({$($generics:tt)*})? $t:ty, )*) => {
         // SAFETY: Safety comments written in the macro invocation.
-        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
+        $(unsafe impl$($($generics)*)? FromBytes for $t {
+            fn from_bytes(bytes: &[u8]) -> Option<&$t> {
+                if bytes.len() == core::mem::size_of::<$t>()
+                    && (bytes.as_ptr() as usize) % core::mem::align_of::<$t>() == 0
+                {
+                    let slice_ptr = bytes.as_ptr().cast::<$t>();
+                    unsafe { Some(&*slice_ptr) }
+                } else {
+                    None
+                }
+            }
+
+            fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut $t>
+            where
+            Self: AsBytes,
+            {
+                if bytes.len() == core::mem::size_of::<$t>()
+                    && (bytes.as_mut_ptr() as usize) % core::mem::align_of::<$t>() == 0
+                {
+                    let slice_ptr = bytes.as_mut_ptr().cast::<$t>();
+                    unsafe { Some(&mut *slice_ptr) }
+                } else {
+                    None
+                }
+            }
+        })*
     };
 }
 
 impl_frombytes! {
     // SAFETY: All bit patterns are acceptable values of the types below.
+    // Checking the pointer size and alignment makes this operation safe and it's necessary
+    // to dereference to get the value and return it as a reference to `Self`.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
-
-    // SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
-    // patterns are also acceptable for arrays of that type.
-    {<T: FromBytes>} [T],
     {<T: FromBytes, const N: usize>} [T; N],
 }
 
+// SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
+// patterns are also acceptable for arrays of that type.
+unsafe impl<T: FromBytes> FromBytes for [T] {
+    fn from_bytes(bytes: &[u8]) -> Option<&Self> {
+        if bytes.len() % core::mem::size_of::<T>() == 0
+            && (bytes.as_ptr() as usize) % core::mem::align_of::<T>() == 0
+        {
+            let slice_ptr = bytes.as_ptr().cast::<T>();
+            let slice_len = bytes.len() / core::mem::size_of::<T>();
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(core::slice::from_raw_parts(slice_ptr, slice_len)) }
+        } else {
+            None
+        }
+    }
+
+    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes,
+    {
+        if bytes.len() % core::mem::size_of::<T>() == 0
+            && (bytes.as_mut_ptr() as usize) % core::mem::align_of::<T>() == 0
+        {
+            let slice_ptr = bytes.as_mut_ptr().cast::<T>();
+            let slice_len = bytes.len() / core::mem::size_of::<T>();
+            // SAFETY: Since the code checks the size and alignment, the slice is valid.
+            unsafe { Some(core::slice::from_raw_parts_mut(slice_ptr, slice_len)) }
+        } else {
+            None
+        }
+    }
+}
+
 /// Types that can be viewed as an immutable slice of initialized bytes.
 ///
 /// If a struct implements this trait, then it is okay to copy it byte-for-byte to userspace. This
-- 
2.49.0

