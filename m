Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3F121578F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597250; cv=none; b=EAnMvDiACaoLd/jTiZX4zp/aoutHLV8HEzG861Vr16Aajl2sAYJyRt3j9/VL7fVRklXd1vJiEB5enLWqLcq3bAUQVD1Gs7UxerXoFoTcBEeQCTMeN01UchsXMiB6s2ABi25lGfRxau7w/Kn1wWNlbfkq5l5QS5TCZNRrn8X4OFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597250; c=relaxed/simple;
	bh=L4sn98PBegOTbCmdFYDtAkjiTCnK0s2hWxPSgkN9EzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Sae6MpnpNcwNPIboRwWR/m108Ie4pJRu3leFJSrt5/kHmr3fJ/rh9yfnef4u8/Z79yuQ9LrMLPk0E5/z+mTNdK/E2sYFgf7/mIvcxzhp0p0FReLgXbAoMx1yFKAw+Jv1DfndEilFjLxPZztcLaj8ZBWZVL346DjJS7WZW8Dx16k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A66D16F2;
	Fri, 30 May 2025 02:27:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 406103F5A1;
	Fri, 30 May 2025 02:27:25 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	geert@linux-m68k.org,
	broonie@kernel.org,
	mcgrof@kernel.org,
	joey.gouly@arm.com,
	kristina.martsenko@arm.com,
	rppt@kernel.org,
	pcc@google.com,
	bigeasy@linutronix.de,
	ptosi@google.com,
	mark.rutland@arm.com,
	james.morse@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is called in a kthread
Date: Fri, 30 May 2025 10:27:23 +0100
Message-Id: <20250530092723.3307630-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a kernel thread hits BUG() outside of an interrupt handler and
panic_on_oops is not set, it exits via make_task_dead(), which is called by die().
In this case, the nmi_nesting value in context_tracking becomes
inconsistent because the proper context tracking exit functions are not reached.

Here’s an example scenario on arm64:
  1. A kernel thread hits the BUG() macro outside an interrupt handler,
     and panic_on_oops is not set (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE).

  2. The exception handler jumps to el1_dbg() and calls arm64_enter_el1_dbg(),
     which invokes ct_nmi_enter(). (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE + 2)

  3. bug_handler() runs, and if the bug type is BUG_TRAP_TYPE_BUG, it calls die().

  4. die() then calls make_task_dead(), which terminates the kernel thread and
     schedules another task—assume this is the idle_task.

  5. The idle_task attempts to enter the idle state by calling ct_idle_enter().
     However, since the current ct->nmi_nesting value is CT_NESTING_IRQ_NONIDLE + 2,
     ct_kernel_exit() triggers a WARN_ON_ONCE() warning.

Because the kernel thread couldn’t call the appropriate context tracking exit
function in step 3, the ct->nmi_nesting value remains incorrect.
This leads to warnings like the following:

[    7.133093] ------------[ cut here ]------------
[    7.133129] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:127 ct_kernel
[    7.134157] Modules linked in:
[    7.134158]     not ok 62 kasan_strings
[    7.134280]
[    7.134506] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G    B D W        N
[    7.134930] Tainted: [B]=BAD_PAGE, [D]=DIE, [W]=WARN, [N]=TEST
[    7.135150] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    7.135441] pc : ct_kernel_exit+0xa4/0xb0
[    7.135656] lr : ct_kernel_exit+0x1c/0xb0
[    7.135866] sp : ffff8000829bbd90
[    7.136011] x29: ffff8000829bbd90 x28: ffff80008224ecf0 x27: 0000000000000004
[    7.136379] x26: ffff80008228ed30 x25: ffff80008228e000 x24: 0000000000000000
[    7.137016] x23: f3ff000800a52280 x22: 0000000000000000 x21: ffff00087b6c7408
[    7.137380] x20: ffff80008224b408 x19: 0000000000000005 x18: 0000000000000000
[    7.137741] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    7.311316] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[    7.311673] x11: 0000000000000000 x10: 0000000000000000 x9 : 4000000000000000
[    7.312031] x8 : 4000000000000002 x7 : 0000000000000000 x6 : 0000000000000000
[    7.312387] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    7.312740] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8007f947c000
[    7.313096] Call trace:
[    7.313210]  ct_kernel_exit+0xa4/0xb0 (P)
[    7.313445]  ct_idle_enter+0x14/0x28
[    7.313666]  default_idle_call+0x2c/0x60
[    7.313902]  do_idle+0xec/0x320
[    7.314104]  cpu_startup_entry+0x40/0x50
[    7.314331]  secondary_start_kernel+0x120/0x1a0

This behavior is specific to the arm64 architecture, where ct_nmi_enter()
is called when handling a debug exception.
In contrast, on other architectures, ct_nmi_enter() is not called when
handling BUG().
(i.e) when handling X86_TRAP_UD via handle_invalid_op(), it doesn't call
ct_nmi_enter(). so it doesn’t cause any issues
(While irq_entry_enter() does call ct_nmi_enter() for idle tasks,
that doesn’t apply to debug exception handling).

To address the issue of a corrupted ct->nmi_nesting value,
add a check before calling make_task_dead() in die().
If the current CPU’s ct->nmi_nesting is non-zero and not equal to
CT_NESTING_IRQ_NONIDLE, then ct_nmi_exit() should be called.

Fixes: 2a9b3e6ac69a ("arm64: entry: fix EL1 debug transitions")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/traps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 529cff825531..9cf03b9ce691 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -227,8 +227,14 @@ void die(const char *str, struct pt_regs *regs, long err)

 	raw_spin_unlock_irqrestore(&die_lock, flags);

-	if (ret != NOTIFY_STOP)
+	if (ret != NOTIFY_STOP) {
+#ifdef CONFIG_CONTEXT_TRACKING_IDLE
+		long nmi_nesting = ct_nmi_nesting();
+		if (nmi_nesting && nmi_nesting != CT_NESTING_IRQ_NONIDLE)
+			ct_nmi_exit();
+#endif
 		make_task_dead(SIGSEGV);
+	}
 }

 static void arm64_show_signal(int signo, const char *str)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

