Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43DCC2EF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747885397; cv=none; b=IeczoVSzXBzTcNwMMVIz4fdE0WM9YPdYn3BVwv4Nuk5IdZ60/IlN4KTZG2vmcRcMxWFXNhY5ZMm20tdW7XSL8gLgdYw3Xqx8FJ6AzokEfZMz2UH3kLPwg8dJE4C8Y79f4D1+QBIezt9IZ9AIoZGJG4BFBdcW4uSbDxgGympthQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747885397; c=relaxed/simple;
	bh=eeXnAeSOBEgii+mp7uZVK7+/1N/YkEvxeBqbVU707WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2mHr2H25QWj3r/aYx5ALIcrjJH2ACJR1SV9o8iI/MpRMgjUPfQHTfbaW6jXDxQ1uxjULgpxOGJC1LbBLfuzLgOQ9kl3itHxaKtXbfVuQyf+OC7+xKX/K267CIaiawuP/+qcmiE+5XfNHh6Dm7nFo/TjSZw6OCp1nrvQeRUuOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=QW8WExN8; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="QW8WExN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=n/
	LxoFIVdKGgDOu1WgZSbZG6HhwTFyxuyTvafFSab40=; b=QW8WExN82e9gmAfvXz
	LtCaG5rv67isSj7hSozcjsCmXgcNsECvv1NNk0czaSckI4EiiiEk6EFgX4NpovlE
	L9Y0GC4L5PlQ5i21qvJlwA54tAcRS9lH/kPvfp58KchAujI2ZHmMyMK31k4AsX0z
	6fCIDvBsWAWZI/AcNHeJAyYwM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXP7+Qki5oq1ccAg--.8168S2;
	Thu, 22 May 2025 10:57:21 +0800 (CST)
From: Zhao Mengmeng <zhaomzhao@126.com>
To: kees@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: zhaomengmeng@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lkdtm: Add DOUBLE_FAULT support for x86_64
Date: Thu, 22 May 2025 10:56:58 +0800
Message-ID: <20250522025658.1780923-1-zhaomzhao@126.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXP7+Qki5oq1ccAg--.8168S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4ruF1UZw4xGrW8JF47Jwb_yoWrCw45pw
	4vqr4rKr40qr13AFWUA3W5tw1Utw4Iya4Utr1Ykry2y3W5KryUX3WktrWxJrnxKry7J3W3
	t3ykXw4IqFyjgw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvjgsUUUUU=
X-CM-SenderInfo: 52kd0zp2kd0qqrswhudrp/1tbigRZOd2gljtBSVQACs4

From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>

Add DOUBLE_FAULT support for x86_64 by setting rsp to NULL and
then trigger int3. It is useful for testing the double fault handling
on x86_64.

Test it on qemu x86_64 vm with linux-next-20250516,
x86_64_defconfig, with cmd:

insmod lkdtm.ko cpoint_type=DOUBLE_FAULT cpoint_name=DIRECT

The console log is:

[  137.722286] traps: PANIC: double fault, error_code: 0x0
[  137.722295] Oops: double fault: 0000 [#1] SMP PTI
[  137.722299] CPU: 0 UID: 0 PID: 200 Comm: insmod Not tainted 6.15.0-rc6-next-20250516 #1 PREEMPT(voluntary)
[  137.722301] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org 04/01/2014
[  137.722302] RIP: 0010:lkdtm_DOUBLE_FAULT+0xc/0x20 [lkdtm]
[  137.722309] Code: 1e fa 48 c7 c7 10 8c 20 c0 e9 e0 00 31 c1 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa fa 48 c7 c4 00 00 00 00 <cc> 48 c7 c7 40 8c 20 c0 e9 b7 00 31 c1 00
[  137.722316] RSP: 0018:0000000000000000 EFLAGS: 00010086
[  137.722317] RAX: ffffffffc0000650 RBX: ffffffffc02021c0 RCX: ffffffff82252400
[  137.722331] RDX: ffffffffc0202030 RSI: ffffffffc0202390 RDI: ffffffffc0202390
[  137.722332] RBP: ffffffffc0201500 R08: 4555515f49534353 R09: 51525f4555455551
[  137.722332] R10: ffffffff814f325d R11: 5952544e455f5445 R12: ffffffffc0202390
[  137.722333] R13: ffff888004349330 R14: ffff888005536400 R15: ffff888003e53148
[  137.722335] FS:  00007f07f29d6380(0000) GS:ffff8880fa70a000(0000) knlGS:0000000000000000
[  137.722336] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  137.722337] CR2: fffffffffffffff8 CR3: 00000000044d6000 CR4: 00000000000006f0
[  137.722338] Call Trace:
[  137.722338] Modules linked in: lkdtm(+)
[  137.722341] ---[ end trace 0000000000000000 ]---
[  137.722341] RIP: 0010:lkdtm_DOUBLE_FAULT+0xc/0x20 [lkdtm]
[  137.722345] Code: 1e fa 48 c7 c7 10 8c 20 c0 e9 e0 00 31 c1 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa fa 48 c7 c4 00 00 00 00 <cc> 48 c7 c7 40 8c 20 c0 e9 b7 00 31 c1 00
[  137.722346] RSP: 0018:0000000000000000 EFLAGS: 00010086
[  137.722347] RAX: ffffffffc0000650 RBX: ffffffffc02021c0 RCX: ffffffff82252400
[  137.722347] RDX: ffffffffc0202030 RSI: ffffffffc0202390 RDI: ffffffffc0202390
[  137.722348] RBP: ffffffffc0201500 R08: 4555515f49534353 R09: 51525f4555455551
[  137.722348] R10: ffffffff814f325d R11: 5952544e455f5445 R12: ffffffffc0202390
[  137.722349] R13: ffff888004349330 R14: ffff888005536400 R15: ffff888003e53148
[  137.722350] FS:  00007f07f29d6380(0000) GS:ffff8880fa70a000(0000) knlGS:0000000000000000
[  137.722351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  137.722351] CR2: fffffffffffffff8 CR3: 00000000044d6000 CR4: 00000000000006f0
[  137.722352] Kernel panic - not syncing: Fatal exception in interrupt
[  137.722457] Kernel Offset: disabled
[  137.745911] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Signed-off-by: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
---
 drivers/misc/lkdtm/bugs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 376047beea3d..d462c77fc1a2 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -647,9 +647,21 @@ static void lkdtm_DOUBLE_FAULT(void)
 	asm volatile ("movw %0, %%ss; addl $0, (%%esp)" ::
 		      "r" ((unsigned short)(GDT_ENTRY_TLS_MIN << 3)));
 
-	pr_err("FAIL: tried to double fault but didn't die\n");
+	pr_err("FAIL: tried to double fault on x86_32 but didn't die\n");
+#elif IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML)
+	local_irq_disable();
+	/*
+	 * Trigger #DF on x86_64:
+	 * 1. Set RSP to an invalid address (e.g., NULL).
+	 * 2. Execute an instruction that causes a fault (e.g., 'int3' for #BP).
+	 * 3. The CPU attempts to deliver the #BP. This involves pushing an
+	 *    exception frame onto the stack pointed to by RSP.
+	 * 4. Since RSP is invalid, the push operation itself faults (e.g., #PF).
+	 */
+	asm volatile ("movq $0, %%rsp; int3" :: );
+	pr_err("FAIL: tried to double fault on x86_64 but didn't die\n");
 #else
-	pr_err("XFAIL: this test is ia32-only\n");
+	pr_err("XFAIL: this test is x86_64 and x86_32 only\n");
 #endif
 }
 
-- 
2.43.0

