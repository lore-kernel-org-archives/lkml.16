Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A731DB122;
	Sun, 30 Mar 2025 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743378056; cv=none; b=ia5Uu0yhCREDawIRE6MI2BwDBYMRxuJfVm9enOlGlCJNgYPSZNpUBBjjfSZE6vG5uSG1TGlZ7BNbQ/GgMEQiCPimtpZLp2cK/ai8/OcNxOHwkewkNcVI7IuMbXWP4Ii1POHDBwu7O4NneeQQ5gDWX6v4rXHlMdA79JOCC6xPHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743378056; c=relaxed/simple;
	bh=xU84dzqDwihu6gLhgGsGO4Qvrnzt6gjm2KGIDZUwhW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSehKMY4BIoScgBHZT3ey3EI38O1MJjp8DNCTk8LUHgk+ulkaycGCr+jWSAtgKpxl6tQlGyFmDfqXetCgA5BPDN5sqQ+/tll3ngnvxi0A4XzKkgwgpeoLGjGJv2lFyGPGWMrMX3PumQVAR1VZ81FKRAPaQ0PeWWS+NP7g2j1fSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRcVCxVU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRcVCxVU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso1094548a91.1;
        Sun, 30 Mar 2025 16:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743378054; x=1743982854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0eX43daxSzQBt4tRrze1VB7R7bM1vLl0fa88VkQ1D0=;
        b=bRcVCxVUibkgAN6Fl1hom0UULgTE9e9HuSs41IcCSxLe9rkqZ9friAfcZWPC7F17R9
         MZQPzDuuZZcGnPbI4gV5z7vPc3Gpw2AstN0imww+JKKgG9CCSHsJvKuq57/KguJA+334
         KvsiN5n5ObGd5voumVtdGP8xGR+j4TO7AY8n+sBX6/Zq4+FuLqgwfx1VaMEhpDaMmmnn
         dyRbDlmyrrkx8TvTxWBTs5+E2ib/7vaLTgVTZ08WhOKzIEYushbYOwivxPFSYaI6lF6A
         SEi+xf27rYP8jd1vPYM2aHkF80mA95WM/gYX0DpP+m7ShOFlrCdiR0Pw6jfenLqGWU4D
         bL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743378054; x=1743982854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0eX43daxSzQBt4tRrze1VB7R7bM1vLl0fa88VkQ1D0=;
        b=O/xIieVpOR8BbOc4gMhJsxmTqIAUfXyKGz49NHf6ZGH5t4vH/JFyYsHE09EGIV/ouD
         qXEOC3Yx3kMwANgxO6jfp8qJzH6m32lSxSIV1XT70Fv3/mkmy/RrzDTBZEfDxgg6ZHe/
         O6/9qbppoC4krl8jBYLBHZZ04Lyard2/wJD8T2R9K2CaSORzdVcFfhAtfmgSp5oy8FZ/
         LADvOm5BHyNepPNZ+7zzfEE5O6y4NtZThZs6uJ4m0EsulkSWMA2hHicWf+EhX3wZY6Vh
         cWnXSeVSHGFJ3LuTv9fu7GHIAOSi30g8fwzusbnUSXONd2r91fTttpig8PZ+v1fTdnYH
         zvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrKixrFFJze8x3eGpik1cQ5Au9d1GhfdGGDfkGr0PKbZrCThwPwFX/7BCGOyWGYUKH3ZET/0LPx657+0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUseSRhToBBIynMtei/IYWIY78FBf+cB2ZbFIBpB8cncDbVZ03
	Q+FbcL4NvTzhiSN8qDSY2VEVSM+HsYIpXoYybwALk8WFZMhEYF3cfxSs0YCF3kw=
X-Gm-Gg: ASbGncu9OpLdPbrvfWlZQ05CaZp6PV2KE4f4Bghvf/85NfitMBRuxkLyaxRNCZanmJw
	PDaPwTemr5FamssEB2HEGIwlOCsoSr/tHVhHSuC2IOaQNloq/Hi3qeib8aH2c9OpInG7zG2UELq
	VyT+qD/ZMR3OHdEvd8pVKCUep/W7AnCSP0srs1xYhJfc/B1+zwmvahVdVT6gNdXEum1j15B30Eh
	EWksJeCTpr0b2XYaz2nfumpp98RdI1zzCQ4s8jiTlQIw11/jfAvLUAKXuMrfeidckKENOIXV0V2
	Cl8HAua0Phbk+tAs+IqwHxVTwId8D9TLfg8540LUi1TzhwUuSwDY9EFE8QIgSl0GSS2rbAq7ea7
	vpq1PWacF
X-Google-Smtp-Source: AGHT+IG7c8JtIUEkWQF/x2qvcvGdj0luYrBaFUZUXccVRKx4b4zEx03IUcNXiU8Wkii70hUvKhekug==
X-Received: by 2002:a17:902:ef09:b0:223:f903:aa86 with SMTP id d9443c01a7336-2292f9491dbmr41168675ad.1.1743378053800;
        Sun, 30 Mar 2025 16:40:53 -0700 (PDT)
Received: from localhost.localdomain ([138.94.103.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce127sm57836825ad.108.2025.03.30.16.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 16:40:53 -0700 (PDT)
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
Subject: [PATCH] rust: transmute: Add methods for FromBytes trait
Date: Sun, 30 Mar 2025 20:40:16 -0300
Message-ID: <20250330234039.29814-2-christiansantoslima21@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330234039.29814-1-christiansantoslima21@gmail.com>
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
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

