Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FA25D8FA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340006; cv=none; b=brXGVYX/ayZLsuO10KdyIM9YVJWn6Mkpx8QOpwEXjwtHJt9vzOHrM2vPueNf9iOio+YgABcOquCSfCMux8xIakrxS0+uFaJjkfNaJXMI/TrHjzC9uKNjlFZRDgrTlKaIdg/cq8RmZocABJh42oqEokie6SQICfJWjh3DufJ3lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340006; c=relaxed/simple;
	bh=4jFqluJG20UjTfdnDhk02sGkpiGko5EtGtm1OQXooh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sRbsME7sGHll+W8kgNTYS+gm7gwLlt+KZeP3JDFdMuhXzocW0cbyqXIo4sMy6D0i7qcUB3KnU32Y8gOk3NJS+r30Z2yfHGLEIotfyOP5IlS5QCpZc3jBMYUlk33wcuO2dXwStej981pSk1KbfE0Jw8JIMeGV8v8ApM2zcTVrDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bNM4c6dqTzKHMlB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:33:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 493EA1A08FF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:33:19 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgC3Gl+dEVRoTukHQA--.57071S4;
	Thu, 19 Jun 2025 21:33:19 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: tglx@linutronix.de,
	akpm@linux-foundation.org,
	john.g.garry@oracle.com,
	ming.lei@redhat.com,
	axboe@kernel.dk
Cc: linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	johnny.chenyi@huawei.com
Subject: [PATCH v2] lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
Date: Thu, 19 Jun 2025 21:26:55 +0800
Message-Id: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgC3Gl+dEVRoTukHQA--.57071S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWrGr1UKF43JrWfuFyUJrb_yoW8Zr45pF
	45Kw4YkFykGF18Aw45Zw4Ig3WFgFnYvF1fGrWIkrn8XF4aqw45Xr93AFW5JrW8CwsxGa1f
	Xayvyr45tryjyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
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

Fix the problem by checking numgrps first in group_cpus_evenly(), and
return NULL directly if numgrps is zero.

Fixes: 6a6dcae8f486 ("blk-mq: Build default queue map via group_cpus_evenly()")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
Changes in v2:
 - check numgrps directly.

 lib/group_cpus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/group_cpus.c b/lib/group_cpus.c
index ee272c4cefcc..d68407e3601e 100644
--- a/lib/group_cpus.c
+++ b/lib/group_cpus.c
@@ -352,6 +352,9 @@ struct cpumask *group_cpus_evenly(unsigned int numgrps)
 	int ret = -ENOMEM;
 	struct cpumask *masks = NULL;
 
+	if (numgrps == 0)
+		return NULL;
+
 	if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
 		return NULL;
 
-- 
2.39.2

