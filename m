Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F118B46C;
	Sat, 12 Apr 2025 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744453831; cv=none; b=T5cqE+FLwEHLVWEznGLGG2WCnXGUwMZ7d94IBW0AfF++x/V0CkKgHGW5aL9tT1idNktWc3cSIVLPtMboZaLrWXpn7L/bxUxp4eNm0ERXMGdE2yYdk3w1x4uLzYXKxgCLVq8q/zje1AErXC/i3aSkC2hFR2owX6HWzaS/KeR1XOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744453831; c=relaxed/simple;
	bh=Hia1kiZk+FyPPlJb2ZUpH2pxAd1gwNy6AchxZIxJ0CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bK9I6oYeM8+4RruhWnKc+sb/yp1LyGt3/nhJcGUWFCuwS7q6cCh9PxeJEW5zyA8WeGeouETjR08O2zlVZG3T4BxnfsDIjOXdiJaGCOHDl1mS93i6207wrexVrDPx+GWL50ehQQrADhH0thiZyqpVm0Q1q6/gsPE45AJL+ZD4BwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7s12GfT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7s12GfT"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4679798a12.0;
        Sat, 12 Apr 2025 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744453828; x=1745058628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QO2E8+vYpqjJWt2sYsfaDpbyyaGYjdr6q5T2ONGGna0=;
        b=j7s12GfTLGpEIpj36I9unotlrGrr3Bjnx/URLnEb1ftffIetMFm2rhUIYO9YM3v685
         0uhrmCZWFxwulkCnBnHVVVYIZ+SrY9o0kgAugtE75G7PmutAV8e36lmnmPYnNKnSM1X7
         uJYtV/EaWZi0XSQKeXsjCy+Eow6JrXZPi6+Aj1PHE6oYLZA0/g6AoV70OTMK4SFkuFCp
         50ww1b9TciVhBCX9bonFQaHRvWNq9fBUodmL9BMqc8BJEGfZ9tOJYyVgduKyMK3cYmEq
         gQ+9mdFpOlT9fEOr7l/TkF0/GCKkuCyM1vOH8sYkfb0XqM3GoBqdgBRa71k8B2TTqAHI
         jGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744453828; x=1745058628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QO2E8+vYpqjJWt2sYsfaDpbyyaGYjdr6q5T2ONGGna0=;
        b=S+ud48P5LuYxFenvijZkikrzWNIhfSGDCDoZpmohfeTtE/7Z4iT+JD8ZbXFpZ3oDWe
         r1ft3Cu9ZcSOZw3iMpqXezp62wuWrOl9lllB9ZuVVnFEpDAiMo9FWFrj+tRKdO2Sxd8+
         LgMWrbGzwvSieV9bS3+W99WCjRxxLzTBfPS6aW6844Zn7IzfAwsf3/wIgru9PUcCw8e+
         ASinGuCGyzK6LP3rdpLgV+7iNbwN1f8yoIPlJ0lnnjZTsVQqxBsNuZxpzrNkNoMLZFLn
         NjH4tgx4PQeHZdIMS+F15tTkup2eX922QIBf6Zs5kbtzDlW4WW5H46ZV83qt2i5of7cS
         2TGA==
X-Forwarded-Encrypted: i=1; AJvYcCVy8SaedKFw/uq2cvW+cN5ij0O8/uV6fpcXqwHw3QrDxFJMPnV4xgsl2PZvKR3CXHkCz8p1xy2IY0dFtqcNPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6iIrXj3xwp3Yj3gg/bLm6OE275iBI3umXMGkSXtZ3SH+lD81
	zYQM4nc/H82PUvu1boMkN3YKzMK1rHAS+HlLGFYrNagl0/t5qEHR
X-Gm-Gg: ASbGncuLanhPpRMhrbEPqKvZmQx30cjFfh4Qxkl62yu6/jHKoY/0GlnG6KQYKIk06ZH
	EfZooOxjGzEWAyxomu9HEJ6oZutbTKfS79Rjvj1b4BYMs/TVt9yekwCTOG2+ieUPwkxnK2KUqzX
	7rO2PESDBo8xewOwzENg0E9gIhZQvkj2rdLdOXsP6GnaztIF9vHIJFkbJ5jNCmCVtEY5l8/mrP4
	Bs84W8N+mAXmZKS3suTaJ0ehrc8MiBQqg2iSZAJMCBKQxaNC2Q4s7VQB/4wWZ9RCwdDKF+FN0aM
	/u6ve7l3mOkaZyhLMtVQEqUNs30oPC65Ioqgunc=
X-Google-Smtp-Source: AGHT+IFx5V72a7tg9cHAQQUr9kXipb+oIc4HaS/kuzRV8AI7lbHBEsYX8cRNDSFc0s1eSlGLfUkTaA==
X-Received: by 2002:a05:6402:2791:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5f370268ae9mr4363917a12.24.1744453828030;
        Sat, 12 Apr 2025 03:30:28 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f528beasm2124249a12.76.2025.04.12.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:30:27 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 12 Apr 2025 12:29:48 +0200
Subject: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJxA+mcC/32NwQ6CMBBEf8Xs2Zq2UqWe/A9DmrUssImAaStqC
 P9uJZ49vsnMmxkiBaYIp80MgSaOPA4Z9HYDvsOhJcF1ZtBSG1nIUoRHTA5D7xp+uebp8BoT+pR
 novB7LG19NKQtZME9UC6t8kuVueOYxvBevyb1TX9apf5pJyWUkGjJ2LIwyh/ObY982/mxh2pZl
 g9rOWWexAAAAA==
X-Change-ID: 20250408-rust_arm_fix_fw_abstaction-4c3a89d75e29
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744453827; l=4002;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Hia1kiZk+FyPPlJb2ZUpH2pxAd1gwNy6AchxZIxJ0CM=;
 b=8I08EuDpBqcEUoesrMVxiv1KI5r1L1AXqgwzBm42mgnpmFOx99MtP7VW1C7Nx3v4S5SBniLPb
 /vmUtocPv1oDL3Ws7Il4P8dNqKC+zkJQ4fGzgb6dPXrquzXdLw3SqWP
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

The `FwFunc` struct contains an function with a char pointer argument,
for which a `*const u8` pointer was used. This is not really the
"propper" type for this, so use a `*const kernel::ffi::c_char` pointer
instad.

This has no real functionality changes, since `kernel::ffi::c_char` is
a type alias to `u8` anyways.

This used to cause problems on 6.13 when building for 32 bit arm (with
my patches), since rust mapped c_char to i8 instead.
Build error for this case:

```
error[E0308]: mismatched types
  --> rust/kernel/firmware.rs:20:4
   |
20 |         Self(bindings::request_firmware)
   |         ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
   |         |
   |         arguments to this function are incorrect
   |
   = note: expected fn pointer `unsafe extern "C" fn(_, *const i8, _) -> _`
                 found fn item `unsafe extern "C" fn(_, *const u8, _) -> _ {request_firmware}`
note: tuple struct defined here
  --> rust/kernel/firmware.rs:14:8
   |
14 | struct FwFunc(
   |        ^^^^^^

error[E0308]: mismatched types
  --> rust/kernel/firmware.rs:24:14
   |
24 |         Self(bindings::firmware_request_nowarn)
   |         ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
   |         |
   |         arguments to this function are incorrect
   |
   = note: expected fn pointer `unsafe extern "C" fn(_, *const i8, _) -> _`
                 found fn item `unsafe extern "C" fn(_, *const u8, _) -> _ {firmware_request_nowarn}`
note: tuple struct defined here
  --> rust/kernel/firmware.rs:14:8
   |
14 | struct FwFunc(
   |        ^^^^^^

error[E0308]: mismatched types
  --> rust/kernel/firmware.rs:64:45
   |
64 |         let ret = unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as_raw()) };
   |                            ------           ^^^^^^^^^^^^^^^^^^ expected `*const i8`, found `*const u8`
   |                            |
   |                            arguments to this function are incorrect
   |
   = note: expected raw pointer `*const i8`
              found raw pointer `*const u8`

error: aborting due to 3 previous errors
```

Fixes: de6582833db0 ("rust: add firmware abstractions")
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
This should probably be backported to stable, for people/distros
using Arm 32 patches on stable.
---
Changes in v2:
- Use `kernel::ffi::c_char` instead of `core::ffi::c_char`. (Danilo & Benno)
- Reword the commit message.
- Link to v1: https://lore.kernel.org/r/20250411-rust_arm_fix_fw_abstaction-v1-1-0a9e598451c6@gmail.com
---
 rust/kernel/firmware.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index f04b058b09b2d2397e26344d0e055b3aa5061432..2494c96e105f3a28af74548d63a44464ba50eae3 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
-use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
+use crate::{bindings, device::Device, error::Error, error::Result, ffi, str::CStr};
 use core::ptr::NonNull;
 
 /// # Invariants
@@ -12,7 +12,11 @@
 /// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
 /// `bindings::firmware_request_platform`, `bindings::request_firmware_direct`.
 struct FwFunc(
-    unsafe extern "C" fn(*mut *const bindings::firmware, *const u8, *mut bindings::device) -> i32,
+    unsafe extern "C" fn(
+        *mut *const bindings::firmware,
+        *const ffi::c_char,
+        *mut bindings::device,
+    ) -> i32,
 );
 
 impl FwFunc {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-rust_arm_fix_fw_abstaction-4c3a89d75e29

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

