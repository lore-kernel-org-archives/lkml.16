Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86029CE6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884723; cv=none; b=hun3I4WmpW46g1YDAYuNssJoCPYpgjMLKKOlz9txx8oIYPdYMv4hKxxb7WTe5MdV+lj5wWOIbbJgr+R9gz9ikhuM7GXSY8A1TJcMqbhHj9WXSNIZoMaz76f4wkMmr1TJpo2DTH4hcuH0OxYr5atrlQlKyNMHntlitAuUUMVDMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884723; c=relaxed/simple;
	bh=GN/kUFy6K+y0laQvIiBkdHLe0f4CGM17LFJkH3gaHVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5N+dx/JAoQbLTaYHlZVZGIgHgaeRXoHG8n2diwOThAdD6yQZGc3oZ8wMj8gAnXppps5L/P6M9y8Kuwflh/Rz6XE9byEudfAfvQ76INpF2iQyBOonh+e5FvgvZQ+pGwMQ1wCm8tjyUkSP/dC2+xKeVBuYMw1mfMCX+MhurRq9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b2v392r81z4f3jtt
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 49F541A0C5A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgC3Z3immi5okKq2Mw--.19487S6;
	Thu, 22 May 2025 11:31:53 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	bhe@redhat.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] mm: swap: remove stale comment stale comment in cluster_alloc_swap_entry()
Date: Thu, 22 May 2025 20:25:54 +0800
Message-Id: <20250522122554.12209-5-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:cCh0CgC3Z3immi5okKq2Mw--.19487S6
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWxZF4kuFyDGryrKF4UJwb_yoW3KFb_Xa
	9rt3s7Kr45Jan7ur13J3W5Xry8W39avryYkFyfGFyak34jqF4UXas293sxJryxXayUZa4f
	Xa1Ivr1fXa9xJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbBkYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl82
	xGYIkIc2x26280x7IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC
	64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM2
	8EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq
	3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jag4hUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

As cluster_next_cpu was already dropped, the associated comment is stale
now.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/swapfile.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 63ab9f14b2c6..8525515fb06c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -956,9 +956,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 	}
 
 	/*
-	 * We don't have free cluster but have some clusters in
-	 * discarding, do discard now and reclaim them, then
-	 * reread cluster_next_cpu since we dropped si->lock
+	 * We don't have free cluster but have some clusters in discarding,
+	 * do discard now and reclaim them.
 	 */
 	if ((si->flags & SWP_PAGE_DISCARD) && swap_do_scheduled_discard(si))
 		goto new_cluster;
-- 
2.30.0

