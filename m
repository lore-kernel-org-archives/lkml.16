Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9620B815
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103351; cv=none; b=obAyOzNKlKCxoksGxC5KWNofC1c+TlDHr0z4yE2Fix1EXMC0LRlUXD5UYELmz3NVn0aNNo4N84kkfh+BF06l7PRL1ZblqTfkJH80QMtAJELwq/kYcNmuXHEot1/uwZLCwWgVO2mf6UHS1XSc19Mo4ATgD3DQpVEnWO6/ic0zx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103351; c=relaxed/simple;
	bh=pGUxmxORgkw2eWqQ+fsCI9H46C+s3XZ5yiRNo9nxgHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UX2NM6NDW13K7p0EYvdf1/zJMwIKK8mwubSLSd4FCraqBdBQgyAvZqTiL4z+7XnTUTxHq7Q0iKbN4Urg/1GEEG1BPkf8GFoc2B0HY1X7tY6DogRUu/xCsvrhhH9Msn9sDJqWqmBdFOPMTmu/IRJCjGmvylVH538X7Lf9y8N3+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZX0XG56XlzvWt6;
	Tue,  8 Apr 2025 17:05:02 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 385AE180104;
	Tue,  8 Apr 2025 17:09:05 +0800 (CST)
Received: from huawei.com (10.175.124.71) by kwepemg100017.china.huawei.com
 (7.202.181.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 8 Apr
 2025 17:09:03 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ryan.roberts@arm.com>,
	<anshuman.khandual@arm.com>, <akpm@linux-foundation.org>
CC: <peterx@redhat.com>, <joey.gouly@arm.com>, <yangyicong@hisilicon.com>,
	<ioworker0@gmail.com>, <baohua@kernel.org>, <jack@suse.cz>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Wupeng Ma <mawupeng1@huawei.com>
Subject: [PATCH] arm64: dax: add devmap check for pmd_trans_huge
Date: Tue, 8 Apr 2025 16:59:14 +0800
Message-ID: <20250408085914.1946183-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg100017.china.huawei.com (7.202.181.58)

During our test in ext4 dax linux-v5.10 on arm64. A BUG_ON is trigger in
follow_invalidate_pte as follow since this pmd is seem as pmd_trans_huge.
However this page is really a dax-pmds rather than a pmd trans huge.

Call trace is shown as follow:

  ------------[ cut here ]------------
  kernel BUG at mm/memory.c:5185!
  CPU: 0 PID: 150 Comm: kworker/u8:10 Not tainted 5.10.0-01678-g1e62aad66bbc-dirty #36
  pc : follow_invalidate_pte+0xdc/0x5e0
  lr : follow_invalidate_pte+0xc4/0x5e0
  sp : ffffa00012997110
  Call trace:
   follow_invalidate_pte+0xdc/0x5e0
   dax_entry_mkclean+0x250/0x870
   dax_writeback_one+0xac/0x380
   dax_writeback_mapping_range+0x22c/0x704
   ext4_dax_writepages+0x234/0x6e4
   do_writepages+0xc8/0x1c0
   __writeback_single_inode+0xb8/0x560
   writeback_sb_inodes+0x344/0x7a0
   wb_writeback+0x1f8/0x6b0
   wb_do_writeback+0x194/0x3cc
   wb_workfn+0x14c/0x590
   process_one_work+0x470/0xa30
   worker_thread+0xac/0x510
   kthread+0x1e0/0x220
   ret_from_fork+0x10/0x18
  ---[ end trace 0f479050bd4b1818 ]---
  Kernel panic - not syncing: Oops - BUG: Fatal exception
  ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception ]---

Commit 5c7fb56e5e3f ("mm, dax: dax-pmd vs thp-pmd vs hugetlbfs-pmd") and
commit 36b78402d97a ("powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when
setting up huge devmap PTE entries") already check pmd_devmap during
checking pmd_trans_huge. Since pmd_devmap() is used to distinguish dax-pmds,
add the same check for arm64 to fix this problem.

Add PTE_DEVMAP in pte_modify as commit 4628a64591e6 ("mm: Preserve
_PAGE_DEVMAP across mprotect() calls") does to avoid the same issue in
mprotect.

Fixes: 73b20c84d42d ("arm64: mm: implement pte_devmap support")
Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500b..b9a618127c01b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -740,7 +740,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 * as a table, so force the valid bit for the comparison.
 	 */
 	return pmd_val(pmd) && pmd_present(pmd) &&
-	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID)) && !pmd_devmap(pmd);
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
@@ -1186,7 +1186,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	 */
 	const pteval_t mask = PTE_USER | PTE_PXN | PTE_UXN | PTE_RDONLY |
 			      PTE_PRESENT_INVALID | PTE_VALID | PTE_WRITE |
-			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK;
+			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK |
+			      PTE_DEVMAP;
 
 	/* preserve the hardware dirty information */
 	if (pte_hw_dirty(pte))
-- 
2.43.0

