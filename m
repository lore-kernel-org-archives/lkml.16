Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9E22CBF4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785616; cv=none; b=Y5iNjZ6j2PeLyI+71QzqVc60Or2sRGK/+QLdKh0/0jvyyA59roRndusYnb9caxag4+A+Xs15r4yMeneg2zmYHMsyWYfl+N54Xkwu48bDv8KSsOh9eHwVfZXtehsNzYIp3HdPrRzuHOcHuHPyk64ztcOZ/NC+a+SLXAvlBSi9kRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785616; c=relaxed/simple;
	bh=RPs39+G/2/WRBdJP3KwTQnQlR3Lp/kvURzUIgtDgvwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p6IaibS6EwM6lsV1b+vlzKeZPbi0x2NCjyRmO0/7QHyIIDcMNWHFk6bltpgsajYbBqqpZlJxXyVHKvlDY9xdTa2D6OaLqthJhGMr0ET7yvhbHgDGLtApHfsOYBKLtfRsJ22ZO4A9BhzYYDNvw3M+6TO9tG+8ULI1yFsqg8PQwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DroUADkf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DroUADkf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c336fcdaaso3104385ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744785614; x=1745390414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=DroUADkfGP9ENmXbc0Ucy2ZkNEfwC5hYWmEuM/MFlN9DGve7mzqEKrl6YjeKJLGDzQ
         M7oEKXY8WkeBgKssiS+4MZJhzL+yMh8+IaNGcreuFFMa+78svFmVlCF3QQOzPUvopZw3
         n0MX089dXsGmhZDM6prwNGq5XHjcAKt0iAbLGMf74cAQSf8M3K3xkFxqO/32ZVJWTgOS
         mzE7FmNUj9uJoTJpXn0871RgLg1s5VqOxT7eQVo4ovVJHj1ra7FRrmm4O0HeVPSa7Y1T
         6dLZiMgTiqDBWt1cHGRHp3JSRVHl8M3IH8EhYDNQUzRFXFNiYKMmSsDf+ol99rlYbK0S
         lM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785614; x=1745390414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=QyswOrKXOq30xLugXcFVp/AaOi/Jap/gxMa2V9wXOM4BqoOoOE6r4/JQc75L7NWwc7
         nlqnZZQwdpfRLfaevjnRKtufDt8ww93feLQ8Ki7wsAIP1DhamrtDiunhJEiCdHR3Xzl9
         f6u7Bk0k9168HnkjQWS7N1M0hMd6QOmrqdKfVFrSIIFssc++UP/V0HkAquJQMW68qcwt
         JyZMzGGpQz2LrPSGd4TVMNNsr1QWn5hydSte+idwhjpzESuZbKe7TChDdHuywjqSBSwb
         KmRjwxCecG5qxkMXj212uOBWLMfOstQlkgPTplQrshJnjgwCLFfI4ePAJsMQ7vhCL6By
         96JA==
X-Forwarded-Encrypted: i=1; AJvYcCWxYVDzNoazZV/tsX9o0RVonrk/e6kwIJKgdlP1jMJENZT3LsV5BJtY4sFLY8PojgYCeKfC596IwOErqqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+Tn/cIxKH30qO68y7FZViQg4uO44n5+nC6eEh/Z/grHFBlOy
	X+Iqxh4F0T+o9Bw/JmcCWHvf/shFFWIzy6gCWqQ72aeSpAwWK+bIPSMptr6mrG4=
X-Gm-Gg: ASbGncuC+VmWd1c3L4ZTRXxoDxTzGbUUI1Tmcvy/icalbbImwF0bjDoYexwLZ3FDjZf
	dUcR1uYxSX7t9jd+R76dPB+bZpb1IQ12xlZNnv8S69YSatum1LcWpaJn1oRAXYXpArP5auQVzdT
	P6eOkVdgMgkimqgloL2HZCqOWgN7D+AkRDgw9AK2bqjj0to2YmJy3hBZLwOSi0/yBkdvoIQfcSo
	XfbZbu252oxSUWadl/SKIoVgVbrvXLCPaZVmm+/SU7kvWcVb4Bds4aan8kSA4hxcNTGQjDkZ983
	M9qJF77IhEUWU2CCjkmSVIp7p3K2pNejBPk6JMZ7zA==
X-Google-Smtp-Source: AGHT+IF2Rglo7eHxKgDEgBNsJGaQtvp/oXKgIHcXad7KTacx4TnahZHOzUtBIJLTVG1uvlzQ1gByKw==
X-Received: by 2002:a17:903:84f:b0:224:122d:d2de with SMTP id d9443c01a7336-22c358ddb96mr9533055ad.16.1744785614335;
        Tue, 15 Apr 2025 23:40:14 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e83sm6446415ad.35.2025.04.15.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:40:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 06/15] rust: macros: enable use of hyphens in module names
Date: Wed, 16 Apr 2025 12:09:23 +0530
Message-Id: <b7f534dfbb63aa0e8acfe90f122e23ad052d5e19.1744783509.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744783509.git.viresh.kumar@linaro.org>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anisse Astier <anisse@astier.eu>

Some modules might need naming that contains hyphens "-" to match the
auto-probing by name in the platform devices that comes from the device
tree.

But rust identifiers cannot contain hyphens, so replace the module name
by an underscore anywhere we'd use it as an identifier.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
[Viresh: Replace "-" with '-', and fix line length checkpatch warnings]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/macros/module.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a9418fbc9b44..27cc72d474f0 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -185,7 +185,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
 
     let info = ModuleInfo::parse(&mut it);
 
-    let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
+    /* Rust does not allow hyphens in identifiers, use underscore instead */
+    let name_identifier = info.name.replace('-', "_");
+    let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);
     }
@@ -310,14 +312,15 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name_identifier}_initcall: extern \"C\" fn() ->
+                        kernel::ffi::c_int = __{name_identifier}_init;
 
                     #[cfg(not(MODULE))]
                     #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
                     core::arch::global_asm!(
                         r#\".section \"{initcall_section}\", \"a\"
-                        __{name}_initcall:
-                            .long   __{name}_init - .
+                        __{name_identifier}_initcall:
+                            .long   __{name_identifier}_init - .
                             .previous
                         \"#
                     );
@@ -325,7 +328,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name_identifier}_init() -> kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -335,13 +338,13 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_exit() {{
+                    pub extern \"C\" fn __{name_identifier}_exit() {{
                         // SAFETY:
                         // - This function is inaccessible to the outside due to the double
                         //   module wrapping it. It is called exactly once by the C side via its
                         //   unique name,
-                        // - furthermore it is only called after `__{name}_init` has returned `0`
-                        //   (which delegates to `__init`).
+                        // - furthermore it is only called after `__{name_identifier}_init` has
+                        //   returned `0` (which delegates to `__init`).
                         unsafe {{ __exit() }}
                     }}
 
@@ -381,6 +384,7 @@ unsafe fn __exit() {{
         ",
         type_ = info.type_,
         name = info.name,
+        name_identifier = name_identifier,
         modinfo = modinfo.buffer,
         initcall_section = ".initcall6.init"
     )
-- 
2.31.1.272.g89b43f80a514

