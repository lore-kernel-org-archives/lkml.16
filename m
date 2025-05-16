Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904B22B8B3
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383333; cv=none; b=MizUsfiUacrGR5zGbzHrA2rKKiVnoRmgktdJ26Ksg9kJm4QBm5K3mLZj8nXujs29OkO6vkGvT6bJ+gmVib6m7/qh3DDWUdbKrlc9YHhCcnHy7zdb6j2ixp2HpVo5gGMWWvyfXJLi68BlTEUw7gNp4n3lgToaQtJ3u6rPqzE4rsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383333; c=relaxed/simple;
	bh=Mi+u82QvLCL2w7iIrvHbTF+2i5Z1Y9Q6D80iviu88r0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LB+AeVuWpoOQ0jyzjES2vP70cRJDTaa36xZY22Yx+rI9/AV4OWmdrY+BrmABP2PINC9QLJiyOx25i3udPVLeQkNtbWB2xeCOQQePk0ZBg2PrmtECBUvUU5kc3gO+ZXzkRAxV3OpEQWq8JMcXvaG1xrMxQUlmMHeKvDAMbZTILLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd34FKxz4f3jXT
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 6F1181A07C0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:28 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S3;
	Fri, 16 May 2025 16:15:28 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
Date: Sat, 17 May 2025 01:09:35 +0800
Message-Id: <20250516170939.965736-2-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZw15CF17tw4xWw13tF47Arb_yoWDJwbEvF
	1kt34UWw4Igw1Ikr1UKFW3X34Fg3yrZwn8uFy7KFy3A3s8tr4kAFWktr4Yqry7Wa429rsI
	yFnIqrZIyry2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kI
	II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7
	xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2
	z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfAwsU
	UUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

If we get a folio from swap_cache_get_folio() successfully but encounter
a failure before the folio is locked, we will unlock the folio which was
not previously locked.
Put the folio and set it to NULL when a failure occurs before the folio
is locked to fix the issue.

Fixes: 058313515d5aa ("mm: shmem: fix potential data corruption during shmem swapin")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Kairui Song <kasong@tencent.com>
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

