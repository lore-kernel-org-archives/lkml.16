Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4D217660;
	Fri, 20 Jun 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453570; cv=none; b=GG1VktpMzKmMab18p32yd4G6cF1jIgoHdj02wEqyylBTKboVRdk8o5wVm7EpZK4aNzRux8WwABqzaVei+Kcsgb4GIe4kWIyd+d5ME0BjXF8o6Ty37fToKm68F+goMnMt6WEBhcF2Lt++IPj42lfRR/cJNAB6odfhB1IdpOLUQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453570; c=relaxed/simple;
	bh=U1RQZ+CRKL2Uqmb9M58IDIIuCkIKGsciGNMHZvmmLA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpaX93fQZlDeLBTJK6bXUTXtOB2Nl6hUojzviCQ416mBve2BLsOOLCgKG6uBXfT0+DRtZfV48eM5HldXMKk99clzfR/HFxPtcepoKFzJhUdb5m8Vdm8w4IP0S5SM9S55dO51GQLzKDlR7YI8fd5eg2ZrWg40KkB+ZzBfJAf835E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBFQgXvR; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBFQgXvR"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c27166ab3so1502539a34.1;
        Fri, 20 Jun 2025 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750453568; x=1751058368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpnzqi+8ws3Ksj9eVEvWIJefWpQS1Ry3ErpuelRUI10=;
        b=SBFQgXvRenvQrpt+v+aQ4K5fNshfmxt4HFobZu7MFiDm7PHsJVRLdYrFzPFtmMuGvp
         l8s2Axn1he+nfRcJJ9mq9TtkjNG6P4t421B9tAL2f2rGx4ncCjFNFk0kEwBETgos6GJo
         hX+1c9fb5HjVZMTSqeNBkq0B8ZMjw6uadE/pGH/NRZrVKt1IN/fL/rKXyOoBFc+tTibg
         aqIDx0vp81EUGY4w5loZtogoo3rVU8pvgDjSYY/FbiXc2gg4vkps4GJ5Igsu4jSC9v6z
         EwEOO6UdMtne6dM7KfOY60K3GurtHUF1V6zxke4ggfFc61zkPLRm3rx5CcrlEo8yy1aY
         qwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453568; x=1751058368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpnzqi+8ws3Ksj9eVEvWIJefWpQS1Ry3ErpuelRUI10=;
        b=rRk+bNrwX6RQbSrvnv54g3HhF+CGY6duuGkK/njLal8N0IVYDcsB+3+TX4cq3OixY5
         JoH70fwa0QGX8HS+I9I8q88ixiYsXlVNq5KRh0BKW7XXK408TFimAnV5XTwH3u49CkdZ
         81Q3eo/KsMRazIKxQoSzkY8BX8V464S2lHyq7EoIaDlOmSXwFBKs4zy7TLtAuA6qxys2
         SpJjj0ssIQD27SHR9kZJpyoILrVNQdsu1D0sc9b5H6VBIn+UyrF/N61JNUu0laIgs9Nb
         1vqzF3k8d+hZNZeMEOhLOz8mVBNiTzywfAe6eyJ6Nl+8YxDLRpXBuAzrl4QSsnGJjFfq
         NJRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5uvY4ME9g4o13Gx9mFGx5USLXV/Dw5fBPZdWjFso4sB/H3umCVnYKL8F7LYa3vfSTTn/EHFE1J6BtrBAxwjE=@vger.kernel.org, AJvYcCXA9Autzv7NjPNbgGtHe3dk0FpB+S2mROuGgnH4NqcV/2ujtE+SbeHfs9gmb7kC+ig5/f9SGjVvr5bZ7ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7fyd2jfDNmAAEoMxo2O5eqE7Ya0mtiFPHEUT6qGgrlwJvtrP
	ZxAL7sq0SjcWury/iWBvvQoNfebLg2q+X3G0JpX4+r9Jhoe5xrlqot13
X-Gm-Gg: ASbGncuCh4dnF83uEeGBPuaxN6uktculsHle7esJQBST8JUeGiPPldmB8h2cEVRLb7O
	pA69yJHYA3MWBrQhfzQ6POr/ZrQjILamPhYlfjU3T9LCnaTp/cKbctJirAnKw4SqV4iEV+12Mib
	fTHbj/kw0gSXKxMtcaejL58eEB8wuBTzWx3hUB/BaHwMUpo7DnjHzPWs2ksv2XoK7yRFXwpj8Og
	9CgAcd7/knL/UIxK1WaR7z3OWTdpjfH6iAPO4aCGlilUfZd1HBtrJ9TnVP6wenRpus558VWpO8e
	dHWForxIF3+Vy2DLSPawBCRyUniosB+MGalQRnINZ6hcbBzFxnvT4zHb5f0kOAa1RikRsLQaeOK
	ucI0W9Ax8edGzYlIDCd/Nc/SOErXtdR1P4g==
X-Google-Smtp-Source: AGHT+IEJ1smyAld8LZgMLy9CnbsWb4b2RQQkDlh9UGxWBabc9SWnsSxsvlr1DaOaDwMsDQjnt6Gdtw==
X-Received: by 2002:a05:6830:926:b0:727:3f3e:53bb with SMTP id 46e09a7af769-73a91da16f6mr3560655a34.24.1750453567761;
        Fri, 20 Jun 2025 14:06:07 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-73a90cb7875sm460596a34.56.2025.06.20.14.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:06:07 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: jbaron@akamai.com,
	jim.cromie@gmail.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	rostedt@goodmis.org,
	andrewjballance@gmail.com
Cc: viresh.kumar@linaro.org,
	lina+kernel@asahilina.net,
	tamird@gmail.com,
	jubalh@iodoru.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/4] rust: print: add support for dynamic debug to pr_debug!
Date: Fri, 20 Jun 2025 16:05:32 -0500
Message-ID: <20250620210533.400889-4-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620210533.400889-1-andrewjballance@gmail.com>
References: <20250620210533.400889-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adds support for dynamic debug for the pr_debug macro.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/print.rs            | 171 +++++++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 4 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index bc494745f67b..e05e9ce5d887 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -46,6 +46,7 @@
 #include <linux/cred.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
+#include <linux/dynamic_debug.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9783d960a97a..36573e56a176 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -371,13 +371,15 @@ macro_rules! pr_info (
 ///
 /// Use this level for debug messages.
 ///
-/// Equivalent to the kernel's [`pr_debug`] macro, except that it doesn't support dynamic debug
-/// yet.
+/// Equivalent to the kernel's [`pr_debug`] macro.
+///
+/// This has support for [`dynamic debug`].
 ///
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// [`std::format!`] for information about the formatting syntax.
 ///
 /// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_debug
+/// [`dynamic debug`]: https://docs.kernel.org/admin-guide/dynamic-debug-howto.html
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 /// [`std::format!`]: https://doc.rust-lang.org/std/macro.format.html
 ///
@@ -390,8 +392,18 @@ macro_rules! pr_info (
 #[doc(alias = "print")]
 macro_rules! pr_debug (
     ($($arg:tt)*) => (
-        if cfg!(debug_assertions) {
-            $crate::print_macro!($crate::print::format_strings::DEBUG, false, $($arg)*)
+        #[cfg(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG))]
+        {
+            if cfg!(debug_assertions) {
+                $crate::dynamic_pr_debug_unlikely!($($arg)*);
+            }
+        }
+
+        #[cfg(not(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG)))]
+        {
+            if cfg!(debug_assertions) {
+                $crate::print_macro!($crate::print::format_strings::DEBUG, false, $($arg)*)
+            }
         }
     )
 );
@@ -423,3 +435,154 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// all of the code that is used for dynamic debug for pr_debug!
+/// this is public but hidden. This code should only be called
+/// by the `pr_debug!` or `dev_dbg!` macros.
+#[cfg(CONFIG_DYNAMIC_DEBUG_CORE)]
+#[doc(hidden)]
+pub mod dynamic_debug {
+
+    pub use bindings::_ddebug;
+
+    use crate::c_str;
+    use core::fmt;
+    use kernel::str::CStr;
+
+    /// a wrapper around the C `struct _ddebug`.
+    /// this is public but hidden.
+    ///
+    /// # Invariants
+    ///  - this is always static mut.
+    ///  - this is always located in the "__dyndbg" section.
+    ///  - this has the same layout as `_ddebug`.
+    #[repr(transparent)]
+    pub struct _Ddebug {
+        pub inner: bindings::_ddebug,
+    }
+
+    impl _Ddebug {
+        pub const fn new_unlikely(
+            modname: &'static CStr,
+            function: &'static CStr,
+            filename: &'static CStr,
+            format: &'static CStr,
+            line_num: u32,
+        ) -> Self {
+            // rust does not have support for c like bit fields. so
+            // do some bit fiddling to set the line, class and flags varibles
+            let class: u32 = bindings::_DPRINTK_CLASS_DFLT << 18;
+            let flags: u32 = bindings::_DPRINTK_FLAGS_NONE << 24;
+            let bit_fields: u32 = line_num | class | flags;
+
+            let arr: [u8; 4] = bit_fields.to_ne_bytes();
+            let bits = bindings::__BindgenBitfieldUnit::new(arr);
+
+            #[cfg(CONFIG_JUMP_LABEL)]
+            {
+                Self {
+                    inner: bindings::_ddebug {
+                        modname: modname.as_char_ptr(),
+                        function: function.as_char_ptr(),
+                        filename: filename.as_char_ptr(),
+                        format: format.as_char_ptr(),
+                        _bitfield_align_1: [],
+                        _bitfield_1: bits,
+                        key: kernel::bindings::_ddebug__bindgen_ty_1 {
+                            dd_key_false: kernel::jump_label::STATIC_KEY_INIT_FALSE,
+                        },
+                    },
+                }
+            }
+
+            #[cfg(not(CONFIG_JUMP_LABEL))]
+            {
+                Self {
+                    inner: bindings::_ddebug {
+                        modname: modname.as_char_ptr(),
+                        function: function.as_char_ptr(),
+                        filename: filename.as_char_ptr(),
+                        format: format.as_char_ptr(),
+                        _bitfield_align_1: [],
+                        _bitfield_1: bits,
+                        __bindgen_padding_0: 0,
+                    },
+                }
+            }
+        }
+    }
+
+    /// a wrapper function around the c function `__dynamic_pr_debug`.
+    /// # Safety
+    /// - descriptor must be a valid pointer to a `static mut` _Ddebug
+    pub unsafe fn dynamic_pr_debug(descriptor: *mut _Ddebug, args: fmt::Arguments<'_>) {
+        // SAFETY:
+        // - "%pA" is null terminated and is the format for rust printing
+        // - descriptor.inner is a valid _ddebug
+        unsafe {
+            bindings::__dynamic_pr_debug(
+                &raw mut (*descriptor).inner,
+                c_str!("%pA").as_char_ptr(),
+                (&raw const args).cast::<ffi::c_void>(),
+            );
+        }
+    }
+
+    /// macro for dynamic debug equivalent to the C `pr_debug` macro
+    #[doc(hidden)]
+    #[macro_export]
+    macro_rules! dynamic_pr_debug_unlikely {
+        ($($f:tt)*) => {{
+            use $crate::c_str;
+            use $crate::str::CStr;
+            use $crate::print::dynamic_debug::{_ddebug, _Ddebug};
+
+            const MOD_NAME: &CStr = c_str!(module_path!());
+            // right now rust does not have a function! macro. so, hard code this to be
+            // the name of the macro that is printing
+            // TODO:
+            // replace this once either a function! macro exists
+            // or core::any::type_name becomes const
+            const FN_NAME: &CStr = c_str!("pr_debug!");
+            const FILE_NAME: &CStr = c_str!(file!());
+            const MESSAGE: &CStr = c_str!(stringify!($($f)*));
+            const LINE: u32 = line!();
+
+            #[used]
+            #[unsafe(link_section = "__dyndbg")]
+            static mut DEBUG_INFO: _Ddebug =
+                _Ddebug::new_unlikely(MOD_NAME, FN_NAME, FILE_NAME, MESSAGE, LINE);
+
+            // SAFETY:
+            // - this is reading from a `static mut` variable
+            // - key.dd_key_false is a valid static key
+            let should_print: bool = unsafe {
+                #[cfg(CONFIG_JUMP_LABEL)]
+                {
+                    $crate::jump_label::static_branch_unlikely!(
+                        DEBUG_INFO,
+                        _Ddebug,
+                        inner.key.dd_key_false
+                    )
+                }
+                #[cfg(not(CONFIG_JUMP_LABEL))]
+                {
+                    // gets the _DPRINTK_FLAGS_PRINT bit
+                    // use pointers to avoid undefined behavior
+                    let ptr: *const _ddebug = &raw const DEBUG_INFO.inner;
+                    (*ptr).flags() & 1 != 0
+                }
+            };
+
+            if should_print {
+                // SAFETY: `&raw mut DEBUG_INFO` is a valid pointer to a static mut _Ddebug
+                unsafe {
+                    $crate::print::dynamic_debug::dynamic_pr_debug(
+                        &raw mut DEBUG_INFO,
+                        format_args!($($f)*)
+                    );
+                }
+            }
+        }};
+    }
+}
-- 
2.49.0

