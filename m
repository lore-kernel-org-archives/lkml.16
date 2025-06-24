Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F64259CBB;
	Tue, 24 Jun 2025 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803098; cv=none; b=k7+pH/1SsDdUAGKoj+cChzaEYg1KlsEYRXp7VJMFrgL/tgPL3msstdqKI/Z6qnsGaxoIYlNgAMCFgnJfhG/Kz9dvDfJ9fw3RAobiLBSE8X4KAEPFu8UMb3y9ladVIiDLpHq0X+mCFBR9bEaUAs5aGBIcEuAsKnPn4IaqjJoPSIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803098; c=relaxed/simple;
	bh=RTSbQoXKHsJIMZB/LCsqqSlNCWAUFs2E7e/I2KFZoEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o4hmmEAaQNfR4tt8PLGOO4erib3TBGXnuMEtOOljrXmcknaypb4N3HKmdsk8WiDDyg+t+rpQ8u2Er6B0GbPi0NmcAl2VO/Q4HbtzBAzBnYB29yFbczAP0O4R1IhfsxX5DSzDjYiTnkFnzTNitbEkpAV1FSmmFHnHsp4QGmaqvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHQlF0Zu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHQlF0Zu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23508d30142so82721865ad.0;
        Tue, 24 Jun 2025 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803096; x=1751407896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5CTRX3KkHlGjcFRk0bbz+0kMSUfqMdaBATBvX6vFFs=;
        b=kHQlF0ZuFVqIl4CBiDxk7W2lR7USvy5uyn5Dt4gFpdkkLvWkVI5xkEuwel8N5e+F8G
         IbwdRiJ2YXlNzBNO425A/na5HwPye+gsO3NuzPNnLpf+pcyDalu33ql2PglA20XspkVz
         nmV1EICn6jfNxK8dq55S+U/JjMJrr9xx9Bb7MlWa/Vv1pPVo6SIAoCfss7jtrpM7Rwgr
         J3EvH8X0d/skEI/YUlCa9Wi0Wh+81uZDG+hlCPgSSug+ANFZVOEoUgAZiDuNCrUkU3WG
         Kvm42cq4sF9IjK4WusEYUwlATTg+AKCQUXJ2+tB9pX6hRGiaWUHtArN0fLUHy+PsnQVq
         anCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803096; x=1751407896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5CTRX3KkHlGjcFRk0bbz+0kMSUfqMdaBATBvX6vFFs=;
        b=EKyVwEapRm2N9Yj/QkW9U0P9hlHNM+7oVY29nBIXKAXBO2gZ5hOoiYLnf5bhQ0Wqtf
         23d33ITzV8+9SONqMiFAGj7mawe++blpy2ytZ5ER7kF+/927kcgXbEv6EXNx3gOwV0Fz
         O26VTF9U4rKX9O+W7rGvRRTZn2xoKmJyrkwKtz5ynPnVhUMDgw+35n/q+YjOKb3/nqNM
         hBE+umrYu6aYkgRjjb+Q06zT1HQgIeH2DRdL0FhCAWdQUo/yQZ8JWpMwQPRDTRgJF5qG
         X6mTVriMDI9rW3yqMY2OCi0kPx8gf7Ce8mvEM1C6fHwBsaJCVnW2yoC6aHMJnRuV/RyU
         eCfA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WubKsgHHXTgzzer26ymiCytzsPGGHiD6UBBKiy3H1ZtyOZ2Y7UoJ3oQvifi0MLi3sGItROd+s0/wO3gYIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaqBqGguu8VuYbmkIyNg+6gw4lYo5o3C2/zgLAGVmxJcQ8eow
	tkZ8bjrF7z8o0Kllzbm6TB2pAcSlhbXanWLvk0OJQgamNS77m4nNaFRL
X-Gm-Gg: ASbGncu4RcNXguS20ew1FvoC8UeBQqfGv+q2tBbUeoOleZUUFl/hZdYuC4UJCi/oisN
	uAVAto5nUEqBqvHfLa/DMg2Nwm5ECNbslWbm4rI+kCIdGv9ytZFuXcZwLKpzV8Dm/6n7g5216JC
	oBzPIPunrC9ekfMHi2yeer7g6swih8fQaIi+F44gFbNfR2UiEmJayU8vRAhxVlt3ZGt/TRNL+QR
	DzNZ5nSBC2fZSLlavClo2G5AwkzDvFT9ZPTuIH7aGEygBxdUg8CWb0xk7wsmWvxCzroOrEJue0/
	dGsIoWjI6peoRhD+qy+Ciq2nDIPM/pd9f3CihLHsuj9skJ4OYm7csq2f0QJ0AZUm0WYtyrpfvj8
	m/G8+VN5FzbX/p+5dBQR8+J1f/Un/Cnm9ODzK
X-Google-Smtp-Source: AGHT+IFFPWi8QliFPd0Sc0o/w6WVvHWZb5kz2zNwHPi3lUANiWLNoGoJO3ziNo+Tyc4IekT813aVyg==
X-Received: by 2002:a17:903:f87:b0:234:f6ba:e689 with SMTP id d9443c01a7336-23824060218mr13677935ad.39.1750803095199;
        Tue, 24 Jun 2025 15:11:35 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:34 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH 0/5] rust: Add Per-CPU Variable API
Date: Tue, 24 Jun 2025 15:10:38 -0700
Message-Id: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4iW2gC/1WPzQ6CMBAGX4X0bE13SyN48j2Mh0IXaCI/ttBoC
 O9uQU3kOJvM5NuZeXKWPDsnM3MUrLd9FwEOCSsb3dXErYnMUGAqMpDcTX7kA7lymDhprFRaKKO
 lZNEYHFX2udWut8iN9WPvXls8wHrdOoCQ7zoBuOAocoATZYgFXOpW2/ux7Fu2dgL+XCVSSPcuR
 leRFkYYAqnVv7t8Rjl6TPGz8btsWd6pONLn9wAAAA==
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=2390;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=RTSbQoXKHsJIMZB/LCsqqSlNCWAUFs2E7e/I2KFZoEM=;
 b=HO/BzmilRVBVwNy132xyPGNkLjGLx1se+HvW0IVE9mKLmIXGQvugfkSRmtWBvt+3CYYVKm6Oj
 0TRTlZdZbkuC09DhGtWYqdPUJVMU/xxvSmDo/VQhv7whkGPZxNHe7h8
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

This series adds an API for declaring an using per-CPU variables from
Rust, and it also adds support for Rust access to C per-CPU variables
(subject to some soundness requirements). It also adds a small test
module, lib/percpu_test_rust.rs, in the vein of lib/percpu_test.c.

---
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

---
Changes in RFC v2:
- Renamed PerCpuVariable to StaticPerCpuSymbol to be more descriptive
- Support dynamically allocated per-CPU variables via the
  PerCpuAllocation type. Rework statically allocated variables to use
  this new type.
- Make use of a token/closure-based API via the PerCpu and PerCpuToken
  types, rather than an API based on PerCpuRef that automatically
  Deref(Mut)'s into a &(mut) T.
- Rebased
- Link to RFC: https://lore.kernel.org/r/20241219-rust-percpu-v1-0-209117e822b1@gmail.com

---
Changes in v1:
- Use wrapping_add in `PerCpuPtr::get_ref` since overflow is expected.
- Separate the dynamic and static cases, with shared logic in a
  `PerCpuPtr` type.
- Implement pin-hole optimizations for numeric types
- Don't assume `GFP_KERNEL` when allocating the `Arc` in the dynamic
  case.
- Link to RFC v2: https://lore.kernel.org/r/20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com

---
Mitchell Levy (5):
      rust: percpu: introduce a rust API for per-CPU variables
      rust: rust-analyzer: add lib to dirs searched for crates
      rust: percpu: add a rust per-CPU variable test
      rust: percpu: Add pin-hole optimizations for numerics
      rust: percpu: cache per-CPU pointers in the dynamic case

 lib/Kconfig.debug                 |   9 ++
 lib/Makefile                      |   1 +
 lib/percpu_test_rust.rs           | 156 +++++++++++++++++++
 rust/helpers/helpers.c            |   2 +
 rust/helpers/percpu.c             |  20 +++
 rust/helpers/preempt.c            |  14 ++
 rust/kernel/lib.rs                |   3 +
 rust/kernel/percpu.rs             | 306 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs   |  35 +++++
 rust/kernel/percpu/numeric.rs     | 117 +++++++++++++++
 scripts/generate_rust_analyzer.py |   2 +-
 11 files changed, 664 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20240813-rust-percpu-ea2f54b5da33

Best regards,
-- 
Mitchell Levy <levymitchell0@gmail.com>

