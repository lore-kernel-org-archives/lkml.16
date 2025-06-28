Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129BBE4A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751093618; cv=none; b=SCxwAl98KOCMPXPk85MIgEvD0U5SQ8lpL+ubsF1Jp+e7d8bVVRqrEKCC/kG8G2oz4RPeyXeHvdQKXJLEIBPfk942r6dgER/2pM2o6lffK5OQOib3vPftfj2dNJ2ogoh9zWHhFcR7yGu+/MlAQ0x+HmNDTkHM5+3z0Qe2UAVkVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751093618; c=relaxed/simple;
	bh=nP4OWLf9rR3b9ta+ZmTmaXqRA0ZAAWILmIPdje1mPo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eCOjMymHT46V3RUjpOIcPy2+ogbZG1+pn4nlYOLESjry5FeuCa3imT6bcaa7jktEeI8+peKckWOE+o0gACY4fw5w8wpnq34ad1vQJzXzZSO4l8gTt68cGitTTZMXhupvqd2hOWoF9UnY+KFG1wfZ8PAq//TYQc3hjGNMx2p7lrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bTjnB2x2xzKHN4T
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:53:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C53691A16AA
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:53:32 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgBXvGBokV9ofviVQw--.53873S4;
	Sat, 28 Jun 2025 14:53:30 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: yi.zhang@redhat.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	johnny.chenyi@huawei.com
Subject: [PATCH] nvme: clear nvme request for nonready request
Date: Sat, 28 Jun 2025 14:46:34 +0800
Message-Id: <20250628064634.3823093-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgBXvGBokV9ofviVQw--.53873S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4kZFyfur4rArW5Wry5CFg_yoW8uFWfpF
	4FvrW3C3429w4vy3y7Jw47ur95twsFvasrJr4fGw13XF4DKr9Y9r98Ka43XF9akrs5W3y5
	GFs5Ar9rXr13XrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

It's found nvme mpath IO inflight counter can be decreased to negtive by
following stack:

CPU: 12 UID: 0 PID: 466 Comm: kworker/12:1H Tainted: G
   6.16.0-rc3.yu+ #2 PREEMPT(voluntary)
Workqueue: kblockd blk_mq_run_work_fn
RIP: 0010:bdev_end_io_acct+0x494/0x5c0
Call Trace:
 <TASK>
 nvme_end_req+0x4d/0x70 [nvme_core]
 nvme_failover_req+0x3bd/0x530 [nvme_core]
 nvme_fail_nonready_command+0x12c/0x170 [nvme_core]
 nvme_fc_queue_rq+0x463/0x720 [nvme_fc]
 blk_mq_dispatch_rq_list+0x358/0x1260
 __blk_mq_sched_dispatch_requests+0x2dd/0x480
 blk_mq_sched_dispatch_requests+0xa6/0x140
 blk_mq_run_work_fn+0x1bb/0x2a0
 process_one_work+0x8ca/0x1950
 worker_thread+0x58d/0xcf0
 kthread+0x3d5/0x7a0
 ret_from_fork+0x403/0x510
 ret_from_fork_asm+0x1a/0x30
 </TASK>

The IO inflight counter is not increased from nvme_fail_nonready_command()
yet, hence decrease it will cause it to be negative.

This is not a problem for blk-mq request because it's already
initialized before issuing, however, nvme request is only initialized from
following nvme_setup_cmd(). Fix the problem by clearing it in
nvme_fail_nonready_command().

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Closes: https://lore.kernel.org/all/CAHj4cs_+dauobyYyP805t33WMJVzOWj=7+51p4_j9rA63D9sog@mail.gmail.com/
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/nvme/host/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 92697f98c601..8caafa25c010 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -764,6 +764,9 @@ blk_status_t nvme_fail_nonready_command(struct nvme_ctrl *ctrl,
 	    !test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ctrl->flags) &&
 	    !blk_noretry_request(rq) && !(rq->cmd_flags & REQ_NVME_MPATH))
 		return BLK_STS_RESOURCE;
+
+	if (!(rq->rq_flags & RQF_DONTPREP))
+		nvme_clear_nvme_request(rq);
 	return nvme_host_path_error(rq);
 }
 EXPORT_SYMBOL_GPL(nvme_fail_nonready_command);
-- 
2.39.2

