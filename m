Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A7413AD18;
	Thu,  6 Feb 2025 02:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810737; cv=none; b=A/bGRifmqPOET1h58wYvY8hF9ZdeypJ3r7AdRftQ8L9xsI88gkMUnsBAlrVkchayYFARiI9RJ1NReadEhPv4JQCDxHQ9rZsNIBOpFsFFl2MLDBB51fZtzXiCvBDCKFh2lUhJt3696AZGM1jTlm2Tv30dJ8LCzzDqe863F/pUq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810737; c=relaxed/simple;
	bh=3lGujLEmqlUQjlKf2gi/U8xopfYpsbu4CWP6k61asTU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=lPSoyQn5J41VW553nJ/opaq40Y31VuJOdh1YafAznAlbVQxq/hRi6pmCa7ZCyJ+dN4n9P0fUIgcWvDcmq0JEA88FeFy33OtwItrApODyFe6SMy/4eMWjkc8WveSVhWz2FHTJjkmaug5Td84gBdJesH1NDWUqaa4io/mmMfDwEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LCQasQWX; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LCQasQWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738810722; bh=W985aGojcuWiDeCnrhJs+9mBdeGzwhVtK3zQEyVa7sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LCQasQWXCG5oju5nromNGpgsuRjdbTvZo32vob+Y27CYPBGyP/RL+9+QYxi8v0stB
	 mEu2IuKB+49ol23e6As91EVO4XTe71VzkQff0JYcrw9NkqofGO07UyWZ5p6ZZ1Mrzh
	 FD/epYQ7DicdqszTbkta20K0/RNrAUEh+JxRqATc=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id D221B053; Thu, 06 Feb 2025 10:52:34 +0800
X-QQ-mid: xmsmtpt1738810354t73r6gd7l
Message-ID: <tencent_65865F89A52EED6ECB8C8D67E1C6FAD2FC06@qq.com>
X-QQ-XMAILINFO: NIraPvLG0lH0CoSCUhMIVbU8V4XhVp+jmGf+3VjoHEpredbLtpUMxYzsi3X7FO
	 z718x+wrjQILM/6CH/1ZAQpFQYJKKqGJ304iHqd4vpV+KTB5Fkf6JaSmqQQ92X6zhnH9YmA5xjEO
	 UsTzVv72iDPqdVy3RbJSrAZJQa7J10RPiLsYUFLIeLq4shnBlISU0dfQjwrIvahH5jKg8j9654qR
	 JaTgmpZ2t4+FkALQfsgNhrGvcfC2HEqIGqSSm97LCfjDpkhWMBLqF0BIdB4y4pRBvFf6VIds/nuI
	 1tC4M4mfAC6wCuFpZzpMWPFB19pN5ZSYgIKRm1R74dxMS4QVsxvjQJIrAkoBtmJN9z+Kok/iChiF
	 6IN+2BzH2uhl7i344M5FJ23w3VHsJq14ddEjhMMylXL00l89t1V/jg8jj3j9W9CEbx4p2T7CjGHt
	 4gjQxuMvRjNFh7muFlgFsj6kNNh/BgM3f28oDpwEPzCVmztVuZ2tABYFwDqkW8qZO+iIwHhPsfqx
	 RI0okVYceR5rR7d0CahTSv6k6AwiPhpkG6TEUeu54ivLVOy2lDBw4clD3jWTIyJR6qvsG73uQW7w
	 CCeihqalLxjeSpf2vLv5GiB61dHOjIfMt8+1H3n0Ir2X5hJ7DRBAuQukV3jsrFBb3hJuQhOkangw
	 4VE+6NeiWdtlXU1t0hb3e6vkkYLJnZ3sGlMt466IBX48ZV3vPvFmaofCfMdNFwdjqbTSBLxYDz37
	 mEa2OHHVsMKgUkLmHybIdwaqOFQ1z5M63XIAm0xD6t32Hk7w444mymke0rP+76/qsJPGJERuReCw
	 fJJtKHUA1lwbAACoMEOS4Rfvjh6qMF0Q0cnZSxpuBXha/0F+Xk1fCXFBz7gXv3+ku6YpwVB56thM
	 9+ZTUpkP6sshsKHX82MQJIvW7RXtmjTE4fc+4ctiGV5uDEgEqPT+8=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: corsair-void: add missing cancel delaywork
Date: Thu,  6 Feb 2025 10:52:35 +0800
X-OQ-MSGID: <20250206025234.107442-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
References: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a slab-use-after-free Read in usbhid_raw_request. [1]

The delayed_status_work still runs after usb device is removed.

[1]
BUG: KASAN: slab-use-after-free in usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
Read of size 4 at addr ffff88812223c67c by task kworker/0:3/2954

CPU: 0 UID: 0 PID: 2954 Comm: kworker/0:3 Not tainted 6.13.0-syzkaller-09485-g72deda0abee6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events corsair_void_status_work_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:927 [inline]
 usbhid_raw_request+0x233/0x700 drivers/hid/usbhid/hid-core.c:1295
 __hid_hw_raw_request drivers/hid/hid-core.c:2457 [inline]
 hid_hw_raw_request+0x10a/0x150 drivers/hid/hid-core.c:2479
 corsair_void_request_status+0xc3/0x130 drivers/hid/hid-corsair-void.c:493
 corsair_void_status_work_handler+0x3f/0xb0 drivers/hid/hid-corsair-void.c:512
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 2954:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 usb_alloc_dev+0x55/0xdc0 drivers/usb/core/usb.c:650
 hub_port_connect drivers/usb/core/hub.c:5426 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x28f9/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 2968:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x294/0x480 mm/slub.c:4757
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
Reported-by: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=90ac8355c8ac84b1b464
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/hid/hid-corsair-void.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 6ece56b850fc..83d65fa29a5a 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -727,6 +727,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 		power_supply_unregister(drvdata->battery);
 
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
 
-- 
2.43.0

