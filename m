Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C829B761
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308510; cv=none; b=S76JArvVm2gXzbvFKMgfB2xDtS2TsQraHFu2V9wOWDG0SmwiozrumbFJ8Szv5ZkEHQSQZhQV4b+6U/yz1+4uyE9nJyNoFewHX7I3FnWv28cgddv6Mqj2iJOVfOJ2+5zVrQZK1z5O7nFbRMqK73mGjk0D8in+siSxzeiGW4qRHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308510; c=relaxed/simple;
	bh=vyISrui2M6C0PtrpOaIBLkYSxe/KnCLrimbTVgfNxas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aty3f7HF/2LIro/CTUG0rh+dpmaU4f9fBoFLNDoM+q8vmz3CzacwEnilhrC+DFw5MUr+VO9uCQx52hM+W9omjUSvF+AkGv6S00UVQc3A5npGAh8aTbYReYLQTVOhSHzi3/1VfyS8rKM0IkN3gZHaJvvf+bZ8ykfZ8xLm+fG8rBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tKgGlY6w; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tKgGlY6w"
Message-ID: <0d13387b-15e5-4f6e-bb13-6c61f9db7ccb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747308505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sm57+wiODWt/zc+HdIkHxaoodPX34wDQPorGp+XfMfo=;
	b=tKgGlY6wRJ9KS65ZgUA23NZtqEPRvV+JrpR0WZgVj99HoZ3EZlpN4B2npHBxuvfNRTUkM4
	DHSImvWKU63g/OfqLIUwv7LdEs53FXH0XdnDlvb0MMQl8rdsA6KmABrtlPggU78xqGYDit
	7o//nuQBh8H8WcrG0O8AFxZADDJEg8M=
Date: Thu, 15 May 2025 19:28:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function to
 show sys info
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 mhiramat@kernel.org, llong@redhat.com
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz> <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/15 18:32, Petr Mladek wrote:
> On Tue 2025-05-13 21:23:25, Feng Tang wrote:
>> Hi Petr,
>>
>> Thanks for the review!
>>
>> On Tue, May 13, 2025 at 11:57:19AM +0200, Petr Mladek wrote:
>>> On Sun 2025-05-11 16:52:52, Feng Tang wrote:
>>>> panic_print was introduced to help debugging kernel panic by dumping
>>>> different kinds of system information like tasks' call stack, memory,
>>>> ftrace buffer etc. Acutually this function could help debugging cases
>>>> like task-hung, soft/hard lockup too, where user may need the snapshot
>>>> of system info at that time.
>>>>
>>> The generic approach might deserve a separate source file,
>>> for example:
>>>
>>>      include/linux/sys_info.h
>>>      lib/sys_info.c
>>
>> Thanks for the suggestion! I'm really not good at naming.
>>
>> As panic.c is always built-in, I'll put sys_info.c as obj-y.
> 
> Makes sense.
> 
>>> Also I always considered the bitmask as a horrible user interface.
>>> It might be used internally. But it would be better to allow a human
>>> readable parameter, for example:
>>>
>>> 	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks
>>
>> Yes, it's convenient for developers, as a cmdline parameter being parsed
>> at boot time.
>>
>> But I think bitmask may be easier for runtime changing as a core parameter
>> under /proc/ or /sys/, or from sysctl interface. There are also some other
>> modules use debug bitmask controlling printking info for different
>> sub-components.
> 
> Good to know. Could you please give me a pointer to some other modules
> using the bitmask? I believe that they exist but I can't find any.
> I wonder how common it is...
> 
> Anyway, I personally find words/names easier to use. For example,
> I like the following interfaces:
> 
>    #> cat /sys/power/pm_test
>    [none] core processors platform devices freezer
> 
>    #> cat /sys/kernel/debug/tracing/available_tracers
>    blk function_graph wakeup_dl wakeup_rt wakeup function nop
> 
>    #> cat /proc/sys/kernel/seccomp/actions_avail
>    kill_process kill_thread trap errno user_notif trace log allow
>    # cat /proc/sys/kernel/seccomp/actions_logged
>    kill_process kill_thread trap errno user_notif trace log

Clean and straightforward! I prefer this too ;p

> 
>> And we have similar control knobs for hung, lockup etc.
>>
>> Or should I change the name from 'xxx_print_mask' to 'xxx_sysinfo_flag'
>> in patch 2/3 ?
>>
>>>
>>> The console reply might be handled by a separate:
>>>
>>> 	panic_console_reply=1
>>>
>>> And it would obsolete the existing "panic_print" which is an
>>> ugly name and interface from my POV.
>>
>> Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
>> also a sysctl interface, I'm afraid renaming it might break user ABI.
> 
> A solution would be to keep it and create "panic_sys_info="
> with the human readable parameters in parallel. They would
> store the request in the same bitmap.

Nice! Seems like a well-balanced solution ;)

> 
> We could print a message that "panic_print" has been obsoleted
> by "panic_sys_info" when people use it.

Indeed, we should add a deprecation warning. Perhaps the message could say:

"'panic_print=' is deprecated and will be removed. Use 'panic_sys_info=' 
instead."

e.g. pr_warn_ratelimited("block device autoloading is deprecated and will be
removed.\n") in blkdev_get_no_open().

> 
> Both parameters would override the current bitmap. So the later
> used parameter or procfs/sysfs write would win.

Makes sense to me. BTW, this override behavior needs to be documented
in kernel-doc.

> 
> Note:
> 
> One question is whether to use sysctl or module parameters.
> 
> An advantage of sysctl is the "systcl" userspace tool. Some people
> might like it. But the API is very old and a bit cumbersome for
> implementing.
> 
> The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
> But the parameters are hidden in the /sys/... jungle ;-)
> 
> I would slightly prefer "sysctl" because these parameters are easier
> to find.

+1 for sysctl.

Thanks,
Lance

> 
> Best Regards,
> Petr

