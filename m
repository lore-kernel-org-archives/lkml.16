Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135F2D0C97
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582432; cv=fail; b=k2G+lwJ9Tx3jhYb/l+hCiIDGBkTicdUyBKRapVARSLGacaNxRS1JivOUhzBWMp4+XDUPPidWMwbIY0d8KaI9aXgltCUbAOcfPMg7ayXod3b7xe8BS+CgobV/z7BSatihJWf/m6fQL+81xd7EP2RtzobbUaVN1ZYQahLcCeeebg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582432; c=relaxed/simple;
	bh=vpEMlXXhE0GilSEsMpplO/JxJMtNU3buPiRJAAycQmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMyNe1lZ/IDgDrm+wvS63UfhITDmXdvI/pHDF0aBD4ceIkfHZ16AaZ9Zha9326IDCYIHRs/baJpdIwcqK5FPnPJOzFJGFiVyslgkAi3qh0IrmXtCu9hj6jtroPDwnQiRJEdW+aW8ZyVBuTBf/+uTZoWKJ9JHfGhS3cwmBpwUUgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZ4E+Hff; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZ4E+Hff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuIySadRcbMEpjSUUlVvp97guL61QnaqXo0QELxEoBs2VXqDtubpwWQ8irnrXT8qRkSlIaozE2qvxnY3N4DwMJS+AMB8Lhg36erDsFTDhgP2zOsikf3/qDuvLDEdv8OMkj1rGJieOgSHbKlgiVoouteu9599OXv9wawW3U9Rqm04XulO2oegbZYie2j2c5uVceUS/vkP+v4p5reQmiupay+9bCZ9QX/t6F/N6RUpjNHqw3giIJAiARan8wtMNsl3jtadXGjhqOzWylzgJDGEczUMYF+AxdhfpHZmDsNr96BBFf5jlTQaT35hmAiCUeQWwvSQvXoVyI8S3N0SpfrFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR899hp3v89ICFPKM4hdd9bkWyEmas49r/JmTB/soyk=;
 b=si8RS/lAPCKgP5hUeQ6/pcqZeVhshwjlQOzub21xPpVuW8tZtw4kdZBcr4kGKDvhb8nvc/qt5eRIDpMOiq+51NSSSCORmgcyQO+u0esPpp4mPoOZD9jWGNjhmpLKZW1JZN4JGriR0BKkEhXEaAqy8ie3CIPY+zD53l33qdmT9V+rzdqA3DhL4DUXEYwZHAGeL09XO9RnQFv3dHfNoa8zpELWNBpjrqyFObeDzEdRcKRtjLEggmMbRbr6XqdmYzkf5GCxa4GA1uov6rEWWhWXKtMSuw0yrEZg0e6F+y/zIbTOekQJ6ld/IhsRKhLznrOPCUggrl0egllAAfyAQ6GX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR899hp3v89ICFPKM4hdd9bkWyEmas49r/JmTB/soyk=;
 b=cZ4E+HffwQ5QCMZWnsZwcUgHwPXS6jgGdaI4XpyDKVa5Y+1/tGknd5vUV/o4Gbhvst7Ej8dpVPODBnSLkSTNRcppd3fAYPSWzsNz0cCU7xwIPTBZKfu2ivStRckoBLXkxvDy+8n0hghQnAyYRuhpBWbs+gV6Qt6/L87CM2wssLalCYegNLUdqwCDFUuVPgXicxgpDMUxb0qVphAUHyGWxUldUGzLPEnBMLKMepv+N1fSxhszbfWdBcm7CtmNqQxFRcxUw7Aqd8am0mchlgXC2ecAKIzZfiQo9lv6Oz4UUM4YbyOg5lux4zrGnxnGHSsonap0W3Ff41WHjmxa65cTDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 3 Jul
 2025 22:40:27 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:27 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 09/12] lib/test_hmm: add test case for split pages
Date: Fri,  4 Jul 2025 08:27:56 +1000
Message-ID: <20250703222759.1943776-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:806:a7::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: 524fcf49-e538-4306-8abe-08ddba829b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTeY0n4+7x8cYPUqLq0iM2wwMN296KzqQAXZc/rcmu9LrolYNyfPDNBuSxGf?=
 =?us-ascii?Q?1IQnz3ykq/2b0jeSbL/R61vn9KNzktjD8z+lkDX9RXmVXGD5ovzbYXGp/ELu?=
 =?us-ascii?Q?0Gm3nElTwAiviTarFPNBKnwm11ZxuscLKDbYMWjyjXPAf/GgJ88IE2QyWVJt?=
 =?us-ascii?Q?aIL6qa1lHSMSHjod2kEzaLVueabMfodJm6rTqEHlEnZBe2dDbRU+0HJTfeY+?=
 =?us-ascii?Q?yRkSIBRtbboCglnWo4qEvbdivkmXbCVYd+NzBhmiCI12kvGrGBSPW3hhKXom?=
 =?us-ascii?Q?vUcqWST3CL1Q1sgvkekyO3wIjcZJZHpzy7iRz9ObHa/u5s8FsiCualK7GCNs?=
 =?us-ascii?Q?mz3ycPmo4BQ9ar2v4nHJnH2fyDkyoCxqVVL1jKi16LHjSwIiuKub4p2NVu0W?=
 =?us-ascii?Q?Ov8NuaEeeW/YcKh+6Edm96iVIP37z6KWBU3LmpNxl/sopkrQxxyp2QAlStbr?=
 =?us-ascii?Q?FVZyvmFnhB6UY8War0fK7c81ZavJ/+4pshVY14JeAe3vLG3+lDKd37jiBkyj?=
 =?us-ascii?Q?Kf41d6TDv3HaHdzd1un929MUBj18lNv8FznLzmplxYxEio2ns0dPYK44uA+t?=
 =?us-ascii?Q?4iKYIa4noJinvTTchFyIE92kpVgpu+d+TCmMXuohe1ksY5rG3axoCF8uONg9?=
 =?us-ascii?Q?2/LVqTjTuU5DMPcMLNUk70d/ItT+NbhCPLblfJpimLS6aRYnP3MAXtfPesSg?=
 =?us-ascii?Q?6ZALnlcgDV4Mjyumu5iqcAe7BBGBsAfs8AEBUWuEGqX/hBHRnYZJpe1XoSA8?=
 =?us-ascii?Q?OZwp/HiJudoQWeqSZ3Ho6PjVJ0sDeXTTyzPZaGUQ66KiVQ2R3dnN2hTDEVWD?=
 =?us-ascii?Q?VRMK8HWxYs+wTc7t43LpNr6F1cDAyZ+o/qAcfe5qxJJ83z0fi5RiEZLLJkgS?=
 =?us-ascii?Q?+SEYYNH8agYZRQyzuPfKkoD76hbOEMbFCRNAAg+Ui9mh+3h2vMRSdpOr7oNx?=
 =?us-ascii?Q?GCLdJdEAj4/nu9ZW6V87Rbp64HSoKpJoNxjh0Pqc/nsboB8okHfq1FMR2kbr?=
 =?us-ascii?Q?+hLeyeLyuDjYYn9zgDw4C0nhQ+38YwlGxWCSURdPUPTmsQgRA7l36ZA9rJzY?=
 =?us-ascii?Q?1Dtfj5Wv95KHVhi7KQkWPXJ3CXngL0/CcMyY9eTzdXDWqr3d/0+jGJdHEg0l?=
 =?us-ascii?Q?tJVJkqpptu7DUMUt+H62UMMgSxW5cqF+uDAfue1/aacdE/FiocXFc0puEi9K?=
 =?us-ascii?Q?QQCNuBoCMueZXNSmjoaX/WR9MCV1Jzlmf4VUA1JOXCVWMIRAVUfMll3RELO/?=
 =?us-ascii?Q?ORjGLiRXxARV4997wzyySEGOy/kHRoJdmQXIAM5D5kipOmquFOgmSf+Nuda0?=
 =?us-ascii?Q?lQigORuhX4kz18wN0UZY5aeY5+NqhTSdiX8iTKrKHJroiAvq02LgsHNuSg//?=
 =?us-ascii?Q?Pva+zKei8KSuWoYy43oJW7EagRUUkhIEgKq3azCFgUDmZYBf1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lm/xRQNUD3xTKP+6vXG6Ge4Qhau+jEydjfYCh0Tbsl/E0XpDZxUDwZiCyRMa?=
 =?us-ascii?Q?2GfQ5bCYuRC3p+nUm+J0PhII+oxO13dOynHxrn+BBbGsNNdCS5P1VplqpAm2?=
 =?us-ascii?Q?AOt2i6a0A+blLpicyV6X7fa6oT2yuhJlZZch/s4N7HDDq3USxGVq7Zx4lw9G?=
 =?us-ascii?Q?ffyzyA3qsHq8+1npccAyFOvhul/9397Ed+aEkZdpLkVqicUo2cfBCF3POmkt?=
 =?us-ascii?Q?tL0XJQ8SPIHBdBUveWz+gn8hVrLH1krw61+W8mzizuEiD2+6aTbGXfVLTRGZ?=
 =?us-ascii?Q?PpSE7OYpZJdJXgj6qCiIQqCx48XVoPv7lgsdQe9L4SZhlxmh+8ojv0X5KKz1?=
 =?us-ascii?Q?nIWEEJJFiRBvLh9YwPghhhShhN6RNsrg0lpP1xmzVbD/vSZpUi1y91MmwazP?=
 =?us-ascii?Q?c8wOQyaD2S2WpnOaS3TYA/DfZG/M76+gIFmG0NMgDfAZ+7ctEVMuXdg0q9qy?=
 =?us-ascii?Q?Dv2mBHRPyds2uJbkJ77/jjHPshTxFZDNpqhX7E+qHsfDPG013tNYktkLZFjC?=
 =?us-ascii?Q?A/vrMAq/HRUhJPyg8YNlvivo/2dbiFR2fkS3ERVpKwG31OaK9reDplJl6boA?=
 =?us-ascii?Q?MBDv4ZzvNI0hVWssZPMTp/4v3PX+4iU1AK2kbUFfUbvI8+FtLQJmOvZQARUz?=
 =?us-ascii?Q?2faI4VuMvWbua2V6nt67KhuO6SHWY4JJYc0eD7FcdTYpHUaguU8tFyrdWYAT?=
 =?us-ascii?Q?i1hPECAfxYr5+DGn22qN95LXBus/DQxOs50YprIssRc85d61b3QVDaOQwvPQ?=
 =?us-ascii?Q?0yxsYV0eH1slNZsUlGiPHq1nZn0qVL49YFZ+Vgi3d35wYtHT4y7yFcKypSol?=
 =?us-ascii?Q?AILQ5Or4ms7ryv9u7bYGklUM2pcNwKc5rrMgap7UvYPBdxcezio0V441Lri3?=
 =?us-ascii?Q?dY6AxL3gncVmJsUwM+Yv2VbDpC3JK/j3uxU3rSkKYyHWQ0I9zZAIJbHdz37y?=
 =?us-ascii?Q?PbWX9xvw1cEmdg8i7YTY5SxAPKKB/Fdr+TEpAj6EFogHuBhqDkgps9d+g6pg?=
 =?us-ascii?Q?cPR/v/EqYa1wL8rYkH57KOddko/XJ+LJZhGpOcjKuoomN7ghVSYQLl2+tGn1?=
 =?us-ascii?Q?znVZEEFZCjs/hKKFWU7rciKhVB/xJGJCbh2n7WHyuc8ejn2FD7MIf3WiPrKG?=
 =?us-ascii?Q?e+wbDS07FuWnY4deeN9+0f0L0dK/mIdMERemj3Q41eNtViLMdAziIGrvEPNX?=
 =?us-ascii?Q?xC8492mGee0g6KBcy8UkTGiP7d1aTtlVJk4yOrmuOTeU8AODOHBvedEHoJQx?=
 =?us-ascii?Q?Hj77LUN2pQGB9kTDE2GhVNuLHW9nhS6rtqfnzfVnFC5I1a2EB16uQsphPkHb?=
 =?us-ascii?Q?FtrM4VmNmKRXE4qM/zAHuoTKZ1lt7/hFHTMx1KK2yZVg8du21FJKQjaEf75e?=
 =?us-ascii?Q?YDgz4qzH4EJ/3Vj7nk40jcfALWS5alw3MkkeYscDVHHMpmI27rxbPvhdhYWp?=
 =?us-ascii?Q?nAdt8tPr0n+uyT1H6c8dBgw1AW0RmMME7d82pZVFze0K5SzYPjhMEZ90+vtP?=
 =?us-ascii?Q?s8sjj8dIsHyg9ZIq2xZJjYgFJQAHC2YdaYPX9waBX30nKKj+F7DQKiSgCANt?=
 =?us-ascii?Q?yvk5Bul9FtUuJN1auoWmsZSAv0ZL9Cwm28toyJCS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524fcf49-e538-4306-8abe-08ddba829b47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:27.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z537VjXjFMzj7nLGc81YWRu0zIYxb7pW0eDupTwyuy/pD/7x5GRLLgHYboW8Bvbd3WhbKgDJt52VdBGQgZNUfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Add a new flag HMM_DMIRROR_FLAG_FAIL_ALLOC to emulate
failure of allocating a large page. This tests the code paths
involving split migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e20021fb7c69..c322be89d54c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -954,44 +960,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			goto next;
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1509,6 +1526,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.49.0

