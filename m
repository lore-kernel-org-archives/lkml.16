Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8EA21CC6A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305131; cv=none; b=Wt65Yf9gAyxx3pNJzNyHrtzJJTSxt6LVYz9iD/S99vqkVSL5o2VIxyNeRjpJctzPCVcxSOqXnAXqbAghEvt4ceqoR/CV6ZeYhiYswUJSMU5CHJjiWROLSJuhNTcbjabiK4ke7eUXdo9NxqLPVzv1El+LpDOpi8EZQ2p0rlt6ANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305131; c=relaxed/simple;
	bh=wyWdFd9Z9rstoDlZvu6GLc2ncqzEfnzOj8aOiGBASPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGK4e3UP7EffNzZ9XtT2BZ/loiV7wSmd+MSTyQdq4RPKuqpZzOv8bTxqTh44hAv1j/8mTg+VJzUenQ64f3Cq+R7t8fG3rGfYZBVf3K+x1DQOHUGRvGWwsj71ilbAghFt5H9J8hKJWrRag+9xtM19Ikw7eGLwvSj4ihXMRzLQiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YQpSaTj2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YQpSaTj2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso1013449a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747305128; x=1747909928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhLhHaajX2vPN/8dLCnaHW6k5nqgCvHP4L9k/9wkMNs=;
        b=YQpSaTj2bg6sM4dTEoVXRZKIVsUlE2xtS34TM4ctWrwiNkh9TMMp7mMrW9JB1OXB+B
         766bauVU2VqJiub44uP2kk8Vm1/t2X+pUVbCd8/yUwBeSqatJVmHSv1iJCqUIIQtcGGb
         IVA4qBTlCm/Gf1k/rzkiFGvc7YAlc/1b24dcp5xSqLQ3Nv6bPuwztgFLR7m9nGbdekqx
         1YjERQ4B05qoK7RoktNODLUsR/HyM9DEbUH3IRqGIxBpXRf4ExtNTjBgoY9zT0rHXrEH
         pTuATvdH0FbJWOjt6x7EY5BHctkdR8/7so2WZ5JUESyY96Fapebk6xlfBRAXArE1CXcd
         0Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305128; x=1747909928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhLhHaajX2vPN/8dLCnaHW6k5nqgCvHP4L9k/9wkMNs=;
        b=D6SgIoyzKVa/EVvMH8oZw7rV5l0hMeUV5D1H6Y9PhatcJAN/M0XCVJ/Jcw5l4p3Mnu
         K5q2xGpjY+NKdT5euKCD5K3vGyD6ltOZFvc/F3BKu4RXnxtg+8qu2yZQop7rBq3Y/yMP
         JYQHofDZbjBOAwcjSrYMD646NHfgAieDDOvRQlepZuOtfy3S9bEiSAD4cKQgwtMcpy2W
         q87LzBcA50Q27RyEimtogaTOK5h3AJZOAaVHx3N4kbQiB2fsTOvB6TylZgUZc0pWQS+V
         dP4q+j2sUpnQ4y3d3Nt3xvQLkNpKjJCH7L3+fFl0uDrmb4+5ZUB6C1CKg/9ZrWUZjG8W
         CWMg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8CIO5Aq+Q2vazkdpmyceY89bFSjpTS6g0Ny6D/5DBR1PTTLrAOgtAbRx3zKbGxhAboOszJ7L2J11POE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9spOg+S0uuMLnUz5tj2ahTZmqvtpgwtsgaa7OKSgTjvjdL/9w
	PvmeSEWNejvRvxGYlkeEIuCZvhzbpJNSFW/buyoP+55jRXGZPP2x00J/Uxkw5BU=
X-Gm-Gg: ASbGnctttj7eAIJe3RVdJX9AiFVntVnthv3IsagAIGcncRgD/+FLIW8caI7kXA8LzVM
	m2IRW3LsO/M7HwcMbiczcrlXmmAkIVazZYygb39TVs/qfmgTKFZef8fFWuLg34D/UiRoybM4VzL
	5d3xNiEww57cHgLkt7cQTqxbFQKbpxpmHoso7q4/WbRkfUKEeELLLIalHMC3lrHCefLXUoD1Kbr
	XxenciE732hREyWm1ErDwVX+79ulYWpiUBYXY+6ZHIZl5zYeJ3sVcmfaKS65LkfJsH5/oQJyYNb
	1hR+bLBoGRCiRPN9rqIRqelC/SdTnHiYMCTr9tI7/53BkmrRtlOyaw==
X-Google-Smtp-Source: AGHT+IFi6X5gRlkPPvGtPwCka4BBs3QBl81Eeh0pf6PwI3XLdwc90musf3ptOQJ/Kfrx0UDVfB8kmw==
X-Received: by 2002:a05:6402:51cb:b0:5fd:2e33:fa49 with SMTP id 4fb4d7f45d1cf-5ffd01ae5f5mr1457443a12.6.1747305127646;
        Thu, 15 May 2025 03:32:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26710sm10171716a12.21.2025.05.15.03.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 03:32:07 -0700 (PDT)
Date: Thu, 15 May 2025 12:32:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
 <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>

On Tue 2025-05-13 21:23:25, Feng Tang wrote:
> Hi Petr,
> 
> Thanks for the review!
> 
> On Tue, May 13, 2025 at 11:57:19AM +0200, Petr Mladek wrote:
> > On Sun 2025-05-11 16:52:52, Feng Tang wrote:
> > > panic_print was introduced to help debugging kernel panic by dumping
> > > different kinds of system information like tasks' call stack, memory,
> > > ftrace buffer etc. Acutually this function could help debugging cases
> > > like task-hung, soft/hard lockup too, where user may need the snapshot
> > > of system info at that time.
> > > 
> > The generic approach might deserve a separate source file,
> > for example:
> > 
> >     include/linux/sys_info.h
> >     lib/sys_info.c
> 
> Thanks for the suggestion! I'm really not good at naming. 
> 
> As panic.c is always built-in, I'll put sys_info.c as obj-y.

Makes sense.

> > Also I always considered the bitmask as a horrible user interface.
> > It might be used internally. But it would be better to allow a human
> > readable parameter, for example:
> > 
> > 	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks
> 
> Yes, it's convenient for developers, as a cmdline parameter being parsed
> at boot time.
> 
> But I think bitmask may be easier for runtime changing as a core parameter
> under /proc/ or /sys/, or from sysctl interface. There are also some other
> modules use debug bitmask controlling printking info for different
> sub-components.

Good to know. Could you please give me a pointer to some other modules
using the bitmask? I believe that they exist but I can't find any.
I wonder how common it is...

Anyway, I personally find words/names easier to use. For example,
I like the following interfaces:

  #> cat /sys/power/pm_test
  [none] core processors platform devices freezer

  #> cat /sys/kernel/debug/tracing/available_tracers
  blk function_graph wakeup_dl wakeup_rt wakeup function nop

  #> cat /proc/sys/kernel/seccomp/actions_avail
  kill_process kill_thread trap errno user_notif trace log allow
  # cat /proc/sys/kernel/seccomp/actions_logged
  kill_process kill_thread trap errno user_notif trace log

> And we have similar control knobs for hung, lockup etc.
> 
> Or should I change the name from 'xxx_print_mask' to 'xxx_sysinfo_flag'
> in patch 2/3 ?
> 
> > 
> > The console reply might be handled by a separate:
> > 
> > 	panic_console_reply=1
> > 
> > And it would obsolete the existing "panic_print" which is an
> > ugly name and interface from my POV.
> 
> Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
> also a sysctl interface, I'm afraid renaming it might break user ABI.

A solution would be to keep it and create "panic_sys_info="
with the human readable parameters in parallel. They would
store the request in the same bitmap.

We could print a message that "panic_print" has been obsoleted
by "panic_sys_info" when people use it.

Both parameters would override the current bitmap. So the later
used parameter or procfs/sysfs write would win.

Note:

One question is whether to use sysctl or module parameters.

An advantage of sysctl is the "systcl" userspace tool. Some people
might like it. But the API is very old and a bit cumbersome for
implementing.

The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
But the parameters are hidden in the /sys/... jungle ;-)

I would slightly prefer "sysctl" because these parameters are easier
to find.

Best Regards,
Petr
