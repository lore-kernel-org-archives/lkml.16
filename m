Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926F1DFE8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267447; cv=none; b=bE56TA41Ig7ixcAsojtqVFBq3d6KyFCaQDc+kR7btBVCU4OAcbcsjuML/eE2Otf0rJN8tgm6u6LSm+OsykMn2vYYPhVDFHSt4IF0lJpDHcET8UiGI0GkqUWudT80+3vh2GFfrMIK9bugWbkWnD1wsidF/W9dg1QzCqHIs3oEitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267447; c=relaxed/simple;
	bh=wbzkXPD/R+tgnsKwTEsbJMaPcAYrERCAQ4MoG45enLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SlmKK4b/SkDhoSAF3con6QuKGGAn2D0/kvhg8z8gZls2KiPKbTax27AFOqmToQcDX2w5j6boZed/i7k3YDyu//qexraPRVOEa65KrFC/JnRgTcNo7+YFlnQRExtFBYg79YEEthr3raKeLjgFrT97L0+DiJ8bFEg+mpEcz2jOXlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZY9J91DhXz4f3jXm
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:43:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id A3F671A058E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:44:00 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP4 (Coremail) with SMTP id gCh0CgCnCV6vaPdnHe0uJA--.32790S2;
	Thu, 10 Apr 2025 14:44:00 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: bhe@redhat.com,
	sj@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [patch] mm: swap: add __maybe_unused attribute for swap_is_last_ref() and update it's comment
Date: Thu, 10 Apr 2025 23:39:08 +0800
Message-Id: <20250410153908.612984-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCnCV6vaPdnHe0uJA--.32790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1Utw4DZFy3AF4fGrW7Jwb_yoW8CrWfpF
	Z5Was8KFWxJry7ta9rZ3ZIyryFg3yfK34UZFyDK34fZ3ZxX3yS9Fyv93y5KFyUAr92vFyj
	vFsFgw17GF4jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E
	3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0E
	n4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0A9N3UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Add __maybe_unused attribute for swap_is_last_ref ()to fix following
building warning:
mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
    1517 | static inline bool swap_is_last_ref(unsigned char count)
         |                    ^~~~~~~~~~~~~~~~
   1 warning generated.

Besides, original comment for swap_entries_free() is placed before
swap_is_last_ref() which may introduce confusion. Update comment to
address this.

Fixes: 6bb001b6b64ec ("mm: swap: enable swap_entry_range_free() to drop any kind of last ref")
Suggested-by: Baoquan He <bhe@redhat.com>
Tested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/swapfile.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c46b56d636af..4b5fc0c33a85 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1537,15 +1537,19 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
 }
 
 /*
- * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
- * caller have to ensure all entries belong to the same cgroup and cluster.
+ * Check if it's the last ref of swap entry in the freeing path.
+ * Qualified vlaue includes 1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM.
  */
-static inline bool swap_is_last_ref(unsigned char count)
+static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
 {
 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
 	       (count == SWAP_MAP_SHMEM);
 }
 
+/*
+ * Drop the last ref of swap entries, caller have to ensure all entries
+ * belong to the same cgroup and cluster.
+ */
 static void swap_entries_free(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
 			      swp_entry_t entry, unsigned int nr_pages)
-- 
2.30.0

