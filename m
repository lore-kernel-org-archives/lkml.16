Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF56299A93
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941018; cv=none; b=KBYqpzGChfz56+DPXaqh9mD1u4JLPNkfzIdwKgzW4xHynDPOybzZPKU3wkjXO9fla5X/2exBnmfMomdUirMfKM8qd5Osc31R/HAn7uNzDScidhsc/5fwIQRpntCf++NivGE2lABG4L63Cnt5lCP5e0PYNEcPg3K9EQNxVTyx9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941018; c=relaxed/simple;
	bh=L4oxkWCu4/xfQbL2VZPaOzO/8DvUUGQoe1XaKUL8Pw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mN3ZMibxvKHcdFh/IdRyKJLxG0Zc1R02xGDZfLk1gpStq5VOxOr/XN+7W9HeG6DY1ckYXu2KKcxR7OmHXzN09b2f961HTtF4QOZBfya1NkQOaPvu4THP+fcO2m1QSZ9fH8Agzf2JxlyrObAdGz9eHLvfGvtwSlfQywiXyc2lOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bSdJc2345z2TSmn;
	Thu, 26 Jun 2025 20:28:32 +0800 (CST)
Received: from kwepemf500005.china.huawei.com (unknown [7.202.181.243])
	by mail.maildlp.com (Postfix) with ESMTPS id 067661401E9;
	Thu, 26 Jun 2025 20:30:11 +0800 (CST)
Received: from huawei.com (10.67.174.161) by kwepemf500005.china.huawei.com
 (7.202.181.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Jun
 2025 20:30:10 +0800
From: Cheng Yu <serein.chengyu@huawei.com>
To: <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<akpm@linux-foundation.org>, <travis@sgi.com>, <linux-kernel@vger.kernel.org>
CC: <zhangqiao22@huawei.com>, <tanghui20@huawei.com>,
	<chenweilong@huawei.com>, <judy.chenhui@huawei.com>, <chenjun102@huawei.com>
Subject: [PATCH] bitmap-str: Limit the size of ulen in bitmap_parselist_user()
Date: Thu, 26 Jun 2025 20:19:03 +0800
Message-ID: <20250626121903.3086789-1-serein.chengyu@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf500005.china.huawei.com (7.202.181.243)

Wu randomly sets the smp_affinity_list of the specified irq through a
code on the linux-5.10.y kernel:
    ================================
    ...
    memcpy((void*)0x20000080, "/proc/irq/18/smp_affinity_list", 30);
    res = syscall(__NR_openat, /*fd=*/0xffffffffffffff9cul,
                  /*file=*/0x20000080ul, /*flags=*/1ul, /*mode=*/0ul);
    r[0] = res;
    ...
    syscall(__NR_write, /*fd=*/r[0], /*arg=*/0x20002100ul,
            /*len=*/0xfffffdfeul);
    ...
    ================================

Warning will be triggered and the call trace is as follows:
[   69.732366] Call Trace:
[   69.732373]  ? show_trace_log_lvl+0x1c1/0x2d9
[   69.732374]  ? show_trace_log_lvl+0x1c1/0x2d9
[   69.732379]  ? kmalloc_order+0x28/0xf0
[   69.732389]  ? __alloc_pages_nodemask+0x287/0x300
[   69.732393]  ? __warn+0x80/0x100
[   69.732394]  ? __alloc_pages_nodemask+0x287/0x300
[   69.732397]  ? report_bug+0x9e/0xc0
[   69.732400]  ? handle_bug+0x41/0x90
[   69.732402]  ? exc_invalid_op+0x14/0x70
[   69.732403]  ? asm_exc_invalid_op+0x12/0x20
[   69.732405]  ? __alloc_pages_nodemask+0x287/0x300
[   69.732407]  ? bitmap_parselist+0x120/0x120
[   69.732409]  kmalloc_order+0x28/0xf0
[   69.732410]  kmalloc_order_trace+0x19/0x90
[   69.732414]  memdup_user_nul+0x22/0xa0
[   69.732415]  bitmap_parselist_user+0x35/0x80
[   69.732419]  write_irq_affinity.constprop.0.isra.0+0xb9/0x110
[   69.732422]  proc_reg_write+0x4e/0x90
[   69.732425]  vfs_write+0xbf/0x290
[   69.732426]  ksys_write+0x5f/0xe0
[   69.732428]  do_syscall_64+0x30/0x40
[   69.732430]  entry_SYSCALL_64_after_hwframe+0x67/0xd1

It is due to the lack of a check for the maximum value of ulen in
bitmap_parselist_user().

Fixes: 4b060420a596 ("bitmap, irq: add smp_affinity_list interface to /proc/irq")
Signed-off-by: Cheng Yu <serein.chengyu@huawei.com>
Signed-off-by: Wu Guanghao <wuguanghao3@huawei.com>
---
 lib/bitmap-str.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index be745209507a..0b5d9ffe20c6 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -419,6 +419,9 @@ int bitmap_parselist_user(const char __user *ubuf,
 	char *buf;
 	int ret;
 
+	if (ulen > PAGE_SIZE)
+		return -ENOMEM;
+
 	buf = memdup_user_nul(ubuf, ulen);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
-- 
2.25.1

