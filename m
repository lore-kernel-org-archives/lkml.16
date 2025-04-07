Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD64221DAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007658; cv=fail; b=AJm2Ug1+ejA0kT/q5Z3fn4wi47+Hp4OK8L/f6K7nvtCm+e08KgYAkNA9HcIsPgVD1YZr1FpTu03QY7lPj0L4gc/jTewe3RjkjSHArTd/6mKWsxU8xC1t9Zto0/UDYDWKXi+mVEuUm6V7kq7jT1h5YKK+tHsKVgm8LQn0mSi6bZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007658; c=relaxed/simple;
	bh=wjTZK37c+ClVMQWDaI2MMSwDJ/Q+U800CGS0Uam9Cto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3Tfdq/dEscQTQtrjT4xgsont1wV1Iyt0XxrWv3N924vF3SirePSymLydeK0tbn+FnJB33UI7Xdf+0DCvXCNaZhtKqOivBRkVKjGFq6WWPWJR+i4B8TwzcYgkO9x0IsQ+g0Y+A3/nqWpaqlKYlOBTA5StS9taFaHBm0J917EkwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aSY/D0t/; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aSY/D0t/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz4jbfVuJxBba7PwDEaZqcA+xx6jq0nMEV3DW0qciOTe7lvi1/g4hYwUxcK4RouwZ+IuFoktqI7pNDoyxIYIcLrUqUibImg6Q9Y3ZfbaS01o/Z47J5XIqgpVRlzF2WG/rmMRwNeJiFLEyXxRgdgNM5S5EYLLyLYvzBocWAjTnPEFn+kcOLxiSzqyVI013IAwu5P16HRXEDeOYvYXdhbKOKySPeg3IF/GOYECKOWg5aoqjUycVELs+CE8GzVSoZkDRPEexXHp5nq0ymGUTPLBs6Le9eaW9qELi8JgAZXCLObhRqUXImmXmBvgQfaBuAhSR4uJmkphikFIMvmwkSMvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2F0VtLMqXlUovE3h19aajWpNhTPGDOFZnO1dibnpDU=;
 b=V+kc7+lQENaGs8QkDwyh7Gw0Qq06necpV38C5WGmoM2mpKSWbo5R7M0oUPfDbuTNTowZwXAYipJLwoCKVnPUWR3bFgu4oyTpY0FabeZGbWPY/0cEli0+QVIWWk4u0wqZfcv37onXe5VZ2h1X1k4bO9+gGCwz6kpRHOug4G3ed6rxGkmsh/1bP3H9GIiXZI7PXXnC1mdKfSDNLkIJOt309jTSz0EHjmr8OEWSaXbLJjnHBdpT+vQ/ubb+MN856cK7pGxp6ipi/H4zL5+wW+kHgzkzuLI3PnXBnXR2fokZRFLUgTtJEBRRwbwRaPKERPkzaNrtEDd4ME0aNGdnBMTGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2F0VtLMqXlUovE3h19aajWpNhTPGDOFZnO1dibnpDU=;
 b=aSY/D0t/3MuKfatzF3RhipN4zYpv57A3WGhMfK1pBT8VzE3xn2R4IM3qSNtm7giSBH+JSYv4HxvnuNdzQ1PKhcV/rkm1miLH67A9QbkmD8XRRsEcPzl2FmOve2HTJDUt07c+j+vQuXSimJdF6DdNL5HgcOW3HMA4uMjuCRiTaSU=
Received: from DS7PR06CA0045.namprd06.prod.outlook.com (2603:10b6:8:54::26) by
 MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 06:34:10 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::5) by DS7PR06CA0045.outlook.office365.com
 (2603:10b6:8:54::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 06:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 06:34:10 +0000
Received: from spgblr-titan-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 01:34:06 -0500
From: Nikhil Dhama <nikhil.dhama@amd.com>
To: <ying.huang@linux.alibaba.com>
CC: <akpm@linux-foundation.org>, <bharata@amd.com>,
	<huang.ying.caritas@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mgorman@techsingularity.net>,
	<raghavendra.kodsarathimmappa@amd.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, Nikhil Dhama <nikhil.dhama@amd.com>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp flushes on deallocation
Date: Mon, 7 Apr 2025 12:02:59 +0530
Message-ID: <20250407063259.49271-1-nikhil.dhama@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <875xjmuiup.fsf@DESKTOP-5N7EMDA>
References: <875xjmuiup.fsf@DESKTOP-5N7EMDA>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 003e7635-b9c2-48f1-237f-08dd759e3475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RxnMF3vSnZjgJnj70/OZ4U1bP62XZxBkNZCAoBPqBIIggLtNGUVXAhXS7Nzf?=
 =?us-ascii?Q?gv0v++BjAQgHKA3kyPitQrXEkyNp3PBfW6YhliTSF5BUP4WZLLsLmsxK6J5e?=
 =?us-ascii?Q?d/Qi4ApT0VAVEAAa9xTARelni0Py22lU/Zwwe96LueYfz4PPS+5lA8RqkuUc?=
 =?us-ascii?Q?dmtqNgKAFCdxQz7O4+D58WK90PBykumCjdTmlBuNI/K0geBcmffzwVlGtV0y?=
 =?us-ascii?Q?GwFhMNORAY6OixcfUoOPbY0/McUmpPfdYQFkzDQX4uMx77mOkIq/Az+zAPcN?=
 =?us-ascii?Q?p+G/hOFBYk3RMOdKQvsQiKThzfGvjRUy9hYFuZjn8Cs621xdZYZxTEHpoUcH?=
 =?us-ascii?Q?t3K66frtILLrcwFQhjWa3cZhX/UsDlMrs9bhonYDdEJUVrAoHXtkUSesQiJ9?=
 =?us-ascii?Q?7EZr9x4gutCqalhQb5aDGqWsOqJHYowBuXRF9+1H87PfluBUKzixkXaUCZkc?=
 =?us-ascii?Q?Slfm1l/i7USIIlU36gGuIjIBcR3DLAMIfN/5ltKNYG9Ur9IT5oZdJE2Ut0BN?=
 =?us-ascii?Q?IMYo4G8K6ijlcfdef5brRXmSYEY3IuUKEJD7nljtdKGd/0kelC6FIEssB04O?=
 =?us-ascii?Q?cTodoJ/ulk3r5lLc9ixtA41tFUDJXHaIizAcF/N15KDec27PSiNHdBR67rym?=
 =?us-ascii?Q?bES62SXbQ3pBgFM9nAeMXPk2DbR6v5TemvePm3NyMht13gFUQK8V9o07eC5i?=
 =?us-ascii?Q?YdMs6LPPjRVzB1WPHBXfX1jIyIbDqrtLuiyhWa2hQNHgaFREKEtYGlVQpYOd?=
 =?us-ascii?Q?M5pmHRgIjSx2sAxYz2UWZ/1c+X4AGGT5g8U4bjof/7H3I+ysOwWAC7IIAh+x?=
 =?us-ascii?Q?lcf0WuR+4vHXadXttHHe7LA8H6ppwTK8VZ+UIDImUONUCXKpn8dowZAjnztp?=
 =?us-ascii?Q?ELq5Oz3I502HKxcqd+eV11gw1FCRwoHWKI147GctBvmkFZ2Jz9Ge9wWOZ+4i?=
 =?us-ascii?Q?i2BJ6bWxygpoWjSGIkaJx0SdMRoRu4xADBGfQJk50fMmTVUGnVvOsc0/mry3?=
 =?us-ascii?Q?l+TZeTmvV/GvhL0aeJ1ytgIEXZdBe8N/YDlR9kb78F5BEiopMMv6GT5n/u3m?=
 =?us-ascii?Q?H9PIMF1p9OF4HsnHvgpUjXSkfMYm2yEI7hIj7vhHOHPffoNLFnoNRd8agkg2?=
 =?us-ascii?Q?I619Kg4aa408Myxw+oOUiH3mSxPSRix5kyvXUn0yLj2pL1b3sp5L9vmyYesL?=
 =?us-ascii?Q?o0iJAsFKTcDnNsMvMPxqXJypa0hS4nqOOy8mGuRhmYgduba1h6L5J0YfJ2a9?=
 =?us-ascii?Q?v8WoClfoRdP42DuQZkBy/hx98pJz/IdHroq6ekzy9yvhAWxsov1U23UnO+0t?=
 =?us-ascii?Q?ZB35csolwxl2Yz5kFDYEoLjMhLX7zzyuCUZ2j1eFa5+KQPFcN7V1KF4CRutx?=
 =?us-ascii?Q?GTOsOt00NV8Dlt+FGV6+0PvjZc1daWDdu3m2+wTQWxyPMjdBeqme6NxINf/i?=
 =?us-ascii?Q?3ilZ8pqcTkeD95tETRsi0LXrAzjGjBT4rQuo1K6hqtXCeuhILGR7V8zIEfre?=
 =?us-ascii?Q?+OV/JrLI6pxqHCU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:34:10.0446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003e7635-b9c2-48f1-237f-08dd759e3475
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

On 4/3/2025 7:06 AM, Huang, Ying wrote:

>
> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>
>> On 3/30/2025 12:22 PM, Huang, Ying wrote:
>>
>>>
>>> Hi, Nikhil,
>>>
>>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>>
>>>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>>>> which is invoked by free_pcppages_bulk(). So, it used to increase
>>>> free_factor by 1 only when we try to reduce the size of pcp list or
>>>> flush for high order.
>>>> and free_high used to trigger only for order > 0 and order <
>>>> costly_order and free_factor > 0.
>>>>
>>>> and free_factor used to scale down by a factor of 2 on every successful
>>>> allocation.
>>>>
>>>> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
>>>> drained mostly when pcp->count > high (more often when count goes above
>>>> 530). and most of the time free_factor was 0, triggering very few
>>>> high order flushes.
>>>>
>>>> Whereas in the current design, free_factor is changed to free_count to keep
>>>> track of the number of pages freed contiguously,
>>>> and with this design for iperf3, pcp list is getting flushed more
>>>> frequently because free_high heuristics is triggered more often now.
>>>>
>>>> In current design, free_count is incremented on every deallocation,
>>>> irrespective of whether pcp list was reduced or not. And logic to
>>>> trigger free_high is if free_count goes above batch (which is 63) and
>>>> there are two contiguous page free without any allocation.
>>>> (and with cache slice optimisation).
>>>>
>>>> With this design, I observed that high order pcp list is drained as soon
>>>> as both count and free_count goes about 63.
>>>>
>>>> and due to this more aggressive high order flushing, applications
>>>> doing contiguous high order allocation will require to go to global list
>>>> more frequently.
>>>>
>>>> On a 2-node AMD machine with 384 vCPUs on each node,
>>>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>>>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>>>
>>>> So, though this new design reduced the time to detect high order flushes,
>>>> but for application which are allocating high order pages more
>>>> frequently it may be flushing the high order list pre-maturely.
>>>> This motivates towards tuning on how late or early we should flush
>>>> high order lists.
>>>>
>>>> for free_high heuristics. I tried to scale batch and tune it,
>>>> which will delay the free_high flushes.
>>>>
>>>>
>>>>                       score   # free_high
>>>> -----------           -----   -----------
>>>> v6.6 (base)           100             4
>>>> v6.12 (batch*1)        69           170
>>>> batch*2                69           150
>>>> batch*4                74           101
>>>> batch*5               100            53
>>>> batch*6               100            36
>>>> batch*8               100             3
>>>>
>>>> scaling batch for free_high heuristics with a factor of 5 or above restores
>>>> the performance, as it is reducing the number of high order flushes.
>>>>
>>>> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with
>>>> patch v2 along with iperf3 are as follows:
>>>
>>> Em..., IIUC, this may disable the free_high optimizations.  free_high
>>> optimization is introduced by Mel Gorman in commit f26b3fa04611
>>> ("mm/page_alloc: limit number of high-order pages on PCP during bulk
>>> free").  So, this may trigger regression for the workloads in the
>>> commit.  Can you try it too?
>>>
>>
>> Hi, I ran netperf-tcp as in commit f26b3fa04611 ("mm/page_alloc: limit
>> number of high-order pages on PCP during bulk free"),
>>
>> On a 2-node AMD server with 384 vCPUs, results I observed are as follows:
>>
>>                                   6.12                     6.12
>>                                vanilla   freehigh-heuristicsopt
>> Hmean     64         732.14 (   0.00%)        736.90 (   0.65%)
>> Hmean     128       1417.46 (   0.00%)       1421.54 (   0.29%)
>> Hmean     256       2679.67 (   0.00%)       2689.68 (   0.37%)
>> Hmean     1024      8328.52 (   0.00%)       8413.94 (   1.03%)
>> Hmean     2048     12716.98 (   0.00%)      12838.94 (   0.96%)
>> Hmean     3312     15787.79 (   0.00%)      15822.40 (   0.22%)
>> Hmean     4096     17311.91 (   0.00%)      17328.74 (   0.10%)
>> Hmean     8192     20310.73 (   0.00%)      20447.12 (   0.67%)
>>
>> It is not regressing for netperf-tcp.
>
> Thanks a lot for your data!
>
> Think about this again.  Compared with the pcp->free_factor solution,
> the pcp->free_count solution will trigger free_high heuristics more
> early, this causes performance regression in your workloads.  So, it's
> reasonable to raise the bar to trigger free_high.  And, it's also
> reasonable to use a stricter threshold, as you have done in this patch.
> However, "5 * batch" appears too magic and adapt to one type of machine.
>
> Let's step back to do some analysis.  In the original pcp->free_factor
> solution, free_high is triggered for contiguous freeing with size
> ranging from "batch" to "pcp->high + batch".  So, the average value is
> about "batch + pcp->high / 2".  While in the pcp->free_count solution,
> free_high will be triggered for contiguous freeing with size "batch".
> So, to restore the original behavior, it seems that we can use the
> threshold "batch + pcp->high_min / 2".  Do you think that this is
> reasonable?  If so, can you give it a try?

Hi, 

I have tried your suggestion as setting threshold to "batch + pcp->high_min / 2",
scores for different benchmarks on the same machine 
(2-Node AMD server with 384 vCPUs each) are as follows:

                      iperf3    lmbench3            netperf         kbuild
                               (AF_UNIX)      (SCTP_STREAM_MANY)
                     -------   ---------      -----------------     ------
v6.6  vanilla (base)    100          100                  100          100
v6.12 vanilla            69          113                 98.5         98.8
v6.12 avg_threshold     100        110.3                100.2         99.3

and for netperf-tcp, it is as follows:

                                  6.12                     6.12
                               vanilla   avg_free_high_threshold
Hmean     64         732.14 (   0.00%)        730.45 (  -0.23%)
Hmean     128       1417.46 (   0.00%)       1419.44 (   0.14%)
Hmean     256       2679.67 (   0.00%)       2676.45 (  -0.12%)
Hmean     1024      8328.52 (   0.00%)       8339.34 (   0.13%)
Hmean     2048     12716.98 (   0.00%)      12743.68 (   0.21%)
Hmean     3312     15787.79 (   0.00%)      15887.25 (   0.63%)
Hmean     4096     17311.91 (   0.00%)      17332.68 (   0.12%)
Hmean     8192     20310.73 (   0.00%)      20465.09 (   0.76%)

Thanks,
Nikhil Dhama
