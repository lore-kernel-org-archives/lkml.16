Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701B22759D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834140; cv=none; b=DFGiFIDcCgSkFoUkslksvTZWMc5FWGFH3yqnNdAKo1O9N+8jApChsEkgzFPB7PjRJxG6T1YHa2I322EXvIfd+iVABigLJ8NlBfiJzo2agC5URXHmrYHrJaqLSC4WdquSoHGqwipReT4LJ98ow6/RPg8FkHVJSaNQ6/3nlGdcNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834140; c=relaxed/simple;
	bh=Ot/T0jCd4T7tNCR433fIHwM84YOZJZy/rRbe6ZLnftM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rodr4etFpV9XgsXusizpuJgYbK4YXd2pzJ8oFyFfaMqZ1e34sFYhHYKIdWqtBYm0gB8DMq7VRhUN+FPl13rfFW6PFC3ljXsS6AeJrrtraYDazlgQwaw71d4WdSu4BQ0GEcytyVw1u83fjukWK4P45gl+trK9vMzL+DfD759hcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUoR3pTF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUoR3pTF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f40deb941so2737075ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834137; x=1739438937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9/+ITx7jdgxCni5rtLO0HfiqPVNFjTWeSm9ZunqSOA=;
        b=zUoR3pTF6YmbxQRUQ8Ws3B0zZbQMmK0CTochc8/i7A/gnubm0ADABBO9+k7MXWRqAS
         urZGm2dDo2ZZePeWLFvvihxJ1TYZzJZJ3HjMW5+DO27fr8/V/NtablMOmIyPK+WAMOuD
         084PT5xrhzqYZMelFQWI7MTZY/unlUScwFsjzqR6k2MYKqRhr7Q/9NvJvhQGyE82J6dU
         4FmZ+hDMzSoPcOy1IoFb/d9Npmy74SBGSrvoLxtoMmbda9Vb0fA83qWGT8YnODCzsF3n
         nKPoUKXyCjMoUpvxK4tFr1r4azrehnKIQBe/prHlKI2kNAkKN3Ba5YB78ILHlnMVw7eV
         51GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834137; x=1739438937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9/+ITx7jdgxCni5rtLO0HfiqPVNFjTWeSm9ZunqSOA=;
        b=PKLaBWirsmZZwoF1UaJunahnMiVtRRA5E6vIOHn26AUV/fG5c0j7CP4+b5wux1y9XF
         lsLbCDrZza7EUCPH2u+gwzV83S7ufcqoC9ODD1c4L8NbtxOATiwBnwS0eUeK+gtKUAEm
         GjRcvmAFecG1Ac/XoJF5Q1ddblCOkhJq8tUJaGn8qeV7iY/VlRCnWkz7HLD0MY/rO5Fe
         WRkx5OF9W8bzxHJNJBy8W4H+58nFCAgohsTKmQk+O7ulu/bvem0/pFgkX63ApLzeZuPM
         a7jwvzkKB31n4AJ5wIIqv6GgshYJVVSpmPxOv++b6Vyt5bksJESqA2Sdj1lXYgpsJSYv
         zeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGID3wr4Vd8SvjtjZiFvtBfB7DqWrw4+kro1i2AHi0JUSYzLUqKTfDPoSWO+qrdRzCE/HWm3P1VOY4V8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfN561HfoPhbZonIyMwaZi5aup34YztD76Vn4sWaPBKFOIDZx
	VE3zuOWJHZZO4D3e292kDZwvszXwhA26OFRViUWrs/LBjTzyjAJ0dQ5MXXI0gsY=
X-Gm-Gg: ASbGnctYrumC7u1AfiIDZm4e/VSBIL2a74LxVMYcF+yJtnUpvoSjkPjC4dESyS/le2d
	TRaBl5BbtbbsZlCji8smYVhZMZT+MiUOjeCE3wdpuZhXUnsZkiKMb8+cKCy+AS7iphqHgiUIxgt
	Apx05AQur94e5J0SLPo4DsetNorXELKH8LvwCc/3NJ53Tf7Kq2O7CZxCmZR4xkhNf7fVj6RYxOl
	Yc1OfXU4rNZBQXxwOmHwAz/kiSJBkpbVj43G/RfAbw1nGcINGCnTL3Z1EkNXdtg3IGRPi6LYHPh
	lYax4BihK+uXu9ZfAA==
X-Google-Smtp-Source: AGHT+IGJC2iQJEI3sTGW6GjKdvP/nRc87YJ1GkI47hpYxHY8P6Qy5pjuZWMZBFlY67UgbnD1fdAThg==
X-Received: by 2002:a17:903:41c1:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-21f17dde2d4mr80139535ad.6.1738834137385;
        Thu, 06 Feb 2025 01:28:57 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b02dsm8145955ad.74.2025.02.06.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:56 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>
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
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V8 01/14] rust: macros: enable use of hyphens in module names
Date: Thu,  6 Feb 2025 14:58:22 +0530
Message-Id: <99ca28045252ba77c302d74e57c2976e60744c4d.1738832118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1738832118.git.viresh.kumar@linaro.org>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
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
[Viresh: Replace "-" with '-']
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/macros/module.rs | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..2e740bbdb598 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -182,7 +182,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
 
     let info = ModuleInfo::parse(&mut it);
 
-    let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
+    /* Rust does not allow hyphens in identifiers, use underscore instead */
+    let name_identifier = info.name.replace('-', "_");
+    let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);
     }
@@ -298,14 +300,14 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name_identifier}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name_identifier}_init;
 
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
@@ -313,7 +315,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name_identifier}_init() -> kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -323,12 +325,12 @@ mod __module_init {{
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
+                        // - furthermore it is only called after `__{name_identifier}_init` has returned `0`
                         //   (which delegates to `__init`).
                         unsafe {{ __exit() }}
                     }}
@@ -369,6 +371,7 @@ unsafe fn __exit() {{
         ",
         type_ = info.type_,
         name = info.name,
+        name_identifier = name_identifier,
         modinfo = modinfo.buffer,
         initcall_section = ".initcall6.init"
     )
-- 
2.31.1.272.g89b43f80a514

