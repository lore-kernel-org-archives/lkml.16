Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EBC16F265
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595138; cv=none; b=NJZiaPlxEWtAk+IU3cuI+QKaNa1280plMau3ZbeMUtvbh0t0hccK8SF11vLuONwzUrM1+ZfVSy9ETfehcozBjCLPItkh6TjlNLDPQ1pVTQc8vAfSGDqBQfTg7kDDnP/+bIBM4mwJK0KAkW9vMpLtyL8mMFj1f6+iKQWZeSwnYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595138; c=relaxed/simple;
	bh=Eq48Vbc+MBzfQ9qVAcBzoi3yTJRYMiWN3rwFFzZiaBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDZCH6o0eHcD8DGnWHRISQuzQE9ZZqJvpSJjzcFtaiBTFAi4qB3TDdE7okn/lwFNOxTfNwCGK+V1z+dshmHUyK0JffeJ2ioBHPa5hMrhzjg3U08V9zaGJinFNk0Y/0B89CB72wyasLXk45XJVAbcog1vPw6ocO+1FAz8PWG0Mpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TXFTE24h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TXFTE24h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso17995735e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745595134; x=1746199934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvRsz8BaHGyeGJPrzvi0ztNeMTURVo+EzWWiNUf2gBw=;
        b=TXFTE24hrX5FwLnb38hfWHcaoMIppsjBOTFcfshk03spv/KDbYsHgKV1Hu++OwwJvJ
         L9rsaot9Olb6njT/4Fk1P3DlxqkVTfjpuqhFNNC0uo+aBpF7NPx3E229g+43rFmsSj/u
         ceRV8cMvoTRDmnxmSDhJM1usfKj0fhRw+KhtiDrRg8/hV9y9EZkJpAVtykgZx9gaLvp6
         SxgE2O6ePl6lxPlZHwLRvi2GZ1TlYsmf8zua8x9ITv+/BoPcqCmZAYZKJNZr3nBqmPKq
         jTjRsiDS9ZxVg0Pl7kXbyiB/30e/Ty9O53tAVlsMo+DOA4Ttkzuo1CzoyP021AN3r+pN
         6HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595134; x=1746199934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvRsz8BaHGyeGJPrzvi0ztNeMTURVo+EzWWiNUf2gBw=;
        b=XgNvGMXoTQKNFyNUq4lv0QSQxMZLMhFkC/rvkksDY2A1Y3uaDVQDP0i0VB+KgOzSXL
         WCgJdgCUOtZFiSgXAHGPGcuA/Ph8i1T8sNAu84/T0DjjuWLCDXc7qMkP6WOlZBzIa14/
         od7ubYQblfM3l+XbmgIWNGLwXkz7oKCcoIDs5pAKlHXGmpZ1ygOXYUS4JQENETR8IKmg
         24VHwAePvyiRp11PjZgWu4eLEqJFJezSkLtPfgIBUDxFymNbcxdWsXozkKvoyHmjzE7/
         fOZH49qx9o5omzhYgsL7ReHa+47KlTig71OmlvQzcK5b2pXJs8aaRqMyqnXBG5e9XdGQ
         OCcA==
X-Forwarded-Encrypted: i=1; AJvYcCU/XtDjRbLvNR102amtc6WaAvDk7luqxO8MhlCs07vZp3tFaPEeGvxhMjPB630WUpXpW7Mk8uviUU48rFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrskopNnTO7KuS+xEx+T/FpM2wZnEQsiYC6KEAF6Ut4BTI9xZ
	invCWVXITFmnJxUqkfZzc8XDT9uathklnhP1ipyEcQzpOnk+YvyqP0YlXpClWsU=
X-Gm-Gg: ASbGncs6MF64Kw4xVeMhxTHpO+DDjZ30XeeJ3+IEPdajHZZHr6M91cBmyrMKt9MpNd7
	k8Qhma0pHj+HPMlQ9jAOnzda+qpzZ0kvFg/4YQB84szOVjD9dkMmxTSw3Lic4abVQioH2to3T+2
	AbPB0RUQdxbQH5J97n3Vr+wbEBVO5Kq6d4QxdPCE8vRCmNF5rGvcxL69YJBwMfqLTzy3BvKhobi
	zZSuoiRpFfQD7CHMWpD7ls3P1hNPAmqULHHJl9XUlKzARY9whXXh82kdt4Zw49PTAollHfB2ztL
	VPDcZLvMG3+CuZ4hGMAsz3f3DirfudzXRdipSjYrB9Q=
X-Google-Smtp-Source: AGHT+IFvanVMPZI41zcwIeVvHuHAe0d851N5wiLzo5uhWBDnaGa81DarIxUX8n2V9U1h0xghda+vDg==
X-Received: by 2002:a7b:cdf7:0:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-440a6f3a815mr19215315e9.18.1745595133818;
        Fri, 25 Apr 2025 08:32:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538747esm27969665e9.35.2025.04.25.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:32:13 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:32:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <aAuq-3yjYM97rvj1@pathway.suse.cz>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>

On Fri 2025-04-25 15:58:46, Tomasz Figa wrote:
> Hi Petr,
> 
> On Thu, Apr 24, 2025 at 7:59 PM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > > Currently, hung-task watchdog uses two different loglevels
> > > to report hung-tasks: a) KERN_INFO for all the important task
> > > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > > rest.
> >
> > IMHO, the two different loglevels make sense. The KERN_ERR
> > message seems to inform about that a task gets blocked for too long.
> > And KERN_INFO is used for an extra debug information.
> >
> 
> I agree that two different levels make sense, but I think that
> KERN_INFO is not necessarily the best one to use, because we have
> quite a lot of usual/expected things logged with that level, but this
> clearly is not an unusual/expected event that we're logging.
> 
> My preference would be on KERN_NOTICE.

Sigh, this is the problem with loglevels. Different people have
different feeling about them.

A solution would be to add an extra log level. But the full 0-7
(3 bit) range is already taken.

> > > This makes it a little inconvenient, especially for
> > > automated kernel logs parsing.
> >
> > Anyway, what is the exact problem, please?
> > Are the KERN_INFO messages filtered because of console_loglevel?
> > Or is it a problem to match all the related lines?
> 
> The problem is that when we're looking at the hundreds of reports with
> various problems from the production fleet, we want to be able to
> filter out some of the usual/expected logs. The easiest way to do it
> is by using the message log level. However, if we set the filters to
> anything more severe than KERNEL_INFO, we lose the task dumps and we
> need to go and fetch the entire unfiltered log, which is tedious.

Good to know.

This might be an argument for using the same log level for the entire
report. But it might create new problems. It would be more complicated
to filter-out known problems. I mean that a single known
warning/error/emergency message can be filtered easily. But
creating a filter for the entire to-be-ignored backtrace is more
complicated.


> (FWIW, we're also developing an automated analysis tool and it would
> make the implementation much easier if we could simply use the log
> level to filter out expected vs unexpected events from the logs - and
> most of the time that already works, the case Sergey's patch is
> addressing is just one of the small number of exceptions.)

It might be interesting to see the list of exceptions. Maybe, we
could find some common pattern...

It would be nice to handle all the reports of critical situations
similar way. It would help everyone. This is why I am not happy with
a hung-stask-detector-specific setting.

> > If the problem is matching all related lines. Then a solution
> > would be printing some help lines around the report, similar
> > to
> >
> >     ------------[ cut here ]------------
> >
> > in include/asm-generic/bug.h
> >
> > Plus, it would be needed to filter out messages from other CPUs.
> > CONFIG_PRINTK_CALLER should help with this.
> 
> I'm not really in love with that idea - it would make things so much
> more complicated, despite already having the right tool to
> differentiate between the importance of various logs - after all the
> log level is exactly that.

Honestly, the more I think about it the more I like the prefix/postfix
lines + the caller_id. I am afraid that manipulating log levels is a
lost fight  because different people might have different opinion
about how various messages are important.

Best Regards,
Petr
