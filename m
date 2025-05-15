Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B10297129
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292039; cv=none; b=DhZafiaDozzdZuo6JfGzuQQIVTzwEg8Omdg1bkhQKr4Nd1WmdX/Jek7l8CMSW4zS81B4HMNx4KwJ4hrw9kp20CskayMmGwKS2YYbTtHioomxfsS1Y6+7Sx/r4Sh29CCUKlouX+Q6w923EFvzdq6w4tNhDMBsU5SuY3Tol9xowFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292039; c=relaxed/simple;
	bh=IvviUiMfFa2Il5r7kiUngPBt19pjIZJAasz6QAnn2r4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mDtdFnPlf/sBz3LGSIiaOzQXOznG0sJIyuF6BDIg2/BeMAJVursfyqu73EI6I9HAaR2lM68GoL19hxAl1gHipph8KFI82NEsApdC+xFH+FUHIjT0tT83UUJS2EtMunFRbrKeQLr2NKVYbk3pjuPx4J77pHd6lEsUXHZER4VN2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZygsF6pnKz4f3jd1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:53:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id BC5A81A0359
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:53:46 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP4 (Coremail) with SMTP id gCh0CgAHbGB3jyVoyDnbMQ--.29023S6;
	Thu, 15 May 2025 14:53:46 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] mm: shmem: only remove inode from swaplist when it's swapped page count is 0
Date: Thu, 15 May 2025 23:47:57 +0800
Message-Id: <20250515154758.956521-5-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250515154758.956521-1-shikemeng@huaweicloud.com>
References: <20250515154758.956521-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHbGB3jyVoyDnbMQ--.29023S6
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18Wr1rtw18WFyUWrWxWFg_yoWDZFb_Wa
	10qw15WrW7Wrs7uF42kas3tF9Yg3y8Kr1DCF93tFW7CF9Igr4kZan8X3yfWayxuay5XFn8
	G3WkAr12krnFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC
	64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM2
	8EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq
	3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jv
	Wl9UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Even if we fail to allocate a swap entry, the inode might have previously
allocated entry and we might take inode containing swap entry off swaplist.
As a result, try_to_unuse() may enter a potential dead loop to repeatedly
look for inode and clean it's swap entry.
Only take inode off swaplist when it's swapped page count is 0 to fix the
issue.

Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
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

