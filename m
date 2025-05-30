Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7571EA7C8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595885; cv=none; b=GZsGN48hHRZIk6y6gdnl2KSIWqvK8ieUbpfHINT4gAedHWPj1upibNvyN8hdG4jkBUiqyMiQC/UKMuJKOxs/GfyFVDQmGfPRv0I9S0R3TWvmumuUpjBiVirbWNAfLiGit6pMt1KoEeuFAohT7PQoI0B32x14tCj02tLJs1GlWCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595885; c=relaxed/simple;
	bh=6i4rPvsVO9h/V46TCoPoAC/yg8N1XCm+jf/47OrvZJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fZA6xd7okBsBH76+aznHVjPtSM8EZ2g/WmIJVlxuzeI7F0IL1MEGic2pFCnNVUDS9QpciTeFIwiuBFIKtSVCfLGUQBYyuNLNlgO2AuYKntNf/M0bMcwUL04/5c2g5Xf312XmlEWrkdJxf9n86KTNmKl2/yLKX2YDoDMC0V89170=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CDAC16F2;
	Fri, 30 May 2025 02:04:26 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9ED583F5A1;
	Fri, 30 May 2025 02:04:37 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to change memory permissions
Date: Fri, 30 May 2025 14:34:06 +0530
Message-Id: <20250530090407.19237-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move away from apply_to_page_range(), which does not honour leaf mappings,
to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
if a partial range is detected.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..a5c829c64969 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -8,6 +8,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
+#include <linux/pagewalk.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -20,6 +21,67 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
+static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
+{
+	struct page_change_data *masks = walk->private;
+	unsigned long new_val = val;
+
+	new_val &= ~(pgprot_val(masks->clear_mask));
+	new_val |= (pgprot_val(masks->set_mask));
+
+	return new_val;
+}
+
+static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pud_t val = pudp_get(pud);
+
+	if (pud_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
+			return -EINVAL;
+		val = __pud(set_pageattr_masks(pud_val(val), walk));
+		set_pud(pud, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pmd_t val = pmdp_get(pmd);
+
+	if (pmd_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
+			return -EINVAL;
+		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
+		set_pmd(pmd, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pte_t val = ptep_get(pte);
+
+	val = __pte(set_pageattr_masks(pte_val(val), walk));
+	set_pte(pte, val);
+
+	return 0;
+}
+
+static const struct mm_walk_ops pageattr_ops = {
+	.pud_entry	= pageattr_pud_entry,
+	.pmd_entry	= pageattr_pmd_entry,
+	.pte_entry	= pageattr_pte_entry,
+	.walk_lock	= PGWALK_NOLOCK,
+};
+
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
 
 bool can_set_direct_map(void)
@@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 	return 0;
 }
 
-/*
- * This function assumes that the range is mapped with PAGE_SIZE pages.
- */
 static int __change_memory_common(unsigned long start, unsigned long size,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
-					&data);
+	ret = walk_page_range_novma(&init_mm, start, start + size,
+				    &pageattr_ops, NULL, &data);
 
 	/*
 	 * If the memory is being made valid without changing any other bits
-- 
2.30.2

