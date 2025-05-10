Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B388BA27;
	Sat, 10 May 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869588; cv=none; b=A88YUII1w4Ev3ytEWJyvgesIN171k5cf+TFBvOU0ZxouKqStXTa0xoweh1cIH24ghbHWYx61i9wYDVQ7YjGeJT5NyY/Bk1GP+6hY6JuKQ4d4cRphZpSGRI+fOAJfMezQTvNjJiINIrZhNpiyaW5xJxZm3Dpw88bA3hropnPWLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869588; c=relaxed/simple;
	bh=d/Q2dqkM3hGIa7pRJKatBlt0uQwkDzQUldsLHN8FByw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsLcDsu1IKejTw2xEVPQ5uLDPJ+FU9bAT5Nh5UvUaArMvClZcemj53rep3NbOLm6GyjcMe5lLdkDUThefuq/hYJ7vAqafB/dLgp/G/9rsweo3gQDUcrkLHPwtHztMvLd223Z72f4zziVU261zLfhVB+eQsKpkjYKSvQfKTIM8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyFyf1Ni; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyFyf1Ni"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a20257c815so117044f8f.3;
        Sat, 10 May 2025 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869585; x=1747474385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zBTUK9ila/Am76tfftf45UmHXE5OHX/2meSQDmacZw=;
        b=JyFyf1NitE4S82p3FtnA72vTxN2yKwDiJX3j1w9n+ZRGdAUhtlHsC/5OLIUFglYnl9
         wNbGjcsPXyYjiMvIjjviEvmAHxneZlusQR/aTjRP8ADxA1YvAJ8YlCdcZEY+WgmF7gSI
         ChPMzabGaFb2FPc2LhRn4f1XZgtYaiHcUQ6O4b82vBKSm1L5MWz8d2fZWatCBO+pIGe1
         1qg6/Ozvtpw9jzr24sQh9r/65S73iRHSLbllYTpdDk4Bqv+1AI50nYz760aPbmn/Zi2B
         a6oA2bLzTLf10zX65xzdB8S9H4egclfN4ydpU19wdHLxB3UrW0aLHYCji1RvzKhT+T2B
         XXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869585; x=1747474385;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zBTUK9ila/Am76tfftf45UmHXE5OHX/2meSQDmacZw=;
        b=In5TfmIHXyzNrRz6SJ3BnTAIvrnhpz6W/zjfPulzK/eoB8GbS1ALVrs++KG8M5q0Fu
         wOF5CdEVS83/c8uXhtXYe+ascIRBHmosIEy+0psY36Qopf58uK8jJQoBfygZYVQ8MyCE
         4dtK1EDIP/NXI5D7ITH2ipRGnt5YfXRUIrj/HsvhS65/WpQ2T3I2Q9nHz6kTf5NjZnCd
         Gq/BeLy+/v/v/rf4rhMe401AZ0cv+5X1URzdA/Zfk3DdCsJqJCsU1r6qzjc2YdVo38je
         S4jHOT3nn6uBxuQ17F+LWmfWjSq9+u3DJ8vSjAdt7T0cwDPty08dMJP6FP3e+gpmyJri
         noNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk7CoSkx/dAvBDLnV5D61aF/lgZsYhi9x8FTTMljEw46Bv7czXUDtzYuk2HPiQbzQBsiwX4VrIlU9KTrE1OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQBaOuouZzxmMZiF7RtGqFWB0cNNpaV7iySGxc+xL3S3tYWEj
	Y19NEQ2X7xj8BMLP5LD5/cs3H4vz3jAMwzR+nYIMCmS4ZaDhuLhy
X-Gm-Gg: ASbGncumv2mb5ipWHS7mlSAFwyitvjYSBrsO9svwEsq/xNhOG1KufWILNnDMrMrV0Ck
	uunZaAnCSSt97MMp2H7CEKAY5VvUMQ2JFBIlMfgDN5faEnx609dOu5EuMYTZvGdkRyIv22Wz+1X
	1Y0bhjvxpd8YHbQ+dlwiHbjsEBO0CIeDIbscIcps38VNwQ2I0ds/DfqZxf3MDvcfePnWdHPQJXT
	95vQ+ymvs0DlLwHJNBkxW6Bq9K0lAJUQ9VmCi/SInSQz+Gj+rvtandwkYfDwE7KEPsDuZwDIVLx
	X2XvDHf2J8hiJ5MIuXwfQhh2qWg3fJdYCkRS6Ug=
X-Google-Smtp-Source: AGHT+IHnyP/lG7e9Gb+RWekvJAvxRIKIlVbkfvcf+0TPVjM7e8MKuRrz5aPODf9+w4RcEhWogWlIhA==
X-Received: by 2002:a05:6000:2502:b0:3a0:aed9:e39 with SMTP id ffacd0b85a97d-3a1f646c6e3mr5519558f8f.28.1746869585084;
        Sat, 10 May 2025 02:33:05 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm5981485f8f.14.2025.05.10.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:33:04 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v3 0/3] rust: add `UnsafePinned` type
Date: Sat, 10 May 2025 11:32:25 +0200
Message-Id: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkdH2gC/32PQQ6DIBBFr2JYlwYQK3bVezSNITAoSUULStoY7
 160Xbhounwz+W/+zCiAtxDQOZuRh2iD7V2C/JAh1UrXALY6MWKEFYRTgf0UxnpyQRqoB+scaCw
 qqhWwMq01SsHBg7HPTXq9JW5tGHv/2m5Euk7/6iLFFCuuyqIQeVUZcWk6ae9H1Xdo1UW2U+Tkp
 4Jhgo0SJ1rKkhPG94rlU9HDY0rvjt+ey/IGjbyv7gwBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746869583; l=1940;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=d/Q2dqkM3hGIa7pRJKatBlt0uQwkDzQUldsLHN8FByw=;
 b=fNIBzCK2rGyd0yhyM0HMpRMGdhkLEIhOldzeweIjdz3SN+t28c+wI5mzpIAbYaJpghqDYUfAh
 R7+Mt6jIIYDCc7DYjz6ZSlOkGo3rZKoTob44KU4i16mJdT30+95EDrq
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
 rust/kernel/types/unsafe_pinned.rs | 113 +++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+), 20 deletions(-)
---
base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
change-id: 20250418-rust_unsafe_pinned-891dce27418d

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

