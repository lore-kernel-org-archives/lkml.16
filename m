Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0301F4E3B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273060; cv=none; b=UquuYKDih7rjAW5HRB7S4fsD0mQuEbLrv5FYFxzyEblrQJpw7j1707hnzQjE1EzphYdj+Zt6bR0QiYnb+6XunogYPgb6TBDnG0XGlQiKGUM6x0ievA8Dr4pPw6EAtSW30eWlAaCW8ggneKIrGc/9c0M4Ev5mF6FdbRC/+Md/eyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273060; c=relaxed/simple;
	bh=6+5HzJHoArW8KiuCIgTRGV34Mq0g4ZBMkNb+IArKXns=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DuBkXdmAtc/MRL+qQ1pjNtp6P5BO1JVfpWsEFSMJ23fhnBCQEp1MAdmo5sN1SpRsQEjj2hl8qXCfJH1Zi57NUdD2i9xJ2U6Mki6yJlH0UA9EkB3A6xSLMiclUtTKbVAvFUFPtOiPDWbd9ghHAaDN07gZmVM3WioXSPqZRj7FXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ty8qPvVa; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ty8qPvVa"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52054c55991so700344e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739273057; x=1739877857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOfjVZVb5Y6iDzKKUHv6/nHA/mRe1wtMuOb87tFD/sY=;
        b=ty8qPvVa+yhCadcGa8aQSP5eFnbO50ciknJ+n2LMmoEY2s+hT38hnCHrZOAyOMNoAb
         ctADbkCtBesivgNZoGT1Q6LMy42XUVDTve1G6AdB08PxlUr4IE34WgX4TT+iS6/niKFJ
         vZoaVisUAU0WZL+YjfJzIna4h5PM7QwdiR45kkRGZmtVXVcNUihvlxljPIyZw2pZr7z7
         ljuH9B3dv/yKjmAFYn2v6vloBlAATquE+LLWtS6KKLq7/QC2RrB6SU8AMqMR/qeBGmwg
         SxwC1c9OPMmlhZ7Vx3gevOaZ54bx8802r43z6t78F7QnGRQ2NZkyxFv0iwUi/suB7Tyt
         l01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273057; x=1739877857;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOfjVZVb5Y6iDzKKUHv6/nHA/mRe1wtMuOb87tFD/sY=;
        b=Yh0Vr1gdn4ECw5i2Xa3M5W+LSXtQek2Y6N4nYNkyBrrIO68V5yYZqyyqToQL+qeBJ8
         0LT51Eq/jCU+4/yifNm9SN1ogykciQLmjL3Nw5Gwy4bArOwIvSx97LflO0zQfQRR81tQ
         80tuxQ6NL5oucr0gd/dMP/CPZrzT+tNLgTwrf5uk/QTwKkHVrgA6DtqA15+az12W4UhB
         OymYgAJLGxisJluWUvkWfNUlRK4zD9DHcGVBrvX/9pTfQWGEel/XM0ds8qSDVs7dpCyq
         g9MVgAuWUwjH6uUXkg6wl15Zi3Kpl44Y3wnurLe7QbbmYNQL4BpDOnD/LuKJpfa8yOu6
         PylA==
X-Forwarded-Encrypted: i=1; AJvYcCUG2s3qmvLYRRaXn9lnt+1soLDzBN7+fJ3JzBoVk+fv98aCsPZpJocZbe3zIClvHQzJME+Dz03BM1ii+Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsIKZ3Bm3n7Od2PhuNvv45ZwTxLmj1+ROek0XmU3g49wvX/MS
	HrSfh9ac6kAG+04HbXFR0ZPxb65X5SzcAx87yKBQdUn1d24InVqfXomYH7EyKpT9oYxsc3ZeoYu
	SiJYzPpoje5sFT1DwCQZRUeaK/OpTac0AjtsV/w==
X-Gm-Gg: ASbGncvIKcxzB5oC9+HcoIM4zYF/cU7lZnkF4QyGks60O2zK6sE/3qmRXatSazHz7Xf
	Q1E8TRhpZHkMAmR3ZkVievvvsAHodqmdyOxri4+hYqzba5k6v/ySR+GZCzQB9Gt6Pak1dtEZS+U
	J7Wna8qryr2vvv1LX2vkt6SRE8BqKWWA==
X-Google-Smtp-Source: AGHT+IEf4bAlc932Y8RjCqsdcVpRLNvZ7hqGahdwLKUrVi5zwhpmjI32Ih4rNqM1YHJ6OXhvHscn0v0mxu3EPZ63IlY=
X-Received: by 2002:a05:6122:e53:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-520584235ddmr1279904e0c.2.1739273057471; Tue, 11 Feb 2025
 03:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 11 Feb 2025 16:54:06 +0530
X-Gm-Features: AWEUYZn5KxAHY9nEhuLeVWZbiZhT9c81arMsoOohC1GNLVg1Ec6S2mvTF4MpJwg
Message-ID: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
Subject: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
To: kvmarm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"

Regression on rk3399-rock-pi-4b while running kvm-unit-tests with
nvhe, protected and vhe mode with virtualization enabled.

First seen on next-20250120
Good: next-20250117
Bad: next-20250120 till today's next-20250210

This is always reproducible.

Regression on these devices with kernel command line boot modes.
* rk3399-rock-pi-4b-nvhe
* rk3399-rock-pi-4b-protected
* rk3399-rock-pi-4b-vhe

Test regression: kvm nVHE hyp panic at __kvm_nvhe_kvm_hyp_handle_sysreg
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
ok 139 - psci: psci: cpu-off
[  674.423092] kvm [6196]: nVHE hyp panic at:
__kvm_nvhe_kvm_hyp_handle_sysreg (include/kvm/arm_arch_timer.h:174
arch/arm64/kvm/hyp/include/hyp/switch.h:506
arch/arm64/kvm/hyp/include/hyp/switch.h:559
arch/arm64/kvm/hyp/include/hyp/switch.h:604)
[  674.423987] kvm [6196]: nVHE call trace:
[  674.424331] kvm [6196]: __kvm_nvhe_hyp_panic
(arch/arm64/kvm/hyp/nvhe/switch.c:415)
[  674.424950] kvm [6196]: __kvm_nvhe___kvm_vcpu_run
(arch/arm64/kvm/hyp/include/hyp/switch.h:750 (discriminator 1)
arch/arm64/kvm/hyp/nvhe/switch.c:355 (discriminator 1))
[  674.425619] kvm [6196]: __kvm_nvhe___kvm_vcpu_run
(arch/arm64/kvm/hyp/include/hyp/switch.h:750 (discriminator 1)
arch/arm64/kvm/hyp/nvhe/switch.c:355 (discriminator 1))
[  674.426288] kvm [6196]: __kvm_nvhe_handle___kvm_vcpu_run
(arch/arm64/kvm/hyp/nvhe/hyp-main.c:231)
[  674.427004] kvm [6196]: __kvm_nvhe_handle_trap
(arch/arm64/kvm/hyp/nvhe/hyp-main.c:640
arch/arm64/kvm/hyp/nvhe/hyp-main.c:673)
[  674.427651] kvm [6196]: __kvm_nvhe___skip_pauth_save
(arch/arm64/kvm/hyp/nvhe/host.S:67)
[  674.428313] kvm [6196]: ---[ end nVHE call trace ]---
[  674.428755] kvm [6196]: Hyp Offset: 0xfffea0df7d800000
[  674.429208] Kernel panic - not syncing: HYP panic:
[  674.429208] PS:600003c9 PC:0000df2103dc1610 ESR:0000000096000004
[  674.429208] FAR:ffff00000d031ba0 HPFAR:0000000000000000 PAR:1d00007edbadc0de
[  674.429208] VCPU:0000df21077a1bc0
[  674.431040] CPU: 4 UID: 0 PID: 6196 Comm: qemu-system-aar Not
tainted 6.14.0-rc2-next-20250210 #1
[  674.431815] Hardware name: Radxa ROCK Pi 4B (DT)
[  674.432219] Call trace:
[  674.432437] show_stack (arch/arm64/kernel/stacktrace.c:468) (C)
[  674.432763] dump_stack_lvl (lib/dump_stack.c:124)
[  674.433090] dump_stack (lib/dump_stack.c:130)
[  674.433384] panic (kernel/panic.c:354)
[  674.433657] nvhe_hyp_panic_handler
(arch/arm64/include/asm/current.h:19 arch/arm64/kvm/handle_exit.c:452)
[  674.434056] kvm_arm_vcpu_enter_exit
(arch/arm64/include/asm/alternative-macros.h:232
arch/arm64/include/asm/cpufeature.h:453
arch/arm64/include/asm/cpufeature.h:498
arch/arm64/include/asm/virt.h:139 arch/arm64/kvm/arm.c:1084)
[  674.434448] kvm_arch_vcpu_ioctl_run (arch/arm64/kvm/arm.c:1191)
[  674.434855] kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4377)
[  674.435194] __arm64_sys_ioctl (fs/ioctl.c:51 (discriminator 1)
fs/ioctl.c:906 (discriminator 1) fs/ioctl.c:892 (discriminator 1)
fs/ioctl.c:892 (discriminator 1))
[  674.435542] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[  674.435875] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[  674.436289] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[  674.436583] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1))
[  674.436860] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
[  674.437243] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[  674.437567] SMP: stopping secondary CPUs
[  674.438032] Kernel Offset: disabled
[  674.438338] CPU features: 0x100,0002082c,00800000,8200421b
[  674.438819] Memory Limit: none
[  674.439090] ---[ end Kernel panic - not syncing: HYP panic:
[  674.439090] PS:600003c9 PC:0000df2103dc1610 ESR:0000000096000004
[  674.439090] FAR:ffff00000d031ba0 HPFAR:0000000000000000 PAR:1d00007edbadc0de
[  674.439090] VCPU:0000df21077a1bc0 ]---

## Source
* kernel version: 6.14.0-rc2-next-20250210
* git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* git sha: df5d6180169ae06a2eac57e33b077ad6f6252440
* git describe: next-20250210
* project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/
* architecture: arm64
* device: rk3399-rock-pi-4b
* toolchain: gcc-13
* build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/config
* build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/

## Boot log
* test link-1: https://lkft.validation.linaro.org/scheduler/job/8117232#L1395
* test link-2: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/testrun/27250834/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/log
* build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/
* config link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/config
* linux-next-history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250207/testrun/27226044/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/history/
* linux-mainline-history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-rc2/testrun/27248845/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/history/

--
Linaro LKFT
https://lkft.linaro.org
