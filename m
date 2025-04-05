Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CE1863E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860461; cv=fail; b=Rv/KC0eE/dLD9RcjZQOwSd49kv2F/K9L9wurZtdvRol38A3tQyrb69a8LQy0RPJNyipr8d/S0XXskTnknADLOUopAYLzPejVyD2DYxsDIKc322eY/2XR6IaARjemQuP5Oz+HGAzxkjAB3rNIKMh+LCJP93Mf767Yy73EbfUSpcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860461; c=relaxed/simple;
	bh=QJatavzbVhdXmxhDPDPAEC6TYOjZZyxItYxNNbBhkiI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ibrjl2+itIA3Xlab4T8tu99Yn+UgnavMFYrY68krInh6FplVnqhmz4qgXumLeUWp5I6qX+4jit6ZTY6jn495v8PBioGS368t3QD9YICtsWphDe0+WTpByeRtU9kpR8oPhGm6Q8Gm6XHVtEkQpX2deAqCe4Z4TNRbIVskdftOQCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rB0Gskbb; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rB0Gskbb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNzTjWRTOJFgNinD1gu0dMgm0/OUZVlveiBxvQ0+wm2SuXA/gJ9jjQzrfZODJ5DU4Jme+Kg3L3HCYPUv5ZJtKr37csulIJA/h0n1DsYPz9NKBR20s3UCMUb2qk0H6C8S9fcBjCbFmktpK6Q4/EaIbhrPfzqIFpznd6TSVSuIgT/yZD70EyfViqG033A/VpoucpWfqOIiGKDHVro77wX0vgN0OG/oWsGtcD7sw1M4gRdChE9OViYX3SHmKaYV9Z1XIXK93wS45R8mPlnfSS7h71jb8/ts6L924sCk4TnnavtEcWKp+CC4e/d5BD7+5dFVTQlVECGgRXq42AHKV+nygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=816ARB+aDW+SL4udsPUn6KxYEc69dykuyAuyhlPealk=;
 b=A51HnhA/JsYky2oGnbOC47qhus0N7hTnJGtaEbP67T6thS01pPvu/s6BM9bzJSWqONOqJbBnCvfs9Jc1YVTp3/6QyGHxx3ac85cW8zyUnvS0H6BHH3cEElLY6hPderVpEmI/FttTdiG2cfWJrajlXkGkk9h8KI3Bas08/InB/XaciW1RgrcKD6kOzX7vHafaUm5Knd5To3vKOmr7YFkdCrHFXqygq7htBuIqw49d8D3SkUJiN2wftORXAYZv1xeoMYs4xKCBFb8WITFCDCg1O6zbBA6ybpOisucZYbaPmLwS/8cVIJJB4ujDXdloRJXvRz44fDAixWCzVo3IogPHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=816ARB+aDW+SL4udsPUn6KxYEc69dykuyAuyhlPealk=;
 b=rB0Gskbba1oVS2xSJF11Z5lV+Hc4jhXcL6fUFZTDG4fLlvvhrTLQMD7o6NZSxSJ3/3d4UNurPaCz6J6Ka7M/f4Gc1kF3mfL3ATudHfTVnrVoecZP+wtLF/y4jGt/1GlUCqbcP0XWExmlf/GhqtuQfVGBhJgwRQomMS+s2UFmCuCHScK/LCZsHzanUqmtfUXkrujm8MVmAxr2YEpD/luWJ5CJEmTayBV6BIyedQs3E/688gad8nZ/dhrn/EKjLQKTBDWUgwBddHMRpRFhB5mxXQNZn57RZdPCEJ6fPNEtKd4CAnt3uHqS/wMALSFJnuPUMAqDnQyN0L5l58rhamDiDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Sat, 5 Apr
 2025 13:40:56 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:40:56 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCHSET v7] sched_ext: Enhance built-in idle selection with allowed CPUs
Date: Sat,  5 Apr 2025 15:39:20 +0200
Message-ID: <20250405134041.13778-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0016.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::8)
 To CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4f1ef6-87ba-4e02-1b1d-08dd74477dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqDakhY8sjw/FZ972l4QNWqylsl4u4nbvRRuyCbBvh/sOEbVqJRCwWPu2Dk+?=
 =?us-ascii?Q?NVhFK3za8hik1Orxcz5sgNSKImG/wmdbPT3DffDgldIif/hMsLwbH1G5QpPO?=
 =?us-ascii?Q?KBKKBmYjs9nOCvItxza7wDicLUCJ1uY/E6BwIMsWnlmfZKCNcGwnWN8Q9B/I?=
 =?us-ascii?Q?Wy35J8pFO6CVISiMFoB0/gAbWyV5ljxNc2H71KSZFfpTWrg1VdpbDdjiAMeh?=
 =?us-ascii?Q?XRBXcqvswsgG1xWTWnq5IujpG3DPnS8sNziCpX7of3xWtCuuWrBKPrWhRH9Q?=
 =?us-ascii?Q?SBgYJcd8JeoRxVXHjpeZ8DiqbjuEIqdvQlX1o6FUbMgbqQI+IErDAYa1+2TI?=
 =?us-ascii?Q?BtOotxbgSmJABq4xt65ZC/RlJl/QboGOhQg03gva7zMVqeuPnwQxts3YXGNd?=
 =?us-ascii?Q?e+THnww8vf1K71Z2QfJ+3EigseNumWBVt6NRn0zIcgAlpe+Qw6xCbfvYA7Kf?=
 =?us-ascii?Q?IQ7no3MLCTXQ/RYBX9yKDCew4/0p5ZfrBUl0jKW3Rdh/qEpS2gQOwdqDsmAs?=
 =?us-ascii?Q?x2Tn8/jUmqhtPJGVTF31l5Sx7xpCLTEwRM8+6yHafUybBRi+Xmdl+/vaGkVz?=
 =?us-ascii?Q?5AyTi0DEE9xttT1YaCeyXrPIZgsyBrbfT9CToKwpjAVfUKMvWBsEkOg4Pijo?=
 =?us-ascii?Q?4UCizfLx2Cb3C42tUa0VhAp5bilyFuQJQVRmyCL0dUyEZYBs1xfIlXLt6QQw?=
 =?us-ascii?Q?8YTs9DEZKQ+KoASs3STiSQfxkhI8zVqASpOD/F8PhjmY2GRxr2X21EdVl6ZV?=
 =?us-ascii?Q?jFJ1IIHnwn5490reX25JYcKM6RkBZWKSB1KzOvEjEusUaCDIDnvD3zF4lLaB?=
 =?us-ascii?Q?ICZC4XIdSrVBBb7ctaXkfT/20CI7Elswpen5tj4NNWIgO5EC7ou0vb30eeId?=
 =?us-ascii?Q?x5tH3Bqg/xrxcVxgNms1f2NGyNRvCrByl5qbkdDWu1IT+XLZMrTpNypEw1Pw?=
 =?us-ascii?Q?oIqbiR9feasBi4sJsUEhx1so3TcsgUP/HD4nFoUADM5qMJ9TAm/vYT/QllnD?=
 =?us-ascii?Q?Q90aZzTPkd53N3JYUy2ar2G8PKn2HGg4QQsRt6xGZvEhX84lOz8CsOr97mZf?=
 =?us-ascii?Q?7QHHQW73LeL7JgbnxeKbtzhFOj4zSwWefIfH2QVvDut2pL29JiOK00yIsWyS?=
 =?us-ascii?Q?Ixge7gchsef8CmqT9TdNDKQZWOPtIJXO8QW+fcdIZwC7ppHh/AP5gbWLd3v5?=
 =?us-ascii?Q?gT0RSgCLE272jnc3YtA4F6W+7LccA9OushjkiS5OT9Blmqpm8WFqbVWSfmPJ?=
 =?us-ascii?Q?NW18vuwBQyeC8iqLfOpQAEtGmXJn9qB7956P/jQjcWlEAbul5QILIW/gQCGo?=
 =?us-ascii?Q?KO4gdOurmGtFfJGfjc994TJAqLMgmmidgZMEVRszhXvPo7JyCuXGHgUEO7NI?=
 =?us-ascii?Q?P+aUmGxWzifNppGotwDg+CnayXJ8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJHw9ly2OXjF8WgNnLzvxrE+xkVTdRGLb0ApGLEXsOG2fsBiDRl/izH4ILGY?=
 =?us-ascii?Q?AF7CtESO4II0qAxY/YlXMXSVXCHBy8kEBdZP6KofJpO8Mq5cVOxy5XbfkWIb?=
 =?us-ascii?Q?oJgL4hUqsWPhT5CQeRpuVEYTgCJKmEl9vv1QZIH0rM6EMa+GHjpSo68Bpevn?=
 =?us-ascii?Q?iYU90YWYqchQvDqvPCBzevq5cmU/rJHBqz+d8IREqV8OeDBBg/N5cY+HGoet?=
 =?us-ascii?Q?3EumbWNCxuQhLPpHTtg3OMhcQFxXB1rduWrlVwKeLtbwg7UQPxwxnGcly7/z?=
 =?us-ascii?Q?8Ev1paXHPLXCwIuAi+XEE13UZJB3FjnvxWK1oiT74QB1EGb6lzsXEeASetaE?=
 =?us-ascii?Q?na+ffyEtF1X/JvVT/zAIhUp5RfrVlrkuJ2MjP527wyu4M+lGdHQSemQO1MJZ?=
 =?us-ascii?Q?aHZCaNQKg5VRSBUkeuoh+XzN+qxLjqvQS6wugDbSclsbh6Ca9iYvH6huAkVI?=
 =?us-ascii?Q?HQQ6jM0NFpmryPc2XKF+ObYAEc+MDBIxRdXvlRJOMSXuZfmu4wCXw2bKrElT?=
 =?us-ascii?Q?bNwcHpJfLDxOJyUmtNsIeNsqX8OB1ZML2ApAXxNxS40e291x9BNP6warUFAX?=
 =?us-ascii?Q?wKhPZbzB+ZThcums7gRdrk4vwy2lswO7vjG4dLLT2fN3wUXaMrd50hMAR4M7?=
 =?us-ascii?Q?/7Ob0bU87GT6qA/1M2Q1RT8ZaqBCPp/u4eOZHc4JbjfmtZ8KAi137UzI79Wm?=
 =?us-ascii?Q?VjnYOic2hi6bGYHbJSFo0C+WjTQ/lN2VrweDo9GsNB2/B+y5SlOh05T3LaRH?=
 =?us-ascii?Q?8sxoQmwYKR2wWReOxcmSQ+bIrpJqKxs5MhRx174RyQakQbD1oWUkcTPKH9lA?=
 =?us-ascii?Q?Or84lKtX1WP/FrHF+D9OhwPv5xZ728RsZmpNiXnVgbLv1nQ7FO944iWfD7pa?=
 =?us-ascii?Q?54NT1OQ7W+yUWKkEZuQ5inX9B73W+3TfoAGCZ0naK9JLZZSmaN09MwEsHC4e?=
 =?us-ascii?Q?0R1zsxcu8DMHtT/MI5XzIjtBnVH9bMYgYAS424kLGobJf2ZXTQLCjoEazuvW?=
 =?us-ascii?Q?/3MRMuBeGM8uEdguHUTgTyl3ryxV9YRtzn5R8DTOlGfYta8DIcp4QRonRUI6?=
 =?us-ascii?Q?5sllEffwnJFVIF8/KywmJqfBsWoIDhY/u7AmQ4blROdEpnnagcsLH5oNjW9b?=
 =?us-ascii?Q?HN801ON8FA/Kpq2i/kk816yj5c5jbzg9bHM07thATvCcfb2mIUJx2HbeXMD5?=
 =?us-ascii?Q?Tt2e2leyW2lDqwaRctbSpwPUVUnaoBZixBgS0nlWX+EoWWuAxhkN3nbZmdsQ?=
 =?us-ascii?Q?8yjA8uRjijkC82f5rGE4SyQZ0RhNL1zUZpUoCRbCJRw6QAG6v+zFurk+DH3j?=
 =?us-ascii?Q?DHVDSlpPVMDCxxBVir0jPPD9J/EgpSndOSNYsBtDpmxHeGjg3RloCfjlRK7Z?=
 =?us-ascii?Q?JhoSZ+yMVcGQTAsHHOESFEUjRTVQ9/Su/12njZkjR0EZ9SZsr/GBo3HzakZN?=
 =?us-ascii?Q?NFPTvo+5bjCpcQi6oZGIQgsZiDpV90M8boQa+VHu9j4jYTlwRKHiCZpvCyS0?=
 =?us-ascii?Q?+AOIwP/mVnidMuwg/t/cedchWFN5QeJSiyWs8QhvkB9IdgDSwN6qg+PduYPe?=
 =?us-ascii?Q?TVNBBSNG8S11P26jGSIquQ+Ee7157ZfEVd3eYh+c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4f1ef6-87ba-4e02-1b1d-08dd74477dd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:40:56.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3ImIUo95NkBv89hEd+xOtCywxRMZHL2QAxovlNDVT38IxKhweO7nrIOpJoPZLLNn7G2t+MmHO+mlA1Z6zP0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679

Many scx schedulers implement their own hard or soft-affinity rules to
support topology characteristics, such as heterogeneous architectures
(e.g., big.LITTLE, P-cores/E-cores), or to categorize tasks based on
specific properties (e.g., running certain tasks only in a subset of CPUs).

Currently, there is no mechanism that allows to use the built-in idle CPU
selection policy to an arbitrary subset of CPUs. As a result, schedulers
often implement their own idle CPU selection policies, which are typically
similar to one another, leading to a lot of code duplication.

To address this, extend the built-in idle CPU selection policy introducing
the concept of allowed CPUs.

With this concept, BPF schedulers can apply the built-in idle CPU selection
policy to a subset of allowed CPUs, allowing them to implement their own
hard/soft-affinity rules while still using the topology optimizations of
the built-in policy, preventing code duplication across different
schedulers.

To implement this introduce a new helper kfunc scx_bpf_select_cpu_and()
that accepts a cpumask of allowed CPUs:

s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu,
			   u64 wake_flags,
			   const struct cpumask *cpus_allowed, u64 flags);

Example usage
=============

s32 BPF_STRUCT_OPS(foo_select_cpu, struct task_struct *p,
		   s32 prev_cpu, u64 wake_flags)
{
	const struct cpumask *cpus = task_allowed_cpus(p) ?: p->cpus_ptr;
	s32 cpu;

	cpu = scx_bpf_select_cpu_and(p, prev_cpu, wake_flags, cpus, 0);
	if (cpu >= 0) {
		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL, SCX_SLICE_DFL, 0);
		return cpu;
	}

	return prev_cpu;
}

Results
=======

Load distribution on a 4 sockets / 4 cores per socket system, simulated
using virtme-ng, running a modified version of scx_bpfland that uses the
new helper scx_bpf_select_cpu_and() and 0xff00 as allowed domain:

     $ vng --cpu 16,sockets=4,cores=4,threads=1
     ...
     $ stress-ng -c 16
     ...
     $ htop
     ...
       0[                         0.0%]   8[||||||||||||||||||||||||100.0%]
       1[                         0.0%]   9[||||||||||||||||||||||||100.0%]
       2[                         0.0%]  10[||||||||||||||||||||||||100.0%]
       3[                         0.0%]  11[||||||||||||||||||||||||100.0%]
       4[                         0.0%]  12[||||||||||||||||||||||||100.0%]
       5[                         0.0%]  13[||||||||||||||||||||||||100.0%]
       6[                         0.0%]  14[||||||||||||||||||||||||100.0%]
       7[                         0.0%]  15[||||||||||||||||||||||||100.0%]

With scx_bpf_select_cpu_dfl() tasks would be distributed evenly across all
the available CPUs.

ChangeLog v6 -> v7:
 - use NULL instead of p->cpus_ptr when the caller doesn't specify an
   additional "and" cpumask
 - handle per-CPU tasks in scx_bpf_select_cpu_and(): since this API can be
   called also from ops.enqueue(), per-CPU tasks are not excluded
 - if prev_cpu isn't in the allowed CPUs, skip optimizations and try to
   pick any idle CPU in the subsets of allowed CPUs
 - do not deprecate scx_bpf_select_cpu_dfl(), as there's no need to convert
   everyone to use the new scx_bpf_select_cpu_and() API

ChangeLog v5 -> v6:
 - prevent redundant cpumask_subset() + cpumask_equal() checks in all
   patches
 - remove cpumask_subset() + cpumask_and() combo with local cpumasks, as
   cpumask_and() alone is generally more efficient
 - cleanup patches to prevent unnecessary function renames

ChangeLog v4 -> v5:
 - simplify code to compute the temporary task's cpumasks (and)

ChangeLog v3 -> v4:
 - keep p->nr_cpus_allowed optimizations (skip cpumask operations when the
   task can run on all CPUs)
 - allow to call scx_bpf_select_cpu_and() also from ops.enqueue() and
   modify the kselftest to cover this case as well
 - rebase to the latest sched_ext/for-6.15

ChangeLog v2 -> v3:
 - incrementally refactor scx_select_cpu_dfl() to accept idle flags and an
   arbitrary allowed cpumask
 - build scx_bpf_select_cpu_and() on top of the existing logic
 - re-arrange scx_select_cpu_dfl() prototype, aligning the first three
   arguments with select_task_rq()
 - do not use "domain" for the allowed cpumask to avoid potential ambiguity
   with sched_domain

ChangeLog v1 -> v2:
  - rename scx_bpf_select_cpu_pref() to scx_bpf_select_cpu_and() and always
    select idle CPUs strictly within the allowed domain
  - rename preferred CPUs -> allowed CPU
  - drop %SCX_PICK_IDLE_IN_PREF (not required anymore)
  - deprecate scx_bpf_select_cpu_dfl() in favor of scx_bpf_select_cpu_and()
    and provide all the required backward compatibility boilerplate

Andrea Righi (5):
      sched_ext: idle: Extend topology optimizations to all tasks
      sched_ext: idle: Explicitly pass allowed cpumask to scx_select_cpu_dfl()
      sched_ext: idle: Accept an arbitrary cpumask in scx_select_cpu_dfl()
      sched_ext: idle: Introduce scx_bpf_select_cpu_and()
      selftests/sched_ext: Add test for scx_bpf_select_cpu_and()

 kernel/sched/ext.c                                 |   3 +-
 kernel/sched/ext_idle.c                            | 188 +++++++++++++++++----
 kernel/sched/ext_idle.h                            |   3 +-
 tools/sched_ext/include/scx/common.bpf.h           |   2 +
 tools/testing/selftests/sched_ext/Makefile         |   1 +
 .../testing/selftests/sched_ext/allowed_cpus.bpf.c | 121 +++++++++++++
 tools/testing/selftests/sched_ext/allowed_cpus.c   |  57 +++++++
 7 files changed, 342 insertions(+), 33 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.c
