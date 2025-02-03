Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63124204595;
	Mon,  3 Feb 2025 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583447; cv=none; b=bnbsYHhFPxW9ZT5lyESU8SluFUVs438EXhajf+9mAOImt3u1bT3kNspBO/mH1bKIFf26eNzM/4+cRyvgCe9VtqR5SdEJotXZuah0Q4CwmjN9NSglg5Eyq5EYyw2ajRyaJI14nfKjKbj9ONoErsujjZPWsdi3K5g/5ZRNQO+U7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583447; c=relaxed/simple;
	bh=nJjGbI+i44AF84wr+bPqJWqg+qMzA1uFeGrVzZ/lovg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPYTnvwcdvPh0+quM7gQVP0hjC6U6TF9XAKDmbDbliuRi7Y423I6qAByDrbnPhnrG0vd91ENZ/FDR7Bk1HwWYhBcdlM9L7H6FPzON+N3biQeJaYFqsFG7p1bKaR97wanalMRwL5a7F8G+Y27En91KLhLFi/bCeqDd+QjCf2s+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCX2xhmE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCX2xhmE"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be6fdeee35so683893285a.1;
        Mon, 03 Feb 2025 03:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583443; x=1739188243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m30iBY4645YJh/LJ4nLB0jzg5cRUyI/d+hKLHrROYGI=;
        b=jCX2xhmEGGvoaA3ctq09o6jghXtfPY88qE0cUScUB8TQcTbYulbko0loA8RUsMojVt
         CJ7XZF+UpkyTh5lk6BdvjW3z6kvMz3jkPNCqCF0Vz9c7X59wzWEHsMHQboRAqWaPxkJL
         sJDEpla50TEdHRXVEOeAxJoA5oOmsafTPsNxYRX1jUr8sAZ+iDYQVud19LZHFlT1nw7p
         +xsBaZ0jMuGBHT8udjDk0ILJuVJmJb609MCrFAwhTgsQ9J95IQUS+kAZa9WhdYwrJ9Pm
         wlOGjsrdMKk8jFMYSPZIfnw/TO8AfKXBL2L3wSPz3RLGjNlSlsVb7rzaTtBJ2L2kpRjd
         1TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583443; x=1739188243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m30iBY4645YJh/LJ4nLB0jzg5cRUyI/d+hKLHrROYGI=;
        b=Gp0pQqhJatBZX4wai2oxSoM9hmYsYZUfSkL1tepWFya1/igKNr1FSVFGrmX7YBcuHy
         DaimnK33APR2Q/S7ZEDf+VtG3zCzdek1H9Xf3KZvTdYYBKSrZCErApuQXWsudnV9PLk+
         EN8lMzKEwniUluNPOaCTHsF5zw1GPXNI+JOGhU0KUOPvIy0IvuEglR2MJriYNEp8aPov
         2QXlZ4wuHNEOd3dcp/KqyCC0zHH8frRQz888Rte2NX/wmxXSX2xuZu+5E5CoEh/Nxp0W
         HjIvsN2+z5nJPcFItAK6jUVBSeqE1haHDEySHvNEis5R10gXPeY9oxwRg+Wm1gmB6OBF
         Pwpw==
X-Forwarded-Encrypted: i=1; AJvYcCVDYDU3g7/BUvsKUNZ4hx8c1WHSgMiZQK+iV5oqfc4IsprddqATv6UctpVsxBScMq83SP7/7NEJ4mGiPkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/vNTJpvgGO7jdrn3cicFIq54LSKKDZQGUr14J9H6XqmqRTys
	2V2lqOVwJYE0RLAs7X3Uvh/UFII8l55XrZOKAG2t9ifzOzz27fX8
X-Gm-Gg: ASbGncsox25H2INNhKBZOu35LSrZOmG3buaz9t1QQHVkTvr+x3rw+Jsd8yem6+B5Mdi
	tG7pz4UghdwsXnQWSKMFwhx49iebN4RhBpxE5bj2ej7xz3kdij7a2Kli4u1UUDQLedlxJgCX6B9
	xq+p1AdjLhpNDQsnq/EsWpOyP4EftjJ9Sx2xLYfdjlnizXBt5z0DFQBValNbTCMOWg6tuivVLOz
	MHMxeHFS0yFncV6eYQd2MpqoiPJurCyI9yRlwSvPeguuvTPnA2ixAlQ650uUgb+q5CNGYL5Kqi+
	lfpTHci5sxApuXPXrM0R9OPUpC5I+tXZOMkI9+o=
X-Google-Smtp-Source: AGHT+IFsebOfHASDKeppMR0nu0gc9+UOj5NfbSSaaWKDzLbwzE/DjaJ+i7tcaG3Hz5m8SymVO0kASQ==
X-Received: by 2002:a05:6214:dcb:b0:6e0:f451:2e22 with SMTP id 6a1803df08f44-6e243c7fa66mr361296376d6.38.1738583443042;
        Mon, 03 Feb 2025 03:50:43 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254835641sm49537626d6.62.2025.02.03.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:50:41 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 03 Feb 2025 06:50:34 -0500
Subject: [PATCH v8 4/4] rust: remove core::ffi::CStr reexport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-cstr-core-v8-4-cb3f26e78686@gmail.com>
References: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
In-Reply-To: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
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
 rust/kernel/device.rs           |  3 +--
 rust/kernel/driver.rs           |  4 ++--
 rust/kernel/error.rs            |  6 ++----
 rust/kernel/firmware.rs         |  3 ++-
 rust/kernel/kunit.rs            |  6 +++---
 rust/kernel/lib.rs              |  2 +-
 rust/kernel/miscdevice.rs       |  3 +--
 rust/kernel/of.rs               |  3 ++-
 rust/kernel/pci.rs              |  3 +--
 rust/kernel/platform.rs         |  3 +--
 rust/kernel/prelude.rs          |  5 +----
 rust/kernel/str.rs              | 19 +++++++++----------
 rust/kernel/sync/condvar.rs     |  3 ++-
 rust/kernel/sync/lock.rs        |  4 ++--
 rust/kernel/sync/lock/global.rs |  5 +++--
 rust/kernel/sync/poll.rs        |  1 +
 rust/kernel/workqueue.rs        |  1 +
 rust/macros/module.rs           |  2 +-
 18 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index df4bfa5f51ea..a1123206819b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,10 +6,9 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
-use core::{fmt, ptr};
+use core::{ffi::CStr, fmt, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::str::CStrExt as _;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 2a16d5e64e6c..0fbcdc226729 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -6,8 +6,8 @@
 //! register using the [`Registration`] class.
 
 use crate::error::{Error, Result};
-use crate::{device, init::PinInit, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
-use core::pin::Pin;
+use crate::{device, init::PinInit, of, try_pin_init, types::Opaque, ThisModule};
+use core::{ffi::CStr, pin::Pin};
 use macros::{pin_data, pinned_drop};
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index cff9204d9dd6..aa0786cee048 100644
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
index e371df67261e..73eaa477756a 100644
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
index 527794dcc439..f4e0e58877a0 100644
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
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..a129ef3292dc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -132,7 +132,7 @@ fn init(module: &'static ThisModule) -> impl init::PinInit<Self, error::Error> {
 /// Metadata attached to a [`Module`] or [`InPlaceModule`].
 pub trait ModuleMetadata {
     /// The name of the module as specified in the `module!` macro.
-    const NAME: &'static crate::str::CStr;
+    const NAME: &'static core::ffi::CStr;
 }
 
 /// Equivalent to `THIS_MODULE` in the C API.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 78c150270080..6e6f70cb4981 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -16,10 +16,9 @@
     fs::File,
     prelude::*,
     seq_file::SeqFile,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{ffi::CStr, marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 12ea65df46de..087ac8e05551 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -2,7 +2,8 @@
 
 //! Device Tree / Open Firmware abstractions.
 
-use crate::{bindings, device_id::RawDeviceId, prelude::*};
+use crate::{bindings, device_id::RawDeviceId};
+use core::ffi::CStr;
 
 /// IdTable type for OF drivers.
 pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 4c98b5b9aa1e..bec5b6bcb696 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -13,11 +13,10 @@
     error::{to_result, Result},
     io::Io,
     io::IoRaw,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
-use core::{ops::Deref, ptr::addr_of_mut};
+use core::{ffi::CStr, ops::Deref, ptr::addr_of_mut};
 use kernel::prelude::*;
 
 /// An adapter for the registration of PCI drivers.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 99af0a16ae85..173eaeb90fb4 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -9,12 +9,11 @@
     error::{to_result, Result},
     of,
     prelude::*,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
 
-use core::ptr::addr_of_mut;
+use core::{ffi::CStr, ptr::addr_of_mut};
 
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
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
index 4063d393ab58..d25c3d698f25 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::ffi::CStr;
 use core::fmt::{self, Write};
 use core::ops::{Deref, DerefMut};
 
@@ -177,8 +178,6 @@ macro_rules! b_str {
     }};
 }
 
-pub use core::ffi::CStr;
-
 /// Returns a C pointer to the string.
 // It is a free function rather than a method on an extension trait because:
 //
@@ -381,7 +380,7 @@ fn as_ref(&self) -> &BStr {
 ///
 /// ```
 /// # use kernel::c_str_avoid_literals;
-/// # use kernel::str::CStr;
+/// # use core::ffi::CStr;
 /// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -391,13 +390,13 @@ macro_rules! c_str_avoid_literals {
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
index 7901aa040f0e..b23544e24a0e 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -10,11 +10,12 @@
     ffi::{c_int, c_long},
     init::PinInit,
     pin_init,
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
     time::Jiffies,
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::marker::PhantomPinned;
 use core::ptr;
 use macros::pin_data;
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 37f1a6a53b12..711773c877cc 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -9,10 +9,10 @@
 use crate::{
     init::PinInit,
     pin_init,
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned};
+use core::{cell::UnsafeCell, ffi::CStr, marker::PhantomPinned};
 use macros::pin_data;
 
 pub mod mutex;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 4a040c29faee..7d6d1abf9279 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -5,13 +5,14 @@
 //! Support for defining statics containing locks.
 
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     sync::lock::{Backend, Guard, Lock},
     sync::{LockClassKey, LockedBy},
     types::Opaque,
 };
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::{PhantomData, PhantomPinned},
 };
 
@@ -266,7 +267,7 @@ macro_rules! global_lock {
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
index 0cd100d2aefb..25723207c2be 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a534fabd29d6..7f81cbbcc4ef 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -229,7 +229,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             }};
 
             impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = c\"{name}\";
+                const NAME: &'static core::ffi::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.

-- 
2.48.1

