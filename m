Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50894B1E5E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673352; cv=none; b=DgX/cEOoSJKrDAt8uoeL3DtsqSMSiZ+0IzeZSfl9ONvOmTGNb03GA/KF4E3N8+gdvVADvvzDhUHG50MqMgfwOhG2PT3XrUpqWiRpuCDbhKkAibXxj5mFU0CyHYEGPYoyF8BwvP2NpWS9HbKZYl4nV+37arN9ytOzrfuv3xTyxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673352; c=relaxed/simple;
	bh=w5BERNMTmQmbkO7p5AxG7tR5aNdQ2mlSCWPFGr8DzZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=LOZTmwobiZPmRRoHH/i8iYbpFjRO1Xtgzmj2sQqi+a0nbfX/PsHZOUeKpVW7tFE5jr1ppIe2+vck/1TK/0fQcVKhRlJ+w0O0dUQZSHsC6gV8rNA7/NsSMnNnCqUVm2VWBKHtkPcfWBqcj9eSsujlCSb39qo73y/kvcqTBHg4Fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IcRbCCw2; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IcRbCCw2"
Message-ID: <6eb27fe4-9dad-4ea5-afd0-a5d1e3f60acb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746673347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnwtDdbXkv7ywwoyp6XSXq29PJSBA4fmJE0lToHIVjU=;
	b=IcRbCCw2S6npM2W3zEPzX+wAETzE4GxNoUKPuytg15Y2aopKHZA87Fp3Myy1VSJeQk37a+
	/2fZjSVnPPhNpONCJURZrO5eawlvmB1S9WBbjx+aRlIKR6FxF/UR7yAblZhBD6ZozGXW3l
	gIffslgcXe+IuO0TBxUO7QhxaYPZkdE=
Date: Thu, 8 May 2025 11:02:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 2/3] kernel/hung_task: add option to dump system info
 when hung task detected
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>
References: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
 <20250507104322.30700-3-feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250507104322.30700-3-feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Feng,

Thanks for the patch series!

On 2025/5/7 18:43, Feng Tang wrote:
> Kernel panic code utilizes sys_show_info() to dump needed system
> information to help debugging. Similarly, add this debug option for
> task hung case, and 'hungtask_print' is the knob to control what
> information should be printed out.
> 
> Also clean up the code about dumping locks and triggering backtrace
> for all CPUs. One todo may be to merge this 'hungtask_print' with
> some sysctl knobs in hung_task.c.
> 
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>   kernel/hung_task.c | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index dc898ec93463..8229637be2c7 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -58,12 +58,20 @@ static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
>   static int __read_mostly sysctl_hung_task_warnings = 10;
>   
>   static int __read_mostly did_panic;
> -static bool hung_task_show_lock;
>   static bool hung_task_call_panic;
> -static bool hung_task_show_all_bt;
>   
>   static struct task_struct *watchdog_task;
>   
> +/*
> + * A bitmask to control what kinds of system info to be printed when a
> + * hung task is detected, it could be task, memory, lock etc. Refer panic.h
> + * for details of bit definition.
> + */
> +unsigned long hungtask_print;
> +core_param(hungtask_print, hungtask_print, ulong, 0644);

how about lockup_debug_print_mask?

It could be useful for debugging, but there are a few concerns:

1) SYS_PRINT_* vs. hung_task_* priority conflict
- If SYS_PRINT_ALL_CPU_BT is set on the command line but
hung_task_all_cpu_backtrace is disabled, which one wins?
- Or should SYS_PRINT_ALL_CPU_BT force-enable hung_task_all_cpu_backtrace?

2) Duplicate prints
With SYS_PRINT_BLOCKED_TASKS enabled, processes in D state will be printed
twice, right?

Also, we really should document how those command-line parameters work ;)

Thansk,
Lance

> +
> +static unsigned long cur_hungtask_print;
> +
>   #ifdef CONFIG_SMP
>   /*
>    * Should we dump all CPUs backtraces in a hung task event?
> @@ -163,11 +171,12 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>   	 */
>   	sysctl_hung_task_detect_count++;
>   
> +	cur_hungtask_print = hungtask_print;
>   	trace_sched_process_hang(t);
>   
>   	if (sysctl_hung_task_panic) {
>   		console_verbose();
> -		hung_task_show_lock = true;
> +		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
>   		hung_task_call_panic = true;
>   	}
>   
> @@ -190,10 +199,10 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>   			" disables this message.\n");
>   		sched_show_task(t);
>   		debug_show_blocker(t);
> -		hung_task_show_lock = true;
> +		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
>   
>   		if (sysctl_hung_task_all_cpu_backtrace)
> -			hung_task_show_all_bt = true;
> +			cur_hungtask_print |= SYS_PRINT_ALL_CPU_BT;
>   		if (!sysctl_hung_task_warnings)
>   			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
>   	}
> @@ -242,7 +251,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>   	if (test_taint(TAINT_DIE) || did_panic)
>   		return;
>   
> -	hung_task_show_lock = false;
> +	cur_hungtask_print = 0;
>   	rcu_read_lock();
>   	for_each_process_thread(g, t) {
>   		unsigned int state;
> @@ -266,14 +275,8 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>   	}
>    unlock:
>   	rcu_read_unlock();
> -	if (hung_task_show_lock)
> -		debug_show_all_locks();
> -
> -	if (hung_task_show_all_bt) {
> -		hung_task_show_all_bt = false;
> -		trigger_all_cpu_backtrace();
> -	}
>   
> +	sys_show_info(cur_hungtask_print);
>   	if (hung_task_call_panic)
>   		panic("hung_task: blocked tasks");
>   }

