Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B851F4617
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489105; cv=none; b=D4m6SFZRQWijxwmtV197JNzF8cDGd1R9KkFXFZw1oBfgU5qhHNOYkYlrFzBQMTaYDmu2q6i1FKMHpdE0+Pl0qCYoU2w1+mIs804Ke9OjdWUxCX7Tohwzgw4mgwL5t/b1qiqKfgYlTXm8k3SBO/ogYPSfLmUP64xa8TsmFx8MxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489105; c=relaxed/simple;
	bh=hHRYcFV31eGlU5NXckMItQOU+lMRQI6gXaOlMtt7zAY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YWSqh3oCJS39hE+pLCFUdQIbW2kf/sfvGXKBozs9zzlc+wXLA/uD5UNdWK0HSOYAW6FMx5hD3lmMMNow8BM9gous4DvulN9rnt8oVcoi3dL5MD0XNUYHxH88oDgOjPj/km9wXr0XyevWxHcvaXJgIJk2kjL14kajtcso/pHT070=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Zjs6n1JNbz27hVD;
	Thu, 24 Apr 2025 18:05:37 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id BA44118005F;
	Thu, 24 Apr 2025 18:04:53 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 18:04:53 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <sfr@canb.auug.org.au>,
	<rmk+kernel@armlinux.org.uk>, <xieyuanbin1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <nixiaoming@huawei.com>, <liaohua4@huawei.com>,
	<wangbing6@huawei.com>, <lincheng8@huawei.com>, <wangfangpeng1@huawei.com>
Subject: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 18:04:37 +0800
Message-ID: <20250424100437.27477-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200012.china.huawei.com (7.202.181.63)

From: Xie Yuanbin <xieyuanbin1@huawei.com>

When a user program accesses the kernel address,
a segment fault will be triggered.
For the latest kernel, with arm's multi_v7_defconfig, and set
CONFIG_PREEMPT=y, CONFIG_DEBUG_PREEMPT=y, CONFIG_ARM_LPAE=y,
if a user program try to accesses a valid kernel address, for example:
```c
static void han(int x)
{
	while (1);
}

int main(void)
{
	signal(SIGSEGV, han);
	/* 0xc0331fd4 is just a kernel address in kernel .text section */
	__asm__ volatile (""::"r"(*(int *)(uintptr_t)0xc0331fd4):"memory");
	while (1);
	return 0;
}
```

, the following WARN will be triggered:

[    1.089103] BUG: using smp_processor_id() in preemptible [00000000] code: init/1
[    1.093367] caller is __do_user_fault+0x20/0x6c
[    1.094355] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.14.3 #7
[    1.094585] Hardware name: Generic DT based system
[    1.094706] Call trace:
[    1.095211]  unwind_backtrace from show_stack+0x10/0x14
[    1.095329]  show_stack from dump_stack_lvl+0x50/0x5c
[    1.095352]  dump_stack_lvl from check_preemption_disabled+0x104/0x108
[    1.095448]  check_preemption_disabled from __do_user_fault+0x20/0x6c
[    1.095459]  __do_user_fault from do_page_fault+0x334/0x3dc
[    1.095505]  do_page_fault from do_DataAbort+0x30/0xa8
[    1.095528]  do_DataAbort from __dabt_usr+0x54/0x60
[    1.095570] Exception stack(0xf0825fb0 to 0xf0825ff8)
[    1.095706] 5fa0:                                     00000000 befe9c64 00000000 c0331000
[    1.095737] 5fc0: 00000002 0006dd68 00000001 befe9f04 befe9f0c 00070010 00000002 00073770
[    1.095746] 5fe0: befe9d94 befe9da8 00010953 00010250 600d0030 ffffffff

In this case, the hook func in do_DataAbort `inf->fn` is `do_page_fault`,
`do_page_fault` enables the irq, so it is preemptible here.

Inside `harden_branch_predictor`, if we just obtains the hook function `fn`
of this CPU, then the task is scheduled to another CPU.
The previous function is still executed, which is dangerous.

Use get_cpu() and put_cpu() to fix it.

Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel space")

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/include/asm/system_misc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/system_misc.h b/arch/arm/include/asm/system_misc.h
index 98b373403..93cad3d50 100644
--- a/arch/arm/include/asm/system_misc.h
+++ b/arch/arm/include/asm/system_misc.h
@@ -18,15 +18,16 @@ extern void (*arm_pm_idle)(void);
 #ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
 typedef void (*harden_branch_predictor_fn_t)(void);
 DECLARE_PER_CPU(harden_branch_predictor_fn_t, harden_branch_predictor_fn);
 static inline void harden_branch_predictor(void)
 {
 	harden_branch_predictor_fn_t fn = per_cpu(harden_branch_predictor_fn,
-						  smp_processor_id());
+						  get_cpu());
 	if (fn)
 		fn();
+	put_cpu();
 }
 #else
 #define harden_branch_predictor() do { } while (0)
 #endif
 
 #define UDBG_UNDEFINED	(1 << 0)
-- 
2.48.1

