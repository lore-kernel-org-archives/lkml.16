Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582B22CBEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383334; cv=none; b=fOTUsw+2NUWZNO0o2kaM/qVR4MK9KhSEi96aRYVLgU2ownkkWuIRnRHj9gdb4rGfKFSQdlfYGA8CnC3pE1QqOgO+cpJxOxlqRK0j8fhjmrXlvYdzxKO9JBLwFtkOM/jkK/LAKdUXR5l4AfVxiPFH9GP5m2OULBc3Y71rHZBA7hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383334; c=relaxed/simple;
	bh=el7Mg+NMzhnJ+Hh5QLLq7jYi4NCYVUjvcYNI0/2yoew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/nm/NaKLyGPKcdgZa3LI9wLamz8O9JJi5qOf5WofdsScVFOWQU+yFFCy8K7WzUxte2vZhEjwhVpxbk6xuNXrALxxf7Yv65Y9jfXiZWX+xZSgmZRg/TgycpGW4Zkd57VJ9NIvyt2nMc2gXbRnZ2iqKOa8GvvhCPiTKVEDbAcBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd95v95z4f3jkJ
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 76A9A1A19F7
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:29 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S6;
	Fri, 16 May 2025 16:15:29 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] mm: shmem: only remove inode from swaplist when it's swapped page count is 0
Date: Sat, 17 May 2025 01:09:38 +0800
Message-Id: <20250516170939.965736-5-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy5ZFWrXF1kuryfZFW5Wrg_yoW8Jw15p3
	97G34DJrWrAry0kFWxAanI9w1Ygws5Wa1UKFWakw1rZFsIvw48Krnaqr95Xr97CFZxGFy2
	qrnF9F12ya1jy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAv
	FVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3w
	A2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr2
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
	AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	s3kuDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Even if we fail to allocate a swap entry, the inode might have previously
allocated entry and we might take inode containing swap entry off swaplist.
As a result, try_to_unuse() may enter a potential dead loop to repeatedly
look for inode and clean it's swap entry.
Only take inode off swaplist when it's swapped page count is 0 to fix the
issue.

Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Kairui Song <kasong@tencent.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202505161438.9009cf47-lkp@intel.com
---
 mm/shmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index aeeddf612baa..07b8e1400c67 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1651,8 +1651,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		BUG_ON(folio_mapped(folio));
 		return swap_writepage(&folio->page, wbc);
 	}
-
-	list_del_init(&info->swaplist);
+	if (!info->swapped)
+		list_del_init(&info->swaplist);
 	mutex_unlock(&shmem_swaplist_mutex);
 	if (nr_pages > 1)
 		goto try_split;
-- 
2.30.0

