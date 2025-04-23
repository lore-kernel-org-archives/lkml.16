Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4700289373;
	Wed, 23 Apr 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430016; cv=none; b=VdcxU8Hfmjsor2fMQI6nvAPhu2xS/7sUBA1lQ77LmhtHEB7YI8UC50UsEA/yY6Xv5hjaMSW5NqCWtuT28L6Dx00aW1kaZ6ITFzOehWcOCGSlE6qVAGS9xakT25rSLKWnhy1USjYgpo2cNAuNlNTx5L68el3c6L1FF80XE30Boow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430016; c=relaxed/simple;
	bh=OR0n/3/0SmMCWXziQHt1X6FyYICVi3Ve5hD6lfUhL8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aFbWpuq2XlPiAY2pwfKu0mVBKcI1/VdZJdS8b6uxAruW97+XFluv72PIZiR7XO7ujXaf8rSW5Ubj2awigD1o3YH2/tOB/jV5ZMpGfO1yf/7MlIUxlD9HoqTqlaRrHCgwxKopcYhY+0fw1uG7krhWGV6EUIWFfWqjhNSQCHoDVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwMDO/oK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwMDO/oK"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c554d7dc2aso10733085a.3;
        Wed, 23 Apr 2025 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745430013; x=1746034813; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjVNoM2Lfb1Eviskr184KQVBB6NVt+pSj4xXQ8Q2GA4=;
        b=MwMDO/oKu2RIiiiNSRcGbwQMUxQIUIszZQrvqUTDCfXsXuG0sPK6CGdeRhPMneAMxu
         wJnBIJcdEeeRXujg6z+pM3KB2SUCKHrbMYBHx0EPRLw2qxKJr8pmRHvvpwYCY7THfGXl
         qrPqlIE9fX0fZPpoRtnVin41JpdTyRdFdl4xWxqvG/530TjJqwG4fmjC05BHU9vFNzZQ
         v+JZEFpJxqEIIxlWNmPnqNkF8kMhYUu3pADtmvmU7ZTNHti1VqBUMeriKEE5h9dfaKrZ
         GFfSNRdmEif4y3Xfp3clQpaSia4AQHbC/NG44jvTPmRfkMyRoTs7z19t9pXbY0iqjKRf
         9s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430013; x=1746034813;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjVNoM2Lfb1Eviskr184KQVBB6NVt+pSj4xXQ8Q2GA4=;
        b=dJkRYDkwNnObEtHsWZ4pFCeU++vkb8myW/Te7u5ahNWeweS9prC/vk78nlyAEbUMkl
         yQQA0ER/zxtH6mUGF7oUsFLFbr1lV28RIPBHeXRUXazfoxlaSm1RFIiReOWQPZtfUdZX
         nbtNwRQpl3xU88yeX2UbVRf7jju//Q9N07E8qOtHP/9UKtUcm6wmNO+wX+37LMFHgzLq
         xkGgSu9xr522+17wYT6Zuc2K+d8F3FX4yADfn8h5/mOQ0Gqicbn0Uj0mPzG3D6eVgMjM
         Bh4lwdXeYHI//l1aAmz2bWSLS7W8S6LMQKze9Ulp9VaVaOqyryfZ57O6OG6/wHKy1b3K
         l4yg==
X-Forwarded-Encrypted: i=1; AJvYcCX6xPhclBsrDIxHx1P8IPF22wbsYUfKfTgxmKZQsfJ6psphlSYKCR45Jy1arS0Zq3cj7hfq5YJsiCVJm+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzotkdD7gDAoD6vVjJOXLwTeAW34bHZzCbw3Lx/NXtEk7fAGInm
	q5bSuLzxSJih95Es0kf8QZSiIHjauh+w6jGKt2aHEJLXRvRIGfwMk95FvjJoPd0=
X-Gm-Gg: ASbGncuvLTXK7XVTpNKtUQEhBGzrFbXJIOEpcoOauJGbaorLEatl8ci6sAP7BY3hNQ+
	Es99EGpjha89iAtL19PJKrnDTuRAqM9NOXdgsAdj6YdJjvcG1Ek8KxGTKKxon/QHLlKcaJV/kmO
	vq3QkINW1Qm7QhzBjbD/Jt5BVL90ro2UaACryE1Qk2lfLzxT7GDBb5uL7GWMdvgQ4sBaJs2j01U
	d3HoK3H1Hlbl6dlWl+PApLl2J4gah+jNebcm8EYm902RDti8umEpY6yw+VjWs8RCM0FrkZJu9ZF
	oHO/RpMepLDKNgiBfVFwnfqoD2TqDjRjnn5x/ue6AbDlWQNBDY2hEyFIBX+eEMsANrFX8xvhQE1
	45wgt2FUB5CmCsV/vTQXPeQUJ8N5yIhRXmgn3ADE8d3BL7bwvXEhdqMw=
X-Google-Smtp-Source: AGHT+IFSEqiZ+MpXIObZnn1Vl8zHXVXIhjGxgdhUIzGsE+VQNE2aP1a6lknKTWm8dkMyPWBRm/9TLg==
X-Received: by 2002:a05:620a:4146:b0:7c5:57cd:f1cb with SMTP id af79cd13be357-7c9280196f8mr3271770085a.37.1745430013061;
        Wed, 23 Apr 2025 10:40:13 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:e2b6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6eb8fsm709718685a.8.2025.04.23.10.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:40:12 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 23 Apr 2025 13:40:10 -0400
Subject: [PATCH v3] rust: check type of `$ptr` in `container_of!`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPklCWgC/42Py27DIBBFf8ViXSoGMAWv+h9VFzyGBLW2UyBWo
 8j/XmJv3E3V5b3SnDn3TgrmhIUM3Z1kXFJJ89SCeOqIP9vphDSFlglnvGcSgDpJ/TxVmybMdI6
 03i5I/Rn9B2XKRvCcydgb0gCXjDF9b/C39z1n/Lq2H3UvibOlHc/jmOrQMRt5VA7BSa5B6N4p0
 N5pZYORCgMGpo31mhzdhm43Y+a31nitE5ZCHfQiWCeF1mFYgDw8zqnUOd+2za16iPxn3gIUKNN
 ccYzqxZv+9TTa9Pnc/Dfswo8o/ieKN1QU3hsjpAfFjqh1XX8AI4ncd5cBAAA=
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
>    --> rust/kernel/lib.rs:207:25
>     |
> 207 |             [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) == typeof(`$Container.$($fields)*`)
>     |                         ^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
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
>     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)
>
> error: aborting due to 1 previous error

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
I also considered an implementation using a function, but the resulting
compilation error was not as concise:

> error[E0308]: mismatched types
>    --> rust/kernel/lib.rs:207:42
>     |
> 207 |             assert_same_type($field_ptr, field_ptr);
>     |             ----------------             ^^^^^^^^^ expected `*const rb_node`, found `*mut K`
>     |             |
>     |             arguments to this function are incorrect
>     |
>    ::: rust/kernel/rbtree.rs:270:6
>     |
> 270 | impl<K, V> RBTree<K, V>
>     |      - found this type parameter
> ...
> 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
>     |                                 ------------------------------------ in this macro invocation
>     |
>     = note: expected raw pointer `*const bindings::rb_node`
>                found raw pointer `*mut K`
> note: function defined here
>    --> rust/kernel/lib.rs:205:16
>     |
> 205 |             fn assert_same_type<T>(_: *const T, _: *const T) {}
>     |                ^^^^^^^^^^^^^^^^                 -----------
>     |
>    ::: rust/kernel/rbtree.rs:332:33
>     |
> 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
>     |                                 ------------------------------------ in this macro invocation
>     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> error: aborting due to 1 previous error
---
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
 rust/kernel/lib.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1df11156302a..d14ed86efb68 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
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
+        if false {
+            let container_field_ptr = ::core::ptr::addr_of!((*container_ptr).$($fields)*).cast_mut();
+            [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) == typeof(`$Container.$($fields)*`)
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

