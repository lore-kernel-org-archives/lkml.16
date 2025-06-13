Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED31805A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819943; cv=none; b=ulAjlJ7SLcHGWJghXBQUl3ueWZsFYDfmgB/L6C2aKswC8EiSWe34yzfzmUhI0eNhWdmOcluS8BKq2g6uZZOvdMAAQQvDWwcraYFNhBOKsmNEoK/gyWqU+46EgxgpUBZshYdGtbSVEZa9eCUC7nNwRRhp+JlFAleyktM3upwBqfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819943; c=relaxed/simple;
	bh=7A12bk7jsMxm/52dg5KP17529Hid5e7MmPojG1iRhFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU/UfoGSBaR40EhV05mM5ZgujcF1kLwLOCznwxi7141Lm9jstq36Bditziz15JmagIpJ250ME8Z91Zn0/e+v6HP2W1JorzLz5wCOKwa+HpIETcKlyEDX/zlN5x1z2a0SEHIJV890PDGwBtDcYXyOJR6gRmRWizG40xJgH4j+eHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQTY8ngB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQTY8ngB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8E0C4CEE3;
	Fri, 13 Jun 2025 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819943;
	bh=7A12bk7jsMxm/52dg5KP17529Hid5e7MmPojG1iRhFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQTY8ngBUUXuIw40vyFIIIsCfbtM6+MH4dz00S/xknS/hMqXv/IvGYqoqv84CIuZg
	 GmWB2T1KXl+CPYa46eKOZDMpZFJ6aoijykAquauP+z3gcdfOLTSW/ZxGTO0euVXjeL
	 c1AGewS33tRrfwmcoWcCM9XPlpA6HkthdAyvD7FNDRc7QhfxCukm95SEer89s/GwMZ
	 7gyB9D3JALrhDnXj7EUkWoCosalfTvqkqrFgz5m3+HieECTb1r0f59TqS8v6I4eZHe
	 +dtfdEERHnkLy32IxiHIen9KywHN8MDKu76QcsBPV5sORJAwJUVox8wIl7BWvxtTU7
	 35ZL5C47U86rA==
Date: Fri, 13 Jun 2025 15:05:40 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 1/3] Workqueue: add system_percpu_wq and system_dfl_wq
Message-ID: <aEwiJIG0TD7P7oYk@localhost.localdomain>
References: <20250612133335.788593-1-marco.crivellari@suse.com>
 <20250612133335.788593-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612133335.788593-2-marco.crivellari@suse.com>

Le Thu, Jun 12, 2025 at 03:33:33PM +0200, Marco Crivellari a écrit :
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistentcy cannot be addressed without refactoring the API.
> 
> system_wq is a per-CPU worqueue, yet nothing in its name tells about that
> CPU affinity constraint, which is very often not required by users. Make
> it clear by adding a system_percpu_wq.
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> Adding system_dfl_wq to encourage its use when unbound work should be used.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  include/linux/workqueue.h | 8 +++++---
>  kernel/workqueue.c        | 4 ++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index 6e30f275da77..502ec4a5e32c 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -427,7 +427,7 @@ enum wq_consts {
>  /*
>   * System-wide workqueues which are always present.
>   *
> - * system_wq is the one used by schedule[_delayed]_work[_on]().
> + * system_percpu_wq is the one used by schedule[_delayed]_work[_on]().
>   * Multi-CPU multi-threaded.  There are users which expect relatively
>   * short queue flush time.  Don't queue works which can run for too
>   * long.
> @@ -438,7 +438,7 @@ enum wq_consts {
>   * system_long_wq is similar to system_wq but may host long running
>   * works.  Queue flushing might take relatively long.
>   *
> - * system_unbound_wq is unbound workqueue.  Workers are not bound to
> + * system_dfl_wq is unbound workqueue.  Workers are not bound to
>   * any specific CPU, not concurrency managed, and all queued works are
>   * executed immediately as long as max_active limit is not reached and
>   * resources are available.
> @@ -455,10 +455,12 @@ enum wq_consts {
>   * system_bh[_highpri]_wq are convenience interface to softirq. BH work items
>   * are executed in the queueing CPU's BH context in the queueing order.
>   */
> -extern struct workqueue_struct *system_wq;
> +extern struct workqueue_struct *system_wq; /* use system_percpu_wq, this will be removed */
> +extern struct workqueue_struct *system_percpu_wq;
>  extern struct workqueue_struct *system_highpri_wq;
>  extern struct workqueue_struct *system_long_wq;
>  extern struct workqueue_struct *system_unbound_wq;
> +extern struct workqueue_struct *system_dfl_wq;
>  extern struct workqueue_struct *system_freezable_wq;
>  extern struct workqueue_struct *system_power_efficient_wq;
>  extern struct workqueue_struct *system_freezable_power_efficient_wq;
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 97f37b5bae66..7a3f53a9841e 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -505,12 +505,16 @@ static struct kthread_worker *pwq_release_worker __ro_after_init;
>  
>  struct workqueue_struct *system_wq __ro_after_init;
>  EXPORT_SYMBOL(system_wq);
> +struct workqueue_struct *system_percpu_wq __ro_after_init;
> +EXPORT_SYMBOL(system_percpu_wq);
>  struct workqueue_struct *system_highpri_wq __ro_after_init;
>  EXPORT_SYMBOL_GPL(system_highpri_wq);
>  struct workqueue_struct *system_long_wq __ro_after_init;
>  EXPORT_SYMBOL_GPL(system_long_wq);
>  struct workqueue_struct *system_unbound_wq __ro_after_init;
>  EXPORT_SYMBOL_GPL(system_unbound_wq);
> +struct workqueue_struct *system_dfl_wq __ro_after_init;
> +EXPORT_SYMBOL_GPL(system_dfl_wq);
>  struct workqueue_struct *system_freezable_wq __ro_after_init;
>  EXPORT_SYMBOL_GPL(system_freezable_wq);
>  struct workqueue_struct *system_power_efficient_wq __ro_after_init;

Shouldn't you allocate system_percpu_wq and system_dfl_wq in
workqueue_init_early() ?

And yes I think we should allocate them and not make them a pointer to
system_wq and system_unbound_wq, this way you can more easily
warn deprecated uses of system_wq and system_unbound_wq in the future
after upcoming merge windows.

Thanks.

> -- 
> 2.49.0
> 

-- 
Frederic Weisbecker
SUSE Labs
