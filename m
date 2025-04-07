Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9119D898
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023193; cv=fail; b=Is+sNOolSrebMB7yVhHYIIugDkPZFjhWSgsW0fS2J9rgI1nbsMuQY6IQZuNYLhsUq322dnO0izAhjH2sA02/L/Za2GkVTSzC96ZXb2Arl6MUrubgzVI8fK1nfZx9FUzjnlcXXqXh3R7kWHPY5N48q5ajhL1I+hvYT6g1vEspFtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023193; c=relaxed/simple;
	bh=S4uLNPngnFiBghJT6DYLX302Tp0cwyigiVDfwS7ip6Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HxxX9RU17pXw6dGbHJPNlDWBI6IioiC5c6kZ93SzppHg3akAjzr1Tua2T6O7TZN9njAmpOfBSUS7j4rQVjbZssF7cS2RK5zxhnPwgJh19wzNO550tAhBo4tZAx8ZryF5VBUnjWLZHysnRVQBxvKCsu355I1+g6fD7VipJXWoSso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ccn2mCn7; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ccn2mCn7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K70TMJZIitKxyEWAsFWXkne8bleAoKSAz5ovOaz+Bl/AwzXi2K4xw/0Ha0DdRdbKFVdb1NYnn8a7NT3SE4ApwKaRlboSqM6umBrg4WjwZnuNeY+Gum9pCHk603aw+BfayhzRMEchMkpC1rVa5Fk8mvxbbKS8TwRhuzR0Wervlgf1Fk3w3yskliiqTOrDncxG1twtq+D5oxDNFz6RrrwMNg5Sb2i3GuGFPhVDkD6Ld+p/qB/ogYai/W1zsN+RPjVEmUgb5ZDIi5Sbh4kjqk5a5rWy01/swSlgnmI4R+nZAn0Rz6HrLenpsf7Yn0LtpFeSnWdx6NNhUUhZ9IxLqkmBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STKwmjAGckzu45dpdtFwK9NPJLhhkNR9zABHxHNslYE=;
 b=I2Lbax70ySG5HT746yyuWvQ8ceqXhaZmzJmrLR9yJS4yB2SMSe3NJxxdZgGTTYXE4AkCMfvoFtslV56RFYJh+P9Vi3COKx99xmi/ApY0PIj4IsrZuCxxs3trX2snvOUPfjmBNEE4A9Gp7gZ/dvstaXWn5hUZ27xdsXnvJHhsRqNMPJQwkGnLaBDW80SBnIj33gW0WMrvmId1ejjArfH59JimoyqnVevfXgYfEb0CHxgyPHtm9E+1LtH6yPI66r14dU/ddLZJ7RwM9OUBPdlIJq4VyLhEnmHRlZDD5P04TYDL3nem3xK1x7FQ7dwW10SLSEyykggFRuX1U/IT3986lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STKwmjAGckzu45dpdtFwK9NPJLhhkNR9zABHxHNslYE=;
 b=ccn2mCn7e32+bpD8RwOmPN/2lWOpxY2wy8XZnsjWAVaojrJRM3AumOVSoCWYCbYXF4yo+KfoSAEZ0AEAR7TMJ/DVVsRLB7J0ejNX6tg5O3mylRmvBC2U63u1GmSZi/QWFyZXfYhPHYPRXmGnALvG8YWmCvmHCzW0w3o3t/Lbep8=
Received: from BYAPR11CA0062.namprd11.prod.outlook.com (2603:10b6:a03:80::39)
 by PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 10:53:05 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::79) by BYAPR11CA0062.outlook.office365.com
 (2603:10b6:a03:80::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 10:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 10:53:05 +0000
Received: from spgblr-titan-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 05:53:01 -0500
From: Nikhil Dhama <nikhil.dhama@amd.com>
To: <akpm@linux-foundation.org>
CC: <bharata@amd.com>, <raghavendra.kodsarathimmappa@amd.com>,
	<ying.huang@linux.alibaba.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	Nikhil Dhama <nikhil.dhama@amd.com>, Huang Ying
	<huang.ying.caritas@gmail.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>
Subject: [PATCH v3] mm: pcp: increase pcp->free_count threshold to trigger free_high
Date: Mon, 7 Apr 2025 16:22:19 +0530
Message-ID: <20250407105219.55351-1-nikhil.dhama@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ac53d4-5723-48f7-67e4-08dd75c26045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pn+fYDfphvBPqIPU3fhegXOPydj15AYLty77jX94mpGHXavuS1fFGNbiTG6I?=
 =?us-ascii?Q?8Du1eLTvfMFC6uJpv70YEm+eRwutUzXqrMUaoo7Ul/TUwGeqY1aiwAtOns71?=
 =?us-ascii?Q?DZJev1HfvSdanioPdmKWz8R/nArkbkmk8To8F4QQQOsH0hMeGk2mJhb3z4tM?=
 =?us-ascii?Q?b+Fp8dyl9wxsjabkX6FwOA0CuK9C5dNH4ZkVjfPEr5Xx2c9ltHrzKT4Cagrc?=
 =?us-ascii?Q?K7QWClnSZCxADq9wTZMLA9pqd6+n+v2bSEqeIurGBnI29dXXVIHpfEyElwO7?=
 =?us-ascii?Q?oBpvhdrJgF1qG1KuWgKdM8OkM0/uKliEnTBrCZ0cCb9r3OZsthA+PcylLQij?=
 =?us-ascii?Q?3uZV8sy1hoFJA8jp605L5pIbHRu9BgBD6/yWEfR9jHZh06TaIoT85uvac5o+?=
 =?us-ascii?Q?i08XXxw+LOoyDhrqQBGlwTndamKMAy+RcfQ1kTKJKA36mi2jGY2DEa9ZAQvI?=
 =?us-ascii?Q?/ivqLZ/W0myg+XHUDPufZGFj1c360wCJZTSqS7gWQYsWkDePhgTQI4fEXwfz?=
 =?us-ascii?Q?a2FPXTq3PFotTjuYpbMDSpO98J6gAnA0Zxu6kMwlXg2AmZ/1Y2VZfpzOQK3f?=
 =?us-ascii?Q?CnnKcJSa6BNRb6A3P1D1idxQtiuLCchmQ7sDZBA4+jEK41IfN4TN3XFW7ml8?=
 =?us-ascii?Q?rBKYBCNN2Dvi1RGyWIn8UryBlUtz8BJ+kqWr4cWVT7RwlC5JMX0musZ3h7Th?=
 =?us-ascii?Q?2D5xM/F6KSFOpQajN2XB/AmC/36BQ8HxSrCodowilxiYAJOVP1AEYkmWXxeb?=
 =?us-ascii?Q?T3Vo9lbsaSOkWrUSgky4xcmPlUMfXAQXpDcwy+sLpuQi/71WeQMFlbcW6G5e?=
 =?us-ascii?Q?e4S+JCJE504nzMuqAnro0tP6H/60QrqdW5rN7CIqR6f/48zPEswB8ksd2qE9?=
 =?us-ascii?Q?6kTmTvOoomPbKHlPo+BvYAWTDKbToQqXHWYMbbYtq03nuVkwhJEpjNBQcYSz?=
 =?us-ascii?Q?LBdgEPRA9l+XUejXcEcmoSGWkKUku66zCrvR42OkgjamTw+Go3ZywusFZgz6?=
 =?us-ascii?Q?LlBW7miM2MmcEZZl0n6DuqyY815+1MbGx7yGwLMGuiUS/+gXay6NFK6iNeJc?=
 =?us-ascii?Q?vt+PAq+vEO2iGtttoXKvAjmpClzu2B28RpXDIG+qJ++Lb0/ozUgMkqIayZel?=
 =?us-ascii?Q?8voVtQk0io9c1VTkH4t0kIhGu5IFyBiSamCEGxi/tPW5xiTL08h4jYPhJzv0?=
 =?us-ascii?Q?G78kY938OMuDYCUQ952eb9PtQyDFb4M4o4g+GKJrRf8hbwPWDuHATnTyPTWK?=
 =?us-ascii?Q?sQhsyRj8iGl6PxurbI425YOpbofmgHN8DXoh63GN+tTaAevul9Z+GuHXMy9z?=
 =?us-ascii?Q?zWRQk4DYKQkL/HumB+bdeic4Fp4CkDDVVEz5yiOhqxjtpj1VxWAXpYttYdg2?=
 =?us-ascii?Q?bpA3i+FsL2CFEN15jT8nx0L7vsisdc0kG0sfp2iwd1WvzmVgjKpU2M8vM0aP?=
 =?us-ascii?Q?ZxVZmYTVm7mTaHhNnDcbPP78EeVNLb8AbmgfGuFM5H+nv/QSidbqqQfgWS2x?=
 =?us-ascii?Q?2rdmE7LrOVHTb70=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:53:05.4338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ac53d4-5723-48f7-67e4-08dd75c26045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173

In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
which is invoked by free_pcppages_bulk(). So, it used to increase
free_factor by 1 only when we try to reduce the size of pcp list or
flush for high order, and free_high used to trigger only 
for order > 0 and order < costly_order and pcp->free_factor > 0.

For iperf3 I noticed that with older design in kernel v6.6, pcp list was
drained mostly when pcp->count > high (more often when count goes above
530). and most of the time pcp->free_factor was 0, triggering very few
high order flushes.

But this is changed in the current design, introduced in commit 6ccdcb6d3a74 
("mm, pcp: reduce detecting time of consecutive high order page freeing"), 
where pcp->free_factor is changed to pcp->free_count to keep track of the 
number of pages freed contiguously. In this design, pcp->free_count is 
incremented on every deallocation, irrespective of whether pcp list was 
reduced or not. And logic to trigger free_high is if pcp->free_count goes 
above batch (which is 63) and there are two contiguous page free without 
any allocation.

With this design, for iperf3, pcp list is getting flushed more frequently 
because free_high heuristics is triggered more often now. I observed that 
high order pcp list is drained as soon as both count and free_count goes 
above 63.

Due to this more aggressive high order flushing, applications
doing contiguous high order allocation will require to go to global list
more frequently.

On a 2-node AMD machine with 384 vCPUs on each node,
connected via Mellonox connectX-7, I am seeing a ~30% performance
reduction if we scale number of iperf3 client/server pairs from 32 to 64.

Though this new design reduced the time to detect high order flushes,
but for application which are allocating high order pages more
frequently it may be flushing the high order list pre-maturely.
This motivates towards tuning on how late or early we should flush
high order lists. 

So, in this patch, we increased the pcp->free_count threshold to 
trigger free_high from "batch" to "batch + pcp->high_min / 2". 
This new threshold keeps high order pages in pcp list for a 
longer duration which can help the application doing high order
allocations frequently.

With this patch performace to Iperf3 is restored and 
score for other benchmarks on the same machine are as follows:

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

Fixes: 6ccdcb6d3a74 ("mm, pcp: reduce detecting time of consecutive high order page freeing")

Signed-off-by: Nikhil Dhama <nikhil.dhama@amd.com>
Suggested-by: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Huang Ying <huang.ying.caritas@gmail.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: Mel Gorman <mgorman@techsingularity.net>

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

