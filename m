Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C518C91F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146846; cv=none; b=WsI5WxTQ3zfg2Er+M5Q0SKzopTFU19ZbnZmw7iLt7pmwnNUkoz4nVXeGZ6O5/AExbkTEnXV2alDaA6rUp9YRPaLagpUdViE00c4kg7gqsLXOqHcHwAvLDrN7oNIBZHn79csdq19WkwD2WoLiUcXS8QEzQE1pJw+WgtufeMsKAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146846; c=relaxed/simple;
	bh=f6Q18ky/YnCSifbE+JBFAxpkIy4IITibz2TfNGEv5XY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W17V2HI+KUdRG+qBFST/TR+pm0b94hexBoUbbEKFyuU5zPHiqRD3/GlxXajqDkcP/ZOe7HBZv5boMaFYmxHb7qedFXNizNRmZstDOS1tBpfm1RgakT0rrFZvOMQF+/EKhlMRejjPhWQbKgzpZcBXkd9xXdxPms1kI5RsiORDmko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QScYcL4U; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QScYcL4U"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-525b44b7720so2019108e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146844; x=1747751644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hthrZuodCiLqAl2aI/RmNDp1+ecq7fAhJyN9whDcVlE=;
        b=QScYcL4UerMuZgazod/O8mwdDHgDjPgGAGk2XONIwGl2uCTvSIPW63xdGj6XI4A1cC
         e04D20Gvss3NiiAgdIYbGqI0OPyosWIQqrBKvdaghY3xe6dRp2QUHwSCZEnLu7VV9PBC
         RS/BrAneZyPIr4eZd45pRhBNok2sPmRjyAY73RPrNRAwJRX2CmHog7oW7InT1zF6NXnP
         p5qFs9iQ1ptkxajoAcldIUyvBtvQWI97vgXmxZYnjM8pDbmKkcxdwTua9sBvfAgDAtXD
         DR25HdFFv4cx4iFrO0nj++MfGUmlU9shBsZhnjIToATxTNzEvaCsHopY+LRClmUFdeF3
         RXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146844; x=1747751644;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hthrZuodCiLqAl2aI/RmNDp1+ecq7fAhJyN9whDcVlE=;
        b=RW6yl6ZXvIjduNx2tfwW26+klGn4nsMEIiJKY+3tK47rbxPPKyU5OsfsiwcdjxiNZm
         QlA8qBERIoLS6XV82u9ocEOwFBfqovxHydaRpgAO29TEjPkD7IrkMn+Q7xUiJugw9xJe
         kFLJivP0J9IZBWGPVx/sraOhK67+VWkgFjOUh+Pw4GIPgikYQNhX1HxINCCcR3D7MtKa
         vmgB2Kdu5UTKFY8wAaGtAk2G6c6X0+7mofyrUwRBJSM5zrm07TtFaZLR0wuMLeRUbfPw
         Y+ExNbqtkHHWgPu6ygvwXRRZyoLFYIfTue5NVlJEa/SGDV3K+9ZsdIEsxxr24BPv3kG7
         sS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRgFbOJCXth/lON4dmRJEA0kmYLKbq3e/TydDQt5u6nQNST7IDJC5djZ349Mtd3Kv0xFJz1PjzMLWGjOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTNSPSsMmZLce4hI1Cb2T/76SofQXHPlgrtgFYgnGkfRuvFEH
	LlBoTpvQai7dTziBI/waAyo3mewKCN1MzKHd4ZBbgTb9/6ag1adKk+GJsZpAVqUAULmST/QsiwM
	5sp8gZjX3HCaiKUHyzNEJ7/hhW27oPI1+Dx17fA==
X-Gm-Gg: ASbGnct3dv7HD+cqn3YuK+p1tJguQKmk5ZrM9GKX+Ae77j3q2exMnFeLaA6xcMAXjHO
	rjgzBcNNRulCIbd+0iyL06ndKzeq2c9aKB7KmZ3TgGNQDj+hLUwJd3DGEH8vOGDv07d8PvxTbto
	9uhK/WZ3DyxS4FD9mgAI3yufNxEODLYQg=
X-Google-Smtp-Source: AGHT+IGa7tM2+yVV5lR0zp3Po6+W5huuE2Ngj6uYCDR4JzkHfSHTuAuEV7X5zoqRq4cf3xb3r3UVIKakBkz+fzj+qJo=
X-Received: by 2002:a05:6122:2a09:b0:526:1ddd:7603 with SMTP id
 71dfb90a1353d-52c538183a0mr10383495e0c.0.1747146843598; Tue, 13 May 2025
 07:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 15:33:52 +0100
X-Gm-Features: AX0GCFtCmuRbYrLW_sywBTFnxdD_Gsz4D973rxleO8B3LSwoX0Wadbyst4LE4dw
Message-ID: <CA+G9fYu0p9egoiR6E87EvLm57YguTmcCidKxt=Xq7rKfcyCO5g@mail.gmail.com>
Subject: next-20250512: arm64 WARNING arm64 arch_enter_lazy_mmu_mode __apply_to_page_range
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, lorenzo.stoakes@oracle.com, 
	Vlastimil Babka <vbabka@suse.cz>, Lance Yang <lance.yang@linux.dev>, Gavin Guo <gavinguo@igalia.com>, 
	SeongJae Park <sj@kernel.org>, soumish.das@gmail.com, willy@infradead.org, 
	Kairui Song <kasong@tencent.com>, Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-arm64 boot warnings on Linux next-20250512 tags
and next-20250513 tags.

First seen on Linux next-20250512.
Good: next-20250509
Bad: next-20250512 and  next-20250513

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: arm64 WARNING arm64 arch_enter_lazy_mmu_mode
__apply_to_page_range

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot warnings on qemu-arm64

<6>[    1.990638] pci_bus 0000:00: resource 5 [mem 0x10000000-0x3efeffff]
<6>[    1.990883] pci_bus 0000:00: resource 6 [mem 0x8000000000-0xffffffffff]
<4>[    2.540216] ------------[ cut here ]------------
<4>[ 2.540462] WARNING: CPU: 0 PID: 1 at
arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1))
<4>[    2.542895] Modules linked in:
<4>[    2.544646] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.15.0-rc6-next-20250512 #1 PREEMPT
<4>[    2.545645] Hardware name: linux,dummy-virt (DT)
<4>[    2.546426] pstate: 02402009 (nzcv daif +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[ 2.547215] pc : arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1))
<4>[ 2.547728] lr : __apply_to_page_range (mm/memory.c:2977
mm/memory.c:3024 mm/memory.c:3060 mm/memory.c:3096 mm/memory.c:3132)
<4>[    2.548285] sp : ffff800080003c30
<4>[    2.548659] x29: ffff800080003cb0 x28: fff00000ff60b160 x27:
fff00000ffe2c000
<4>[    2.549707] x26: fff00000ffe2d000 x25: ffff9bafa2c13000 x24:
fff00000c02f0000
<4>[    2.550684] x23: ffff800080003d20 x22: fff00000ff80bff8 x21:
ffff9bafa0240238
<4>[    2.551541] x20: 0000000000000001 x19: fff00000ffe2d000 x18:
ffff80008002bc68
<4>[    2.552142] x17: fff064515ca85000 x16: ffff800080000000 x15:
0000000077c57533
<4>[    2.552640] x14: 00000000d92d0ef0 x13: 00000000d20abc0c x12:
00000000fb25c40b
<4>[    2.553842] x11: 00198b3bc0a2931a x10: 000000000000012e x9 :
fff00000ffe2d000
<4>[    2.555089] x8 : fff00080ffe2c000 x7 : fff00000ffdfe018 x6 :
fff00000ffe2d000
<4>[    2.556016] x5 : fff00000ffe2d000 x4 : 0000000040000000 x3 :
fff00000ff60b000
<4>[    2.556877] x2 : 0000000000000160 x1 : 000000013f60b000 x0 :
0000000000000100
<4>[    2.558390] Call trace:
<4>[ 2.559189] arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1)) (P)
<4>[ 2.560081] apply_to_page_range (mm/memory.c:3152)
<4>[ 2.560386] set_memory_valid (arch/arm64/mm/pageattr.c:64
arch/arm64/mm/pageattr.c:170)
<4>[ 2.560641] kfence_guarded_free (mm/kfence/core.c:570)
<4>[ 2.560899] __kfence_free (mm/kfence/core.c:1189)
<4>[ 2.561978] kmem_cache_free (mm/slub.c:2319 mm/slub.c:4642 mm/slub.c:4744)
<4>[ 2.562391] kernfs_free_rcu (fs/kernfs/dir.c:556)
<4>[ 2.562761] rcu_core (arch/arm64/include/asm/preempt.h:13
(discriminator 1) kernel/rcu/tree.c:2583 (discriminator 1)
kernel/rcu/tree.c:2832 (discriminator 1))
<4>[ 2.563100] rcu_core_si (kernel/rcu/tree.c:2850)
<4>[ 2.563435] handle_softirqs (arch/arm64/include/asm/jump_label.h:36
include/trace/events/irq.h:142 kernel/softirq.c:580)
<4>[ 2.563819] __do_softirq (kernel/softirq.c:614)
<4>[ 2.565112] ____do_softirq (arch/arm64/kernel/irq.c:82)
<4>[ 2.565693] call_on_irq_stack (arch/arm64/kernel/entry.S:897)
<4>[ 2.566065] do_softirq_own_stack (arch/arm64/kernel/irq.c:87)
<4>[ 2.566687] __irq_exit_rcu (kernel/softirq.c:460 kernel/softirq.c:680)
<4>[ 2.567412] irq_exit_rcu (kernel/softirq.c:698)
<4>[ 2.567644] el1_interrupt (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/entry-common.c:280
arch/arm64/kernel/entry-common.c:586
arch/arm64/kernel/entry-common.c:598)
<4>[ 2.567893] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:604)
<4>[ 2.568230] el1h_64_irq (arch/arm64/kernel/entry.S:596)
<4>[ 2.569665] kobject_add_internal (lib/kobject.c:73 (discriminator
1) lib/kobject.c:240 (discriminator 1)) (P)
<4>[ 2.570133] kobject_init_and_add (lib/kobject.c:374 lib/kobject.c:457)
<4>[ 2.570545] bus_add_driver (drivers/base/bus.c:671)
<4>[ 2.570921] driver_register (drivers/base/driver.c:249)
<4>[ 2.571623] __platform_driver_register (drivers/base/platform.c:868)
<4>[ 2.571917] meson_secure_pwrc_driver_init
(drivers/pmdomain/amlogic/meson-secure-pwrc.c:411)
<4>[ 2.572360] do_one_initcall (init/main.c:1273)
<4>[ 2.573619] kernel_init_freeable (init/main.c:1334 (discriminator
1) init/main.c:1351 (discriminator 1) init/main.c:1370 (discriminator
1) init/main.c:1583 (discriminator 1))
<4>[ 2.574521] kernel_init (init/main.c:1477)
<4>[ 2.574873] ret_from_fork (arch/arm64/kernel/entry.S:863)
<4>[    2.575882] ---[ end trace 0000000000000000 ]---
<4>[    2.641680] ------------[ cut here ]------------
<4>[ 2.641748] WARNING: CPU: 0 PID: 1 at
arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1))
<4>[    2.644422] Modules linked in:
<4>[    2.645675] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G
  W           6.15.0-rc6-next-20250512 #1 PREEMPT
<4>[    2.646879] Tainted: [W]=WARN
<4>[    2.647143] Hardware name: linux,dummy-virt (DT)
<4>[    2.647759] pstate: 02402009 (nzcv daif +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[ 2.648749] pc : arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1))
<4>[ 2.649690] lr : __apply_to_page_range (mm/memory.c:2977
mm/memory.c:3024 mm/memory.c:3060 mm/memory.c:3096 mm/memory.c:3132)
<4>[    2.650373] sp : ffff800080003c30
<4>[    2.650941] x29: ffff800080003cb0 x28: fff00000ff60b170 x27:
fff00000ffe2e000
<4>[    2.651625] x26: fff00000ffe2f000 x25: ffff9bafa2c13000 x24:
fff00000c02f0000
<4>[    2.652098] x23: ffff800080003d20 x22: fff00000ff80bff8 x21:
ffff9bafa0240238
<4>[    2.652519] x20: 0000000000000001 x19: fff00000ffe2f000 x18:
0000000000000000
<4>[    2.652960] x17: fff064515ca85000 x16: ffff800080000000 x15:
0000000000000000
<4>[    2.654144] x14: 0000000000000000 x13: 00000000ffffffff x12:
0000000000000000
<4>[    2.655353] x11: 008d1ac5265f1ad6 x10: 0000000000000252 x9 :
fff00000ffe2f000
<4>[    2.656581] x8 : fff00080ffe2e000 x7 : fff00000ffdfe018 x6 :
fff00000ffe2f000
<4>[    2.657594] x5 : fff00000ffe2f000 x4 : 0000000040000000 x3 :
fff00000ff60b000
<4>[    2.658687] x2 : 0000000000000170 x1 : 000000013f60b000 x0 :
0000000000000101
<4>[    2.659818] Call trace:
<4>[ 2.660277] arch_enter_lazy_mmu_mode
(arch/arm64/include/asm/pgtable.h:82 (discriminator 1)) (P)
<4>[ 2.661214] apply_to_page_range (mm/memory.c:3152)
<4>[ 2.661914] set_memory_valid (arch/arm64/mm/pageattr.c:64
arch/arm64/mm/pageattr.c:170)
<4>[ 2.662734] kfence_guarded_free (mm/kfence/core.c:570)
<4>[ 2.663477] __kfence_free (mm/kfence/core.c:1189)
<4>[ 2.664116] kmem_cache_free (mm/slub.c:2319 mm/slub.c:4642 mm/slub.c:4744)
<4>[ 2.664531] kernfs_free_rcu (fs/kernfs/dir.c:556)
<4>[ 2.664774] rcu_core (arch/arm64/include/asm/preempt.h:13
(discriminator 1) kernel/rcu/tree.c:2583 (discriminator 1)
kernel/rcu/tree.c:2832 (discriminator 1))
<4>[ 2.665190] rcu_core_si (kernel/rcu/tree.c:2850)
<4>[ 2.665769] handle_softirqs (arch/arm64/include/asm/jump_label.h:36
include/trace/events/irq.h:142 kernel/softirq.c:580)
<4>[ 2.666414] __do_softirq (kernel/softirq.c:614)
<4>[ 2.667070] ____do_softirq (arch/arm64/kernel/irq.c:82)
<4>[ 2.667664] call_on_irq_stack (arch/arm64/kernel/entry.S:897)
<4>[ 2.668433] do_softirq_own_stack (arch/arm64/kernel/irq.c:87)
<4>[ 2.669064] __irq_exit_rcu (kernel/softirq.c:460 kernel/softirq.c:680)
<4>[ 2.669725] irq_exit_rcu (kernel/softirq.c:698)
<4>[ 2.670429] el1_interrupt (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/entry-common.c:280
arch/arm64/kernel/entry-common.c:586
arch/arm64/kernel/entry-common.c:598)
<4>[ 2.671083] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:604)
<4>[ 2.671343] el1h_64_irq (arch/arm64/kernel/entry.S:596)
<4>[ 2.671595] arch_stack_walk (arch/arm64/kernel/stacktrace.c:343
(discriminator 12) arch/arm64/kernel/stacktrace.c:387 (discriminator
12)) (P)
<4>[ 2.671876] return_address (arch/arm64/kernel/return_address.c:45)
<4>[ 2.672126] preempt_count_sub (include/linux/ftrace.h:1091
kernel/sched/core.c:5885 kernel/sched/core.c:5882
kernel/sched/core.c:5904)
<4>[ 2.672375] _raw_spin_unlock (arch/arm64/include/asm/current.h:19
arch/arm64/include/asm/preempt.h:79
include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
<4>[ 2.672610] bus_to_subsys (drivers/base/bus.c:84)
<4>[ 2.672842] bus_notify (drivers/base/bus.c:998)
<4>[ 2.673431] driver_sysfs_add (drivers/base/dd.c:441 (discriminator 1))
<4>[ 2.674103] really_probe (drivers/base/dd.c:645)
<4>[ 2.674677] __driver_probe_device (drivers/base/dd.c:799)
<4>[ 2.675449] driver_probe_device (drivers/base/dd.c:829)
<4>[ 2.676086] __driver_attach (drivers/base/dd.c:1216)
<4>[ 2.676614] bus_for_each_dev (drivers/base/bus.c:370)
<4>[ 2.677234] driver_attach (drivers/base/dd.c:1234)
<4>[ 2.677828] bus_add_driver (drivers/base/bus.c:678)
<4>[ 2.678468] driver_register (drivers/base/driver.c:249)
<4>[ 2.679177] __platform_driver_register (drivers/base/platform.c:868)
<4>[ 2.679987] virtio_mmio_init (drivers/virtio/virtio_mmio.c:862)
<4>[ 2.680750] do_one_initcall (init/main.c:1273)
<4>[ 2.681577] kernel_init_freeable (init/main.c:1334 (discriminator
1) init/main.c:1351 (discriminator 1) init/main.c:1370 (discriminator
1) init/main.c:1583 (discriminator 1))
<4>[ 2.682395] kernel_init (init/main.c:1477)
<4>[ 2.683103] ret_from_fork (arch/arm64/kernel/entry.S:863)
<4>[    2.683740] ---[ end trace 0000000000000000 ]---

## Test arm64
* Boot log: https://qa-reports.linaro.org/api/testruns/28432151/log_file/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250512/testrun/28419580/suite/log-parser-test/test/exception-warning-cpu-pid-at-archarm64includeasmpgtableh-arch_enter_lazy_mmu_mode/history/
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250512/testrun/28419580/suite/log-parser-test/test/exception-warning-cpu-pid-at-archarm64includeasmpgtableh-arch_enter_lazy_mmu_mode/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wzhpVuPjk17ixzQZ6Wlx4IzF9T/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wzhpVuPjk17ixzQZ6Wlx4IzF9T/config
* Toolchain: gcc-13

## Build
* kernel: 6.15.0-rc6-next-20250512
* git: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* git commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
* git describe: 6.15.0-rc6-next-20250512
* test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250512/

--
Linaro LKFT
https://lkft.linaro.org
