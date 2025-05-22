Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489961CD3F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884718; cv=none; b=hQQmCnkb80XqSdJwOjCfAquEAlrSfP5gReYKH5MCV1hxuYdKxlVgC/xqTZs3V9U6h+JB3fVE2qNQHH3WYv15Awe88CVMWyUQNcp93Z35Yod9BaugEx/+eEnjJJuCL+nP7sA3yRD68Gz67QYSWFTY9wH4s6bG1PL5F6RLgcZDAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884718; c=relaxed/simple;
	bh=Y9WGMDgnP5lMq8/+xnP0XjGa3hgR5I6bTsVNoi7uQBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fyOW8DA8+F9q0rjhu7BFZogMyy5pKYQBHfbNgdf6cUxj+SN8DvI1j/aDz6OEIKLabZoXaE1rNjIqL5ixjzH8DUjD1o6Pf8WLYgLmawCZgEj/+wPC8Nlclg/uOjsINQX0NereWP22/x+9REWKlMYUr+zxWkYWUveADFh6c4M7fZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4b2v3Y5JKHzKHMmw
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 424011A08FC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:52 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgC3Z3immi5okKq2Mw--.19487S3;
	Thu, 22 May 2025 11:31:52 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	bhe@redhat.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] mm: swap: move nr_swap_pages counter decrement from folio_alloc_swap() to swap_range_alloc()
Date: Thu, 22 May 2025 20:25:51 +0800
Message-Id: <20250522122554.12209-2-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250522122554.12209-1-shikemeng@huaweicloud.com>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgC3Z3immi5okKq2Mw--.19487S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr15uF1DGF4kCF1kWFWDCFg_yoW8JF4kpF
	Z8Wr1qkr4kXryxKFyava1DGry7A39a9FWfGF47Ww13Z3WfJrnFga4IkayUZry5Cr1vyaya
	grWDtFy3CFyjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmlb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUVF1vDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

When folio_alloc_swap() encounters a failure in either
mem_cgroup_try_charge_swap() or add_to_swap_cache(), nr_swap_pages counter
is not decremented for allocated entry. However, the following
put_swap_folio() will increase nr_swap_pages counter unpairly and lead to
an imbalance.

Move nr_swap_pages decrement from folio_alloc_swap() to swap_range_alloc()
to pair the nr_swap_pages counting.

Fixes: 0ff67f990bd45 ("mm, swap: remove swap slot cache")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 026090bf3efe..75b69213c2e7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1115,6 +1115,7 @@ static void swap_range_alloc(struct swap_info_struct *si,
 		if (vm_swap_full())
 			schedule_work(&si->reclaim_work);
 	}
+	atomic_long_sub(nr_entries, &nr_swap_pages);
 }
 
 static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
@@ -1313,7 +1314,6 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL))
 		goto out_free;
 
-	atomic_long_sub(size, &nr_swap_pages);
 	return 0;
 
 out_free:
-- 
2.30.0

