Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDE2153E7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940569; cv=none; b=eKT0aubEoyOirwFZDX+NU6XXZUqXKngIrslXu+xv5M0wO0Cqz3r4QhCSQ7cO8uNcw42zj2+WMYwiMR3QZshNq8fgqV0litETTI+p25ggY7Exo3NzCYLiOHywUa82Z3v3lBdoImlTGwuXflAELBRlLgIT+PKalKga9gL9lngX40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940569; c=relaxed/simple;
	bh=66w5Al5Imrsz5hvbCFFqfSu+FK8G3lQg6TXeGP8s+iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDbT9F1TfvBAN+WN7OJNkzxUr4bfs+JSZGgGCKKUTVsWyEILNPpMLjs21mgZSsfYxYudrXaJSMv4sPwmOemOzyP/wWpDqp50UPXFq1F+5jlLJQIVHX06oNyJW+LL0C5FIKL+lIKPwZb5MG+ECRasgtzqhRbP49ROQ+PUOOKK2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=1igMc2AJ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="1igMc2AJ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f768e9be1aso26760637b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940566; x=1745545366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG1FX1ranOgzfEQWfQ6ONypjLKpYZeGLhyGYRDWOj0I=;
        b=1igMc2AJhXZytcEi0Tm8WpAFNb5dsOc37va7CM+1KcYzvKQabzOYtvFni6XCJMhXMK
         m/YkUbq6n7CRvHRJoSIU37LinIctE/Jm6aHqXH3wYDwX1/rWDBnupNYT6728jMkNBpK4
         EPmpHG19KKrP77KKWE5Bxuf5X0fDCZx56RyugTalENW+izZqjm5IWM61pvbQN5rdEoh6
         1fOhedm0ebK5m2aV+rDMBnZNZRLW5k9kvt5rrkHhMUVnqJjE5Xmf1bOwTpMdICE5XSe6
         gI3YfVqanRYEZcQGeoiH9Z4MJr/GN5OzUtnEh4YCcNeoVohCiECy67dGkuXxgeDQZVJ1
         1onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940566; x=1745545366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG1FX1ranOgzfEQWfQ6ONypjLKpYZeGLhyGYRDWOj0I=;
        b=JwiSbabe7b5Kl66OVrRJUJ7fLmI01HZBfaVQs2MjbLrFg1jFIQUaMPCBd6A8EHZz23
         22NW2W4AaAG9n31MppYjOTSR0RjEeJd0J9AlX/jq5/xTCjNskLza7SzNTiasfZS/SzC6
         uu7vgLfJ3Dbw3yikP1I3A0aA9U2VVeCtCxIfo/k91GlBW3lFGbTz26II+5Txr70QtSFy
         YWrcez0MR0B2jDsxQ/FbCMtKNgSN3ZWc/VyHF5EMSv1wrYV7nfDG39MyK9mzhm00bCF2
         9WV8Co2MkVa0dxIqYMcypOBvi82JElM/OWyXnpSUrdX4dyFE+wmaTpUjwwpOCA6X/MJL
         JmWw==
X-Forwarded-Encrypted: i=1; AJvYcCUickhU62VdTailyXkYwdW2vfxfPFeYUpbQiUTaKFTYL5TItMrZqA9XLdKn0oGaJWn027u841SxqviBPIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHKSY3BcV5kLih/oDKiaPrmvJwpEOeRArOxmey7VYXnl2FXvh
	K3Fyppt8/pYixq9B773bmebJbWMsA08w2Fya/rlW6P+ZtOGJYgeDmd4awSOTeDk=
X-Gm-Gg: ASbGncup8pe38+m32sbLkO63EzmudIsl3Zr9hauKre3Pb36vF6hhy5FtzGwMN1vZi78
	qUUsr9jMimLQiRIYdaPSFny8z34/XgNwp9T1A0TjoT41Eq6SyiZxOczOJGZqAhRYk+3KUIYLbEq
	3V3jsdgEHrRmT5/HeueeCZf2RE5D0L8HVfH23QVczL/BtCp49QyKo7rDhDynAOCN6GzGTu9tiW7
	FCNfOKOPt2Dk3QOfHvXHsjv6vvJ85lhA/QhUSOEBu6DK2I9tIYpuOyKXoxHxOgNbr+wuKogvGFj
	BVD/FAkZ2oVpHta5GX81+6hJse3QgWZiG0mQ9nq19a1HrqffdkcDpsktoUDJpl+RfAat+47VoVa
	Ee8NYqyv6ibeaheFQ4Qs2dPL9WpZqV3U1lJ1B
X-Google-Smtp-Source: AGHT+IEQ0mGUH9sjetr7NY5sXJ8/VLVK70qyuSik19yD6EJGi5DmNmFBRWOM9b05eHxeXtZYr+xuDg==
X-Received: by 2002:a05:690c:940e:b0:6fe:4ee5:a6d5 with SMTP id 00721157ae682-706ca335ad7mr34942287b3.0.1744940566187;
        Thu, 17 Apr 2025 18:42:46 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:45 -0700 (PDT)
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
Subject: [PATCH v6 17/18] rust: pin-init: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:38 -0400
Message-ID: <20250418014143.888022-18-contact@antoniohickey.com>
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
 rust/pin-init/README.md     |  3 +--
 rust/pin-init/src/lib.rs    |  7 +++----
 rust/pin-init/src/macros.rs | 16 ++++++++--------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 3d04796b212b..1ab4ad0144f3 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -142,7 +142,6 @@ actually does the initialization in the correct way. Here are the things to look
 ```rust
 use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop, pin_init_from_closure};
 use core::{
-    ptr::addr_of_mut,
     marker::PhantomPinned,
     cell::UnsafeCell,
     pin::Pin,
@@ -181,7 +180,7 @@ impl RawFoo {
         unsafe {
             pin_init_from_closure(move |slot: *mut Self| {
                 // `slot` contains uninit memory, avoid creating a reference.
-                let foo = addr_of_mut!((*slot).foo);
+                let foo = &raw mut (*slot).foo;
                 let foo = UnsafeCell::raw_get(foo).cast::<bindings::foo>();
 
                 // Initialize the `foo`
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 05c44514765e..36391738835c 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -166,7 +166,6 @@
 //! # #![feature(extern_types)]
 //! use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop, pin_init_from_closure};
 //! use core::{
-//!     ptr::addr_of_mut,
 //!     marker::PhantomPinned,
 //!     cell::UnsafeCell,
 //!     pin::Pin,
@@ -205,7 +204,7 @@
 //!         unsafe {
 //!             pin_init_from_closure(move |slot: *mut Self| {
 //!                 // `slot` contains uninit memory, avoid creating a reference.
-//!                 let foo = addr_of_mut!((*slot).foo);
+//!                 let foo = &raw mut (*slot).foo;
 //!                 let foo = UnsafeCell::raw_get(foo).cast::<bindings::foo>();
 //!
 //!                 // Initialize the `foo`
@@ -698,7 +697,7 @@ macro_rules! stack_try_pin_init {
 ///
 /// ```rust
 /// # use pin_init::*;
-/// # use core::{ptr::addr_of_mut, marker::PhantomPinned};
+/// # use core::marker::PhantomPinned;
 /// #[pin_data]
 /// #[derive(Zeroable)]
 /// struct Buf {
@@ -712,7 +711,7 @@ macro_rules! stack_try_pin_init {
 /// let init = pin_init!(&this in Buf {
 ///     buf: [0; 64],
 ///     // SAFETY: TODO.
-///     ptr: unsafe { addr_of_mut!((*this.as_ptr()).buf).cast() },
+///     ptr: unsafe { (&raw mut (*this.as_ptr()).buf).cast() },
 ///     pin: PhantomPinned,
 /// });
 /// let init = pin_init!(Buf {
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 28a91a1e1218..14ab121443f0 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -251,7 +251,7 @@
 //!                     // is an error later. This `DropGuard` will drop the field when it gets
 //!                     // dropped and has not yet been forgotten.
 //!                     let __t_guard = unsafe {
-//!                         ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).t))
+//!                         ::pin_init::__internal::DropGuard::new(&raw mut (*slot).t)
 //!                     };
 //!                     // Expansion of `x: 0,`:
 //!                     // Since this can be an arbitrary expression we cannot place it inside
@@ -262,7 +262,7 @@
 //!                     }
 //!                     // We again create a `DropGuard`.
 //!                     let __x_guard = unsafe {
-//!                         ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).x))
+//!                         ::pin_init::__internal::DropGuard::new(&raw mut (*slot).x)
 //!                     };
 //!                     // Since initialization has successfully completed, we can now forget
 //!                     // the guards. This is not `mem::forget`, since we only have
@@ -462,12 +462,12 @@
 //!                 unsafe { ::core::ptr::write(&raw mut (*slot).a, a) };
 //!             }
 //!             let __a_guard = unsafe {
-//!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).a))
+//!                 ::pin_init::__internal::DropGuard::new(&raw mut (*slot).a)
 //!             };
 //!             let init = Bar::new(36);
 //!             unsafe { data.b(&raw mut (*slot).b, b)? };
 //!             let __b_guard = unsafe {
-//!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).b))
+//!                 ::pin_init::__internal::DropGuard::new(&raw mut (*slot).b)
 //!             };
 //!             ::core::mem::forget(__b_guard);
 //!             ::core::mem::forget(__a_guard);
@@ -1223,7 +1223,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         $crate::macros::paste! {
             // SAFETY: We forget the guard later when initialization has succeeded.
             let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
+                $crate::__internal::DropGuard::new(&raw mut (*$slot).$field)
             };
 
             $crate::__init_internal!(init_slot($use_data):
@@ -1246,7 +1246,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         //
         // SAFETY: `slot` is valid, because we are inside of an initializer closure, we
         // return when an error/panic occurs.
-        unsafe { $crate::Init::__init(init, ::core::ptr::addr_of_mut!((*$slot).$field))? };
+        unsafe { $crate::Init::__init(init, &raw mut (*$slot).$field)? };
         // Create the drop guard:
         //
         // We rely on macro hygiene to make it impossible for users to access this local variable.
@@ -1254,7 +1254,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         $crate::macros::paste! {
             // SAFETY: We forget the guard later when initialization has succeeded.
             let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
+                $crate::__internal::DropGuard::new(&raw mut (*$slot).$field)
             };
 
             $crate::__init_internal!(init_slot():
@@ -1286,7 +1286,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         $crate::macros::paste! {
             // SAFETY: We forget the guard later when initialization has succeeded.
             let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
+                $crate::__internal::DropGuard::new(&raw mut (*$slot).$field)
             };
 
             $crate::__init_internal!(init_slot($($use_data)?):
-- 
2.48.1

