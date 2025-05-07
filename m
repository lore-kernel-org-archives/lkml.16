Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04B26A0EA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620910; cv=none; b=JLxuEYPf3yqevl1yQjoJaSWzYniox+p2hI7Lt3tnAoTZkN7/bC8Pj9qlW9qF63E4pHvSkJLK2H+i5biDju7nu3bhWg+33SKKhCocrcp459fJCV8f/XpkjbU/Vy9JAzjqOcLrNCyUuximF5oPOYCSrgmZF9Eo4D4QYaKtvjisnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620910; c=relaxed/simple;
	bh=ii5jYjtb+5AFO6rCGQxp4eNJ7KWsgDKj1OPpXDRMRic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjhOuRm1Vn6DhN25oWBajAZSCom/eQTtAJnS6uYTjKuYcQFjMTbV7OptTRY2lNDoMCIeftUdOseLWW5m8OGXKNRTVQAcVHGckBjeZSwYZ/oqUPko1ffDAKG8UeT/VVGOxbf3yJSf+c8kibSkRgTaV0wRqPijikG9ts0BJVEz+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Zsvft4B8cz2TSC5;
	Wed,  7 May 2025 20:27:50 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CEC51A0175;
	Wed,  7 May 2025 20:28:25 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 May 2025 20:28:24 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>, <kees@kernel.org>,
	<yangyj.ee@gmail.com>, <ardb@kernel.org>, <tony@atomide.com>,
	<xieyuanbin1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <nixiaoming@huawei.com>, <liaohua4@huawei.com>,
	<wangbing6@huawei.com>, <lincheng8@huawei.com>, <wangfangpeng1@huawei.com>
Subject: [RFC PATCH] ARM: spectre-v2: fix the spectre operation that may be bypassed
Date: Wed, 7 May 2025 20:28:20 +0800
Message-ID: <20250507122820.41356-1-xieyuanbin1@huawei.com>
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
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

