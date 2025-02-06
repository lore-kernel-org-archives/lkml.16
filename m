Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253811D8E01;
	Thu,  6 Feb 2025 20:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874948; cv=none; b=by6DeCilCK+KDcfLBnJTp+id7f0DfcIjylMa0csCqdsNlLT6cGrTzlIGCMp7jKSGC9jc+Z2x82VlziyCyWd0uzHPV05TKf6M+efBWS3zTcYc9PICMWROCVWErql4CnV5Zi3D7aM0hbeRZS09LfK6qRXATJOKdfmrSYLmrTFY6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874948; c=relaxed/simple;
	bh=TK9xOrYy3As6bruxmaUDOIAGOJJAmyR05lT/LecV/BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PVnLz0Sc8HbO0cMmk8GD9RwQ3loG1lwvzT08N8YK3mS/c1r4bMvsHzuS1PO41NSzqoIJaoOkjzH8UAu/G/kLuTz2S0SKrBUp5sxaye0LNXf08vj/ygVqqUAP/zxDOhDOqoYRxTdJnwBaAeYvi0boBE4alVrKU9c6DeDmA/BY3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuQZ32+0; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuQZ32+0"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be3d681e74so120498685a.0;
        Thu, 06 Feb 2025 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738874944; x=1739479744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4eOr05IML2aXEPaIpdxqaUml19+von0Vggy1QliMcCY=;
        b=HuQZ32+09fN8OnnvDApNyE9CcslRp+7TaFVSjHlKURNsuxrakEkXWxAak/d48U4lo0
         fko9b4Rlfp4Sl5qa/071sTDX1rZX4A8XBiCQ3uf9aV8bMBIqziEoorwnfoWSGmt8w7Fx
         pQ+Z4VVDwDxti1M0ggaQa5bEUdJ+IctSFZamBv22WvGgjIy+pWlBoLAgsrdZ11Yq+uzA
         n0nAG2LnC6+Nu+zchAK0e/PVCFoklGBNsFKuyD3mhCG62T6jzBzMIX3ZvMSKsUwQCRQe
         0N84AAIuvx0QooYDH2cXDOUSpaxvTgpw78TVsg43UdfgzPgygGXSkGvEW+hdmHYEyJSX
         1Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874944; x=1739479744;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eOr05IML2aXEPaIpdxqaUml19+von0Vggy1QliMcCY=;
        b=T2fXkudSHPoqxPmQpGNYZKzERhmUbpG3PgVmjltiVgQ7I95BfnIFKo3CJg9PeqqV5d
         LjnehL6t+eaSSWr5hHInesili8uUtRfilVHWb5brv8XeII9eqFJLIDLi77hfRxmTQbbA
         0NEv+LgwUXAoIjtniGIuvWMODbOyKKKbGuhS1Nf5dHO+QCHTYKJuKwx3W3jmdSY65Y3c
         GXLhHfjSPmKGQwABaSfOC0AYfqjYxQPUtvI9rHp+DfSH5Pxf5kPnKg3b3T/U8H8UTyDY
         4S7ppdmJSJ9g6P84usc7BoL41SDXNS6opeJNlXQmS0Vvjd8ODrMgLXlM+p3wWNhgQpYa
         WZNw==
X-Forwarded-Encrypted: i=1; AJvYcCWW+/Oad1ahzNKZGgq3Eai8q2SjSzE3pQhZKVgxSq3iw1Wm2ZA0+aF1i3TzeREJ1KjE7F0IDHOAxhduiaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSXmvf6PG5KIr+GWd9tZI025B/Uw2/Zayk5Xq4j9+dCiy7LHPp
	uM/pB0mMFMhyA2C4an+cnS86+2Kg8oYeuA28PrsAmfzfXVQxXCxP
X-Gm-Gg: ASbGncvsKFrXycwLs3gXB8YkYqMJsPaUFWji7nlvUrXJ8/zGswUOgzF3Xvksd5tAxzG
	X1C3dumiOhJU7wNRLOx9Tbmq+N+SG8LbVtGS5yNiddvbFmIHImZHADiDo+nwEGUkelWaNsT6zP9
	Fz407Xhi7FhrhKbDKdKhRc04OTWV0cYpIn9mVfXVxuRz+HDEPaHa1v59a0i6tY1bWnF4dTeqdXn
	oz8p3YjmjU9zzlXks966fVWAzuuV5W7U/JWhQXsZ9uLBG3v67lWthDfpoN1vST0OSLmzXQ3kTku
	b5mez+xmIstwEyJmiqZcEm9zI1cJBsUI4p/z/+RjCJewr1vZwXZP
X-Google-Smtp-Source: AGHT+IHavPQRlBINStuHOuhHZnd67x1S4mzDpGUVacFju1EDZN0tI+AW0MZsiR3q74WZGPet1uqezA==
X-Received: by 2002:a05:620a:4083:b0:7b6:a793:4223 with SMTP id af79cd13be357-7c047c213d6mr89494185a.24.1738874943885;
        Thu, 06 Feb 2025 12:49:03 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:fb:aded:686f:8a03])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dfb0d2sm101272585a.34.2025.02.06.12.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:49:03 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 06 Feb 2025 15:49:00 -0500
Subject: [PATCH v3] rust: allocator_test: use `posix_memalign`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com>
X-B4-Tracking: v=1; b=H4sIADwgpWcC/3WMywrCMBQFf6VkbSS5adS68j/ERZ7thbaRRIJS8
 u+mXRXB1WEOzCwkuYgukWuzkOgyJgxzBXFoiBnU3DuKtjIBBpIB41SN2M/O1h2DoVqC0SCkMBc
 g1XlG5/G99e6PygOmV4ifLZ/5+v4rZU45NV2nzsILo2176yeF49GEiaylDHsbfm2otlSeaemtb
 U9+b5dSvoC5mOHoAAAA
X-Change-ID: 20250201-aligned-alloc-b52cb2353c82
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The implementation added in commit dd09538fb409 ("rust: alloc: implement
`Cmalloc` in module allocator_test") used `aligned_malloc` which has
implementation-defined requirements of its `alignment` parameter.

The macOS implementation of `aligned_alloc` appears to be based on
`posix_memalign` and inherits the stricter requirements of that
function, causing test failures on macOS.

Replace `aligned_alloc` with `posix_memalign` and comply with its
requirements. This ensures uniform behavior across systems.

Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
I've intentionally not picked up Danilo's Acked-by from v2 because the
approach has changed quite a bit.
---
Changes in v3:
- Replace `aligned_malloc` with `posix_memalign` for portability.
- Link to v2: https://lore.kernel.org/r/20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com

Changes in v2:
- Shorten some variable names. (Danilo Krummrich)
- Replace shadowing alignment variable with a second call to
  Layout::align. (Danilo Krummrich)
- Link to v1: https://lore.kernel.org/r/20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com
---
 rust/kernel/alloc/allocator_test.rs | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index e3240d16040b..0aa68d955b39 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -23,8 +23,19 @@
 pub type KVmalloc = Kmalloc;
 
 extern "C" {
-    #[link_name = "aligned_alloc"]
-    fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ffi::c_void;
+    // NB: `posix_memalign` is intentionally used instead of `aligned_malloc`.
+    //
+    // ISO C (ISO/IEC 9899:2011) defines `aligned_malloc`:
+    //
+    // > The value of alignment shall be a valid alignment supported by the implementation [...].
+    //
+    // POSIX.1-2001 (IEEE 1003.1-2001) defines `posix_memalign`:
+    //
+    // > The value of alignment shall be a power of two multiple of sizeof (void *).
+    //
+    // `posix_memalign` is more portable than (but otherwise identical to) `aligned_malloc`.
+    #[link_name = "posix_memalign"]
+    fn libc_posix_memalign(align: usize, size: usize) -> *mut crate::ffi::c_void;
 
     #[link_name = "free"]
     fn libc_free(ptr: *mut crate::ffi::c_void);
@@ -62,13 +73,21 @@ unsafe fn realloc(
             ));
         }
 
+        // Ensure we comply with the requirements of `posix_memalign`.
+        let min_align = core::mem::size_of::<*const crate::ffi::c_void>();
+        let (align, size) = if layout.align() < min_align {
+            (min_align, layout.size().div_ceil(min_align) * min_align)
+        } else {
+            (layout.align(), layout.size())
+        };
+
         // SAFETY: Returns either NULL or a pointer to a memory allocation that satisfies or
         // exceeds the given size and alignment requirements.
-        let dst = unsafe { libc_aligned_alloc(layout.align(), layout.size()) } as *mut u8;
+        let dst = unsafe { libc_posix_memalign(align, size) } as *mut u8;
         let dst = NonNull::new(dst).ok_or(AllocError)?;
 
         if flags.contains(__GFP_ZERO) {
-            // SAFETY: The preceding calls to `libc_aligned_alloc` and `NonNull::new`
+            // SAFETY: The preceding calls to `libc_posix_memalign` and `NonNull::new`
             // guarantee that `dst` points to memory of at least `layout.size()` bytes.
             unsafe { dst.as_ptr().write_bytes(0, layout.size()) };
         }

---
base-commit: dc58b514a628fc11ab459dccdd6a2f3a916e8f6a
change-id: 20250201-aligned-alloc-b52cb2353c82

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

