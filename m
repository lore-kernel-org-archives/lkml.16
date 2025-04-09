Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFC2135AD;
	Wed,  9 Apr 2025 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181926; cv=none; b=UWxFAY0UaOXjroPzejZ+aG2WlDoPS41TcxNh5NgvnI7Rny3HmqDcZ/QZRahFWNv531xrHuw6xIIpbj81HZfu0rOy+oA2YuZJJJFszEIiOJCrUc5A892+oDk1EtEFp4etuIXmjZrKbi+E4tstwm/AXMRPB6gx6alM8N+KZo94IC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181926; c=relaxed/simple;
	bh=ssDD1kW5JSR1Z4yzJ04AQNes/YaLGBHflCTnsWlmZ14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkzwwLckMt1XE4MNYQWgFSM4qs75GjNnL/ERBcmlSPUDl2s26dF9nOPNwo1xCuH2E2L0Dv5qUn3+78GphrNoJepCjIJtR+87uYWKtJKZ2dS0c9tIaRDcJd4sJ94Sf2xtsemPL+Dde1HiRo92XsvnVvYOi8O5Yg/Q4UH9OuhcAvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOJkvfOu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOJkvfOu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227d6b530d8so57602305ad.3;
        Tue, 08 Apr 2025 23:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181924; x=1744786724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tuG1FMMyGEJx8Q/a143BVklY8otPVHsKGWCgeB32e5Q=;
        b=cOJkvfOuqimAldFwBEUXE3PVTDk6Sehr/Avp5wexjP9sc3sbUlLmckx5Cm6PUsGjiT
         vXKWGANLH/5GR1hk/uQRDrg7N4F+Bbifx2b9imC6t0/jgrgFmQRCgu2zHeOQhWc+lQan
         vs8oOZGxPMZ51a61UHw7XLbrIPzIl1sUA3lX8IGdXQ8Mi0JLAvfWaq4CNWSLxnCbPnE1
         /mQB29wIcDN8fMs/Ozvttr3vewtP+ks5YCKjNRwGBq2nq4HmyhTnGsUu/xganDXokuu/
         9QRgSYrnIRu/ObSbaqzL1f5KS0h4mwz+Z1ffc4zLQtf7OioCO3nPZw8e8sHkzZrUJDVj
         E1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181924; x=1744786724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuG1FMMyGEJx8Q/a143BVklY8otPVHsKGWCgeB32e5Q=;
        b=tC7RbIdR/ZfKoc6E1TIPNAZNAbNXlujUl9vRIDkiRIvOm7W6ruRO83TZSjPq7ETwSf
         nV9EubB4zpo1e/Jcxz6t5iMtDm16yZEM7e0tSTIn1AFA61El31uKGyEUQiLnYNKGAU1D
         u8z1KuP19PLwsnJEDZoGWgoOrFZ1x+x1ddS+v1JWKHlw7zLKSo1VLkKxkW+tkngaogFE
         JT8b7bpUmG8l38yuokWn1jZWLw7HKbxlsT4AA66wwiraPdRTFJODpGx0LqMD8j87TOcG
         zU05cqhbZuwvu+Cy2E0jXzonSuWcCiQ3xwpxnh9cElSQKV77mvIwFUt09+hQuFZ/o5ZP
         jKbw==
X-Forwarded-Encrypted: i=1; AJvYcCUS35M4orQikQ8Es8o4rbsNYpLtg6j+CiOB6GikLobN88yTv5ylLlflWI8yTeDQVxLzdbLrgTkbLkHFh2fdWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjLffgIeZl1F31nDsu8ivpLBxJ5cIP+njlRs7GAedp/1ZoXg/
	2pEOrr2zzp4uHHUMHjRcnONcI84E7RdsL+9Llb73osd2o/kpl8qGgKeb+IYV
X-Gm-Gg: ASbGncvQNl/Qtm854tlk/9/EMNsYanIrCwggfaYOXx4U3NOZ5U6pyr/MqTY3kaVnoEU
	GVx0e92PALaNiGOh4r9RM63bXRl8foLGQVzhkX/pwevbfDYBct4chbHi20zrnKIU3dFPNaaJrLS
	9z5H7KRxZsCCY093oMh36aVDlcK1GZUphXrHdlzJJJ5fgSMsyaFzF/zkWHvF7bBopmytEi2u6Nj
	sVuow46Y2urBjvx1MzBNmKrB3JknnNc4V1d2onrYRirQoRqTJqlc7OYG9Z38Httvavl+OUZuOO8
	VXsjxbymUSIS7sQ3Uzm+aeOiLR26pNT8MgOtFOZcGjSb9Zj7VGGvsmlYkX9l7gned/CVaV5D4Vs
	tZWzfSKY4wBPuBJ2Gew==
X-Google-Smtp-Source: AGHT+IG81noXBo50t3m2OCMXKg+0aYF1KMaorNM1Bcv25LP3aY0UkFvPSaDMXpFVTZFnE5FrkJ7rsg==
X-Received: by 2002:a17:902:ec8c:b0:215:89a0:416f with SMTP id d9443c01a7336-22ac29b86abmr21043375ad.30.1744181924161;
        Tue, 08 Apr 2025 23:58:44 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:58:43 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v5 0/4] rust: Add bug/warn abstractions
Date: Wed,  9 Apr 2025 15:57:57 +0900
Message-ID: <20250409065802.136971-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds warn_on macro with the bug/warn abstraction that
utilizes the kernel's BUG/WARN feature via assembly.

Currently, Rust code simply wraps BUG() macro; however the approach
doesn't provide the proper debug information. For example, I added
bindings::BUG() to rnull's init method and got the following output:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
RIP: 0010:rust_helper_BUG+0x8/0x10
(snip)

The kernel's BUG/WARN feature (lib/bug.c) can only be used from
assembly. Rust code needs to directly execute the same assembly code
used on the C side. To avoid duplicating the assembly code, this
approach follows the same strategy as the static branch code: it
generates the assembly code for Rust using the C preprocessor at
compile time.

The 1st to 3th patches export the BUG/WARN assembly code for Rust on
x86, RISC-V, and ARM64 architecture, with no functional changes on the
C side. They have already been acked by the maintainers of their
respective architectures.

No change for arm32 and LoongArch; they still use the current
approach; just wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch, arm32, and UML.

v5:
- fix indentation in the macro
- use $crate::ffi::c_char instead ::kernel::ffi::c_uchar
- add support for building on arm32
v4: https://lore.kernel.org/lkml/20250305110814.272792-1-fujita.tomonori@gmail.com/
- added Acked-by tag to the RISC-V and ARM64 asm change
- simplify the asm code
- use the cfgs on the macro rather in its expansion
- use a const fn for bugflag_taint over macro
- dropped LoongArch assembly change
- dropped warn_on_once; make the patch easier to review
v3: https://lore.kernel.org/lkml/20250213135759.190006-1-fujita.tomonori@gmail.com/
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/lkml/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/lkml/20241210001802.228725-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (4):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  rust: Add warn_on macro

 arch/arm64/include/asm/asm-bug.h              |  33 ++++-
 arch/riscv/include/asm/bug.h                  |  37 +++---
 arch/x86/include/asm/bug.h                    |  56 ++++-----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 114 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 223 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0

