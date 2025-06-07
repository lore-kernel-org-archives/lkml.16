Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE6F9C0;
	Sat,  7 Jun 2025 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749301353; cv=none; b=At7Ds9CwcDoN1Qb3Kp0xJmYRx4pRqDO6G/DJSZmMGcWQuxqUj6UlrQPfYg2Cn06r2BIf5m/SGviZu//VtkUZJpU36r5WgPWRBFn2nGMDWaRfmcNliezL1XGwvCYz/9l2bZTGFddnGx7km4G3v56GvHZ7rkmMSdnnX0UrlkZ/4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749301353; c=relaxed/simple;
	bh=7KlOu1vZhR+nl/hj2RRC9lpKz151DKQmGM/ILIo0hSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aygtDR/Dj6uSUSC/i4Ug8Cop26Ma91cI0Oqjukg+aKSn0upPIWSLpv0thkfQMqjs39MvEgPiXEz6JXSXLK8B7/tTO9kR67Worjrb8WBBt4YMBhWM14kMtI0rCCyXGj26SX0Bql16LwoEOISaIko3IJfMQ8o46RfQmwROXicraj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chz7oiJg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chz7oiJg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4530921461aso372625e9.0;
        Sat, 07 Jun 2025 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749301350; x=1749906150; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQuHizt0r759ehkPwWbyMhSbtHXbf70UVrsqp16PUuE=;
        b=Chz7oiJg0lzKB+GU4IAmYTAQhtrnljrnl3d0OolhYjn8gdnxrpYYItrOiHHkNeW/Dx
         oykRHhPbWR3eix76qsFcaCKK+LHI8xlRwN1MiRc59+k7Qk+82RfGzFH5pxZdMYsfukym
         +JWD8F7zyvniep1D+jZUHGuaglR0P3jfg44YdCCARhms0+kz8R8LpvXRKeTaS+9XGUTM
         MONXfiXLPiKF+LtYvyeN3SRi4Ip9SiHo9ElJiIMCBLe87e8u5daQqBnZg9TfWunwrzHX
         bgkQPxYgySzljS02ii4vs2zSM8ZNhyFNWAWojL9hGy7ypxR9fz/ibmo75gPXi0JEeftk
         z/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749301350; x=1749906150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQuHizt0r759ehkPwWbyMhSbtHXbf70UVrsqp16PUuE=;
        b=XGg+qS7YxNGuUvL9MkeY/MTb6HKU5dtBVUfopyOF9xtneZ60lUOCqCgkr4EnIgZwgd
         huTqedWJ80vw6jaNglsbXz+gobJgQKpeXal0h3UcW/cjnE+opwXXACd7gu0NSUMKyt/O
         2kmwsICuDZXxVHmpW9YycHcizcowZiPKUm9qtFDNHRsGRgKT+Ol7YTcdSlhT7fZ85A2B
         2F3c9Msr2kBcS1dWwz2eLwXWY7G0xAPyIKppj9Ujya9Qp98wPKwqzQipBctd89Zw+pPa
         dsmyYXp+EdTpEAwSGtJeDXBLkVx5Z6sRLbgYmvNZQqvgl1O6kOuuIeihRI8bypKn0NqI
         HvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDe2Bk0Ck33gm0wt4SBWm26O+8S8LNYQGAiRr4qs5cnc0Pf2wbtstfA8L0rOY+uSTKlrFkycUWOFJdvSDE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLX9ba49/JCeDegEmgUfDfjTP5/baiJTeMRfcq/im/8H6dl1d6
	kcLfI4EJZoVZm3Z7MJY3pfZSDz3R5rM4zcdpIK+gdz1W2oDTqroHANna
X-Gm-Gg: ASbGncvaYLLOa67YOwkQQp0JQ9KZMNQK4XaNfq7l2TVGQnK+8uTEDHa16ZrtxvUWpYC
	nBJ6T2mqG33Z0scCNs3/CVrnF7VbFNIJUyeJLjNSD5nzNEfagdp0/xfKB1nOxiyfJ5woTYITedn
	8lUvH2wu5zqdw7sZnQUCX3uq18pBqiiBGt7TDqmnnV1j3Xh+/aZMOp2B0FwaVVjv2AhhPwDZr97
	LTyYav3fAU5TZ1k0tJkySqTFeDP4XII1SKFQLkACcxkc2GnFHICVFJj8Kz433WKVOhxgKJ2PgUf
	NRz+WWN7AB8PXymV0AJpzmn/aZf8Nhhfk18XPAc=
X-Google-Smtp-Source: AGHT+IHDRKzjxB04nIpSXygVB6fmNQla6ulscaXnS6kK/z0JoonFUKtFHPK867QTrCbc4HXkzQuR3w==
X-Received: by 2002:a05:600c:1c25:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-45201437847mr68835795e9.9.1749301349590;
        Sat, 07 Jun 2025 06:02:29 -0700 (PDT)
Received: from [10.0.1.50] ([2001:871:22a:3372::171c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm4686593f8f.66.2025.06.07.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 06:02:29 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 07 Jun 2025 15:02:14 +0200
Subject: [PATCH] rust: add `assert_sync` function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFU4RGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNz3cRioI6S+OLKvGRdM6O0lJRk00SDxJRkJaCOgqLUtMwKsGnRsbW
 1AKKjSCpdAAAA
X-Change-ID: 20250607-assert_sync-62fddc5a0adc
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749301348; l=2538;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=7KlOu1vZhR+nl/hj2RRC9lpKz151DKQmGM/ILIo0hSE=;
 b=MjGhfiWMEflXnqwsYpzJX0UNJgIPIXO4f7w80fYZRYJ06pCvKUMxGKhPGqz1TtWwVMwu9LqZF
 d5hdvQnvzDMANA7VOXdjkJCPF86OcI++tyiRViPnW6VMwEyu6nEwz8d
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Adds a new file `compile_assert.rs` for asserts during compile time and
add the `assert_sync` function to this file.

This will be used in `miscdevice` to avoid regression in case a `: Send`
bound falsely gets dropped in the future.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com/T/#mdf3328834ce1d136daf836c9e089b5a8627a6d53
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
For now I've only added the function.

Some things that might make sense to do as well:
- Move `static_assert` into `compile_assert.rs`.
- Add `assert_sync` to prelude.
- Add `assert_send` as well.
- Use these asserts in various places around the kernel. (I'm not sure
where it would make sense)
---
 rust/kernel/compile_assert.rs | 24 ++++++++++++++++++++++++
 rust/kernel/lib.rs            |  1 +
 2 files changed, 25 insertions(+)

diff --git a/rust/kernel/compile_assert.rs b/rust/kernel/compile_assert.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2a99de1ba919dc3952d7a1585869567a44106b44
--- /dev/null
+++ b/rust/kernel/compile_assert.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Compile-time asserts.
+
+/// Asserts that the given type is [`Sync`]. This check is done at compile time and does nothing
+/// at runtime.
+///
+/// Note that this is only intended to avoid regressions and for sanity checks.
+///
+/// # Examples
+/// ```
+/// # use kernel::compile_assert::assert_sync;
+/// # use kernel::types::NotThreadSafe;
+///
+///
+/// // Do the assertion in a const block to make sure it won't be executed at runtime.
+/// const _:() = {
+///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
+///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThreadSafe` is not `Sync`.
+/// };
+///
+/// ```
+#[inline(always)]
+pub const fn assert_sync<T: ?Sized + Sync>() {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7e227b52b4d8ff23d39d5cc9ad3ab57132c448d0..e1630e5079b2436eda6f8b71225bd5371af337b4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -56,6 +56,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod compile_assert;
 pub mod cred;
 pub mod device;
 pub mod device_id;

---
base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
change-id: 20250607-assert_sync-62fddc5a0adc

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

