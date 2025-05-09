Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BC255E52
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746765872; cv=none; b=FqPZd5l8R8U6ekTw0l3S8VmiY8uJC8V+8+a1go6UZsRRdopB67PoViwkR7Po0cwqdrVsj93tgPinf/jDjO0q6nguLPhnkV0+c9saszCvJ4wmSoTlgolQorCvZLvkdVQcDEipfg7U/sXUTpPIfUrvdhYvgb5adEGvlaXwFuv7MT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746765872; c=relaxed/simple;
	bh=pelVH38dj7ZIeYj/VZ836U6fcV1p3jhMDgxAsqTWc88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QErpEx1LwrX9Ud79VOxYZjeu7HZMALXzYg3r4ohZaGF+x7OdUJ9nuYNyFJJowhJbKQnthHxThqd9Ii55qmYQCDAg/yIkjct3LgaEIOctzAaFJU/G09W2pxgQeR6ZgIVvrKhe2STj6ofdievKjKJOOYLGLyAe3iEyRNuymIoNuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PYwrdAcf; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PYwrdAcf"
Message-ID: <d98c6c9f-b50d-4818-848f-326f6ab01439@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746765867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPd7lKzq5WbN+WoGreayvyL3ieufndbd9I+2UEAzdKg=;
	b=PYwrdAcf8VMEQSBehZtii0ZbttCIlN7c/obum2QeIHfF+1eb8l9pkmV9W2raLV43yTIG60
	1O0h0JEAonsLWSRpCOvXwgMv2sj1aCe/ILlZsN8cv0a3wJzmA3Qq/hwKXFgNkfN2qEPV/S
	16ePPJjtvZD9KVFvhbf6oQKBBLvsuLo=
Date: Fri, 9 May 2025 12:44:14 +0800
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, llong@redhat.com, mhiramat@kernel.org,
 amaindex@outlook.com
References: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
 <20250507104322.30700-3-feng.tang@linux.alibaba.com>
 <6eb27fe4-9dad-4ea5-afd0-a5d1e3f60acb@linux.dev>
 <aBxE6jXwjIDRdr1z@U-2FWC9VHC-2323.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aBxE6jXwjIDRdr1z@U-2FWC9VHC-2323.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/8 13:45, Feng Tang wrote:
> Hi Lance,
> 
> Many thanks for the review!
> 
> On Thu, May 08, 2025 at 11:02:22AM +0800, Lance Yang wrote:
>> Hi Feng,
>>
>> Thanks for the patch series!
>>
>> On 2025/5/7 18:43, Feng Tang wrote:
>>> Kernel panic code utilizes sys_show_info() to dump needed system
>>> information to help debugging. Similarly, add this debug option for
>>> task hung case, and 'hungtask_print' is the knob to control what
>>> information should be printed out.
>>>
>>> Also clean up the code about dumping locks and triggering backtrace
>>> for all CPUs. One todo may be to merge this 'hungtask_print' with
>>> some sysctl knobs in hung_task.c.
>>>
>>> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
>>> ---
>>>    kernel/hung_task.c | 29 ++++++++++++++++-------------
>>>    1 file changed, 16 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
>>> index dc898ec93463..8229637be2c7 100644
>>> --- a/kernel/hung_task.c
>>> +++ b/kernel/hung_task.c
>>> @@ -58,12 +58,20 @@ static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
>>>    static int __read_mostly sysctl_hung_task_warnings = 10;
>>>    static int __read_mostly did_panic;
>>> -static bool hung_task_show_lock;
>>>    static bool hung_task_call_panic;
>>> -static bool hung_task_show_all_bt;
>>>    static struct task_struct *watchdog_task;
>>> +/*
>>> + * A bitmask to control what kinds of system info to be printed when a
>>> + * hung task is detected, it could be task, memory, lock etc. Refer panic.h
>>> + * for details of bit definition.
>>> + */
>>> +unsigned long hungtask_print;
>>> +core_param(hungtask_print, hungtask_print, ulong, 0644);
>>
>> how about lockup_debug_print_mask?

Oops, typo: hungtask_* (not lockup_*)

> 
> The 3/3 patch has a 'lockup_print' as it is for soft/hard lockup :).
> The name follows the existing 'panic_print', and indeed it's actually
> a bitmask, how about 'hung_print_mask'?

Yep, we should be following ’panic_print‘ pattern like 'hungtask_print',
but I‘d rather go with 'hungtask_print_mask' ;)

> 
>>
>> It could be useful for debugging, but there are a few concerns:
>>
>> 1) SYS_PRINT_* vs. hung_task_* priority conflict
>> - If SYS_PRINT_ALL_CPU_BT is set on the command line but
>> hung_task_all_cpu_backtrace is disabled, which one wins?
>> - Or should SYS_PRINT_ALL_CPU_BT force-enable hung_task_all_cpu_backtrace?
> 
> With this patch, the 'hungtask_print' and hung_task_all_cpu_backtrace
> will be ORed, so yes, if user sets SYS_PRINT_ALL_CPU_BT explicitly, the
> all-cpu-backtrace will be printed.
> 
> While the default value for hungtask_print is 0, and no system info will
> be dumped by default.
> 
> Long term wise, I'm not sure if sysctl_hung_task_all_cpu_backtracemay
> could be removed as its function can be covered by this print_mask knob.

Afraid we cannot remove that knob — it would break user-space. Note that
hungtask_print_mask should act as an extension (to provide more details
when investigating hangs), and it must still follow hung-task detector's
rules, IIUC.

Hmm... SYS_PRINT_ALL_CPU_BT is a bit tricky here. Maybe we can directly
enable hung_task_all_cpu_backtrace when SYS_PRINT_ALL_CPU_BT is set in
hungtask_print_mask, while still allowing manual disabling to dump
backtraces for all CPUs via hung_task_all_cpu_backtrace. This way, we
keep its original semantics ;)

> 
>> 2) Duplicate prints
>> With SYS_PRINT_BLOCKED_TASKS enabled, processes in D state will be printed
>> twice, right?
> 
> Good point. As sys_show_info() is a general API helper, the user may chose
> not to set SYS_PRINT_BLOCKED_TASKS when debugging task hung.
> 
> In one recent bug we debugged with this patch, when the first "task hung" was
> shown, there were already dozens of tasks were in D state, which just hadn't
> hit the 120 seconds limit yet, and dumping them all helped in that case.

Makes sense to me. Right, SYS_PRINT_BLOCKED_TASKS doesn’t duplicate 
prints, and
catches all D-state tasks - even the ones not yet timed out.

> 
>> Also, we really should document how those command-line parameters work ;)
> 
> Exactly! It currently just said 'refer panic.h' in code comment, maybe I
> should copy those definitions here as comments. How do you think?

Yes. Both comments and kernel-doc are needed ;)

Thanks,
Lance

> 
> Thanks,
> Feng
> 
>> Thansk,
>> Lance
>>
>>> +
>>> +static unsigned long cur_hungtask_print;
>>> +
>>>    #ifdef CONFIG_SMP
>>>    /*
>>>     * Should we dump all CPUs backtraces in a hung task event?
>>> @@ -163,11 +171,12 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>>>    	 */
>>>    	sysctl_hung_task_detect_count++;
>>> +	cur_hungtask_print = hungtask_print;
>>>    	trace_sched_process_hang(t);
>>>    	if (sysctl_hung_task_panic) {
>>>    		console_verbose();
>>> -		hung_task_show_lock = true;
>>> +		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
>>>    		hung_task_call_panic = true;
>>>    	}
>>> @@ -190,10 +199,10 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>>>    			" disables this message.\n");
>>>    		sched_show_task(t);
>>>    		debug_show_blocker(t);
>>> -		hung_task_show_lock = true;
>>> +		cur_hungtask_print |= SYS_PRINT_LOCK_INFO;
>>>    		if (sysctl_hung_task_all_cpu_backtrace)
>>> -			hung_task_show_all_bt = true;
>>> +			cur_hungtask_print |= SYS_PRINT_ALL_CPU_BT;
>>>    		if (!sysctl_hung_task_warnings)
>>>    			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
>>>    	}
>>> @@ -242,7 +251,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>>    	if (test_taint(TAINT_DIE) || did_panic)
>>>    		return;
>>> -	hung_task_show_lock = false;
>>> +	cur_hungtask_print = 0;
>>>    	rcu_read_lock();
>>>    	for_each_process_thread(g, t) {
>>>    		unsigned int state;
>>> @@ -266,14 +275,8 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>>    	}
>>>     unlock:
>>>    	rcu_read_unlock();
>>> -	if (hung_task_show_lock)
>>> -		debug_show_all_locks();
>>> -
>>> -	if (hung_task_show_all_bt) {
>>> -		hung_task_show_all_bt = false;
>>> -		trigger_all_cpu_backtrace();
>>> -	}
>>> +	sys_show_info(cur_hungtask_print);
>>>    	if (hung_task_call_panic)
>>>    		panic("hung_task: blocked tasks");
>>>    }

