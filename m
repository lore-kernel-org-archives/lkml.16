Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4D4C9D;
	Thu, 29 May 2025 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748524300; cv=none; b=hqJxpRCkRAB+8SblxT7WPAbdkcvfJF+7Cf6+66lPF9CN3P9SeB7CI1OSnCxTslFPfznzKr0nk3SsIeE2DsiuVACCU+qnWXXAqims6DLuuVzEitEn9Vp/uT972RUsuhmsHfxMtJgSAT87Ja+dfNpPlHhHtjUPijs+ZfrioFDlJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748524300; c=relaxed/simple;
	bh=pAHm8kLL6/HzNNEgNKcADiPTcuDWGNT4lSzUIu8Xuis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VKDE0NLoaWdiSfKAAsayk365guxrygjjDIpczdjxYEfqcJRHpHAagx9YduK+THQfNV2Ii9w5TBN74m7W98lNzjWgBTMDhWkHBbGB8EYTMP3jVUOCDfp6FuTARoyN1faBHmSQkxaJQLh9cBMwt9xk2N7K4NBsxBiOeK9vMkBKRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpuXfs2N; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpuXfs2N"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2e8f394bb75so546416fac.3;
        Thu, 29 May 2025 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748524298; x=1749129098; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gipTc9gG9OTWsi8IsUMC22RPpNY0+xJl6Qx9OIa5qMs=;
        b=OpuXfs2NRnaeBS8aaTHfltmyLs3CMn5MwuJOFNKP2iFhjMOXc16u5cLwGvObgwjIg8
         T8Bskz0AvSCgL5+IyMqTnZbB9e0DHYGCYPqTDtnM/wehzMjWrpd73SHMKMb7dqH679hQ
         CLsKfCzN9lWd6QbUw4QDr4EvaFWnB+ywukwZ/0KLUuJG5d9iu255LZRGPVuyMKDa3WPl
         OLnI33CRsjx3be1iB7uKQSV3wmBII99Q+HL0vLPDyULnqKg8hnjxjtO+NOp84oJK4sdP
         /hXjL4c5erCVJSBOrnER5pIU6VyA7iauJ9PyiZ6SUGUaXmE7qJu31QmA4RYFt/oUTx0F
         axAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748524298; x=1749129098;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gipTc9gG9OTWsi8IsUMC22RPpNY0+xJl6Qx9OIa5qMs=;
        b=w2BVBlv833AGfZlK79HeWWcksHcSKq6AYL6Q0hzMOSSzK+B6IC6pWUd/P4ME6CRhm1
         a5dcIhSJJ/qzMidRa30Xwi81/PTYA/8t2zbouHvmh6sXsixy8bGYDSzjgvLJdekA3JlX
         Q8KGHgd8YzsYk/WGeQUkm+VN+VMBe0mYU99Ba/lJnxsQGp+yHk/bEeI8jUeBDoXIi1iI
         7elSB6GgmG0HlO9VzYkVCuwhbv2vRapmCtQ31D2ebYxL72B8+ZdPqi3MoFaQBo6b3YK4
         ZKcmHHh39vKQP9o5RtidhhxqXenjzPpIJEeSDo/aVBIvvAyQfP6qwVqnOADULb+em5d1
         MZvw==
X-Forwarded-Encrypted: i=1; AJvYcCUBAEAVseWbLpHYFLkPqsADFbZD3riQGkZ947aY3LUKvzSrM4MYKZW4ktmLcHfat9wXoAsqK0p1TY38Rdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhVfmJc6NQh58uccUNXvYqleWl1kSkjwZK+yTt1zG0yko3Puca
	b2zDRxBw1DmSbkNBuwPAAhcoG8DQCZc6f9Kkmbt/tTLKGRwl8qyfgVXR
X-Gm-Gg: ASbGnctS3jCxqj1gVGsk4APZOyvWkDvL57JRnRf//sgqNs9gV9vK882c+HECIVFSyyk
	Gz1YsxRBQW1cKwKElLhpr1VMF1n598SRjAk4IdRyEEb3ydxzGETpmS20/kSAriiN89ItE4xNkbX
	HDwVdW5O27np7Wdp0VM1cJ/2cJwEmElE65JF7mqymPbEtH9niqT1sDqNCckzDNor1m3QpAVwJ3B
	vwijMn/zhhPi4ZoRYS2Y2btTrBc9ZCoH7GTzAcrXUEr+mkQnDYFj605ielHzH8pRLwAYA0OCaEp
	WOy+h4how3KBx+t4nNR61ArKMOJxHgD0u92WmFhN33BR8QVx+LdDeDBlE0JZFg01DkXIWpzy5Hx
	uXFQ=
X-Google-Smtp-Source: AGHT+IFc/B/vznZAgZBgsQyaPD9KJY7CjOvmovS4FANADphZSXHLFV2edRtXwOnILi6Ope1vottbQg==
X-Received: by 2002:a05:6871:5e0b:b0:2c1:6948:d57c with SMTP id 586e51a60fabf-2e86219c64amr11166660fac.28.1748524297616;
        Thu, 29 May 2025 06:11:37 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:da0:d9ee:5c71:a02a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3258sm91831985a.12.2025.05.29.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:11:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 09:11:33 -0400
Subject: [PATCH v4] rust: check type of `$ptr` in `container_of!`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAARdOGgC/43OzW7CMBAE4FeJfO4ie/0TzIn3qHoIy5pYlBicN
 CpCeXec9NCoB9TjzOGbeYiec+Re7KqHyDzGPqauBPNWCWqb7sQQjyULlGilUQoOBih1QxM7zpA
 CDPcrA7VMZ5CuCYpQmmC9KMA1c4jfC/7+8ZMz377KxvBbtrEfUr4vB0Y1t//aGhUokFt0yMHV5
 O3+dGni54bSRczsiGsKX1JYqKCJvNeGlJN/Kb2iUL+kdKFq7w1ZR0Fbv6amaXoCjaSJFW8BAAA
 =
X-Change-ID: 20250411-b4-container-of-type-check-06af1c204f59
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
Rename those placeholders for clarity.

Given the incorrect usage:

> diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> index 8d978c896747..6a7089149878 100644
> --- a/rust/kernel/rbtree.rs
> +++ b/rust/kernel/rbtree.rs
> @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, V> {
>          while !(*child_field_of_parent).is_null() {
>              let curr = *child_field_of_parent;
>              // SAFETY: All links fields we create are in a `Node<K, V>`.
> -            let node = unsafe { container_of!(curr, Node<K, V>, links) };
> +            let node = unsafe { container_of!(curr, Node<K, V>, key) };
>
>              // SAFETY: `node` is a non-null node so it is valid by the type invariants.
>              match key.cmp(unsafe { &(*node).key }) {

this patch produces the compilation error:

> error[E0308]: mismatched types
>    --> rust/kernel/lib.rs:220:45
>     |
> 220 |         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
>     |         ------------------------ ---------  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
>     |         |                        |
>     |         |                        expected all arguments to be this `*mut bindings::rb_node` type because they need to match the type of this parameter
>     |         arguments to this function are incorrect
>     |
>    ::: rust/kernel/rbtree.rs:270:6
>     |
> 270 | impl<K, V> RBTree<K, V>
>     |      - found this type parameter
> ...
> 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
>     |                                 ------------------------------------ in this macro invocation
>     |
>     = note: expected raw pointer `*mut bindings::rb_node`
>                found raw pointer `*mut K`
> note: function defined here
>    --> rust/kernel/lib.rs:227:8
>     |
> 227 | pub fn assert_same_type<T>(_: T, _: T) {}
>     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to match the `*mut bindings::rb_node` type of parameter #1
>     |                         |  |
>     |                         |  parameter #2 needs to match the `*mut bindings::rb_node` type of this parameter
>     |                         parameter #1 and parameter #2 both reference this parameter `T`
>     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v4:
- Revert back to v1 with assert_same_type extracted out of the macro. (Miguel Ojeda)
- Drop Benno's RB since the implementation changed.
- Rebase on rust-next.
- Link to v3: https://lore.kernel.org/r/20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com

Changes in v3:
- Fix comment typo.
- s/^;/   / in commit message and cover letter. (Miguel Ojeda)
- Evaluate $ptr only once. (Alice Ryhl)
- Link to v2: https://lore.kernel.org/r/20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com

Changes in v2:
- Wrap in `if false` to improve unoptimized codegen. (Alice Ryhl)
- Shrink implementation using an array literal instead of a function.
- Link to v1: https://lore.kernel.org/r/20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com
---
 rust/kernel/lib.rs | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 909d305d0be8..b69b345ab778 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -213,12 +213,19 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 /// ```
 #[macro_export]
 macro_rules! container_of {
-    ($ptr:expr, $type:ty, $($f:tt)*) => {{
-        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        $ptr.byte_sub(offset).cast::<$type>()
+    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
+        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
+        let field_ptr = $field_ptr;
+        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
+        $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
+        container_ptr
     }}
 }
 
+/// Helper for `container_of!`.
+#[doc(hidden)]
+pub fn assert_same_type<T>(_: T, _: T) {}
+
 /// Helper for `.rs.S` files.
 #[doc(hidden)]
 #[macro_export]

---
base-commit: 1ce98bb2bb30713ec4374ef11ead0d7d3e856766
change-id: 20250411-b4-container-of-type-check-06af1c204f59

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

