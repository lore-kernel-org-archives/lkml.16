Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D325D558
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723426; cv=pass; b=u5/TKOlYAwKCrG+jEd3OS3bIBbwH4sqcK1UGFfakBkxPId+xOCRK/AKZFZHHebR7aKJi04q8QYMhxR6JDzH7Ykj+r0Nd/+PBVyo9GLIKJ4ed/4DneJE78ExZo2G3OASGAGyB4CSMgcxJV1GQHGU5kMzk6R39m9WrbMBx/ydN32g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723426; c=relaxed/simple;
	bh=7Scz7L33fNIBU0LDghTwCE0wWzBTxD/wveiJzX6db0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e23la+r0LLCouKPfCPIdXklykAS5NPuKiAwOzGQLRFKZCCWZptg5yztmh1yEfP6VNqQrN9bIXYwJxDCCuYJYs34aa1FUXloPlugr91mGTDXuHjn2OuCtkRUuXDgkkv0L0JgRG1vQZgcMy9QMk2kvfzsbknAYLVstl4saaafkHLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=J7ms0ca+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="J7ms0ca+"
ARC-Seal: i=1; a=rsa-sha256; t=1747723396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QP9ymfX00cREUkWiQ6I/sL7V66xw2J9frewsSLntHGBxBBvisFCmVPkJXfIU7QdgaUa5Bpblj4d7qcgk2bCxYMkTAq4iP8xcBosbrpwPjA8mQzB+X6N3OxsJpIp9HgbQfO8US2EImrPAQaR2T+hL/MVw43Nqgtr9zmP8Vn3hhOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747723396; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VdAEXpA00tm/dXH6GS2JFpOgc8h3jNwcDdtSVTmNLQk=; 
	b=m8vlvqW9C31fF0OZ4s9IgJCpXu+85OPcCnu+9daUgvp5J+2MDzEZ1QlrUqzfnWqhi421MJbHlzDDpD03ccPhFkckusI9Zf+lTvUBevGrKW0u25r5YetV2hDRtt5WhudKvWjwSJik33mTB3rbiYPzVMC0l2q+a1LBqWvDHNhbJdw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747723396;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=VdAEXpA00tm/dXH6GS2JFpOgc8h3jNwcDdtSVTmNLQk=;
	b=J7ms0ca+x+It0nHGgsED3fD+bEf88UJLischJeuSGChC8AnUpFaF1/NRHG4CfdIE
	ihbOs/LWtY8KEEZKCzt8A25C+KTrRi/VmgsAyDzpLL2VB57RwShMaVfKTGuheN1BUlr
	xUIGqUtJbeUo3+pZs+ipwvw8FsW6Rq+0aQ8aK3hw=
Received: by mx.zohomail.com with SMTPS id 1747723394435682.0380218931318;
	Mon, 19 May 2025 23:43:14 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 20 May 2025 14:41:50 +0800
Subject: [PATCH] mailbox: mailbox-test: Fix __might_sleep() warning in
 mbox_test_message_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fix-mailbox-test-warn-v1-1-4b807d8e5a76@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAC0kLGgC/x2MQQqAIBAAvxJ7bkETSfpKdLDcaqE0NCoI/550H
 JiZFxJFpgRd9UKkixMHX0DWFUyr9Qshu8LQiEYLLQ3O/OBueRvDgyelE28bPRo5O9UqJdRooLR
 HpCL+337I+QOAuLmEZwAAAA==
X-Change-ID: 20250518-fix-mailbox-test-warn-81fd373303b8
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747723380; l=4416;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=7Scz7L33fNIBU0LDghTwCE0wWzBTxD/wveiJzX6db0g=;
 b=U05LvP7M23QkjwLoAsjGtFD3QHD0ZF2xqcMoqtuLjbHucADDxgvb16mT3Vv9v8MrlF3AdYiEC
 rbY/pKL4Uj8AkeLGRo0LekPpxmVRhVKcFCoCBVpnqCfFFgD9UgIyHSe
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

The following warning was observed when calling mbox_test_message_read()
for the first time:

[   69.246375] do not call blocking ops when !TASK_RUNNING; state=1 set at [<(____ptrval____)>] mbox_test_message_read+0xba/0x23e
[   69.258608] WARNING: CPU: 0 PID: 62 at kernel/sched/core.c:8741 __might_sleep+0x62/0x66

This is triggered because simple_read_from_buffer() called in
mbox_test_message_read() may sleep. As a result, the kernel warns about
blocking operations when the task state is not TASK_RUNNING.

Fix this by ensuring __set_current_state(TASK_RUNNING) is called before
executing code paths that may sleep.

Fixes: d597580d3737 ("generic ...copy_..._user primitives")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Full message:

/sys/kernel/debug/soc:mailbox-test # cat message
[   69.241175] ------------[ cut here ]------------
[   69.246375] do not call blocking ops when !TASK_RUNNING; state=1 set at [<(____ptrval____)>] mbox_test_message_read+0xba/0x23e
[   69.258608] WARNING: CPU: 0 PID: 62 at kernel/sched/core.c:8741 __might_sleep+0x62/0x66
[   69.258746] Modules linked in:
[   69.258781] CPU: 0 UID: 0 PID: 62 Comm: cat Not tainted 6.15.0-rc6-00349-gde4124a71fa8-dirty #2 NONE
[   69.258820] Hardware name: Milk-V Duo (DT)
[   69.258831] epc : __might_sleep+0x62/0x66
[   69.258866]  ra : __might_sleep+0x62/0x66
[   69.258892] epc : ffffffff8004e548 ra : ffffffff8004e548 sp : ffffffc60022bc40
[   69.258913]  gp : ffffffff81717250 tp : ffffffd6023b8c80 t0 : 6100000000000000
[   69.258931]  t1 : 0000000000000064 t2 : 616320746f6e206f s0 : ffffffc60022bc60
[   69.258950]  s1 : ffffffff812001b0 a0 : 0000000000000072 a1 : ffffffff81688a60
[   69.258970]  a2 : 0000000000000010 a3 : 00000000000000c1 a4 : 0000000000000000
[   69.258989]  a5 : 0000000000000000 a6 : ffffffff8172ba60 a7 : 0000000000000038
[   69.259012]  s2 : 00000000000000c0 s3 : ffffffd602275400 s4 : ffffffd60226d180
[   69.259032]  s5 : 0000000200000022 s6 : ffffffd602275610 s7 : ffffffd602275400
[   69.259054]  s8 : ffffffd602239640 s9 : 0000000000001000 s10: 0000000000000001
[   69.259074]  s11: ffffffd6022396d8 t3 : ffffffff8172ba6f t4 : ffffffff8172ba6f
[   69.259097]  t5 : ffffffff8172ba70 t6 : ffffffc60022ba58
[   69.259114] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[   69.259139] [<ffffffff8004e548>] __might_sleep+0x62/0x66
[   69.259180] [<ffffffff801998da>] __might_fault+0x1c/0x24
[   69.259253] [<ffffffff80430824>] _copy_to_user+0x28/0x90
[   69.259295] [<ffffffff8022facc>] simple_read_from_buffer+0x48/0x72
[   69.259356] [<ffffffff807e8c20>] mbox_test_message_read+0x1da/0x23e
[   69.259396] [<ffffffff80367c32>] full_proxy_read+0x48/0x88
[   69.259477] [<ffffffff801fdea8>] vfs_read+0xb2/0x288
[   69.259508] [<ffffffff801fe896>] ksys_read+0x56/0xc0
[   69.259535] [<ffffffff801fe914>] __riscv_sys_read+0x14/0x1c
[   69.259563] [<ffffffff80a083f6>] do_trap_ecall_u+0x186/0x206
[   69.259622] [<ffffffff80a12be2>] handle_exception+0x146/0x152
[   69.259688] ---[ end trace 0000000000000000 ]---
---
 drivers/mailbox/mailbox-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index c9dd8c42c0cdf9e4ff96da012d7fbdcb4c6bc130..2540808d550d34a8d5af523043e59dce9a0e0e10 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -200,11 +200,13 @@ static ssize_t mbox_test_message_read(struct file *filp, char __user *userbuf,
 
 		if (filp->f_flags & O_NONBLOCK) {
 			ret = -EAGAIN;
+			__set_current_state(TASK_RUNNING);
 			goto waitq_err;
 		}
 
 		if (signal_pending(current)) {
 			ret = -ERESTARTSYS;
+			__set_current_state(TASK_RUNNING);
 			goto waitq_err;
 		}
 		schedule();
@@ -231,9 +233,9 @@ static ssize_t mbox_test_message_read(struct file *filp, char __user *userbuf,
 
 	spin_unlock_irqrestore(&tdev->lock, flags);
 
+	__set_current_state(TASK_RUNNING);
 	ret = simple_read_from_buffer(userbuf, count, ppos, touser, MBOX_HEXDUMP_MAX_LEN);
 waitq_err:
-	__set_current_state(TASK_RUNNING);
 	remove_wait_queue(&tdev->waitq, &wait);
 kfree_err:
 	kfree(touser);

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250518-fix-mailbox-test-warn-81fd373303b8

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

