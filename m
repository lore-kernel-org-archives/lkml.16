Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC271F0E46
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354124; cv=none; b=uPhA0AeqkW0a5lerID6iZo5BeeUiXYQZAO29hY3dhpvTjyBxAEp8k2bHQ6ya74tMYcLVdUI9XitdcWeK6cZFgwUnfs9TguF9Lg5933k+Zp/GSAj6Z6qxSRDrqEceDOBxdWzVOMUWuG6b8LTg5eyu/7GWZa2qgnA9zqCUrUitfWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354124; c=relaxed/simple;
	bh=fKS/+T4Yblhgtj5gjMSlva47t0SDdv/kmftNd3dioe0=;
	h=Date:Subject:CC:From:To:Message-ID; b=px2v2iZKsmVqid4cpFQ2JwqJ4xDCSbALXgmE1+giXT2KY5tbq2UrRsdsxcyaghLKex0kLfG/243d3lrXmBURcI7WObWSFVmuZ5d+uccA4SkIv6tNsRwgeljzmkidycN2sdD8P7d72w9Lgck3OumObCgqkeyoIOiMEnVkUSF25t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=H2HuDdjE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="H2HuDdjE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163b0c09afso42970125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738354121; x=1738958921; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBul5ysGPZTyDg4qnqAU/ekNzSdW9pjkuURf85NPIBY=;
        b=H2HuDdjE6Qsp2E/gD/hacZyix+eqSBtsvguA9+chbP/WXY4al1LKZiilBZYSpx8eXm
         9ISHeUsfrRl3BZKzaRPGiGIIxHbCmQfWl1ZL/dM4CXKbTg0d+Wah79AYwHSMQ+rizzXZ
         pALeHcMOVHoMO7ZiXUCF6VEhqMqxpoohGOfaLp0Z4myOm3ngvFXkOFIvdRL6z1bOxD0l
         qeWtfJb1ANYqbZebcf/DNbeetStfn5Fgrw85Pl3dSD17MkWzKM96iJo6JSWSQ14HA5x3
         Nl10VdeUX/TJnQgYiuQ1XT4L/eArnp7Hcnqa5zV5jfMVHpHYn5wsfccw1REMmYHUhPa9
         b6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354121; x=1738958921;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBul5ysGPZTyDg4qnqAU/ekNzSdW9pjkuURf85NPIBY=;
        b=ul77aV8ssAlO5f+Pl6sodRS6gBnBg+rceIvmftQSELJraQdFJ/CpkkCHCGroEUIgAD
         WrgNg8CKGDRnjc6GE6v/g50LuqKqln4YZ90TlOihM3rJ6j1bAsFbdnLpdHQqDZFdyLus
         BrknibUTtOQaAaetFxw9bQm3Cw7JahRWDglUy5NNAtbJW+ZL2UWl+cnNEt3sUNInfgNa
         obnLe80MDdDBwW+4S+A0wS7y4NOAI2YoiGxSgtH2vLvjGKqbzF3BAdHhlaX0LYlKJ4hV
         HDBEgwbTKXSpSQWr+CXv9qAxEhvAenJCdeYUHAuDLd9+S3Nj8Gpiud6MribhFHpXSPBx
         +m6w==
X-Forwarded-Encrypted: i=1; AJvYcCWBSyLFeWa5YR3E5s7mXLKULHu7KPwK9vkLYKUDRCkwZBbnu3hE01lWSohp8BoPxbkpOpL/0ZzvUXWzr2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsNNFL2Ih7P90XZZPNb/YtM+mpxqCVmJ6LUtejXb6dJjEjluQ
	GBfYO0B+lI4eqcLcd0Ea0cw+7Recpd9gqG9o68j0kaOiWMA2BVxY892RwdQPV00Aho3tuqLw4sy
	s
X-Gm-Gg: ASbGncsCeQafxyLmS0ukDKGH5Avx1MJNBh6BzQziS5fiYduLaJE9cNZYDCLNFLvI6wV
	9Ya+ytQG/7B74ytoSps7mn0IMwPKq3+hwPWWJYuRjAIUmR76gYyF0ILn5XER18sl0JGUaTFKNWY
	C3Z/lKajhYIGAkmVwzg9egI8XssS3GiVD0PusZkOgNm/aGGyMhoZkvNHTGAxVXVrhiT/NtlfVZX
	hunxAl6awStSfXYlvM6u8w+oBqdFxyZazDjvQGYfnEJcfA9oBPeBU4qkkhsBv28SkmzbINWm6eB
	LpA51LGXJYQoEg==
X-Google-Smtp-Source: AGHT+IGrMDfDUwByc0j7gn0ck3Oam/oLJvP4Nzd1Pw9CtpK5Ytij8uVVdjOi9PeMkBtoMSrpkyzWMQ==
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr184198085ad.11.1738354121173;
        Fri, 31 Jan 2025 12:08:41 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31fcdd0sm34501885ad.103.2025.01.31.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:08:40 -0800 (PST)
Date: Fri, 31 Jan 2025 12:08:40 -0800 (PST)
X-Google-Original-Date: Fri, 31 Jan 2025 12:08:28 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1

for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:

  riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.14 Merge Window, Part 1

* The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.
* A redundant AQRL barrier has been removed from the futex cmpxchg
  implementation.
* Support for the T-Head vector extensions, which includes exposing
  these extensions to userspace on systems that implement them.
* Some more page table information is now printed on die() and systems
  that cause PA overflows.

----------------------------------------------------------------
I don't have a second PR planned, I've been pretty sick lately so every if
something does blow up I'm probably going to be too out of it to notice this
weekend.  That means this also hasn't gotten as much love as usual, but
hopefully that's just resulted in this being small and not buggy.

There's a pair of conflicts.  The v_initval_nolibc.c changes also landed in the
new v_exec_initval_nolibc.c, so just removing it looks good to me.  The
vstate_prctl test had an in-flight fixup/rewrite.  Not sure if I'm just slow
today, but I'm having trouble trying to get a pre-merge `git diff` to show me
anything so here's my `git show --diff-merges=remerge`, hopefully that helps

diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
remerge CONFLICT (content): Merge conflict in tools/testing/selftests/riscv/vector/vstate_prctl.c
index 340ca64ccc2b..62fbb17a0556 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -36,19 +36,8 @@ TEST(get_control_no_v)
 {
        long rc;

-<<<<<<< 101971298be2 (riscv: add a warning when physical memory address overflows)
        if (is_vector_supported() || is_xtheadvector_supported())
                SKIP(return, "Test expects vector to be not supported");
-=======
-       ksft_set_plan(1);
-
-       pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
-       rc = riscv_hwprobe(&pair, 1, 0, NULL, 0);
-       if (rc < 0) {
-               ksft_test_result_fail("hwprobe() failed with %ld\n", rc);
-               return -1;
-       }
->>>>>>> 69b8923f5003 (Merge tag 'for-linus-6.14-ofs4' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux)

        rc = prctl(PR_RISCV_V_GET_CONTROL);
        EXPECT_EQ(-1, rc)

----------------------------------------------------------------
Celeste Liu (1):
      riscv: defconfig: drop RT_GROUP_SCHED=y

Charlie Jenkins (13):
      dt-bindings: riscv: Add xtheadvector ISA extension description
      dt-bindings: cpus: add a thead vlen register length property
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Add thead and xtheadvector as a vendor extension
      riscv: vector: Use vlenb from DT for thead
      riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
      riscv: Add xtheadvector instruction definitions
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Add thead vendor extension probing
      riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests
      riscv: Add ghostwrite vulnerability

Davidlohr Bueso (1):
      riscv/futex: Optimize atomic cmpxchg

Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

Palmer Dabbelt (2):
      RISC-V: Mark riscv_v_init() as __init
      Merge patch series "riscv: Add support for xtheadvector"

Yunhui Cui (2):
      riscv/mm/fault: add show_pte() before die()
      riscv: add a warning when physical memory address overflows

 Documentation/arch/riscv/hwprobe.rst               |  10 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  19 ++
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 arch/riscv/Kconfig.errata                          |  11 +
 arch/riscv/Kconfig.vendor                          |  26 ++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/configs/defconfig                       |   3 +-
 arch/riscv/errata/thead/errata.c                   |  28 ++
 arch/riscv/include/asm/bugs.h                      |  22 ++
 arch/riscv/include/asm/cpufeature.h                |   2 +
 arch/riscv/include/asm/csr.h                       |  15 +
 arch/riscv/include/asm/errata_list.h               |   3 +-
 arch/riscv/include/asm/futex.h                     |   2 +-
 arch/riscv/include/asm/hwprobe.h                   |   5 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 222 +++++++++++----
 arch/riscv/include/asm/vendor_extensions/thead.h   |  47 ++++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  19 ++
 .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/bugs.c                           |  60 ++++
 arch/riscv/kernel/cpufeature.c                     |  59 +++-
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   5 +
 arch/riscv/kernel/vector.c                         |  26 +-
 arch/riscv/kernel/vendor_extensions.c              |  10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
 arch/riscv/kernel/vendor_extensions/thead.c        |  29 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 arch/riscv/mm/fault.c                              |  52 ++++
 arch/riscv/mm/init.c                               |   8 +-
 drivers/base/cpu.c                                 |   3 +
 include/linux/cpu.h                                |   1 +
 scripts/selinux/genheaders/genheaders              | Bin 0 -> 90112 bytes
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  94 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  68 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   8 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 305 +++++++++++++--------
 47 files changed, 1114 insertions(+), 277 deletions(-)
 create mode 100644 arch/riscv/include/asm/bugs.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/thead.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/thead.h
 create mode 100644 arch/riscv/kernel/bugs.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/thead.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
 create mode 100755 scripts/selinux/genheaders/genheaders
 create mode 100644 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
 create mode 100644 tools/testing/selftests/riscv/vector/v_helpers.c
 create mode 100644 tools/testing/selftests/riscv/vector/v_helpers.h
 create mode 100644 tools/testing/selftests/riscv/vector/v_initval.c
 delete mode 100644 tools/testing/selftests/riscv/vector/v_initval_nolibc.c
