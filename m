Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BC1F4611
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218379; cv=fail; b=ZNTqg1VrIOfAKbGm1QmhABilIutFACqX9WBgMSO6lXzjvo6IS6TNDu/7iBlbZya2y9KOOIJYgK9jdBC16HlnR+3ofk+xC/xiAFXz6LHdjVnqWuzUZ6jvFaiH0o93D4GyrfrJyVfbnk8TwXcJUP0KFG6ipUV382uzxWFPYsES4po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218379; c=relaxed/simple;
	bh=2ih2q1v74aL7ogRAXH8KGdGZZxxPSAymIoWbTO8OMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IKRqqgBQh5fEdMNQFsmywQcwoQ9RscbvZ2vVowqsZE6MEkP2y8WRrGNGXaQCtG9Y/xnCh8HkmTUTL5+XpvaW4gql8/9ZQwOU6wqqGiyNwhytsM02IAe6yda0+A3X5bhyKMgtgtMETFlT4XrOQNsLIDBWEgfcCjWI/oOYszpUWtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tLC8RNUs; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tLC8RNUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMaCjLiBV7zHG3k4tYcPl6rTqO2FWuZoMuJrj1xMKmRHbbEv8xFe/x8WTRLaIYpemjT66jb82y+5O1bPabmguOmIURg2vlt29T3vKNgkPZT6XPYj4yIQoJy5bNpxT/oPrbMdHDHe2zO0pnBHWbeHclfNQvfRJz3Z9VTxfdFNROtgBMacMiWS87i/l4s1IoPmxuB5uKJPAzWWssAKLO6UP7K9k0eoWADm1ujEp2zLzhdfF9gxhHGIr/ljZk/DmqcEz0nHip0XG6IvShg5kv05bux9vgmYpSpUWtQgTF8mGRt+7X46gNdclNVZ7brRibccta5S7JIIO+vyLCc4hvEe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BRaNbODYc2Hv0Dp6pc1uJRMgAxAIKhh7WRRohc7ofk=;
 b=XZE8LRxPdPstSdaUWeshV99LaUW8AMSb3V985kKyCKigluiRmCwruVuS44Dd782l8VMtu70q2U3CFCjsZx/RDnFBzBi9s+/l9g+4Uf0OXD2IvIafV/oL7oBOBwuFql0lDO0YQAY1WpVFYJB+z3uqX36P+YvKjcLG86OlMb48Y6U1Rk5mWSeAyUmkQV3CouKZtDb/Q96FCc9gnH4GdU2A9gRJqOZH65mlbLgaInBzu6JUxMwSDfRct3unetY1HrCHDNYJw7nVQQpzC88hf2X5S4q96jMkF/BZyWOSupE0IeV7o8gfRr7F1FFiV8r4fUSuZO3ljI8nmElJ1nbY7L13BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BRaNbODYc2Hv0Dp6pc1uJRMgAxAIKhh7WRRohc7ofk=;
 b=tLC8RNUsghXXtt8ot8nOll12AFTPCXE6WfAijdIRZ3SwpyTSwu8udgaN5K6Y2q3/AsjO965+TwDPRUW5XCbuHyqAoONsk4LpHNli9bMXwojeh4GNH6FDdIIPWS4M60ZnFngcD9LQHXzcxMt8SLLMTcKrXZvGn6KUbXZgiVbA10XPFe3m9AMkBzXCeBIujfwsicTKEOipPoyCpnFtN4xucHzIOUv9RgRu+2mR+qxi8edg6dQgHuvReOBZI54wCW+B55xX0jMxJ1H7eQTEIDQfUzwqp9q7nvpwIVcTOg9hciERBmeOG0GBqzk3DrIX19xZ5onRc6x32rWtAf46U2pyOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 20:12:53 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:12:53 +0000
Date: Mon, 10 Feb 2025 21:12:48 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org, sched-ext@meta.com,
	Jake Hillion <jakehillion@meta.com>
Subject: Re: [PATCH sched_ext/for-6.14-fixes] sched_ext: Fix incorrect
 assumption about migration disabled tasks in task_can_run_on_remote_rq()
Message-ID: <Z6pdwM6upNhMUFRU@gpd3>
References: <Z6pTDc_TfujiHW5v@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pTDc_TfujiHW5v@slm.duckdns.org>
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a0c307-4520-4994-6fbc-08dd4a0f4cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ednqlyQ5DjZ1QuYuzR9DN60KwXljj/XUyebYWUaO8aieXAHXK7ccPaC5McUF?=
 =?us-ascii?Q?SWTq3kUFVGe1cT5C8cX1aTCp0E6YyWq8BVkKA40p2L9qvlc9vw5hOE60lEp1?=
 =?us-ascii?Q?djuIZlNneH25qoyrFTYwT3riaFKvOhORh14cRHTWBkhOJ5XPrmriAbeyfuZg?=
 =?us-ascii?Q?7Vq0YXxReLLbOf8gl9TQsy/MI2sZ5/M+4ZkzymQZQPDD+H8mH60eSB+oAezq?=
 =?us-ascii?Q?IfeLtsBbdvDINjbwldyPDiiHOfbtlHVwCDbM43fIvgpSAovExI2zXNLngkxF?=
 =?us-ascii?Q?TocApHYwjEuMuYgaOUKN0mkBcEItBxuxwyVjIn/ku7QebPYYOj5hNfZf05Yo?=
 =?us-ascii?Q?h9Xn1xZ2tlzqvxp77nxsYInv/stk3p18WxTJ83XVJBB0VS0qiZljslKPFCSm?=
 =?us-ascii?Q?I9K2/Pm8o3fT5BbvLyno4Y1sjB5kjw0sKu/n8VIUldr9N3q8wMAmF2gDfTEF?=
 =?us-ascii?Q?BrvaYgJ0ml9uKdfiIV4qg8mGdzIoxX7QZ6ZpW2WgRZX6Mgukn138rJaHt0k+?=
 =?us-ascii?Q?bMtMbO5hBPr5c+htAZkrgDx8Uv0TWmoTp4HU/OQjUA5mHMPUX5yC5VCRbZe4?=
 =?us-ascii?Q?HOoaR2duInZO5o4oYVjUwwX1OmksgwB3O6Xe9+GYc+8AKCGUp9i8ZO38mHGH?=
 =?us-ascii?Q?gzVBcBSaYGdQJLw9ZNZDzLeXuiMla8gireNv6hehOCU4N9mqonRwCEBnNi8x?=
 =?us-ascii?Q?cmghQzfWKV6uhvxjKbPVGweztj04XlY7FtItMGdiQwQA2nqcMUFttw732pvB?=
 =?us-ascii?Q?UUVkxZarYOdj9MTTIuOo5bpfYfU4ajJ/tEA82+Q6/K7vfbe8VGmczfV99eX7?=
 =?us-ascii?Q?6AT4oS7/TKIfkFfy05xbv9j/u7PX49+B5wGx4j1X94TEGQfH5Ok2ElF6TH/n?=
 =?us-ascii?Q?df8OzTG8fVg+7uthjdQVOtDemCndu0SZcGESui1H/58enHAxyYKlsnLgN6yq?=
 =?us-ascii?Q?b1LKnOQXN3ZTFLFbW6z3cOV703iUCcc6ONQDjv0h2VVATEHbyFq480JVnZak?=
 =?us-ascii?Q?ZJUY132z4Ra8RaDBbz6FqxxvX38NC5/JkUjRjqxV2pspYCMCy6hDvTY22G3X?=
 =?us-ascii?Q?h7npJ6xnzzlGz9w+BjQtYZsJOb+h5NPC9uiKart5JxRorqn+3NiE7ns4JQgW?=
 =?us-ascii?Q?cDqP4pqx2ajuBsuFHRmcej7Ar58Ru3GyTghft+VU314MX/trPoBmIxyGTeWR?=
 =?us-ascii?Q?HLrKS2hcluVW+xtgp0YKTmz0CCYJepnFO+nJAUfbjUmTWMytMvjSk0znKRQV?=
 =?us-ascii?Q?WxXTwfFs0WrZxeBN/aeUI8KLYhLbFmXWZ+v5aRvRyiuXsOkOaoR7azqS1h6/?=
 =?us-ascii?Q?YFTuktnFGDTJGCQclYuDEbe5QFcWbd3jZ1evlU3IrDUmFx67z4YrC6jj3RYX?=
 =?us-ascii?Q?tdjzvzFsy0Un8z/71IfxmKz+yM3Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G3n42rJVhokHfO6TRomayIb16qw0M44qXEnj7bfY0qNEditueGYwoCi78jDM?=
 =?us-ascii?Q?8R+xgIYKp9QX0QWqJ8JG/1bjVyxBvP+zpL8ycxpBddOGQLbdAsorj0dkpnTP?=
 =?us-ascii?Q?GT4hgTdgih0lLbxwqoECHKl1GwOgYRdsjA8+KCyFch/e3cIOto9g87nvUcim?=
 =?us-ascii?Q?QFjAXIN6bxlaR3/MtdKR97w4O9rZhCFtDqbnkDVbG9G15srH6Q3vWG7x5sYN?=
 =?us-ascii?Q?dO28ZBRUY3WnUMPl9pxKtyi4UkgGp/XOrh62xLfkQwpHe3ei/ElbJUq4icAr?=
 =?us-ascii?Q?1cWFktJwvl4/TLVfC0CvMTf7p53hypoja/zNJ66s0T0xfu4gh8YhLTFH26GM?=
 =?us-ascii?Q?RH1lAzO17/YZ4zMs/PQp3fGWGIA7bxqfHRskJBOLHewd1Ib0/Y3HNfd/SWFc?=
 =?us-ascii?Q?JusWwUCPkvAsKKeO1YX/HpQwd/N8RogDR+XzafZOBMEovFCdVKUsUwF4C+eg?=
 =?us-ascii?Q?vqZ5zGkB8F5Eku5lM/6qBotFK+1IcEVMoJekA9VFD9FCMD/R2nNUPbzNZSN9?=
 =?us-ascii?Q?qCHyx5pJzQ8ncGYnziGFei6wt9W5Xnfj7WFDuM/RghzZO7X3ujGyzLp0pudW?=
 =?us-ascii?Q?Qfx0lQCjlzk1VDlUXcQdZQcU+uY9wR2yqYKSDx0AcVJmECCqbaGTdYBfdxQw?=
 =?us-ascii?Q?F0/L9UxQFLd3UWFLaH7Ke5tTZOp+5PfjxBQR7EbXFefFytDs//4UJxv3nBPL?=
 =?us-ascii?Q?8h5XQMbhBOJ39Rq+mnnHq5VR5Nw3ZP8brKkmMCFkyyRClE/G7oV5Nn1gzxSn?=
 =?us-ascii?Q?QBF5lpZNBo87JnUSH7rveCi/1CnFcv0kqtGIb8Jzscp0FIlh0MklmCVR4UOD?=
 =?us-ascii?Q?QBr/Reg6ryikGGlum8PwaT/gLIwOGUlK7ClVLmr0LzgdFKyWDD51UR8uudIs?=
 =?us-ascii?Q?k9lAVILVZ1TkHyJEI7bVmYjTwT4M8KDu49W2Ge5OZq1w6MDmnXW6SGbDBudv?=
 =?us-ascii?Q?1w3pvpRex16HttP6fOD40Dz8+MtyE92wpXWINJQvBNPa/L6DQpLswUpnjspA?=
 =?us-ascii?Q?KHLpzB8NMEtVqzoH9EbipHY44wkk27y2e2N3ww8Mn9sjXSPT1IQFGAZEVSWw?=
 =?us-ascii?Q?W5ZlcEFDsVDvX7/BGVE3w7nYM5mLWKyW4NQKn/jQHeEykt3GTQvUgp9Jik/U?=
 =?us-ascii?Q?f6KcUfp6xt6xMS8PwmwQwyHz6r3x4gwkTeoQaBlKW8hh/iTKXCrOwP0Bbv+5?=
 =?us-ascii?Q?I/dSmAp0MaDpwM7GDpY8n1ZGjBKLIPe1YH7aK7CD3kgK5SkK5WQnRXAkuYBx?=
 =?us-ascii?Q?3nkYBI1NpZnGUYxedFjaMW7BNiyVUbBhmcAgX+2N4B5dBW+1qeR+UORSDCxC?=
 =?us-ascii?Q?opq8QuIMh9PkVAn3w8pjCi4w8mTePzhPE4lvgsNNgUYbs3bQxnyrB922pqVg?=
 =?us-ascii?Q?TZ00U3wI6Z0Ra28m1MAHX2V/lK6z7SlGlZDpIZlB9HMyxOYm6y+lQiy9BxNX?=
 =?us-ascii?Q?0C9ar+hYQtT/+Ag6EdOM5oe2E/1sXQnuIumZM61iQwZPUnW2Lt2dlOGEflP4?=
 =?us-ascii?Q?ylIxQtK8mhftHBngP1EpyVtaglu+DPPjQ2RCGIv5dGa3oO69DN7KQ3a/snui?=
 =?us-ascii?Q?el+A1a4657AtDBCljG9tvjUdHGN5JdPApAK8UPcs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a0c307-4520-4994-6fbc-08dd4a0f4cbc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:12:52.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3PS31eSmyx51sUpili1ggvZygQqcTyQ7mUZNAEqk6VBzGjroJ9KQ+vPwP3RzmG2hCqBt+f0x2W6biUA/T0ouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269

On Mon, Feb 10, 2025 at 09:27:09AM -1000, Tejun Heo wrote:
> While fixing migration disabled task handling, 32966821574c ("sched_ext: Fix
> migration disabled handling in targeted dispatches") assumed that a
> migration disabled task's ->cpus_ptr would only have the pinned CPU. While
> this is eventually true for migration disabled tasks that are switched out,
> ->cpus_ptr update is performed by migrate_disable_switch() which is called
> right before context_switch() in __scheduler(). However, the task is
> enqueued earlier during pick_next_task() via put_prev_task_scx(), so there
> is a race window where another CPU can see the task on a DSQ.
> 
> If the CPU tries to dispatch the migration disabled task while in that
> window, task_allowed_on_cpu() will succeed and task_can_run_on_remote_rq()
> will subsequently trigger SCHED_WARN(is_migration_disabled()).
> 
>   WARNING: CPU: 8 PID: 1837 at kernel/sched/ext.c:2466 task_can_run_on_remote_rq+0x12e/0x140
>   Sched_ext: layered (enabled+all), task: runnable_at=-10ms
>   RIP: 0010:task_can_run_on_remote_rq+0x12e/0x140
>   ...
>    <TASK>
>    consume_dispatch_q+0xab/0x220
>    scx_bpf_dsq_move_to_local+0x58/0xd0
>    bpf_prog_84dd17b0654b6cf0_layered_dispatch+0x290/0x1cfa
>    bpf__sched_ext_ops_dispatch+0x4b/0xab
>    balance_one+0x1fe/0x3b0
>    balance_scx+0x61/0x1d0
>    prev_balance+0x46/0xc0
>    __pick_next_task+0x73/0x1c0
>    __schedule+0x206/0x1730
>    schedule+0x3a/0x160
>    __do_sys_sched_yield+0xe/0x20
>    do_syscall_64+0xbb/0x1e0
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Fix it by converting the SCHED_WARN() back to a regular failure path. Also,
> perform the migration disabled test before task_allowed_on_cpu() test so
> that BPF schedulers which fail to handle migration disabled tasks can be
> noticed easily.
> 
> While at it, adjust scx_ops_error() message for !task_allowed_on_cpu() case
> for brevity and consistency.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Fixes: 32966821574c ("sched_ext: Fix migration disabled handling in targeted dispatches")
> Reported-by: Jake Hillion <jakehillion@meta.com>

Makes sense to me.

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea
