Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C4134D4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898882; cv=fail; b=mFxQiuO4tFmdS4akcuN8wjtLs7Gq0uTjWU/cm+CHaRo0vGiyvDrZ0KWug70zuTI/ldH6lcFEJ3er/GiJUWpMYui4ntgirWYaV/0dHWk2U3uJWiHWbfzrebDwZBnz+xdCa58kDtB6KPlsCMTb5yU7Xw771ka+wSaGXjLfAzC3oVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898882; c=relaxed/simple;
	bh=KfUlhICighRVyKBGkczsAhHUTc1go7VN58tg0MsqASA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aAmb/RVUxuYqq7VJcjVnvC1AYJM0JceAp/ayvqDbcAnKELRwpGjk6hlvhEFQ/wZiHlTSrw/lH+zX6IpZZIbSvwjeFdg8nbBS3i1lHZ5D08FoyYPKn33HnqP1EuCJGVBscOJBmzl4aNXa6qXN1CMZ832zBjLv8Xw9/u+9VUOOk+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vi5jH8Pz; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vi5jH8Pz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjFkgNKUDVaWRQRcfueCChNC+8q9dNRrGE+/u3yleY8CxHUgKqWGgU5RgRREJ6OO7GlrLGB5d8sqESUukofO+Nl3LxHPPdwogG8SukV1qlzpWW6JrQs5srBnLhaOjVTyMExS/wT+TbwpW3UFJ0yVCfYBvGpw7MX9XsiyD1eZBb5nzsGnlr+N5TNCBiBwNQu0IEf35tA92tFI19sbWqRI8/xxvQQahwsrLXqapJD7nRj8Xe4QntX3UT3oZpvMf3IkkN3H7UvbUYegsBPMlkz3BhAGM1w4/xnDqFE2gELMmbw6PjMS+RsGRDCFIklfGLHWpKq4oqWYUdaqFVFyWQvC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBk72QaRnR+brzWqDhzHC/s1WMzM8wyMzvxfrH42wco=;
 b=Y+5kbJkYk9H9j+D9sO2xcgvtZk8O5Ojo/RAZcnGg33y0g2VAhpuSnwvQ41wWdvQcTRBlPNZchtSKbmqyg3kYYXsfvAjPcS5DPXfGcRtYpzkYyBAMUbdOZLLsjcOgl+GDwtH2+VRKL7i5mj7lS9JMuFNceCopmzExhHDjFzdnodtFHM/ZOhY+ZjmqhvxJT+B6IALBIWHNcBml2DgkC/3ziYknR7ucH+a2rBynwm5RLmsCwqaeS0N7J6zNmHQaOgorqDDa3aa7/iZKh+NKgeSPO4LtqPu/1IvpgUMpnsQ3gAcYTMqkLBEcbSjYRdAxQnM8kkWuGXpUS2xWkhYagZdPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBk72QaRnR+brzWqDhzHC/s1WMzM8wyMzvxfrH42wco=;
 b=Vi5jH8Pz1/QRCUqLrYemSL86ijFcOGhJOG6s+xKm24GSMGFg2G35fIuee5QLWM+fTWko3Va79W8i6BeZcPdwqu4SEGNlatcHuYmwCY6rU4EKNkRwsaOj+ki+AicUE5GK0NSpWHDpknmW25uy0+BWNi0dg9jpInIoIo12tzgN1YOrDuMj/0pIkt/YpY7WBI4YT9Lw4ZMK1Wzut5hY/ulK48N8b8RdDZR2AhRptvHev7NqDNQJjZ5lOa7PYKLQDtbtssSFJv/SQgjmedxCcImqXt7mAFZep6mt8qIkm9LuZctt0/1cnavi1wThgI33izRR/NrVvJWqa1bJdDNn+g0mrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA5PPF5EA4322E1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 22 May
 2025 07:27:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:27:56 +0000
Date: Thu, 22 May 2025 09:27:47 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Call ops.update_idle()
 after updating builtin idle bits
Message-ID: <aC7R80ADwPtJmNhu@gpd3>
References: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
X-ClientProxiedBy: MI0P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: c764f072-1819-467d-471c-08dd99022c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6jHTuCcip4WRdJWBfiKOmGrcZvSiDHFacJ+SHHEvjxAwAs1DDPsxxeWgx7j1?=
 =?us-ascii?Q?7/fGrgvfGVX1pJ6zQz7gJuLM6NP8XBXlb7vOjOiTtw+lJG+UfIpoAqY7EHdY?=
 =?us-ascii?Q?/Zv8j2V9NDNQzvZl231LylECq0KMT5pHXGEhBFWOW31oZGDiIEMu0xCgysPe?=
 =?us-ascii?Q?u5/WDBkrR0vhGQ6YG78FmumJjZBpNnlu6Fgn/ABTfxCsSxac3qejPHiZ7zw0?=
 =?us-ascii?Q?F6HPy9tV3dBbrhhISgDh2EZaUpAfX8JZ+d2AKxFieyM4JTvC05InCZ1d7nZP?=
 =?us-ascii?Q?021sF7OOEcciSLQjxUglIVNicMz/VcEBUolJng70Tm3f5p9RLlfrqpbLEgfP?=
 =?us-ascii?Q?mbmsmGl47FKM4UpK1uq7s7qRnBCaXC8ISt5p8IDy0HzLYKqjpnyfyeTIJKn1?=
 =?us-ascii?Q?S+cC8xQatui0bnILR4y5xCRwds4yjMh2e5UPgak721tTMwJAHq+PWk9Tbv4k?=
 =?us-ascii?Q?OeLaF24wDsyViCW/VuHROQDWgtvwE6fNMPF4OEGfC+dwrmPsBkCzXUVvS8f1?=
 =?us-ascii?Q?TUlyIq/hWXaYoK6i1SeA+KOzA/PFK1Iv3tQHWcHgkwwPyxWWHhRXm85ItiVS?=
 =?us-ascii?Q?xC+aO0FXIYng7QqHvvmI/eKxH9dQWWVTGUT6XieCKpxl3JikbI5pKwlX4K96?=
 =?us-ascii?Q?9tJJje4jiUAg3vf+3uZBOHkPLPRCBT4Z2DDAAsvIbvfWLQYL8KP6VK7pHtWa?=
 =?us-ascii?Q?UkdhHoLohOXRxpINVSUAxruvq7bVG4eO9w6/GrKJVTnTzO9DEVn9O7RJYa1R?=
 =?us-ascii?Q?CQG1PbeipfaZrsi3khPmskQ+jKefRYj9QWPj0EDVKycsGHI/5Fn622rYGVQ5?=
 =?us-ascii?Q?c31OmB5P/ntR33YRh10H0hMJicMw5GQmWJxmxSfpqYw5/UaWPmZJ1pewWxU/?=
 =?us-ascii?Q?RiTPCnqWouTefJYfb+44higmM0m0sI5xmmE/U66uExlGFo3fFi79AjfqAhDw?=
 =?us-ascii?Q?3q/uNi/4YlEV/HU9iPW9ZYXcX9NVMpKnsaCzeWDymy7p6dHGWEU2xDSZswJn?=
 =?us-ascii?Q?KBBO1LKJEFDs5v/wlO7wTO6920lr7A29Wr9jjXKUj8I7F6SWjaY2sQp253Zq?=
 =?us-ascii?Q?St4SdGOPhsr65X1Oc9W2YRG4t82LSzgGv6+Eqa9wf3m8l6/tMTiwMzXCYzMw?=
 =?us-ascii?Q?o0eqiqM7J1t/0k763B8oRphzAYeIKT8EaYIgDPKVGtIjq8Q9ZPq0v6j+mo5g?=
 =?us-ascii?Q?OKZBjAi2RUlal27+oVZ7isrx4SJ75+FDr6rsDxKOUoN7/TeXdyxe0Z9b1y2V?=
 =?us-ascii?Q?Nw76dBiPwj/NSF3mhry+qQGV+Wcygsu7rFMHIDkZmssU2ND6cQfUH3/OMR6M?=
 =?us-ascii?Q?K4Bzo+iVi9Wnzere42l1bnaF/6k0URMSp2G/gJbymxzIKGNcKEbAWNEzaK1u?=
 =?us-ascii?Q?QP4sRknmN8CDyTv8mivPNgaUHYeMEB9lJD9mzdms9TqsFNjW+QW/hIuH3US7?=
 =?us-ascii?Q?tmtOjptLR84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bumRMT+PTSaTBouYFzBn3MWQg/zXpSFtin2xZOUNrIxf4+9/Tm8sgpeGUSA1?=
 =?us-ascii?Q?Skc3pxZUkZU13ekmdEbnEw2BgilFmZFMAPu/wBIwrO2pK3GtvlFp9GzKMwR9?=
 =?us-ascii?Q?cJwmFzGFrwiSNVV3MxTpFYA6CAHAD0+4Kb5ENWO7JyGUuUOocwBtdHqgLVdC?=
 =?us-ascii?Q?lWNZiFnV+4Una/27zIAz4rwOy346KAx2mmmUBGvgjSNdtHtlQ3O74FUkkgfd?=
 =?us-ascii?Q?uFAWIgwRwMsK5zchb3OTHkOzoeFQgB/W7i1K79W7FaLZHngWM1bkxzy/scRI?=
 =?us-ascii?Q?ZdWacXgYDQ9GsS6oQY2pkN3JtDgwMfCOvi39FXvncISyXQN2u+r/bzVfV70H?=
 =?us-ascii?Q?mVZMm8WAlMi36BuvJSYGWH0MvDcwO70Rws815PlOdiZ62TvgwjykN9EgiKX6?=
 =?us-ascii?Q?aMNuVwCD+kr3ulPeRDwq6T3vIbq1YDvDRB2aQmQp7HkftzpzzczLaTCburCn?=
 =?us-ascii?Q?E5ybI8oei1Rd04ceBCTOoYUtbIlgTJrcBOqi2UCf7SsYq5FhxuZqjNvXLWiS?=
 =?us-ascii?Q?ezWp804JSUK6Uu3entabRnAUVH7YQG+9eB6uVUSVA+DFkysxnVVIsKU6xDJl?=
 =?us-ascii?Q?mcKnVzBEydp/FRTmPEpMiIYvvilF+9SlEr3inwJ0WxoDfbt+hp4CYH3khT31?=
 =?us-ascii?Q?TpBwebTsaX8yje8/mLrD2BMoYcmIWUWtQSkkmGSuKooj+VkQZLSdsN9OlxOi?=
 =?us-ascii?Q?sJa3RtjtxgOwt+mkur8XnUfz1co848jesiZcKAd4VnzpcfaVyVgNLYtf6ZSa?=
 =?us-ascii?Q?08Kcsu8M/BBhJBuWTGIK7faE3aZiGStGP63xXyS5YeXszZ+TE1S9eAhBu4XP?=
 =?us-ascii?Q?v4ey3715zL2QNXUp6CCsiOqOnnv9/IdY8lNGQstP/Ue36P4pj8yuWpC5QQAc?=
 =?us-ascii?Q?/BP5yTHb3G/Mvr/C9tVY3T+bFUTMWNZlvgLcRl+ive530BPhrzfIQa0x8aVa?=
 =?us-ascii?Q?lYBxgX//0ULtw+t5nyaaOiyJnAtyRpSEU22lLBhd/ecKBR48uDtt/U6uS2sA?=
 =?us-ascii?Q?pDMmtIWTyJvhwv2UQbtWdCLwv7AilV+loPYeyHVz+oqTOgeaXI51eB62Gd5j?=
 =?us-ascii?Q?RF95FFqvLyJ84M5hkXzgf8G5o/pdO+xirjX7osjU4WRSz3w0L9C/IeC6xXep?=
 =?us-ascii?Q?JsNsxPDlNoS94duJp96IFEpnr6NbpQjYcTb2HIyfxp7Rfobu1myS2p1ObHKz?=
 =?us-ascii?Q?MsoFEEXQ44nCtNOVK6m38O1YD/kdGnz+eQiHB6gZmA/IcmM+oJBU9n6CYMth?=
 =?us-ascii?Q?0QUKqMHXwdCLz00ReHDac/eUSZRjKAp9QExusm96sbSUJroyLOOASmEUjBdX?=
 =?us-ascii?Q?DQctOrUlVQK35RhCrQ9MEAL6UoTGFmxQ4G/AmNsGC6J5xYEfjp0Hzck/HUFZ?=
 =?us-ascii?Q?R5kQQI9DnCju6umi3hiS44so7tzdZO+a08WC9AWvLVGMYIJ5F3VCRECS2WXT?=
 =?us-ascii?Q?Xcy8JIL5G3hqG4L/lXLyel9VmoqpQpuKpLP+neaED6SEalWpMXCXCm23sZRg?=
 =?us-ascii?Q?HOBOEO7V44aFMtBt++YnhNGgJQgdfAvVUcSjk9chgK7CYHrrNPTd+y1WaQm+?=
 =?us-ascii?Q?I4FjmBJgGatockGrqPbk2iDJ1cA6MnFzTVwIniGQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c764f072-1819-467d-471c-08dd99022c25
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:27:56.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xek5J40kIWUm5KhlkIV+qxCCrYLR/PNN77+1GdZquIKlWTEn/wXr5fv4FNtZc10ZYielpxa91SnXlotLEBOlwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1

On Wed, May 21, 2025 at 12:23:06PM -1000, Tejun Heo wrote:
> BPF schedulers that use both builtin CPU idle mechanism and
> ops.update_idle() may want to use the latter to create interlocking between
> ops.enqueue() and CPU idle transitions so that either ops.enqueue() sees the
> idle bit or ops.update_idle() sees the task queued somewhere. This can
> prevent race conditions where CPUs go idle while tasks are waiting in DSQs.
> 
> For such interlocking to work, ops.update_idle() must be called after
> builtin CPU masks are updated. Relocate the invocation. Currently, there are
> no ordering requirements on transitions from idle and this relocation isn't
> expected to make meaningful differences in that direction.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>

Looks good and it also makes sense semantically: potentially any action
performed in ops.update_idle() should be able to override the built-in idle
state, not the other way around.

For example, if we call scx_bpf_test_and_clear_cpu_idle(cpu) from within
ops.update_idle(), I would expect that to effectively "exclude" the CPU
from the idle selection, since the intention is to override the built-in
idle state. But that's not what it's happening if we update the idle
cpumasks after ops.update_idle(). With this patch applied, it works as
expected.

Maybe we should mention this aspect as well in the commit message,
something like this (feel free to rephrase/ignore):

  This also makes the ops.update_idle() behavior semantically consistent:
  any action performed in this callback should be able to override the
  builtin idle state, not the other way around.

In any case:

Reviewed-and-tested-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
>  kernel/sched/ext_idle.c |   25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> index ae30de383913..66da03cc0b33 100644
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -738,16 +738,6 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
>  
>  	lockdep_assert_rq_held(rq);
>  
> -	/*
> -	 * Trigger ops.update_idle() only when transitioning from a task to
> -	 * the idle thread and vice versa.
> -	 *
> -	 * Idle transitions are indicated by do_notify being set to true,
> -	 * managed by put_prev_task_idle()/set_next_task_idle().
> -	 */
> -	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
> -		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
> -
>  	/*
>  	 * Update the idle masks:
>  	 * - for real idle transitions (do_notify == true)
> @@ -765,6 +755,21 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
>  	if (static_branch_likely(&scx_builtin_idle_enabled))
>  		if (do_notify || is_idle_task(rq->curr))
>  			update_builtin_idle(cpu, idle);
> +
> +	/*
> +	 * Trigger ops.update_idle() only when transitioning from a task to
> +	 * the idle thread and vice versa.
> +	 *
> +	 * Idle transitions are indicated by do_notify being set to true,
> +	 * managed by put_prev_task_idle()/set_next_task_idle().
> +	 *
> +	 * This must come after builtin idle update so that BPF schedulers can
> +	 * create interlocking between ops.update_idle() and ops.enqueue() -
> +	 * either enqueue() sees the idle bit or update_idle() sees the task
> +	 * that enqueue() queued.
> +	 */
> +	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
> +		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
>  }
>  
>  static void reset_idle_masks(struct sched_ext_ops *ops)
> 
