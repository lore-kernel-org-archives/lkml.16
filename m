Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56615248867
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751304; cv=none; b=ph7UJzMxBGyDlOHC/65jmJ7QLToFetLJcftttKqTh1ybIq85GQMWTFweo6OO/bVhiYEzB6pRdtSgi7Fkh7jX1mIckJBTfrRKAMfqnJMIZZvdG+6vZp7XvbvXvMNqBvIbY3KotcqwmcarO461+1/mGWhrcs4BO7LyGCOVYJczZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751304; c=relaxed/simple;
	bh=8Qsh50lvRvt+cgISPa8hOMXFU79G9nm4ylBRlgAP3lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub9j8mX7yIvNNZTx/5H0mTEpttpHtnbeUI4pEBZ8PvfUgAatGKYatMFnP5Hs3da1C/zbMsT9Vb7vzgO2U5UYwyFj45xxHcYZdlHjEeqCu8WpzY86UHd9rZkUVEdTQAKFOao2UHr/ygGQKrSypMLr/65ZLwYu0tB3VoazsvswvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRIj/pfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRIj/pfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E3EC4CEEA;
	Tue, 20 May 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751303;
	bh=8Qsh50lvRvt+cgISPa8hOMXFU79G9nm4ylBRlgAP3lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRIj/pfZG1xJlPQBtlq3SNYUlnHmHaGjyH3rWZUEwUNWdP8dMCrLuDBUb46ZbaYlA
	 TIXX6LTVjyyFJQGEgwELyMhqIw3iu4nwrx0pYrOs6/H+ywW2b8+BcZjFpCKK5s4KIk
	 FA0pr9nrmCQXUX2QUlbeTMDrgkUm1Yl3sa/YPnvOu/KdZkwBh34AybZ02sA5bsKntv
	 gC/3A57MyXyjp4h09xRiOTQkEUXlEMJmWQH+zjttjRkesaf7Ch+JwiHfE1dkTNr0k8
	 sTTaZJCrAl+fjGywsIPKGLIaDJep4WFPg+PSJIb0Ef9rsdHPeKtNAfJHJkquMcoH31
	 xH7GoRF5qz+mA==
Date: Tue, 20 May 2025 16:28:20 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full
 don't leave any housekeeping
Message-ID: <aCyRhAeGwLSVf2LZ@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
 <20250508145319.97794-13-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508145319.97794-13-gmonaco@redhat.com>

(Please keep Anna-Maria Cc'ed)

Le Thu, May 08, 2025 at 04:53:25PM +0200, Gabriele Monaco a écrit :
> Currently the user can set up isolated cpus via cpuset and nohz_full in
> such a way that leaves no housekeeping CPU (i.e. no CPU that is neither
> domain isolated nor nohz full). This can be a problem for other
> subsystems (e.g. the timer wheel imgration).
> 
> Prevent this configuration by blocking any assignation that would cause
> the union of domain isolated cpus and nohz_full to covers all CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 67 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 95316d39c282..2f1df6f5b988 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -80,6 +80,12 @@ static cpumask_var_t	subpartitions_cpus;
>   */
>  static cpumask_var_t	isolated_cpus;
>  
> +/*
> + * Housekeeping CPUs for both HK_TYPE_DOMAIN and HK_TYPE_KERNEL_NOISE
> + */
> +static cpumask_var_t	full_hk_cpus;
> +static bool		have_boot_nohz_full;

Do you really need to maintain those copies?

> +
>  /*
>   * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
>   */
> @@ -1253,10 +1259,26 @@ static void reset_partition_data(struct cpuset *cs)
>  static void isolated_cpus_update(int old_prs, int new_prs, struct cpumask *xcpus)
>  {
>  	WARN_ON_ONCE(old_prs == new_prs);
> -	if (new_prs == PRS_ISOLATED)
> +	if (new_prs == PRS_ISOLATED) {
>  		cpumask_or(isolated_cpus, isolated_cpus, xcpus);
> -	else
> +		cpumask_andnot(full_hk_cpus, full_hk_cpus, xcpus);
> +	} else {
>  		cpumask_andnot(isolated_cpus, isolated_cpus, xcpus);
> +		cpumask_or(full_hk_cpus, full_hk_cpus, xcpus);
> +	}
> +}
> +
> +/*
> + * isolated_cpus_should_update - Returns if the isolated_cpus mask needs update
> + * @prs: new or old partition_root_state
> + * @parent: parent cpuset
> + * Return: true if isolated_cpus needs modification, false otherwise
> + */
> +static bool isolated_cpus_should_update(int prs, struct cpuset *parent)
> +{
> +	if (!parent)
> +		parent = &top_cpuset;
> +	return prs != parent->partition_root_state;
>  }
>  
>  /*
> @@ -1323,6 +1345,25 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
>  	return isolcpus_updated;
>  }
>  
> +/*
> + * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
> + * @new_cpus: cpu mask

The description lacks explanation about the role of this cpu mask.

> + * Return: true if there is conflict, false otherwise
> + *
> + * If nohz_full is enabled and we have isolated CPUs, their combination must
> + * still leave housekeeping CPUs.
> + */
> +static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
> +{
> +	if (!have_boot_nohz_full)
> +		return false;
> +
> +	if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
> +		return true;

Do we also need to make sure that in this weight there is an online CPU?

Can you allocate a temporary mask here and do:

cpumask_var_t full_hk_cpus;
int ret;

if (!zalloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
    return true;

cpumask_copy(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
cpumask_and(full_hk_cpus, cpu_online_mask));
if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
    ret = true;
else
    ret = false;

free_cpumask_var(full_hk_cpus);

I also realize something, what makes sure that we don't offline the last
non isolated?

I just did a small test:

# cd /sys/fs/cgroup/
# echo +cpuset > cgroup.subtree_control
# cat cpuset.cpus.effective 
0-7
# mkdir test
# cd test
# echo +cpuset > cgroup.subtree_control
# echo 0-6 > cpuset.cpus
# echo isolated > cpuset.cpus.partition
# cat ../cpuset.cpus.effective 
7
# echo 0 > /sys/devices/system/cpu/cpu7/online
[ 4590.864066] ------------[ cut here ]------------
[ 4590.866469] WARNING: CPU: 7 PID: 50 at kernel/cgroup/cpuset.c:1906 update_parent_effective_cpumask+0x770/0x8c0
[ 4590.870023] Modules linked in:
[ 4590.871058] CPU: 7 UID: 0 PID: 50 Comm: cpuhp/7 Not tainted 6.15.0-rc2-g996d9d202383 #10 PREEMPT(voluntary) 
[ 4590.873588] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[ 4590.875689] RIP: 0010:update_parent_effective_cpumask+0x770/0x8c0
[ 4590.876858] Code: 06 48 8b 0c 24 ba 05 00 00 00 48 23 85 f8 00 00 00 41 0f 95 c6 48 89 01 41 8b 84 24 34 01 00 00 45 0f b6 f6 e9 90 fe ff ff 90 <0f> 0b 90e
[ 4590.880010] RSP: 0018:ffffa4ce001ebd40 EFLAGS: 00010086
[ 4590.880963] RAX: 00000000ffffffff RBX: 0000000000000000 RCX: 0000000000000001
[ 4590.882342] RDX: 000000000000007f RSI: 0000000000000000 RDI: 0000000000000002
[ 4590.883683] RBP: ffffffffbdf52f00 R08: 0000000000000000 R09: 0000000000000000
[ 4590.885071] R10: ffffa223062d2388 R11: 0000000000000000 R12: ffffa223062d2200
[ 4590.886604] R13: 0000000000000002 R14: 0000000000000001 R15: 0000000000000004
[ 4590.888309] FS:  0000000000000000(0000) GS:ffffa223bc4d6000(0000) knlGS:0000000000000000
[ 4590.890183] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4590.891385] CR2: 000055ab80ada170 CR3: 00000001084ac000 CR4: 00000000000006f0
[ 4590.892901] DR0: ffffffffbc8c8420 DR1: 0000000000000000 DR2: 0000000000000000
[ 4590.894341] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
[ 4590.895765] Call Trace:
[ 4590.896400]  <TASK>
[ 4590.896938]  cpuset_update_active_cpus+0x680/0x730
[ 4590.897979]  ? kvm_sched_clock_read+0x11/0x20
[ 4590.898916]  ? sched_clock+0x10/0x30
[ 4590.899785]  sched_cpu_deactivate+0x148/0x170
[ 4590.900812]  ? __pfx_sched_cpu_deactivate+0x10/0x10
[ 4590.901925]  cpuhp_invoke_callback+0x10e/0x480
[ 4590.902920]  ? __pfx_smpboot_thread_fn+0x10/0x10
[ 4590.903928]  cpuhp_thread_fun+0xd7/0x160
[ 4590.904818]  smpboot_thread_fn+0xee/0x220
[ 4590.905716]  kthread+0xf6/0x1f0
[ 4590.906471]  ? __pfx_kthread+0x10/0x10
[ 4590.907297]  ret_from_fork+0x2f/0x50
[ 4590.908110]  ? __pfx_kthread+0x10/0x10
[ 4590.908917]  ret_from_fork_asm+0x1a/0x30
[ 4590.909833]  </TASK>
[ 4590.910465] ---[ end trace 0000000000000000 ]---
[ 4590.916786] smpboot: CPU 7 is now offline

Apparently you can't trigger the same with isolcpus=0-6, for some reason.

One last thing, nohz_full makes sure that we never offline the timekeeper
(see tick_nohz_cpu_down()). The timekeeper also never shuts down its tick
and therefore never go idle, from tmigr perspective, this way when a nohz_full
CPU shuts down its tick, it makes sure that its global timers are handled by
the timekeeper in last resort, because it's the last global migrator, always
alive.

But if the timekeeper is HK_TYPE_DOMAIN, or isolated by cpuset, it will go out
of the tmigr hierarchy, breaking the guarantee to have a live global migrator
for nohz_full.

That one is a bit more tricky to solve. The easiest is to forbid the timekeeper
from ever being made unavailable. It is also possible to migrate the timekeeping duty
to another common housekeeper.

We probably need to do the latter...

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
