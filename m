Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C321D3E2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610523; cv=none; b=PyBvF4dyMM5ThA4W3zrcNEw4Va1euGwDpxKOokL6F+pEKD+8N9cEo/78m4nbSSY5F11el2F0Ard5Q3I3hi722a+eH86y8rmAYusrndFVcHitr8hBKTg0SD+QaHvyoF/PXEiyNDVOHhDoanEzwu3ydjvi9cBy7D7lKUhNy2PJrvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610523; c=relaxed/simple;
	bh=aYZLgVf33g9YnHu5Xc58VtQRMe/tEe5fFoCFrGnuBqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikRM6oqFzaFVesCLQ8pYeI8te2KfYS4wgqqDT6ozRHLfgE/riFQP2Gday3LlJBxM8CsDrBdoGzIaSPfLt7HhX7nv/QggF+Vek3Fe87SyD7frnOLx34pndzK2myPa/g5NmJravmgUlgEMmwn7ap8Zp/Gg8WxJUH9j08F1BZWkj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usGyUZ2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usGyUZ2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47656C4CEE4;
	Fri, 25 Apr 2025 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745610521;
	bh=aYZLgVf33g9YnHu5Xc58VtQRMe/tEe5fFoCFrGnuBqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usGyUZ2VYZNrUz2/yUuIgsIkGjVlnl+RtE19TNcgISl1WhDTKjwS/vJDPic8Z9DNM
	 PQumhvpl0QABm6c/rFLkJeAaKlyws/nmrAk6xg0DJhY9OSHOhBqeLlBVWnnVpaI/Gn
	 mqELO99v5gHDI1lWQtF5MgIU14X3kajM7RZuZDXNvEaUJ8LqexcdNDqkcMkMB2gO3/
	 9bfOok1FpY7qwB09FkV6PA46sWHpEIsroLSc3AVnIdK7RATcvCT37BNA7dQKPh4D9e
	 umBMa8XTjjb3sQxMa5/Gr6JDHG05al+n7WmQUpsMg1LlHcU9YUSkNk1Bf8Ir221BGW
	 N1y9eKbFmcPhA==
Date: Fri, 25 Apr 2025 09:48:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] sched_ext: Use dynamic allocation for scx_sched
Message-ID: <aAvnGKR7ThrRiRQP@slm.duckdns.org>
References: <20250423234542.1890867-1-tj@kernel.org>
 <20250423234542.1890867-4-tj@kernel.org>
 <aAtgdcpNW6Rj4m_f@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAtgdcpNW6Rj4m_f@gpd3>

On Fri, Apr 25, 2025 at 12:14:13PM +0200, Andrea Righi wrote:
...
> >  static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
> >  {
> > +	struct scx_sched *sch = scx_root;
> > +
> >  	scx_disable(SCX_EXIT_UNREG);
> >  	kthread_flush_work(&scx_disable_work);
> > +	kobject_put(&sch->kobj);
> >  }
> 
> We probably need to check sch != NULL here, I was able to trigger this bug
> (using a buggy rustland):
> 
> [    5.048913] sched_ext: rustland: invalid CPU -16 from ops.select_cpu()
> [    5.048984]    ops_cpu_valid+0x4a/0x60
> [    5.049039]    select_task_rq_scx+0x10f/0x200
> [    5.049100]    try_to_wake_up+0x17a/0x890
> [    5.049149]    ep_autoremove_wake_function+0x12/0x40
> [    5.049211]    __wake_up_common+0x7f/0xc0
> [    5.049259]    __wake_up+0x36/0x60
> [    5.049306]    ep_poll_callback+0x265/0x320
> [    5.049354]    __wake_up_common+0x7f/0xc0
> [    5.049401]    __wake_up+0x36/0x60
> [    5.049448]    __send_signal_locked+0x71e/0x740
> [    5.049508]    group_send_sig_info+0xf3/0x1b0
> [    5.049567]    kill_pid_info_type+0x79/0x1a0
> [    5.049627]    kill_proc_info+0x5d/0x110
> [    5.049674]    __x64_sys_kill+0x91/0xc0
> [    5.049789]    do_syscall_64+0xbb/0x1d0
> [    5.049855]    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [    5.050315] BUG: kernel NULL pointer dereference, address: 00000000000003b0
> [    5.050386] #PF: supervisor read access in kernel mode
> [    5.050439] #PF: error_code(0x0000) - not-present page
> [    5.050488] PGD 0 P4D 0
> [    5.050523] Oops: Oops: 0000 [#1] SMP NOPTI
> [    5.050571] CPU: 5 UID: 0 PID: 284 Comm: scx_rustland Not tainted 6.14.0-virtme #27 PREEMPT(full)
> [    5.050670] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
> [    5.050782] RIP: 0010:kthread_flush_work+0x60/0x140
> [    5.050847] Code: 80 00 00 00 31 c0 48 8d 7c 24 18 48 89 24 24 48 89 64 24 08 48 c7 44 24 10 30 e6 58 b0 f3 48 ab 48 8d 7c 24 30 e8 40 6c 05 00 <48> 8b 6b 18 48 85 ed 74 69 4c 8d 65 08 4c 89 e7 e8 0b 0c d3 00 48
> [    5.051021] RSP: 0018:ffffad01816f7e08 EFLAGS: 00010246
> [    5.051066] RAX: 0000000000000000 RBX: 0000000000000398 RCX: 0000000000000000
> [    5.051131] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffffb2f34d80
> [    5.051196] RBP: ffff9b140268e800 R08: 0000000000000002 R09: 0000000000000000
> [    5.051260] R10: 0000000000000001 R11: 0000000000000000 R12: ffff9b14804c1ea0
> [    5.051325] R13: ffff9b1401b6cc20 R14: ffff9b1403965728 R15: 0000000000000000
> [    5.051393] FS:  00007f1ff0550800(0000) GS:ffff9b14cbdb3000(0000) knlGS:0000000000000000
> [    5.051463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.051516] CR2: 00000000000003b0 CR3: 000000000553e002 CR4: 0000000000772ef0
> [    5.051582] PKRU: 55555554
> [    5.051606] Call Trace:
> [    5.051634]  <TASK>
> [    5.051665]  ? __pfx_kthread_flush_work_fn+0x10/0x10
> [    5.051726]  bpf_scx_unreg+0x27/0x40
> [    5.051773]  bpf_struct_ops_map_link_dealloc+0x36/0x50
> [    5.051824]  bpf_link_release+0x18/0x20
> [    5.051863]  __fput+0xf8/0x2c0
> [    5.051905]  __x64_sys_close+0x3d/0x80
> [    5.051943]  do_syscall_64+0xbb/0x1d0
> [    5.051983]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Changing bpf_scx_unreg() as following fixed the bug for me:
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index d963aa5c99e1a..0e52a8dbd593e 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -5752,11 +5752,17 @@ static int bpf_scx_reg(void *kdata, struct bpf_link *link)
>  
>  static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
>  {
> -	struct scx_sched *sch = scx_root;
> +	struct scx_sched *sch;
>  
>  	scx_disable(SCX_EXIT_UNREG);
> -	kthread_flush_work(&sch->disable_work);
> -	kobject_put(&sch->kobj);
> +
> +	rcu_read_lock();
> +	sch = rcu_dereference(scx_root);
> +	if (sch) {
> +		kthread_flush_work(&sch->disable_work);
> +		kobject_put(&sch->kobj);
> +	}
> +	rcu_read_unlock();
>  }

Oh I didn't expect that. As scx_root can only be written by the preceding
bpf_scx_reg(), I don't think we need rcu_read_lock() here as subtle as that
may be. I'll update the code.

Thanks.

-- 
tejun
