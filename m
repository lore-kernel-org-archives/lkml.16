Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2613212A
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748659589; cv=fail; b=IbZtxBdsrfRd+yWHE5VYXzd+rHiwfGQQIOGKONZzZ2Oy+fwPN8myn6vSPmttnea8Cfu+0YVPA0BPU75rR02Bdmjmr+dS9CDGwq7rmtClAfz5vR5Z2bo6fSizQO4N/u4iv5nPBHx5x+O+7/IyJgTAOXL48qKXOqqtfCy0JaWVjzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748659589; c=relaxed/simple;
	bh=33sYFCG9noB56VoJygupeJeY+LFPR3aLk5M6ulwmHWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TRpmRsHbv+NYcs8GJjOEjaS6y50JXptV+Qm3Lcvs67qT7AV8VkjHkXkG57ZTbLlQ+nDoAxsnHD+nqVfd9znNQuHf/wELjVtgwsug8AOTRTk9H0pyEOpqDs5B1TRXpVeUzpOw++4BFqlcF7zqz0k8HsB0dpjZ3WxOSFDPbaR16Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=DklCaIBl; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="DklCaIBl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRXlxD1CfpBxxgPaTNahB21maxikZZj0PBW9vgTaztC1pHRgQIpNqtAOOtkPgrI8Cb5ZeZgW91vnxlC+rdM8KAefodpY2baEMak/7sQHM4BOLhES6QUijlTAffmcrcPDkTwSTwlo+fC9o/423clOI72uDUbTEdcgLAm/7qSrkuJhuNiI9krBicwRFcanunYqr9CoyAPp8L8D2SzEfj/c7BSxcJOAYTAm9bn6VBaY3LaXsajMwK8lw4S2b8Keh4BzUN/yIeubyIka7LChP6JWFYkI8KbrlyC/Ik/VvXUbFSsuftNUgRjQpbEDhDqtiKA1rg4DvuTgf4o6VJ+xKcvAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq1yUacXyMU3P0fW6hQ2kmRrM2THBFn+cxuUfsZ5kBA=;
 b=WcqV8mkArHqZA6PdIcmkBHC9zhH6aqUctGkF3YikEzvZgv/BWCI/IpZInrggm+Ayj0kwfr79ivYK8ohypREAErsPMztyy3VoA/M9E6mFvfqceqV5SgU/TtLEtuelqDiYMrMWWI/WYIDYIPAOdxKkqJJbp1F5Em08oPaEs3N4lqqRKFWVU1iBr+aw7R1mdm3GZKo7xQU5ooMh7/5iNZDM8FapBBear7CHPdpNRnGmtsIjwjoXaQqDN7CzqRMTzfViKfANq1RzRGYPEIPmSqhkaI+gLqCrdpNKJd8x/Mx5tHw1M1On4k1FTQWj28nVg0w7ejFV5R2LpaK9ZY7BCyQOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq1yUacXyMU3P0fW6hQ2kmRrM2THBFn+cxuUfsZ5kBA=;
 b=DklCaIBlYWAmvlOhYXQkzgnqdFquCBUxhzdrW17wSKCrLleFJFBolt4iQmCZM5U/egkFirsCECfqIvDF8fFrMDEntEXCE6Flm+CghAWxgpiFm+DIrGmMgtw8opgZ04LAggvfvLAU+AtBGp10GodRUab1iqpcFJ9MkPbYRJcbFpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7551.prod.exchangelabs.com (2603:10b6:408:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Sat, 31 May 2025 02:46:22 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 02:46:22 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: mm: make __create_pgd_mapping() and helpers non-void
Date: Fri, 30 May 2025 19:41:52 -0700
Message-ID: <20250531024545.1101304-3-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531024545.1101304-1-yang@os.amperecomputing.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0079.namprd22.prod.outlook.com
 (2603:10b6:930:80::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 81789021-3abc-4c1a-194c-08dd9fed5402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4P2TwkSh8j8UV+ZA6sdDvxyfqHjXMJJPioMdN83+mfgWZf/P/sEI6P5WAmLn?=
 =?us-ascii?Q?JM7Tivy40vij6KOwvYZNudzpSbTdJZ2M0uxWVvZwSN44bQ08GYjUy5JSldmc?=
 =?us-ascii?Q?Zrje3p3526Ied8KTNcKf2ZSAAQs13Nf1kznf0Mr8fau1/KdSLK55IWt7AOP/?=
 =?us-ascii?Q?MmCezO338fZFiak203lmSomc+82Ty6+mGgfMbQBEY3eamn0IxCKFFTVjDNnA?=
 =?us-ascii?Q?DaxYmKP5yo1R2xrg/NXdXk0ad8lf7ac7EvFBYkigobCaA2D2m5jjbiNvkBMD?=
 =?us-ascii?Q?HWOqmh1rscL2jihu0qa6kuwYnVvBpXYv8zo5bYW3fZ9Z9zKiCFgDYO7TGu3A?=
 =?us-ascii?Q?0TLmNlZRbspxhIA6+jI7owCdHZIgWAIX4/Hfeiykedf126paRqadpAGf+8NT?=
 =?us-ascii?Q?sTqwedq+n3yZJeSj797oAIPX5dKnC/TLWndMhuouxG0MdmM52sJ9Q67813zP?=
 =?us-ascii?Q?6HTKASWi5ZyH06X4NalS7AVNtPftp3G4TZFfhWZ56rLxUPJS/+EePCOau8yx?=
 =?us-ascii?Q?0L84+ef/jq78cvWO4fldWlEGzXqLCzCE0uh8YTN9Cz+V/gUxBe0eI4TlHCSi?=
 =?us-ascii?Q?aXI5uzGKbcaBthctQmPW+E6SrOaYzTr06VI4EmKrcfKRdi8h8SzdZH+xg5j8?=
 =?us-ascii?Q?to8+1KrLWhUNeGamrB0v9VPromBvTCRDkbiP6XPtPXhaoQU8AD8IJdD+vAZN?=
 =?us-ascii?Q?zc8i6TOvTc2+h3Nbn8L4208cpcxftPTY4vPaNNXu+gZkQz723wFI67Ojh60P?=
 =?us-ascii?Q?Dlp3QjoZPNgNy/VfB0iUk+s9wrPan9Pc0VdzUW+ZOjo3m0qnl5DyyBBLv1Jl?=
 =?us-ascii?Q?CNDOB0LsrWkFxaRxQt+oOMrMVSIJSJaB2VOQ1VmgCu5V9alnMGMRJU3tEVf0?=
 =?us-ascii?Q?q0IsCLKM5dxO8pmhXtIwoanQ34gfzo3atLYO6bhWQGxeq+bNp92pHcfI7omR?=
 =?us-ascii?Q?U0spybJhB1e+iYT3HOVmYC4ivh8o2gYhWxKcmUZV2qyAwyCbh/v9IX/XlDyA?=
 =?us-ascii?Q?NldEbXX+Z1xDQ2HZEpuVao0s+bGtnULbjn9VadoMoMzuCmiMmfOCRoNY405P?=
 =?us-ascii?Q?JLnuiadND9jiZxv060kgihn4is5xE/XkHwlQ6+E2GwEatiOZwKJvIQ1cy4Nh?=
 =?us-ascii?Q?YuIRhFDqH+/YqiMed282zDoaXgVmCSZhjNPDwCJQ8xkMEa8ABiA3xYMesSTt?=
 =?us-ascii?Q?MQNI3gV2SQp0y6JYNrqhjiprPlWNRxGLBCNB242L5pw5rkaNQYPtMsdFz3/4?=
 =?us-ascii?Q?VWoITanHl0Jzqr7Sc7pQc77c09IKRmxAHgv2DDzjWhAA+9Uiz20AiSp0RkuY?=
 =?us-ascii?Q?mJQs6U6khSv0RmzqpZSRPHsnU0vkFjd9RBpQVbfcG6VRbaNJ/O1NK6KWjoaP?=
 =?us-ascii?Q?P0BoBJocKc9Vx4EXKg7WQDle6kSJFgAPERa4xx2b0LKiuO4Ew7uMJ54BHRLC?=
 =?us-ascii?Q?1xOCAZznlVDmMoRqpsfXhlUIJ36HiN5bXFcXK+UxF93r42rlkEA8jQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z2b7s3PWzriYS5u3WpKjzkiGgs7JdCXKWc7MuMWX4jeiwo30Lst6F1QzMoQA?=
 =?us-ascii?Q?LAgQblwThHLMzt3tVmIMi6andHCXSS/QNmjM7WXxh8GLkFQXCqSswQ5kyWGg?=
 =?us-ascii?Q?KBa/ho2kpTHUf3QKfNkzFX7AnJICSycW8kPngvKXK9Oi9dkKjRrI3qh065aq?=
 =?us-ascii?Q?5B0t8Dvh8AUZTF6IYNByb7ZrpwWBkrnSCBiUIseP8UHoV3KZbPpN+CwGuEsx?=
 =?us-ascii?Q?u/2zFl8r7AFQKLny8evl+UU4zU9yIaD4bGlPyEeC/jujRpTf04CyR559wBwO?=
 =?us-ascii?Q?5YRGEPKQz8q0QJL79JNA7a77EuNL0GICNCAqqjQf7j+nF+Q1sdxy2BWJyJZp?=
 =?us-ascii?Q?wlKFbP0cJZcs8+BQD7KqWhjhpkv8VH4yw+rXh4GN3Nmp/n45gzi3tl0970cG?=
 =?us-ascii?Q?Ps8SgkDQIi49BL0cms8wJZWmnhlrxk8tWIyjm4XJ7wBLhTVS7VA6EBR5Tgyb?=
 =?us-ascii?Q?LXCXRGdH0m/jgG0k9zNMV1IKLggeoFzIHLTvMKtF+PxLOvQHjSXNuEldrEe/?=
 =?us-ascii?Q?ckLP4Z9PJMwAAR+T2K5XYFFU5SgfDxrGnAYTJ4Ga9ufKrLov1pIKPxdhhdOi?=
 =?us-ascii?Q?Vho1N7uY0RTma9UdGPmsqnkY+6EtGLakRPv0iNxozc/t7ZxE7MpTCNr9f7ix?=
 =?us-ascii?Q?uFGjO4HvC6KVWdAuazpYK3DD1C88/4/QKowZKJ9/ExzOq4mZQRXkBwM4GlPo?=
 =?us-ascii?Q?yZcsjfMrevK4mJ9mqmTNhXaNoghNcd9t7Nlaxjhh6TBtDggIu2vvAVh3Wa1g?=
 =?us-ascii?Q?1WKZfbB2lYxReaZ9vHeuQsDEXMlx6xoK2yfVAkiubzbDWzcsFXL82pxqpCPd?=
 =?us-ascii?Q?uam7UwkFau5l9oWrfGFPjTD+FmI12ovviDhSxOK0idYgFl5/lDoH9p8f7v6b?=
 =?us-ascii?Q?fiJQxFZ3r9nbYFuwD+/VrWoJILcjO21cnyBi6qfRQFNOB8+bSVkEW8PCH7KB?=
 =?us-ascii?Q?wlq6SG5rD9lvdlYc0RJ8Ud9SssNeqpAA7a67xNyGV9NIOujL+EoBUANvVsK+?=
 =?us-ascii?Q?xuOodobrg3a2wRtYajyQYpzZQIh1fKCO0Oqt74CjItRMkWhpWliMM51EoO+R?=
 =?us-ascii?Q?CwYUrBZ8a2q7iFNVxRZxiUYfudAiCEXcdLBwZ5+9crffbz9c8kszjYnpVaDV?=
 =?us-ascii?Q?W6gGcwkAY8Z9y/t4GUxbhKFIGnWkHrxR+4gGs2J/6v4HoewovBsU7wvzOb4z?=
 =?us-ascii?Q?7Y481s7eFxO+CgjDFiYBs3wOsky4E1jQ0ssgtPO7nqf+Z5hLMHZ9VR2zSsoj?=
 =?us-ascii?Q?Qxdg+2Vc/NAqaGUOzgjRA6dl0CrrH5DcxYHQRPQhREKvBdDjOvK0TWmrbdch?=
 =?us-ascii?Q?da+ybL9Y679mBF+UwBMjvF4isCTo62NL45AEXsPZQCOHQrmbJ0sj8QpiHH2C?=
 =?us-ascii?Q?iQhLZeIdBnQjXdSkS8xKq+MiAzrjwwetx8ZgW9yHYyfwZ1t05wTw35Tq9mOJ?=
 =?us-ascii?Q?Y46GhL/WhBzkJctf1f4+NlayGQBLgEhQV1OjhJK6r6bUPS6iE0QozOvmyp28?=
 =?us-ascii?Q?lddoYAEzm9ARmkiUiX+dnSRWjr/S1DN4olcG1Ai0T9Lf/2Q6of6yWOi1CVRJ?=
 =?us-ascii?Q?SYxkeLLHZcgiGPQXmgUPf092QAxQ6DA4URRYN+onpNQzTw11vwDDx5me6e2/?=
 =?us-ascii?Q?RDviQ0kCHSnMWu8vQ/Fsv4o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81789021-3abc-4c1a-194c-08dd9fed5402
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:46:22.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3oyDGfGCtJcda1k1hmw0hmizSVtzcLxl9Eqts09X4NWbiQ4wIe01TlX1mAk5ztPSNi/tB2vAMS4SSkaE7X0dO9jG7cxAlgs7wIt2dmnfsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7551

The later patch will enhance __create_pgd_mapping() and related helpers
to split kernel linear mapping, it requires have return value.  So make
__create_pgd_mapping() and helpers non-void functions.

And move the BUG_ON() out of page table alloc helper since failing
splitting kernel linear mapping is not fatal and can be handled by the
callers in the later patch.  Have BUG_ON() after
__create_pgd_mapping_locked() returns to keep the current callers behavior
intact.

Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/cpufeature.c |  10 ++-
 arch/arm64/mm/mmu.c            | 130 +++++++++++++++++++++++----------
 2 files changed, 99 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 25e1fbfab6a3..e879bfcf853b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1933,9 +1933,9 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
 #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
 
 extern
-void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
-			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(int), int flags);
+int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
+			    phys_addr_t size, pgprot_t prot,
+			    phys_addr_t (*pgtable_alloc)(int), int flags);
 
 static phys_addr_t __initdata kpti_ng_temp_alloc;
 
@@ -1957,6 +1957,7 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 	u64 kpti_ng_temp_pgd_pa = 0;
 	pgd_t *kpti_ng_temp_pgd;
 	u64 alloc = 0;
+	int err;
 
 	if (levels == 5 && !pgtable_l5_enabled())
 		levels = 4;
@@ -1986,9 +1987,10 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 		// covers the PTE[] page itself, the remaining entries are free
 		// to be used as a ad-hoc fixmap.
 		//
-		create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
+		err = create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
 					KPTI_NG_TEMP_VA, PAGE_SIZE, PAGE_KERNEL,
 					kpti_ng_pgd_alloc, 0);
+		BUG_ON(err);
 	}
 
 	cpu_install_idmap();
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..775c0536b194 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -189,15 +189,16 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
 }
 
-static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
-				unsigned long end, phys_addr_t phys,
-				pgprot_t prot,
-				phys_addr_t (*pgtable_alloc)(int),
-				int flags)
+static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
+			       unsigned long end, phys_addr_t phys,
+			       pgprot_t prot,
+			       phys_addr_t (*pgtable_alloc)(int),
+			       int flags)
 {
 	unsigned long next;
 	pmd_t pmd = READ_ONCE(*pmdp);
 	pte_t *ptep;
+	int ret = 0;
 
 	BUG_ON(pmd_sect(pmd));
 	if (pmd_none(pmd)) {
@@ -208,6 +209,10 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pte_phys = pgtable_alloc(PAGE_SHIFT);
+		if (pte_phys == -1) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		ptep = pte_set_fixmap(pte_phys);
 		init_clear_pgtable(ptep);
 		ptep += pte_index(addr);
@@ -239,13 +244,17 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	 * walker.
 	 */
 	pte_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
-		     phys_addr_t phys, pgprot_t prot,
-		     phys_addr_t (*pgtable_alloc)(int), int flags)
+static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
+		    phys_addr_t phys, pgprot_t prot,
+		    phys_addr_t (*pgtable_alloc)(int), int flags)
 {
 	unsigned long next;
+	int ret = 0;
 
 	do {
 		pmd_t old_pmd = READ_ONCE(*pmdp);
@@ -264,22 +273,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
 						      READ_ONCE(pmd_val(*pmdp))));
 		} else {
-			alloc_init_cont_pte(pmdp, addr, next, phys, prot,
+			ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
 					    pgtable_alloc, flags);
+			if (ret)
+				break;
 
 			BUG_ON(pmd_val(old_pmd) != 0 &&
 			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
+
+	return ret;
 }
 
-static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
-				unsigned long end, phys_addr_t phys,
-				pgprot_t prot,
-				phys_addr_t (*pgtable_alloc)(int), int flags)
+static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
+			       unsigned long end, phys_addr_t phys,
+			       pgprot_t prot,
+			       phys_addr_t (*pgtable_alloc)(int), int flags)
 {
 	unsigned long next;
+	int ret = 0;
 	pud_t pud = READ_ONCE(*pudp);
 	pmd_t *pmdp;
 
@@ -295,6 +309,10 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pmd_phys = pgtable_alloc(PMD_SHIFT);
+		if (pmd_phys == -1) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		pmdp = pmd_set_fixmap(pmd_phys);
 		init_clear_pgtable(pmdp);
 		pmdp += pmd_index(addr);
@@ -314,21 +332,27 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
+		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
+		if (ret)
+			break;
 
 		pmdp += pmd_index(next) - pmd_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
 
 	pmd_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
-			   phys_addr_t phys, pgprot_t prot,
-			   phys_addr_t (*pgtable_alloc)(int),
-			   int flags)
+static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
+			  phys_addr_t phys, pgprot_t prot,
+			  phys_addr_t (*pgtable_alloc)(int),
+			  int flags)
 {
 	unsigned long next;
+	int ret = 0;
 	p4d_t p4d = READ_ONCE(*p4dp);
 	pud_t *pudp;
 
@@ -340,6 +364,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pud_phys = pgtable_alloc(PUD_SHIFT);
+		if (pud_phys == -1) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		pudp = pud_set_fixmap(pud_phys);
 		init_clear_pgtable(pudp);
 		pudp += pud_index(addr);
@@ -369,8 +397,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
 						      READ_ONCE(pud_val(*pudp))));
 		} else {
-			alloc_init_cont_pmd(pudp, addr, next, phys, prot,
+			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
 					    pgtable_alloc, flags);
+			if (ret)
+				break;
 
 			BUG_ON(pud_val(old_pud) != 0 &&
 			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
@@ -379,14 +409,18 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 	} while (pudp++, addr = next, addr != end);
 
 	pud_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
-			   phys_addr_t phys, pgprot_t prot,
-			   phys_addr_t (*pgtable_alloc)(int),
-			   int flags)
+static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
+			  phys_addr_t phys, pgprot_t prot,
+			  phys_addr_t (*pgtable_alloc)(int),
+			  int flags)
 {
 	unsigned long next;
+	int ret = 0;
 	pgd_t pgd = READ_ONCE(*pgdp);
 	p4d_t *p4dp;
 
@@ -398,6 +432,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			pgdval |= PGD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		p4d_phys = pgtable_alloc(P4D_SHIFT);
+		if (p4d_phys == -1) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		p4dp = p4d_set_fixmap(p4d_phys);
 		init_clear_pgtable(p4dp);
 		p4dp += p4d_index(addr);
@@ -412,8 +450,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 
 		next = p4d_addr_end(addr, end);
 
-		alloc_init_pud(p4dp, addr, next, phys, prot,
+		ret = alloc_init_pud(p4dp, addr, next, phys, prot,
 			       pgtable_alloc, flags);
+		if (ret)
+			break;
 
 		BUG_ON(p4d_val(old_p4d) != 0 &&
 		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
@@ -422,23 +462,27 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 	} while (p4dp++, addr = next, addr != end);
 
 	p4d_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
-					unsigned long virt, phys_addr_t size,
-					pgprot_t prot,
-					phys_addr_t (*pgtable_alloc)(int),
-					int flags)
+static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
+				       unsigned long virt, phys_addr_t size,
+				       pgprot_t prot,
+				       phys_addr_t (*pgtable_alloc)(int),
+				       int flags)
 {
 	unsigned long addr, end, next;
 	pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
+	int ret = 0;
 
 	/*
 	 * If the virtual and physical address don't have the same offset
 	 * within a page, we cannot map the region as the caller expects.
 	 */
 	if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
-		return;
+		return -EINVAL;
 
 	phys &= PAGE_MASK;
 	addr = virt & PAGE_MASK;
@@ -446,10 +490,14 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 
 	do {
 		next = pgd_addr_end(addr, end);
-		alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
+		ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
 			       flags);
+		if (ret)
+			break;
 		phys += next - addr;
 	} while (pgdp++, addr = next, addr != end);
+
+	return ret;
 }
 
 static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
@@ -458,17 +506,20 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				 phys_addr_t (*pgtable_alloc)(int),
 				 int flags)
 {
+	int err;
+
 	mutex_lock(&fixmap_lock);
-	__create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
-				    pgtable_alloc, flags);
+	err = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
+					  pgtable_alloc, flags);
+	BUG_ON(err);
 	mutex_unlock(&fixmap_lock);
 }
 
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 extern __alias(__create_pgd_mapping_locked)
-void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
-			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(int), int flags);
+int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
+			    phys_addr_t size, pgprot_t prot,
+			    phys_addr_t (*pgtable_alloc)(int), int flags);
 #endif
 
 static phys_addr_t __pgd_pgtable_alloc(int shift)
@@ -476,13 +527,17 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
 	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
 
-	BUG_ON(!ptr);
+	if (!ptr)
+		return -1;
+
 	return __pa(ptr);
 }
 
 static phys_addr_t pgd_pgtable_alloc(int shift)
 {
 	phys_addr_t pa = __pgd_pgtable_alloc(shift);
+	if (pa == -1)
+		goto out;
 	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
 
 	/*
@@ -498,6 +553,7 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
 	else if (shift == PMD_SHIFT)
 		BUG_ON(!pagetable_pmd_ctor(ptdesc));
 
+out:
 	return pa;
 }
 
-- 
2.48.1

