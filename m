Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB01D8E06;
	Sun,  2 Feb 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498865; cv=none; b=DRc5f40JVbu8/1rcLbLMUx3Wkh3IfE/2dQiFWaHZ+G2Zm0BmQqjN3fVGzgUYvURIvJ1na15yRRlnEjJCNbKUbeYGz3RbKgS2iFnsw4qc+BazfquGEn7yB+E6f1pNxzrnb/8QhKmaISFlH8YKfSxqj0+uYCrKxCPwEzE3378phHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498865; c=relaxed/simple;
	bh=fib1uX1/+Q53t8BozdsmbkTNdRoWVZldcULFsMEZ+5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRbqX49daGmrfPmbComAco2/ZumqhYjyhbht1Xji4d5Anncx2qCb8rYEuDNhu0zf7XcWN+MG1fOAOZHa/LBW3mjHLKwjut9vNhB9dHXaJfLAEmdG04SeCtk35YAiG2YwT2Bo8nidJM4P8P+KMmHSdA5yBtESxuOoU6l7Imez73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvqcpPDz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvqcpPDz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679ea3b13bso26871101cf.1;
        Sun, 02 Feb 2025 04:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498862; x=1739103662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g6gtSKcUxkH8qKz2jbrcHHqp4PjorJ9+k1lKKqeQMw=;
        b=JvqcpPDzmBoQP9Hk7xsUf6p1AOpwxZyJljV93t47dHX9it+pp5faCZBIKrpp3j15gI
         xq014jNOiULoVLrXy3r6SmFlmQc8nYFriGfZy642UANJrjfeWXURhkqi4LVwIti9k06x
         kaiH0K/Qts3Aa/YjUhTnMB5Vt3a2gjQBQ/FdYO9KStLahOtsXgoqA+xT1XUDX9lBY0Qo
         d4EJQUHy0rGR091H08REX2I0OKIzwheP5aVeFehvnmTUvHXHXfE4VfnC2Ab6jo3GLlt1
         XDJxT6kWz38FqlkLXVml+Z6ysh1X2h8Xo8w9EtVymO8kQjevN6oYTc7y2HKS5wnsvv34
         0hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498862; x=1739103662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g6gtSKcUxkH8qKz2jbrcHHqp4PjorJ9+k1lKKqeQMw=;
        b=g1pPeIg6/Nao4SaY5YbLKcfMFvX59tnXWVmWZspwyk8BgL95bcS4TbaBiR2bCxDKDq
         uwnAWpAh1xmvbigcNzTGVMZ5yV8XIq/LXLrcLDYMgrhPleseOTGscgq0KcOB5drdVl3k
         c04RZTJkCCeBWWAnAUzYdN+rrQRD2clRWUXtfvDAbMt9uneCKzR+zvSYBpY8mmSQZSoC
         HyhTjZqFhWyh7XEIDtjPaII8889xhtv7q+dGLHGsrnTVSpW3xzJUK9H4dr1g6+rTYAmR
         gOZJPrGBFeVcYKyRTgwbyajOoYAoyXqwgAAaDE3YoRDDvTVHlNcRdQasL+FZ4URlUXiA
         AeJw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSv1VRVqeBnngUTWFJXVo1LJQGEm5wwhyh0BsSLZEIcrRBaM4uOMyzdT1zZqS/1yo/V8ryJ8ADcVWb3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeKHYEce5+OfDT3YjmKlbDgAv1p8deA1g2T36QxmNH2y+SRnx4
	pH+IMyhaNIsqUqaFaJaZJ70QsG8fjHY0iPSO3g6f+U57SynfNgWS
X-Gm-Gg: ASbGncsfubbsC+HYoWJyiDaKf1IyPROlwcdhpZ46lun1ibLBtC3OT1wZsk2MpbQx8+Z
	fBphqgJ49sKNtkuSOJqAmIaynueDM9SPTqSPqYTM1P0GVRYd8ZErqRmKwvfxljg9ECsTMc7h4x5
	3F0Hcpw/GvLC04Gk0RjEfITHweBHRzYBd+AKQ8h0snMX5hh7O2mOSOCG0mPmdy/kaoOZUKoP//I
	4dx6ivSqa3e3t6KIKBQreydJ0Dp8tgJcSHOxN6/kmO45UsA+En7W3WddcB1i2AHJUV+zKlRMhdI
	ihBU9WU3brvD5JVphC4tRGoPpgx0mZm89jIV1mY=
X-Google-Smtp-Source: AGHT+IEFX4kPMFPg923mk3HKqf69D7qvxF/Y2I7YNF9tMIuf0nBcbi5czyAQt4HXueTSZ7xaP70Ejw==
X-Received: by 2002:ac8:6f17:0:b0:467:53c8:7570 with SMTP id d75a77b69052e-46fd0a1e874mr347038681cf.13.1738498862352;
        Sun, 02 Feb 2025 04:21:02 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728efsm37700331cf.62.2025.02.02.04.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:21:02 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 07:20:49 -0500
Subject: [PATCH v6 4/4] rust: remove core::ffi::CStr reexport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-cstr-core-v6-4-8469cd6d29fd@gmail.com>
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
In-Reply-To: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Clean up references to `kernel::str::CStr`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/error.rs            |  6 ++----
 rust/kernel/firmware.rs         |  3 ++-
 rust/kernel/kunit.rs            |  6 +++---
 rust/kernel/miscdevice.rs       |  3 +--
 rust/kernel/prelude.rs          |  5 +----
 rust/kernel/str.rs              | 19 +++++++++----------
 rust/kernel/sync/condvar.rs     |  2 +-
 rust/kernel/sync/lock.rs        |  3 +--
 rust/kernel/sync/lock/global.rs |  4 ++--
 rust/kernel/sync/poll.rs        |  1 +
 rust/kernel/workqueue.rs        |  1 +
 11 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 51c5e0f0a0bc..81972a8f695d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,11 +4,9 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{
-    alloc::{layout::LayoutError, AllocError},
-    str::CStr,
-};
+use crate::alloc::{layout::LayoutError, AllocError};
 
+use core::ffi::CStr;
 use core::fmt;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 93e375e75ca0..86ed79cef211 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -4,7 +4,8 @@
 //!
 //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
-use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
+use crate::{bindings, device::Device, error::Error, error::Result};
+use core::ffi::CStr;
 use core::ptr::NonNull;
 
 /// # Invariants
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 3d812edec057..f83988959257 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -56,10 +56,10 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static NAME: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($name);
-            static FILE: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($file);
+            static NAME: &'static core::ffi::CStr = $crate::c_str_avoid_literals!($name);
+            static FILE: &'static core::ffi::CStr = $crate::c_str_avoid_literals!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr =
+            static CONDITION: &'static core::ffi::CStr =
                 $crate::c_str_avoid_literals!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 2dd20e981e9b..26623d2c43c0 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -13,10 +13,9 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     prelude::*,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{ffi::CStr, marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 96e7029c27da..21fa7b3a68c3 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -34,10 +34,7 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{
-    str::{CStr, CStrExt as _},
-    ThisModule,
-};
+pub use super::{str::CStrExt as _, ThisModule};
 
 pub use super::init::{InPlaceInit, InPlaceWrite, Init, PinInit};
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 20d852aa8b3c..c96ce2640ca1 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::ffi::CStr;
 use core::fmt::{self, Write};
 use core::ops::{Deref, DerefMut};
 
@@ -176,8 +177,6 @@ macro_rules! b_str {
     }};
 }
 
-pub use core::ffi::CStr;
-
 /// Extensions to [`CStr`].
 pub trait CStrExt {
     /// Returns an object that implements [`Display`] for safely printing a [`CStr`] that may
@@ -263,7 +262,7 @@ pub const fn as_char_ptr(c_str: &CStr) -> *const crate::ffi::c_char {
 ///
 /// ```
 /// # use kernel::c_str_avoid_literals;
-/// # use kernel::str::CStr;
+/// # use core::ffi::CStr;
 /// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -273,13 +272,13 @@ macro_rules! c_str_avoid_literals {
     // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &'static str = concat!($str, "\0");
-        const C: &'static $crate::str::CStr =
-            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
-                Ok(v) => v,
-                Err(core::ffi::FromBytesWithNulError { .. }) => {
-                    panic!("string contains interior NUL")
-                }
-            };
+        const C: &'static core::ffi::CStr = match core::ffi::CStr::from_bytes_with_nul(S.as_bytes())
+        {
+            Ok(v) => v,
+            Err(core::ffi::FromBytesWithNulError { .. }) => {
+                panic!("string contains interior NUL")
+            }
+        };
         C
     }};
 }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7bf3df980433..3b82acdcd56c 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -10,11 +10,11 @@
     ffi::{c_int, c_long},
     init::PinInit,
     pin_init,
-    str::CStr,
     task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
     time::Jiffies,
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::marker::PhantomPinned;
 use core::ptr;
 use macros::pin_data;
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 16bf3014f068..7b412f5049e5 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -9,10 +9,9 @@
 use crate::{
     init::PinInit,
     pin_init,
-    str::CStr,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned};
+use core::{cell::UnsafeCell, ffi::CStr, marker::PhantomPinned};
 use macros::pin_data;
 
 pub mod mutex;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 732dde45024b..ee438654eb6c 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -5,13 +5,13 @@
 //! Support for defining statics containing locks.
 
 use crate::{
-    str::CStr,
     sync::lock::{Backend, Guard, Lock},
     sync::{LockClassKey, LockedBy},
     types::Opaque,
 };
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::{PhantomData, PhantomPinned},
 };
 
@@ -266,7 +266,7 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr =
+            const NAME: &'static core::ffi::CStr =
                 $crate::c_str_avoid_literals!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d5f17153b424..3349f48725f2 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -11,6 +11,7 @@
     sync::{CondVar, LockClassKey},
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::ops::Deref;
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 284b9a739c01..69bf6a1cba41 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.

-- 
2.48.1

