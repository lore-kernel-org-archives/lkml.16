Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CB2C1580
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582428; cv=fail; b=uNqvOlvREy2ugQkYMiBmrTQgPsmeFW1BckNx1REKNCnuGvpi6vB1MZ/7yhuRzHeizjJS36kskCrjhxijLdSTRHVhmqWoLXziqFzodgS/EONgYTzrshdti6lUo5VLxrvJz4Ie1RfTVODXgp5WvIC5iYR53BuPfLttb5NJzMZetc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582428; c=relaxed/simple;
	bh=r+Z7cZ+XxLt3qmpq5JoSVagqUtBLF5oJXCKUeXW8/Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fK6531l6IjHElI50kmG14dUtMu3HJOidU/zpUXH2s9d0/qAqTKGW7cQ/k0MObrzXd32NPrxqM+q+RxFMQsq5JNmxtSyoxhbVrNnszrtdgmQ8lIC8TvLGghp6moFgLeGDbAFEOStEMBKBMmnf3JsL5zncAP6lCNXvQ7nixVniHQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hdj0925G; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hdj0925G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DauFh6HxZ8gj5x9RFrtb7IzXtnSD5Ol929QMEHecvF9AIjGYL3ZMf8gtp3IEIxAKu3TqqcQ2kRg1MQpNvyVnnF2JO6TkIvMh496EakUwCDhJCvimf7DkJ24CnhR7A7Aik1KF1IoWvJrD65Drk8ASoauTdkNJ3/McuEx0u+TY5Kbp7RsVQLKwKRwsY0nf5mP8WoJ3y859EwGVD2DbNXq5deUTbvvTpW2APXhJa3gnXfJC6B8GFOgU/FT9yXhrgIrEKYpbBrZPRrV/hJ0eeN6IpQtiUjVSx0zUNqNFlpuQliyxfktN4OhDMu6fCTN3CbfG+XkXGaxVxkKZNrfr1HEtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYCjBOFJMdCDVks5MYjWHx7YqqLzxb2X8EpyHpjwOuE=;
 b=UzzNqQoCoxRVp/4+8Pw6RaLADctrXmXVKdQ9hbpaBbSWfIacnjxYLGz7jyIkTG4mMvJmvLmyNV7ZcNPjN/qmXaqksJ0WdeBLVMidhtc+o7OELsC/i6uYc72P8Vu6b9Va4s3l6A3sYCuDBKjTtzquZcZDc9nMnpwTQFDx88VMAXMJ82RYWfD5y0XAMeSEnjaAiQnAJ/G9AHfD6GzT+Xuf+hikk01PdmCcyFsiEtLmkOD3cg+9WLK+6Oby32fN7/mKY7WMlgYwDz5FB3QqSe3kV0DEsSztwK+ng0zeExciUVGFqOvC1ePKsA9NTOgCy164VO/JS+OpfF5Su2mxCwxC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYCjBOFJMdCDVks5MYjWHx7YqqLzxb2X8EpyHpjwOuE=;
 b=hdj0925Gtlsey/J23oyqs3vpR0+/CSxBEfUeLXrrzpXNSutTikpSjcRG4xjR824NH0qxymnty5q3m7uabJZ9i87AOa5eZ56tvqfej9OxWiSYtXgds1xgz2oIN/Yq2w2g8YxyWWfENlpN/dMQP4A7bQicDG2rJkvf6G5TpGzNh0rHig3Y68tNLII86j6+HdhAonUWL4lAP4I3vlTYXHu0Tf5BP6k5s7TMm9MOvIVzAOKjiA+uQMLFKeiWVY0J4u0foA+kgL8E77xdpAapdAluCcse4fgINuv0I1P1PpRW2aKhLpjGZcO/Vf2z9GyDkjeY7+Q0STIoAWzRFnhSbf1vCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:21 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:21 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 07/12] mm/memremap: add folio_split support
Date: Fri,  4 Jul 2025 08:27:54 +1000
Message-ID: <20250703222759.1943776-8-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:806:21::25) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 68396fb0-34fd-4c88-f2f3-08ddba82978e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0+C13XG2VNtDgNLu4yC+93WD01X+4w8FywQX++2TSzqpzQ1VJBiEdHlsPT3d?=
 =?us-ascii?Q?iRhsKQgddsOgX4Pdl5Ic0fshbf/2hahQY6iukf7Uc2mPUj02TZnLgzXo2wCx?=
 =?us-ascii?Q?WjwBnMbR9mgqFXVyf7pbAVhAFWMKaIlf5+BHnzDnLYOxRZevuBRSBM5X6z9B?=
 =?us-ascii?Q?gvPu+6GQlrpbYkfX2xMmjgWvB8l8ltrZ0mLUHWvmuY6fD/cdlVCg+RE7ITXJ?=
 =?us-ascii?Q?grz1ixhUNvNuGC2d47bqLYgCvUrxw9nIcfkZYp0U9G1WmLY39jlIvx+aG45J?=
 =?us-ascii?Q?KJrEyshF6rs5fXxaUsXnzWO/aBa4hu1tYKOFd8pJ9/bAH0t4bBDafKkBfuc/?=
 =?us-ascii?Q?wFqUl/tmmlmlmfKRuGREPEgr3xhZwYgaHhXNfOXx3f5nbfuANHuim5Ok5NZ5?=
 =?us-ascii?Q?u567mM5mJ9W5qARwa/lnVQ3HVGxm5vuaFqxIN9FCZO2MdrkygNDfKPt03fUx?=
 =?us-ascii?Q?nGycnL0WwD2r8um09pI95zy0qpjpJb44OA9FDxcwdmWde+t/XQd7TIU64Lt8?=
 =?us-ascii?Q?QpaoC4MN/IzpzxwYf9ValdlVHSwkotXxkFXaZGPm6cNnyO35kskYWHVGX5I7?=
 =?us-ascii?Q?rtBsNLTC/2w0QDru9Be9si0WHLYnjcKkckIOmBPyaMEysgagDAtl6Ks2eQqQ?=
 =?us-ascii?Q?gA10bTuN/xivoB45Gv678wG/OeoZ8rRTjB28Iw/c+lJu8cooRXDeaGTPGSbX?=
 =?us-ascii?Q?RB0a3d93Zfrrc5rmHwOZI2h8SwomSqcescJNuJmZnlkrsNGV7JPpu0p3wdDS?=
 =?us-ascii?Q?gDPyyZvIKkRm+kUpv2JT3leGnGnTMu5OYpCOOEemaOQCZMS79Pd7zg/kkw6V?=
 =?us-ascii?Q?ZXG3+fomjZ48SNNrqEXSGVgRvncU5qSLhKpJIQF7BhC2xxGZubk0ObOWqq9Q?=
 =?us-ascii?Q?NdJKH7g23Gs/VIxaD+afVxXqw79/RnwYyD3AAZ0g5W/ykG81uLrm8NkfMmC+?=
 =?us-ascii?Q?yW/zlKuXIUOsfxohBTHaMqcagjiJWH/3Wle7nJSNNSM8CZFATozXkZbYYM9F?=
 =?us-ascii?Q?9f5gqcdAD0SMRDWeIMQgzR6fN1r5xW07uk5tj25UOAZ5nWwYOnQIzwzAVwAD?=
 =?us-ascii?Q?iHomzCbuwqM/b0nEOuqnE83u+8JN6Xh9HlDT60690KPnayn9QUJNR91IaMjd?=
 =?us-ascii?Q?84izF2VoH9ZN25cCcPY9sR6zetKJFexMPPyHH78sK0rPvnibTN5pHSWLl/df?=
 =?us-ascii?Q?UHHA87SOnlOcbvdd0c9TtlucgcUKkjTg/Idu5xsXQDe9vwswP6wypL0CwrP2?=
 =?us-ascii?Q?hN7SXzOvxWHSXBPydlfJImYm+Jzgq9EfGYLck0fop2wM42fPb1WEA26dkdxS?=
 =?us-ascii?Q?SQlfdvNGE3QaoCj8KLZu/LSs3BvMqWPRUvMp6Omc8nK+kBOgsO0YN2Gk+1VR?=
 =?us-ascii?Q?lclhhdvo/euJhvdEOgCrIiFt/hExXDSxdcrwY7yIK4AjV6z9Uw/urzMGSDds?=
 =?us-ascii?Q?jxNyJJOz7u4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lAtrEXiy4n4iuP50jXOGXz3BJUVG9DuGswPI4zrRokqPCN9KROAGzBRTV26Z?=
 =?us-ascii?Q?0A4chI+PWn9Ia8jv1f5gyDCNE5YRdvHJ4xZkjFEsJFpNiS1Rt8HFt/wGuCfg?=
 =?us-ascii?Q?uDrHZZ1d/ClzObdF1JEvbvbjWJEVhW+An/OTAOhmphMAdNhX+TumXwfLbkMG?=
 =?us-ascii?Q?dCpWri9eqaIHULpHui2jpAr0nBRcuJfeC8BJhJU0cv1uKWLFBQbDz5Rznnuy?=
 =?us-ascii?Q?FXCPNq7+wm3NBue0NKx1MGZlY/qnmClas3iTSgapkA0eSdhBnccD/wq6xpMk?=
 =?us-ascii?Q?GfIpaVRlUlPCTNz7ZaytoLuJNyo5gBp83EBl8pg+yMuEIzKewbS1MsPad6sv?=
 =?us-ascii?Q?pRoBtLftHWr4lLRBn8FeJfc1T4ZcJasS4ziaI7iHlNO/ezS1/BcBeoWZdL+o?=
 =?us-ascii?Q?nwX3ryx/hJfPE54XoTS5hxI6hluUCZzMsKpHViXGUL3TDc6fDcI9RQHGa/Og?=
 =?us-ascii?Q?GORmFyS9rqBugMjqpTN31VdfNShtozsmawiAVJmNW+AJn4UCiEx2jQ/Uj0zi?=
 =?us-ascii?Q?zYE5t8fwscD132tjRFGAHXMsfnPZ2xaZ749N81v/ycuk+e6tCtp3eg9Tgxho?=
 =?us-ascii?Q?hjPhsm8eibxpraJdbEiN1M5+bYkylhZc5cKOaWg5KJEzHbLEeIb12Ak31aAv?=
 =?us-ascii?Q?eDnuqGc8KT91oF8ooPTaxKKxM/Qd8SBoSdssMjDtS6BMTLg/AGIW5/nV4wTx?=
 =?us-ascii?Q?pspXSsxb5pG9mak6/C8MckmI2Hnq3iCbWZNKpcGbSsHhWgQiIMVAuWSylDtH?=
 =?us-ascii?Q?/5dE8ogmUJ47pa8sPUVND4sIQwoYBCjbp/xLhtKnd3tFJPF6IAhEnN3tWTO7?=
 =?us-ascii?Q?AanCWrsyG3Eyw21D3Y0VCATxcEM1nwXTq3fJvmY1G/jseO+qETeun/PvK0DG?=
 =?us-ascii?Q?RdaBcbfgTayiBuaIRKGmrTNp/sff6EsVqtWz7MjR1gR9xshvQohN3l6gpxYc?=
 =?us-ascii?Q?0yNw4NGp263JTxjLwmqyxeqvOzF5xol9SMp5+fzuXIu02Zzj4N7Ins2Puunz?=
 =?us-ascii?Q?Ga3x0GKqp+RWDzVm+Wmk4tMHk21nIrDbesoMg5t+brKwITgxh786YpJ4QZ2X?=
 =?us-ascii?Q?a6Ir54E+BPVQ2w/t/HoxkOYdiYdmKuqXm781Ai9AY/pE8uaIuzNKn3drnEZo?=
 =?us-ascii?Q?TZxSb2gJEMjYq9pRZB6+vT+CfVsrZXiit5AESAInm8S0X586MDH/DTWSK9hh?=
 =?us-ascii?Q?NjB4dN7K85qEJD4UpCQ+Wz8rwtSSaOMp85yrqbaNevq8I9K2b6hSjjY0OVED?=
 =?us-ascii?Q?FNj6Vn+5m4wWZvx84mgsJJvwy+74FDEt+NOclf7Yx4bIpNh61LzQjRTbnbVD?=
 =?us-ascii?Q?t0E0zMUtsqNcBXiXtB/8oqkiCmQEYHu7AZoDAhFrtjkAEqEBwa4IM3oi9zid?=
 =?us-ascii?Q?hQ15ohUk1qzMLuqCRvfKfuREJiiG2DRMpyPVjLZ8ZmY673JE7wBAv+R41hpo?=
 =?us-ascii?Q?LeVv8J6Aqvo/kdgGh3CIoy8v3LVWXV3zq89i+7n/IGmSgRao77HJub+UkkQo?=
 =?us-ascii?Q?BP5alSsGPdlrUQaCUB1j/1NGJGJsP1v/ggNuffjIktLuJc8v1ynk62SYKOCd?=
 =?us-ascii?Q?/1tvaw4PT3TLGkN66xZEHDi/m8iwjVBjbahX/sA9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68396fb0-34fd-4c88-f2f3-08ddba82978e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:21.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oj6RcgtZaM1jViHO2tXr2n1ja+fphXvgU/waqLZ86QLu6Cojw6FQzVEoZTXMJ+NE9fwQdZPsCkwwqS3pC5p03Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

When a zone device page is split (via huge pmd folio split). The
driver callback for folio_split is invoked to let the device driver
know that the folio size has been split into a smaller order.

The HMM test driver has been updated to handle the split, since the
test driver uses backing pages, it requires a mechanism of reorganizing
the backing pages (backing pages are used to create a mirror device)
again into the right sized order pages. This is supported by exporting
prep_compound_page().

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h |  7 +++++++
 include/linux/mm.h       |  1 +
 lib/test_hmm.c           | 42 ++++++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c         | 14 ++++++++++++++
 mm/page_alloc.c          |  1 +
 5 files changed, 65 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 11d586dd8ef1..2091b754f1da 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -100,6 +100,13 @@ struct dev_pagemap_ops {
 	 */
 	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
 			      unsigned long nr_pages, int mf_flags);
+
+	/*
+	 * Used for private (un-addressable) device memory only.
+	 * This callback is used when a folio is split into
+	 * a smaller folio
+	 */
+	void (*folio_split)(struct folio *head, struct folio *tail);
 };
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef40f68c1183..f7bda8b1e46c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1183,6 +1183,7 @@ static inline struct folio *virt_to_folio(const void *x)
 void __folio_put(struct folio *folio);
 
 void split_page(struct page *page, unsigned int order);
+void prep_compound_page(struct page *page, unsigned int order);
 void folio_copy(struct folio *dst, struct folio *src);
 int folio_mc_copy(struct folio *dst, struct folio *src);
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 95b4276a17fd..e20021fb7c69 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1646,9 +1646,51 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
+{
+	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
+	struct page *rpage_tail;
+	struct folio *rfolio;
+	unsigned long offset = 0;
+	unsigned int tail_order;
+	unsigned int head_order = folio_order(head);
+
+	if (!rpage) {
+		tail->page.zone_device_data = NULL;
+		return;
+	}
+
+	rfolio = page_folio(rpage);
+
+	if (tail == NULL) {
+		folio_reset_order(rfolio);
+		rfolio->mapping = NULL;
+		if (head_order)
+			prep_compound_page(rpage, head_order);
+		folio_set_count(rfolio, 1 << head_order);
+		return;
+	}
+
+	offset = folio_pfn(tail) - folio_pfn(head);
+
+	rpage_tail = folio_page(rfolio, offset);
+	tail->page.zone_device_data = rpage_tail;
+	clear_compound_head(rpage_tail);
+	rpage_tail->mapping = NULL;
+
+	tail_order = folio_order(tail);
+	if (tail_order)
+		prep_compound_page(rpage_tail, tail_order);
+
+	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
+	tail->pgmap = head->pgmap;
+	folio_set_count(page_folio(rpage_tail), 1 << tail_order);
+}
+
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.page_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
+	.folio_split	= dmirror_devmem_folio_split,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f29add796931..d55e36ae0c39 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3630,6 +3630,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 			if (release == origin_folio)
 				continue;
 
+			if (folio_is_device_private(origin_folio) &&
+					origin_folio->pgmap->ops->folio_split)
+				origin_folio->pgmap->ops->folio_split(
+					origin_folio, release);
+
 			folio_ref_unfreeze(release, 1 +
 					((mapping || swap_cache) ?
 						folio_nr_pages(release) : 0));
@@ -3661,6 +3666,15 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		}
 	}
 
+	/*
+	 * Mark the end of the split, so that the driver can setup origin_folio's
+	 * order and other metadata
+	 */
+	if (folio_is_device_private(origin_folio) &&
+			origin_folio->pgmap->ops->folio_split)
+		origin_folio->pgmap->ops->folio_split(
+			origin_folio, NULL);
+
 	/*
 	 * Unfreeze origin_folio only after all page cache entries, which used
 	 * to point to it, have been updated with new folios. Otherwise,
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4f55f8ed65c7..0a538e9c24bd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -722,6 +722,7 @@ void prep_compound_page(struct page *page, unsigned int order)
 
 	prep_compound_head(page, order);
 }
+EXPORT_SYMBOL_GPL(prep_compound_page);
 
 static inline void set_buddy_order(struct page *page, unsigned int order)
 {
-- 
2.49.0

