Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383822475CB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322182; cv=none; b=OEznFrtSrUB/8RsgMi2Sn2ZIykzb+0mlDKaaT0xEA8XeRNy8RwpV3KSEA0Ul8cBaggQRe8opl86W3qQQ2G2BCCv+DnRTYWYv8F0cdyKaQ9NMJYw+Cy4UqXZQrXTgyY1x5ghAtMuvwL1l1/gWGZ+Bhc8QpClHkvbCe5i+HDpMV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322182; c=relaxed/simple;
	bh=/Lp/O5vQ0HV7GkGwx5ZKYRSwkwyP+1/8cJhJ/GxCZmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iwkn/H6NmN3X9rp5gWKA9qLLF3cLBtyVCStmtkY6qAIdaypHLZ4ibf7BiA/aqeS3ZusdpgZk7ir35DUV1TfmBrJA95oYmVEmw6ulr0tDbCtEePmjp95iW52fcgFMpWQlhUKRLfkGh9ofY/7oLQxY1itddaOMu2Aw29M7i4OqOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bNDTk5XKxzYQw1h
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:36:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B6A641A12F3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:36:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgCH61_yy1Noq1DyPw--.49289S4;
	Thu, 19 Jun 2025 16:36:09 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: akpm@linux-foundation.org,
	tglx@linutronix.de,
	john.g.garry@oracle.com,
	axboe@kernel.dk,
	ming.lei@redhat.com
Cc: linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	johnny.chenyi@huawei.com
Subject: [PATCH] lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
Date: Thu, 19 Jun 2025 16:29:41 +0800
Message-Id: <20250619082941.3741592-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCH61_yy1Noq1DyPw--.49289S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWrGr1UKF43JrWfuFyUJrb_yoW8ZrWkpF
	WSkr4jkFykGF18Ca1Yvw4Ig3WSqFnYvr1fGFyxKF1YvF1aqw45ZF97XFWUXryrCws8Aa1f
	XasYyrW5t34qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

While testing null_blk with configfs, echo 0 > poll_queues will trigger
following panic:

BUG: kernel NULL pointer dereference, address: 0000000000000010
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 27 UID: 0 PID: 920 Comm: bash Not tainted 6.15.0-02023-gadbdb95c8696-dirty #1238 PREEMPT(undef)
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
RIP: 0010:__bitmap_or+0x48/0x70
Call Trace:
 <TASK>
 __group_cpus_evenly+0x822/0x8c0
 group_cpus_evenly+0x2d9/0x490
 blk_mq_map_queues+0x1e/0x110
 null_map_queues+0xc9/0x170 [null_blk]
 blk_mq_update_queue_map+0xdb/0x160
 blk_mq_update_nr_hw_queues+0x22b/0x560
 nullb_update_nr_hw_queues+0x71/0xf0 [null_blk]
 nullb_device_poll_queues_store+0xa4/0x130 [null_blk]
 configfs_write_iter+0x109/0x1d0
 vfs_write+0x26e/0x6f0
 ksys_write+0x79/0x180
 __x64_sys_write+0x1d/0x30
 x64_sys_call+0x45c4/0x45f0
 do_syscall_64+0xa5/0x240
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Root cause is that numgrps is set to 0, and ZERO_SIZE_PTR is returned
from kcalloc(), then __group_cpus_evenly() will deference the
ZERO_SIZE_PTR.

Fix the problem by checking kcalloc() return value with ZERO_OR_NULL_PTR,
and NULL will be returned to caller.

Fixes: 6a6dcae8f486 ("blk-mq: Build default queue map via group_cpus_evenly()")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 lib/group_cpus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/group_cpus.c b/lib/group_cpus.c
index ee272c4cefcc..5e243946ee4e 100644
--- a/lib/group_cpus.c
+++ b/lib/group_cpus.c
@@ -363,7 +363,7 @@ struct cpumask *group_cpus_evenly(unsigned int numgrps)
 		goto fail_npresmsk;
 
 	masks = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
-	if (!masks)
+	if (ZERO_OR_NULL_PTR(masks))
 		goto fail_node_to_cpumask;
 
 	build_node_to_cpumask(node_to_cpumask);
-- 
2.39.2

