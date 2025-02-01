Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6E1EA80;
	Sat,  1 Feb 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738420770; cv=none; b=TEw+Jnfvi6g38KmN+t34KoZvwpV8P4OxQO9uw3Jxh03wQ1T2dz60QoyFeB90A7j80549f5PrAOXwzWFRF9WPCZSry0Ug8/S0JMKeMYqke5+Bcr5pDah6l51DdwtpVQSYXbu5NwjffSOnp3a55KoVVGhWLEpqf96I2W3Vkif/5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738420770; c=relaxed/simple;
	bh=Jw8hXsOoeu8RmA3JupCBhu8QVaGKipouFWbj4iKq91k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DCIf16/53x9O4cyPXQzqYo+FYEk+dm9JylWPFo+RZfh/by1Bblyi16Gz2eXwryCVSSb3v1wxOAMLvnd/2UXrmYljxzczsI8QCyfAcfe08+mrCGCK8tJmiecT2kZe/KXKV3/MNoLXPvpRk/iAYxIT7e6ftkwshPk0buv9jCe+sGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPeIMCX+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPeIMCX+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso2298324f8f.1;
        Sat, 01 Feb 2025 06:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738420767; x=1739025567; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VELhpkBD8wD13tlL26JUQnqjPbPkriQTaE9I2+KcgHw=;
        b=YPeIMCX+EWQR/ih5msDdcZHnRrShdm2gTw0MVNzCgIVkuJe45VIrgeRNihHeJCksxA
         dV+TnECgiY4PZMSlCtaORaA2fWeaLcwXFKUr5llk6RdLY7nDqMIawjVYBvcO3pdxKkuZ
         MTOwWG/ZP1pMm7mPrG7Tj3DyLsWOhPGEH+la2hdYKRUGmZxlIUhbjdc9GndEJr0WzZvd
         fh0hmxe0Um7tgUyKtYPnykOjnVKQq4uZfiYzm5VAPPTohnZc4oY3APvdGmPRkgYOXRGe
         zurbn7LRQHvOEsLbOSJMqxfko4v+MUgY27tnfX8Mddf/zCdwr3nvQG4tGfO6FY38FvE8
         C4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738420767; x=1739025567;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VELhpkBD8wD13tlL26JUQnqjPbPkriQTaE9I2+KcgHw=;
        b=W1Wikmmf4KR1/iJe2KHHK5nJK2iYlYrPiA5g3iWsQz7rTSId2X/PJVloL5rQD30Yot
         FTCkizvECAKy5aNgUjMsMa/j5WZe63J1hMfeqxcPXeU84wpbmPJ+kSmmnU/uSY4/NK39
         0tiji1oHg6pk/+nqK3axiQCrM1rWKZVclHQznnSjsf0ifSTWW6sb1LMNtXh5ggClDEJV
         OGqXRWLEOmi58UN8AuaGHw3HVDy70vNTQGdel8AZVWZ+3iozz4wRtkWYY5vRnuj4UM0x
         VGln8XbH90xeMDE7hdZgx10aYYJDshfT56p4K7ug5gE4AkM5RGGZoV9c/TOQNZfJbxMI
         e9qg==
X-Forwarded-Encrypted: i=1; AJvYcCUS4+9pV/9o5M2msIBFRMffoXYNXL5BF3oLheBblmQfUCezLvXcCUC6J7jLEfAuGS+fm1fNTgo+EJoGqBk=@vger.kernel.org, AJvYcCW8Xa3Mwn8YQq5AbEGN3N4oNRxZshLYKkfzN5O/EIRlG1qwMdTcy21SkY9/0egr+0cfoSRZy3c2/INGby3hcc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPSe7Tbj5DL9zDO3EFZLctLsVPECtaluPwbakE73hdrZB2jKJ
	Ml+AUZslTJVn86GR5GGUvA75pSK9v1wHAU3u7mEoLAcM76ZTidLf
X-Gm-Gg: ASbGncsO9o1ji6rTNSZTWwuIVc00aYoBc1/yucHsjevk7LHgIbsQfAxLPe1AGOZnIAu
	ict2CtRRI60IvhKt0kiwxj5/rSOhbOXATxaiVyjBKfBQ9767dI9Z6GKvJnibGU5358+xLLqj4kp
	1ZCFfK564PvGXOXJf1MvhQlLedfNibJ+y/7Y9xI+UVmfdCcwWpQvu92BllzYatrVs31velLQrw3
	ZtL5HYxlR4cPcHOZhfW7KAgy8QqdcGfQHu/sLFZBVgCSB54bb65nDndag0NFD8GY4L2qCsroblc
	5Xg=
X-Google-Smtp-Source: AGHT+IFKiWYx8qp+zYm7p4jN3gDirJ4yk9LEK08CWYK1nFiEirWI71nED9AFuRQAIqh9Z7EZu49EFQ==
X-Received: by 2002:a5d:64eb:0:b0:38c:5dcb:313a with SMTP id ffacd0b85a97d-38c5dcb3574mr6980392f8f.5.1738420765250;
        Sat, 01 Feb 2025 06:39:25 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e23d42d4sm92445285e9.6.2025.02.01.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 06:39:24 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 01 Feb 2025 15:39:16 +0100
Subject: [PATCH RFC WIP] rust: remove x86 panicking intrinsics.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-remove_intrinsic-v1-1-4283ce8e4764@gmail.com>
X-B4-Tracking: v=1; b=H4sIABMynmcC/x2MwQpAQBQAf0XvbGstElel3OTiIEnr4R0svZWU/
 LvlOFMzN1hkQguZdwPjSZY24yDwPdDLYGYUNDoGJVUslQwE47qd2JM5mIwlLVSSROkYT2k4aHD
 ZzjjR9S9bqIv8c01ZQfc8L9i0/QRuAAAA
X-Change-ID: 20250201-remove_intrinsic-27749d5f93ac
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738420764; l=4224;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Jw8hXsOoeu8RmA3JupCBhu8QVaGKipouFWbj4iKq91k=;
 b=fF4O86h4x9bYlEhlbvj5/XssZt3epdEyfOOxrIUM8aZlNFS27VlGcLe3yeblhU8vShhuz5yhm
 IfklFWJ/RRGBnJWFbq2jOH7hDWv0pJI97nuxfr+r4iXyf9OEwrWj8/A
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This removes the panicking implementation of the x86 intrinsics.

This requires a PR [0] for the rust core library to remove the need for
the `__udivti3` intrinsic. This PR disables formatting support for the
`i/u128` rust primitives when the `no_iu128_fmt` config option is set.

In order to remove the need for the other intrinsics a recent rust
version is required (Tested with 1.84).

Link: https://github.com/rust-lang/rust/pull/136385 [0]
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
This patch removes the need to use `define_panicking_intrinsics` for
adding stub intrinsics implementations on x86.

This came up in a discussion [0] on my 32-bit arm support. The 
`define_panicking_intrinsics` macro is kept, because it will still be 
needed for 32-bit arm (and possibly other architecures).

Removing the `__udivti3` intrinsic requires a Rust PR [1] and the other
intrinsics only require a recent rust version (tested with 1.84), 
so when building with older rust versions would still require these
intrinsics.

For now this is mostly done as a demonstration that this should be
possible to do once the MSRV is bumped high enough (and possibly my
Rust PR is merged).

I have tested building a x86_64 kernel and running the rust samples
in qemu.

Link: https://lore.kernel.org/rust-for-linux/defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com/ [0]
Link: https://github.com/rust-lang/rust/pull/136385 [1]
---
 rust/Makefile             | 15 +--------------
 rust/compiler_builtins.rs | 37 +------------------------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d603836e0ec9b42a1285916b60e45..7d3be8fb257a7f2cb9ddb69ce6b6529ce989aee7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -53,7 +53,7 @@ rustdoc_test_kernel_quiet=>/dev/null
 endif
 
 core-cfgs = \
-    --cfg no_fp_fmt_parse
+    --cfg no_fp_fmt_parse --cfg no_iu128_fmt
 
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
@@ -388,19 +388,6 @@ rust-analyzer:
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
 
-redirect-intrinsics = \
-	__addsf3 __eqsf2 __extendsfdf2 __gesf2 __lesf2 __ltsf2 __mulsf3 __nesf2 __truncdfsf2 __unordsf2 \
-	__adddf3 __eqdf2 __ledf2 __ltdf2 __muldf3 __unorddf2 \
-	__muloti4 __multi3 \
-	__udivmodti4 __udivti3 __umodti3
-
-ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
-	# These intrinsics are defined for ARM64 and RISCV64
-	redirect-intrinsics += \
-		__ashrti3 \
-		__ashlti3 __lshrti3
-endif
-
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index f14b8d7caf89964198313deace1bcb06fea82964..c4ca246abd8e789bb0ed8d8b6736a88ce3f961f7 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -25,6 +25,7 @@
 #![no_builtins]
 #![no_std]
 
+#[expect(unused_macros)]
 macro_rules! define_panicking_intrinsics(
     ($reason: tt, { $($ident: ident, )* }) => {
         $(
@@ -37,41 +38,5 @@ pub extern "C" fn $ident() {
     }
 );
 
-define_panicking_intrinsics!("`f32` should not be used", {
-    __addsf3,
-    __eqsf2,
-    __extendsfdf2,
-    __gesf2,
-    __lesf2,
-    __ltsf2,
-    __mulsf3,
-    __nesf2,
-    __truncdfsf2,
-    __unordsf2,
-});
-
-define_panicking_intrinsics!("`f64` should not be used", {
-    __adddf3,
-    __eqdf2,
-    __ledf2,
-    __ltdf2,
-    __muldf3,
-    __unorddf2,
-});
-
-define_panicking_intrinsics!("`i128` should not be used", {
-    __ashrti3,
-    __muloti4,
-    __multi3,
-});
-
-define_panicking_intrinsics!("`u128` should not be used", {
-    __ashlti3,
-    __lshrti3,
-    __udivmodti4,
-    __udivti3,
-    __umodti3,
-});
-
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250201-remove_intrinsic-27749d5f93ac

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

