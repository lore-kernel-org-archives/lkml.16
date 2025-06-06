Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DFD2BD1B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 01:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174228; cv=none; b=pAA9OhE2Pt5QG301W5+ctJUjRCTDJ4/BTO+s+uYwlC6Ibad4fXWCQvgG1om2C2hwFAZAUqcqoIsERBrG/lhPEQZ8xTfrssCUiunyRN8VFQs59g1ted7sA0k7xcE3uNb6UQuc1nCUhMudIlniZ9BoHltXgWZMsJW/dU5d15GSdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174228; c=relaxed/simple;
	bh=ii5jYjtb+5AFO6rCGQxp4eNJ7KWsgDKj1OPpXDRMRic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0+rv6pLHMwqKHAOLutW6NjMMRk+GD8IyiUPBemlhcUQos+zc1i31urbKSW4SVhS7gQObPnM5nj12XUk7W8G/1peAUc+xZ0LWLMQ1L/YjrQn6ZcK6gn2z3Df4WNfj+fZAI9FrlCCTgA/u7c4VZ/Vhr6LyI0sQ0yISnlgalkgAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bD3yp4Ph6z27hxW;
	Fri,  6 Jun 2025 09:44:34 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 073221A016C;
	Fri,  6 Jun 2025 09:43:43 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 09:43:42 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>, <kees@kernel.org>,
	<yangyj.ee@gmail.com>, <ardb@kernel.org>, <tony@atomide.com>,
	<xieyuanbin1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <nixiaoming@huawei.com>, <liaohua4@huawei.com>,
	<wangbing6@huawei.com>, <lilinjie8@huawei.com>, <wangfangpeng1@huawei.com>
Subject: [RFC RESEND PATCH] ARM: spectre-v2: fix the spectre operation that may be bypassed
Date: Fri, 6 Jun 2025 09:43:35 +0800
Message-ID: <20250606014335.1772-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424100437.27477-1-xieyuanbin1@huawei.com>
References: <20250424100437.27477-1-xieyuanbin1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemg200012.china.huawei.com (7.202.181.63)

As discussed before, to completely fix this problem, we must do
the spectre operation after the user mode is trapped in the kernel
and before the interrupt is enabled.

I have tried to add a hook function and it in fsr_info to avoid
performance deterioration (The preceding example will trigger
"level 2 permission fault", which is cold code in normal cases).
However, this does not work. I find that the user program can
also trigger "translation fault" or "access flag fault"
when accessing a kernel address.

Therefore, extra performance overhead is inevitable.
(An if branch needs to be added before the interrupt is enabled.)

I have tried to reduce the impact on performance.
If the page fault comes from the user mode,
the interrupt must be enabled. In this case,
a judgment can be reduced.

Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel space")

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/mm/fault.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..3425a12a8f52 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -272,25 +272,35 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
 
 	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
-		local_irq_enable();
+	if (likely(user_mode(regs))) {
+		if (IS_ENABLED(CONFIG_PREEMPT) &&
+		    IS_ENABLED(CONFIG_HARDEN_BRANCH_PREDICTOR) &&
+		    unlikely(addr >= TASK_SIZE)) {
+
+			__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
+			return 0;
+		}
+
+		flags |= FAULT_FLAG_USER;
+	} else if (!interrupts_enabled(regs))
+		goto irq_disabled;
+
+	local_irq_enable();
+irq_disabled:
 
 	/*
 	 * If we're in an interrupt or have no user
 	 * context, we must not take the fault..
 	 */
 	if (faulthandler_disabled() || !mm)
 		goto no_context;
 
-	if (user_mode(regs))
-		flags |= FAULT_FLAG_USER;
-
 	if (is_write_fault(fsr)) {
 		flags |= FAULT_FLAG_WRITE;
 		vm_flags = VM_WRITE;
 	}
 
 	if (fsr & FSR_LNX_PF) {
-- 
2.48.1

