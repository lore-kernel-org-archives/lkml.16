Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F72322A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 04:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751601885; cv=none; b=bwScJmv4KqlTgQrUMEo/J7SNFHCllWn3bTfmIbcJ0rtkBagW4UczaZe131wuj1yVfenJ2NrywscnjnfuvjQJyc/ZOYaZQbgfRVrsxcYm+zILm6MiA4NGfJMboQyIiYqDuu75U5WLJ+RmxR7KVkKgZvcEDqh/r3p0/ZRCRhWkpPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751601885; c=relaxed/simple;
	bh=JIwpoWs6B4tkjSLOeNgHVNonoL4wlWuShoXKATDQuZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=De2MmyrYz2CdtVUFfjWfwAJzw73utyX/XuYaCbAwtJ/2LCpQZe0Jnc4dNHpWS/iyKw55//PbVIPxEq8fYYSYt2Z2ZxN8HfqiAQMZQUfQJ2T28hfWPR5vRYQFgTyO5IG6hE7165OF2+3uhj1w4jgekjzWwR5c0IUwqJl8anIfODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA334152B;
	Thu,  3 Jul 2025 21:04:27 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A013C3F63F;
	Thu,  3 Jul 2025 21:04:37 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH v3] khugepaged: Reduce race probability between migration and khugepaged
Date: Fri,  4 Jul 2025 09:34:17 +0530
Message-Id: <20250704040417.63826-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suppose a folio is under migration, and khugepaged is also trying to
collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
page cache via filemap_lock_folio(), thus taking a reference on the folio
and sleeping on the folio lock, since the lock is held by the migration
path. Migration will then fail in
__folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
such a race happening (leading to migration failure) by bailing out
if we detect a PMD is marked with a migration entry.

This fixes the migration-shared-anon-thp testcase failure on Apple M3.

Note that, this is not a "fix" since it only reduces the chance of
interference of khugepaged with migration, wherein both the kernel
functionalities are deemed "best-effort".

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---

v2->v3:
 - Improve comment (David)

v1->v2:
 - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, Anshuman)
 - Add a comment (Lorenzo)

v1:
 - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/

 mm/khugepaged.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1aa7ca67c756..a55fb1dcd224 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -941,6 +941,14 @@ static inline int check_pmd_state(pmd_t *pmd)
 
 	if (pmd_none(pmde))
 		return SCAN_PMD_NONE;
+
+	/*
+	 * The folio may be under migration when khugepaged is trying to
+	 * collapse it. Migration success or failure will eventually end
+	 * up with a present PMD mapping a folio again.
+	 */
+	if (is_pmd_migration_entry(pmde))
+		return SCAN_PMD_MAPPED;
 	if (!pmd_present(pmde))
 		return SCAN_PMD_NULL;
 	if (pmd_trans_huge(pmde))
-- 
2.30.2

