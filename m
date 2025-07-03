Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D297B2C3245
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582423; cv=fail; b=EynEbWi/Q/Lw3bI5QHqEQKxvVpz7J1QD8hKSGYI3/HtY8N//gXkmBkJdGxK+bRfdct2/K/8JaDOkIfEoayEwogGk+KInRr/M8Pmi5CoQmAC21kMArad7imC3/y4D81xA4/nRm+ap28cWilurh5P/A+r5Kv3yQAsvoNZPxH34Xmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582423; c=relaxed/simple;
	bh=PxnlATVd3jYHoE8r9oeDV0VrTEnihrgqU+e3hvxFxxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lEEIbpK+TOtNIYefmvlOtn2yn2BNt4wjo/1vDkJ8BPR34WC46TxA+n6Z4z0PPyegYEN4iiFWG7sVB8AXbxMFicZjwI1fPrKMzIwSz6NY/+9ffpFpB6VeakkUq0JlUZfB8BRYmV8DxuQQ3z68eQtayuAiX+2Sor0DtSZbgHwNtoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JHhtNgd8; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JHhtNgd8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBE8nIcWP9ctngOD/yrask/x2l81RBL3ZMIKgDNDzcS6bTkRtBB8+njHF5uZhsIefQGskpReaZJFbhyYJ9in/jyGpnPMgKKsxT2p6ANIs4DULlpbsAlJrMH9KChUF8c5OBdeuUqVxm340erHA7HMc+vL9+HHtfPkeUoUtT6RJPea20JSNKdsdK9n+gim2ttWpP4/2dolrVYSqSJ9UBoiMmuDL+Rm9JGJfqvG4uH26OhnBQ/2FbGDjENDxb/n3573jlv+gDm0+pAX6PcD+qvni2zyPOe9Bmk1r2wNi9+bUnL2OkS8Os0X/bLrYTsE9WpzQuP9pd86xrIGuIPEaIyygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnGq32cq3wIbSUunqGWp0hFjvVSvuF8Srvzp/XY4sqY=;
 b=DsnBhMvUyt6eYCBzDgtTFnSygbK6bC3cSFM+gY9mZyeWNpReROQR3rVB2FbA49W1qjfkHXEVEDXAOS762hPbPMsQKXFqARv+WG73aYrcaUP0r7AnSRIdx+nIBwJhrha0eGSZ/WTAhDU7jKoc6L2X8nh/1qvyyAh0jsUluieudNaq9Tw8gBUPxAvX5noj2blQkXiIh2GX2Fg3h9Rkg3+nhfViev5BbfR2LOTmtuDeEKDFwdTogyCNgJgPnIST/JAFcoOYlWx40Em/S/bJRfLm6cAZuMLSRAbEP3Se6XQ1lZ/dwiYwYAVoX5gHbGCbkHJV1aTZ8q+iU0eUTG1v8WFJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnGq32cq3wIbSUunqGWp0hFjvVSvuF8Srvzp/XY4sqY=;
 b=JHhtNgd8ES+Gfewe6raXeoX5S1XPutFcHc43aWW7xdcQx5cYwOob8Gf7+FNiVZWMIQEzsKRLV8Sp5GMFLP6GuSGktr2jTF1b3tJ28uflmaOHju6nnqY8FGRpiSrSYll9Z3KCjjY4xOkVhPdAkMYPTVwArCaUKsE2PsBVphl+YnK2304x6WS1FQbUVHX4kHBpfYpjEAVSqeWISxaQch0ZKKQAIRz8QajtBG/xPJ2wFJFcseeh5wttPh7DJ3Mvm5bI30+OCI3H+aQMuurJFddx7srlgeYRyysysIT8BxX3gCB4+m3kD2w3Wu1xFKj4NFW564tumly2LPF29WLBlgtDJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:11 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 04/12] mm/migrate_device: THP migration of zone device pages
Date: Fri,  4 Jul 2025 08:27:51 +1000
Message-ID: <20250703222759.1943776-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:806:f2::31) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bae0f53-9703-415c-5204-08ddba8291f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F861ueDl5eRze59CTtn7oXrQZC/DEU0nx98l10pRY/0kzlI1TulE7z3lIkxG?=
 =?us-ascii?Q?1Gz5Nkag91+oeCuTdhLejUcomqAEGPZXpl0UT0MJHryvzkXPHpsJauRwfchh?=
 =?us-ascii?Q?lLG1bmbaHMulHlMHwffudGpavKej8X90Cqfm1/iXbxcyqbLNAe/sYfro8SmO?=
 =?us-ascii?Q?0eHsevaqsgd0FG/oO2AOokic3vjCCeCx7qw8VwOSg8sYgQoS1vdJnMcCkxsP?=
 =?us-ascii?Q?6XhNDM4czjIeSl+YhKERB1pM0UGZ3howroDyxH6gvaeD+zfUeG3ynAIP0wb8?=
 =?us-ascii?Q?XPGQwVC/t7SLiLJIllKpaSaExX2f+ZQ6Z19f95pd6yC/0jnfUYNoFYbedWET?=
 =?us-ascii?Q?7+PiTg3KtZd7jhXe07vO0dZURc4YN+G3qYMeGIHUmrQDYJfaBBz3uVTPmcVe?=
 =?us-ascii?Q?EyF7oPSN+GiR8I1qrFTYpznQ/g+zGpXW1RmRZIqP2owJf5lS1t4+zvg7Wrx/?=
 =?us-ascii?Q?doDKr0U3cpYFmzavb7TL+0Ad1iEBoHyiycuyXoL6kojiWtMXlwU6xj25Qrn+?=
 =?us-ascii?Q?W+zLQUHAfmLR/tS6B3xov9gRIYX3X7BwwU9hum1Ne+DYwD8z48Z5yQW3oOUB?=
 =?us-ascii?Q?UaZuAQWG8GcU3TrPGm6UiJOqQvuicr0ISlCbeOiEikAqcqT+sfvqgi/HsRIG?=
 =?us-ascii?Q?4tbiwm9uqeS0GzgttBqC66m9eUt1lxiRW3JIQkh9efDJOl/wV2w6U438oLdJ?=
 =?us-ascii?Q?KSVK1BQXPccDV3rrhDTqRLCfeZtA3xtTNnIbas7xa1NQIJCuMLByMhEnAjTd?=
 =?us-ascii?Q?/CvIRiPkUpkLdfQxhYVzLO3nhmyyAdHlaWTJzExF4EqnLrdGHKfOwTExbvVF?=
 =?us-ascii?Q?CxLBdu3fNhGcUH0ScKQs7BXk/owLBVf/lAgaLmzdprSXC8rDHwwGK+BkN7f3?=
 =?us-ascii?Q?0CHF6HxuWET8x+wmzXEuYSXgZvS+nTFY36GKNpTOb9+Z5bHAL48/m8983FQS?=
 =?us-ascii?Q?cEQzZzIyKVM1F2clvaln0smHiqzjZI25bjUgdrwNO5AgIJMJcJmVcMtsdNrW?=
 =?us-ascii?Q?bGwg0LS9HE8aryNchKh2DvoErdpnK9ReqVrTC4TbqR0w1m3hx6gMuK8F+kXa?=
 =?us-ascii?Q?FXKU+8EUn7lBRGsu/YJlbMn7/F1ctLanejLlJet9mCJkWEW6xyC77PBH4HXP?=
 =?us-ascii?Q?w3xFE9/hVHPZoQzMmrEmisqj/dDMfM80JT0LU1wm2NFrIyb4O/VB7TNusCFP?=
 =?us-ascii?Q?RlZiG0Us2uU+J4BPC9EaCeeeNkEfNExTQud4aKlqp5AauiqFxbQ/ZtZtAWqs?=
 =?us-ascii?Q?NBxUJqOEZwNJvdAVIbRbd0/I6Y2Qa7rMn9/Z/VeLQJYsgxFflhFwWwV7QR7f?=
 =?us-ascii?Q?LF/sG3ZGuantVKYwJUrgHlsTiikc/+UApj+NdMoEZJad0Ml8/p0i2vtPIoy4?=
 =?us-ascii?Q?EFN/rU2UOGwkNrEgtaVjCQAW3I0ivLiprLCaJHzF+fahPelbXV0gd9UFCWCS?=
 =?us-ascii?Q?fn90EFhMwlY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q0/Httkg1DJ0dYWHV75rbc+paPdeya9Qpeq9+Kj/XBRf28xkG5xP5juUqd6m?=
 =?us-ascii?Q?G/dsjMNUTyHesZxyG68zyKA1gTuvqKj3kcVbR2gAJFYcVtNoqnUPWz+uHykK?=
 =?us-ascii?Q?6nx2IjgY+qE2e5Qep8W7Q9vxPxMBDHapx8efufQ15pWQ4kwVoLi2YZ0WzP1X?=
 =?us-ascii?Q?ayWccyp2OtuFOMfwMZQufWOB0FYG3+lTUt8fc719wemwa+YvMlQ12ud5Xzq/?=
 =?us-ascii?Q?daId9Wg8Q0C/3+ygRqcqW3J7jcnzFZPK1p5Sbg5Y8cgorDlbpjN1V4slqE72?=
 =?us-ascii?Q?hIbpg0qeBBktTLCAFAMK25bGHLOi2c0knJXgI0IQh62lxvuqezGR3JgwkDqR?=
 =?us-ascii?Q?OU1kj40OaCyIzFX+vwVvSP9PeHc994/bnrrzKSJRo53cUxSls06tzzJLHyW2?=
 =?us-ascii?Q?nzc+dYw2GErux839nEllMIWF9YwbExwm3gehFltd9WZTzF03SRi52n4UL799?=
 =?us-ascii?Q?f5j5RGpdNl8+qYPVEeNnHUwBcQtSXpHxrBZeyv6+E5WAr7ag9Z2QLRk05X61?=
 =?us-ascii?Q?3Jb5yLayGoddNONhMLaIImyrvI7lU8+HxWasESC0i4164SWonFUWPF0CA6b5?=
 =?us-ascii?Q?8yi6q7g+dKdNH7bTUnCeE88Oeaxzy+G8MQFV2m5o+aB5VGp+IozrfwCBrqRd?=
 =?us-ascii?Q?aJWdvHxgZvmtX31jt7XAE7+P1F9yt/odK1XTGfupEqoH1GHJh0CHWBkwFEGG?=
 =?us-ascii?Q?pdk8r6Zq6rtNe7KcIo45lQ2LL/a79IRLiQczJxB3ZRKR6uDVSV1iUXOel/Gc?=
 =?us-ascii?Q?CZMfGJSYsI2JEtvm5ebahXYTEfiCyZirr83Cw5tIh2ybcAydeeGfTTKGYpX0?=
 =?us-ascii?Q?47m76zjTdBa/knFB8pzPivbAPEMe4ZxAVm7GMwvPXkkD5h5dd0y9pWchXF8U?=
 =?us-ascii?Q?BAUhUfhXpUwqNMVlEo9O4xfkYk5/Pjxe2ENtU3xW8dTXxfG4avxxsYju+QTN?=
 =?us-ascii?Q?d/Zr4Qz4KAbWDST2rQi52hQ665fPkfP1ZjSi5nPBAU9hUqbmfCqMHXLvwi1g?=
 =?us-ascii?Q?ID9kc7y831+kqgFg3SFSftOov8qOYjQzLW25nZD+437bDfYUGsCNz5cF/v9/?=
 =?us-ascii?Q?r8mlPmSXBVKbmSDwaharMEz5odtv5spfe5MfSBIdibfpee46YJP+Z/M13TcQ?=
 =?us-ascii?Q?/Lys9QRYoyphqoN/Nx7IyZnXJgYBdiRPd8a7hkj2WCiiUsTnjade/H3K31OQ?=
 =?us-ascii?Q?lUb3NPGydf/n+PTR3XKoHTxjCeP7NeA46GiZW7m+CtrMqDfiVmKMz9EXJv36?=
 =?us-ascii?Q?RiKo7bg41fqODoyUuWcCxQhweQpKmcEMqFTn0I2bGRDLTo2ZDKu45p4zwLG6?=
 =?us-ascii?Q?ineSsaGF8lV7lwAJDWcekepeBrPApSfYexV3KU4TY9S34AG51O6zauncjMKd?=
 =?us-ascii?Q?txGkbdbjGA00ICIM+fnlKxH7LX2H8sWMBdak1RUK1zBB5/RLBtyNr8ZogutX?=
 =?us-ascii?Q?SfiL5UN0BY/V+wTnpUEJh0xmtfQcn5lvZHgNUx2LsKkHMhcKV1REbTLlgZGt?=
 =?us-ascii?Q?Ze+xc1EIOXviHjs4r1H+hqsSmyfMkqiIIdW9+xXqCfYxxg1NX9FN1sXkUIui?=
 =?us-ascii?Q?MvhwR99vtIHvs4i1JiQyyFWpDN46zAADfLKzRnST?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bae0f53-9703-415c-5204-08ddba8291f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:11.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPZxYALLkYpOgTHesij8yWqQglN3/Tal2DZdN0cYyHq7ulkFO7cpSBtJD4b/uylfxXukDfXi92Lq1+jh3tHIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

migrate_device code paths go through the collect, setup
and finalize phases of migration. Support for MIGRATE_PFN_COMPOUND
was added earlier in the series to mark THP pages as
MIGRATE_PFN_COMPOUND.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/migrate_device.c | 437 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 376 insertions(+), 61 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e05e14d6eacd..41d0bd787969 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -54,57 +72,148 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/**
+ * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk,
+					struct folio *fault_folio)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct folio *fault_folio = migrate->fault_page ?
-		page_folio(migrate->fault_page) : NULL;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
 	spinlock_t *ptl;
-	pte_t *ptep;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			/* FIXME: we don't expect THP for fault_folio */
-			if (WARN_ON_ONCE(fault_folio == folio))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			if (fault_folio != folio)
-				folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
 		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
+		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	ret = split_folio(folio);
+	if (fault_folio != folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -175,8 +284,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -347,14 +455,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -385,17 +485,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -407,7 +514,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -426,10 +533,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -575,6 +684,146 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	ret = check_stable_address_space(vma->vm_mm);
+	if (ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -585,9 +834,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -615,8 +865,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -707,23 +974,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -741,15 +1009,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -762,7 +1062,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -770,7 +1070,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -782,6 +1082,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -943,10 +1245,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++)
 		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+			pfn += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
-- 
2.49.0

