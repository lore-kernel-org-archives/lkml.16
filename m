Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24823C8A4;
	Wed, 11 Jun 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673829; cv=none; b=UTDAyuZEoLBW4qHI+VxzVeQF9EebtAuliB/fNzsLJw0Lj06VPS/zD2znWIVp5ij3EhKiQdIA8nd5KCAJ4OELBdbeZSwAt1W1nSNnbGzhswscPA0baHwG2Fx6A/41aYFa+qTUG2N4uu0u0sqgG810YmmGXf7seaiNXtZYHBLUzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673829; c=relaxed/simple;
	bh=HlxWIgcO2YAUwRogGvZWE3e36d37xhYkW6Z6frtFmMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOQGc9pQXIrb1hSEm+Jtz7ydOgq9fKflm2DBHVtkLjL9+pz4aNLjGGVKU31b+D5D8PUWfJPsmIU4Hz+naHvpXKmWUEOPuebCZFHnK6uEh1TR9buQef6nlYFEmPCiU62yNwlNu6TaURbJ041ByY/ZUnvV9mttfCTQqg4ZogZ++WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/z7UYpw; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/z7UYpw"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-407a3c10d03so153924b6e.2;
        Wed, 11 Jun 2025 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749673827; x=1750278627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7F1aFIM16QoXbhR1Ql3MIkyQxYsSme3Sb2YHK9N7YB0=;
        b=H/z7UYpwQ2/cjaNchLfdxR7oSHtuPzGvenIvQHoA33ZCrCWHfb/OIhHSA/oXXenRjU
         S9iQu7B5k0G4V8wNFcSYbMf6cSilfc9F/zQjBoziqEG1dwHwaba/drQmoB3HI7Frem0h
         lC83/xW6qkESU7PLCrdsuWHnwnygl6S3m6RDUJAraFfZ0IGQSo4T+b5RQkOH/HMhLe/L
         uCuRRig+tVKji4sGU7WGd4Sqf12vm5LJDcK43R64O2+UOEonbbjs0Fnynr+iLoUlRl6V
         cBYe+OR9vmi2C86+JrmEq0WfyGflj9+SdAu8MUgIz6x6//gc+W1SQF2GioFMWLCiRnvW
         Cn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673827; x=1750278627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7F1aFIM16QoXbhR1Ql3MIkyQxYsSme3Sb2YHK9N7YB0=;
        b=LskkBS0LuAwoM6kUAqbbcyiuWdvBeoBzPKv92AkJBaZnNE7iCytO3ZMixqvukauZWP
         24kfh3ZOSeF9D5+jKU+FMBu/63pbq8jBfb+sAmJTgjurJISA21bLXoWnWtma1mNjwJz9
         /k3WcyK4sA9zw2ZN4PP8ZNw6HjJ7WPTnQtXldVtIe1ul8ZeyPztAvxaNFz0HkPZGc8he
         5ToFCG8KFJIIaSBxatVsEw8vglCmRSGgYLPXSqDrOsbjnIqiNDr+JXD2YSJSYoxyiJGZ
         SoMExcgGhd2nSvgtAQ6w5m/ojRwTbIlinVNRLQBSXvdUkIRyQwC5BrsEdbyxGhzgUJKh
         V2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQFAlFwYEDCEC3uV2O5VBOmvpuXMcfEZY6R46sUFvjMt0wSjS70qbqwXmAXSMI1ORNhBh8lreeI05vYVTupGg=@vger.kernel.org, AJvYcCV4KdQ9Di4sreuBmYWgnoMz3tMlw1BHLFdw5tsl/1iuD2EkDn1oHetEq5cBh+1lk3EQMVR0suffOLtVCao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKU6xDkNzuh5t60OD2viAtAtuZ0IS3xvRtrv2PneJRFQIGqgqQ
	3JbsWJqJ77rZK5roeEt5jf8XX9Df8iZGxt5DzDGexqvTiCaP42OUkF4K
X-Gm-Gg: ASbGncu/P4qlpvFFHEuTVzeQtxy3dtY78lbmkMmrrVZfScuI4+gnzTSGmduYiHgxHdt
	sFU/i8qlzKuvX7MKWWF0bwA4uNsONKE1fZx+Q+ea5HNDPB/DjT/gCo14E2pBAQ5Ofg4Rzu2JfJv
	BXtztX57dsVub2pTMCisXXMUBOahn0oZG9Abp3VRY2KSTexyaJ7S4zmHY9D4NzLPBhdu2K8oiUr
	nelPN/KSjKCWOoKz21YLWn/lkJDSx8QjxQkQGRd+8YEpWH2xEnUB6XMeKyyFSvnJViTVKRKjrAt
	J7P447md4cT3wH9H/N9sUdZxg95JkIO4yc0S3Xw2pm5EeftzblSrt5Ctwtaf9qDIqEAk7v+nrEC
	0QTjhI64oF8oDyx1fKKD+LsfHRGTyBcL1dw==
X-Google-Smtp-Source: AGHT+IH84ZfXGvPYL8b9G78h//kg+YTPpdxAkU3C8niVW1ioQJ2WQGT1MXzuNHxit0+xTYeRY/hy3Q==
X-Received: by 2002:a05:6808:1889:b0:401:e963:e973 with SMTP id 5614622812f47-40a66b25a16mr304173b6e.30.1749673827036;
        Wed, 11 Jun 2025 13:30:27 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-610fd44cc85sm19129eaf.16.2025.06.11.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:30:26 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] rust: device add support for dynamic debug to pr_debug!
Date: Wed, 11 Jun 2025 15:29:51 -0500
Message-ID: <20250611202952.1670168-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611202952.1670168-1-andrewjballance@gmail.com>
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
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
 rust/kernel/print.rs            | 167 +++++++++++++++++++++++++++++++-
 2 files changed, 164 insertions(+), 4 deletions(-)

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
index 9783d960a97a..4f0d79804d23 100644
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
@@ -423,3 +435,150 @@ macro_rules! pr_cont (
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
+                        // SAFETY: STATIC_KEY_INIT_FALSE is initialized as zero
+                        key: unsafe { core::mem::zeroed() },
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
+    /// - descriptor must be a valid reference to a `static mut` _Ddebug
+    pub unsafe fn dynamic_pr_debug(descriptor: &mut _Ddebug, args: fmt::Arguments<'_>) {
+        // SAFETY:
+        // - "%pA" is null terminated and is the format for rust printing
+        // - descriptor.inner is a valid _ddebug
+        unsafe {
+            bindings::__dynamic_pr_debug(
+                &raw mut descriptor.inner,
+                c_str!("%pA").as_char_ptr(),
+                (&raw const args).cast::<ffi::c_void>(),
+            );
+        }
+    }
+
+    /// macro for dynamic debug equilant to the C `pr_debug` macro
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
+            #[link_section = "__dyndbg"]
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
+                    DEBUG_INFO.inner.flags() & 1 != 0
+                }
+            };
+
+            if should_print {
+                // SAFETY: `&mut DEBUG_INFO` is a valid reference to a static mut _Ddebug
+                unsafe {
+                    $crate::print::dynamic_debug::dynamic_pr_debug(
+                        &mut DEBUG_INFO,
+                        format_args!($($f)*)
+                    );
+                }
+            }
+        }};
+    }
+}
-- 
2.49.0

