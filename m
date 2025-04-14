Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011063.outbound.protection.outlook.com [52.101.129.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC92580C6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618771; cv=fail; b=gHWgUrPv/ebREzUUjWyTFqthv4siueS53rIYYfGRQmG9bwPwqjVCN+Ta4iHysHphBVfmyU+fNTCLmRXK5j7n1c8/VUsLBnX1p4kDOh7ZE9qnsnsTMREq0fCgighaZeDJz3X4ufB31gVeCQfF9qsTX926092lsp+h23C8l/azpUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618771; c=relaxed/simple;
	bh=brCxp4mThJ/ceaof7MxLAXDSv20jvrTigYYlKFDajgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pg1r/H5wXzpIDTdQU4xGdEc0mWCVoLLmf7YDa57pmJWUFizDcCCLI6YL8P4B+06/yUbxzID/IS6b9CEfk+iDljabZl58HXch2Ibfu3Nti7kKQqB9uCil3trWY0Xs2c/wxd8YCKCtY6Cp7ZJpwlP/ntyIYBP1ozMi8lvisK9p3x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=QrFuhUi3; arc=fail smtp.client-ip=52.101.129.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="QrFuhUi3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/tBL8YzuLJZ+yvaX+UExulGvJUcKWU1lb83TKdGD6uqj+Q0pDkgpzHITU/TpE8ol32kPKVyuD2RhgMLJfciooF285rsFg3TxPSEh8e1eFwNk5S58eSjMplpd81zQy9M7mowGPoUWkK1RbWlYeWsWmS9N8JhTOWflVT9PAmSwCVihSVf+EnVEz99DODynPIlCDwUKatlqGmDCoW6gOLiCWybSmEcdo9OA/ilrrbnVpr9wgqP2v7aPE2h/JgXlQqUg6RWfcx3rW3hyBalZ8AbhldDweZfxjk22CUEuQ3ONDma6q4U6pUZlU6lSNNI43kasI3zaufLUxEMAP/aJBgrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36lSHVEExc6Gm8Q+RPbtcR8lzR7/ltgx28XXlXxTFPI=;
 b=ypClgOBsuHiZGHJYWuADzGjpLSBGf5sFwF5wHgcJfqfudGcVzjsEliWjYywNF3GFOh7QRpiRbHT6S0AZTaXnQzZTjZTwlzpfhdnJDuQZYuWD233obdDOlZDsrESYVLENeUE1Swg1Nq0lsucnyp8S1TBa8eQFu/G2mwD6Bch6q9uqy88xt0dHFlYZXtIJE6fE93DpBRgDPmQsyEQ7uyryrcDOeqOvd6eTWVk2eSw+v728VGtuO1xxkvPKX6fnq7QJ6KpZa5xtJ9k2EYMO4raKlWIyXfeFpZFJDxlXhgthhe4ruB3U0HGhNrK5PsVes+lelROqBfsm9banlqEQrFRzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=oppo.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=oppo.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36lSHVEExc6Gm8Q+RPbtcR8lzR7/ltgx28XXlXxTFPI=;
 b=QrFuhUi3PVO0ti68pnFb4C0euK8YJdVju9S4YUogSwCacKE9sRWv0BPxGkCf27HaF6W5eeNIqpKQYxjC1Pxd51T0St3behnRvy3dwm2fr7yPGiyHs3yJ0/2NsqRBGzkd/FQLYCVRs2bU3LCEDhkjPZpi1yggp5o5xj+vq84yUEw=
Received: from SI1PR02CA0058.apcprd02.prod.outlook.com (2603:1096:4:1f5::9) by
 SEZPR02MB5614.apcprd02.prod.outlook.com (2603:1096:101:39::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.18; Mon, 14 Apr 2025 08:19:23 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::7b) by SI1PR02CA0058.outlook.office365.com
 (2603:1096:4:1f5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.30 via Frontend Transport; Mon,
 14 Apr 2025 08:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 08:19:22 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 16:18:50 +0800
Message-ID: <12075320-4120-4e4c-9144-5b88a52a4d43@oppo.com>
Date: Mon, 14 Apr 2025 16:18:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmscan: do not skip CMA while LRU is full of CMA
 folios
To: Dao Huang <huangdao1@oppo.com>
CC: <linux-kernel@vger.kernel.org>
References: <20240408080539.14282-1-liuhailong@oppo.com>
 <1744617796-450193-1-git-send-email-huangdao1@oppo.com>
Content-Language: en-US
From: Hailong Liu <hailong.liu@oppo.com>
In-Reply-To: <1744617796-450193-1-git-send-email-huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SEZPR02MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b131df-d1c6-4314-5866-08dd7b2d0fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVJBNVdBRTg4ZHQ5dlN1WDBTWnFXR1RSVDBpeTFYNWx2eittK3NXMTZ1Tnor?=
 =?utf-8?B?RXlPbTk1VlR5cENhSGltNmxPcXRLUlpuZTh6bDZjeHlFd3NJZ1ZaZ2txSGow?=
 =?utf-8?B?b2l2OENCNENNSWtjQmRjMmtIb2l0WXhxK3kwc0ZDYkxSYllBZ1MveFNBUjdy?=
 =?utf-8?B?VXdsRk9OcnNvbzFqZ2VSWW9rT0pRU2lDRVpzdEhMVGUwOU5sUlZJc0I5SG4r?=
 =?utf-8?B?V2ZyUUowNDlZckpoWTNmbzJiUTZJS1E0dzZoOFBlUS9Lc2dpMElZYS9MalJz?=
 =?utf-8?B?L0hibi9VbWNzQkpoRlNMRXBOc2xvMDRmc205aUlURG5qT3lnbmpkS1NWWUpS?=
 =?utf-8?B?TmFLaDBHYUhzcjRGcyt3ZEVvdXErLzhNeERITWVNbDM4ekpMSUdXQ09iZVp4?=
 =?utf-8?B?Q2t4RUowZVZKVldyak9qT1hyUjVCTEhjTEFPYlBvRXYwS2tIMkdlelhrNWVJ?=
 =?utf-8?B?Mzl3YzlxQ1BIOU1yMnhKdUFYTXdNVVl6OHp2dUJ6VFBHR3NjZnN0MDdYM2lp?=
 =?utf-8?B?L1hZbWp0RXI2ZDNvb1dVa1lhdkdPRDhIUURwWHVmTDJza3VranNGRTJNS0ZD?=
 =?utf-8?B?andBeE5OYUU4KzNmTUNnZ2JpRFZOYnRxWW9YRGNRcFk4MmFxbmpPM0xZYjB6?=
 =?utf-8?B?T0ZYWDVFMU5OQVNNWlNHR0IxS3FhcTEvT0dVWW5RMjNzeU9yN0ZsYjF3b3NG?=
 =?utf-8?B?cVBzaW5kWTRCbWtzcnNFUGxtQkxoNFY4VEk1Q0EzblZlU3QrM24yZXN1VVFq?=
 =?utf-8?B?MlRyMHQyN01pVlExMkx2Q20yLzlOS2UwVmpkN0o0KzBKWmI3MWFmWk5zTVdj?=
 =?utf-8?B?YTVhQmdjRTJsNXhPbFR3WFNoV2dSdlVJTjdUTzluU1YvUWdXZzdiZHh5SEY4?=
 =?utf-8?B?NnUxL0JRRGFlZ0dGdUI4ZElKMkJTNEpnK2dNc1VXSkJ5YStGMTVPZExyQi9L?=
 =?utf-8?B?N0tiUXpLeHQ3dXZQUEpyejJVTjZsMUN2bDBKcndicFdlUVFoVWs3NWtHNkpt?=
 =?utf-8?B?RXdWbXd6RFR5MHJrd3IwYi9uRWVGN3B3ZkRwVE40QmkrWUlzUFkvSDk2VUE5?=
 =?utf-8?B?eDBYU1ZuMjBKcXc5YmlnMVpiRWFtS0dvK2IvQVBtSnZSR0NBUUtYY2tPNUhK?=
 =?utf-8?B?MUN6MU5ValJjMEN1eDdHcUg4bTJOR0IxS0ZPNTRKV3RMZUpueDJIZW5wMGdD?=
 =?utf-8?B?UDZvYk9xMGM5ZXMxMWdMdVQ5bUFnUlVQdnQ5ZzZQaURIRTIvdzl5aVdDYzNM?=
 =?utf-8?B?NWJESkdrT05FZWpGMGFmUjB5Sjc0emR3dkxMNlMyNjQxS3ZPYVU5Rll2SXdF?=
 =?utf-8?B?ZU94NlE4RXpZVy9GSDlpQWwrY2toUVpDdWNDODdwb2IycGljUVVMenJqTXRz?=
 =?utf-8?B?VDJwWjlHZmxtamdOWjh1ZURyRnVEU0trb3FWSXpsUkFKNVNYZDBjTFN6dkpT?=
 =?utf-8?B?VGh3VmZ4K3NpUThGSGJFWitHb25wQTJ3QXlLYmgwUDRNT0Q2clE4NjcrUzA4?=
 =?utf-8?B?Tmk0REcxWkN4VlZ2Z292R0Z0WXdUUkp3a1pZeXdOcyszOFlDbXVFQ050N2Ji?=
 =?utf-8?B?eUhveUVkMktLdjVrdDdrc0V3Vks4Q0tzY1gwQTcrbDd5RWlMQS9OYnExaFdF?=
 =?utf-8?B?U0lLek83QVVXOUVHUkJsSFBjZ1R5WUUzbzVjaHMrUE1HbzV4SVd2aTJ3dncz?=
 =?utf-8?B?VnowakFrNklzTkpFb24wVmg5ak1sNmIvTjl6MVhIRGs1cWJOcWNQOGpEczd1?=
 =?utf-8?B?dGtHVndjUVhmYlVVN0htZm0yNlJKbWJNckRzSjR6YjN1Q1FscUtXOFdwSEI4?=
 =?utf-8?B?WjZ1akxMZUVYRWhlYXlRWDlGb0U0OVRwM1BjbUJjSWtjSEd5UzhVRi9qK2NR?=
 =?utf-8?B?VEF1YkdjWHpQSm9xRUxQT1p4ejVXV2xjWlF4L0tpRll0cVN6clFZRUVqc1Z2?=
 =?utf-8?B?aEVWWGtQQUJoWDFmSzRnOWtFZ3V4Uk5PSlpNUlNQRGlseHplYXNmSmtUWW5G?=
 =?utf-8?B?a3oxQklreUtHTjBHZjRwRHBzRTMwZmdCbHE3OUxBMnBNT0NUWmhKdUV5VTRn?=
 =?utf-8?Q?0RYZOT?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:19:22.4663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b131df-d1c6-4314-5866-08dd7b2d0fd1
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5614



On 4/14/2025 4:03 PM, Dao Huang wrote:
>> From: liuhailong <liuhailong@oppo.com>
> 
>> If the allocation flag isn't movable, commit 5da226dbfce3 ("mm:
>> skip CMA pages when they are not available") skips CMA during direct
>> reclamation. This generally speeds up the reclamation of non-movable
>> folios. However, in scenarios with limited system memory and a majority
>> of reclaimable folios in LRU being from CMA, this can result in prolonged
>> idle loops where the system reclaims nothing but consumes CPU.
> 
>> I traced the process of a thread entering direct reclamation,
>> and printed the relevant information of the sc(scan_control).
>> __alloc_pages_direct_reclaim start
>> sc->priority:9 sc->nr_skipped_cma:32208  sc->nr_scanned:36  sc->nr_reclaimed:3
>> sc->priority:8 sc->nr_skipped_cma:32199  sc->nr_scanned:69  sc->nr_reclaimed:3
>> sc->priority:7 sc->nr_skipped_cma:198405 sc->nr_scanned:121 sc->nr_reclaimed:3
>> sc->priority:6 sc->nr_skipped_cma:236713 sc->nr_scanned:147 sc->nr_reclaimed:3
>> sc->priority:5 sc->nr_skipped_cma:708209 sc->nr_scanned:379 sc->nr_reclaimed:3
>> sc->priority:4 sc->nr_skipped_cma:785537 sc->nr_scanned:646 sc->nr_reclaimed:3
>> __alloc_pages_direct_reclaim end duration 3356ms
> 
>> Continuously skipping CMA even when the LRU is filled with CMA
>> folios can also result in lmkd failing to terminate processes. The
>> duration of psi_memstall (measured from the exit to the entry of
>> __alloc_pages_direct_reclaim) becomes excessively long, lasting for
>> example a couple of seconds. Consequently, lmkd fails to awaken and
>> terminate processes promptly.
> 
>> This patch introduces no_skip_cma and sets it to true when the number of
>> skipped CMA folios is excessively high. It offers two benefits: Rather
>> than wasting time in idle loops, it's better to assist other threads in
>> reclaiming some folios; This shortens the duration of psi_memstall and
>> ensures timely activation of lmkd within a few milliseconds.
> 
>> Signed-off-by: liuhailong <liuhailong@oppo.com>
>> ---
>>  mm/vmscan.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index fa321c125099..2c74c1c94d88 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -114,6 +114,9 @@ struct scan_control {
>>  	/* Proactive reclaim invoked by userspace through memory.reclaim */
>>  	unsigned int proactive:1;
>>
>> +	/* Can reclaim skip cma pages */
>> +	unsigned int no_skip_cma:1;
>> +
>>  	/*
>>  	 * Cgroup memory below memory.low is protected as long as we
>>  	 * don't threaten to OOM. If any cgroup is reclaimed at
>> @@ -157,6 +160,9 @@ struct scan_control {
>>  	/* Number of pages freed so far during a call to shrink_zones() */
>>  	unsigned long nr_reclaimed;
>>
>> +	/* Number of cma-pages skipped so far during a call to shrink_zones() */
>> +	unsigned long nr_skipped_cma;
>> +
>>  	struct {
>>  		unsigned int dirty;
>>  		unsigned int unqueued_dirty;
>> @@ -1572,9 +1578,13 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
>>   */
>>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
>>  {
>> -	return !current_is_kswapd() &&
>> +	bool ret = !current_is_kswapd() && !sc->no_skip_cma &&
>>  			gfp_migratetype(sc->gfp_mask) != MIGRATE_MOVABLE &&
>>  			folio_migratetype(folio) == MIGRATE_CMA;
>> +
>> +	if (ret)
>> +		sc->nr_skipped_cma += folio_nr_pages(folio);
>> +	return ret;
>>  }
>>  #else
>>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
>> @@ -6188,6 +6198,7 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
>>  			vmpressure_prio(sc->gfp_mask, sc->target_mem_cgroup,
>>  					sc->priority);
>>  		sc->nr_scanned = 0;
>> +		sc->nr_skipped_cma = 0;
>>  		shrink_zones(zonelist, sc);
>>
>>  		if (sc->nr_reclaimed >= sc->nr_to_reclaim)
>> @@ -6202,6 +6213,16 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
>>  		 */
>>  		if (sc->priority < DEF_PRIORITY - 2)
>>  			sc->may_writepage = 1;
>> +
>> +		/*
>> +		 * If we're getting trouble reclaiming non-cma pages and
>> +		 * currently a substantial number of CMA pages on LRU,
>> +		 * start reclaiming cma pages to alleviate other threads
>> +		 * and decrease lru size.
>> +		 */
>> +		if (sc->priority < DEF_PRIORITY - 2 &&
>> +		    sc->nr_scanned < (sc->nr_skipped_cma >> 3))
>> +			sc->no_skip_cma = 1;
>>  	} while (--sc->priority >= 0);
>>
>>  	last_pgdat = NULL;
>> --
>> 2.36.1
> 
> [test] I've tested this patch on MTK 6993 with a kernel based on andorid-16.
> 
eeee
eee


