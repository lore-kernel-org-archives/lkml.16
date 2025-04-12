Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816419ABC3;
	Sat, 12 Apr 2025 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481775; cv=none; b=mROVkqsqWivskFuH4Exm1LRbLiyfJ1AcxPxHXUZGfNR63mzapF5jq5dVTE9MV5jjnKX3D3Vw0u8tzOqpqpaPojX4HddgledpojNO+NBVgLJ0Qod8CMJUTwfa7rT9ajQaJm8rDuR+j9iRLvWbjTPmBsZO1zZ/ChfFnNbFbAttJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481775; c=relaxed/simple;
	bh=yaH9R+FOpXxoE6RvtkoEseBBnlSEqHVwYvDTL5qhA18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RZielIY+xkmQ7JhH3M6tYA+3aH+bGW3zqYN7dlRsOUsk1h7hCSVpMvfV4HQ6ByaTqQZOTZlzks7aA+dsRDPLn2+111v6Si+HW/tHSi+KWyue3jTbH5+FhTdFs0dYn07tvJV694gBvxOy2hT9R4Qq6fKcMdzDGPGqZv/zy8GzG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z32iQAr1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z32iQAr1"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f8657f29so25544326d6.3;
        Sat, 12 Apr 2025 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744481772; x=1745086572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oouRvJdiwnHi5oq4p248AVzdc2dBNC0aSTSlJ0QJ4Xc=;
        b=Z32iQAr1blIeG7/VBPCwZ+1ZXuZfjdui2TH4HEUNkme3Htr0hmuuRET4R62LZJngTp
         HcFQJqXy4ujmfh+dAiYcDEdyd6pAe8Thu2XZ5BqDQS6GTerAVQGw2y1wfFyFZkL3Sdji
         FrHKWeb2atX2SQC5I9l+RM/mMXsRVevc5k0CJEOy2HzzPJENV7hjRv0pOLpectoajRtG
         ODvI1jcQJL92Hy0iRZBTQHHKBK+R8Nd9xuDiwq6TB4KEbphRGgALWgMCPiIvCQDxnYJG
         Gy1FlBiqma2oDCPl68K0gCUNwOBrYfMARY+2jb8gonJuc0O9grjTYv1siVVY8+ZBK73L
         cfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744481772; x=1745086572;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oouRvJdiwnHi5oq4p248AVzdc2dBNC0aSTSlJ0QJ4Xc=;
        b=v+iLZm+U0lBpUAOkE/zM9ZTYLgCOxT6k7QVWtGXsh94wapXmxo8HRerKS+DXK4JY95
         F3QIAdME0vrAxyAAde/GQ/UOiIBVHin0QO8Rzd6mNnbQYpXKh6huNWM04WZPtdmrkVBq
         RkJVLTasKRhdBHEAZ2wpfPvfpjfPz3F73VkqIypiDEZnOe0WUmZ8leO+gtWPjdpctuyF
         DwcvjcsDmilpXWu8Gm+pRjkrj6aX7tYJXBHW4OsEG3r6e+ZOOXwPCXN8/4mVrYb10c9V
         l3h3PUHqArRPbNt0YarzZvvG4sHp2sspi42gdUIY9OtA9U3Gjd5Lofy5TZem1pHw7CFz
         r09g==
X-Forwarded-Encrypted: i=1; AJvYcCXVd9tyVQKg+T4zG6w4nNxL5hjPgPcOsnKMQLlNuwAlufpcdVQSwBLNjvpGZGB5pDPvOOxHmzv2Wb5gjL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbyeu7yAKkzAU23XxUGMrrYSo1+MPMO+yP4l+pryF4+tja6wy
	au72CmgqLjJ2sM9zc3ur7Ppoe/mp6jDwP5KX2Y9Wc0boZBr3vlSW
X-Gm-Gg: ASbGnctjNN/9xUgciT3IUDnXqZ6ZL7q0hU1cPS6m4XrkmZR5LIanAJj0mA9NDQXJm9F
	7MNEOMawX+UHUveD9/YtU6Cqn5Qbmc6yvUbBkspbk7A2zztv/Gkm5to/+QMHALqKCj/hZsnCvHu
	5DtIQIQTcvubwNST+Z+1WBjGz3EE2Wl/MVPPoI8NQ90vr9WwbJC4M7BFOCUMkr3Y4+rBZYZS25q
	ngyTRlZZFC5BE4F+z1wuTmDA2xj5Uk2ptQCDU0PWJPbZfc4YrzY3Ht6WsY8mcBatQrMVaJ3ONyv
	KLUdtnHeziWV6zW2gueqxZqC/+DDOJNYx4DtY7lTZbc0ATjYFVVfa18NbayrUArUgsLHyXj4ne8
	pqfvSsLDdimIJ7yOf7SoqCUDlUop3TJEHJ7k4RbR51KlCCoLcLOkQutH4OS4v/ex1PCU=
X-Google-Smtp-Source: AGHT+IHEkyqVKPlSuHKNlzc0n1R9tdO7qKRHoMrRaFy8O54t8V/F05x7bUUaenUNYf2QE8mYEaVNpA==
X-Received: by 2002:a05:6214:d43:b0:6e8:f6d2:e074 with SMTP id 6a1803df08f44-6f23f118f9fmr130462656d6.28.1744481772155;
        Sat, 12 Apr 2025 11:16:12 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:1d83:73da:5aa:7e95])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dd12sm434764685a.99.2025.04.12.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 11:16:11 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 12 Apr 2025 14:16:08 -0400
Subject: [PATCH v2] rust: check type of `$ptr` in `container_of!`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOet+mcC/42Py27DIBBFf8ViXSrAQMGr/keVBY8hRq0hAWIli
 vzvIc6m3XV5rjR3zr2jCiVCRdNwRwXWWGNOHdjbgNxs0hFw9J0RI0wQTim2HLucmokJCs4Bt9s
 JsJvBfWMiTaCOER6ERr3gVCDE617+dXhxgfOl/2ivEFlT+3FeltimgZjAgrRALWeKjkpYSZWzS
 hqvuQQPnihtnEK/3brqbkb0X63l0hLUii0VozeWj0r5aaXo6THH2nK57Zt79BT5z7yVYoqJYpJ
 BkB9Oi8/jYuLPe/dHh23bHh1MUwRMAQAA
X-Change-ID: 20250411-b4-container-of-type-check-06af1c204f59
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.

Given the incorrect usage:

; diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
; index 8d978c896747..6a7089149878 100644
; --- a/rust/kernel/rbtree.rs
; +++ b/rust/kernel/rbtree.rs
; @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, V> {
;          while !(*child_field_of_parent).is_null() {
;              let curr = *child_field_of_parent;
;              // SAFETY: All links fields we create are in a `Node<K, V>`.
; -            let node = unsafe { container_of!(curr, Node<K, V>, links) };
; +            let node = unsafe { container_of!(curr, Node<K, V>, key) };
;
;              // SAFETY: `node` is a non-null node so it is valid by the type invariants.
;              match key.cmp(unsafe { &(*node).key }) {

this patch produces the compilation error:

; error[E0308]: mismatched types
;    --> rust/kernel/lib.rs:206:26
;     |
; 206 |             [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) == typeof(`$Container.$($fields)*`)
;     |                          ^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
;     |
;    ::: rust/kernel/rbtree.rs:270:6
;     |
; 270 | impl<K, V> RBTree<K, V>
;     |      - found this type parameter
; ...
; 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
;     |                                 ------------------------------------ in this macro invocation
;     |
;     = note: expected raw pointer `*mut bindings::rb_node`
;                found raw pointer `*mut K`
;     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)
;
; error: aborting due to 1 previous error

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
I also considered an implementation using a function, but the resulting
compilation error was not as concise:

; error[E0308]: mismatched types
;    --> rust/kernel/lib.rs:207:42
;     |
; 207 |             assert_same_type($field_ptr, field_ptr);
;     |             ----------------             ^^^^^^^^^ expected `*const rb_node`, found `*mut K`
;     |             |
;     |             arguments to this function are incorrect
;     |
;    ::: rust/kernel/rbtree.rs:270:6
;     |
; 270 | impl<K, V> RBTree<K, V>
;     |      - found this type parameter
; ...
; 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
;     |                                 ------------------------------------ in this macro invocation
;     |
;     = note: expected raw pointer `*const bindings::rb_node`
;                found raw pointer `*mut K`
; note: function defined here
;    --> rust/kernel/lib.rs:205:16
;     |
; 205 |             fn assert_same_type<T>(_: *const T, _: *const T) {}
;     |                ^^^^^^^^^^^^^^^^                 -----------
;     |
;    ::: rust/kernel/rbtree.rs:332:33
;     |
; 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
;     |                                 ------------------------------------ in this macro invocation
;     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)
; 
; error: aborting due to 1 previous error
---
Changes in v2:
- Wrap in `if false` to improve unoptimized codegen. (Alice Ryhl)
- Shrink implementation using an array literal instead of a function.
- Link to v1: https://lore.kernel.org/r/20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com
---
 rust/kernel/lib.rs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1df11156302a..6fbd4cc5afff 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -198,9 +198,14 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 /// ```
 #[macro_export]
 macro_rules! container_of {
-    ($ptr:expr, $type:ty, $($f:tt)*) => {{
-        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        $ptr.byte_sub(offset).cast::<$type>()
+    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
+        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
+        let container_ptr = $field_ptr.byte_sub(offset).cast::<$Container>();
+        if false {
+            let field_ptr = ::core::ptr::addr_of!((*container_ptr).$($fields)*).cast_mut();
+            [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) == typeof(`$Container.$($fields)*`)
+        }
+        container_ptr
     }}
 }
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-b4-container-of-type-check-06af1c204f59
prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

