Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FFA277CBE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521728; cv=none; b=gh4BHEhKwpc4MHNXefKqLyVydl6wcr7/5oLnOSTd4Kbnq3Vh8UCyOz2QynWrYwFj+vHJEA+nehQVOvJGe1t/mLTExNjWMBN85R4AacZ8ZzFwiTgAWohRTbBUfDkjXYWJcFqDYjsxN9ZE2G+KJZc83rRl1wCLEglQu2Kxi8D/Yv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521728; c=relaxed/simple;
	bh=1CihokVy0ACbmF+4tMWUxue7bEjcWwcGPIC27E7yx7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UZe6bOr1FpdbY/rTdk0yXZtRfxm5PcS02QZfptvg6r0s7tqDUNPRO2Dehzwy0FF92TpYWhQWTzZBOj7AeBv4zddhmcJRQ5RHZDlhi8NYHilJXiql3TN/h4XWdPweV1HlsKzo/U7PP8NsFQfcHKV1573OwNTpZ0LlueLIf2r9XKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4241655;
	Wed,  2 Jul 2025 22:48:30 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38C6B3F6A8;
	Wed,  2 Jul 2025 22:48:40 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] khugepaged: Reduce race probability between migration and khugepaged
Date: Thu,  3 Jul 2025 11:18:23 +0530
Message-Id: <20250703054823.49149-1-dev.jain@arm.com>
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

Signed-off-by: Dev Jain <dev.jain@arm.com>
---

v1->v2:
 - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, Anshuman)
 - Add a comment (Lorenzo)

v1:
 - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/

 mm/khugepaged.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1aa7ca67c756..3fdefc4f4984 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -941,6 +941,15 @@ static inline int check_pmd_state(pmd_t *pmd)
 
 	if (pmd_none(pmde))
 		return SCAN_PMD_NONE;
+
+	/*
+	 * The folio may be under migration when khugepaged is trying to
+	 * collapse it. Migration success or failure will eventually end
+	 * up with the PMD still pointing to a PMD-order folio, so return
+	 * SCAN_PMD_MAPPED.
+	 */
+	if (is_pmd_migration_entry(pmde))
+		return SCAN_PMD_MAPPED;
 	if (!pmd_present(pmde))
 		return SCAN_PMD_NULL;
 	if (pmd_trans_huge(pmde))
-- 
2.30.2

