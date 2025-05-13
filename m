Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411021D6DBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115332; cv=fail; b=pP+5DZZ0FGZkzQKYRY+eO3GNcKE9Artc2Oa9u6iGvkZN1nnDAWslt3qOM2PSYYAwJsRRCR2xePyV2R2lp0WOl7faHEjHEwBA+ZQS2zUOWYy0yQlQ/SRPD0QHsZ52jfi6cFxcZ1Ze+GW6uVYm6sRGekZnnwJdicW70rg0d0M3dDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115332; c=relaxed/simple;
	bh=1OfCg1Jd6dDKWm6Tzn44z2SRKOcAXtLfqgZW3xVpyAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tk8M1JK+/BnwTdi3pm6DJynawrCb3R5B9ZiBEdSG7Hh7V/gGmtfVxjNTvUuF4YAoYOLTXVvk40BTiGV1JJktEL+ouqCxH3LYiXhMgWGL3L+XCCJIVciz3WZYKaasvaHagF4SuaUSqbPRJHP+eBho6XlosCQ3u08WX/P9sAs02mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CD56wy0e; arc=fail smtp.client-ip=40.107.244.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CD56wy0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kh/5IUS1xKVzfh2QVzzHes+Nl5lu562iweFAf6ETmwYgNaN5GcTs7TyDUEPOA8uHFFZPUuAqrfZDb2wnCLroUSBwx6rPDXL914VlkoK6zmbvd8uBdDwr3tbO67t3iSl/u+gdslYHtID3+7OrwPZZ4bhNw5yuSK09j+AanAgPtT2boeSImjatU+9bJgGtRq5cY1o2vcCVQRGSsEcamxhhnvI9uR7FHKTfDWcPDtq6jitfS+LqO3aP/yRu8SKG12FUFPjH2foCJsqedWrCmxwe0vqPBPr9YUfW4fd7WpC4BBNovKCs0m0rzTUi/TDvpgMywMs7RXKB4PqKXFPRPjRdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlO/jS5aLXuCc+VTvagciXu1mC3p6P37+NNrRXM3wO8=;
 b=Gfgp0VaMXjd4T4rz4N2z8rNHKzjFpWd7nZqLvlEgfZN7bmH3r5BP42KrkaJ+5FfBjBRqiqI0PuWqoYQed/z7ob3zAKsgOHilyUYJcUSjWZHrh3BYPtyzug4QZS82xQ1VHyXdygp6jie3o43oSLLc0KmAl7fEJbz46mJEOG8XcsNbH59ssYY1aqE31WESEKI1hTZzt/BP2J2OjHrmOVW3IEbbIohowNJjK4ukzxO7Co639ORy8V9XpOTr+7Vw4tO6cTp3chhtlDywE4VWiXfUumvZAnTNnMC43SLgaPMqS2V9IAaJVkLsiGboYWAZk5N80lDeTjd+VM/S98h7nbm3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlO/jS5aLXuCc+VTvagciXu1mC3p6P37+NNrRXM3wO8=;
 b=CD56wy0eMoB+rplkj5dFa+raok2jEStpp4n/vhgtZpCKlGfCT4wJXc/ul7SRecNFDQuL2ty5+hS7/BPo6i7/HXEkccDd+wBEFmYeWrh7wG1ZBR/XkEDsmRGE6ahvtrfpzamoZPWnzpxIl+I3+Hbu1X3saN+oGeCAiEVn6qJJGGILwBHlQbfpzaq5AGk9sBksWSRAstBLjMfiAnvNZPgcucETijHr4VIDzlnsmOXk6j5JnM27/Gebmj0gu/FJKBo+pb6MqxZgMCR3A47gWJ1u/dj9v4BYcpJk5BvvyMqnYG5yWZVkhyAf8WRwC20ySHz/4KhX0WpyVJiQW2aDw/d3+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 05:48:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 05:48:44 +0000
Date: Tue, 13 May 2025 07:48:37 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16 0/2] sched_ext: Extend usability of
 scx_bpf_select_cpu_and()
Message-ID: <aCLdNcBFaWz4xzgF@gpd3>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <876b69d7-ea9b-4ccf-8693-96f1b794f7a1@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <876b69d7-ea9b-4ccf-8693-96f1b794f7a1@igalia.com>
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc26002-af1b-448b-a932-08dd91e1d2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WsPRE0cDSVBFMkuMCfd/w2kqHKOil4Aj6hBEVUkeNYne4w8iBcOyTfz7xSf6?=
 =?us-ascii?Q?1Ratz3Elxu3cWhyGqncQCyYEw1X4MzisIY6cq3DoTWtm/Nj+VvuU+52JaQCL?=
 =?us-ascii?Q?YbfmmrBjfVOOSld+P5e28eBxdN7ciJm4aD4PRojphl6bzoaLhbvAT2FiBtYd?=
 =?us-ascii?Q?4WXXqAjBkT5uQZ3wQzXIAbp3LiQkfcPOHug43ILX1r0BmCgad1k4+EHHB299?=
 =?us-ascii?Q?UEWdjdD+E4gZexamjttuz8p2tdB5/iq6jt/FI1flCnf+7v3QZ/DKIkb5IoVP?=
 =?us-ascii?Q?llkpCZtpAJLxj4qXg0fma0Ku3QZFa4OD/3YCPBjswBJpMOA3hIJH9mq+z7wZ?=
 =?us-ascii?Q?fiGnnVoWoGWQ+/TIUAeI/trXHrcfQK327erCIf+0asFLGgrWCj9TojYAGRqW?=
 =?us-ascii?Q?pP2GvSEyZmd+kNa5JUnEwnr/9fIvQwpwSErUHyCbTogdb4+BESxiy8Gv1kCt?=
 =?us-ascii?Q?w13cfl5W2z9YrKVGo6ofFNKvWjVtx+74x8PmI/ApElfby7+VcjFR+lJhnwck?=
 =?us-ascii?Q?Y5ZIY38hNU8qmcMTmCHqoiJinPOyeiBvVmvj1ggOdIZ+byiJ+bst1+Y11jXS?=
 =?us-ascii?Q?pYQVOR1StSl4x7nMaoHyP/xhpt57MTMSQdZ1p0yV2WYMGL79q6to7Xt9CQEE?=
 =?us-ascii?Q?XyYJosMyt9nM5kjCCKVarwOOa3XcJ8xGOr74tVb+kdnYFV1eRNXjoXQ5m0Rz?=
 =?us-ascii?Q?NPKhqiPp4OStTyKpnnzOTba2OzdXq7Xbzk/6W6TnDRONChm/HmubEx8eed3C?=
 =?us-ascii?Q?cjfl1VYMYzYUyY8Sux1t6LgHAxIk96mwUat4HY21VxlPDe8rRn3oW7sF43sR?=
 =?us-ascii?Q?UrX4MWmy14vzavns0JlZwGe4eHCpKKyZKEWNVnHtH+ZD+7gLAv0v/0tAwMi7?=
 =?us-ascii?Q?EWIYure15xklkeFKAl8YorSIhI/LPAvviRZMGYZeKB9Jma35noKw6sFCyQBw?=
 =?us-ascii?Q?tsx/B3auIYXjeKN87GntVk9AaAnA2EcUx7AHb3+Lmvo9iuWRcHvanTaTW6VS?=
 =?us-ascii?Q?i+QrtiQYOqDxXzntckhrNRwzp0zrw77ZohIqDxV+k4dNZpPO111hqRe7xt+Z?=
 =?us-ascii?Q?/r0uZ+wl/aUwCysys2q/OkpIsHcR6qzRfIHfGGNnsdwOlwU6JWfjt48+Qd1/?=
 =?us-ascii?Q?tQPw+XrauwD2n4v+RDtWrjGdya/4ON3ZNJOg0WljQYStpV7GeB5d4S89zBM0?=
 =?us-ascii?Q?mPFSo0uNlawHd6skWsW/6oJN3L3gs88oYEdAKG4or4T/4ZANUByMGEdu3jSl?=
 =?us-ascii?Q?4eleJp6sby7uHtuYPaCaoyORFYbrQYK7BJaT0dutjFGrc+oaKlq/RDyHPFxQ?=
 =?us-ascii?Q?ChTtV+3F/L6uqBgWHx86xuBkeVVKmhHAOdneezTMwwzWHT2WQtOQp/vqkpTx?=
 =?us-ascii?Q?FxhDAXczj96Fevoi+DYvyd30mOEP+/tjgSCZJ8r135H4YiPbcvngtT0Wuetp?=
 =?us-ascii?Q?ZwUkAUq9uiE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5lzzggzyjG/sffU5/gV4IBiTy0cMd9Il1vWDlXBtVJPGsmVDyBu1CPGj4kKS?=
 =?us-ascii?Q?uUDZvxkIFBOxJZR3ExJ82U8Af7ODryRMd1h3Ku5nEJx9lC5sJZ6iUUfHt+0k?=
 =?us-ascii?Q?SKNhx8CplYW4VCjXRM5wjQC0EgDRsPHTDMGHOIa7GwFe+tBWzycAkr0VFvbM?=
 =?us-ascii?Q?B6IBs2rWVV3Q7g6XcUteF85gVH8L65OoFnC7wmjnRiftSp9Mhy843lSd9Dzh?=
 =?us-ascii?Q?EEz2QTgzIzidBPEFdt4mwpXIPQR8owWHMnJH+cBDjkvYdGnazsVuwn9c9UVY?=
 =?us-ascii?Q?sopYDzihnQdul3gCnLnWFzPEe+xpPj9XW4vfw7PL3HIEJIj33q8mkCmC+b6E?=
 =?us-ascii?Q?Y2syHo1jwkIcUpVJtrItCiX9+/gcfOozS7rfs7mPaiwSrTsg0A8R7iDHZprZ?=
 =?us-ascii?Q?oU6FjBbmiyiIu6LULWC1tjTsbe7KXk9GsCSBqaaj5r5ag/vrZALX97jtJRqK?=
 =?us-ascii?Q?GWDzlwZ0PxW96FhvapncQf2n+qeCBuJHisALdlsnqk4N34EjAmr2Il/X4ExR?=
 =?us-ascii?Q?FxOu/6S6OYcko2kCYn9Xx7yggzORIifgsIg5wGfgtLKEHbtPUbuJCsZEpRYm?=
 =?us-ascii?Q?Dut3MUHLmTfGFEG0byu2goqGtds1xnipxIacEbxVqHvB6pMvQRmPOWZ6oTiY?=
 =?us-ascii?Q?yJqCauvLfBh4zj1yeN1Az9jxiBVCqPJCqyVLL9cO5DlgUaoMD3/P+oyXr83R?=
 =?us-ascii?Q?CmjGVMkH+i+5iBk0W0LwI1ausf2DVJc50KO5OsHOGw/tvW00LKCJHJ4fIsZf?=
 =?us-ascii?Q?wJTh1KuLvrXyRWoyFuCY36EG8wnv+wzjcCFVNOPX8IXecgB7qHwPGaewfMtU?=
 =?us-ascii?Q?lnMhVw5Rk/2YHHL0Y2D/GUwbtF7/HB2mzxmnjpU0xvQ8p9Oj67Ii5GUUrXRi?=
 =?us-ascii?Q?bBiUShEn7sBxfCiiFV2MAaaq0+M/prWOWiwtEoXA1LfDTx3+C0aRHIWCDzUM?=
 =?us-ascii?Q?0LkEN5QtRJSXpvDC/Kbbzhw/YeF96clEPKdhHAzjNMeD2lFpPBPGVOve1sBz?=
 =?us-ascii?Q?BjuXwa9wvbEr5VS66E+0mhByNnMQHRi4akOSYN137H9WFKj9MIIyy8/RiRk6?=
 =?us-ascii?Q?LfRQ/qalDelYMVacucRnNTVlqYGkHU7WFKlkxGhwQOHA2tJSmuHQhMCnon7r?=
 =?us-ascii?Q?cKYJFH9jGHZDnZ0EIqk0OlC4AeS4jKgsazKSYaLlZ0s1XYo9br1d6vDVlgKh?=
 =?us-ascii?Q?9k1OBJmZqnBAo1ZHfugT+kdyh317SprAoUw8U2bjL4dWpsxmQfMv3qPuFnYK?=
 =?us-ascii?Q?JZ7Ogbo9vAOoFh/ee/yVkHj3k3Irndciag+XcNJj5YX4Ow+ZAYQKRRtH1PCx?=
 =?us-ascii?Q?ueQ2NWrF/rEMicd0BWI/1SZhw6xclzyDnaTOEwxBYkG0j2DskVmxA/feDRDf?=
 =?us-ascii?Q?H8JoiFUZAEIW+ckd2SPd31y0DbMVhcO8xYDc7G73asShzgMBCqdQlV5IqUfC?=
 =?us-ascii?Q?Pd6MzmmlIynuESk3eBS9Nh62+asuPAXucjz2B4i4QZVRSwortpjaMtK6Ogqn?=
 =?us-ascii?Q?WjV3BmNelNnIXKitNKzwgFCD0Q+cPtFZVCf9o78k69j7Dwu8snjPX1z7k0Fu?=
 =?us-ascii?Q?0Nl+DyafRAjpXi+fQ9DgkIafYMZ5od2B3hOuTmXO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc26002-af1b-448b-a932-08dd91e1d2aa
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 05:48:44.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Od8764PuF4NrV5Ena5WIZ6H/Rg9Z2kUNbdAJ79J37r5DV+tmxvsgceUN0+F3iRV1TtWv1xA27H7jLMeyET5qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773

Hi Changwoo,

On Tue, May 13, 2025 at 09:46:04AM +0900, Changwoo Min wrote:
> Hi Andrea,
> 
> On 5/13/25 00:14, Andrea Righi wrote:
> > Many scx schedulers implement their own idle CPU selection policy, which
> > may be invoked from different contexts, not just from ops.select_cpu().
> > 
> > For example, some schedulers may need to trigger a proactive CPU wakeup
> > from ops.enqueue() after enqueuing a task, while others may expose this
> > functionality to user space, relying on a BPF test_run call to pick an idle
> > CPU.
> > 
> > To maintain a consistent selection policy, these schedulers often implement
> > their own idle CPU selection logic, since the built-in one is only usable
> > from ops.select_cpu(), leading to unnecessary code duplication and
> > fragmentation.
> 
> Besides ops.select_cpu() and ops.enqueue(), do you have use cases in
> mind?

scx_rustland_core exposes the select_cpu() functionality to user space,
which internally invokes a custom pick_idle_cpu() from the user-space
scheduler via a BPF test_run call.

In this case, having access to scx_bpf_select_cpu_and() would be really
useful, as it would allow us to eliminate a significant amount of code that
effectively re-implements the built-in idle CPU selection logic, including
all the code required to expose all the topology information to BPF.

Another potential use case could be within ops.dispatch(). For example, if
the current CPU isn't the best fit for the first task about to be consumed
from a DSQ, we could use the built-in idle selection logic to try to pick a
more suitable idle CPU and bounce the task there.

Thanks,
-Andrea

> 
> Regards,
> Changwoo Min
> 
> > 
> > To address this, allow scx_bpf_select_cpu_and() to be used from any
> > context. This gives scx schedulers the option to use the built-in idle CPU
> > selection policy in a consistent way, potentially reducing code duplication
> > and fragmentation.
> > 
> > Andrea Righi (2):
> >        sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
> >        sched_ext/idle: Make scx_bpf_select_cpu_and() usable from any context
> > 
> >   kernel/sched/ext.c      |  5 -----
> >   kernel/sched/ext.h      |  5 +++++
> >   kernel/sched/ext_idle.c | 23 +++++++++++++++++------
> >   3 files changed, 22 insertions(+), 11 deletions(-)
> > 
> 
