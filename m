Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA9921CC61
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791867; cv=none; b=fjCEZhWnAeMvmVbufP3gukM1NElbapObweKt6fbRYhg3I1V2/pS0IWtYtuzcXMtzbmGo2JOToTnQ+FyxoEVKzzeTz/0Nl0Yb+aiEA+bzbedsY2W8kezK7SCiZ0XqKiQwAFWArFINuwlav8jryG128mGDWfVTM1u44yFLgPAYoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791867; c=relaxed/simple;
	bh=L9YwAFAD1rWeRtpyAMh7VdF3dVJ3Da3UkVOIXu09S3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hmjK857eNZdwgc+wBepKBgbbLiE3KFkl8lcqvAJ3946YPEikyQXWVBhQeCeJYseCKsxOHnZODUi42wF7OLUr1NWFuKMTBLLLNlYxok+lLcNeMMlyvp/BQbR8Rkf+/kWdZpRviy/ogJEMfHYcsc28Lg77uxKMBr2CMQxzTdpijrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8BxXWssaf9njYm_AA--.55313S3;
	Wed, 16 Apr 2025 16:24:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBxLscmaf9nfZ+FAA--.6358S2;
	Wed, 16 Apr 2025 16:24:07 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
Date: Wed, 16 Apr 2025 16:24:05 +0800
Message-Id: <20250416082405.20988-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLscmaf9nfZ+FAA--.6358S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrW8Aw1ftr1xCr47AF1xtFc_yoW8ur15pF
	WfuF17Ka1rA3W8Cws2yaykuryUZ3yDJF4fGr4UKr1xZwnxGr4Ikr17Gr90vFWUArsxZF1U
	tr45A3y8WFW5Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

__alloc_pages_slowpath has no change detection for ac->nodemask
in the part of retry path, while cpuset can modify it in parallel.
For some processes that set mempolicy as MPOL_BIND, this results
ac->nodemask changes, and then the should_reclaim_retry will
judge based on the latest nodemask and jump to retry, while the
get_page_from_freelist only traverses the zonelist from
ac->preferred_zoneref, which selected by a expired nodemask
and may cause infinite retries in some cases

cpu 64:
__alloc_pages_slowpath {
        /* ..... */
retry:
        /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
        if (alloc_flags & ALLOC_KSWAPD)
                wake_all_kswapds(order, gfp_mask, ac);
        /* cpu 1:
        cpuset_write_resmask
            update_nodemask
                update_nodemasks_hier
                    update_tasks_nodemask
                        mpol_rebind_task
                         mpol_rebind_policy
                          mpol_rebind_nodemask
		// mempolicy->nodes has been modified,
		// which ac->nodemask point to

        */
        /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
        if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
                                 did_some_progress > 0, &no_progress_loops))
                goto retry;
}

Simultaneously starting multiple cpuset01 from LTP can quickly
reproduce this issue on a multi node server when the maximum
memory pressure is reached and the swap is enabled

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 mm/page_alloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fd6b865cb1ab..1e82f5214a42 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	}
 
 retry:
+	/*
+	 * Deal with possible cpuset update races or zonelist updates to avoid
+	 * infinite retries.
+	 */
+	if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
+	    check_retry_zonelist(zonelist_iter_cookie))
+		goto restart;
+
 	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
 	if (alloc_flags & ALLOC_KSWAPD)
 		wake_all_kswapds(order, gfp_mask, ac);
-- 
2.20.1

