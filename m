Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C69213235
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209398; cv=none; b=ZwOtlsxIz9XHW7T8jImlXh9ClKG6cZ2fFeHr3SjoOyVMhNTOQUtSlCgtY4Fe6wlTTDqgO85FRiX3OSKkky10L8F8P/QZM4QLb+5wyIe4U5tYTTqR14qSraymnvlLfYSRxPegfRk3ZGslkkpQBM6nnRmtzyKzNoZLa3hffkeg6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209398; c=relaxed/simple;
	bh=4hY+2WN/bGTy/xxHR6cXbdosxN3VP5rIgqtgNEYAb9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vg6SwTNeRqlhSQtXzscCcZtw57uFw9rosp3rYiw6HhsCRPefSFBKHng26MBJxS2X7CDY8An9BVuxjkgdIx785VDYYG+KjZOnHyOPuD8W1KmUU9Gj0JDNJuwsGzDXTePXkvyg2je4NDvmaEYqM9qwWBLVHUqFWTxr2zLvRKUIETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4Zy5Jf6frCzKHMbm
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 914771A0FCD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:33 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgDXOnuvTCRoTNWvMA--.62928S5;
	Wed, 14 May 2025 15:56:33 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] mm/shmem: Fix potential dead loop in shmem_unuse()
Date: Thu, 15 May 2025 00:50:45 +0800
Message-Id: <20250514165047.946884-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250514165047.946884-1-shikemeng@huaweicloud.com>
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDXOnuvTCRoTNWvMA--.62928S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWfWrWDtw45Ar4xGr43trb_yoW8Wr1Dpr
	yY93srKrWrZrWkGFW7t3W8urWaqw4FgF4UtFW3C3Z5A3WUtr42grnFgFyUu393CrZ8Xr43
	tFnFgry3Aa18trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUaTKu
	UUUUU
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
---
 mm/shmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 495e661eb8bb..0fed94c2bc09 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1505,6 +1505,7 @@ int shmem_unuse(unsigned int type)
 		return 0;
 
 	mutex_lock(&shmem_swaplist_mutex);
+start_over:
 	list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
 		if (!info->swapped) {
 			list_del_init(&info->swaplist);
@@ -1530,6 +1531,8 @@ int shmem_unuse(unsigned int type)
 			wake_up_var(&info->stop_eviction);
 		if (error)
 			break;
+		if (list_empty(&info->swaplist))
+			goto start_over;
 	}
 	mutex_unlock(&shmem_swaplist_mutex);
 
-- 
2.30.0

