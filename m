Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38422E3FA;
	Fri, 20 Jun 2025 21:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453575; cv=none; b=WDLkYQPGLhRh8S1PXA9dGIDp1Q+QtndeP+1rce12M/I4QNl21i1XE1hb8QmvZVRtk4Ov2EyKzPQsTufY+Ke9cjU2BBW+sS/9HQV9Rp/H0LXSvNOKlBh7XLE+TyOJmoun07mOnptToaCqFQ0NKnsnfHjPpfVSzFNNXUrT0TlA2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453575; c=relaxed/simple;
	bh=Qf9aWWDk1rgelGy/nw2y8YtBV+XFwSFwvNGpXSA9zpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh3Fv5cm6QW1o53sd53qV3VcJiBtLssZmB+JsNg6MwTytgIdO6amIp97IywWuj+Hp/LcTvwWLUns/Gg5eclbC48ePBfDIwnfo2jyl6ccaFrKy4o59ofyxciON9mIoH9wXuT2schOUuk9GowQBRT9zm349XodVyK8lGABOsAVZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7FZZqqP; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7FZZqqP"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bc3987a05so1314716a34.1;
        Fri, 20 Jun 2025 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750453573; x=1751058373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/HEUkl30GQM2b2jY07fS7ORbU/KCeaIh9AjjPxC8qo=;
        b=Y7FZZqqPu2/b3wPDEzr3LHbyQLOPKilO2rCa7R6ORssaHzAU5WZBhYd9bmaXZecrbw
         QFlmU9nOBKp+gLdriHEcOzoYQXivDxB4M33oPtgzlZzxWcGSDBQxJlgIO7EQkB08g7aM
         NjAtFOuMjxl02ZNDJ2vu/pHbkaa6/0W0/B+x5gWrtWpgvGnn0cbHr7tboojItHB4vhuo
         JY8qU6gkrlxyhQEJFhXd5FWqHQYj5wNtBm9zmoABJ0QOJ8Gj6Wng0yPojuq0MN1sAes8
         /R12bUzZDm3WvgG+9+LoHEMr9x+8L2pMCCt39ofR6cwz5eWYOjvyTURc9yZfW7NY/6Gt
         tHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453573; x=1751058373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/HEUkl30GQM2b2jY07fS7ORbU/KCeaIh9AjjPxC8qo=;
        b=BZx3XyhDeWyuGYI+MSpddjsZzt2Fe5m6CbopWVMu5U3MMe142JCNKp6C1Zs75fEsrv
         We6FS/ni/vsOKa5sb4QL+XqQDYW5JFMu3mQiu9i9S8KMW5EawLP95pu4Iau1qih+43Zp
         6mJxA0z/d7z/PhpY6Qrly//QMv71NKa84lhwqQD7vFxhAy/gA21NkhxI2XLjYE+0GIh9
         HpkN+8kRMujOFMPXdO3XY938Qj4cJJCTTPTxKLzWg60uHkuaM7UYYsmUcELHwf0/AMGm
         JXUDDehDm1AlVsX+xAAAT/WUqDnx9rd/XUhlDXfDTiE8zLfhjZyJUhKek9OgdHFsnEId
         06Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU1gB3CQ9FsuX4+Dx6uSt0spyVtvFe+qkTmEFGOPwh2pFysxiAEaOtKcpPMTdIDj/nVvXjNECFe1v7DCaA=@vger.kernel.org, AJvYcCUuyMNmViU8pN1GaQch021XqLeT5FZajgBfkKZSqx7DUM9Cf36BFKbayBgSFCYP1U3aPC7kV+2UB/cJTdldO7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSBAmkX7pmAaKlM0MVB9pOGzH3Zqgoco7ZXP4WbQXgTRYzM8+
	yDtPECfRKYvMlvr89/H0R9w/0ZSofGBfeeRsADFm0n37zq+B/IRYYcRw
X-Gm-Gg: ASbGncuw93zYtpRRprSsxIdcTSNqITvYWY4sKlXME8P0LaujvYQ6dPtGR/Q8g9GY985
	ADZThuT8GpfpOhAJIBsBRgLGNTnrpkg4zkHTJSEM/L0hDTpsrOS4lmFwMwEzhdRDW4aHUqmTPB9
	48daReUqcv1mdL7QETswDIt3y3qXK8t5+FAMfPBx3cg5NFi6vYRP/+5jpvqAy8K8cLv0oSUIlTP
	hku7eK5i/scI+g+CKlwrkS2s/r4dyhtlN6I0kagjIoc3FwLjrv0pX2gNOyMwbqogzZ9prXZvBXB
	gTnW3xDE9AohsKqoMpusU2c6lJbdE5PTnVFY6xWGrHZDXXmUu5JDmVcqNb/+AIvHJwbhdLBdAUP
	TmbrTI/Mx63iG7vtvH6PLw/6VxltnTtwJYA==
X-Google-Smtp-Source: AGHT+IHabmOuHzbM+hdIHSQO0XLdjw3L4ZxnmcTGpMjCK7p5/Y7slbedP3jLoLU7meuMmN2yz7sGpw==
X-Received: by 2002:a05:6830:4d87:b0:73a:8a44:6181 with SMTP id 46e09a7af769-73a9314a2c8mr2840207a34.13.1750453572772;
        Fri, 20 Jun 2025 14:06:12 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-73a90cb7875sm460596a34.56.2025.06.20.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:06:12 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/4] rust: device: add support for dynamic debug to dev_dbg!
Date: Fri, 20 Jun 2025 16:05:33 -0500
Message-ID: <20250620210533.400889-5-andrewjballance@gmail.com>
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

adds support for dynamic debug for the dev_dbg macro.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/device.rs | 105 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index dea06b79ecb5..829b7ca7bb7b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -536,11 +536,14 @@ macro_rules! dev_info {
 ///
 /// This level should be used for debug messages.
 ///
-/// Equivalent to the kernel's `dev_dbg` macro, except that it doesn't support dynamic debug yet.
+/// Equivalent to the kernel's `dev_dbg` macro.
+///
+/// This has support for [`dynamic debug`].
 ///
 /// Mimics the interface of [`std::print!`]. More information about the syntax is available from
 /// [`core::fmt`] and [`std::format!`].
 ///
+/// [`dynamic debug`]: https://docs.kernel.org/admin-guide/dynamic-debug-howto.html
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 /// [`std::format!`]: https://doc.rust-lang.org/std/macro.format.html
 ///
@@ -555,5 +558,103 @@ macro_rules! dev_info {
 /// ```
 #[macro_export]
 macro_rules! dev_dbg {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_dbg, $($f)*); }
+    ($($f:tt)*) => {
+        #[cfg(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG))]
+        { $crate::dynamic_dev_dbg_unlikely!($($f)*); }
+
+        #[cfg(not(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG)))]
+        { $crate::dev_printk!(pr_dbg, $($f)*); }
+    }
+}
+
+/// this contains all of the code that is used for dynamic debug for dev_dbg!
+/// this is public but hidden. This code should only be called
+/// by the `pr_debug!` or `dev_dbg!` macros.
+#[cfg(CONFIG_DYNAMIC_DEBUG_CORE)]
+#[doc(hidden)]
+pub mod dynamic_debug {
+
+    use super::Device;
+    use kernel::c_str;
+    use kernel::print::dynamic_debug::_Ddebug;
+
+    /// a wrapper function around the c function `__dynamic_dev_dbg`.
+    /// # Safety
+    /// - descriptor must be a valid pointer to a `static mut` _Ddebug
+    pub unsafe fn dynamic_dev_dbg(
+        descriptor: *mut _Ddebug,
+        dev: &Device,
+        args: core::fmt::Arguments<'_>,
+    ) {
+        // SAFETY:
+        // - "%pA" is null terminated and is the format for rust printing
+        // - dev.as_raw() is a valid pointer to struct device
+        unsafe {
+            bindings::__dynamic_dev_dbg(
+                &raw mut (*descriptor).inner,
+                dev.as_raw(),
+                c_str!("%pA").as_char_ptr(),
+                (&raw const args).cast::<ffi::c_void>(),
+            )
+        };
+    }
+
+    /// macro for dynamic debug equivalent to the C `dev_dbg` macro
+    #[doc(hidden)]
+    #[macro_export]
+    macro_rules! dynamic_dev_dbg_unlikely {
+        ($dev:expr, $($f:tt)*) => {{
+            use $crate::c_str;
+            use $crate::str::CStr;
+            use $crate::print::dynamic_debug::{_ddebug, _Ddebug};
+
+            const MOD_NAME: &CStr = c_str!(module_path!());
+            // right now rust does not have a function! macro so hard code this to be
+            // the name of the macro that is printing
+            // TODO:
+            // replace this once either a function! macro exists
+            // or core::any::type_name becomes const
+            const FN_NAME: &CStr = c_str!("dev_dbg!");
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
+                    ::kernel::jump_label::static_branch_unlikely!(
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
+                // SAFETY: `&mut DEBUG_INFO` is a valid pointer to a static mut _Ddebug
+                unsafe {
+                    $crate::device::dynamic_debug::dynamic_dev_dbg(
+                        &raw mut DEBUG_INFO,
+                        $dev,
+                        format_args!($($f)*)
+                    );
+                }
+            }
+        }};
+    }
 }
-- 
2.49.0

