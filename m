Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C861EA6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354674; cv=none; b=bcaRBDlWdqOS/nN/d0MgKKHMr9/onD0vGcq0sUSp4I1EkLNuGfHMw2dteOLLqoP0c3KPBHzbN9st9PUmBU8a2SjhBEnygKHOhx6LexD3ayMtlhbsdRzNIwKb9n3eH2vB1e50Hf+XYNyrLDagt/gLxhSr6PzLpEjdE5Uxx8CnAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354674; c=relaxed/simple;
	bh=72cCJmRvHK5W1WFDvPIAcW10EaQY7NbAPNugEEW4StQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oKYJXD6Dz1CcOp2Oet34wRjFM8HaTP4b5mpp+WqR7wUPrDLK0mDUKDje5hgYp7DT1am0kLsWokUMNigIx7vaEOX8wXLL8bThspZsI3uLI7lJzETxPeosz0wm/E1KA8sXw767l2JWiel4ADzEM1nOq4bHWJxyLGB6wc9we8xiDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bWZKP1F2czYQvWc
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:24:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 0E9D61A0FA8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:24:24 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP3 (Coremail) with SMTP id _Ch0CgAHaCUljWNoBbgrAQ--.17981S4;
	Tue, 01 Jul 2025 15:24:23 +0800 (CST)
From: Zheng Qixing <zhengqixing@huaweicloud.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	houtao1@huawei.com,
	zhengqixing@huawei.com
Subject: [PATCH] nvme: fix inconsistent RCU list manipulation in nvme_ns_add_to_ctrl_list()
Date: Tue,  1 Jul 2025 15:17:17 +0800
Message-Id: <20250701071717.2619384-1-zhengqixing@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAHaCUljWNoBbgrAQ--.17981S4
X-Coremail-Antispam: 1UD129KBjvJXoW7GryDXr15Cry7Zr15tw15CFg_yoW8JrWUpF
	4fur9rCrsrCr4kG34UXr429343Cwn5XFyUAr93K3ZxZryFgFWjvrnxK3WavF15Jr18Zryr
	ZF40gr47Krs8ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU17KsUUUUUU==
X-CM-SenderInfo: x2kh0wptl0x03j6k3tpzhluzxrxghudrp/

From: Zheng Qixing <zhengqixing@huawei.com>

When inserting a namespace into the controller's namespace list,
the function uses list_add_rcu() when the namespace is inserted
in the middle of the list, but falls back to a regular list_add()
when adding at the head of the list.

This inconsistency could lead to race conditions during concurrent
access, as users might observe a partially updated list. Fix this
by consistently using list_add_rcu() in both code paths to ensure
proper RCU protection throughout the entire function.

Fixes: be647e2c76b2 ("nvme: use srcu for iterating namespace list")
Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index e533d791955d..475115edbbe9 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4077,7 +4077,7 @@ static void nvme_ns_add_to_ctrl_list(struct nvme_ns *ns)
 			return;
 		}
 	}
-	list_add(&ns->list, &ns->ctrl->namespaces);
+	list_add_rcu(&ns->list, &ns->ctrl->namespaces);
 }
 
 static void nvme_alloc_ns(struct nvme_ctrl *ctrl, struct nvme_ns_info *info)
-- 
2.39.2

