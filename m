Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F88620C485
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620204; cv=none; b=Khl7nQujtfZ/buY/xy4MhfeJj4D3lwpd4fi6xg22S7326Xn434dAOz9bXxaGwjWffMNKl/UB91abx4g11O2xB3o3C+xLcdjhuXf18n1802lbzdsWHoKnXJd+P7vvJB8hLYSTM+xUOUwjNx4sZNaqq1q40s7lAw322YNnSMVKXY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620204; c=relaxed/simple;
	bh=5RwXiP9db3ZiMTTmqPZMvskn3c84oxlF0u3TQMV3CdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm1upBNcM2oB8Ck56WI+ETC3YiGvrnTdbmkTLqRkV5oRbTJ+fkn52x569d0+TUVb6wTjNFPbhsvm6tENt6qD7Zw2Qwi38lwKq0WyYjjkKosPAS5pN38J2aajlYe77uCbAPcGgH4cJe9ec2dIBCQeOBcJHhadoRMaNU6a8/9xqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 092a3808468611f0b29709d653e92f7d-20250611
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4f519acc-bb8a-436a-83e6-1b7c8d1a8648,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:4f519acc-bb8a-436a-83e6-1b7c8d1a8648,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:dd49578951bb38abcaeae2c14f3778fd,BulkI
	D:250611133637X39LCBZ6,BulkQuantity:0,Recheck:0,SF:17|19|25|38|45|66|78|81
	|82|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 092a3808468611f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 227271751; Wed, 11 Jun 2025 13:36:34 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: George Guo <guodongtai@kylinos.cn>,
	Chenghao Duan <duanchenghao@kylinos.cn>
Subject: [PATCH v1 1/5] LoongArch: Support fixmap
Date: Wed, 11 Jun 2025 13:36:21 +0800
Message-Id: <20250611053625.352091-2-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611053625.352091-1-duanchenghao@kylinos.cn>
References: <20250611035952.111182-3-duanchenghao@kylinos.cn>
 <20250611053625.352091-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

Support fixmap for Loongarch.

In the functions patch_map and patch_unmap, __set_fixmap are used.
Therefore, remove the __init identifier from these functions.

Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/fixmap.h |   2 +
 arch/loongarch/kernel/setup.c       |   1 +
 arch/loongarch/mm/init.c            | 111 ++++++++++++++++++++++++++--
 3 files changed, 108 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include/asm/fixmap.h
index d2e55ae55..b579ad2be 100644
--- a/arch/loongarch/include/asm/fixmap.h
+++ b/arch/loongarch/include/asm/fixmap.h
@@ -13,6 +13,7 @@
 enum fixed_addresses {
 	FIX_HOLE,
 	FIX_EARLYCON_MEM_BASE,
+	FIX_TEXT_POKE0,
 	__end_of_fixed_addresses
 };
 
@@ -20,6 +21,7 @@ enum fixed_addresses {
 #define FIXADDR_START	(FIXADDR_TOP - FIXADDR_SIZE)
 #define FIXMAP_PAGE_IO	PAGE_KERNEL_SUC
 
+void __init early_fixmap_init(void);
 extern void __set_fixmap(enum fixed_addresses idx,
 			 phys_addr_t phys, pgprot_t flags);
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 56934fe58..368786952 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -597,6 +597,7 @@ void __init setup_arch(char **cmdline_p)
 	memblock_init();
 	pagetable_init();
 	bootcmdline_init(cmdline_p);
+	early_fixmap_init();
 	parse_early_param();
 	reserve_initrd_mem();
 
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 188b52bbb..68abb7bad 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -36,6 +36,109 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
+#define SPAN_NR_ENTRIES(vstart, vend, shift) \
+	((((vend) - 1) >> (shift)) - ((vstart) >> (shift)) + 1)
+
+#define NR_BM_PTE_TABLES \
+	SPAN_NR_ENTRIES(FIXADDR_START, FIXADDR_TOP, PMD_SHIFT)
+#define NR_BM_PMD_TABLES \
+	SPAN_NR_ENTRIES(FIXADDR_START, FIXADDR_TOP, PUD_SHIFT)
+
+static_assert(NR_BM_PMD_TABLES == 1);
+
+#define __BM_TABLE_IDX(addr, shift) \
+	(((addr) >> (shift)) - (FIXADDR_START >> (shift)))
+
+#define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
+
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+
+static inline pte_t *fixmap_pte(unsigned long addr)
+{
+	return &bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
+}
+
+static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
+{
+	pmd_t pmd = READ_ONCE(*pmdp);
+	pte_t *ptep;
+
+	if (!pmd_present(pmd)) {
+		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];
+		pmd_populate_kernel(&init_mm, pmdp, ptep);
+		kernel_pte_init(ptep);
+	}
+}
+
+static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
+					 unsigned long end)
+{
+	unsigned long next;
+	pud_t pud = READ_ONCE(*pudp);
+	pmd_t *pmdp;
+
+	if (pud_none(pud))
+		pud_populate(&init_mm, pudp, bm_pmd);
+
+	pmdp = pmd_offset(pudp, addr);
+
+#ifndef __PAGETABLE_PMD_FOLDED
+	pmd_init(pmdp);
+#endif
+	do {
+		next = pmd_addr_end(addr, end);
+		early_fixmap_init_pte(pmdp, addr);
+	} while (pmdp++, addr = next, addr != end);
+}
+
+static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
+					 unsigned long end)
+{
+	p4d_t p4d = READ_ONCE(*p4dp);
+	pud_t *pudp;
+
+#ifndef __PAGETABLE_PUD_FOLDED
+	if (CONFIG_PGTABLE_LEVELS > 3 && !p4d_none(p4d) &&
+	    p4d_phys(p4d) != __pa_symbol(bm_pud)) {
+		/*
+		 * We only end up here if the kernel mapping and the fixmap
+		 * share the top level pgd entry, which should only happen on
+		 * 16k/4 levels configurations.
+		 */
+		BUG_ON(!IS_ENABLED(CONFIG_PAGE_SIZE_16KB));
+	}
+#endif
+
+	if (p4d_none(p4d))
+		p4d_populate(&init_mm, p4dp, bm_pud);
+
+	pudp = pud_offset(p4dp, addr);
+
+#ifndef __PAGETABLE_PUD_FOLDED
+	pud_init(pudp);
+#endif
+	early_fixmap_init_pmd(pudp, addr, end);
+}
+
+/*
+ * The p*d_populate functions call virt_to_phys implicitly so they can't be used
+ * directly on kernel symbols (bm_p*d). This function is called too early to use
+ * lm_alias so __p*d_populate functions must be used to populate with the
+ * physical address from __pa_symbol.
+ */
+void __init early_fixmap_init(void)
+{
+	unsigned long addr = FIXADDR_START;
+	unsigned long end = FIXADDR_TOP;
+
+	pgd_t *pgdp = pgd_offset_k(addr);
+	p4d_t *p4dp = p4d_offset(pgdp, addr);
+
+	early_fixmap_init_pud(p4dp, addr, end);
+}
+
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
@@ -209,7 +312,7 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
 	return pte_offset_kernel(pmd, addr);
 }
 
-void __init __set_fixmap(enum fixed_addresses idx,
+void __set_fixmap(enum fixed_addresses idx,
 			       phys_addr_t phys, pgprot_t flags)
 {
 	unsigned long addr = __fix_to_virt(idx);
@@ -217,11 +320,7 @@ void __init __set_fixmap(enum fixed_addresses idx,
 
 	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
 
-	ptep = populate_kernel_pte(addr);
-	if (!pte_none(ptep_get(ptep))) {
-		pte_ERROR(*ptep);
-		return;
-	}
+	ptep = fixmap_pte(addr);
 
 	if (pgprot_val(flags))
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
-- 
2.25.1

