Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2082.outbound.protection.outlook.com [40.107.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FE42077
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617829; cv=fail; b=DLbedhxZXkvy214LdMgKgW/T4OPuiJZsX2wtVlJA2CFDvC0zlHLUpDUP9qBEihdGVtMkRSyB4L6DAzZ95/JXIHwDdd5Ajtj37RZpRTJJLlQO0Ipw8l9yh0N0irqmXOngYj4UKGX+PBCudLCuz+l+BBUY0wBbSKnAMTzyI3pozB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617829; c=relaxed/simple;
	bh=UqVCfshWRPnRH8VBnUAuRtdpaBzArg3c/Cx8Puynxsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJuhACQsQWgvn6cQZOS+waplD/u/qTxBftL7i/uFdsgef2BlX6N0lvbfiJG9q8rZthl0ZdeOa0m2qUUJv8wlbQMAlz6R5R5jX0DQQIFtY6MZkCUOCresgEUMNVCONoojTN1Ravr37XUk9pw//zVerDVi3mlXqhuG6ycqn5Iwm3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=ZwWAFq5K; arc=fail smtp.client-ip=40.107.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="ZwWAFq5K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlfzCGSNM7zWdzqPK056H1v0hSq1OGiyNpYrlSEAHKhSgzpW6I9nsMV1rbCk0S12B7FQUd/XDbGFB36wCNVZ1S+1xMszfbDqqHGW8QvNwcBuehtpBf3dYXmzQnyWAKPS9q0eUVXdm63huY1VGygbvKD/FruLWG6vs4qObVweF2tZeH2RCsfzNgedxTdKXFAPBvtpVRasyWsg29PkPt91AlnR1SCOehLuYjJfJotK0vGxF9BaCWoeaYvCHFUl/2IuHOkwHe9tj9bdkHgbTxxOlbNMnYNi8++HyfzA54iWb2dc6YoaZrICXd/rGjwLRaZQPpjaM16XNzpd8MKUlI70xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xIxhmyFpMRcU6efiS/suQ95Y+bbrCox4nrP2acba8o=;
 b=vCO9KcZgiF9uLaWy194aXA8deIKfzD3wMi1zjXB1wZrRQlvcs0NapnWN0sm/in7OzIw6373W8sJbq64JEv/K2KSF3PGWqeoccH1429FWSLO+bErdnMLULF718yG0dTk9DdHm/Yo4hPSpRFEyAwmNXxRh7rXRYdZ9yVxkbMSnhZXvj2chS6TM9KuMweUtbfsYV9kVqq1p3Vb9IzPC9LXQXgcLP5pEPFtJwzYtGI6CPPqq0VO3N8ZqU9sbF/dsxmQ3RfEFgCw3UcvMwfC6Sw6pLuHs2SRJqDcB1MBqC7F/7GYAfqjV1/qomIUfTRYaTFX9luFawuotcucXjz2ZXHweoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=oppo.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=oppo.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xIxhmyFpMRcU6efiS/suQ95Y+bbrCox4nrP2acba8o=;
 b=ZwWAFq5KKuCNsybjhZiCBpBj9PAvfNzwDmX84mV2Q858HKW58etZWoKERIrsmJ9QsqwdjN6GhDqPScaBDNPFXGFASxgV//9kUWkvZ78+EmwI/DCLGNEs6xa3bAw5/iU/4QoAO8lAAMB5+Dehv7XyQgBmbjSy4VjeOv1sqWEC3BE=
Received: from TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c8::11)
 by SEZPR02MB7778.apcprd02.prod.outlook.com (2603:1096:101:220::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.14; Mon, 14 Apr
 2025 08:03:44 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:400:3c8:cafe::ea) by TYCP286CA0293.outlook.office365.com
 (2603:1096:400:3c8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Mon,
 14 Apr 2025 08:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 08:03:43 +0000
Received: from localhost.localdomain (172.16.40.118) by mailappw30.adc.com
 (172.16.56.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 16:03:41 +0800
From: Dao Huang <huangdao1@oppo.com>
To: <hailong.liu@oppo.com>
CC: <linux-kernel@vger.kernel.org>, <huangdao1@oppo.com>
Subject: Re: [PATCH] mm: vmscan: do not skip CMA while LRU is full of CMA folios
Date: Mon, 14 Apr 2025 16:03:16 +0800
Message-ID: <1744617796-450193-1-git-send-email-huangdao1@oppo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20240408080539.14282-1-liuhailong@oppo.com>
References: <20240408080539.14282-1-liuhailong@oppo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEZPR02MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: a91abf94-079f-4ef9-1e6b-08dd7b2ae058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7bgIbmDGYesoU3O+DsM3lDUuLX9rkTYOzcjUzvKQV8ui9zV43BWD4vz9OIWU?=
 =?us-ascii?Q?vALeOUSqthjRdf2g2MLU78SKnGGfbnb0OMjPgYeXIGPM3JqejgR5vtmiliOo?=
 =?us-ascii?Q?kMUviurOF79PijXNMIXiABzwhxj9iJR1ZBjjBvVrxjywrCad2geolGESVvFo?=
 =?us-ascii?Q?h0iFTz2nBwdqXJmXHfTZrULgfFnI6jT2QEMKIwRSRV2+M+iD5r/tZocHNx3s?=
 =?us-ascii?Q?zehA5utHBoPmij/ZfgGBSire817IIyNCYdn45776xGdctygJf6gd8juFHalR?=
 =?us-ascii?Q?U+ccAoiYX7ZlLramUjEGqmDifVN9sWDwYbOOSEOVJWZITmfXWc71dyF+dObq?=
 =?us-ascii?Q?329sQ5kUYM8kosG07kNEK+D4+RqrV1RtPappJ/VEoh3PJgIV8W8UHyuTgEt9?=
 =?us-ascii?Q?ZBeQGdLCN+IY3y9WcYrTrZRFyCg7Qn8q9SyZXcV6jkyYXqh0z5GRmlomF5OX?=
 =?us-ascii?Q?xk9+ak3F4FGQHn8alkQ47l9+RD99MkHdeY/buJZlJa9GW7ed28iMGtWlu+Fp?=
 =?us-ascii?Q?Knm1DmytjRoweov2mqxi5qOzWLiMLN38C3xP1FN+eBP7WITSJvGzcQKpwjOx?=
 =?us-ascii?Q?FZEvDPQarYT/bJOdjgjwYKvmE0X8lENl7MzdUiefKfccqr5NzG9eqh02Cf+p?=
 =?us-ascii?Q?TUAS3G2RHE5C0zhsYEHapyacb+6NYT/ivglj2P1yL+yPe3O+qod+45TAjcc1?=
 =?us-ascii?Q?XXumrCiCR5Gm5jgft1baYuoCaeQRX0EXjaKDNmw1QWZjIvyXw6/uGVVtWVKU?=
 =?us-ascii?Q?jz1PS1yBYPw7S2xym97tgFj2WSCXXNeoXqJozmRLHQ4gxQskXpzvtrZBiLdv?=
 =?us-ascii?Q?leW/b2JYlQRHbsO7nnJ2IUMG5/HTGjBf7niTxHMMyyGyTVviGF8G4ALtYKjy?=
 =?us-ascii?Q?oEvoUbK70gwCSEoIoxQ1ollxuom+lvVcRZmEwAmhMWgJjLA8yj9dyHpwNo4n?=
 =?us-ascii?Q?+j5gW6FSMMCM+79fUgK5B+qyARfemRSMMbbLjRvNActOPMhyOnJXXkgV0NSj?=
 =?us-ascii?Q?qCsMks79KOrSLR3p61nScHsf9OWoun8KpBASgC75WZCJqLmWt+6zA2OkMxnP?=
 =?us-ascii?Q?nhEruXaP95IaJu+MMHV3ttTOeRjI2CRxhjkNUeb3njb8o3IP8z314z0kh6Pr?=
 =?us-ascii?Q?TFvul+kirIOVxh81pgOAHnlIZ6//BzjV0RGdBI/GuMfTVgCMAfg6pIAnQdpV?=
 =?us-ascii?Q?6vJeqCmJXRMvJiX988JjVMEuCp8wL65rFj/6tZTIBGLTGuzbdNS9RqaV7xUV?=
 =?us-ascii?Q?dt3Y8ketQ6Ib4gmyEBdlFMtPZVDvKNSsiHAyrGcyNESIsWibqSigXUYZ/fys?=
 =?us-ascii?Q?HPUvxUMs5dzhUcQcG/Ly/kzFgdlJggi9/uI2km4/bettldw9Nyw48ULAI2yu?=
 =?us-ascii?Q?/cUJRfjgZlCfv9RcGpa+jnJhp96SozfRIbU48nWBYuXn1DnltiRorcjTVGEd?=
 =?us-ascii?Q?NoDH/SOwebdHU5QEWM8z39UcxUFGZxswt7IPX7FxZ3p3PNQ5jO9nA6a0rstY?=
 =?us-ascii?Q?9kIUAxOBPZtL+aYZKl6DQHWNvR6BlOHwoxDW?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:03:43.7316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a91abf94-079f-4ef9-1e6b-08dd7b2ae058
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7778

> From: liuhailong <liuhailong@oppo.com>

> If the allocation flag isn't movable, commit 5da226dbfce3 ("mm:
> skip CMA pages when they are not available") skips CMA during direct
> reclamation. This generally speeds up the reclamation of non-movable
> folios. However, in scenarios with limited system memory and a majority
> of reclaimable folios in LRU being from CMA, this can result in prolonged
> idle loops where the system reclaims nothing but consumes CPU.

> I traced the process of a thread entering direct reclamation,
> and printed the relevant information of the sc(scan_control).
> __alloc_pages_direct_reclaim start
> sc->priority:9 sc->nr_skipped_cma:32208  sc->nr_scanned:36  sc->nr_reclaimed:3
> sc->priority:8 sc->nr_skipped_cma:32199  sc->nr_scanned:69  sc->nr_reclaimed:3
> sc->priority:7 sc->nr_skipped_cma:198405 sc->nr_scanned:121 sc->nr_reclaimed:3
> sc->priority:6 sc->nr_skipped_cma:236713 sc->nr_scanned:147 sc->nr_reclaimed:3
> sc->priority:5 sc->nr_skipped_cma:708209 sc->nr_scanned:379 sc->nr_reclaimed:3
> sc->priority:4 sc->nr_skipped_cma:785537 sc->nr_scanned:646 sc->nr_reclaimed:3
> __alloc_pages_direct_reclaim end duration 3356ms

> Continuously skipping CMA even when the LRU is filled with CMA
> folios can also result in lmkd failing to terminate processes. The
> duration of psi_memstall (measured from the exit to the entry of
> __alloc_pages_direct_reclaim) becomes excessively long, lasting for
> example a couple of seconds. Consequently, lmkd fails to awaken and
> terminate processes promptly.

> This patch introduces no_skip_cma and sets it to true when the number of
> skipped CMA folios is excessively high. It offers two benefits: Rather
> than wasting time in idle loops, it's better to assist other threads in
> reclaiming some folios; This shortens the duration of psi_memstall and
> ensures timely activation of lmkd within a few milliseconds.

> Signed-off-by: liuhailong <liuhailong@oppo.com>
> ---
>  mm/vmscan.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fa321c125099..2c74c1c94d88 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -114,6 +114,9 @@ struct scan_control {
>  	/* Proactive reclaim invoked by userspace through memory.reclaim */
>  	unsigned int proactive:1;
>
> +	/* Can reclaim skip cma pages */
> +	unsigned int no_skip_cma:1;
> +
>  	/*
>  	 * Cgroup memory below memory.low is protected as long as we
>  	 * don't threaten to OOM. If any cgroup is reclaimed at
> @@ -157,6 +160,9 @@ struct scan_control {
>  	/* Number of pages freed so far during a call to shrink_zones() */
>  	unsigned long nr_reclaimed;
>
> +	/* Number of cma-pages skipped so far during a call to shrink_zones() */
> +	unsigned long nr_skipped_cma;
> +
>  	struct {
>  		unsigned int dirty;
>  		unsigned int unqueued_dirty;
> @@ -1572,9 +1578,13 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
>   */
>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
>  {
> -	return !current_is_kswapd() &&
> +	bool ret = !current_is_kswapd() && !sc->no_skip_cma &&
>  			gfp_migratetype(sc->gfp_mask) != MIGRATE_MOVABLE &&
>  			folio_migratetype(folio) == MIGRATE_CMA;
> +
> +	if (ret)
> +		sc->nr_skipped_cma += folio_nr_pages(folio);
> +	return ret;
>  }
>  #else
>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
> @@ -6188,6 +6198,7 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
>  			vmpressure_prio(sc->gfp_mask, sc->target_mem_cgroup,
>  					sc->priority);
>  		sc->nr_scanned = 0;
> +		sc->nr_skipped_cma = 0;
>  		shrink_zones(zonelist, sc);
>
>  		if (sc->nr_reclaimed >= sc->nr_to_reclaim)
> @@ -6202,6 +6213,16 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
>  		 */
>  		if (sc->priority < DEF_PRIORITY - 2)
>  			sc->may_writepage = 1;
> +
> +		/*
> +		 * If we're getting trouble reclaiming non-cma pages and
> +		 * currently a substantial number of CMA pages on LRU,
> +		 * start reclaiming cma pages to alleviate other threads
> +		 * and decrease lru size.
> +		 */
> +		if (sc->priority < DEF_PRIORITY - 2 &&
> +		    sc->nr_scanned < (sc->nr_skipped_cma >> 3))
> +			sc->no_skip_cma = 1;
>  	} while (--sc->priority >= 0);
> 
>  	last_pgdat = NULL;
> --
> 2.36.1

[test] I've tested this patch on MTK 6993 with a kernel based on andorid-16.

