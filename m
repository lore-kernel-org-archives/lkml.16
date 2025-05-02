Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75E1DB127;
	Fri,  2 May 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179177; cv=none; b=O/J3+Aq/mJ0yeSn56UqYG8q713ZRhhZ1YdNu6wfALGzOibjzEw7uROP9DxUsh97F5czNASN9P/ra4fH0liK24bOKTEkYuq7AlnqRYb2W8dKZ0CVY8+Ylfp/9tufGdF8iOEZRT4eJtkJf55I5W0MexDiEa4GFgsM+dh946s0m3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179177; c=relaxed/simple;
	bh=bL9NGsdk8Xu5wuKyoqLCssxfxtze5NXykOh+kVgSZug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbzuP8wn64U27Wyb/9nImYCdR52Qez1ybGRq663R21ALbOGkib9YyFG3HZoHPcfodVvTS6iiVcp3mfxHVaIhfpPHsSEVK+nbdTldoq7gg0QCK9w7nqB+AAadHwXRQWOOcBCgeOBv5kM3yCM2scwvLREyIsLMYjkg1c/WJc7o040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8raex2G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8raex2G"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2264aefc45dso29498285ad.0;
        Fri, 02 May 2025 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179175; x=1746783975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=c8raex2GrzU4Q4321WsvAELpLVcbeelhfAdG25UX9Io/GcgoLzknHeZRfZ5H8eJORa
         VBohzQIMTkUnPZVunUS56aJ5sWpIpdy7fC3z3Ah+fql5+633tb7u7PEa3dIrjVaghiAc
         u01zABngNs8C100AH1WhyMqRThACUwoXIijRJEGhiUS5XqJR6peEvKIL4uUytHb1CTph
         uYUCPrsvrDg/T/S79Zt6YOiyoKUGTLqFZk9hER8tlGNkUPkRx5pHlSPO6hfUoJDkTFbU
         F7W1DSYsYqmxiFgFtn4N6B5x6U8sfZaZpgO7akURdidQhLGnvCvXrpbqnBYk7mQcTNQ2
         +nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179175; x=1746783975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=G1vt7UiqQ5f7yI2PWDTaNY3TVdeHPD7LfsyP+tT9/Z0zkCngoZ48QBeL0f2bMzDQNy
         YDUsxFDejZ8uQPH6aCjQ+KRqRYW8RKGsNAZiRndA76lJ7Qi0RSMIgHY/u483vlXTHgP9
         27I7Rg95G2q8eiHNFyx3wZx6N38Jc4yvu9pvIe/Psc63OPZHGJacHLFyPs/S9ZWbZ2C5
         QSdI+rX3+dDGCRP5edptk+lp9Qpu5TtZCCndPUs3luDL0mneI631cECA9ioFjdBPdN7F
         x/vzsy/ImdujeZfcvs64JxQTWTwnVxH/k8bQyg5vsHc8t6mHbNv1vWI0U6P3y0x8Ll09
         YcPw==
X-Forwarded-Encrypted: i=1; AJvYcCWRVvB6EN9QPkLC6QlRqW3Pw6+yFsklIK0SK6Fq4KND0/khVW8Ijlhw9ej7RPz4R/02WvrOkfkZsxmZRz8TXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQjB3j/7KDvob1wA4j/ZLDlPPUkfAEP/MRkXRQyujoM6uj5Eb
	zTLhlQfqJUqmPr5muDTktY88JZE90HFD9VePhwM2JlZLJwO26eO6xTbdXvAR
X-Gm-Gg: ASbGncu/aqqAIOXor0SYaPoOsuGPnBWe87Gpad5QdsTEkI/QgamUWHhYl8jDOqF6hLF
	XkDTi/6NELX8xxmkb7leB1CrfF8FIjRAWCrlkFnFNFI0Uy3T/sBEExBT/HOZxXlJlncYHEXFAiI
	kYOdwMkvpQ/Ppeb3CxdsxeI1f9s4XWcMGhi1eiNVfiqhx58Yv1hvBRT9wdcTk0oJ+5H3Y8tBSyK
	iT5775LzUs/3RNSX9SxqrgmqQ/A2M7NIrOFHwZErHtCIn7QnrFY4z3QMDE7IjoVe4jMnm0QBSEe
	dCjQjyePEHp1gLaQfJ5i4T0OMIavlfeS6zFw1Cxb3FFNRUswASPu1ciqeoAE/w6PDwv3dxakznM
	UKFFSpb4FzVF8BFuu7w==
X-Google-Smtp-Source: AGHT+IFCrNB3SEcUQSA4UULBWiPKSjzAq293G3JdHTwJkUqWADHaR7n7tHS0qoEezDF6fogaeNgeTg==
X-Received: by 2002:a17:903:2ec3:b0:224:f12:3734 with SMTP id d9443c01a7336-22e1030ba06mr31764015ad.30.1746179175181;
        Fri, 02 May 2025 02:46:15 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:14 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 0/4] rust: Add bug/warn abstractions
Date: Fri,  2 May 2025 18:45:32 +0900
Message-ID: <20250502094537.231725-1-fujita.tomonori@gmail.com>
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

No change for ARM and LoongArch; they still use the current approach;
just wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch, ARM, and UML.

v6:
- improved SAFETY comments
v5: https://lore.kernel.org/lkml/20250409065802.136971-1-fujita.tomonori@gmail.com/
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
 arch/x86/include/asm/bug.h                    |  56 ++++----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 125 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 234 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.43.0

