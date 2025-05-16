Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A589E22CBF7
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383334; cv=none; b=G5/nVISkvi42BB9hb/iO1XMgou4cG7xyFyueKRuOey+WUIU7T6Z0sNG2fRZGVGhnPUGEgDJAOq599v93pY7opOVKLo+jiZVN1g/wAzPKwSMFXq3Jg/K5zDmAuH2q5PG6NJYvGbrmQMVO/No5wbNjCANUSG36wd9KMmx6Rums1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383334; c=relaxed/simple;
	bh=ViY9YlKB8R497wGIiOa0XKSKk2aZfBq+hhYauJSRIMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XLaIJwVSJhVTLY5SdSyT3Tsika5uTMRiuYPHqkrJo742VBA5vVGr85Vy1Yv8pPqJXZJghpsO6LOW/q+tYFX+GE5Df+l5XwRlCrrufg+mbBaQKmm6GUIsqWG/pe/yRhVYUb3pVewSYfNI/KjpZqixM04VMeo7Xqbvuft0kd80ZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd25cbrz4f3lDc
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 1C8F91A19F4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:29 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S5;
	Fri, 16 May 2025 16:15:28 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] mm/shmem: Fix potential dead loop in shmem_unuse()
Date: Sat, 17 May 2025 01:09:37 +0800
Message-Id: <20250516170939.965736-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250516170939.965736-1-shikemeng@huaweicloud.com>
References: <20250516170939.965736-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWfWrWDtw45Ar4xGr43trb_yoW8ZF4rpr
	n8u3srtrWrZrykGFWxtF18urWYqw4SgF4Utay3C3Z5A3WUtr42grnFqryUu393CrZ8XFW3
	tFn29ry3Aa1vyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUa75r
	DUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

If multi shmem_unuse() for different swap type is called concurrently,
a dead loop could occur as following:
shmem_unuse(typeA)               shmem_unuse(typeB)
 mutex_lock(&shmem_swaplist_mutex)
 list_for_each_entry_safe(info, next, ...)
  ...
  mutex_unlock(&shmem_swaplist_mutex)
  /* info->swapped may drop to 0 */
  shmem_unuse_inode(&info->vfs_inode, type)

                                  mutex_lock(&shmem_swaplist_mutex)
                                  list_for_each_entry(info, next, ...)
                                   if (!info->swapped)
                                    list_del_init(&info->swaplist)

                                  ...
                                  mutex_unlock(&shmem_swaplist_mutex)

  mutex_lock(&shmem_swaplist_mutex)
  /* iterate with offlist entry and encounter a dead loop */
  next = list_next_entry(info, swaplist);
  ...

Restart the iteration if the inode is already off shmem_swaplist list
to fix the issue.

Fixes: b56a2d8af9147 ("mm: rid swapoff of quadratic complexity")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 495e661eb8bb..aeeddf612baa 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1505,6 +1505,7 @@ int shmem_unuse(unsigned int type)
 		return 0;
 
 	mutex_lock(&shmem_swaplist_mutex);
+start_over:
 	list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
 		if (!info->swapped) {
 			list_del_init(&info->swaplist);
@@ -1523,13 +1524,15 @@ int shmem_unuse(unsigned int type)
 		cond_resched();
 
 		mutex_lock(&shmem_swaplist_mutex);
-		next = list_next_entry(info, swaplist);
-		if (!info->swapped)
-			list_del_init(&info->swaplist);
 		if (atomic_dec_and_test(&info->stop_eviction))
 			wake_up_var(&info->stop_eviction);
 		if (error)
 			break;
+		if (list_empty(&info->swaplist))
+			goto start_over;
+		next = list_next_entry(info, swaplist);
+		if (!info->swapped)
+			list_del_init(&info->swaplist);
 	}
 	mutex_unlock(&shmem_swaplist_mutex);
 
-- 
2.30.0

