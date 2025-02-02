Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AF149C4D;
	Sun,  2 Feb 2025 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498856; cv=none; b=syuOzDm56f7DwuqDHmhelHwUtGHKaP5y8mu+8jfg/oMim4eNx2a/XVlMVSN0Qku0NUDysopNWm665jSZgrRG2Opkb4NBX/tod4Kk86p/IuGGqDkN6QyeAtX7uO6TqaUolGzpkoq+u9WCb4NTEd9X3M0uEddsZznFj/H3ir/rDbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498856; c=relaxed/simple;
	bh=s849DsnFTggZktapb0+YgYRgRzElg/Ogh4dTWdMzKNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lj5rNUalMYq6D7BNmKjFJh1bX7ai4LhgfnP6l6FAp7Nl8bV4OO0Su6pqRtFPniM2680gYHyyb8sHKSo4qgKq2SCE8iIjhWJkryFExdAj4/pJ6uc9TT/AonRBmxNmZN5Mimu+ax0S+QFL+sjhrcTh3s2JXheOwBKVEYwLY/xaazA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgrk+Zeq; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgrk+Zeq"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46fd4bf03cbso45688021cf.0;
        Sun, 02 Feb 2025 04:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498853; x=1739103653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UZ/jhKzcMPvIsq154QirnMhNKke2d9TEFteb1izy9I=;
        b=cgrk+ZeqwMP8aotaRGgrmtWGH5kcvxxMe/y4YW6/E+9aJPp6wlU20aLtPUeE7e7G7V
         shvczgtSL4vDEk9Hxb0foSla8MCARyGptoSpJq0rfjRFNWpBiVxNAD91GOWwZQrzBZyl
         rbNcGDl3eiqst9NHQzvGt1r0X/g7/hgLNp3c6pl5wou0FYAHjhgQihDENxEW8ByAOgrK
         4YZxkxyhSZUlk9zHCHjYSB3blzsdLMu7RkTLF3mIhluvsP1NvhXwd5SjM95/05ubIP90
         SQDE1pRf9TfwZh+se2nXUaqc1vDp1yTKjDW0qXoewL/SIC8wKA1dkk5AjLr8sMEENb4G
         H23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498853; x=1739103653;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UZ/jhKzcMPvIsq154QirnMhNKke2d9TEFteb1izy9I=;
        b=us7rCD5m2QnMQt4cA/eiyK9NDoCo/ym149TMIJKBYFijuMen+Ry5W8IC0sqUG4sP3F
         6fNVFW4lNsMiRM8wCJ+RfT98e0km5eyS7oYVA6wTSMe+6sV7Bqhs6gafaWMIpsJmOdTl
         2IbnVcMnC5v0zR5txRzfcTRxD3n//2xG9tW64eAdP2mhByjfpRpS2Z048pXLtYTKUYfl
         rlLaPNpyr7lUc4AZdJmVwAAoS/n8eQ5WHo+Wve0v36wflNlIVL4GLkNNhtk1f5W8LXnx
         chqI9QJEL7y59Jr97MiVC25sKZX8PQMvQDPAa91nfjbIDMNdyehNVsQxHBKCUbOAl5tK
         S8+A==
X-Forwarded-Encrypted: i=1; AJvYcCUUBc+f/eVQK5XVwqgyAQ7XIUnDIhi4Et8uAVZeBmTCbJC1qt8sAjPb+weqQj333zrPdguJyhDw/5LTwGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxkpM/pT6z6dYLOtI6Z8YSKrWgj6hIs4R75FILe1U7b2lRiTxa
	9SHvMycEUOobg2d1pax7LfQAUrWOUBmKWDvXgqekCaINZUPuG+vi
X-Gm-Gg: ASbGncvnTXW12qaHAuYgWEzNYZyrsJ27j+cO5aAXHotjyx43kIHnxtrM4gqeTMNQsax
	DzdAQyIQelz9Gr2X20MEm8Llc6Hmk4me/Ebhx1QuCpDf+ioo8esv6BFpIlC8PNGBf69cYhhFP7W
	QzLx7o+KM0WYN8CU0Ton7tqHulVyuYbtTk+dI4eOqq94G0Btz2fX0dK7tN8nQxaNde2XzwsxJj7
	8zKKDJPV1DG7/2nPzIQPLn7Qz1qmQN22fFm7sY4xb6jEze4pCu545UG67/9YMax6/StKBX57tbR
	G9iD34vHvw/qb7zFcaT14jrAuJK1wnv0pREi5jY=
X-Google-Smtp-Source: AGHT+IGH4BTmM2azLsNHKPXoYHpy3bWscnq6RtmhrPjJ9h4o5oWDhAdmx4zXoNzRByyAzgjhDY1uGw==
X-Received: by 2002:a05:622a:5a05:b0:46d:fd08:7ca7 with SMTP id d75a77b69052e-46fd0a1d328mr280644241cf.6.1738498853012;
        Sun, 02 Feb 2025 04:20:53 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728efsm37700331cf.62.2025.02.02.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:20:51 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v6 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Sun, 02 Feb 2025 07:20:45 -0500
Message-Id: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1jn2cC/zXMQQqDMBBA0avIrDuSpJqqq96jdBHjWENrRiYiL
 eLdGwpdPvj8HRJJoARdsYPQFlLgmGFPBfjJxQdhGLLBKFMrozT6tAp6FsKh6tvettooP0LuF6E
 xvH+v2z17FJ5xnYTc/1CpRre6PtvalqZp1AUNbm5g4S09P9dFeOU4u/AqPc9wHF+EhcaUngAAA
 A==
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

 drivers/gpu/drm/drm_panic_qr.rs  |   2 +-
 drivers/net/phy/ax88796b_rust.rs |   7 +-
 drivers/net/phy/qt2025.rs        |   5 +-
 rust/kernel/device.rs            |   5 +-
 rust/kernel/error.rs             |  10 +-
 rust/kernel/firmware.rs          |   9 +-
 rust/kernel/kunit.rs             |  18 +-
 rust/kernel/miscdevice.rs        |   5 +-
 rust/kernel/net/phy.rs           |   8 +-
 rust/kernel/prelude.rs           |   2 +-
 rust/kernel/seq_file.rs          |   4 +-
 rust/kernel/str.rs               | 579 +++++++++++----------------------------
 rust/kernel/sync.rs              |   4 +-
 rust/kernel/sync/condvar.rs      |   4 +-
 rust/kernel/sync/lock.rs         |   5 +-
 rust/kernel/sync/lock/global.rs  |   7 +-
 rust/kernel/sync/poll.rs         |   1 +
 rust/kernel/workqueue.rs         |   3 +-
 18 files changed, 210 insertions(+), 468 deletions(-)
---
base-commit: bdf3d0e99c106932167de56141be5092762bab48
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

