Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29922D3A88
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582442; cv=fail; b=ipJY3eU/Ze35Viep8Yb8jG8E3FbIeexrT9JZxyRB9A1Q5Bhu6EbuRSPbJIqXG0fDFtK+1R9/INsxuCN/FyFOapxdmHst0Ls5WrHNbCzj25yEpSlyxogdR9QSklUeuxL/dAJvy6TrrhARXHWSqH8lcKH0Qku4Ji/6UUELHjw2o/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582442; c=relaxed/simple;
	bh=Bcr03Pj9FztRKfCZNgrPkyhUt1m4OZEnlsud8UBMOFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YZwAAqlh+9FTldjYbdZxgsyrnBpXGyoW0kp1t1nXf/wokpliVYl98hC1UtNfeMTE4be41Gl6WKOdz69jthyyquxFrVPNDXtOuCdN6sZGgmDxh4fq5AkcMJcouBDqXPANyvY8wmqcAy34v7hhqlBwifZqAYF6xTeso/NFQoGalt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bfNVtnFZ; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bfNVtnFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxJC0xpWS9M05xXdHiOOyZ6SnoAqYvs3iMnwRYXf52ZZbVdv+3fRM08WdcBTrGq3R2PEUFdjvbVDpflfUusJWIW5z8CuRbjNYAfVlPaI7gBa0AcjM1gFmT0qYcl3mQfJ2a55XO8uSfPlcLiM1NfI+loOMKXxQgiPeaZyq+1kkug2Gwev5zC6Q0V5tKV7t/PihLB/vWoiRzGsjAMxbb+hopsw1jqYtZ8YajCy6hOuTnEWzXViWA1j/SVEINU3RuO9G15gSGZ8gnkuxLK9po0jnUFbr3jlOdOf3ugJtIpZol9nBhRasWAWXvCJTXxv75oUs+bPatM4aL8QcEHOfqbF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pYgBkCXeHj54sf/gTeBx4IJ7tlpFTdtckLxFpAIc8s=;
 b=GXqdiaETzfhz2tWZ5sMTy2AP1F+ZRcesAyxxEdUqM38ksu29/Z/ROLpyRxO60OvHCQniFguL/n62m8T4vs+uWBOOejvJDbihwTEIf7oJF0ZPeTnJPfS46VwNzfYvPgADXaDATTfJ5oRIbOhmodkWtIXm22SkkM9+SbZUB9CI1CjTt4VZ7etKf9tHA/bjFRNqTR5ZNYiUNJoJCsDI4RfCOzWFfm2ZR0dS5ccrWirgvZs0KcGFMQu1y9b4maITaDk9GEHH2wuiiC9Sb3cx0Lb+hBaYP87ayPCRUXS25dlLcOmzw9Zeu6hwJX2YitL1zXq0NbQBDeAt6Jjj8cGio10nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pYgBkCXeHj54sf/gTeBx4IJ7tlpFTdtckLxFpAIc8s=;
 b=bfNVtnFZTCvzdWMFQur2yLQEQma5cjbNwhoGM1Rx6Rv+1xj4l1n4Pp4VartzL7Xmcutp/meYFzvQr1FSKXyCYMYnX9Bx9+4qOl7u0hGVnHvr7jeTIvNID/UyT3eOgJZQjfqAgAOLEO0CQ6MEjDOgPTaC9wvgD3rbxZQSCieQRzHqs10+Jq8h9eNdjVAhGEflkXEH+clab9tip4MEoXjxTu1B9VVlVxIBiO0MHzgV0hDYiyAC9DgUte2cIvVHKnGQhWTGNRHVesjBMuRzEcUTwUvuQp6LHS5NxhmxwAx88lBlGQoheGYACKdIR95p9aQA1wJed6N/dPTmSTRPjIUnzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 3 Jul
 2025 22:40:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:33 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 11/12] gpu/drm/nouveau: add THP migration support
Date: Fri,  4 Jul 2025 08:27:58 +1000
Message-ID: <20250703222759.1943776-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2cb49c-1b26-4dc4-5de9-08ddba829f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oODFlJ49clkeUkvAxh2M/UhnnUoJb3W0hTKoSscxHFQG9qdZ+51f2/6Bjt1p?=
 =?us-ascii?Q?A2JQOJMMjfOKL5BXqvd5GAc66BgcyDZBfkgb6+Cm+KxzUIO4Wzl/fHIIr+dl?=
 =?us-ascii?Q?9TM7gLe+4sYtbAKwkvA4FJJJdVvZ6sKWwMVwYCGE7246uJQ5G9qmVX44IJsE?=
 =?us-ascii?Q?vVGMYCsQY6+upa7iJm2o0qIwWjL4aEvFlp2xnQcPB1Vnm4RVFpxmY3kM5vv3?=
 =?us-ascii?Q?zaKhnerAQDA2f0w0fv5JCcBI+AU2LHxNSnWeOZKT4dreFv2vyJn2xU07C4YT?=
 =?us-ascii?Q?9vQgjHc7LsdAXbRm7sKJR8AhWemyDT5mtPztNFlB2GLaKqOkpETTM8Su4oBd?=
 =?us-ascii?Q?L+FxJWPtHIgCiGddveLAs0jQlKQqSQt1g/lIU4TJpPfQIag/bjHBMe7+1q5D?=
 =?us-ascii?Q?jsWrvS3S6b+yefks5N6d9IY5U4ZWqMooVatDtqqbQtUyC2JpI9SkksW/WhpP?=
 =?us-ascii?Q?mDJCjzpxcqIlx/KSZ97oU9Qst9pkfNM1hUTm3D8oeSZRgArPP7CwHtufEhVZ?=
 =?us-ascii?Q?aOvo9+jFIGtDjIqPmYsYru3EaUftHT0wvsLPB50fjnL23jmilLGkNkpX+nMd?=
 =?us-ascii?Q?mhTzHqDRUAxr67e3pOsBIkqlDoKoPPLkiwt+FRW1m6WRA0B5UE/C2ISSLPD8?=
 =?us-ascii?Q?KdctNDRQ1y8nqRdNlzNPFCkCNRz/S/RCsjw0cX55U+0WWYcc4jfSLSjAlGPL?=
 =?us-ascii?Q?7h44CbFRxoUu9bUc+0+T0obkO6ZhY588zJxgl8oJMExD+DXtdBEYNuBkrPaa?=
 =?us-ascii?Q?7zTpwkuV2jHBwMNsaoT2LhtgN+CDape3PUvXgKBleRlnhCGCuyG7/OxB0C9P?=
 =?us-ascii?Q?eSJar8LeeXcaMAtlDwaUgK8u9YDeTv1+fzIXEEBG9Iip/SEJeCTGlVvDoMYc?=
 =?us-ascii?Q?QCb6s5SsiJNG6xyYWJQL2Obq+B+00AQ1SZMGCw04iZ0Woq4Zdcy3eejyMnVJ?=
 =?us-ascii?Q?rcrkmErB6EWqSITCnig6ODzcI5n7XNI97Iak1cvVtrnDzZ5Vz2o6n4VVTYmQ?=
 =?us-ascii?Q?a+I2ZwBSSpDFqh4/08xMrUYwUAZ+nP+baWklV5hecE1s6J19kpVOwUuP76jM?=
 =?us-ascii?Q?/4Auu3Vf37kV/krN9jCD38jfYlF84Kpz6UzoXs8BYCBysjbDpnnU+2EMl2Ye?=
 =?us-ascii?Q?G6QoHieS9daRrLTh63spLBeAYNV7kG5EPzfNs0cGTz/AxNhrHwR9bXvzqwJQ?=
 =?us-ascii?Q?0FAIO0qQX+waCOOD5NFDYfEKwke4rMHMRFmT7gVsKET8NpWoEs/y0X4lF4s1?=
 =?us-ascii?Q?YewyfeRmfwC3BUlVc+RYAh4pZhjbzPJuGC5ELQlsDbJ5XfgKCvbEL6lGPnvN?=
 =?us-ascii?Q?33H2X+vxtcuMtOOqklaTaBUwoAUnOtjim/7Q/aRaIMUFaZ9Ea4X+T/fna59v?=
 =?us-ascii?Q?WC0IRLr/4LeQaxEuPwWifRfdJM1IbyeloOz5udS5YN8PqUO1vvjPX9eMT7if?=
 =?us-ascii?Q?CWd1BB+BTRM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HMYMt+1kcl2h6USjFSRNPIVUunfDFG86ZzfEFQv1zRXJOMvmPHhwRpzV2R9P?=
 =?us-ascii?Q?VczNMhOiTL0TDowjhR18G2KvbjrJHSelKexMRX+8Pv2m5LZFhfpugSDe3hYE?=
 =?us-ascii?Q?wwK3tG7baesdZHk5w1tt9CbGRnpD1mQ9Q9/NftNpwO5GmyAla8Hk6SBaveDZ?=
 =?us-ascii?Q?pW5jl/hgWoNw89cWZa4UmCkupcDP85PafJse1M+nnZHY5iYKfToqlLLSxCOs?=
 =?us-ascii?Q?WkD32w6mSk+S0HxJ73T/ZaDwVCUzdnBrntzno9gqsiCUH5GDM2umMTRVHqoF?=
 =?us-ascii?Q?67I7ju+eBeku8ufiwbJeYwOrko74PbDGUycruinUcyjFvPVhu3lCg1qptN5w?=
 =?us-ascii?Q?9g0mgj2HhzgYnhFeFZZ8qMnLu/2m54cFvsneX6lx5GiZpcYxUFYYF9CoEGfC?=
 =?us-ascii?Q?VT6ky8L69tX/Wl3dlaHpMn8dhpUF1wlia4eSAwJKBClN3fVSo9BHo5U4OfOA?=
 =?us-ascii?Q?vqkNN/nWU4nmdvilTsXWLJENokcBfnXyfOiR1kJUZANFyak9ijkgyzM2oOfa?=
 =?us-ascii?Q?wPqW5GpdpBZbjMaxHu9HzmS0CBoPyUkzTlPE92PO2+Uq4UDPLu0e/vCAKvhK?=
 =?us-ascii?Q?CDeOwbhPC9ieRZW+w3ozicmjhJ2v/lCvvSD/lM9KZneHVbfPDN/nFO4W2IWJ?=
 =?us-ascii?Q?jhd7a4CETmX5wxMvg77tEQAiE33rFmKxrcXwrQMIs7E+9+H8rcPMciOrQt9p?=
 =?us-ascii?Q?bkJFlYGPGQwJdo7ftdZoD+bZk7bJn1KWp+iPp3/FTXueowb24AaMXjhbcq6R?=
 =?us-ascii?Q?+fSk198FU/D2e7nvfTSwQGB4uZXy2tBuJdNpXaf7RL+pbEkdCgnd9/W05Hng?=
 =?us-ascii?Q?41UYlk8BqN2fQQ5tDKLANM/BhVm9fkOztqiocLZWovR0vqffsaoUUqq37QNA?=
 =?us-ascii?Q?icOubWWMBYh5z3JwGmSl6vtQWzHwTDrfIVWWofoIIugWC7iy4Ldq8aUMQgNh?=
 =?us-ascii?Q?ZGqaEqccRTebPKMGzR8mwCSUyVkq/bn5mUy0VX3Nzs1kvp4K4pfAaA/zLUGm?=
 =?us-ascii?Q?J1MfxTT1N9mxtloExxDxogAjUMUwZ3LzuHsVODr1rqR2kK/cMRw8BVfFW8Hb?=
 =?us-ascii?Q?o++D6yC2zX8QRN5PaCPKz3CKoXv5U3Q3p0BbGLVmjWTCcVT7s/GxirIzZxhk?=
 =?us-ascii?Q?rpGGEDkptrt16a5Y3tdmi5XjeNz/tHPX+uZO9YHAj+58k2tGktgUXLjxpAgX?=
 =?us-ascii?Q?hy8e0+JFSNRI9G79euQCf0xRwbz3TX7VktodxeoJN1i0v2BU+6zZlodqqNOP?=
 =?us-ascii?Q?N1OgHKoTP6ZnjiVGao6CetLAGLr+esqOb9VundQXhKtY01tn4+Y6dptCjwPd?=
 =?us-ascii?Q?PZhWz1+ofe/JBQnkF8bGCNvIGE1xdFjDLjPIaKeI1BQHhyRl9VunPqyc+E/n?=
 =?us-ascii?Q?I85efwRplIxaLaQAg/z0b1VAn3HdNXklfOgY/s3vlvXeydSBTcpdP0jramWG?=
 =?us-ascii?Q?yczXYE6oqIM5l6SYJAgCPQFxqxm/7wD7wUuw5AIB5sj+Yalw3EXwDN/wpfZr?=
 =?us-ascii?Q?uCwpfR0ZluUxF2BrHB06JjOyceLoi08SbjhqQzEQJBIpciLZZOd/nR90n8uz?=
 =?us-ascii?Q?rE2hUNYIORM2OjXgXgLlC45e5Pq67Jax17irAcOa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2cb49c-1b26-4dc4-5de9-08ddba829f0d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:33.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOQZs3XZqFjJwjpB3WIAc65ZXoepWQKMqu8osIy4ouyzgUvWkMDLTY2ppHB/ua/gUXjvBP9qmodb7M4+THf8aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Change the code to add support for MIGRATE_VMA_SELECT_COMPOUND
and appropriately handling page sizes in the migrate/evict
code paths.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 178 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..92b8877d8735 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -83,9 +83,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +118,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		folio_set_zone_device_data(folio, dmem->free_folios);
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +151,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +185,38 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
-
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +227,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,19 +256,33 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -274,16 +331,21 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+		for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+			page->zone_device_data = drm->dmem->free_pages;
+			drm->dmem->free_pages = page;
+		}
 	}
+
 	*ppage = page;
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -298,27 +360,37 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		drm->dmem->free_folios = folio_zone_device_data(folio);
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = DMEM_CHUNK_NPAGES;
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
 	}
 
-	zone_device_page_init(page);
+	init_zone_device_folio(folio, order);
 	return page;
 }
 
@@ -369,12 +441,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -382,17 +454,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -403,8 +486,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -607,31 +691,35 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -645,7 +733,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -655,27 +743,33 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
 
-	for (i = 0; addr < args->end; i++) {
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
+
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -689,20 +783,24 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
 	if (drm->dmem == NULL)
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		max = max(HPAGE_PMD_NR, max);
+
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
@@ -710,8 +808,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -729,7 +827,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -738,7 +836,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.49.0

