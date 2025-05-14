Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A421921773F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209398; cv=none; b=cSbQXwc7ZN8JV3qV9LMzn06Si9mjB6UKemosntG7DscqKxQvBvLhGA0axbnZpmDZGVYb9BHcHSRq1unT3frA3pVtqWO5O9TMuoDp0jZOlnU7RbWRQPN2y/IyycaeEYuu1iNqjmFJ7PY2qBvPMPTeafqvsXCex44O1A8LOyCtHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209398; c=relaxed/simple;
	bh=wzBvKObyPnSQpFbRfHFJ4skzI5SsrLvF6S2XtPL3pIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GHSIGOeTXft3OeIP3tUaI3Mcq1JIGPqaTlJKgBjQLemaYPYaSyRlHPUQFhMTf+bZj5XVg2KmBkTUfX+59mTb17hPTrtpyaLVqqL2tFv214pjrUHZ8AoSrtaKarrUiPBFb8N4ojHAbF8SOhyHlk6JQSWfMvzYNrY++PLkNocmDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Zy5J82cZHz4f3jd5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id F167F1A1648
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:32 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgDXOnuvTCRoTNWvMA--.62928S3;
	Wed, 14 May 2025 15:56:32 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
Date: Thu, 15 May 2025 00:50:43 +0800
Message-Id: <20250514165047.946884-2-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:cCh0CgDXOnuvTCRoTNWvMA--.62928S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZw15CF17tw4xWw13tF47Arb_yoWfGrXEvF
	1kt34UWw4SgwnFkr1UKr45X34F93yrZw15uFyxKFyay3s8tr4kZr4ktr1Yqr9rWFy29rsx
	KF1qqrZIyry2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUXVWUCwA2ocxC64kI
	II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7
	xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2
	z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0ylk3UU
	UUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

If we get a folio from swap_cache_get_folio() successfully but encounter
a failure before the folio is locked, we will unlock the folio which was
not previously locked.
Put the folio and set it to NULL when a failure occurs before the folio
is locked to fix the issue.

Fixes: 058313515d5aa ("mm: shmem: fix potential data corruption during shmem swapin")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/shmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 99327c30507c..980fa15f393e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2335,6 +2335,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 */
 		split_order = shmem_split_large_entry(inode, index, swap, gfp);
 		if (split_order < 0) {
+			folio_put(folio);
+			folio = NULL;
 			error = split_order;
 			goto failed;
 		}
-- 
2.30.0

