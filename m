Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC9213259
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209398; cv=none; b=j0GePVwQ6/VYVi1Tx1VnELCDTC8CVD02l46gZqgaHjeA/4dM9LUNkta/R7o85nT61vFVgQmqOyXFhtUzqpgktNILGnc+1puzKqvsEDm0Qu6ktXubfTIHeSyjKRfHURGot/uRxm/HrnksGI0ofY3Mjkhq0w6/LLm5r16SsUfj+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209398; c=relaxed/simple;
	bh=GbBIPCfUb7HcO4NYQXTMbrZDZp1iUrF7qwee23cm/0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RkziYiy3wueafdFFpbFh0/IlaX/D+3EwFUNKHn8KnMVVXHYaa9PsHvohIRt1R8GpjhV8rlfBPW3/1Vnzc4mwu7QzSEO8NuoitdG1shiS05eHgz4aKjB8FISz3/8CGKn2rAFH+Tgs6bIR9QzKHRFl/IAiTjrDrkqXEOPrx0+eSv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4Zy5Jg1kYzzKHMq0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DD4181A1BAF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:33 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgDXOnuvTCRoTNWvMA--.62928S6;
	Wed, 14 May 2025 15:56:33 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] mm: shmem: keep inode in swaplist when failed to allocate swap entry in shmem_writepage()
Date: Thu, 15 May 2025 00:50:46 +0800
Message-Id: <20250514165047.946884-5-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:cCh0CgDXOnuvTCRoTNWvMA--.62928S6
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18Wr1rtw18WFWxJF15CFg_yoWDZwb_Xr
	4Ut3W5WF43Wrs7Gw45Ka1fJrZ5Kws8Kr18CFs2yFW3Aas8tr4vyr98Aw4rXFW7Za15Xrn8
	A3WkAFy7Cr1qgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
Address this by keeping inode in swaplist even if we fail to allocate
swap entry as it does not pose significant problem to keep inode without
swap entry in swaplist.

Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/shmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 0fed94c2bc09..dfd2f730833c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1651,8 +1651,6 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		BUG_ON(folio_mapped(folio));
 		return swap_writepage(&folio->page, wbc);
 	}
-
-	list_del_init(&info->swaplist);
 	mutex_unlock(&shmem_swaplist_mutex);
 	if (nr_pages > 1)
 		goto try_split;
-- 
2.30.0

