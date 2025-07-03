Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA02C325A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582426; cv=fail; b=sKF8NFSFXhghlG4Yd8buCRDWGhOMG4PCs9z9W00ZJFfE7s+bD6S2deF2OsFZ17LIL5/+m+RSEpufoi5IA5kZfSyOV0QgA99ZP+OQ4owYidYM0VObOzWvwaIASXN1gsWxBpvjOORnmwUJ1TfSkOOoxIhY7CGjZQ+UJcdePMHaUgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582426; c=relaxed/simple;
	bh=Ysw0W29oPy2QrYa0SyX6hlAdlQcFsUBwC0ThL9ZHhpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oy5MqWEFxi17zBM9ggh1vzx9ZrMuNIqTi0/579iDj2CcQ/QnySXD9W0PEJzZ5HJtzZxzaiUPuDEob1MNIGCL4UsI9Y9UxchJOHeE0qT0kn4lHSf1rZzdfABpaFPExVCvozOHKOzosdYxpCdh861k+AnXnJKxqSNl/Vs9OYqMmUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Strc5T8F; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Strc5T8F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGL+w78C7jDvYyg4sehjfbvMgjwMQqHT1V3QK7AtiPLUvkdTlq4RDyvdraZf6vgBNzCNDGln435IGl7U0AMJ5Rjz9BHfxsSnrXaR08ft7tSBTZOdwxQK7FB/j9hLy1J+vpUlQ058mIpMakj+5o3ipxKbicZv7RlT+wENS8g20m9qDyEy8LmhynywUKIgdtSqgFTHZo+F7DWP/qd1KLQBLKRalsA2bwXvvNqEPd15XGRtd6v5IjHAz61FnybCHzVRRFmnapjMQYO4qDENXblgVlqv4bXOcMg0af0LpiL0bhuho2qqCN9ZEnB6pXfhJetIBQF7r76YrhF7wxr/hbNlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RurpiQ4qtfLWbdArJLDm5LFS3qz8s905a9r5oepdXNI=;
 b=guV2sE4UZu5iNcpWGPovG0nIZNetp67SZ8L/khFpSAdnWfkJhHORxVb8LBYNn5G8+UaZBgPHwSsM8127TJy4A3584KwzXiz4F13jvdGHTmPt3vIMaOlCzOp1cCx0NivKn9kklwUbLGRSslXN9GworKF8MdGMokaBCZnj6TqKFAz/gZM/FUbB3ir5It4/fgixHR114QAxn5dDZ/dhESPrsNYRPmEK95XaadAFauF+j7KMIAwXajCp0agP5MxkGLyR4B4AXxsgD1UyMyUw69aBcJZmb4+gBCcx88g8CKxhMLlxiAt+lOZ9IYZFE9UkqFI4JPPWyKgq32YPeexgBVQc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RurpiQ4qtfLWbdArJLDm5LFS3qz8s905a9r5oepdXNI=;
 b=Strc5T8FHqUI6uAm3qpFSVzVH305lidwNXoI3tmPMo0sDIA7CWSwH9NHmN94Y9aVe3TvJSZFAWVBWpcfd4QDoU7+AviZeVrC1V1RDejnUqg/W0F49AIZcCwZD1c7P4/Ovkd4wedjnLMrThEFYQ7rCGn3xNhbWXYxNxL1DxeQTApKQNq5QnRYvBUDgI3nwbc+4KdyDyUUjgG4q926TbLt3guS8yJm2spuv5M+Ocu5JZoISEt8GPKP0lNENfTiRSVtKbJZPv3TIJAecbmilWWQoq4BKRkmPBmA0e9SYNLEPExtLMAn9r6pIx3U5a+JMR9h8Am3zS/wJuEeqcv08rnWaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:17 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 06/12] lib/test_hmm: test cases and support for zone device private THP
Date: Fri,  4 Jul 2025 08:27:53 +1000
Message-ID: <20250703222759.1943776-7-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::22) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: dae66e45-daa3-4811-ac84-08ddba82959f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4t7p1NmW5Ti0b8BVFWtUBGp3VWOUk975KAzlIsLrn2CCKWHauKAyjxDbrShM?=
 =?us-ascii?Q?Iu6kJSfKwxMULD1v31iQwetrDHQS9XNLb4lPbUWr/d9NXFbmD8YYmO25CUcn?=
 =?us-ascii?Q?OpPxixtSaja65BUoI8DoSkwzIvnkWNLujN04O6O2gIFn50jhO/Ggejt0HiKi?=
 =?us-ascii?Q?r2wUk1L/YHrgTTkWzSWZRx145EaGBJJV3VZ7yc878a4BVQNAHfnHUHS5LJKE?=
 =?us-ascii?Q?6dKGn3o1bG4eAF5L2MCwo77rBOknz8ZhpsdBp2MfSW/UNuKnX9etDu+3n405?=
 =?us-ascii?Q?9czSpoeID9sSSn1DrT1tGLJb6ogVXJyhZXNMVcpjY18V6kZ0vEz5PYw0KkVT?=
 =?us-ascii?Q?/QZlBVtExRsgcxCgN9yZRAWgUPNT2CduC6CFemPPJiZG5A9dEsKklS3zfwtI?=
 =?us-ascii?Q?06PGwQ+tGRrvFKBB5F9xuxfucifDgWpgGi8FClRLlsWdL+nbsNIIQlG4bxuJ?=
 =?us-ascii?Q?3dpoYUDsf/5xCa/db9MNUbeu33EQKOdqzKMMnjEVxKfcfAlqVcxETOGiPsTP?=
 =?us-ascii?Q?Xok1Of9aAB3zUMe+P8uPi2b7wnMOeeHmWh000LHh2KJv11OGVw9jsSixJLxH?=
 =?us-ascii?Q?L79XgqGr54Srz3mh5QOWKcFeBoz6HVNQMaxbtubySrpbf7A23lG1aEjRTOmF?=
 =?us-ascii?Q?9/AKXWgLxz6JWP2sXD0JZGgtUEHwelIgLm5nXX9S4+sL40ud9mQaoAiPENll?=
 =?us-ascii?Q?PWSF/aMazJHTEEmDOI3wP/sF35gTEqEBo6sU7rDhZ1NOA87dQK2HCnr1xwOQ?=
 =?us-ascii?Q?qfb9+ecUtEw5i2prPgiBc6oq9oIfYjelShT7OpE30aVGS4TJxWF1MiLlqFNy?=
 =?us-ascii?Q?2NWxnBjp1vNNbJGn7OKgfybWsOEeYiapg1wf+1RdzI3FA0Z7METXe3MRu6Gq?=
 =?us-ascii?Q?vYCacZMr1YiHpF+pV+5U3aW2breKPxlB7yBq/hT9bswvZCXqIM3yJfdrsoP+?=
 =?us-ascii?Q?hpF6z1A9v0+NugzMC7+N6YrLhqMCdgf64hqdngOx5Qcca+DYsnNM9dr+aCHn?=
 =?us-ascii?Q?N+tgUuFNO8yMcgCkqvSEkSGDOaR+GxnmSKWFrHo4jxkjqZ89T2/Bllrr3OpA?=
 =?us-ascii?Q?nCr3VrAXDOD4hPTYVl6GAIU71Ae1vqOjPmpIAZ3HYT9IbfDcBVWQh6sl2yhj?=
 =?us-ascii?Q?fGPfLeucI59LknWXpbDiLr4OOKTaMdAeBaBW8qZ9jCZodTQCqH4/NbUuPPkf?=
 =?us-ascii?Q?d/qQ0hMO67v7HTeGJ4TqY8dPZ0fgI56gWoNcu2rNPYofquk/6vTNar49Wh2D?=
 =?us-ascii?Q?bC8/EYcUWAVvuTX0UvHDAyRjkUz7kAqSXNbzcp/ZeRHWT4notwanbyHXXaIM?=
 =?us-ascii?Q?d2y1Q58b5mixONXuc3P0dNp6fmT/9Fod0QuOwQ1oKxmZ4AxqxT20kRC+JdRn?=
 =?us-ascii?Q?WXj2+Apm3M/togak2tRecpFHjNPx58m2gBPJG0p44pSkxleOYm/opbZPRJ4M?=
 =?us-ascii?Q?rHwXtJ7YVHg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t58hoScS1PPZ6Qd/hLVpTEXFSV7L4FFeFFifrbfRiUl1Q4CVvJfEFFX2DJk3?=
 =?us-ascii?Q?C3PdaXnj56NKoAB/me7rv5E4If/Hs6xoH6qHo2cq0DrmyaFVp/uMFhe5xqm/?=
 =?us-ascii?Q?HBiS6KjFC0YtPoy4R1d/9XKnqCCpKXDxwCuQkSWEi2QZ+KuhzynvY0MzHkwH?=
 =?us-ascii?Q?UtmmNwfTOUsexu/CECYfkHq2PMyADCSFcPJAhY8l8Dh5dJO1m0MbLrS4bZUy?=
 =?us-ascii?Q?NQFfuQsqr2cGJflyxpOdOZhnW57bS2DdVbgEQ9YRXu13T2i/qb/7hfNupqDj?=
 =?us-ascii?Q?Nxpehg7vrqpATISQWZppR1KkjxVcWOcs/OUNYzv5+vCZQpY6BAjQvXzQNOf3?=
 =?us-ascii?Q?nvIA2rYue7PdHDHO0mP1K3d1rwt2bEnHVVNB+juTrrYb0fJZWYn6eEA+TLHN?=
 =?us-ascii?Q?iMDnMPcZV9/KNG/6GUM+cilk2Du95vflpcr6il/Q3b7rCdRYiT4TBIpRjVZu?=
 =?us-ascii?Q?HXgEPAeNKM83J18WZi5/+jcUKNg1KyVQ3ByTI0BY018dA9pmFbSnvxnUupPE?=
 =?us-ascii?Q?ts1juSA/2HgojvJGQ8v/RitPKmlme/cd6WcYGX2Gsb+Bjlm3emhLq/XgOoux?=
 =?us-ascii?Q?NfxmLgGcJxJ1msZfT8f2GSgrR8LkxD7Zvlz8FCnoOlB4f7akWKjbreTFY/5c?=
 =?us-ascii?Q?2yTJ4AufuIbCSRvU+92EJjvuXYGnc1WK1f4pCmTFNMoUVp01LtS1pCDYgwea?=
 =?us-ascii?Q?LTLJ0Ng0ujbpjXw4mGt8JuS4httlFuuSXIwt9LEIHW8wduVZ+cdaGKMr+FeL?=
 =?us-ascii?Q?YeymTdXRfQBJDJSZy9ueBvKcC+bOp/DJbBi9BlLB+mmeiEo1M2Q4fY0cGYDK?=
 =?us-ascii?Q?3gWWdcaggXvX8pbxFQls8P3voNhn6WL05XWnREPk9FH2kVsQfZIoJoKDYuHz?=
 =?us-ascii?Q?szd0qDDQUzqjZxE5Q6ax9Sy6gSaBq/y3Wrqq3Cc7bj5NRrOs+ClyK/Qr6w6h?=
 =?us-ascii?Q?+CHic47bg3mp6Hwmn2yPqdcsulNq4jQLhka6rdQJ0BKcbaKGXvsWfpm5z+3L?=
 =?us-ascii?Q?pf+ysC6ot2ckEI21e/maGmhQy1jJC9BzDSEWmwEVeWbuLVioHGsgzL4r3ABc?=
 =?us-ascii?Q?9InBQMSazAAFEqNZU9jlawE2hn9oFnyP4+3eUxGx3DzmsI25pYUINsDb4I2M?=
 =?us-ascii?Q?+BPY/nYus5Bpemw8DdkrSqP8LvDcwpxnNX3Shy+00utc1sgw7R4nUG4CENwt?=
 =?us-ascii?Q?QPHAc3PfdBcGa7v/AhOKc57ca2c78y4E+Z7tYgOzeJ68o8BuDy28LeFbHSs+?=
 =?us-ascii?Q?++VcaoiSFZ4QSRxKKPcEeSvJFhbWaeykZJye9bqScSKYDCzPI+Bsy+QdrXEH?=
 =?us-ascii?Q?x+Mc51svmFUgbBt2Oucd9reRhOdO2l4cJVendpft1tHjR6i4yvWtFW+aD1Ls?=
 =?us-ascii?Q?Rjri2mx7CUHSHwrHLM8GxM2gyyyyMNyurEQP0hNJRKOTYPQX89V/pTbeMNx7?=
 =?us-ascii?Q?5l614+XauA2USRjErBhKs/6dCvGMBaWYd2HJa4TUNVyUSnzxcbWak68hXNEE?=
 =?us-ascii?Q?Jsv8kf9mdOL2yThUC5hDsvH1WDd8DWaCp22iS0nw9KDg/4zX8eGPyBuXZS9K?=
 =?us-ascii?Q?DyXTtYIAskqRD2SbdsKW5Fu1rb/9no0cScjWBxVS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae66e45-daa3-4811-ac84-08ddba82959f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:17.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sOS8yLdqjJ84brfmPx/oNfyOxg6k/SQhVs4JkHKIllIw2R6UNjbvAeltxSwDaX1OpzMoXu3cneaxSUPR/FsYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Enhance the hmm test driver (lib/test_hmm) with support for
THP pages.

A new pool of free_folios() has now been added to the dmirror
device, which can be allocated when a request for a THP zone
device private page is made.

Add compound page awareness to the allocation function during
normal migration and fault based migration. These routines also
copy folio_nr_pages() when moving data between system memory
and device memory.

args.src and args.dst used to hold migration entries are now
dynamically allocated (as they need to hold HPAGE_PMD_NR entries
or more).

Split and migrate support will be added in future patches in this
series.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c | 355 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 282 insertions(+), 73 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 761725bc713c..95b4276a17fd 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	init_zone_device_folio(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_BUG_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,61 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
 		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
-			continue;
+			goto next;
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
+
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1019,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1045,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1055,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1071,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1084,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1100,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1119,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1129,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1150,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1161,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1361,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1377,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1408,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
 
+
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1444,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1558,30 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(rpage);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,11 +1589,10 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
@@ -1412,21 +1603,36 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,7 +1640,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1465,7 +1674,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.49.0

