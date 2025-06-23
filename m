Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8F728A726;
	Mon, 23 Jun 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691688; cv=none; b=lnbBim8ay6CSvKUbUspG9S0xvspte9Ebo2sk+ErXGEzQrI7TxJviI0+1FPyt4IKUrzvMXyrey/KccQdo7WnHxUL3X1+6Xvu7pl/1Be3zv7+OaYEkhP0ijRZkx+c2dfKpyprXI9bjVnWfKr2WQqAHbJ/+DhPxpytxpdyUHkVqmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691688; c=relaxed/simple;
	bh=E9Fv6toRxKhDNaubeqQOetAlmqCsc7p7O2VyjX35bVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN2KK1LAqVLfTh1fKT/b+r67GFE2nc/atPxqmJvD0j1KneaGkHf94jps2bufEY39SyNCcyGyESqIDxGezcaKRwm/Xsrptm4YVcE9SGsav4TqbdUoE9OA7Gcdcn9wyMeFhvqIY0S5gw2L/s0f80LTE17m4tQjTi/kOVdJ8jYjnwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C832113E;
	Mon, 23 Jun 2025 08:14:27 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7973F58B;
	Mon, 23 Jun 2025 08:14:43 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:14:33 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Su Hui <suhui@nfschina.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, james.morse@arm.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/resctrl: using guard to simplify lock/unlock code
Message-ID: <aFlvTt+GGSIqgOKH@e133380.arm.com>
References: <20250623112540.3581675-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623112540.3581675-1-suhui@nfschina.com>

Hi,

On Mon, Jun 23, 2025 at 07:25:41PM +0800, Su Hui wrote:
> Using guard() to replace *unlock* label. guard() is better than goto
> unlock patterns and is more concise. No functional changes.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

How were these cases chosen?

I notice that this patch only handles some straightforward mutex_unlock()
cases.  There are other opportunities in some places -- particularly
alloc/free patterns.


Overall, I'm not totally convinced that backporting the guard()
infrastructure into code that wasn't originally written to use it is
always worthwhile.

If the code is simple, there is not much benefit.  Otherwise, there is
a significant chance of unintentionally changing the behaviour of the
code (though the exercise may be useful if it identifies actual bugs).

Either way, such changes will get in the way of people who are rebasing
on top of this code.

[continues below ...]

> ---
>  fs/resctrl/monitor.c  | 25 ++++++++-----------------
>  fs/resctrl/rdtgroup.c | 29 +++++++++--------------------
>  2 files changed, 17 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index f5637855c3ac..12e999eb7ed8 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -769,10 +769,10 @@ static int dom_data_init(struct rdt_resource *r)
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>  	u32 num_closid = resctrl_arch_get_num_closid(r);
>  	struct rmid_entry *entry = NULL;
> -	int err = 0, i;
> +	int i;
>  	u32 idx;
>  
> -	mutex_lock(&rdtgroup_mutex);
> +	guard(mutex)(&rdtgroup_mutex);
>  	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
>  		u32 *tmp;
>  
> @@ -783,10 +783,8 @@ static int dom_data_init(struct rdt_resource *r)
>  		 * use.
>  		 */
>  		tmp = kcalloc(num_closid, sizeof(*tmp), GFP_KERNEL);
> -		if (!tmp) {
> -			err = -ENOMEM;
> -			goto out_unlock;
> -		}
> +		if (!tmp)
> +			return -ENOMEM;
>  
>  		closid_num_dirty_rmid = tmp;
>  	}
> @@ -797,8 +795,7 @@ static int dom_data_init(struct rdt_resource *r)
>  			kfree(closid_num_dirty_rmid);
>  			closid_num_dirty_rmid = NULL;
>  		}
> -		err = -ENOMEM;
> -		goto out_unlock;
> +		return -ENOMEM;
>  	}
>  
>  	for (i = 0; i < idx_limit; i++) {
> @@ -819,18 +816,15 @@ static int dom_data_init(struct rdt_resource *r)
>  	entry = __rmid_entry(idx);
>  	list_del(&entry->list);
>  
> -out_unlock:
> -	mutex_unlock(&rdtgroup_mutex);
> -
> -	return err;
> +	return 0;
>  }
>  
>  static void dom_data_exit(struct rdt_resource *r)
>  {
> -	mutex_lock(&rdtgroup_mutex);
> +	guard(mutex)(&rdtgroup_mutex);
>  
>  	if (!r->mon_capable)
> -		goto out_unlock;
> +		return;
>  
>  	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
>  		kfree(closid_num_dirty_rmid);
> @@ -839,9 +833,6 @@ static void dom_data_exit(struct rdt_resource *r)
>  
>  	kfree(rmid_ptrs);
>  	rmid_ptrs = NULL;
> -
> -out_unlock:
> -	mutex_unlock(&rdtgroup_mutex);
>  }
>  
>  static struct mon_evt llc_occupancy_event = {
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 77d08229d855..73bc1ab05b5e 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -916,14 +916,13 @@ int proc_resctrl_show(struct seq_file *s, struct pid_namespace *ns,
>  		      struct pid *pid, struct task_struct *tsk)
>  {
>  	struct rdtgroup *rdtg;
> -	int ret = 0;
>  
> -	mutex_lock(&rdtgroup_mutex);
> +	guard(mutex)(&rdtgroup_mutex);
>  
>  	/* Return empty if resctrl has not been mounted. */
>  	if (!resctrl_mounted) {
>  		seq_puts(s, "res:\nmon:\n");
> -		goto unlock;
> +		return 0;
>  	}
>  
>  	list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> @@ -952,17 +951,13 @@ int proc_resctrl_show(struct seq_file *s, struct pid_namespace *ns,
>  			break;
>  		}
>  		seq_putc(s, '\n');
> -		goto unlock;
> +		return 0;
>  	}
>  	/*
>  	 * The above search should succeed. Otherwise return
>  	 * with an error.
>  	 */
> -	ret = -ENOENT;
> -unlock:
> -	mutex_unlock(&rdtgroup_mutex);
> -
> -	return ret;
> +	return -ENOENT;
>  }
>  #endif
>  
> @@ -4132,11 +4127,11 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d)
>  {
>  	int err;
>  
> -	mutex_lock(&rdtgroup_mutex);
> +	guard(mutex)(&rdtgroup_mutex);
>  
>  	err = domain_setup_mon_state(r, d);
>  	if (err)
> -		goto out_unlock;
> +		return err;
>  
>  	if (resctrl_is_mbm_enabled()) {
>  		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
> @@ -4156,10 +4151,7 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d)
>  	if (resctrl_mounted && resctrl_arch_mon_capable())
>  		mkdir_mondata_subdir_allrdtgrp(r, d);
>  
> -out_unlock:
> -	mutex_unlock(&rdtgroup_mutex);
> -
> -	return err;
> +	return 0;
>  }
>  
>  void resctrl_online_cpu(unsigned int cpu)
> @@ -4202,7 +4194,7 @@ void resctrl_offline_cpu(unsigned int cpu)
>  	struct rdt_mon_domain *d;
>  	struct rdtgroup *rdtgrp;
>  
> -	mutex_lock(&rdtgroup_mutex);
> +	guard(mutex)(&rdtgroup_mutex);
>  	list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
>  		if (cpumask_test_and_clear_cpu(cpu, &rdtgrp->cpu_mask)) {
>  			clear_childcpus(rdtgrp, cpu);
> @@ -4211,7 +4203,7 @@ void resctrl_offline_cpu(unsigned int cpu)
>  	}
>  
>  	if (!l3->mon_capable)
> -		goto out_unlock;
> +		return;
>  
>  	d = get_mon_domain_from_cpu(cpu, l3);
>  	if (d) {
> @@ -4225,9 +4217,6 @@ void resctrl_offline_cpu(unsigned int cpu)
>  			cqm_setup_limbo_handler(d, 0, cpu);
>  		}
>  	}
> -
> -out_unlock:
> -	mutex_unlock(&rdtgroup_mutex);
>  }

[...]

FWIW, this patch looks OK though, and the diffstat looks reasonable.
Since this code was recently moved into fs/, diff context noise may be
less of a concern.

Cheers
---Dave
