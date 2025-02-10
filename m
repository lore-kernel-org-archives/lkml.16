Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B154782
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178168; cv=fail; b=j7u2iwRCoRipBC+5uQwSJm5WGRIakeFZVuZuVCrpeo0dbhfrgk5p44AC2WYcsj8MT9RA87YZeEydjBrV09AKEbgFnrSJOIOAUzuKYGWbAcf5At76QGHFQ/I8vZDZE0RR2FpXnAEY9odRkqHYWfi9mmMVIIuqljmJNdYzSREOoeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178168; c=relaxed/simple;
	bh=lmfTSdV7Sl+sYuAWTqlRZ7cHnU/WMXEOIGhuoW0Rx8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M5xQU7MZ87vVeof0bjAUfT6ZvHR+iPS4e0MHrEDCXUNqeRxMs1YMCenLISHoaVeeIdofrdWG1YgkEXf/lDeUw7sFJO7yIFXRItc690ssdnR0l4z/cKiLcAVNCjg3qK6h44D3wQEqH/s9Du7x69RHm8lj+FWUzVEyFePbowiXCE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NZfoiDwp; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NZfoiDwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFQdDyqZ2ho6F4AXQPOepR24o3Txg4PBinrZ97UPHUUPZsR0i/qF+RZu6DT3VbMlZ092FiECktpaogj0Ym0+smNKWIF1PMKcs0Mtv924Esn2HUF0dKxlFg4Et5+8P/CB4ih4wLyFXjH2sCB/ywH3nraYlbDj9ESKrmyLx/o0VhdrRdE9KzM9ewqLz8u28S9Ij1CaW3xxhaVOEAgBg78g2RwgmVhgrjhiY8TviJQp6sbt3HBxLC3kRvY0ZDEyawpF4WdDI9/xFEjWmoWqy+D+VauGtNTE8+aWtZ154lnOz7ndPn7aMz6gKZroFYjilvjJ7csTtBjcYswnWLb3wZc2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gmSBUFOdlHnRTgJbgogd9erfy+t/Sk9T1R/dkPT1vI=;
 b=LjujH0IUZ5yZDVO0l9GEPxaqY2Cj8wCklM31tBc2H15hROkpcTdBGBRwgzCf1QLvtjCpQKcPoPDv2YEwCCmVgD3rmrsNZZDrm9gV9Bpic4dXoMDkGE6AIfilYdEo2bqHoWPCgfSQR+e+oje9Xp2Uau0p0C14dGtPC13s0fhxV1wbSLx2l1yEewmFLyNY/EsfWcNRpmPv8zeLqpVl5PKcoamyPg2ZHCnSo6DsTjBKwPekQ//NFrJn+WnOuiO3HrjWr1ACU6JeNID1BcLxfzEUHtjhO/kciu6RaNfzjeuY5Aat/2clDL6vJ2JfU9EZOaffqCxaCfk00pzCf57aWz35ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gmSBUFOdlHnRTgJbgogd9erfy+t/Sk9T1R/dkPT1vI=;
 b=NZfoiDwpfV0NAoScTNaANKLdMldbSMlN83kC9MSTYHnRH2/2BpfqPqaxBQ56oKOnND9Im4Cqq+WF3rYc/yd20OrGlA2JFuMRe/oX/I6WNFoX+heQflhvOR0370jg6TqfGzyPv6oPbUV2umw+y4Ie4AJ+Wb8eUNOhE+XN6pPjmnlI94AHncF/GbVvzDmprfURmKDcmLfhabF1jMTpWNhnQ+/2bA2jN8y+S0Xjw9OSYeNbRcsz7hiKQH1BXyar7tGWiqkAOZWWc+bG9srX6d92DwqTmo9D9FOctJ5Q1ETUuRLSKCsuUU0pk0U5x2BLSvKo0JPtbE3cfYhYVa3EFtl5Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 09:02:43 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:02:43 +0000
Date: Mon, 10 Feb 2025 10:02:39 +0100
From: Andrea Righi <arighi@nvidia.com>
To: lirongqing <lirongqing@baidu.com>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Take NUMA node into account when allocating
 per-CPU cpumasks
Message-ID: <Z6nAr_K1AN_ssP-l@gpd3>
References: <20250210085225.3272-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210085225.3272-1-lirongqing@baidu.com>
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1c0e18-4aae-4e0b-0b1d-08dd49b1adde
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EoU9746Efe9ZdPwfUK5tbBYG8eIpGjFqvycfdksSif01EmzCI9k2rUVEPx1i?=
 =?us-ascii?Q?xaMoxHurtm3z1pjtDjQBWIbayqjaA5jkOMTD/nEiIEyrVPJMslPWO8goYeXB?=
 =?us-ascii?Q?il6afwdQ8eFScyUk1US4HpMf8JjfGY6R/3xc/qGKHSsO1CX/iPDhg/cJWQfT?=
 =?us-ascii?Q?/Vkd2ei2ET6DkQamLLeExVfp4lNcJUeXVeN90tfYdPPwAAJUZWEftOiQ1mR6?=
 =?us-ascii?Q?W+jQVC7Nczkjs7/z41iDDo1MJSrCGq8sGauO0ary37ug/T+4Q40VenHfnZQI?=
 =?us-ascii?Q?cq88j+NyIFZzZS5vYNW1r8u0LPhwqXpZ+rP1/KA6h+Epqw02CI81tTW9orzn?=
 =?us-ascii?Q?8DIBityZjFLUXDzGD3jY3hn3rfc8KI9jmXGVW5jH4BEn8x6A8veWy18jomVE?=
 =?us-ascii?Q?PWCQ53llvI+UgfZggej+FrVg8fRyYNqAH6bzeI65Ei0EVPLaAUc3XamiL+cc?=
 =?us-ascii?Q?ht/ws5mQPcKYpF8v+msw1+SjSIbpZUFXKXrQCMw+BriyR9Pt27fstAtQVx0P?=
 =?us-ascii?Q?CbyzAGsGH2bbI7hMaPpGmncSkODuu1waawc2Yv0VGM9cMXDUHjOorsvLQ0UO?=
 =?us-ascii?Q?FiFMcB26I8KrdT8ABMMBQJX9aHa3OMyRmwzNdxfcwq9lUFY6j4Tl1BWDql9D?=
 =?us-ascii?Q?YK7H+Hif76T5fdmkyeUr3ojLS9LVvn6mxt24P+LbVkWmf7Q0iihTA+XgZ8JX?=
 =?us-ascii?Q?MAiB9ivuOBpoTfUT8tD4tuZwXvLmPBk1C4x5b6zN/CAZ/UC27gLCWUVoFWmE?=
 =?us-ascii?Q?SFGNQrcCF3I4CbjDGhiQuMtZWRkm5Oi4iimEDTV/mSsmunf3mn/hD3xU6Ise?=
 =?us-ascii?Q?L6g7Vk1pXvTy7zThXLrAeQMIB1KwPB4UfrhOwoK5NZw3GmnAeGtNb1oBsJOS?=
 =?us-ascii?Q?ZqNwWYJLG2XOv6CYaGpCUhLXHZkkfTXVgIZJ/XgJi7S+MENTO19fs3f7mV3z?=
 =?us-ascii?Q?Mls3ZlmWUw8RevirdtGqPrkjPCPC/S7RVP/hTOFVbD35UTV/uDeaYMSAltOE?=
 =?us-ascii?Q?U/xlRopBMh0WHNFeYsMd5/cCG4ZCfl3weHtIVY6rCCkJP3kI2KCyQCy+tP85?=
 =?us-ascii?Q?ODYPjWDzkyoPOd9bE/ZLdTKmrZxi7IVtiBFlJ+oN76dLvdAum8v+CPgH6y4O?=
 =?us-ascii?Q?Uw9WBMU+H9rrCfbjn7GN5trNWFfdHPEcITuXevBnSeV7byiBiiUCRx0y4f65?=
 =?us-ascii?Q?xNpMObUysiUmrFZzfWyykl4cNKmfyocfw6duyx969T967ortocnTCd02DddN?=
 =?us-ascii?Q?Ey+d8zPolGffUs22rbZ8l/qX4GR2aXni7Y3+SPZFOB9ilZPOP45si7WgMWDg?=
 =?us-ascii?Q?2/F+4MD2c4MK74MUjcH1AKQj9S8MtPqF3c3HxQzqJaXgr0HMqScu4qWYjmKo?=
 =?us-ascii?Q?1nrN6vOOAklP+I7MX3yrIaUEJ3AP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aRAEMIGzi9rd0OpKq8jgh0RFScN1TjiJIZs9MZpgwQgoVDV4mM7bvjGvU1wQ?=
 =?us-ascii?Q?9jhSIdsR9QMLuVSzOl7hISvnvCw4vRGTQbM51lzICP+jsK1oana4m1oIeM5V?=
 =?us-ascii?Q?qzgZTa1fY85gWYFD9yfa3WKskWlbWeCSoJD6OZTmtr9/+ev6E8R8SLl+5atp?=
 =?us-ascii?Q?DcbiEgoPQupq9OTPhAOxVnb85mfp7fRqnaEdothwvd5X6kh8BARdvZa08gGt?=
 =?us-ascii?Q?P9bM0ZgHP93ZnGa3IffjV/UjdFjtj9e4Hdic9wLVf7xyi8o2qZptQ+yYcxA/?=
 =?us-ascii?Q?MwNFaY0fAnykIT2d5GFGV/RrrhBMj++56NYVg4M3u9dh33fIfkSLZi6c6NNz?=
 =?us-ascii?Q?5vpbtSGPlOgm12SVQzZI/6i47c6islLwkb58dCCDg48s4qGCncQnLDTRFyJ1?=
 =?us-ascii?Q?u2zxk9VaD3RsvK/bspZZgjJhxdD6jDtLJXYg4ZoImVNExOB5Om54tKpXp4ib?=
 =?us-ascii?Q?bwSms58vjIqM4hLE9V+OI8HD6W1kPqGL0ckAPcNYUv6V8B+ZeSKMHPvUrQpe?=
 =?us-ascii?Q?E5ewJ3dojHphfLDRpGG+BcRKdA0s8RJjP+kX7TTFtp8rOYH4QDRyYmoZkSfb?=
 =?us-ascii?Q?p1Q4rtfBO9XVLjghsSndu7A/yVvH9S1f5bF83qp0uU78UK1O1klODF9vaqEo?=
 =?us-ascii?Q?iqYqk38XzrtFSdARvOxJffPiwJLBUVnHAPkMrardR2jAuh6ypMHpaMnlW4/s?=
 =?us-ascii?Q?EpaCoKF9qKu8+Cx2Mn2w++IrTJ/I+Eo2+7D2IFwmINxYnZd8muCITWwqR8t3?=
 =?us-ascii?Q?YDAUHjygDOVtin9uVO82h/+/Hun6b+N71FSiPSr8pzXPZ7o6h7hpEP9n1stb?=
 =?us-ascii?Q?mgY/9x3LsEO30ohjKUwUi67+4k4BsEttq9kqtp0PJHXBgo5DKJws5L9Q2zGg?=
 =?us-ascii?Q?9aqL4d7+YCsfsxpe67s56Vo00O+srOu+rWza71gBqdVtPrph77MDtkZ0uLT7?=
 =?us-ascii?Q?IPttw52y7SfiqW9H36YVOSVIK27ynWprd2oumWQ7Bb69cRa/xvmJo/JHWGSE?=
 =?us-ascii?Q?LLFYE7IzPoY4IYb5WaSDXiitRetWf7HY6k7CSDEs4Q2bSqPp5JeazCH7OjRH?=
 =?us-ascii?Q?IPPRYgNTAvaugjhokP4zpJ5HZ4pucL9bGTeXw+0/3aY/0TrimHuegQEmGWjv?=
 =?us-ascii?Q?OEEuY86AkxtANvrrtOV9mKG8eq0YV/pXNau/0CGiqhFnO9ZuB7ucw55yceqP?=
 =?us-ascii?Q?8eEp/38q7iYRK099/vP0bolO6h2o5n/t7lplGV9gbQHa2Bx1LD/nQvNK1KHD?=
 =?us-ascii?Q?FrE6kDBzoZ35Bcx0yCX+c43l22fBiqKOfB1ipebWW7tRZV0C2h/gqQnMITEL?=
 =?us-ascii?Q?rhZw7TXMMtJJWv/8xEO8LSPogMfR8EWh10hCanAEtdfLljoEy4iB2bPl9xwZ?=
 =?us-ascii?Q?LZ/bN9PHmnNCp4/myUO5azWG6SiMuy2c8ED9Yhjo2MDfVF6vrzbIzsgMQLKe?=
 =?us-ascii?Q?EyV+bqXwrEU85vNQrZm+UlfdMWqtY4AahgYijPkGvQCdK5YwxvJrrVgYXbRl?=
 =?us-ascii?Q?au3YxOUFmgJ8/RRpMDUrFg+wGTyubzFFM7ouDaMPXbQMN3eR0EczYXjy7KAg?=
 =?us-ascii?Q?MEK7rEaQUjI/DAdP9aX2K393xQmBrclDgx4PdKUT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1c0e18-4aae-4e0b-0b1d-08dd49b1adde
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:02:43.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw0MFPTz6inC/M9Spjs5lrtilhYaARMoDMH9+8QUgitD0I8JaKKXFadoK03ZazHNAmoAm6xzZ3cgw6Zy8bVrIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108

On Mon, Feb 10, 2025 at 04:52:25PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> per-CPU cpumasks are dominantly accessed from their own local CPUs,
> so allocate them node-local to improve performance.

Makes sense to me, did you run some tests/benchmarks on any large NUMA
system with this?

Thanks,
-Andrea

> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  kernel/sched/ext.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 8857c07..3fe5a2e 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -6325,15 +6325,16 @@ void __init init_sched_ext_class(void)
>  
>  	for_each_possible_cpu(cpu) {
>  		struct rq *rq = cpu_rq(cpu);
> +		int  n = cpu_to_node(cpu);
>  
>  		init_dsq(&rq->scx.local_dsq, SCX_DSQ_LOCAL);
>  		INIT_LIST_HEAD(&rq->scx.runnable_list);
>  		INIT_LIST_HEAD(&rq->scx.ddsp_deferred_locals);
>  
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_preempt, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_wait, GFP_KERNEL));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_preempt, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_wait, GFP_KERNEL, n));
>  		init_irq_work(&rq->scx.deferred_irq_work, deferred_irq_workfn);
>  		init_irq_work(&rq->scx.kick_cpus_irq_work, kick_cpus_irq_workfn);
>  
> -- 
> 2.9.4
> 
