Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B391C6B4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524428; cv=none; b=NpM/sqUDfFmfdXX6W6rYVxabfxbCvssfBWv07+yttLtIzRdFwAdSKR8qozaPIeHWPuiUINv8rzYcCTmMsaruyPU/p0Uw49nHGCk1OPjmtRx45Zd25MA0XZ5btoDz1shIqbl6bFXbB2pK9Itzel2qeFAKiTuzLgnKEJZS2DZIk2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524428; c=relaxed/simple;
	bh=FXbLs1uze1AJBqr3Wqv5z8XbY2DkF01xHsrNCsmsgaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dlyx0YPMYvGBpw0GcHdoqJL4L6zNxmJzV+hVvDiYrkdcvFEqJh34mjY/9hSaVQY3nVNiA2yUFjl7aKODKtK6ercDcIBHJVVJEHhTJFBJCnFB1HHbNHenYEYRE9ARrbP6kqCO3UAh57tmWiUYp+MfjswrgQviqPf2xd07G3gTt08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F8E150C;
	Wed,  2 Jul 2025 23:33:31 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29CDE3F58B;
	Wed,  2 Jul 2025 23:33:42 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com
Cc: richard.weiyang@gmail.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] maple tree: Add some comments
Date: Thu,  3 Jul 2025 12:03:38 +0530
Message-Id: <20250703063338.51509-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments explaining the fields for maple_metadata, since "end" is
ambiguous and "gap" can be confused as the largest gap, whereas it
is actually the offset of the largest gap.

Add comment for mas_ascend() to explain, whose min and max we are
trying to find. Explain that, for example, if we are already on offset
zero, then the parent min is mas->min, otherwise we need to walk up
to find the implied pivot min.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---

v1->v2:
 - Drop MAPLE_ROOT_NODE comment modification

v1:
 - https://lore.kernel.org/all/20250626171918.17261-2-dev.jain@arm.com/

 include/linux/maple_tree.h | 4 ++--
 lib/maple_tree.c           | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 9ef129038224..bafe143b1f78 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -75,8 +75,8 @@
  * searching for gaps or any other code that needs to find the end of the data.
  */
 struct maple_metadata {
-	unsigned char end;
-	unsigned char gap;
+	unsigned char end;	/* end of data */
+	unsigned char gap;	/* offset of largest gap */
 };
 
 /*
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 0e85e92c5375..b4ee2d29d7a9 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -1053,7 +1053,7 @@ static inline void mte_set_gap(const struct maple_enode *mn,
  * mas_ascend() - Walk up a level of the tree.
  * @mas: The maple state
  *
- * Sets the @mas->max and @mas->min to the correct values when walking up.  This
+ * Sets the @mas->max and @mas->min for the parent node of mas->node.  This
  * may cause several levels of walking up to find the correct min and max.
  * May find a dead node which will cause a premature return.
  * Return: 1 on dead node, 0 otherwise
@@ -1098,6 +1098,12 @@ static int mas_ascend(struct ma_state *mas)
 
 	min = 0;
 	max = ULONG_MAX;
+
+	/*
+	 * !mas->offset implies that parent node min == mas->min.
+	 * mas->offset > 0 implies that we need to walk up to find the
+	 * implied pivot min.
+	 */
 	if (!mas->offset) {
 		min = mas->min;
 		set_min = true;
-- 
2.30.2

