Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67B217664
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751984; cv=none; b=To9imHrzI5/lCGbm/ekpYpFIdOr4hMwynusYxWy/k1y03BLnPLnIAa8V5EXn1nehrBhY+Z1fMG0ODXXEU1W8/e+ZVoeyCFNMdDxWFNLQl86papKt5ts6QQ9XOSyoPteemp12pKVXgmFtO8RamJ+QJmulpciiZYmoGzALQBasGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751984; c=relaxed/simple;
	bh=tVQRwoMb+hd9FSU7N82R42MEy6sZZDn+/KJGRJ05t/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IJCN3Rl/dFSB3Awr6P3m3unZtvo4y2TBk4QSokP4FemfPOPvAG5NCauTECGThoEhhhPOToPytpdULA1P/qKhc+l9aoVSMAr7ozVhIJQICX0uaYdoKEljomOQWnFwCQiA3CZmBYHEsqAZPXmboW4RGsCuQw8hog66z8Q8gTbUtzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LTVPQn8A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V9py+O05; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LTVPQn8A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V9py+O05"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6uaY8W8uWX7274TNjO/MgUx++fcPDdr6dwd0qmj9oWs=;
	b=LTVPQn8AM5GwGpwKbsCah2u77rvy048YL3W8FBsoA6K7M5fYWOCmGwywgh7F4UDcJiwTZd
	I5VUaiP3tMWHqPxRpN68SsslP9jRuePVPGqppsTVNlvTIXDRrHmdStCqUpbDIBRyIAEfqg
	3UiioIbUS5s0STUM+oL5XtpoHTWbb1nESIc1NonamMAe9nYumKZUINgQJHbz/xyvrOmZ3L
	K56IqEQcoBeGvt/q4pKGpuRtnPyVb4Vm4PLUtNZVqpqRF31Qhn2Jw5NMHy/J4MmPh/74ba
	nHxpOw6qY0vje01Qd9vwbwt7zo0f7wzKW58zKrJVSTXp0NL5j1cRWFD5VzrNig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6uaY8W8uWX7274TNjO/MgUx++fcPDdr6dwd0qmj9oWs=;
	b=V9py+O05cJG9B9nZ73iWVhZOO7DzSIAWJPXW3bXXEtag9PuoeGjUpD105i/f+0JM8kH91/
	pwl0qMe5mi0lWPBw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	John Stultz <jstultz@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 00/31] hrtimers: Consolidate hrtimer initialization - Part 2
Date: Wed,  5 Feb 2025 11:38:44 +0100
Message-Id: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimers is initialized with hrtimer_init(), and after that the timer's
callback function is setup separately. This separate initialization is
error prone and awkward to use.

hrtimer_setup() combines the initialization and is simpler to use.

Switch to use the new setup function. Most conversions were done with
Coccinelle, see the sematic patch below.

This series is intended to be applied to the tip tree.

v1 -> v2 https://lore.kernel.org/lkml/cover.1729864823.git.namcao@linutroni=
x.de
  - rebase onto v6.14.rc1
---
virtual patch
@@ expression timer, clock, mode, func; @@
- hrtimer_init(timer, clock, mode);
  ...
- timer->function =3D func;
+ hrtimer_setup(timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup(&timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init_on_stack(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup_on_stack(&timer, func, clock, mode);

@@ expression timer, clock, mode; @@
- hrtimer_init_sleeper_on_stack(timer, clock, mode);
+ hrtimer_setup_sleeper_on_stack(timer, clock, mode);

---
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: John Stultz <jstultz@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
---

 arch/arm/mach-imx/mmdc.c                       |  5 ++---
 arch/arm/mm/cache-l2x0-pmu.c                   |  3 +--
 arch/arm64/kvm/arch_timer.c                    |  7 +++----
 arch/loongarch/kvm/vcpu.c                      |  4 ++--
 arch/mips/kvm/mips.c                           |  5 ++---
 arch/powerpc/kernel/watchdog.c                 |  3 +--
 arch/powerpc/kvm/powerpc.c                     |  4 ++--
 arch/riscv/kvm/vcpu_timer.c                    |  7 ++++---
 arch/s390/kvm/interrupt.c                      |  3 +--
 arch/s390/kvm/kvm-s390.c                       |  4 ++--
 arch/x86/events/intel/uncore.c                 |  3 +--
 arch/x86/events/rapl.c                         |  3 +--
 arch/x86/kvm/hyperv.c                          |  3 +--
 arch/x86/kvm/i8254.c                           |  3 +--
 arch/x86/kvm/lapic.c                           |  5 ++---
 arch/x86/kvm/vmx/nested.c                      |  5 ++---
 arch/x86/kvm/xen.c                             |  4 ++--
 block/bfq-iosched.c                            |  5 ++---
 block/blk-iocost.c                             |  3 +--
 drivers/ata/pata_octeon_cf.c                   |  5 ++---
 drivers/base/power/runtime.c                   |  4 ++--
 drivers/block/null_blk/main.c                  |  7 +++----
 drivers/char/hw_random/timeriomem-rng.c        |  3 +--
 drivers/devfreq/event/rockchip-dfi.c           |  3 +--
 drivers/s390/crypto/ap_bus.c                   |  3 +--
 drivers/watchdog/softdog.c                     |  8 +++-----
 drivers/watchdog/watchdog_dev.c                |  4 ++--
 drivers/watchdog/watchdog_hrtimer_pretimeout.c |  4 ++--
 fs/timerfd.c                                   |  5 ++---
 fs/ubifs/io.c                                  |  3 +--
 io_uring/timeout.c                             | 13 ++++++-------
 kernel/bpf/helpers.c                           |  3 +--
 kernel/events/core.c                           |  7 +++----
 kernel/fork.c                                  |  3 +--
 kernel/sched/core.c                            |  3 +--
 kernel/sched/deadline.c                        |  6 ++----
 kernel/sched/fair.c                            |  8 ++++----
 kernel/sched/rt.c                              |  5 ++---
 kernel/time/ntp.c                              |  3 +--
 kernel/time/posix-timers.c                     |  7 +++----
 kernel/time/sched_clock.c                      |  3 +--
 kernel/time/tick-broadcast-hrtimer.c           |  3 +--
 kernel/time/tick-sched.c                       |  6 ++----
 kernel/trace/trace_osnoise.c                   |  6 ++----
 kernel/watchdog.c                              |  3 +--
 lib/test_objpool.c                             |  3 +--
 mm/slab_common.c                               |  4 ++--
 47 files changed, 87 insertions(+), 127 deletions(-)

--=20
2.39.5

