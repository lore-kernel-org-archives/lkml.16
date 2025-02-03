Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F57820370C;
	Mon,  3 Feb 2025 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583439; cv=none; b=VAZsesmdJXyE35u/NWH3B9mez8BOjUeBy5IqkJAQI8y429IcY2V6/RoNE2MieXmJ+fiUsvR2sTP8nho54VIDLbTE+wK8nVpyrP2QHiawWnLf53RDtqzbAi5NOpLMuiUDrsSrT6Me2BSXoiyxuJ8nkTSAO32dQCJjdx49ZuMM8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583439; c=relaxed/simple;
	bh=BoxP5Y/8z1hHT9KvfiG76QO6yOSw0im155jB54VJ1VQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LzrjdZ8O8/AfeuLp2+9XPeipYJjRkGu4Ue5jepfFFIlM7wAVZSWYDngEIurBdUt2Wam8mnKuLZIHEfBf6MTqHGhAnvfdw7F4Sqtz/NRbL7nsbzDmbzTvcHZeqfeaqdfZDi3rziD4s6aOHHzqE0jGanFZJV8BAjsMnqfPUqTco8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nX4v4OZG; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nX4v4OZG"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd049b5428so32417146d6.2;
        Mon, 03 Feb 2025 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583436; x=1739188236; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lIjziw5Zd+39PQufs8diBl9oy2Y7gM74Sl+o4aK2Pmk=;
        b=nX4v4OZG7/AQQeQGFfqf1FOcYrJDncTFouOXavnDzDL/nAO7r4urmFj6Kc3HTigi/H
         VKd96yH+F9suByU40Wk9p6lbnK1rl0pATSR/wIyi6q1Rkn5fGblxcNQX9B/Usixk+Lc4
         o73vLTmz/Nw2IAm+buAr8OZo4FX+ZuwO3+CTD+aPnbg9IDghn7eKkN4B4Q4DSMkJdGNf
         poFmh1jy1mSJ6CB/jyD/58edXB6DyKrBdhhz7XFMJUPXMpPSkLx66z3WIie7BOKRFpTn
         1gRP9M56+P8mIdw+pciahgvc3x3h62TCrdhsogEfkCd0WXh/i7Xa23AF0+6w9wjyv4DK
         cDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583436; x=1739188236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIjziw5Zd+39PQufs8diBl9oy2Y7gM74Sl+o4aK2Pmk=;
        b=Q5ApQ4SvIHX9Ld+cJjyTC9g1RsssOI6Azwr8qiZbrmd2DZ0F3DAS50fIJZ5rF7+5XF
         W++rZTsa9cSLQiplC6CzZUYSftjEqhnqePu7A0ZLIzDHFwHn6vF0AVYAB3sY6UDVemkc
         j2qZ/BJ0CYJlvLEcaqp/wFpW+JjGEJlqAG5WZBqpUE+ZjzV9vGxYk3nxxfUNQm7urg63
         dBinXh9lKnIR12GA3h4by3wSFNJlDxMCNQsOI8X22t99NORSxhztsJxNzBgZbGzeqMEK
         LX/3NgHFAeZnWx2gO5UFtUVI1CGrrXg5oonWvK5HYxUr4RYRK77oFGEt4h2ImljPHGm/
         V54A==
X-Forwarded-Encrypted: i=1; AJvYcCWTzbFVFgXFSTDc2q3WhGnz64Qy3f13XB+DgwOEspauZ5RUca4winvY4qUJFPixHXPYWV5BopWJnvRT1HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHG6tHoZqLbH6vsCDqCBC7QTzStcMcN/OGcw8cgl4aWHI94E9
	V/n8b4WgGNq2QX3aqPcPwIEkRSoW/+AEmCny8a1L617gO3w9Ew/O
X-Gm-Gg: ASbGncvLZOVH5ijGEWK91A2d+e2VvcdfUzotRmLzaVc84SK2l/npPWbqA0miP+m6/aA
	o0vQa5JmnLb0omyt86RIi5XNELErKB3cR3lI+ZGgAywk2J/rNwgljvL2hnFmIs73FHT28Es44iJ
	dB+sfEU0qtEiuduBunYSSY9HplLziWS0Eyj/8ARADvIgzFcqHugRDta58UNeaCLmkH5YmDAmUGd
	D3uXC+iqWUIgn+aLc89RwDaewA6RhivUE7/sy47Bs8XwLvgq6eqsieB+hzRoOf0rCJSe7dl/Njl
	FUNKEcEjv7N8Lr4G+VlOGvCsea6qlFsa2WryJ38=
X-Google-Smtp-Source: AGHT+IHBQ3t8BOiIdDN6PzetGNfE6npdGOR7bEwfs2Kr8b83nXiLdHdbTyMApuzROEzetNdV0c6JlQ==
X-Received: by 2002:a05:6214:46a1:b0:6d8:68a1:b7aa with SMTP id 6a1803df08f44-6e243c940fbmr327327016d6.28.1738583435969;
        Mon, 03 Feb 2025 03:50:35 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254835641sm49537626d6.62.2025.02.03.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:50:35 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v8 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Mon, 03 Feb 2025 06:50:30 -0500
Message-Id: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIetoGcC/3WOwa7CIBBFf8WwdgyMLYW38j9eXCBQS57tmKEhG
 tN/l5po3Lzlzcw5OQ+RI6eYxc/mITiWlBNNdZjtRvjBTecIKdQtUGIrUSrweWbwxBFCc7InbRV
 K34v6f+XYp9vL9Xusu2caYR44urehkUZZ1e51q3dojOwAobhATCX/3Q9Xppmm0aXLztO4KoeUZ
 +L7q67oVfwOwa+QokGCabT1QQe0fTicP5I1pHT/kl0lg1OmnlA2e/NNLsvyBGAZJF0fAQAA
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v8:
- Move `{from,as}_char_ptr` back to `CStrExt`. This reduces the diff
  some.
- Restore `from_bytes_with_nul_unchecked_mut`, `to_cstring`.
- Link to v7: https://lore.kernel.org/r/20250202-cstr-core-v7-0-da1802520438@gmail.com

Changes in v7:
- Rebased on mainline.
- Restore functionality added in commit a321f3ad0a5d ("rust: str: add
  {make,to}_{upper,lower}case() to CString").
- Used `diff.algorithm patience` to improve diff readability.
- Link to v6: https://lore.kernel.org/r/20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com

Changes in v6:
- Split the work into several commits for ease of review.
- Restore `{from,as}_char_ptr` to allow building on ARM (see commit
  message).
- Add `CStrExt` to `kernel::prelude`. (Alice Ryhl)
- Remove `CStrExt::from_bytes_with_nul_unchecked_mut` and restore
  `DerefMut for CString`. (Alice Ryhl)
- Rename and hide `kernel::c_str!` to encourage use of C-String
  literals.
- Drop implementation and invocation changes in kunit.rs. (Trevor Gross)
- Drop docs on `Display` impl. (Trevor Gross)
- Rewrite docs in the style of the standard library.
- Restore the `test_cstr_debug` unit tests to demonstrate that the
  implementation has changed.

Changes in v5:
- Keep the `test_cstr_display*` unit tests.

Changes in v4:
- Provide the `CStrExt` trait with `display()` method, which returns a
   `CStrDisplay` wrapper with `Display` implementation. This addresses
   the lack of `Display` implementation for `core::ffi::CStr`.
- Provide `from_bytes_with_nul_unchecked_mut()` method in `CStrExt`,
   which might be useful and is going to prevent manual, unsafe casts.
- Fix a typo (s/preffered/prefered/).

Changes in v3:
- Fix the commit message.
- Remove redundant braces in `use`, when only one item is imported.

Changes in v2:
- Do not remove `c_str` macro. While it's preferred to use C-string
   literals, there are two cases where `c_str` is helpful:
   - When working with macros, which already return a Rust string literal
     (e.g. `stringify!`).
   - When building macros, where we want to take a Rust string literal as an
     argument (for caller's convenience), but still use it as a C-string
     internally.
- Use Rust literals as arguments in macros (`new_mutex`, `new_condvar`,
   `new_mutex`). Use the `c_str` macro to convert these literals to C-string
   literals.
- Use `c_str` in kunit.rs for converting the output of `stringify!` to a
   `CStr`.
- Remove `DerefMut` implementation for `CString`.

---
Tamir Duberstein (4):
      rust: move BStr,CStr Display impls behind method
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/net/phy/ax88796b_rust.rs     |   7 +-
 drivers/net/phy/qt2025.rs            |   5 +-
 rust/kernel/device.rs                |   7 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/firmware.rs              |   7 +-
 rust/kernel/kunit.rs                 |  18 +-
 rust/kernel/lib.rs                   |   2 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |   8 +-
 rust/kernel/of.rs                    |   5 +-
 rust/kernel/pci.rs                   |   3 +-
 rust/kernel/platform.rs              |   7 +-
 rust/kernel/prelude.rs               |   2 +-
 rust/kernel/seq_file.rs              |   4 +-
 rust/kernel/str.rs                   | 542 +++++++++++++----------------------
 rust/kernel/sync.rs                  |   4 +-
 rust/kernel/sync/condvar.rs          |   3 +-
 rust/kernel/sync/lock.rs             |   4 +-
 rust/kernel/sync/lock/global.rs      |   6 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   1 +
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 27 files changed, 268 insertions(+), 402 deletions(-)
---
base-commit: 8b3f2116ea4a9521f852b7f9d1d6dd4d7ad86810
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

