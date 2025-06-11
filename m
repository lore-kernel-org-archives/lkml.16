Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422082BEC2E;
	Wed, 11 Jun 2025 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673834; cv=none; b=lbn2ueyGFe/SCLIkkNtECx6lG3BpSuDBnrcMBUlMt3tDyqL4nVCXGO0aYaweQpEzkSObCDHyQemtklC8F0HCHlUWdbGkDFcNfJV2B4vd4VzChGcOmLKrJI4LZC/0KW6GCuiU5EZ6ijs26f9DyaCfmIUY0aUFtP7Oc43rdJdv8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673834; c=relaxed/simple;
	bh=Vrqvff5jDFcGNcQZuPYGZ5RQ4KL8yEpJ9KW8TrWMNYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ix6wTkr1atCrQ8Gt9UzSoXpsZC1G84KRUL24MT7a20F0vR9YWs0zsGsalSfKkQy3VVa3Uz/i3XFFrKVubGTDHQUeqDKuzI4T2sljKZUZHZGbmAywyGpA/CPI/lcbQMJvDuwxMSjiRKC8SncxPez067njziVca//YvFyoPxCZMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRelzSvT; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRelzSvT"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4034118aeb7so69986b6e.0;
        Wed, 11 Jun 2025 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749673832; x=1750278632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4l0RofuIVC7rDkXTNk6jKf/KgoomCHHGke/JzkR01w=;
        b=KRelzSvTTGdQbwzLlHJVzz/mTbuGCHdFlQVnNp1M0seF7ckUqG4wgloggnpjHyXNm8
         +TdHKNgxXw40fRTjVgiOh3dJ4RJp67ev7YBsE2tfr8JGIbPFxhKzg/jJEjtBa+v6wxpf
         /79hEBJ9acWbjVb2121t+sZUrDQo7RfhYQOFAFOGxRirzRw2DcGXatUhVn1HIDCnYoK5
         bxG3gm6Wd9DvSH/ev5HAVr+swhBc9MCo1Fx92u63k+nUqxGjLOAdb7s0xTuSXhfBENDy
         c6NdOzeBkwQ1oEZJgbxOuJ6eKDK5DfHIlRwD96h8bjgh53U21wHmy/RCiN2qwdEx2MT/
         UJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673832; x=1750278632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4l0RofuIVC7rDkXTNk6jKf/KgoomCHHGke/JzkR01w=;
        b=b+MqHOV3T07Eu8rqQUnOe83kZz9Rzz7xgjRz6fFEFuMfh2TffRKJpBDXcQ3iBkF5Vz
         HJlEgBbbb7XkWBcbd176mjzuSx63Sc6EGkHoPLJqoqrL8N53/Ip04EOhAK25W6/5/cHp
         d/xrx8oX8ubCRZMBQjsfllyOGH48ZrhBVu0ZSAv38Jg2Aqtmec5VqgopkUKLfldDta4q
         1dF3I/TbgyGd7OyDc8Iyrh9AhUizIsc4oq3LIYVvDv/1GY6SA/wqa96cCmr20Byyh49u
         3U/sB6G32me/fhgwRNsybbXU5PRn/VX9SFLH/W+0MSbFXs3FMC67zF3xWbypo80b/w2t
         LF8w==
X-Forwarded-Encrypted: i=1; AJvYcCXPLHksn+ltgAlhZhjwOeYnuGFz8YkXo3r5PwrS9rDLMOQ1WxGFT9mtOfrzGvJ1PF/xlwVm7ej6PcprnJE=@vger.kernel.org, AJvYcCXda4CoyAr2hBJOh7gdIXZamz5dTUM4c6G0WWzMa60orO8Q28dmjj+DGmtCFDEFuE35AVhw8JagHiZQnCXejEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3b4SGfoavTelsTl/QIWeZoApgBlMfqFsZ3Zs4IAVfIZdRCCiW
	DeNhNpOerbQSa9ouMVaXHCOa7ccgu/x5YvaitiTMqWD5YESvUbX5fSWDZ9moKN/+
X-Gm-Gg: ASbGncshIs1wx4J/hOkyLOJ6/XUU/nicJQo0EkmNUHlG8r6qgFPXpGGGUD/3M0Kutsd
	8wJudY035fw/1OS7eTcduD9OUjH0I576Hfu/1qoRBFzqyzeZdvM/mb+urxDp+z+uyZlEQF+azj+
	/Hc/bnsGWE1ovgjT0Owc3aVOqYPPKU389r5Eo4UM6nsfp29nFQRRcgUl7/FdX+qBn9nSp2UzTv9
	HT3nrUQxzOMJ+H6xAY5Dquh4V5Paur/NoqMWRnp8hg0qECpEOPlbyRLiPo9OSmDz6Wsx9wTRWCs
	Tlr0/qYig2Kb5rcdaE0oIRk49oouWiRpTfqVlHssRja5dsnIEUrKjd89C6TFqy+eI3BJFyYxoVf
	bNR0iGFFj18uOpQVLDWEY3W97/N036VuCfw==
X-Google-Smtp-Source: AGHT+IEK+C4nJhi3JBx0pttmVmGHK803hC/mTGSHJ63I9XWQoLP7w/KRp5+Njqf5dI6BRGWjo/FNhA==
X-Received: by 2002:a05:6808:318e:b0:408:fef8:9ca3 with SMTP id 5614622812f47-40a660ef02cmr616591b6e.8.1749673831724;
        Wed, 11 Jun 2025 13:30:31 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-610fd44cc85sm19129eaf.16.2025.06.11.13.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:30:31 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] rust: device add support for dynamic debug to dev_dbg!
Date: Wed, 11 Jun 2025 15:29:52 -0500
Message-ID: <20250611202952.1670168-4-andrewjballance@gmail.com>
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

adds support for dynamic debug for the dev_dbg macro.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/device.rs | 102 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index dea06b79ecb5..f59fed944876 100644
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
@@ -555,5 +558,100 @@ macro_rules! dev_info {
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
+    /// - descriptor must be a valid reference to a `static mut` _Ddebug
+    pub unsafe fn dynamic_dev_dbg(
+        descriptor: &mut _Ddebug,
+        dev: &Device,
+        args: core::fmt::Arguments<'_>,
+    ) {
+        // SAFETY:
+        // - "%pA" is null terminated and is the format for rust printing
+        // - dev.as_raw() is a valid pointer to struct device
+        unsafe {
+            bindings::__dynamic_dev_dbg(
+                &raw mut descriptor.inner,
+                dev.as_raw(),
+                c_str!("%pA").as_char_ptr(),
+                (&raw const args).cast::<ffi::c_void>(),
+            )
+        };
+    }
+
+    /// macro for dynamic debug equilant to the C `dev_dbg` macro
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
+                    ::kernel::jump_label::static_branch_unlikely!(
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
+                    $crate::device::dynamic_debug::dynamic_dev_dbg(
+                        &mut DEBUG_INFO,
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

