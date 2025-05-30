Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33291EA7C8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595890; cv=none; b=F6Ydh1Vuss7g6UQqzqmhEFLNOgvcviuu49B8V84eCI3u4aUCDhkNuloDgMLsQRict9WlafcdNKUSvNn2OB6Fea6ngj1z6/wBg37aCzeV711OUmFvBiWXJxKTRHu2MiXboxLA1XuW49DKOnE8pyazxZ5jjzpIYkxfrypVE85mVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595890; c=relaxed/simple;
	bh=WgIs+0mJhsMumzatCo5VihW3PL80BvxaPeuR0E/W8JE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ndYJ9jrvooKxJ4Yp4v2dhqla+LvHInliFeoDRQZsh1MqvonZ2O9RZ+CeW33s3Rsw8pncmHYqcIuB+g5UTiieuxtyi0AG1m+kCK8vOhNJLP5o5/1F5+4gM/lgdy+8ZYZHAlCRNTRhBiXDOBkB2YeBIgYtf1oikIkHbDKZ1sWYVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC9516F2;
	Fri, 30 May 2025 02:04:31 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A0CF3F5A1;
	Fri, 30 May 2025 02:04:43 -0700 (PDT)
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
Subject: [PATCH 3/3] mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
Date: Fri, 30 May 2025 14:34:07 +0530
Message-Id: <20250530090407.19237-4-dev.jain@arm.com>
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

arm64 implements lazy_mmu_mode to allow deferral and batching of barriers
when updating kernel PTEs, which provides a nice performance boost. arm64
currently uses apply_to_page_range() to modify kernel PTE permissions,
which runs inside lazy_mmu_mode. So to prevent a performance regression,
let's add hooks to walk_page_range_novma() to allow continued use of
lazy_mmu_mode.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Credits to Ryan for the patch description.

 arch/arm64/mm/pageattr.c | 12 ++++++++++++
 include/linux/pagewalk.h |  2 ++
 mm/pagewalk.c            |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index a5c829c64969..9163324b12a0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -75,11 +75,23 @@ static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+static void pte_lazy_mmu_enter(void)
+{
+	arch_enter_lazy_mmu_mode();
+}
+
+static void pte_lazy_mmu_leave(void)
+{
+	arch_leave_lazy_mmu_mode();
+}
+
 static const struct mm_walk_ops pageattr_ops = {
 	.pud_entry	= pageattr_pud_entry,
 	.pmd_entry	= pageattr_pmd_entry,
 	.pte_entry	= pageattr_pte_entry,
 	.walk_lock	= PGWALK_NOLOCK,
+	.pre_pte_table	= pte_lazy_mmu_enter,
+	.post_pte_table	= pte_lazy_mmu_leave,
 };
 
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9bc8853ed3de..2157d345974c 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -88,6 +88,8 @@ struct mm_walk_ops {
 	int (*pre_vma)(unsigned long start, unsigned long end,
 		       struct mm_walk *walk);
 	void (*post_vma)(struct mm_walk *walk);
+	void (*pre_pte_table)(void);
+	void (*post_pte_table)(void);
 	int (*install_pte)(unsigned long addr, unsigned long next,
 			   pte_t *ptep, struct mm_walk *walk);
 	enum page_walk_lock walk_lock;
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 9657cf4664b2..a441f5cbbc45 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -33,6 +33,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
 	const struct mm_walk_ops *ops = walk->ops;
 	int err = 0;
 
+	if (walk->ops->pre_pte_table)
+		walk->ops->pre_pte_table();
+
 	for (;;) {
 		if (ops->install_pte && pte_none(ptep_get(pte))) {
 			pte_t new_pte;
@@ -56,6 +59,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
 		addr += PAGE_SIZE;
 		pte++;
 	}
+
+	if (walk->ops->post_pte_table)
+		walk->ops->post_pte_table();
 	return err;
 }
 
-- 
2.30.2

