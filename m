Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048C2040B2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515845; cv=fail; b=UpavmyhWEewR1u1PKQz9cEXniQBx58Q8aEKPWgA4fKPf+KUQxta1oK84z3Xzb08nU2/EmBsJ+iDpSdjTwLruckDJMQ5HwzgQjuJGsI/lxnRxrUSvgM4DmDEtQs9w8kgHmNL9vlpc6+/6iWJO7pwdE/jzlof2XX9gGcYwvwQ8U94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515845; c=relaxed/simple;
	bh=h75P6kjDyG446TIgKhkdSsVVAhWn9wbH7FIW7Skd3/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rqAv0EY47p3ghfFJ1sTYkf0Zkg5zsyLj5AGSsaZd78sQQ4Zlo8T9yeYMbCn50Ji45EVtAitL69T1Dud6MGrk0dHO1mK0J8H3wnFBfkVy5lfU8hhwy9iFm36WRTYxJYlhSytrCcIl6gdcmBxMtKvOm1NslOsmZMhfF79uAtpPdm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jvi/eUOz; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jvi/eUOz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thzbNun7ZF3xJQz/pY69IDsDwSjOu8nf8TgnZ7FPepRzLP447XMtWDG9wobJar9KYWhDyY2MQeu8a1MbtTftzOrZi7zPErLDfqsxIR9s+QFlthG8B3UiSjCiSlLFDK/pBOerTzgDdRTbWYXLD9JnELZnnQFBCdEx67JNp5YSuMqRlG1RO6LpK2a4/I1xQPkG86liASs4seZduAR0NBRGsUnKe6OHKZyyvXM5kVHvouZox0X09eGhwDMVIFcgSYqS6fsDtvQWdmmh+xQR3ZQP4AGLMnI08bVQbjkeQ2PT9T1TFXYRXjyfC5o7c1/9LvUZbDzzY9npoZme8MzWoKEVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+ONV7n8KEuhdBr3MlPs2Zi1tt7JAfVRENI0P3VxEBw=;
 b=E/2tfiwov46CPRD3kPIEdF0xLi+BarkJZpmA4UVdfYIDz0u13BGg3AD6eQ/XP/20prNVOs0OTiPfGBqlccZkDH4kPgNirfJne2V91SjDzeFu0MBNhWfOz+nQlrPAN0zvgEo0wa8GbslVi3ief83ksQD9kBWxK+gz+KpMpMg0lKOWG28Oy3WRp7CL7KjyrEjmEH9P6iwyONas4uG1K5tN+715cllYrbrmVnP9JFkFDvwGmSv7AUA4D7lW9HQtvPlxvbYArlqPw3JjGlPKdC0E88jPPXLbDFdoPjxcl9KyM8zVaBqBPiudNNUcgUVoKoo9EAptZC0/PCB2qrGj0Yj5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+ONV7n8KEuhdBr3MlPs2Zi1tt7JAfVRENI0P3VxEBw=;
 b=Jvi/eUOz7AhNNZAG84GrWpp6Y41PMQNFXAExN46A8QAY60wNWYH5Ege2vnhipE/7+R34w9ib1TSymYLosdTAutQIO+YELjl0vobsL85EXPhjKFzdQoFDOk2+oyfOYRh6nx7NaX9RdlVVWzIYoVlyupIr7bhasZTDIwRS/VPm0E0=
Received: from MW4PR03CA0179.namprd03.prod.outlook.com (2603:10b6:303:8d::34)
 by CY1PR12MB9603.namprd12.prod.outlook.com (2603:10b6:930:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Tue, 1 Apr
 2025 13:57:21 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::e4) by MW4PR03CA0179.outlook.office365.com
 (2603:10b6:303:8d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 13:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 13:57:20 +0000
Received: from spgblr-titan-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 08:57:17 -0500
From: Nikhil Dhama <nikhil.dhama@amd.com>
To: <ying.huang@linux.alibaba.com>, <akpm@linux-foundation.org>
CC: <bharata@amd.com>, <huang.ying.caritas@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<mgorman@techsingularity.net>, <raghavendra.kodsarathimmappa@amd.com>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, Nikhil Dhama
	<nikhil.dhama@amd.com>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp flushes on deallocation
Date: Tue, 1 Apr 2025 19:26:38 +0530
Message-ID: <20250401135638.25436-1-nikhil.dhama@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202503312148.c74b0351-lkp@intel.com>
References: <202503312148.c74b0351-lkp@intel.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CY1PR12MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcf98b6-36fd-493f-eb37-08dd71251f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wf5f/L6sbCT3W0w7bHouZEQpt/vt5HOe0jWNiH50O98YA4mTmDSkAkkJ2KS+?=
 =?us-ascii?Q?wmhJCri0DOZr3LVIn2HFeTeRVkKxhGe7z9FCN3zbMcEyyVN3ZH1wqWMXPDBZ?=
 =?us-ascii?Q?pvhg9EL2O+FAMTD9D/ghYjon9tKt04DCeV0iR2+X1FQof2DqwdBAeORfxKP0?=
 =?us-ascii?Q?99kGtKdRysCOUtEZx4nEc9NodcdGO8qS4lfEkH/5R73ACg2eyvd/OGzrI7aq?=
 =?us-ascii?Q?6OGR/B1xN7ymQHabOCo4Xg8YAl2SUHJuIzTd7ztP18GtAh/ZR8WaI1iodEqr?=
 =?us-ascii?Q?GyFtb/t6Yh0KgtDzYxVFonOWSfbPD8akAFNgwV305DwZv4RtxVJnCw9duK9v?=
 =?us-ascii?Q?gk0z8JE6qHOEff283f0HrsSfaOy3jfYzBgvk+oHnM2XY76enaFfha4pCOy7k?=
 =?us-ascii?Q?k2LoZZMoMW+hwP/tVZIV8Hu/7d2KImDsZ24aofFAwhSCmbQ+zbrMREaBERRb?=
 =?us-ascii?Q?ML8d7srLPWge14S+s9RuNYPEkdBiBFw2zbzOn9RVSuR0nVViGRvYcEDUUYT1?=
 =?us-ascii?Q?V7AoadZw5MrZd0U3TK5neyY0/+wuqQNn3tlnzFahEKZa+1r3aIswFQd8VJ4E?=
 =?us-ascii?Q?SVmg21/mohfCF5gryADCrt7B25wtA8Kn9PrsWaqb3M8+6Hwc/tpmxb61f2aa?=
 =?us-ascii?Q?CQ8Ua/qUDPqkp99mW8SwXOfgOiKTer17XOxTrPHhPogQWH3/pINTUx20+j7D?=
 =?us-ascii?Q?o/eNWIWWhqwoIKETzRWOsWqDUhdoAeauMrCUMXlXaQ+QSxQODobshw0FP5fp?=
 =?us-ascii?Q?sPQORcFCE7vvWa11iR+iHXB3ae6g3k12NREMt58u3sHCAa8l51eL/d5WRLJN?=
 =?us-ascii?Q?S5tVWwHj3ev5++jerJpzpF1DYLWC/eO7qjEzSx+YEO9PB91IIrNB0sDvdY6u?=
 =?us-ascii?Q?XV9aCsZd8Pw1KlclaYXUpFhJY8n5+5c/dtFWNJ4jh41QS1Qo0c7zSVBA2Hoc?=
 =?us-ascii?Q?wgeFS7OdypdUGq0xjwsBAkQFKn4Gw6UNFlEKQr5FUauEMA5Z16FoBuL2Pi71?=
 =?us-ascii?Q?NS+rrtFn8iylv0N6E3j+jjkGk6EBjO68++KHzmHtwGEuOWFEcRSA+p00LS7n?=
 =?us-ascii?Q?6cVPpuCniQ8bq+p/iCrM84INy5+DpIGJZIPbJSv3eilDiEjlfxNeLMYGUleq?=
 =?us-ascii?Q?Sm6kzvFMMtAkeArCxbY/hZbnmyyNxYGmfSp+zM1FgJkVtWZNqsXWuzMH6+yG?=
 =?us-ascii?Q?ErIhdD6IO4pmVi78Nv8bpHJy2bwLiREtLayZuHk0f+aOKYPhB7+T+WU/AYxJ?=
 =?us-ascii?Q?anSCgB4CsyRUDbnMWXwVV49y4qByeVIr6pd61oNJnrbcT0M0/t+nGdggalTS?=
 =?us-ascii?Q?zE9xXIILZZZoUAg3Bnaemfn1HKfS2qniYQrjFXN+BvkGfS0At1tbwGvvT5VF?=
 =?us-ascii?Q?fm4pNxlVC1lXEWtOsFqMo8EDK3AzMsC26F5kq4G/ImHY9zWPC0r+LWvhTwVV?=
 =?us-ascii?Q?tWFkRzGTkcW5v5dFKSDM+eqosvQkhmNL2e/kKE75bEqpDV7K5b65yEYfZlSS?=
 =?us-ascii?Q?1AumropeBA/amGM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 13:57:20.9180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcf98b6-36fd-493f-eb37-08dd71251f5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9603


On 3/30/2025 12:22 PM, Huang, Ying wrote:

>
> Hi, Nikhil,
>
> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>
>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>> which is invoked by free_pcppages_bulk(). So, it used to increase
>> free_factor by 1 only when we try to reduce the size of pcp list or
>> flush for high order.
>> and free_high used to trigger only for order > 0 and order <
>> costly_order and free_factor > 0.
>>
>> and free_factor used to scale down by a factor of 2 on every successful
>> allocation.
>>
>> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
>> drained mostly when pcp->count > high (more often when count goes above
>> 530). and most of the time free_factor was 0, triggering very few
>> high order flushes.
>>
>> Whereas in the current design, free_factor is changed to free_count to keep
>> track of the number of pages freed contiguously,
>> and with this design for iperf3, pcp list is getting flushed more
>> frequently because free_high heuristics is triggered more often now.
>>
>> In current design, free_count is incremented on every deallocation,
>> irrespective of whether pcp list was reduced or not. And logic to
>> trigger free_high is if free_count goes above batch (which is 63) and
>> there are two contiguous page free without any allocation.
>> (and with cache slice optimisation).
>>
>> With this design, I observed that high order pcp list is drained as soon
>> as both count and free_count goes about 63.
>>
>> and due to this more aggressive high order flushing, applications
>> doing contiguous high order allocation will require to go to global list
>> more frequently.
>>
>> On a 2-node AMD machine with 384 vCPUs on each node,
>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>
>> So, though this new design reduced the time to detect high order flushes,
>> but for application which are allocating high order pages more
>> frequently it may be flushing the high order list pre-maturely.
>> This motivates towards tuning on how late or early we should flush
>> high order lists.
>>
>> for free_high heuristics. I tried to scale batch and tune it,
>> which will delay the free_high flushes.
>>
>>
>>                       score   # free_high
>> -----------           -----   -----------
>> v6.6 (base)           100             4
>> v6.12 (batch*1)        69           170
>> batch*2                69           150
>> batch*4                74           101
>> batch*5               100            53
>> batch*6               100            36
>> batch*8               100             3
>>
>> scaling batch for free_high heuristics with a factor of 5 or above restores
>> the performance, as it is reducing the number of high order flushes.
>>
>> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with
>> patch v2 along with iperf3 are as follows:
>
> Em..., IIUC, this may disable the free_high optimizations.  free_high
> optimization is introduced by Mel Gorman in commit f26b3fa04611
> ("mm/page_alloc: limit number of high-order pages on PCP during bulk
> free").  So, this may trigger regression for the workloads in the
> commit.  Can you try it too?
>

Hi, I ran netperf-tcp as in commit f26b3fa04611 ("mm/page_alloc: limit 
number of high-order pages on PCP during bulk free"),

On a 2-node AMD server with 384 vCPUs, results I observed are as follows:

                                  6.12                     6.12
                               vanilla   freehigh-heuristicsopt
Hmean     64         732.14 (   0.00%)        736.90 (   0.65%)
Hmean     128       1417.46 (   0.00%)       1421.54 (   0.29%)
Hmean     256       2679.67 (   0.00%)       2689.68 (   0.37%)
Hmean     1024      8328.52 (   0.00%)       8413.94 (   1.03%)
Hmean     2048     12716.98 (   0.00%)      12838.94 (   0.96%)
Hmean     3312     15787.79 (   0.00%)      15822.40 (   0.22%)
Hmean     4096     17311.91 (   0.00%)      17328.74 (   0.10%)
Hmean     8192     20310.73 (   0.00%)      20447.12 (   0.67%)

It is not regressing for netperf-tcp. 

Thanks,
Nikhil Dhama
