Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85051E008B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958370; cv=none; b=IoNVPwPX2lCro3FZsWWjqObVuFpFDS0ujat91YjxsNN5g8x6thQB6rPZGA7fxzDPzVlpt+vFHrlU7Id+6hb0YOuUVsVBgmm2WudueTa0iqXDWU77Bgi5to9CFJDxt4VEuqvc2je8LgYx5UnR5wkpaN0Gzf2pc1KgQAhwUOChnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958370; c=relaxed/simple;
	bh=FAWdpHh66YPBy3TNpTouNHaXnCuZ/8+AOfEefVhG8+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JTAiOPaZkL/E5AalIYyIVkmALUc5uTJl8N7S3PTGNnnRcrlKuCJjSLTxngNSJoKauKbn4jLBnubqtEGInGBASe/PN86anYmfVdxivQSrwKZ9q4B8qVIPvCxPaNIm5parDvrraNb8KYrF8Z4ID7FvV7SZzbCnL1C1oOd5+S/1ZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5328D1758;
	Thu, 26 Jun 2025 10:19:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.88.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D5063F762;
	Thu, 26 Jun 2025 10:19:24 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com
Cc: richard.weiyang@gmail.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 1/2] maple tree: Clean up mtree_range_walk()
Date: Thu, 26 Jun 2025 22:49:17 +0530
Message-Id: <20250626171918.17261-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The special casing for offset == 0 is being done because min will stay
mas->min in this case. So refactor the code to use the while loop for
setting the max and getting the corresponding offset, and only set the
min for offset > 0.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 lib/maple_tree.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 0e85e92c5375..6c89e6790fb5 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2770,13 +2770,8 @@ static inline void *mtree_range_walk(struct ma_state *mas)
 		end = ma_data_end(node, type, pivots, max);
 		prev_min = min;
 		prev_max = max;
-		if (pivots[0] >= mas->index) {
-			offset = 0;
-			max = pivots[0];
-			goto next;
-		}
 
-		offset = 1;
+		offset = 0;
 		while (offset < end) {
 			if (pivots[offset] >= mas->index) {
 				max = pivots[offset];
@@ -2784,9 +2779,9 @@ static inline void *mtree_range_walk(struct ma_state *mas)
 			}
 			offset++;
 		}
+		if (likely(offset))
+			min = pivots[offset - 1] + 1;
 
-		min = pivots[offset - 1] + 1;
-next:
 		slots = ma_slots(node, type);
 		next = mt_slot(mas->tree, slots, offset);
 		if (unlikely(ma_dead_node(node)))
-- 
2.30.2

