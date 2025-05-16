Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5BA22B595
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383334; cv=none; b=Lz7hZFPVCwd8Sz3v10g7FBJ2iqGr8dkFKZOhBuJCAQK74mTZ+j3jS4Eg2MZ7Bom4x3tbhzkgATCbY5nScmP7WsW/eSMcm1DHcSF9epum6BXgoJOpi2j72VyRJYrdN0fauhokPd+wunDmxzt4IbSfAqCtndRpYJRdVNcB9TtAJiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383334; c=relaxed/simple;
	bh=DGgY3PsCEFXbz5sTap0X8MmZmUtGg6pc/mORDbTSaQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GCJuUkauLRM2GcbENBk8QeV5wo9Syi4kVvBng+6ZZnretD7jUFyjheYRlguHD32uhp+WWwwpXOL9CNDrWqCtQJ4ccPXhhZeXF6x6/pdOhgh5REqIVFazxyY+1nbAOwIiHZncENb7gCSVRMB2FTEQTv4zG848+JA0AuYqojwcb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd33VHZz4f3lVM
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id C8E131A1BD1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:29 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S7;
	Fri, 16 May 2025 16:15:29 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] mm/shmem: remove unneeded xa_is_value() check in shmem_unuse_swap_entries()
Date: Sat, 17 May 2025 01:09:39 +0800
Message-Id: <20250516170939.965736-6-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S7
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWkWrWDtF1kCF18AF1UJrb_yoW3urc_uF
	y8t3WkWrWrZr4xWFnIkFWfWFZYg39Y9rWDZa10yFyayryDtFs5G3ykJrsxAry7uF4qqFs0
	yF1xZrsIkrnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbqAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC
	64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM2
	8EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq
	3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	s3kuDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

As only value entry will be added to fbatch in shmem_find_swap_entries(),
there is no need to do xa_is_value() check in shmem_unuse_swap_entries().

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 07b8e1400c67..4b42419ce6b2 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1446,8 +1446,6 @@ static int shmem_unuse_swap_entries(struct inode *inode,
 	for (i = 0; i < folio_batch_count(fbatch); i++) {
 		struct folio *folio = fbatch->folios[i];
 
-		if (!xa_is_value(folio))
-			continue;
 		error = shmem_swapin_folio(inode, indices[i], &folio, SGP_CACHE,
 					mapping_gfp_mask(mapping), NULL, NULL);
 		if (error == 0) {
-- 
2.30.0

