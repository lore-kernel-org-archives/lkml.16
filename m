Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74187293B60
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432885; cv=none; b=ocapPdb0INUbbXOFPgBVPXT3BMqqxBdEaxw+EXSwvXt4TydN9Y/crytCC8dH306XmQgHLZdzkGdCanGkUsAl0xz8sv6Yl2BLHRHUbLHdlZyc6zD7gF3lc/eoffq/PUTOPD48JeuY5P/2CjxrvCRibAEwhBsVhNUkVFHZbg3PV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432885; c=relaxed/simple;
	bh=NGKXyrXmAnq5h+4sZm+y6JHpIBFbUFI55nclZfYHOrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVw2snoYm9FVdbs13+vtS8txYnTFBuBMEFlaWaiYpZvuXBWZtbksLBHleAq9im9L+ZMhu/mV8D7iRNVmoM25fj+VHD+6j2vpcVN8HkfNrZusMTiDq94dXbP/rG+3GVV2MLdWqNdTOdlM2i8OgY/Yx4ralwpgC/QYTzC9tWpqCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LRHoobpR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LRHoobpR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a52874d593so1917633f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750432882; x=1751037682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sta3fUxiHRUCaiiX4FExFhgEUaAbU4c5kBRSH9xSC7c=;
        b=LRHoobpR2ObG3QueTYpttfkKkBi4H+ch5J91eDsA/vrYmD43tmztE2upkEsGij72un
         dprhUtZUjHJ12oMKE92Pv0JRLboBA4QSaxEczyEpDOfPSr88tS+SRGk7LXCRLI1MocnT
         MPCc9lgBXviIF+CI1wQp6FCJqE8BFmxZCi+bLK1x1xqBry0aOwwZSylY68wnOBoIxvQB
         B+3OPLdUIj8A1jTLHyvy8wKPCB5tGVQXPNGh0lccbpc9azUM4YLiU9tqnVPRJjoJm2nv
         GVPKsaZRrjaKAGzOeIJAo5MP/YZ4Sc9TtGNn4KVqQccDhbvV22d4zb+WpwTMxHyCobAV
         Egjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432882; x=1751037682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sta3fUxiHRUCaiiX4FExFhgEUaAbU4c5kBRSH9xSC7c=;
        b=KlsBfuYPXI1hZZ1M+rIoaqZHntQ10CsLOnws91U7/NaiC62/aH5ZomziTfj9m2q9m4
         sr8p4tEDmwt55qzbsQYiX1OTwKhMzXihRd6nWnAb198MPJFzdGguba8CHoc6DaIBX0+4
         F0EIGx+TyJrlvN+oo/s8tCfivRIs++KmJ7YrzONd7jQ4H++fZ98fmfwKNO5Y415hU8yD
         ng2apoa031zJmOIyYvw2A9c84MKpWuvjQwCKzTGKv5Vk/AoYWEETQCGcJv+1dh3oOjEI
         Go7XmZ+yO7cd/C6fgxUye6B2oTfVNEKVlzGWFmrlia4ETxPrzbkZILBK9QlvGW2VLw3t
         gQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXaeQkIJZqoVepbUD5gKmVWmtJN4lIaF4WJN0xL7ank2uV/RNP0MpL8Yyg5/9pXw5Gk9rVPIG2vLOCzzvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNi5gRT8DZ46ItpTDCKU1pdQT+5KeKrWixDpTO54BJEauaqums
	nVjNeknqvafMgEWxxu5fVewkZQJV9mtQcXxSV37Q1F2ByQlzr4UNlO1s5m/JhmsyW5Q=
X-Gm-Gg: ASbGnct1bIUVMX+KKwOHZIooUu5jh1hsAYrlquX5q1O0eVuNtG/lKgxkYb8C+4g95fy
	lwfz9WUzwHwodc/RdMIMfa8mqjciVdNOi55ZxS2iIhlXsh99bX/ilPTgcriuv58iv2yInlp3NLO
	yP0jWce+jDFQEcrEq7bOk1pC5x3RjI2nAVfackY5guhZYREgvhcYeOwJXiAkZPKJw6rBjEAXdrF
	ulORABTFV4EfqVDmZwfBCqP2zxEnkcyuPIay2HKGCHZuT2zGkbRIbRMchrCdQkIA1s9SRW3dv0N
	/OTxnXvEPAAkZ2psdwz9+dN6CC5Pj2Q2mTdTr4FMaj0gx8OyGXzM3ss+UWTqm0bBzYrDXOtbsAI
	=
X-Google-Smtp-Source: AGHT+IFR6donxKQAMnJkpy9OKo7simJAQ+vJa9rAZUeMB69UizOZEXYUaOuaRvzbch22Wuvot6sCEg==
X-Received: by 2002:a05:6000:41d2:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a6d12c4551mr2668478f8f.1.1750432881506;
        Fri, 20 Jun 2025 08:21:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e0488b7sm2105137a91.25.2025.06.20.08.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:21:20 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:21:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 2/5] panic: generalize panic_print's function to show
 sys info
Message-ID: <aFV8ZFZ0Qy715hdR@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-3-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-3-feng.tang@linux.alibaba.com>

On Mon 2025-06-16 09:08:37, Feng Tang wrote:
> 'panic_print' was introduced to help debugging kernel panic by dumping
> different kinds of system information like tasks' call stack, memory,
> ftrace buffer, etc. Acutually this function could also help debugging
> cases like task-hung, soft/hard lockup, and other cases , where user
> may need the snapshot of system info at that time.
> 
> Extract sys_show_info() function out of panic code to be used by other
> kernel parts for debugging.
> 
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -27,6 +27,7 @@
>  #include <linux/math.h>
>  #include <linux/minmax.h>
>  #include <linux/typecheck.h>
> +#include <linux/sys_info.h>

There will be only few users of this API. There is no need to
include it via this generic header which is included almost
everywhere.

Some people are working hard on getting rid of this header file,
see the comment at the beginning:

 * This header has combined a lot of unrelated to each other stuff.
 * The process of splitting its content is in progress while keeping
 * backward compatibility. That's why it's highly recommended NOT to
 * include this header inside another header file, especially under
 * generic or architectural include/ directory.

Instead, please include the new linux/sys_info.h in panic.c directly.

>  #include <linux/panic.h>
>  #include <linux/printk.h>
>  #include <linux/build_bug.h>

> --- /dev/null
> +++ b/include/linux/sys_info.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_SYS_INFO_H
> +#define _LINUX_SYS_INFO_H
> +
> +/*
> + * SYS_SHOW_ALL_PRINTK_MSG is for panic case only, as it needs special
> + * handling which only fits panic case.

This flags is really special. I would even rename it to match
the function where it is used:

#define PANIC_CONSOLE_REPLAY		0x00000020

And it would be better to do the rename (ALL_PRINTK_MSG ->
CONSOLE_REPLAY) already in the 1st patch where panic_console_replay()
was introduced.

Also it would make sense to update the documentation (in 1st patch),
something like:

--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4533,7 +4533,7 @@
 			bit 2: print timer info
 			bit 3: print locks info if CONFIG_LOCKDEP is on
 			bit 4: print ftrace buffer
-			bit 5: print all printk messages in buffer
+			bit 5: replay all messages on consoles at the end of panic
 			bit 6: print all CPUs backtrace (if available in the arch)
 			bit 7: print only tasks in uninterruptible (blocked) state
 			*Be aware* that this option may print a _lot_ of lines,

> + */
> +#define SYS_SHOW_TASK_INFO		0x00000001
> +#define SYS_SHOW_MEM_INFO		0x00000002
> +#define SYS_SHOW_TIMER_INFO		0x00000004
> +#define SYS_SHOW_LOCK_INFO		0x00000008
> +#define SYS_SHOW_FTRACE_INFO		0x00000010
> +#define SYS_SHOW_ALL_PRINTK_MSG		0x00000020
> +#define SYS_SHOW_ALL_CPU_BT		0x00000040
> +#define SYS_SHOW_BLOCKED_TASKS		0x00000080
> +
> +extern void sys_show_info(unsigned long info_mask);

Please, do not use "extern" in new header files. This is from
Documentation/process/coding-style.rst:

    Do not use the ``extern`` keyword with function declarations as this makes
    lines longer and isn't strictly necessary.

Also the header file is named "sys_info" but the API is "sys_show_*info".
It would be more user friendly to consistently use the same prefix
for the entire API, for example:

#define SYS_INFO_TASK		0x00000001
#define SYS_INFO_MEM		0x00000002
#define SYS_INFO_TIMER		0x00000004

void sys_info(unsigned long si_mask);

I am sorry that I did not tell your this in the RFC.
I focused on the bigger picture at that time.

> +#endif	/* _LINUX_SYS_INFO_H */

Best Regards,
Petr
