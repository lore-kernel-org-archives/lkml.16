Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA0738384;
	Sun,  2 Feb 2025 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738513899; cv=none; b=UOrqotrbsPK7uzfzfCAO5g1FAOvVZSbnI2Uyvumyp5eOTsVNy2J/Id/Puj7MmXpIYe8f+OK5gvqVvTUYYkg5sedDEFXowJxKBLygjSHD5mvgMWGrwzKusfO4q0dQ7CCqucD9PwgwnbrafhSv3kbsDF4hFSgtDxe1lMPdRpE/joo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738513899; c=relaxed/simple;
	bh=LTtoW8t7ruaMhWR49XFSPGXQJ0qL8M0PLPSll13Kse8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLkHt2PjhzGoRGUF7tMAE/xZmS9lWAdgkJtpJsJ2YYGXiXRUfK0pxHvaWZe30aNeFSRAs7TVrsedpbr6krwQCvnn7PH150ITf/ykCvQpO4iBilCh3AnOJnhfTjxVcw/W9Kkex+LUrOHKgvvvmA+VAtNtjIzNpc2uFw8UXFwsTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAJ34RwF; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAJ34RwF"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6f7d7e128so434212685a.1;
        Sun, 02 Feb 2025 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738513896; x=1739118696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsmImrWlafHaiAPIjGyqD/ERJHtpy0ANUP2YmLbPZhw=;
        b=bAJ34RwFn0L9Uv9rtD6P/PJOy4+1Q/UFvPV+rptmHu4hHazrdVZxL+ZKudrLNpeTXW
         +yvM+fPukYZGiufOGM8+/qAvU5iAIHWTfeiNnB+xXAu3h6EQHUoG7MGaV2iPOVPSp0Y5
         cwIY4ZLqp0vl8auXyJA4mHlHjr/rqsgGfqTbSWqsx0iqkeO0IcBqBBU5pOacjfh7ccEl
         dGzGPPhTLAdZ1lBHK3erK/0Jbky8upy2qf+uSCEnMHQ4nyxg1lW+IAhS4cv7MQvEWQEo
         +S9ESaR0W/IZb2PITR4Hx30MeH6dRcVnk18LVwT1s8fuCrwkC1H4+8y+H/nIvd9FXHCq
         tN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738513896; x=1739118696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsmImrWlafHaiAPIjGyqD/ERJHtpy0ANUP2YmLbPZhw=;
        b=ZlLtBsmBhEprs55YClTpVcqTVRWXwfD9onkCX1SYn949OGmJMCOu/5++Z9Lug7I7AX
         +XM5c55iLU5UaIH97AKGaR7K3DQS4a+l2NgIEW+ynmqztaZFiRTBZ5+RL8MeziHnWzxB
         vQSSVQa10/M/dklcAuVZmBFrCyo4dMGZCTlR8KAW5lyOqszdmb90rIPhDW/qfRZuzrN0
         JhjXVBTeKPIl93QDNWJQiNT0x/VWQM/iGxth0CQSf3eSdNgFOLUBTsFUbfuf5KadkXVF
         LhSqW/Z+WqslnoEoHYqAhJR3pf/80l9Un1kuZhLU7DEhKws6R4h56MSPHbXamnDOBZvL
         ZhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm3BBOZSecHNDOU0xReCkSLfYFsw9uvkG24qa7RPbxbuPXzcEwcEm8MwO3ygEzflkqwmVu7PTE0KpQJXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMs0/ZvIpzniWagoxJvcSlkcq0gAL2dgdR33RCPUlzR/Q3EwB
	Kd5psvBnJJFaY/13c6B/NIig9PbgX2IjK4lzzuR6670H4avrY2VIJxu33Xbwayo=
X-Gm-Gg: ASbGncusRMPNVqs5KXBIo8lW27QBYpzkbezaXsJJyGUdPBnpWxi2tAVAQh/Ysxvh56M
	wRzIX9p6PM1uCv2zlIK6BLePSy6XEXn3JBShdI2PM9Pm401EmzoO+2OvhGvR5tCYyJYOKRZ54cD
	ETVIWuYzt3LzNDBWqC638rFuMpWJTASSVyjkXfhJbCroMmtRjK2hSTWz6X3xjBpSQ8QH5XiHhAd
	7TBFdlu3TBX90NVE9BzfJtuPtWSen34yztkgreoRhm5+bTJ+VBexxkDUwkphbTGHHwxc92KY5mN
	D99D6evZHtDzyHdSKAkMNl4SsuJkAiYn0y0Dbxc=
X-Google-Smtp-Source: AGHT+IEfrl4Vvug7X259jX7mZnIveRxwNRAsJQ+fTMadD2aib3r062c5MP/DQ1trriRb0XjldnAGIA==
X-Received: by 2002:a05:620a:24d1:b0:7a9:a356:a5dd with SMTP id af79cd13be357-7c0097b7d6bmr1959574585a.20.1738513895913;
        Sun, 02 Feb 2025 08:31:35 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bb957sm421307485a.14.2025.02.02.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 08:31:34 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 11:31:21 -0500
Subject: [PATCH v7 4/4] rust: remove core::ffi::CStr reexport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-cstr-core-v7-4-da1802520438@gmail.com>
References: <20250202-cstr-core-v7-0-da1802520438@gmail.com>
In-Reply-To: <20250202-cstr-core-v7-0-da1802520438@gmail.com>
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
 rust/kernel/of.rs               |  4 ++--
 rust/kernel/pci.rs              |  3 +--
 rust/kernel/platform.rs         |  3 +--
 rust/kernel/prelude.rs          |  5 +----
 rust/kernel/str.rs              | 19 +++++++++----------
 rust/kernel/sync/condvar.rs     |  2 +-
 rust/kernel/sync/lock.rs        |  3 +--
 rust/kernel/sync/lock/global.rs |  4 ++--
 rust/kernel/sync/poll.rs        |  1 +
 rust/kernel/workqueue.rs        |  1 +
 rust/macros/module.rs           |  2 +-
 18 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 9554921368c0..7248bfcfe8f2 100644
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
 
 /// A reference-counted device.
 ///
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
index 65f70ff61eb3..e8c272e24bd0 100644
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
index 12ea65df46de..04d8dc924147 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -2,7 +2,7 @@
 
 //! Device Tree / Open Firmware abstractions.
 
-use crate::{bindings, device_id::RawDeviceId, prelude::*};
+use crate::{bindings, device_id::RawDeviceId};
 
 /// IdTable type for OF drivers.
 pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
@@ -28,7 +28,7 @@ fn index(&self) -> usize {
 
 impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
-    pub const fn new(compatible: &'static CStr) -> Self {
+    pub const fn new(compatible: &'static core::ffi::CStr) -> Self {
         let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
         // SAFETY: FFI type is valid to be zero-initialized.
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index af36ddac80ff..d248b966cab4 100644
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
index f23a433b2273..b8aabc229442 100644
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
index 27911eaede27..a68acb54f0c8 100644
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
 /// Wraps a raw C string with a safe C string wrapper.
 ///
 /// # Safety
@@ -338,7 +337,7 @@ fn display(&self) -> Display<'_> {
 ///
 /// ```
 /// # use kernel::c_str_avoid_literals;
-/// # use kernel::str::CStr;
+/// # use core::ffi::CStr;
 /// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -348,13 +347,13 @@ macro_rules! c_str_avoid_literals {
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
index 5ad62d718279..7951c0ca60cb 100644
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
index 1008dd2635e1..69f419bdb0e7 100644
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

