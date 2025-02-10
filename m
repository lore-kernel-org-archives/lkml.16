Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EDF264602
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220105; cv=none; b=NmEjRye+KsfcxfMkxTOLqFMO4vhA8r8pDVu/JO/0cb3v0Np7p56hr9sL9mdux6vu1CgW1V82KEVeMXj5dbo8o2ZkTMfrOy4ZOmmFfk/5Zhwlx/hqcf8PAX8Au/BLhGWNSJyDo1SMk/cPRqcI30GFgD9Yo4Qv1FfSQnFN6NVI9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220105; c=relaxed/simple;
	bh=PUckf2U3CHMxTk6tMfGiAGmUTY4Vf40pOMBHyCATOU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg3RCVHZqb9mle9HwyNa3CRh9QNNTPNGPbT5RHHEl4Hdq72GgZdzwupJbnuLUD7pllJ5Zl/dvjBR9ChVoPuUE6ZugEKShxWuBu0LgRTBevna+ArrTPp9DR/H0Zk2+wrVgM/KMh9QBMESckVi5r2gdCnySfIxjY8Cj6HjyNAadoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/Zy3YAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/Zy3YAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64E1C4CED1;
	Mon, 10 Feb 2025 20:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739220105;
	bh=PUckf2U3CHMxTk6tMfGiAGmUTY4Vf40pOMBHyCATOU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/Zy3YAVW/RaENM63F9vqDKSVN/2O5LpQZqBj5iNCeVvd8gWxaVqZR9d6xXgdAuae
	 Xcwrm5THNfVv+ZT0LyYW4iRJYiqq6OkXP1bZ60LdrJqHSFIe9jNyX5li5BqRAmOldZ
	 yi3tJQ65O3bGiik98yZRMXn5ih0jPTiUWIAB0bnjp6z5N93M9n27xtfQFrdLM6yF6e
	 +PKFyaLfuBBwII7jVnbyfgm1wGcvl2a6wbhDpJ9+gMpR8EiJrYM9UKke7wy2pZADxM
	 GqSFNzaFbqCSIZ8B+mcSUQxYPqT1lUBfx4ZJYs4bS8lDUE3S1dmPZuJCft0nihuMdg
	 w0K9hWoW0FacQ==
Date: Mon, 10 Feb 2025 10:41:43 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com,
	Jake Hillion <jakehillion@meta.com>
Subject: Re: [PATCH sched_ext/for-6.14-fixes] sched_ext: Fix incorrect
 assumption about migration disabled tasks in task_can_run_on_remote_rq()
Message-ID: <Z6pkh-OC_gnBHyfn@slm.duckdns.org>
References: <Z6pTDc_TfujiHW5v@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pTDc_TfujiHW5v@slm.duckdns.org>

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

Applied to sched_ext/for-6.14-fixes.

Thanks.

-- 
tejun
