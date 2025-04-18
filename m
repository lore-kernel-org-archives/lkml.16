Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0391DE2A4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940523; cv=none; b=tVHhkFmacFzS7WtcaCWXlHYYvuaViibczFReLQhYU4arFTpHDYYokmY4kac6C5UZ0Wodz/ISLqA/epaE7TrYO5+X6/2vggynbJhK+pHkvGncck8wL6tX6l09UnJU337fWJlZ8eE/DixN40sKroOBr4e4j+JwspSwVlrDswN4pxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940523; c=relaxed/simple;
	bh=kom6gDwOvQlLWIY64LaKg/88QJeZpSqlKMB0/S7dG0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdHwi1+nPm8wqsTaxRtUgZjd/3iqKwp4JOmEAu0LKu61JfI46ngBwEeNWp/ia2Qbses3Wys2H+gj3EnamJttKlV68ToNbt5BicS0EeqvcRxpRQfICQWjaytm4GcXQk9I48itozU0gDglT9d0hjxB7FD+nGGA2evWI4wPY0DVyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=O3/7knAw; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="O3/7knAw"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7043db8491dso13820167b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940519; x=1745545319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vZX6b4dOJQJVisyqBob3mx0+uYLldeHEIPiM/4owQ0=;
        b=O3/7knAweN67wPM4h5vOM9kmaVScSrD/GDJVfuqRJ/GfSzPFRbgbwoLVS6TO3u22I3
         sAX7JbbcQb7PMdv7dbWLZuF1uoJNLTkCkGDENR3p/qa+//24xzUA71r2m0U3ghWZpgii
         tVAvgKVUUuQylQ1vCXCjHFcw/38VblmJovoCatcZk3RGpIhnoSvMHEwjaUeZZ+DXT1qN
         L358GdaQHHBqOS4xQCUBus3g4w/8/hZpUfQPw+5mnB8/pkdfI0SwQZDAVwQlZes0cinN
         O+n2vqfAPoLrJO1ouep19XuQPO/+85V3TZErPNpfz8A/agaMfYcEducpF0308sbbkKpK
         7Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940519; x=1745545319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vZX6b4dOJQJVisyqBob3mx0+uYLldeHEIPiM/4owQ0=;
        b=PEEnucQ+903LaQ1AVwqqYC59ANpvx42t84kugkY0dJrCGZ+eZ+IE9lzilFF/BYK++4
         mJM683Ud4OlBW5SFGupeI6sKxOcNJ5y7Eh/+tW0bY0b8vGHMJKH9Flbsz3sHhvu1Q2cR
         SilNlgrciMzfyGhnaahIe77TncS2+NpDT88ATK9o3pco3nl7MtLOwYiiKKx5S4BP1397
         Bn5vI2bQqaiEu8ZoI+zYMhEKmiUzqNkIaCfa25T2Nk4LG+369l8B4bYsxHO3pznCzFpV
         5w0om7VC1vkXbAj5bgDiTCtgispubBAUgTNyTGd81r1UjBR+40Sk2K6jI4apAJkOp7Z2
         Jczg==
X-Forwarded-Encrypted: i=1; AJvYcCWb5xk+RJQWvIBR1R5xrQd8ZqclDnBmIkKiAnAjfZeWYzs3OVGgCG+R2GzV3bMgCgnOR4oXer3Up0fVm/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ugjllAWphUk4+AfWpNsGOh5w4+XB4/Ad1nP9ycvNcTLlWm0D
	f7IPQgHuLJR2WRQH4zXNr048CRzai5u8i2PgZz3B2Bhqmuo+e8vhnyvq2qaUJyw=
X-Gm-Gg: ASbGnctVlCasElGKjfhK/e1VH2zmkExRH6C/5FO4A0qMXNw3qadP6khXtiF9uINZMYw
	Z8UxS6it1XM4uG39bvkhtvZV4L9wQRfMuM+9cnEPkhNUzZJfVOlmb2hBqm4J7+vazQ3vUhDmjdS
	aLZFrHqprJKIotJMewy80xynL25V2vzx5fyabY7E4+utclEYoc2OkU9gykaeQCz1o1IehpdEqgZ
	8Xupa/7N5JKD+GXwIz6W9S/Qr507/8oRLYyjW+6KCyT5MmUeoeBZmpnmSgCWaFVKRv9y+0lybXW
	QpmaT1Pyx5WfZqnlhJqI0uUwHtIdjJdNViXwkD0+AJUu8FBkkS8AmQhdSzNONgLlRv42KeaTSjh
	1npOQFT6T2/6zVm3os4Nw+p9XIKSveeekOcS3qWwUl6GEVj8=
X-Google-Smtp-Source: AGHT+IHKWD99S0F6KCgIeVvybd53+ijSAXdB3OgMVFyeT/tM2oA/5o0gqeKoz8LgS6Bcx3tB8BsaLg==
X-Received: by 2002:a05:690c:3685:b0:6ff:1fac:c502 with SMTP id 00721157ae682-706ccce2277mr16272657b3.6.1744940519476;
        Thu, 17 Apr 2025 18:41:59 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:41:59 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Benno Lossin <benno.lossin@proton.me>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/18] rust: init: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:22 -0400
Message-ID: <20250418014143.888022-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/init.rs         |  4 ++--
 rust/pin-init/src/macros.rs | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 8d228c237954..5646b1079776 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -69,7 +69,7 @@
 //! ```rust,ignore
 //! # #![allow(unreachable_pub, clippy::disallowed_names)]
 //! use kernel::{prelude::*, types::Opaque};
-//! use core::{ptr::addr_of_mut, marker::PhantomPinned, pin::Pin};
+//! use core::{marker::PhantomPinned, pin::Pin};
 //! # mod bindings {
 //! #     #![allow(non_camel_case_types)]
 //! #     pub struct foo;
@@ -105,7 +105,7 @@
 //!         unsafe {
 //!             pin_init::pin_init_from_closure(move |slot: *mut Self| {
 //!                 // `slot` contains uninit memory, avoid creating a reference.
-//!                 let foo = addr_of_mut!((*slot).foo);
+//!                 let foo = &raw mut (*slot).foo;
 //!
 //!                 // Initialize the `foo`
 //!                 bindings::init_foo(Opaque::raw_get(foo));
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 361623324d5c..28a91a1e1218 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -244,7 +244,7 @@
 //!                     struct __InitOk;
 //!                     // This is the expansion of `t,`, which is syntactic sugar for `t: t,`.
 //!                     {
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).t), t) };
+//!                         unsafe { ::core::ptr::write(&raw mut (*slot).t, t) };
 //!                     }
 //!                     // Since initialization could fail later (not in this case, since the
 //!                     // error type is `Infallible`) we will need to drop this field if there
@@ -258,7 +258,7 @@
 //!                     // of the `unsafe` block, so we bind it here.
 //!                     {
 //!                         let x = 0;
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).x), x) };
+//!                         unsafe { ::core::ptr::write(&raw mut (*slot).x, x) };
 //!                     }
 //!                     // We again create a `DropGuard`.
 //!                     let __x_guard = unsafe {
@@ -459,13 +459,13 @@
 //!         {
 //!             struct __InitOk;
 //!             {
-//!                 unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).a), a) };
+//!                 unsafe { ::core::ptr::write(&raw mut (*slot).a, a) };
 //!             }
 //!             let __a_guard = unsafe {
 //!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).a))
 //!             };
 //!             let init = Bar::new(36);
-//!             unsafe { data.b(::core::addr_of_mut!((*slot).b), b)? };
+//!             unsafe { data.b(&raw mut (*slot).b, b)? };
 //!             let __b_guard = unsafe {
 //!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).b))
 //!             };
@@ -1215,7 +1215,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         // SAFETY: `slot` is valid, because we are inside of an initializer closure, we
         // return when an error/panic occurs.
         // We also use the `data` to require the correct trait (`Init` or `PinInit`) for `$field`.
-        unsafe { $data.$field(::core::ptr::addr_of_mut!((*$slot).$field), init)? };
+        unsafe { $data.$field(&raw mut (*$slot).$field, init)? };
         // Create the drop guard:
         //
         // We rely on macro hygiene to make it impossible for users to access this local variable.
@@ -1277,7 +1277,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
             // Initialize the field.
             //
             // SAFETY: The memory at `slot` is uninitialized.
-            unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
+            unsafe { ::core::ptr::write(&raw mut (*$slot).$field, $field) };
         }
         // Create the drop guard:
         //
-- 
2.48.1

