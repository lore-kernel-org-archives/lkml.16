Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DDE24418D;
	Fri, 16 May 2025 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747368863; cv=fail; b=nR+kiQOdFyUva3MQfqW9KvAdFnoPAKTxravV5SjlczRLHcW4DDmYiDTdKcda66uegX1oWD242B+UvDzpccGbDR1qZ8Jf0yP5n0jtrnwfWcnpsSARgOrM05s8fNubA/vdWOH79CEKhWqVtwgIcYvsnE2LxQToh7S9mzZHiEFlhq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747368863; c=relaxed/simple;
	bh=1AjtO5kl4G7v3Tg3m1FjFv3umScf9tEdVP9Jp/fcMNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZv3phdFev+KVVXDX0O4ajGf+ympyG4CgXS47UKp5Sv1YDtO6fW72L3FFNiOwu8CxjLWLHDV+Mi8la2XxHmSY+6a5fY7GCcN8pButTPkmWiVst14tNLvbLz+hv0Y59BFrq6ZUa2DMJVIHJia4uc9htD3l/Pu0KbLsk7vZz4h8D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=cqyhaIvc; arc=fail smtp.client-ip=52.101.57.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="cqyhaIvc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ah0OLnFj1T7rKTyY4HvTj3SAkJmHJvNKObWWTbe1XhRfNVFRjpmcRKyNeZ9pGC/o1/Z7mPs52RkLdcX5Rp45y/keYO3vvv5T0/gCkeMj/z8xr8/K4pkcvqyHRSk73rhtbc8Em3TVVeQouhz04UGTP5uGSmperTuExq1zTosrv94BRIcRawvUxEirDxGWs5PvgqiqF0iGq//nYTg2Xavl8zvYlxYWlOsHP7tU3iuUy7V5FnKUCRq4V5y1cfo1ScgAdR067QnLgGlm7/PrF6kJwGznCFye1+dysRpvER/75X+COc4UBmh2om/tLIfbXqXtG9rcn3fjxGmt9Ud722HP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1KKYBHCCuT6EhfHLiITzdAMZ27KwKJQpr2SReN2r5g=;
 b=nTVSfOW1aBPC4Ondh3us3XG5pB4UTNz4uR8V3kjLSCc7c0dgXVMOqepipEj5LOUhOVz+E1CH5yDjz3MK/RUsgn4c2hWCgYEJzPZMudjWeimSxCjR3jbK27b2zFwRaXfa4w+39+U2UNvgvc9NzzH7IBmOZm+TdpzUGW/mwxsRQ3BwktHBejqXE+pPT0UaZMceUyAs31bRtzmBaJyAeuJTiEkkummkv34ktEUYUI8HSuAt5HXiBF+l3W9SFErhGvkFjXdoFb1KhFnuuY5FU4ih2S+x5XjhJivpxpKEPoDODy6RBSQqCKu2SyPSSbGAlNu2s5xzd5bfQAAF/ykgndRzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1KKYBHCCuT6EhfHLiITzdAMZ27KwKJQpr2SReN2r5g=;
 b=cqyhaIvcVgQg0JH2O5rrhcnahTVnKldlQkCT7uRsxBaXRTbEywPlMTr4VFvA7zy9lCZNUMjrCzx/1kU2HomV1ox9lDCak9kijhw80R3sp7YC1rDCQGJw7H45OvETZ/e2h6kgKExNY8j9jHgiIJbx//hJ+TDpfnpXxSxKl9ujznUEjcaTE3cNZNhWvdnCbIY7wK2Xc42k3kzUOEwzGHajkXwImCrkjMehg41xfr1HNIuclVnA3tUqBJpwOkXc66aQHL6Sbpjd/9/VuZNlPJrh7yEYn2JoxUC3HFl6JufHnpGAGXOBq7TDlvf48KTkZQI/C6hpoxakpYlazpFKs/Dwgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 04:14:20 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 04:14:20 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [PATCH 3/3] irqchip: gic-v3-its: add support for 32bit addressing
Date: Fri, 16 May 2025 12:13:34 +0800
Message-ID: <372f059069a5551ea1096015f855cc306dbd7cd4.1747368554.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1747368554.git.adrianhoyin.ng@altera.com>
References: <cover.1747368554.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: e26f84ba-0789-4d6c-2203-08dd943021d6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fhQmMGrYbhYHR4zmRWnz2/F2UNatLdYPWaRUhwsZo4K6ueLSCcJYT4cuIJpO?=
 =?us-ascii?Q?cIDJxwVBNxsSzD0YiIKwNwGOyjy/5u8uHeMHl4M+185GOfZv3SVvtKwZ5i0F?=
 =?us-ascii?Q?jVXhWYfen3khfAspjmA/vdTTSE0C43QnygEdoR5YXnY80dzsWw4o9tDxTYA3?=
 =?us-ascii?Q?EcnJvPIsYk5fjZEDrgC48ytm+jQIjil4nRkDOsrkrCoHKLL/zeIjJekdh++K?=
 =?us-ascii?Q?Q62tErOFsoQQeJ8IJZX/Dxqeow6jfF78QSQW3dNiCDc2SWNYtDBid8vv8+PY?=
 =?us-ascii?Q?0b7F1yxSwqjOZ6x0cIkd7zZ/hjynt2L3+UX30i/lJao/ccad9MeRhcfvz6u+?=
 =?us-ascii?Q?/7mtnzqPYaZq3HJeM1pVSeMbwfdsBOPVNkE/KxhJPr39B7dzbbPDF0DsPbY9?=
 =?us-ascii?Q?W+oGEmXmqotYpLGbtljYH0k+22uZ9/uhW1TUz4b0zeQe8/iaMcw3RQNAjJLx?=
 =?us-ascii?Q?2r9FQArkTi54d6zUM7iVaX0rWT9rVqolfWlQZgoY23cSj9a24Y/FbXC93/mo?=
 =?us-ascii?Q?UmnhtNeikOtKRzslNrtQ1IKNE+KTLDHlY3OjxuPDQSuPxIfwQPNWP131fQWF?=
 =?us-ascii?Q?g3O1OInXgD03IwkdlOjJrVt7qWClDzSX4e55KLp4GMING5dj3FLZP0h9ErPr?=
 =?us-ascii?Q?GJuhS7fnydXQvnfyYMKnHjDRjQriJaTd4qFgVUsDbGHSyeGbOv2tew7mnWcJ?=
 =?us-ascii?Q?0kOQTKi0rqafk+NRBGu9VyQxMKHaU+6eWVQE81p5FM/FLzz3RBM+NkBWOO/I?=
 =?us-ascii?Q?PvJBID7DJR0pm4z9OmxpF/3lHQSHSG2iM6cx3Qta2pN2nEk6+Tsc9dQBNHpz?=
 =?us-ascii?Q?nvNfSSl+43ucl6ddi7Ux4svxJNMNEDCsaaqOpIkrSEZNbudMGsMgaxZw5TLT?=
 =?us-ascii?Q?nmdurSfVnNawwK6+kyuGZLc2S8Rg4HX8oSI4K+lmXXdgidiCmQMB1i1HZWLc?=
 =?us-ascii?Q?dV48XAkqVRFlzSgoqCW1Qn4xnQOq8p7EfXn6h80kHyg3uA6Kn2ElWTgn0RiD?=
 =?us-ascii?Q?rWXNPl2JAtkqvQ+50g60jobK3DonHUQJWv+rwEcJr8rY1CW8uKE7ADGFuIa3?=
 =?us-ascii?Q?DllW3/+4aeh17xtypIQDCq2J6PnOGzseFTZW7U5G4NUyatJORtvp+L1GcTJP?=
 =?us-ascii?Q?ESqaQ9MrHi/I2jjTpxOb/7qeqcYKScPnuQHGIgWYbDFltkV/lFDyZe5g8AJp?=
 =?us-ascii?Q?XIA9V5hq2KkArqjLTdMdr3Vye4mu7CNvpZLa0oXMyu7ikH0qiOyHp6ivET6t?=
 =?us-ascii?Q?2mCIvhMy+L5tuivKmxddroqEn98Ey+zPQDdrtrAIfZQwq5aEfrz6n045pFSu?=
 =?us-ascii?Q?hyvYOVkPRSp0iJJKMmXRVJ+zfC6vTsaz0FFpKldy318hkUUnMfKSD1T2BFJ5?=
 =?us-ascii?Q?vcQjc5Kq/MhyNw54LZ+B7Ts7f6DY/kDFUs/YBulb6kwE3cIBa40vmrMFynWM?=
 =?us-ascii?Q?t88QCbxNuJ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hL82ehgOnuYHGg5jylo/zc/R1akKGcD2QUxvBZFfYEdYlBcxjoZEjGSNf/Ri?=
 =?us-ascii?Q?4zHxlvlkn8LX0dsi0sXZrOB74HEFn5TjluOAvDl9OlO8q2JDetnLsMkz0CzC?=
 =?us-ascii?Q?qlCi0TBe99S4uuz6pRdHEe1agXPc6wZpNkVUQGZ7zhwjMDuiqUzo9/BFi6Vi?=
 =?us-ascii?Q?njs+RagslFW2jIAFy6BYHwbw6FYerYtJDyhIGfIfo7TRS0Y/B8BxjnSVfV9q?=
 =?us-ascii?Q?V37xp7SEQUNCITLWx3UZkIy+BAu2UK1xlUIJ+shTBdlaY1CwFYdpV/OKKkwR?=
 =?us-ascii?Q?JhZ9qXpRO17rEJ3IJ4FC68TFreGI1BHoAH8asL/ZFrnS6goNzMc9b42RCdNf?=
 =?us-ascii?Q?L6v84QmDvaf192u0LULjLkEphvaqcupZKAwo89G1p2GPOIHyn/BwiokIAc/5?=
 =?us-ascii?Q?qPh4cWa40gWhTeuebz+HUh0IBQLSm5i5WZRKKN4OUmwo4LLZfbMeHcNv9952?=
 =?us-ascii?Q?XW6lDPNAgjm0DJL48K/IHCLqbJa1t3ZhAAQevpEdxDzS+l3IpOWtACc9QEwv?=
 =?us-ascii?Q?y52t9GbFberEWDkba42PAuklxJBCt8HnOB2a2YUuVih1+9OMkP0MfmMAOEhF?=
 =?us-ascii?Q?AvBrndBcA7MZ1S2Vuz8GQ0mrGUt2M8ZQ8WcPA2cO9vc4UyVsZnjgdhjbbnyv?=
 =?us-ascii?Q?uqLHLSzaARDUqapf9QynEztCFXiYZwwQ1dYoeYnAJeekfMVseLgihTJGwUcD?=
 =?us-ascii?Q?Hsm0BYYnk7kozwqbLoIIj79JkHbVIY7APgDdlU24YFKnIyTpZZe0xmMYoJF6?=
 =?us-ascii?Q?i6/rbPu1hftTTxM0mQN2edF3SdhE7W/W6pe23+y3wqFwUzLMO9E1cApEJab9?=
 =?us-ascii?Q?Fp96wgB+TX15ruqbrvWHAUMdF+ffPSivDvXaaP5EFJ7ekTFSZ22nZ/TWLsUT?=
 =?us-ascii?Q?o3vEoIThXMWI4A6n6PfH8tWGCDhJzZnE9Alg/R2vf76AfH/dlpbAgFzd5nZu?=
 =?us-ascii?Q?N2DDLcYo/iCgXhUMe8CXKpPZLIvWrUV3j3K9myKH4K4ih2S3GoE5/4WGECbq?=
 =?us-ascii?Q?EF+gg5uuQqQDOARZXqTIJI81B5YVeKbEmgiXv2EI8A//hcNMYguYXm9ndkrH?=
 =?us-ascii?Q?LmlUPgqXfihuAJbioVE0nXIBSGfnUYffJPBKEJ21whH25Xn8MW/KU3biIxQ+?=
 =?us-ascii?Q?LWhus4oXRL4rhLD6vcKZ2xoHTj/dr8TjVnRhuhpjnllISyo1zSIb9PsgqtIa?=
 =?us-ascii?Q?ck4pBHf8wy8tNIkqO2lRGJskfrW8fdTvKnsG7tH4EnwNbLBIqcvF5+k648vg?=
 =?us-ascii?Q?knha8PtU8flBH7M58Yo6FdEKvQsuoeyyLi43riI2IagqLQxJbKm9yv+jNScI?=
 =?us-ascii?Q?ML7KtuxUnUhGxmbjRWD1Z0IxgHGLZN8Rj040O9nIsV1+BaqG8a1cy/IMnEOa?=
 =?us-ascii?Q?c4nQ1+1C3cb1AEgFYcd+KHfRXhuDyrevx2EyEZuspO1xKqAVm8/1ZMu0Alhd?=
 =?us-ascii?Q?dmq7ziF5B8DCfwtgiN3KZOpuNwUpy3UeHTGcc3im2nDxkXGd4dWhOoH9wDaJ?=
 =?us-ascii?Q?AXPrE8vFDU0baVGvT1ReL+8sptbZV5Gru5+NPkyz88lM61ZUxTHsxzIr8h02?=
 =?us-ascii?Q?qxowPVBshwdSF+bDpiZL9EnoZcZlvvloZ8DuwmtvkrAgWMIuFrPmIrBSRSZk?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26f84ba-0789-4d6c-2203-08dd943021d6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 04:14:20.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REhVlRMJe5LPPY561uaSXhfiKxr1vWxJ2K8HLPnZBeKFm5FrITEevcdaeqOGXcsXodGvSxjVa7AP50nfKMuGylbB+e3dM1XNjRVatdqlAWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add quirk to support limited address bus size by allocating buffers within
a 32bit address range.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 0115ad6c8259..7ce40b4bd189 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -54,6 +54,7 @@
 #define RD_LOCAL_MEMRESERVE_DONE                BIT(2)
 
 static u32 lpi_id_bits;
+static bool dma_32bit_flag;
 
 /*
  * We allocate memory for PROPBASE to cover 2 ^ lpi_id_bits LPIs to
@@ -2385,6 +2386,7 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 	u32 alloc_pages, psz;
 	struct page *page;
 	void *base;
+	gfp_t flags = GFP_KERNEL | __GFP_ZERO;
 
 	psz = baser->psz;
 	alloc_pages = (PAGE_ORDER_TO_SIZE(order) / psz);
@@ -2396,7 +2398,10 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 		order = get_order(GITS_BASER_PAGES_MAX * psz);
 	}
 
-	page = its_alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, order);
+	if (dma_32bit_flag)
+		flags |= GFP_DMA32;
+
+	page = alloc_pages_node(its->numa_node, flags, order);
 	if (!page)
 		return -ENOMEM;
 
@@ -3367,6 +3372,7 @@ static bool its_alloc_table_entry(struct its_node *its,
 	struct page *page;
 	u32 esz, idx;
 	__le64 *table;
+	gfp_t flags = GFP_KERNEL | __GFP_ZERO;
 
 	/* Don't allow device id that exceeds single, flat table limit */
 	esz = GITS_BASER_ENTRY_SIZE(baser->val);
@@ -3382,7 +3388,10 @@ static bool its_alloc_table_entry(struct its_node *its,
 
 	/* Allocate memory for 2nd level table */
 	if (!table[idx]) {
-		page = its_alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO,
+		if (dma_32bit_flag)
+			flags |= GFP_DMA32;
+
+		page = alloc_pages_node(its->numa_node, flags,
 					    get_order(baser->psz));
 		if (!page)
 			return false;
@@ -5227,9 +5236,13 @@ static int __init its_probe_one(struct its_node *its)
 	struct page *page;
 	u32 ctlr;
 	int err;
+	gfp_t flags = GFP_KERNEL | __GFP_ZERO;
 
 	its_enable_quirks(its);
 
+	if (dma_32bit_flag)
+		flags |= GFP_DMA32;
+
 	if (is_v4(its)) {
 		if (!(its->typer & GITS_TYPER_VMOVP)) {
 			err = its_compute_its_list_map(its);
@@ -5260,8 +5273,7 @@ static int __init its_probe_one(struct its_node *its)
 		}
 	}
 
-	page = its_alloc_pages_node(its->numa_node,
-				    GFP_KERNEL | __GFP_ZERO,
+	page = alloc_pages_node(its->numa_node, flags,
 				    get_order(ITS_CMD_QUEUE_SZ));
 	if (!page) {
 		err = -ENOMEM;
@@ -5577,6 +5589,8 @@ static int __init its_of_probe(struct device_node *node)
 			continue;
 		}
 
+		if (of_property_read_bool(np, "dma-32bit-quirk"))
+			dma_32bit_flag = true;
 
 		its = its_node_init(&res, &np->fwnode, of_node_to_nid(np));
 		if (!its)
@@ -5811,6 +5825,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 	bool has_v4 = false;
 	bool has_v4_1 = false;
 	int err;
+	dma_32bit_flag = false;
 
 	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
 	if (!itt_pool)
-- 
2.49.GIT

