Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A021DF240
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930254; cv=none; b=V7y0qANP71C73iWshtsqEriQzbMNiRf7sZ3HsXosVodMKR0LNhX/P8sirWO/w/XJmo/fErvyZUiffqN+2+hn8DBdp/01FD3jo0JYirNOGgo9nqT2RkCVYHpxx0R7FqWBrZFFN0IIiKS5gBU4enkGlIGgRSSloVmfJWZNUQzp8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930254; c=relaxed/simple;
	bh=DraMcqhk0V2aBlpbUNKw1IkWnzS273i56h89io0FOpQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VBuZCYwpkw8IDjxO8Oo2NgGtxSA+gQEXz3hUQhN0UvgPvgCpeAXOTNgCkZb3sURqXnfzag8D1ekyEJZY95eRmUXdMg3ynbHeVdxuMTOC5noxsguKfXp8OLAwFPCnqwdY5KjzJA//PUe6h1neuQ9KfTuvgJIwKadO9V26/XyuHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=tNVdUkOF; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="tNVdUkOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738930239; bh=/SuM0t3Yz3v//0L2DnNqQL9QSC/hyP6Sx1JioaDOAuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tNVdUkOFNgAB8Eqm5pEbucppsFzipDCqnmryaSCXWFxIDCKw8dqHbTXyzrt5SqSjI
	 O60oiG5RlqxIp3dY96AEUPM45aKYqK43COjWS1z7yfXCgu/SeFod0rdAfJdE3Ap8Yh
	 +7YinvA+9vl5pZPluBhE54bnML8GYGbgHFodDiIA=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 2A42D683; Fri, 07 Feb 2025 20:10:36 +0800
X-QQ-mid: xmsmtpt1738930236tazn4ekvh
Message-ID: <tencent_78F778176466C7F364036D096B03A8E44F05@qq.com>
X-QQ-XMAILINFO: NG7xP+P+sy64Rxdf3hjZq+tdjfkQ6DqJoY/6brevMb9kcfAegM5CYXlETUePjd
	 jI1RT+FnZxuX5+qRaShp9TjnxuE6C0ZZzvCKn1Ak2lIWYWAIwgLtmbKxaqzwCZIrlqIvvtjJA5kQ
	 0zzZ0pDLJh6UcxqC2NfhhKJREPzO4o+vKEJOg+aYiH0tuvUAB4yVRt5wYXIeBvl5InL2WTT59uZA
	 aP2YsAlPGeBdIZ36A8r8YpXW9Lb8IHx4ng6lZuKKR8AuvLzJF0pzqbNa/vA02303Z7XLbWo273zH
	 CUb7Iq5Dw8LOMHutkEm3luotGojkwWgKWY7EjBnMo55FHiixrRWzshV42FuOjaPQOoEs1ikVVrbA
	 u9pAKuYTEjQ+BmDRp0NTLUUFZAyIFWD0w9p9ygeW/tvyu2NOVTsvhFezS5Cfu6KWltwtmc016fDL
	 H2wTDYLMILji3qVjYDfg5eflqMoBloRJbSH3QYZEv/NjN1LZTxSTs5gO8xR/YsUc+QL2KdFwD/e5
	 mK9H+RZXCCCL2rizQsFhz0f4STNBhQKXgN3ihkSqj5wM6JcWPvHjKlvhdB8gsdm1Lz9KIquiJFGz
	 ZTggmDLLKjNLVQxZrdohHPJ4E0jJ+FjOmQqc6Pp5nRqjk/7wwi+Fd54ak7jkfHmJzjG49L/OlPNT
	 mmSNpdSaehqsVkJ3pXvaKaMHeFmbvyKez5Ros/zAHkSCrM4KSaJj49ossAIxfsKtOjGVmyVyvUR4
	 UKmdZaA9LUTo52KS3VyPlhndj1U9vmBghMwPSJKFxy4F+x7J80ffNC/QMz45z049xMBqrD3gm7ST
	 MX6cGXmm8ZKMmc9ZYvjxLYrtuR/BTRBZY105gipfz8/07txN78FTPEasNiPgT2x7eaNuomPWxttP
	 8J8Jk6j+GdLNIy0jf9iGQgaZqpQQ/BBqEzoKciSg4eSApbdngkrEI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: miquel.raynal@bootlin.com
Cc: eadavis@qq.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH V2] mtd: capture device name setting failure when adding mtd
Date: Fri,  7 Feb 2025 20:10:35 +0800
X-OQ-MSGID: <20250207121034.538582-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <87ikpn57sy.fsf@bootlin.com>
References: <87ikpn57sy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a WARNING in release_mtd_partition. [1]

The reproducer uses "/proc/thread-self/fail-nth" to trigger the failure
of memory allocation when executing dev_set_name() in add_mtd_device(),
which eventually causes device_register() to fail because the device name
is not set, and finally triggers a warning in put_device().

[1]
WARNING: CPU: 0 PID: 5826 at drivers/mtd/mtdpart.c:37 release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Modules linked in:
CPU: 0 UID: 0 PID: 5826 Comm: syz-executor397 Not tainted 6.13.0-syzkaller-09734-g2a9f04bde07a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 1e 48 8b 7b 38 e8 ef 84 cd fb 48 89 df 5b 5d e9 e5 84 cd fb e8 70 4a 75 fb 90 <0f> 0b 90 eb c2 e8 a5 29 d8 fb eb db 48 89 ef e8 9b 29 d8 fb eb a5
RSP: 0018:ffffc90003e1f828 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802c1d1000 RCX: ffffffff8b417995
RDX: ffff8880310c3c00 RSI: ffffffff86439150 RDI: ffff88802c1d1000
RBP: ffff88802c1d1648 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000004 R11: ffffffff81000130 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055558b9cd480(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000034aca000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mtd_release+0xa0/0xd0 drivers/mtd/mtdcore.c:101
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 add_mtd_device+0xbb3/0x1700 drivers/mtd/mtdcore.c:750
 mtd_add_partition+0x300/0x650 drivers/mtd/mtdpart.c:279
 mtdchar_blkpg_ioctl+0x20d/0x250 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0xbbe/0x2050 drivers/mtd/mtdchar.c:1216
 mtdchar_unlocked_ioctl+0xb0/0xf0 drivers/mtd/mtdchar.c:1239
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=074732af3fc6c528f8a0
Tested-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: adjust "common pattern for error checking"

 drivers/mtd/mtdcore.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..b80d5098d276 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -741,7 +741,9 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
-	dev_set_name(&mtd->dev, "mtd%d", i);
+	error = dev_set_name(&mtd->dev, "mtd%d", i);
+	if (error)
+		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
@@ -790,6 +792,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	device_unregister(&mtd->dev);
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
+fail_devname:
 	idr_remove(&mtd_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
-- 
2.43.0

