Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AC22B8C5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751513025; cv=none; b=QxNLv9nT52ZmXHvgSVagr7DjEEu0lGjatZkhHe/TcwAXp67pGitlt7fX8nRaHUhyj+o+vGlxfA6OHKEAK/qBGWSyxRHXby1bftUQSQVbynKrGtA/GnL2qvi3FJQFcLGIHWTO1GKwBIh613wQPxFXXU9fjRHbPYXbuwdNNjwG5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751513025; c=relaxed/simple;
	bh=ZERNRpXu+O9L8hzxBmJsquggruQ2OePikz7yoCgMaRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0L66gsbl75RQolY23WNEn0ibMvhUtqqERRE+pSrSbAXJ8vRzEjNOQLscf2s4fyHryC9RNGxTIoGHNnrMj3c4/VJkbNzLO7u0i3N+QK1ApmT0TpalSpZUGdxVu1UEAc+ucTUB0VdDsolf+RCFz/pflT/eQXR7DVKWCPsFMczlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XqRlNRDi; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XqRlNRDi"
Message-ID: <5f4f048e-02ff-4669-b4b1-e411c6be536b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751513019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02Z56k5zvMHyfb242f86xyhwrkS4NA9iR003Aq/JcII=;
	b=XqRlNRDinGAVovYfLF3OPit+0XuQ9nfTEYK01MdmtohibmluJ0UcGwC+09A09/7mho5H+u
	LfZIKd29oZO3RSSGxXeONGCes6nZbQbeo2Wy9AKQVUhzk4ddVqtirrUcicgeFGVquo3SoE
	37IoBEaeQMTbeV1Mg26yStntpW9lc10=
Date: Thu, 3 Jul 2025 11:23:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/5] generalize panic_print's dump function to be used
 by other kernel parts
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
References: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Just hit a build failure with this patch series when building for arm64
with a minimal configuration:

kernel/panic.c: In function ‘setup_panic_sys_info’:
kernel/panic.c:151:23: error: implicit declaration of function 
‘sys_info_parse_param’ [-Wimplicit-function-declaration]
151 |         panic_print = sys_info_parse_param(buf);
|                       ^~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:287: kernel/panic.o] Error 1
make[2]: *** [scripts/Makefile.build:554: kernel] Error 2


To reproduce it:
$ make ARCH=arm64 allnoconfig
$ make ARCH=arm64 -j$(nproc)

Thanks,
Lance


On 2025/7/3 10:09, Feng Tang wrote:
> When working on kernel stability issues, panic, task-hung and
> software/hardware lockup are frequently met. And to debug them, user
> may need lots of system information at that time, like task call stacks,
> lock info, memory info etc.
> 
> panic case already has panic_print_sys_info() for this purpose, and has
> a 'panic_print' bitmask to control what kinds of information is needed,
> which is also helpful to debug other task-hung and lockup cases.
> 
> So this patchset extract the function out to a new file 'lib/sys_info.c',
> and make it available for other cases which also need to dump system info
> for debugging.
> 
> Also as suggested by Petr Mladek, add 'panic_sys_info=' interface to
> take human readable string like "tasks,mem,locks,timers,ftrace,....",
> and eventually obsolete the current 'panic_print' bitmap interface.
> 
> In RFC and V1 version, hung_task and SW/HW watchdog modules are enabled
> with the new sys_info dump interface. In v2, they are kept out for
> better review of current change, and will be posted later.
> 
> Locally these have been used in our bug chasing for stability issues
> and was proven helpful.
> 
> Many thanks to Petr Mladek for great suggestions on both the code and
> architectures!
> 
> - Feng
> 
> One to do left is about adding note for obsoleting 'panic_print' cmdline
> as discussed in https://lore.kernel.org/lkml/aFvBuOnD0cAEWJfl@U-2FWC9VHC-2323.local/
> and will be posted later.
> 
> Changelog:
> 
>    Since v2:
>       * Rename to PANIC_CONSOLE_REPLAY (Petr Mladek)
>       * Don't let kernel.h include sys_info.h (Petr Mladek)
>       * Improve documents and coding style (Petr Mladek/Lance Yang)
>       * Add 'panic_console_replay' parameter (Petr Mladek)
>       * Fix compiling problem (0Day bot)
>       * Add reviewed-by tag from Petr for patch 1/5
> 
>    Since V1:
>       * Separate the 'sys_show_info' related code to new file sys_info.[ch]
>         (Petr Mladek)
>       * Clean up the code for panic console replay (Petr Mladek)
>       * Add 'panic_sys_info=' cmdline and sysctl interface for taking
>         human readable parameters (Petr Mladek)
>       * Add note about the obsoleting of 'panic_print' (Petr Mladek)
>       * Hold the changes to hungtask/watchdog
> 
>    Since RFC:
>       * Don't print all cpu backtrace if 'sysctl_hung_task_all_cpu_backtracemay'
>         is 'false' (Lance Yang)
>       * Change the name of 2 new kernel control knob to have 'mask' inside, and
>         add kernel document and code comments for them (Lance Yang)
>       * Make the sys_show_info() support printk msg replay and all CPU backtrace.
> 
> Feng Tang (5):
>    panic: clean up code for console replay
>    panic: generalize panic_print's function to show sys info
>    panic: add 'panic_sys_info' sysctl to take human readable string
>      parameter
>    panic: add 'panic_sys_info=' setup option for kernel cmdline
>    panic: add note that panic_print sysctl interface is deprecated
> 
>   .../admin-guide/kernel-parameters.txt         |  21 ++-
>   Documentation/admin-guide/sysctl/kernel.rst   |  20 ++-
>   include/linux/sys_info.h                      |  27 ++++
>   kernel/panic.c                                |  71 +++++-----
>   lib/Makefile                                  |   2 +-
>   lib/sys_info.c                                | 122 ++++++++++++++++++
>   6 files changed, 221 insertions(+), 42 deletions(-)
>   create mode 100644 include/linux/sys_info.h
>   create mode 100644 lib/sys_info.c
> 

