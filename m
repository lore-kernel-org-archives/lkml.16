Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8410E0;
	Sun,  2 Feb 2025 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738513891; cv=none; b=Nmn5OWISbHp3Q4aoNIMP8T7GUNj5HfP/Iu2fWLz4Mrmtbd+L8BbMS9MfrWK/x2BnhfCnekTH7QOp4VGMRAO1TNqb2Ne7cVt7UMHIHcB1Fp2/ukMygffQG19rOy4zYvVDBrO72uheDg8gJZmpze30XkFRuUIJQIKGAJVhQjJbjVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738513891; c=relaxed/simple;
	bh=f/8hqyoxQyBoICvf0FDDfi8Z1w0+qn905fN9HXKYlO8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VGn50+v09tFsylr6aF3ixQdaVTFmlQqmw9nGTWTCB+/dkdas0DHl2FlNFAZK+emf8XIEZHE+yDMzU91wod7odk2lwOLI6sTW32x541O+3YzE7lC71vhkORaX0VvYJRIUmCm6SqFYkuT9ayBR8MGF8foO0FWxxUWoSfpq2MTdYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmtV/lwv; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmtV/lwv"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so335731285a.0;
        Sun, 02 Feb 2025 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738513888; x=1739118688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CX2tEbZjfW30DHZEbRV7ndVnuEeSBPUCkPw6+CwbZX0=;
        b=HmtV/lwvIkVhD7cvbkthBeoVcN2s8bAXu3LRZYaCONTZgeC9tLAix5xgcw8dtTeHW3
         MuGaHLoDg+QW6oVSwKG18Gxd3yQkiC4niuj2Chhh/s5KtFHnJTKWz0hstcgc02A3l1h7
         QMjPa9dVq0iKif7U8We/385YIVNds+f7uFg8aOAKj0n7Ip1y61jzG5qd+6K3V4RSN0cz
         54B4oFTcy4B4Wj296WCKEFsfhfRF7fOCmUJMMWEqrvU+D0+VxOqwJFfgWK9DPOmquQLz
         JZR6JdSArtCD7SzZcoKnYAfAtKXTUBZjJpZqVhFx0lh+8nbFb/EGyEt4RpWmS3Td9O5j
         pc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738513888; x=1739118688;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX2tEbZjfW30DHZEbRV7ndVnuEeSBPUCkPw6+CwbZX0=;
        b=WwZ7ETtm+Ynx45Y23kSRcSWKT1Bf8BQW9Eib4Ns+PzznfxesMJHCW0e1YI7+V/mcCO
         VDkydVZVmPLIwC0oB/bLAVutQ+haLWpyYJbEdeH4P98c5VQ74QZi619Ms3BvraQp1KUc
         7R3IPDjE4cBpu5Gzzv8+dkPCbPuItF85q2MXypXY0UObNW88uS27YEXSswvAj6bwhQ9p
         Ae6I1OaXVEBH2mE/851pHHvwT6FfF+po16QKp8Wm2Ib90YCv7oxW37r89xqP0wVEHQIN
         WsOUhR+EvAjff18MxbX7CAeIKsh0UiMLHBqDHLqjMiDkX9exgzmUb9DRoLl8szgAaFK0
         qDKw==
X-Forwarded-Encrypted: i=1; AJvYcCWY5cDT2Ig/Qu/EIe96DvYr9Kg1wkdWDCAIU7AvyVrEYKaY210WLVQe5SM049vWptyWJDagDs8uLeVnQPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgDQrjG79T3LccyTRnkWwoQW0uoK1Fvfv2ccpcoFQBOV25lWp
	Q37s0RV5CtCu/fLZVcp8hfZwxVbVsKUaVpujJKPniFM165bRCJK3u7U7yYp/gWQ=
X-Gm-Gg: ASbGnctNyHJ09YOwhuy1eiPWKzLqqDQ0DLRatgt2bqR0Jdn/F3/MXaOT0LLtVJ5KV66
	GRX8dRl7uVPSDmG1swcGpJvshRBtrqXDbXiu97hM4hSY/ye2njMvo2pQo4bDh0B3I+J64Qfu8th
	cNHOtJB9N8yRwlQftwd9hbNAT7mqL+sj565UFPoSSSmzuCNubMAvWGv41JFwroCAMIRfm6cCeu2
	qErN4fr7JPMeQIyRRyGcAb3XVxblzZm3SoCC1ly7YjdYmROFAPq+xTy5Sw5iYAjToqUfjbc31eP
	j/I1KsIESeCrhUcjrVzlO/oErWHPQB8MFxWr5Ow=
X-Google-Smtp-Source: AGHT+IFViBcU/g7dABhVU6ondqLcaUJJgCM+ntAYaPBm3vgZUu1htM3RNk+8aRXBhDRj9oUU4dcYlQ==
X-Received: by 2002:a05:620a:2b88:b0:7b6:d611:5d35 with SMTP id af79cd13be357-7bffcd137bdmr2986560685a.32.1738513888078;
        Sun, 02 Feb 2025 08:31:28 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bb957sm421307485a.14.2025.02.02.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 08:31:27 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v7 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Sun, 02 Feb 2025 11:31:17 -0500
Message-Id: <20250202-cstr-core-v7-0-da1802520438@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWdn2cC/03OQQqDMBCF4atI1h2JqUbTlfcoLjSJGlodmUioi
 HevCpYuf3h8vJV5S8569ohWRjY473DcI79FTPf12FlwZm8muMi44AloPxNoJAsmbVQjVSK4btm
 +n8i27nNaz2rvlnCAuSdbX0LKi0Ql2V1mMhZFwXMQEGqDhMG/lnIinHEcaveONQ4H2Ts/Iy3nu
 yAP+Doi/o4ECRyKVCptpBGqNWX3Q6pt276ya+Sb5QAAAA==
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

 drivers/gpu/drm/drm_panic_qr.rs      |   2 +-
 drivers/net/phy/ax88796b_rust.rs     |   7 +-
 drivers/net/phy/qt2025.rs            |   5 +-
 rust/kernel/device.rs                |  15 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/firmware.rs              |   9 +-
 rust/kernel/kunit.rs                 |  18 +-
 rust/kernel/lib.rs                   |   2 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |   8 +-
 rust/kernel/of.rs                    |   6 +-
 rust/kernel/pci.rs                   |  11 +-
 rust/kernel/platform.rs              |   9 +-
 rust/kernel/prelude.rs               |   2 +-
 rust/kernel/seq_file.rs              |   4 +-
 rust/kernel/str.rs                   | 591 ++++++++++++-----------------------
 rust/kernel/sync.rs                  |   4 +-
 rust/kernel/sync/condvar.rs          |   4 +-
 rust/kernel/sync/lock.rs             |   5 +-
 rust/kernel/sync/lock/global.rs      |   7 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   3 +-
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 28 files changed, 285 insertions(+), 462 deletions(-)
---
base-commit: 66b0c25a3f8d68907fd62e7b614b2772306236fb
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

