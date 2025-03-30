Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89826155393;
	Sun, 30 Mar 2025 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743378051; cv=none; b=rpiPXmdAVIoZgM/I9C8nYXeeETsJDaQEMmpc8fKuia8g6bVWZOfQ/ETHuIhUMvwCybcJ/HHQUXBUBucySwxj/ukq2OOrs/i80uGj9ayzyZ/Bvagaf9ZgMS/uLCOC5Tq3vYKkx7RkegJrOxAgC1eK7lbdeGR2ddljlkqIKRWG6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743378051; c=relaxed/simple;
	bh=xU84dzqDwihu6gLhgGsGO4Qvrnzt6gjm2KGIDZUwhW0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BPjnpP2ZscyP8HpxpcN5a7noExug5eo3gbCHVM/EBcFQp3vMWxxOhJ8FFcZCpQ2Erm85K3Bv4Qcs4hQVNGtSERVCpNBeyVE9CWEUjq+GPBtbesbdsH97fGG+Zbn6iK0pANZKrAvnGMRNE8lDHE141RRGR5lvi+XA3VawsY1c/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evs8LV7E; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evs8LV7E"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so896208a91.3;
        Sun, 30 Mar 2025 16:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743378048; x=1743982848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0eX43daxSzQBt4tRrze1VB7R7bM1vLl0fa88VkQ1D0=;
        b=evs8LV7ErX89w5Bg2ioFCVuwPZbiJujt24Eio+XicfQugRXofSbAFZ5OYVeqmCSb68
         ENbPleujD/vSnazqT6IVyXqftPScHvWgkHy4GqUCGfmSbFeQ+DtH7ODf1doK92kMwYt8
         5wTQD9xbBnrZ1TKBtGqkRt369Jh9koqsEshJOa+TFVLajuK2p0eANVpfft/bSQIXgGD+
         6SnuJZwcR3AIwY1IAMVFVzkDH3X3ZmdEqj2dJnRjZ5bTfWhmHWDlxqs+inYWbeUJUeXT
         HC3qa6v12rfNFkjL76oIg5Kh3AZ0pddbHSnNpxnMLUPc3IwlZOZ2wQWjIYWd9WYBkkja
         999g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743378048; x=1743982848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0eX43daxSzQBt4tRrze1VB7R7bM1vLl0fa88VkQ1D0=;
        b=uLIsvngFpmC13GwxA1mdaYDUG08F0ty/yEU8CV337AFLD3hQ1mrcd2WCLi5m3REfXs
         PVEzVmhyE6pDDwrUEQIdH/qzHOZUn2upD1Z7gsBO2+tZrKQ6zUOj2SvtMhYgDNu6ZpL0
         /AaGXhI+idokxlIC/ViIxG8Ysqx5IOUQjs9Ffly5uJl3O/F72WUDwD9dF+Bc3B1bAY1n
         9TXHvNP87XhMoJm40RJk6Ocr7dP5CBMMiQruLaP3Xft1iJO0jDc4qpMTPqvgUt9l+Sez
         DajwymeLBvVBK6hSeRx11R6Ms7rVeIiqeNRGHyyIS09FIcMIkb15vxAxkbkdUjdDOlRl
         Jiwg==
X-Forwarded-Encrypted: i=1; AJvYcCVEogDI/d+ygC2OZACtKz02LEt7AQEGBq521+fcmnI/ZZCUHNxiYpL3sn/blCQfzBbdgdt8DfxQ5IyAN6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWA3kq7K5zMNqn6StuK0oH62N3J0N/YmqbhQIn3BV6dpVJQufB
	72zxeVHvoQmi7PbGbtbNs/2KxaEU3ILcUCmHsB6Gu7Px//nyVNv31r0kyXRF3xo=
X-Gm-Gg: ASbGncs0YqwQtLTcJc9dm7n2WmtzEPmuSSjOK3yVnOQESJguD3jQTfnhoYnvc7TfDzI
	LT8A1KFfW3tO7uqrMdPpq49FT9HSsxj5sTwOGVPF4sfObGhGFsUl24GDrX3k4PstZluPR+lGRdi
	/Md1HEjneFjvw+lRGCyRomGVd07CZbFj/jgEHfRF8kqmpolJxdWx4KC6V4PkR8GlkDNdXXbSgQj
	MQXs+CY4joCslgyjUs0mETLYwXRd8LBdmVxN6n0hKTc7w3ygHWaIJNhJFbMCkZ25xIXLtbs4nJ+
	0RzcX9uovxxn85RMsxDd7njWqe89ohoCDex5GMNdTH0b6N0yGSI/tIYN0nmrRLDHt889OEejJw=
	=
X-Google-Smtp-Source: AGHT+IF3eHUhDoPnUNibn5yPXKhPTgcD6wVQQfrmP+hSZqvW9/s8gSh2mjSEp7I/rWQBN2EU8t8qVg==
X-Received: by 2002:a17:903:1b25:b0:225:abd2:5e53 with SMTP id d9443c01a7336-2292f9622cdmr43143995ad.6.1743378048468;
        Sun, 30 Mar 2025 16:40:48 -0700 (PDT)
Received: from localhost.localdomain ([138.94.103.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce127sm57836825ad.108.2025.03.30.16.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 16:40:48 -0700 (PDT)
From: "Christian S. Lima" <christiansantoslima21@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	~lkcamp/patches@lists.sr.ht,
	richard120310@gmail.com
Subject: [PATCH v6] rust: transmute: Add methods for FromBytes trait
Date: Sun, 30 Mar 2025 20:40:15 -0300
Message-ID: <20250330234039.29814-1-christiansantoslima21@gmail.com>
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

The conversion between slices `[T]` is separated from others, because I
couldn't implement it in the same way as the other conversions.

Link: https://github.com/Rust-for-Linux/linux/issues/1119
Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>
---
Changes in v2:
- Rollback the implementation for the macro in the repository and implement
  methods in trait
- Link to v2: https://lore.kernel.org/rust-for-linux/20241012193657.290cc79c@eugeo/T/#t

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
---
 rust/kernel/transmute.rs | 89 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 1c7d43771a37..16dfa5c7d467 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -9,29 +9,106 @@
 ///
 /// It's okay for the type to have padding, as initializing those bytes has no effect.
 ///
+/// # Example
+/// ```
+/// let foo = &[1, 2, 3, 4];
+///
+/// let result = u32::from_bytes(foo);
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
+    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes;
+}
 
 macro_rules! impl_frombytes {
     ($($({$($generics:tt)*})? $t:ty, )*) => {
         // SAFETY: Safety comments written in the macro invocation.
-        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
+        $(unsafe impl$($($generics)*)? FromBytes for $t {
+            fn from_bytes(bytes: &[u8]) -> Option<&$t> {
+                if bytes.len() == core::mem::size_of::<$t>() {
+                    let slice_ptr = bytes.as_ptr().cast::<$t>();
+                    unsafe { Some(&*slice_ptr) }
+                } else {
+                    None
+                }
+            }
+
+            fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut $t>
+            where
+            Self: AsBytes,
+            {
+                if bytes.len() == core::mem::size_of::<$t>() {
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
+    // Checking the pointer size makes this operation safe and it's necessary
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
+        let slice_ptr = bytes.as_ptr().cast::<T>();
+        if bytes.len() % core::mem::size_of::<T>() == 0 {
+            let slice_len = bytes.len() / core::mem::size_of::<T>();
+            // SAFETY: Since the code checks the size and can be divided into blocks of size T
+            // the slice is valid because the size is multiple of T.
+            unsafe { Some(core::slice::from_raw_parts(slice_ptr, slice_len)) }
+        } else {
+            None
+        }
+    }
+
+    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
+    where
+        Self: AsBytes,
+    {
+        let slice_ptr = bytes.as_mut_ptr().cast::<T>();
+        if bytes.len() % core::mem::size_of::<T>() == 0 {
+            let slice_len = bytes.len() / core::mem::size_of::<T>();
+            // SAFETY: Since the code checks the size and can be divided into blocks of size T
+            // the slice is valid because the size is multiple of T.
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

