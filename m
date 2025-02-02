Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C41380
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738460217; cv=none; b=kcwb7N4lSDTHnsq6Q06vYtLYC2PSBfCxloxdiOZTW3Y7uBrgzFzKkdOFBpKUM5tpGaA2ZxjJH3Xf1TTZifcdhM2ayqdsii3JEtT7Ex+mHzabBDbw3aQqp2IItBVEDI+KDeEDF/OQATuwKjmzE/hI5wzBSrjPkhlR62dkWm3QOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738460217; c=relaxed/simple;
	bh=dd17IxAivsQDy73TlOnDlseZLMlLNQOP2dWYS7p1d+o=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GCnnpXbU79IgrZDqmMwDAlzoTj1aGfiVKHlUgQWOfsI8Xf78VqgChXLx9PSX+Yzm0rJzvZrjoaBl5MF8reaT8EuT5V1pTiTCxnCCb4lFXW8VnPBCvv/xYyxVvcYhocTtHXhBmReimCpKYxN2ScZVObfVVBCEYISX87zsUc87D8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MYN2B7/x; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MYN2B7/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738459908; bh=fd2CPv8BKKUANxv+ziAo6JglkL7l/YnDsgiHwFtQqyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MYN2B7/xvNwgG6f2ABLyQiu5eo+4XzHRMNFEGuPkRTplDec4mmYb+SxH+mUcbWFwG
	 Ak5Tw/zZoF9BLueC3o/88trV4ULcpOT2QKqCQoPrXXbOwd4DurnaxN1aXTmFN1iMtk
	 bTa5nz9h9qvy/llQQT1yc5EGjT5QqcJXBtiBriU8=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9910:799c:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 7ECA36B8; Sun, 02 Feb 2025 09:31:44 +0800
X-QQ-mid: xmsmtpt1738459904twpialj9j
Message-ID: <tencent_B7365D9CDDA8990DCF8C0DFE25B28DB31207@qq.com>
X-QQ-XMAILINFO: NrehM+cBVv5bJ+xUjfUNygn4bwmXFTFgJDvcMiGFXV2hm/vV7IjpJd2+b20svE
	 Z9TACLaYKypxKw0Y9Yzm1+ztaXWeK5a77G/HdlLUnwOw3jqdSLl/KQ214ICmOtPljbAtDa2ykxhA
	 9MnepEhh+c4fhHo9l0ZYheJFXwJxVpai2sZQb+FiUet1nY2Q0VFzDnCdL1WDQPRecEUujCCKlI8a
	 0TyX/ZSa5pO6GYGub71jdItLt38fbsXoOuym33HJ675mSRtpA1oyD0rTmg8BXGJzdcH0soC7o0c1
	 UJRZmgAuC6yUcFW4P37fyYdKFm1IdbdEf+zzb1VZI0IpIfCz1VsxDVRQf0Fn4hCrtYiDBWNGwYVe
	 qQJDBvuWKbrohgios9G+LW1T8kQL9Z0z9EmC6W7rf/QuvZIhr/sj3ot3oPclMz5PXdu6ZDHZSrPY
	 NicIlq8+mxhyLMpeBvrtxC1LbI5ljHyfTdaAKmSjnsSbjmA7hD4BxPehM8yVsLQMHaUtOGFV+sN0
	 KAJCsAAneLwMdVnT/wTk6XxjgLIWnn4Sl5emVyB/d/rC/EK9BkLd824D4hQs3JjeyW3G6VLVMPFu
	 UyUyr1eIzKEj7i03XsGXCm87wpHU9QCI1zSZmIQHbi0JI8yZLeOK9q6m23vOqA6I6jFfbbx/5kub
	 H9dTDbkg1pb+oXN4JnlKjeUNd8K6dOyzNhkaRGJKiB2i+KMaX+QfBOcEpGJzZ/cUSIRrSG0FgMjF
	 c7uM0g4XU19tO952Q+5QZVpayN/F6ma6paJHLD9yj1mSd1V3YgATTRrZeKCSZvcZupejqR76Uimr
	 17vK4wgB8AZR/lF9uaWo6C7jnddwYO3zimfBBjL115ZCIGO38aAcn+/BIAO0I23wqnd0sKjz9vst
	 XaWhkR+LELPnBMLkL7sxsDXpBRSDnG+mvNxqXjfymjRwpI1tU9n2M=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH] mtd: capture device name setting failure when adding mtd
Date: Sun,  2 Feb 2025 09:31:45 +0800
X-OQ-MSGID: <20250202013144.1226593-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
References: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
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
 drivers/mtd/mtdcore.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..a71cd75858e4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -741,7 +741,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
-	dev_set_name(&mtd->dev, "mtd%d", i);
+	if (error = dev_set_name(&mtd->dev, "mtd%d", i))
+		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
@@ -790,6 +791,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	device_unregister(&mtd->dev);
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
+fail_devname:
 	idr_remove(&mtd_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
-- 
2.43.0

