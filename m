Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B14C91
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816492; cv=fail; b=fQSUX+VXWFJROZDxqjTt6uAH5kiT35j3BLnBzlSR0DlASzEj94DZUWzjNNbQs75iTUThjyHzFcfDPEm0b47dECudkDRir4SUXs1y0aWHKdxppzrdGWnL2Jo/wOi8hEnKlHDW+LwQDxTeGJ+cjXBevNEUtGKxBZL/4wPCwyAYO/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816492; c=relaxed/simple;
	bh=uLdy+y9ZjDfKIGn1CSj/ikappdUn5GPb7GFuhWjMvTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epV9QT1C48S/5Uophr+A2DXXChM0SrIuLS1FM0sbqznp/blYvnOQFZMlJ8RnDwWPXWyNG1MidhAwRXvieiK/rLjbynbgVtaYDxnvdmMj2puAw/+kJQtbV93VE0EKAEsKagEmQDpvEg3f/UEaJeiSM3GI1+xtPpa16FxRIgcfAUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QVQ5/FkU; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QVQ5/FkU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY8TD7Mt5/jLbzEwSzMeI+Z7XKjtBY6EAmd6XmaGBvD77JXoG9pucvwmAnN3hVyYkVM5mWBAqgI8V429XChRk1NRX9RqjHTwz6g+lmVOC10HwlgM5zAc9b3Dl5n76ZWe3INz1qCU1YvWrsV+1Vz02Kqq3/cRWrzancRsrY5sFEMJs5FgSoVk/tOepRiupiKqWvu5lsk8LYYUKu/34IT/T5STPSQeKFVf40MqCh+rxmdxiS1m+oNvVfUK1Kji1u51KYnmLmLzajy3jETBVizgH19r+zNFUm6AoIdvbxCyVH0miMOY2JD5KunLucXgqu5gTg/fe4Z7XHBjRW2Dde8yWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrJj7EHGvwohcflMECtnvDUT6vV/UJTDJtZCytZc2Ws=;
 b=mMgAPZscYLLREOzHxJVZmqd4eE0uLmk6C3OkEisALqj8fTAlBZXzIGwGkSsvMu+XcU0Mer9m0eH7x2pjG9PLMku4vLeNXbc3qN1MF+lKNBMnCCcfiiBdiW8KNfjXfSP+awKle6KNEieASB6IgRkZUZr9uRKL/bSbNUmKeLWUAA6V0MZJuCtTbl9XS+8zntom/m9uKtIniv/f6x40PcJGe6TNZ4y4MoJCMSOl7XdYgu4nM+F0gpQlgmBALyKeI0naxBkdEbRGnmxUYDIK48O/peHSK64wqbopNgUFz+/BRlo0LdwVupRA0xe+czAsKGAsjvZDYcpFcBvfWP7JRKLlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrJj7EHGvwohcflMECtnvDUT6vV/UJTDJtZCytZc2Ws=;
 b=QVQ5/FkUxYHufTGEzREkHKmq+YW0Zt+ozW8vtrvSTLxvMVOey88IhPMK80VF84HoXlnononN9EahReOwlLWYC8S86uAfRjM56qDE6lR615AAl0h5Sy79PdC/AK7RThoTM0bD0RikOhSKYbDe7S1TO40wyu+NrYiU1iu7k7tvDbc=
Received: from CH2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:610:58::14)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 05:01:26 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::85) by CH2PR20CA0004.outlook.office365.com
 (2603:10b6:610:58::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 05:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 05:01:26 +0000
Received: from spgblr-titan-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 00:01:23 -0500
From: Nikhil Dhama <nikhil.dhama@amd.com>
To: <akpm@linux-foundation.org>
CC: <bharata@amd.com>, <huang.ying.caritas@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<mgorman@techsingularity.net>, <nikhil.dhama@amd.com>,
	<oe-lkp@lists.linux.dev>, <raghavendra.kt@amd.com>,
	<ying.huang@linux.alibaba.com>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to trigger free_high
Date: Mon, 28 Apr 2025 10:30:47 +0530
Message-ID: <20250428050047.10491-1-nikhil.dhama@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425191156.c83d082b1c15e46f77c122b3@linux-foundation.org>
References: <20250425191156.c83d082b1c15e46f77c122b3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6f7308-74d8-4c62-8b7c-08dd8611baef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G9SLx3uAueBGgduHROS4ams7Ywqjp0fq7R3srkCi0WOsAR31+t0mg4fTbOVr?=
 =?us-ascii?Q?0cKA+TpsTJNys2arH85GDLm0MTKg/WlDQxmwjTdLGZrfMqURT/+V4y2I4X85?=
 =?us-ascii?Q?/B0v2AebU2eg86JeyE6VH7VHRH8e4oSmMK4LV+C0z0FlRsSZcb771KNhDzHX?=
 =?us-ascii?Q?3cz2bmOQhIn3KKCs+jXeXl0Gl9vpVIex+AzpzQN3ttsL+dZ7NEjqRY2j88tF?=
 =?us-ascii?Q?jO81emIVo4MvwGVcrMSANGo82l4K8caPanY1A/hc7lSUQQ/w+CEHPYTO/CYF?=
 =?us-ascii?Q?ZQFUWEQbUYF+yLAD1/A4X9VshUTU9rYZUw0x/L6c9tq/dZbk3vhBWlma6YU7?=
 =?us-ascii?Q?rHgEHXjtUMuXAQbcuDFHPQToJrzs6zZ0CQrJjBMACDx8ttQ12CJuVXoXUsN+?=
 =?us-ascii?Q?B8HtJ7cY0zwg8/bV+DTRprPg2h/uc5bBw7UVXxs0sShIeIgsD3mh2BOGoa0z?=
 =?us-ascii?Q?2/nBGi0s+qdMv9zZOpITVgPHSjHgqy6cDLvu2QQK8/dLXdFVXNrSTJfluE4C?=
 =?us-ascii?Q?60O7z3L4+ld4PRenj/c89jqoeM9Aitv79AMSPzzHQdnxvseTaocpzm1rdvVG?=
 =?us-ascii?Q?GtF6ua6TNd0Gt0fyNJfroBgKNcfKRkHQuFLvvSBo47ajhGgnm7mrR9exXmse?=
 =?us-ascii?Q?Ua2CUCPIFetxmxwDzt4LWq0otlA4uj5Hijk0LKz4ZEdHJd2WFsuX5cYVasjA?=
 =?us-ascii?Q?2qGpgqIO+UQUguCkmeKlvjudsibonkV9a9H3Y6i01c9B9k9rBF9C4zXSvg+6?=
 =?us-ascii?Q?A10OLzqwttz1DSOQY/PUcPVr+jMmAs4t+r9HUUG68q9D8INfGkJyl3VxIjLh?=
 =?us-ascii?Q?FUpXlyhMVpjTHuq3zZKw9IWrHsX4RKTLCRXf/J3uETVnOUjJmrzVFu3nFjB3?=
 =?us-ascii?Q?T6u+wRTrWoHKzC1e3XBN7AIUJUPpw7KylgBA/JkLj5oJQ7twggdE8p679u//?=
 =?us-ascii?Q?X0RSw2xPJhev2DD1phyMfeu+a/kzfXLXg2hqGHIf0mgcHboK1zkxzED2MJ+l?=
 =?us-ascii?Q?yCozoGZNITSt1w5GnmQP2lGomXUsbOjqPHQEZsDVWu9r66+AYF+hhODkD++Q?=
 =?us-ascii?Q?i5sTs1S4w2A5APlClmyfrMD5EiJXeN+qMK2RNChbX1bGWfIoLoLEvOOpywEc?=
 =?us-ascii?Q?uPILKuR9wfqUOHRZSKHFxQrv7aF+vfDIMDBQPxVhQFe45xYdmi+Alq5yxUUr?=
 =?us-ascii?Q?dEDdFtWgdTWbv8EylHGvkgEfM4suHF0suCIzi01faYMGCuvb1JaRa9ta3MNg?=
 =?us-ascii?Q?AWVOIBfsXM9Jy8DaoV1EeOmv4l9V2BBlJq6paGHIluf/jrfujGhfehT+Vk0+?=
 =?us-ascii?Q?UAkmmKKq7lh0xa9usNd+bm2hnaddixhqc/5gq/rVTtr4WaW1ItHCE5oCa7tV?=
 =?us-ascii?Q?FgdCgcCg1hOe4wWu1DB7c0217se95U9fPJcHXEEKh5pHD50QRVjd2fjyaRmh?=
 =?us-ascii?Q?lePB1DLoee0vph8yHIQZ2eiltujbksrPVq1+XN5us8mc2luwfH3jFnM1ncgL?=
 =?us-ascii?Q?ZHOexGjRLEFsogE0c/0iF7DCv2qV2Ar+Pnz7olJs38kIQwpeopy4yL/SRw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 05:01:26.4680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f7308-74d8-4c62-8b7c-08dd8611baef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

Hi Andrew, 

Sorry, I forgot to CC mm, may be that's why it went unnnoticed.

On 4/26/2025 7:41 AM, Andrew Morton wrote:


> On Fri, 11 Apr 2025 14:15:42 +0800 "Huang, Ying" <ying.huang@linux.alibaba.com> wrote:
>
>>>> in my analysis in
>>>> https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/
>>>> If you think my analysis is correct, can you add that in patch
>>>> description too?  This makes it easier for people to know why the code
>>>> looks this way.
>>>>
>>>
>>> Yes. This makes sense. Andrew has already included the patch in mm tree.
>>>
>>> Nikhil,
>>>
>>> Could you please help with the updated write up based on Ying's
>>> suggestion assuming it works for Andrew?
>>
>> Thanks!
>>
>> Just send a updated version, Andrew will update the patch in mm tree
>> unless it has been merged by mm-stable.
>
> [ two weeks pass ]
>
> Nikhil's attentions are presumably elsewhere.  Could someone (Ying or
> Raghavendra?) please send along altered changelog text which I can
> paste in there?

Please find the updated changelog text as follows:


In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
which is invoked by free_pcppages_bulk().  So, it used to increase
free_factor by 1 only when we try to reduce the size of pcp list and
free_high used to trigger only for order > 0 and order < costly_order
and pcp->free_factor > 0.

For iperf3 I noticed that with older design in kernel v6.6, pcp list
was drained mostly when pcp->count > high (more often when count goes
above 530).  and most of the time pcp->free_factor was 0, triggering
very few high order flushes.

But this is changed in the current design, introduced in commit
6ccdcb6d3a74 ("mm, pcp: reduce detecting time of consecutive high order
page freeing"), where pcp->free_factor is changed to pcp->free_count to
keep track of the number of pages freed contiguously.  In this design,
pcp->free_count is incremented on every deallocation, irrespective of
whether pcp list was reduced or not.  And logic to trigger free_high is
if pcp->free_count goes above batch (which is 63) and there are two
contiguous page free without any allocation.

With this design, for iperf3, pcp list is getting flushed more
frequently because free_high heuristics is triggered more often now.  I
observed that high order pcp list is drained as soon as both count and
free_count goes above 63.

Due to this more aggressive high order flushing, applications doing
contiguous high order allocation will require to go to global list more
frequently.

On a 2-node AMD machine with 384 vCPUs on each node, connected via
Mellonox connectX-7, I am seeing a ~30% performance reduction if we
scale number of iperf3 client/server pairs from 32 to 64.

Though this new design reduced the time to detect high order flushes,
but for application which are allocating high order pages more
frequently it may be flushing the high order list pre-maturely.  This
motivates towards tuning on how late or early we should flush high
order lists.  

So, in this patch, we increased the pcp->free_count threshold to
trigger free_high from "batch" to "batch + pcp->high_min / 2" as
suggested by Ying [1], In the original pcp->free_factor solution,
free_high is triggered for contiguous freeing with size ranging from
"batch" to "pcp->high + batch".  So, the average value is "batch +
pcp->high / 2".  While in the pcp->free_count solution, free_high will
be triggered for contiguous freeing with size "batch".  So, to restore
the original behavior, we can use the threshold "batch + pcp->high_min
/ 2"

This new threshold keeps high order pages in pcp list for a longer
duration which can help the application doing high order allocations
frequently.

With this patch performace to Iperf3 is restored and score for other
benchmarks on the same machine are as follows:

		      iperf3    lmbench3        netperf         kbuild
                               (AF_UNIX)   (SCTP_STREAM_MANY)
                     -------   ---------   -----------------    ------
v6.6  vanilla (base)    100          100              100          100
v6.12 vanilla            69          113             98.5         98.8
v6.12 + this patch      100        110.3            100.2         99.3


netperf-tcp:

                                  6.12                      6.12
                               vanilla    	      this_patch
Hmean     64         732.14 (   0.00%)         730.45 (  -0.23%)
Hmean     128       1417.46 (   0.00%)        1419.44 (   0.14%)
Hmean     256       2679.67 (   0.00%)        2676.45 (  -0.12%)
Hmean     1024      8328.52 (   0.00%)        8339.34 (   0.13%)
Hmean     2048     12716.98 (   0.00%)       12743.68 (   0.21%)
Hmean     3312     15787.79 (   0.00%)       15887.25 (   0.63%)
Hmean     4096     17311.91 (   0.00%)       17332.68 (   0.12%)
Hmean     8192     20310.73 (   0.00%)       20465.09 (   0.76%)

Link: https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/ [1]
Link: https://lkml.kernel.org/r/20250407105219.55351-1-nikhil.dhama@amd.com
Fixes: 6ccdcb6d3a74 ("mm, pcp: reduce detecting time of consecutive high order page freeing")
Signed-off-by: Nikhil Dhama <nikhil.dhama@amd.com>
Suggested-by: Huang Ying <ying.huang@linux.alibaba.com>
Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Raghavendra K T <raghavendra.kt@amd.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Bharata B Rao <bharata@amd.com>


---
 v1: https://lore.kernel.org/linux-mm/20250107091724.35287-1-nikhil.dhama@amd.com/
 v2: https://lore.kernel.org/linux-mm/20250325171915.14384-1-nikhil.dhama@amd.com/

 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b6958333054d..569dcf1f731f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2617,7 +2617,7 @@ static void free_unref_page_commit(struct zone *zone, struct per_cpu_pages *pcp,
 	 * stops will be drained from vmstat refresh context.
 	 */
 	if (order && order <= PAGE_ALLOC_COSTLY_ORDER) {
-		free_high = (pcp->free_count >= batch &&
+		free_high = (pcp->free_count >= (batch + pcp->high_min / 2) &&
 			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
 			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
 			      pcp->count >= READ_ONCE(batch)));
-- 
2.25.1

