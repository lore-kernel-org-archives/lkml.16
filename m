Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D52A1AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402784; cv=none; b=rHuMhiX/HJl7LPrj5ihLiJXK8f0mVBxb9dQBhwgY9cL9qfwQbRgskqJ7vyTuSIvgqcjvzigyi2J8bY4LSSw6WFYQIM0WW266gSFPaJPtAldy5rTBjHsSqJPNEzQY54aT/3e71bQZIb4YdXeFe9B2j7TbSoQSbKOcbs3WcG0QkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402784; c=relaxed/simple;
	bh=79PCKBKRp0CwDGfFCJ74eyyNnbgDY/+feymcdxAD/VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVJslqmI1he3Nzag+XXBQyjJn+qmbkcNuGplAeV7eDJq30AdZ4FD8MWhnN5XopvbPM3SAVHj1JDxI6ipe0HmyEAMzgdf5L3GNLjzGEGNZx+KUFcw1Tnv++WKRUoW5CZegiWIQE8r0FsrxCBKmOTAHArdsafC0M4tGAj40q+chFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WIBIYOOs; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WIBIYOOs"
Message-ID: <f07ac71f-da2a-45c7-8459-e3296e649391@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747402779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCq2w8JhXMnNVPlpwQulrw1FJv4lSu5R3EjdeUnPnHw=;
	b=WIBIYOOstK3VQOZonAw8xyYyrHZUDkON3jO56h3s7N8e8GRVl8RJGfTcl/iJ0Go0AN8g+0
	l6e+tlXgPHrU7ad0UCIVGo6smX/kvYTEOn+k33XUgHLGyu1/sMT4OAsNAaNDWGFwO8+1gH
	VDQ46ETgfxVih/sGEFhDjEL+b2DFXGg=
Date: Fri, 16 May 2025 21:39:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function to
 show sys info
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>, Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 mhiramat@kernel.org, llong@redhat.com, "Paul E. McKenney"
 <paulmck@kernel.org>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz> <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz> <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/16 13:38, Feng Tang wrote:
> On Thu, May 15, 2025 at 12:32:04PM +0200, Petr Mladek wrote:
>> On Tue 2025-05-13 21:23:25, Feng Tang wrote:
>>> Hi Petr,
>>>
>>> Thanks for the review!
>>>
>>> On Tue, May 13, 2025 at 11:57:19AM +0200, Petr Mladek wrote:
>>>> On Sun 2025-05-11 16:52:52, Feng Tang wrote:
>>>>> panic_print was introduced to help debugging kernel panic by dumping
>>>>> different kinds of system information like tasks' call stack, memory,
>>>>> ftrace buffer etc. Acutually this function could help debugging cases
>>>>> like task-hung, soft/hard lockup too, where user may need the snapshot
>>>>> of system info at that time.
>>>>>
>>>> The generic approach might deserve a separate source file,
>>>> for example:
>>>>
>>>>      include/linux/sys_info.h
>>>>      lib/sys_info.c
>>>
>>> Thanks for the suggestion! I'm really not good at naming.
>>>
>>> As panic.c is always built-in, I'll put sys_info.c as obj-y.
>>
>> Makes sense.
>>
>>>> Also I always considered the bitmask as a horrible user interface.
>>>> It might be used internally. But it would be better to allow a human
>>>> readable parameter, for example:
>>>>
>>>> 	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks
>>>
>>> Yes, it's convenient for developers, as a cmdline parameter being parsed
>>> at boot time.
>>>
>>> But I think bitmask may be easier for runtime changing as a core parameter
>>> under /proc/ or /sys/, or from sysctl interface. There are also some other
>>> modules use debug bitmask controlling printking info for different
>>> sub-components.
>>
>> Good to know. Could you please give me a pointer to some other modules
>> using the bitmask? I believe that they exist but I can't find any.
>> I wonder how common it is...
> 
> Definitely not common :) I only know one: ACPI, which has 2 debug knobs,
> 'debug_layer' is a bigmap to control which sub-component's msg to be
> dumped, and 'debug_level'.
> 
>> Anyway, I personally find words/names easier to use.
> 
> True. For me, I have some notes sticked on my monitor: one about characters
> for /proc/sysrq-trigger, one for panic_print, one for struct page's flag :)
> 
>> For example,
>> I like the following interfaces:
>>
>>    #> cat /sys/power/pm_test
>>    [none] core processors platform devices freezer
>>
>>    #> cat /sys/kernel/debug/tracing/available_tracers
>>    blk function_graph wakeup_dl wakeup_rt wakeup function nop
>>
>>    #> cat /proc/sys/kernel/seccomp/actions_avail
>>    kill_process kill_thread trap errno user_notif trace log allow
>>    # cat /proc/sys/kernel/seccomp/actions_logged
>>    kill_process kill_thread trap errno user_notif trace log
> 
> Thanks for the info, will check them.
> 
>>> And we have similar control knobs for hung, lockup etc.
>>>
>>> Or should I change the name from 'xxx_print_mask' to 'xxx_sysinfo_flag'
>>> in patch 2/3 ?
>>>
>>>>
>>>> The console reply might be handled by a separate:
>>>>
>>>> 	panic_console_reply=1
>>>>
>>>> And it would obsolete the existing "panic_print" which is an
>>>> ugly name and interface from my POV.
>>>
>>> Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
>>> also a sysctl interface, I'm afraid renaming it might break user ABI.
>>
>> A solution would be to keep it and create "panic_sys_info="
>> with the human readable parameters in parallel. They would
>> store the request in the same bitmap.
>>
>> We could print a message that "panic_print" has been obsoleted
>> by "panic_sys_info" when people use it.
>>
>> Both parameters would override the current bitmap. So the later
>> used parameter or procfs/sysfs write would win.
> 
> Reasonalbe.
> 
>> Note:
>>
>> One question is whether to use sysctl or module parameters.
>>
>> An advantage of sysctl is the "systcl" userspace tool. Some people
>> might like it. But the API is very old and a bit cumbersome for
>> implementing.
>>
>> The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
>> But the parameters are hidden in the /sys/... jungle ;-)
>>
>> I would slightly prefer "sysctl" because these parameters are easier
>> to find.
> 
> I will think about the string parsing in sys_info.c, and in the backend,
> a bitmap is still needed to save the parsing result, and as the parameter
> for sys_show_info().
> 
> Also if we go 'sysctl' way, in the future, some exising interface like
> 'sysctl_hung_task_all_cpu_backtrace' could be deprecated and integrated
> into the 'hung_task_sys_info'?

Works for me. Let's go with 'sysctl' approach, and 
'hung_task_all_cpu_backtrace'
could be deprecated, though it won't be removed anytime soon. IMHO,
'hung_task_sys_info' is more organized and easier to expand - plus these
parameters are much easier to find as Petr said ;)

Thanks,
Lance

> 
> Thanks,
> Feng
> 
>> Best Regards,
>> Petr

