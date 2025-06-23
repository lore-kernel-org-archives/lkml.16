Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8E28AB16
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704234; cv=none; b=vD3b5XCOcudurnP65xTT/TilYRJnHIfbY0i2UDYrJkC6UJbnGyWfK2gbo5AokrW/y08S9YWjOsohkDqyiGK8qXYogcHwHyNwGor8rhOgf1C29ISzjOQMl89Mz6+V71rNEYReZcfnlspfIa7MXYpKpvX4SfgmHwqhrh6dd9+8wds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704234; c=relaxed/simple;
	bh=Wlx/vhZkFnw8a03c+Dl8Ovf4E6nEfBgYdtYv7P3rpVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxkGUrRlcnijICAVE1+eYHYsfIuTswry3nJmAyeb/RvhxAYtSmdco9BQKaFYLEa6UveuFEjC7sGtkA+UVhh9o3tfJi/YA1Br5YLhKzeSw6yQMtweEoPd1dr1gOuy3iVLfwDwOVEq4+sKBgYTWCRR6WJXRIM7jtZNeboytowz8H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WgDbFxLN; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WgDbFxLN"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NH6iDi012677;
	Mon, 23 Jun 2025 18:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=S473X9Y+ghCYVJfau
	Eqa5p6W8rSutZi8Znt3hkWfLMs=; b=WgDbFxLNEmEsR6dg81lmJ1fy1LIj79uKb
	+WSps1n6/Ie8zGwHdp29VyVrx+5Q3tZQ8oNzV2A2iYA1wuG4LrcDPkqpc2qpFoQh
	G2Mu4rKEJwvkv/H9gD7fbBe1YeiWhb56GQz60CdSxCrwz8lkqAMFCtkaH/HXzfSW
	TdLZK5kB95cgJddq0VPURGT4SrUeHY7ty+OpAnwrGY9VVPnHe+BOdbTid6wpkPzX
	/bff0nuHsDcYoZbmjFjNga+x7hVcLoGlgDGdI3QMsVQPh9Nmf1zTgb+0FuA0oOUX
	oLhBjhHVU+hgK6h3QDdvMhfPRCCPBxnJdmeIMZ1dYUmPLdQroPB9Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tm5mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 18:43:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55NH8Vhg031277;
	Mon, 23 Jun 2025 18:43:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7eyrb76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 18:43:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55NIhb0k13566236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 18:43:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0969220043;
	Mon, 23 Jun 2025 18:43:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE77120040;
	Mon, 23 Jun 2025 18:43:36 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 18:43:36 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Subject: [RFC PATCH 1/1] mm/debug_vm_pgtable: Use a swp_entry_t input value for swap tests
Date: Mon, 23 Jun 2025 20:43:21 +0200
Message-ID: <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9q4zn-EHraalKmcrE-a4FfMd3A3wfL6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDExNSBTYWx0ZWRfX5C960XE696TI kPnUVNt6WE92bk4aF/81diAJP6DewyLRIbNBDj/tqEgB/9uXJfSE+mFIq9CPv/AOhnH+rgljdRW xEyWBOKnm5bebJMDR57zX3hc/pilZ2T0XNffcZs3cncIXrWgqQy39aom7L0kKL/1geO892cSMPY
 75YR8FHmr6KaYHtRwd1EU3Ki9RDeqMENm92uQmNfE9qx4866gYgNsUVVmhcRBMK33rkw+rR/aBR SCdT7VRM78OUnK/8qQXI+Mvj0+5vAHU4EU/xrSCKm+jhyWmEzCAcgyNx9XB0RuAjJ+efi69AAQY Mh5EkdP/PjXCW267wI23/Fqd8bECxTMeIMdtdIa1I9tMYcrQKdXORXyYa8OYKeO2KVd+Drn84ic
 YpJuV/MtEJgI0UIvUH8PYeFgAOqFVc5pWAhOJIx0V8cBbTOV/Tw4p8g/K6VsjFP1h+n3ZJTC
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=6859a05b cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=ZTx8QE4AkKJnx8U2w1UA:9
X-Proofpoint-GUID: 9q4zn-EHraalKmcrE-a4FfMd3A3wfL6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230115

The various __pte/pmd_to_swp_entry and __swp_entry_to_pte/pmd helper
functions are expected to operate on swapped PTE/PMD entries, not on
present and mapped entries.

Reflect this in the swap tests by using a swp_entry_t as input value,
similar to how it is already done in pte_swap_exclusive_tests().
Move the swap entry creation to init_args() and store it in args, so
it can also be used in other functions.

The pte/pmd_swap_tests() are also changed to compare entries instead of
pfn values, because pte/pmd_pfn() helpers are not expected to operate on
swapped entries. E.g. on s390, pmd_pfn() needs different shifts for leaf
(large) and non-leaf PMDs.

Also update documentation, to reflect that the helpers operate on
swapped and not mapped entries, and use correct names, i.e.
__swp_to_pte/pmd_entry -> __swp_entry_to_pte/pmd.

For consistency, also change pte/pmd_swap_soft_dirty_tests() to use
args->swp_entry instead of a present and mapped PTE/PMD.

Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 Documentation/mm/arch_pgtable_helpers.rst |  8 ++--
 mm/debug_vm_pgtable.c                     | 55 ++++++++++++++---------
 2 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/Documentation/mm/arch_pgtable_helpers.rst b/Documentation/mm/arch_pgtable_helpers.rst
index af245161d8e7..e2ac76202a85 100644
--- a/Documentation/mm/arch_pgtable_helpers.rst
+++ b/Documentation/mm/arch_pgtable_helpers.rst
@@ -242,13 +242,13 @@ SWAP Page Table Helpers
 ========================
 
 +---------------------------+--------------------------------------------------+
-| __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE |
+| __pte_to_swp_entry        | Creates a swap entry (arch) from a swapped PTE   |
 +---------------------------+--------------------------------------------------+
-| __swp_to_pte_entry        | Creates a mapped PTE from a swapped entry (arch) |
+| __swp_entry_to_pte        | Creates a swapped PTE from a swap entry (arch)   |
 +---------------------------+--------------------------------------------------+
-| __pmd_to_swp_entry        | Creates a swapped entry (arch) from a mapped PMD |
+| __pmd_to_swp_entry        | Creates a swap entry (arch) from a swapped PMD   |
 +---------------------------+--------------------------------------------------+
-| __swp_to_pmd_entry        | Creates a mapped PMD from a swapped entry (arch) |
+| __swp_entry_to_pmd        | Creates a swapped PMD from a swap entry (arch)   |
 +---------------------------+--------------------------------------------------+
 | is_migration_entry        | Tests a migration (read or write) swapped entry  |
 +-------------------------------+----------------------------------------------+
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 7731b238b534..3b0f83ed6c2e 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -73,6 +73,8 @@ struct pgtable_debug_args {
 	unsigned long		fixed_pud_pfn;
 	unsigned long		fixed_pmd_pfn;
 	unsigned long		fixed_pte_pfn;
+
+	swp_entry_t		swp_entry;
 };
 
 static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
@@ -754,12 +756,15 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
 
 static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
 {
-	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
+	pte_t pte;
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 		return;
 
 	pr_debug("Validating PTE swap soft dirty\n");
+	pte = swp_entry_to_pte(args->swp_entry);
+	WARN_ON(!is_swap_pte(pte));
+
 	WARN_ON(!pte_swp_soft_dirty(pte_swp_mksoft_dirty(pte)));
 	WARN_ON(pte_swp_soft_dirty(pte_swp_clear_soft_dirty(pte)));
 }
@@ -793,7 +798,9 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
 		return;
 
 	pr_debug("Validating PMD swap soft dirty\n");
-	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
+	pmd = swp_entry_to_pmd(args->swp_entry);
+	WARN_ON(!is_swap_pmd(pmd));
+
 	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
 	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
 }
@@ -804,17 +811,11 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
 
 static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 {
-	unsigned long max_swap_offset;
 	swp_entry_t entry, entry2;
 	pte_t pte;
 
 	pr_debug("Validating PTE swap exclusive\n");
-
-	/* See generic_max_swapfile_size(): probe the maximum offset */
-	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
-
-	/* Create a swp entry with all possible bits set */
-	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
+	entry = args->swp_entry;
 
 	pte = swp_entry_to_pte(entry);
 	WARN_ON(pte_swp_exclusive(pte));
@@ -838,30 +839,36 @@ static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 
 static void __init pte_swap_tests(struct pgtable_debug_args *args)
 {
-	swp_entry_t swp;
-	pte_t pte;
+	swp_entry_t entry, arch_entry;
+	pte_t pte, pte2;
 
 	pr_debug("Validating PTE swap\n");
-	pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
-	swp = __pte_to_swp_entry(pte);
-	pte = __swp_entry_to_pte(swp);
-	WARN_ON(args->fixed_pte_pfn != pte_pfn(pte));
+	entry = args->swp_entry;
+
+	pte = swp_entry_to_pte(entry);
+	WARN_ON(!is_swap_pte(pte));
+	arch_entry = __pte_to_swp_entry(pte);
+	pte2 = __swp_entry_to_pte(arch_entry);
+	WARN_ON(memcmp(&pte, &pte2, sizeof(pte)));
 }
 
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 static void __init pmd_swap_tests(struct pgtable_debug_args *args)
 {
-	swp_entry_t swp;
-	pmd_t pmd;
+	swp_entry_t entry, arch_entry;
+	pmd_t pmd, pmd2;
 
 	if (!has_transparent_hugepage())
 		return;
 
 	pr_debug("Validating PMD swap\n");
-	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot);
-	swp = __pmd_to_swp_entry(pmd);
-	pmd = __swp_entry_to_pmd(swp);
-	WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd));
+	entry = args->swp_entry;
+	pmd = swp_entry_to_pmd(entry);
+	WARN_ON(!is_swap_pmd(pmd));
+
+	arch_entry = __pmd_to_swp_entry(pmd);
+	pmd2 = __swp_entry_to_pmd(arch_entry);
+	WARN_ON(memcmp(&pmd, &pmd2, sizeof(pmd)));
 }
 #else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static void __init pmd_swap_tests(struct pgtable_debug_args *args) { }
@@ -1166,6 +1173,7 @@ static void __init init_fixed_pfns(struct pgtable_debug_args *args)
 
 static int __init init_args(struct pgtable_debug_args *args)
 {
+	unsigned long max_swap_offset;
 	struct page *page = NULL;
 	int ret = 0;
 
@@ -1248,6 +1256,11 @@ static int __init init_args(struct pgtable_debug_args *args)
 
 	init_fixed_pfns(args);
 
+	/* See generic_max_swapfile_size(): probe the maximum offset */
+	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
+	/* Create a swp entry with all possible bits set */
+	args->swp_entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
+
 	/*
 	 * Allocate (huge) pages because some of the tests need to access
 	 * the data in the pages. The corresponding tests will be skipped
-- 
2.48.1

