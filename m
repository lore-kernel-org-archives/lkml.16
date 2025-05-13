Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF301E5B9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142860; cv=none; b=HuT4KzB1FFkQb5ayTVtVTsvq3NhgHetLvqWgWO4Qz9zJsFE8BxIxkXc7PXUAdmvtxxA1f+rlIhzt64TL/7Jle2Zv8/zO8/0jubuBNDGXr7Bj2CZK3p3oMVxMexvctnYkH0sEg85POEwEOFluAIKC1qgzN9NcSByNU6ad+MdKfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142860; c=relaxed/simple;
	bh=3HZDNSsySLcYjBmp2gu11rkhmj8MkD4BWfB1jE7vJj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3wMqxee0qfvjN3lBYlT0cbsbNGx1WfunwFecR3/kdV3WXX2Ink3VTyVCHvDS5D4wiFOMshSxZdN4Gr64JyO/5kG+GFwCi+hppsgVQWZWf1PzKBL4uc/nTaMWGaZJ6N3RXD/o26Yh1zEuK+19W06Tx1ppdIhPrS5puxg9IfD/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eZwZiRj1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eZwZiRj1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbc736f0c7so249072a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747142856; x=1747747656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx2xkk3Bz8tw5WPgfF/a1dWI5bQmmRzpw2eUIdK+74g=;
        b=eZwZiRj190XFPFIp+spKcVmTwBSgNFUJAZ9FvWgxPboaIff5kfGboFQMRVaIBWat6H
         oo3lcWFdII5xqbgP653UfyQEQqsLlV1LrAmnP+b3vXU2FKOHI6M6vtHqdnUhfrqAoq1s
         bXW0umbUVF3wv4V/JX3SFomkCM4EuRRIMiKTEwRf66AR74qxg9AunrC4Kf0AZiCq/HxP
         T3ZhB4uHJFDuJmr+butKMoEwtFFc9YHU/GTt2fmGQpDphGgZjDTGzMD3FQKRVt2+cpmc
         d5PuHuY/kyustjzJpfZGm9OW2j9K/UdmYPgWEC6lZJXpG1QgrmUAxzoUXthi6a+xF7Ej
         y89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142856; x=1747747656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx2xkk3Bz8tw5WPgfF/a1dWI5bQmmRzpw2eUIdK+74g=;
        b=u4YqyJNN9h46VJx2QkrJ+Bu663Sij2+lQ8xPqP8hR0ImEgwASXyi7t1umWMxH2oPFm
         7vESfM/84IYnnvJm7eNDI3ZP847PIj0TFlzUnErao5pKbQ2/yaQS0iRjrw4LMGzobubx
         ugJaL0pXOMVa+Asosg7sInc1O9if4pidxRffTq8t2NGbJOGdO0ARdHuKIm3BaZqYcoUC
         cuYv1r7/YnNmM+447qA2IAtoVdFySuRXAz9Z+zxhd+47Qt8Q82g0YyyYJaEylthOXxr+
         AEgmfFf1nXwqiNj+gTFu2Mt3FfVYgIfJ2keZERTzLQGKYcjzFGrWfu5hrmQ1Joz+yZGi
         jUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe3AfMt2ZsuLxUFHMrosKfS+MgrRinI3L5EIvIa8R+Rjj/jcdzj0ni/z41/k09fo818XJOOn80/xaHXWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwzYrOaILWh+QHh4cQyXKB3JiR4W64eoIiHGNzBcdOsQQwR9ee
	tT2ibeCFmRIpehub1ckDwM1oJ3KPv6Xtew46ZdICSCD6USjNAh7sGFQLTY0rG3I=
X-Gm-Gg: ASbGncvZIg2XB9LeyLxl892Q3ToMpjRVJeI91qVzFekYgQaNwtDE2CPZE2RQFADjm0U
	0J42QxnvqjSW7XUXlOBi6bgdVIh7B88IUTVE/wxMomRwVCP2a30dUYCa15GqQu9xmc2n+PNnUGX
	dN15EkeQ1NyqZMhHko7ts7jR0EP5ipKfWRhDX/j+CzXkk9pkGfn6G6//npHNqQPkKAghqZnOS5X
	uzyDz6D5UvQT/n5eib6Ug7dS+B0H6KyepqJ7y5wasX3+AOQGmalaM+EVN0vMoRWfw0IaKKxxuwP
	CsAiYXXPos5MyCuxB6kEuxQwfdOqhdfT/Wp/eEIH431UHnk7oLJNuAh1Sswyr+Kb
X-Google-Smtp-Source: AGHT+IHU5ybrCbcUdcSbKf7cjQTUJzhUPZPEg4zehxsbNDzJ1celWBU9t6XALcVn8lNjCaTQkYDyFQ==
X-Received: by 2002:a05:6402:3548:b0:5fb:1bd8:2f95 with SMTP id 4fb4d7f45d1cf-5fca11de17cmr13126709a12.29.1747142855983;
        Tue, 13 May 2025 06:27:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ff8c016a16sm331292a12.2.2025.05.13.06.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:27:35 -0700 (PDT)
Date: Tue, 13 May 2025 15:27:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Feng Tang <feng.tang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 0/3] generalize panic_print's dump function to be used
 by other kernel parts
Message-ID: <aCNIxWaPVHywfek2@pathway.suse.cz>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
 <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
 <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>

On Mon 2025-05-12 16:23:30, Lance Yang wrote:
> 
> 
> On 2025/5/12 11:14, Feng Tang wrote:
> > Hi Andrew,
> > 
> > Thanks for the review!
> > 
> > On Sun, May 11, 2025 at 06:46:17PM -0700, Andrew Morton wrote:
> > > On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:
> > > 
> > > > When working on kernel stability issues, panic, task-hung and
> > > > software/hardware lockup are frequently met. And to debug them, user
> > > > may need lots of system information at that time, like task call stacks,
> > > > lock info, memory info etc.
> > > > 
> > > > panic case already has panic_print_sys_info() for this purpose, and has
> > > > a 'panic_print' bitmask to control what kinds of information is needed,
> > > > which is also helpful to debug other task-hung and lockup cases.
> > > > 
> > > > So this patchset extract the function out, and make it usable for other
> > > > cases which also need system info for debugging.
> > > > 
> > > > Locally these have been used in our bug chasing for stablility issues
> > > > and was helpful.
> > > 
> > > Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
> > > quite poorly organized.  Some effort to clean up (and document!) all of
> > > this sounds good.
> > > 
> > > My vote is to permit the display of every scrap of information we can
> > > think of in all situations.  And then to permit users to select which of
> > > that information is to be displayed under each situation.
> 
> Completely agreed. The tricky part is making a global knob that works for
> all situations without breaking userspace, but it's a better system-wide
> approach ;)
> 
> > 
> > Good point! Maybe one future todo is to add a gloabl system info dump
> > function with ONE global knob for selecting different kinds of information,
> > which could be embedded into some cases you mentioned above.
> 
> IMHO, for features with their own knobs, we need:
> a) The global knob (if enabled) turns on all related feature-level knobs,
> b) while still allowing users to manually override individual knobs.
> 
> Something like:
> 
> If SYS_PRINT_ALL_CPU_BT (global knob) is on, it enables
> hung_task_all_cpu_backtrace
> for hung-task situation automatically. But users can still disable it via
> hung_task_all_cpu_backtrace.

I am all for unifying the options for printing debug information
in various emergency situations. I am just not sure whether we really
want to do the same in all situations.

Some lockup detectors tries to be more clever, for example:

  + RCU stall detector prints backtraces only from CPUs which are
    involved in the stall, see print_other_cpu_stall().

  + Workqueues watchdog shows backtraces from tasks which are
    preventing forward progress, see show_cpu_pool_hog().

And stalls are about scheduling (disabled preemption, disabled IRQ,
deadlocks, too long uninterruptible sleep). OOM is about memory
usage. Oops is about an invalid memory access. WARNs() are
completely random stuff.

Also I am afraid of printing too much information when the system
is supposed to continue running. It would make sense to print it in
nbcon_cpu_emergency_enter()/exit() context which disables
preemption. And it might cause softlockups on its own.

Finally, I wonder whether ftrace_dump() might cause a livelock when ftrace
is adding new messages in parallel.

The situation is much easier during panic() because the system is
going to die() anyway, non-panic CPUs are stopped, ...

That said, I could understand that people might want to see as much
information as possible when the console is fast and the range of
possible problems is big.

Anyway, I have added few more people into Cc who are interested into
the various watchdogs.

And there is parallel initiative which tries to unify the loglevel or
somehow make the filtering easier, see
https://lore.kernel.org/r/20250424070436.2380215-1-senozhatsky@chromium.org

Best Regards,
Petr
