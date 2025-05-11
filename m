Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D12AEE1;
	Sun, 11 May 2025 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987716; cv=none; b=ecLg/l5Fc7mMV3HHwjFFxao+w8fYLBTI5oX8OuSSGouvt+cV9uXUfHs2OZRTzxBc9bgwTWiHljNyv+HeAnaZsBEbRNbUTD7hDyZgZFOjcjcbpPkGfPmrCqbF/bGM5FocOtThYtfqDsZ9PgphLBtC3uEuDNn54RpBdSB45Md6adA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987716; c=relaxed/simple;
	bh=OQU/MiZE+lT78EcpBRSF2Uz+WZgrmhl5vkUnIF/lTd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WuNPPj55ZVRGjAnlqD6q3BGXXnZ0itHfLTVb2mP4ikeZ6WmzRfKRQHNYAKKgyI+O7ffUTT0d4VxRWhM9C+vU4YRPtnvCP5cX0g1nA/eDy8SPesSWOIHILMA5dRnoLatjWXu0eWrKWb+2dSCR77Gdw5D6iKdPRUEckhLTLVBdTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVBypxH4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVBypxH4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso22094315e9.0;
        Sun, 11 May 2025 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746987712; x=1747592512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ0kQFFRJhlcfHJoNQHTfxXn8KRZzMbJfL2Nt0WYTos=;
        b=ZVBypxH4hFNzo1OZSZgpMrBwgpfNVRw7inZDuQimf7CyfqBakHQWqDQENoF5B+WnwT
         KnrzOBNtprUCIxtqvp0Wp+FCXMzXNsEtiOZeDd+lkzvbEpwoQkYj78ktPo7/w317D1DK
         fQZw0ixTSNLNphpyYNviLXRc1oe0hY/+/gIzXSDT2OwV4Te8HmjqLxZene6aHjqb0O1h
         NhaR5FGDKbJnxa77I2HLdv8BTKZySSjTpgHe3BzTym/Ls7gLktLydpRanQglcKVRFqR2
         MXSnmQODXW6/FAUOcokMWIe5o9tFQZkIcyBvsE4PG0bOCfaBQxuC0iA6ABDSWqVORjt4
         AR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746987712; x=1747592512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZ0kQFFRJhlcfHJoNQHTfxXn8KRZzMbJfL2Nt0WYTos=;
        b=Z6b0tDMse+GVGm/F7/ehbn9JBg0y2Xme13KEliYqcNwyCrZa1ZJ+/TlQVIW8vEDgAn
         zx/z2r/as1ef6JYkDo7i9LXtJjsNmEzy1tOwFlJlvtf8XK8TLENeJP4nbGjGfkk6Vb1L
         qvz6ZpeTnDRemNNxIrDpjpj8Zlha4rUvvPw1cjRL8MOmw+LqShjSAwxU7aT+xxZyjiNK
         4uCczpZbWaWUW71w2wl19BXXNYFvRrYDBcelF5bDLVTu5mR5379OcWEy0Az8kcDX3ZE/
         q+6ipZxbyKhzjuhTDRvwcXfqGSZ4bjmcbhjVrgdLyoiSJcmXMvuDSvPq6k7cwHjnjfMb
         sW5A==
X-Forwarded-Encrypted: i=1; AJvYcCXKz12HboZQCl17MP5i8/hGuRG+EV84VmH45fxN+6kTetx1dZMPahSzXup+ZKdjPUfJkIwSSRuHlwhZaVMGVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6v/Hpza2O2JNupMvXK+/oKvhjd445LE9iMIUefzpCiEbX7dQ
	2TF7682Z43+0U3LWbTVNSrmAqLd1oaqkMhWky79FXD3yz7bufRsK
X-Gm-Gg: ASbGncsU5E9JmHZr3ykIgNHkMFBwh1wlGB77Pd3LtVlcrpR6ardsu3PcD5F+itmNnwF
	QOU9Jk2MLuaR24p22hzcz3z2JZZKI7nSqmrEgkFopQfQ70KuyX+7h52CVl2gc0vjGqtLGVRo+lL
	ZZFXAiqFYJnl2gAvsRg/5sZbE8998FFMkXFh32hTLVu5vb0QzZGH4V6qyoG1ObMLLG4LL+iY6Hj
	twcbrb/JoK5lLXKwsfvwUFj3CYaaMvFnpnxPobkIyNdfECrxZld0fZwnFZPe7Kkce2IqMQJqOap
	Ppvy6CNdEmNtk9WkYpGzlN5/iLPtQKuPGowL7A4=
X-Google-Smtp-Source: AGHT+IEedUo0JnIyvB+xFL02RSn4lSVKbzxYFR8cCI0p+JgetbwSYY+hM3hU0Kr1wgriVJhQ9olIlg==
X-Received: by 2002:a05:600c:c18:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-442d6dc7ce7mr80549435e9.23.1746987712257;
        Sun, 11 May 2025 11:21:52 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm100418495e9.4.2025.05.11.11.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:21:51 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v4 0/3] rust: add `UnsafePinned` type
Date: Sun, 11 May 2025 20:21:37 +0200
Message-Id: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHqIGgC/33Q2wrCMAwG4FeRXltperCdV76HiIw2nQXttN2GI
 nt36wEUGV7+CflCciMZU8BMVrMbSTiEHNpYgpzPiN3XsUEaXMmEM66YBENTn7tdH3PtcXcKMaK
 jpgJnkevSdqQMnhL6cHmim23J+5C7Nl2fOwZ4VP9yA1CgVlqtlBFV5c26OdbhsLDtkTy4gX8Rg
 k0SnDLqrVmCrrVkXP4S4kMomCZEIZS2CAqAC199E+PryoTnvnyse586jneD2LxQTwEAAA==
X-Change-ID: 20250418-rust_unsafe_pinned-891dce27418d
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746987711; l=2125;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=OQU/MiZE+lT78EcpBRSF2Uz+WZgrmhl5vkUnIF/lTd8=;
 b=nI4QpPmvG+e68Xcuk6TCzr//BZzS8dD3iJ1+NjwZ0fHhMa+3ZLXlhzDpkhzD8kIieZGm7tUg3
 pmCGq3XM31iCx7aLSPTYclz3sA4wPVTL7ug9a2sTHvp1HcP5fGzmhpS
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This version now only has the kernel implementation without the
config flag for using the upstream version. Additionally now
commits for using `UnsafePinned` in `Opaque` were added.

Checkpatch warns about `rust/kernel/types/unsafe_pinned.rs`
missing a MAINTAINERS entry. This should be fine because it
will be included in the RUST entry.

This patchset is based on the pin-init-next branch.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v4:
- Reworked `UnsafePinned::add` doctest to not use get_mut_unchecked.
- Link to v3: https://lore.kernel.org/r/20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com

Changes in v3:
- Dropped CONFIG_RUSTC_HAS_UNSAFE_PINNED and feature(unsafe_pinned) (Alice)
- Add comment to `Opaque` reasoning about included `UnsafeCell` (Benno)
- Small changes in commit message of Patch 3 (Benno)
- Removed docs mentioning not included functions (Benno)
- Removed docs mentioning implementation details and added that as
    comment instead (Benno)
- Link to v2: https://lore.kernel.org/r/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com

Changes in v2:
- Expanded `UnsafePinned` documentation to describe differences
    with upstream rust implementation.
- Removed config flag for using upstream `UnsafePinned` type.
- Add patch implementing `Wrapper` for `Opaque`
- Add patch for using `UnsafePinned` internally in `Opaque`
- Link to v1: https://lore.kernel.org/r/20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com

---
Christian Schrefl (3):
      rust: add UnsafePinned type
      rust: implement `Wrapper<T>` for `Opaque<T>`
      rust: use `UnsafePinned` in the implementation of `Opaque`

 rust/kernel/revocable.rs           |   2 +
 rust/kernel/types.rs               |  45 ++++++++-------
 rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 20 deletions(-)
---
base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
change-id: 20250418-rust_unsafe_pinned-891dce27418d

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

