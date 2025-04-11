Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339B29B212
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369167; cv=none; b=kBuD9WjxCVpmXIuKfiKCfHKWxCCogGPN7IQeGNsw6khVeSht1+GUD7jbYE40lSLYQmb84YXPDGinhaVTuSTcpOlv1vzJR+o+DIbmp7TniuJe57pFHGz2kWi7CPosJY0OH3C6nGNu472tXjig/rpItX4iJU2aXnwzDr72TaH1rl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369167; c=relaxed/simple;
	bh=RPs39+G/2/WRBdJP3KwTQnQlR3Lp/kvURzUIgtDgvwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNxwpAR6MUdcUjWQlA8/MVzqRBW5oqCB+PNL3ar+JjWhUDxPLH2x8DMHff7ycODeHhrSzLqBXT46VOCW987p5Eo6FkDriTY+0lX7gx4aZ446t5i+tpbbcMCuApgQmBkP1ZyZw0UWI/LXbUGlOTQ8f6fHbAvnU3rf/wOo3lMEVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNVFcHEW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNVFcHEW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso21267685ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369165; x=1744973965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=RNVFcHEWGOgYlNI8KftVur5ayquxbwJHol7kiPbc3tKKgN66bUuTOpoR4GaIVypYaC
         /RMJN9ISJC7W/aUX+hOXne97e5X8KMABreFSnD+nOJ8zVfI5SWEElhEOOvHjzFpVPtD6
         UzKHURwBiXaw+mFx1kAfI1Jc152f9Gj6U2C9ufSVNYpSFdPOIIlyEJuBYK8tAv8VG1Lo
         oMmyMI1TGk+WT+yh5Uwo8DgXVyjXsOCf6+4UqHfYhxQTWfwv+nr1Q+6ZjXmK1KrXwWX4
         hDfu+UgCcNWmFe6iyeo5fI5/io7GB8tW9IAyL5N8oCqEJM7S1VOYvY49djaUFJI56T2W
         n8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369165; x=1744973965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=DLQJXSkTXTaQ4+A4RrRSB3ITRiCopYPy1Bs6JwNBOb8D5RiNdYrKL0fsdppA/TN1Lm
         +p4upEnmeeN2+/vX6Uw3/x2GGBmMV0a3crwkZn0CgMPlcadL8o8CBEJJBwN2GtzZGQZM
         RIq17TcF7EoUfwIWT2nTRnTDSM1tP7PWa45xwkkdZCd4zHyM0h5A/FK9mxeJyIzlbctY
         9eLYDpzvakAi1BAygb4+GdjXiXN71K4aW621YWVQt4pNVnrhvCpbvUrz0iBHqCOcxiEa
         yZ3PKdmRlwlPEJWgZKipyrkV13ykqUgCEXj0JEYCZTT/6/iIna11EdY8b8gauEHO6Klk
         PbHg==
X-Forwarded-Encrypted: i=1; AJvYcCXmMl1Rhti1tMhXmVD2gcxo/Y9+RABtz1caNYB7wqnQDCutJqZBXaiTE5GfEESr1kqzKm8CjchYpDeTW7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEIjE2MqY3/MEe9bVFecpWbdYqBROe6zBM7PWEku6I8Lv9Xbl
	g7VigPhi+1kTo3z3pJiQLYdrxD1g34qFR53qnCWjhlRq9Pq34gOFIg6WDkaVG0c=
X-Gm-Gg: ASbGncsZyYGpf4PZvpTehhwyLxUbD4m/UFlx1hpUIsAw558js4TSSf1yH52YEP10fxi
	IuFlST7ZuSxwBrTyAwfkjaNW7dNaZkCu60ukM7thjRZSBkn/1WiOPCNtKJzRoe4Co4VG2ljDfMU
	m8jVo9ugQ+JXoABUdUvY/7onCIgIS61vXvhNVs2w0vygPsSAHGwZLOZxEvEGTVmh/WjVMJlUWWk
	6idjIRuYC8urTlOYawg+KNj4j9MNo2rwhl0IS7AgScixWZsyf4YzEY842VBeRRlWWbrswQNcSPc
	oTeDsLiGIPWFI/HCZ/j9Pyc/P9z++hgwxfPJaaCvWg==
X-Google-Smtp-Source: AGHT+IFdC80llUDCc+trbEGjipwqaa3VqSInfFU2yq5qqcipKd6mbFI5BWR0rPyYDQBL1rjnG7EZVQ==
X-Received: by 2002:a17:903:2b07:b0:220:c066:94eb with SMTP id d9443c01a7336-22bea4bd7e6mr36916335ad.25.1744369164747;
        Fri, 11 Apr 2025 03:59:24 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230f2fcsm1177969b3a.151.2025.04.11.03.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:24 -0700 (PDT)
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
	Erik Schilling <erik.schilling@linaro.org>,
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
Subject: [PATCH V9 07/17] rust: macros: enable use of hyphens in module names
Date: Fri, 11 Apr 2025 16:25:06 +0530
Message-Id: <f339f2bffa72b9694868842017bd5c2013d395e1.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
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

