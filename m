Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5974414
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564350; cv=none; b=kahc+c+cH1yN6mI7YwuXUF1FYP/jqRHOW8qdI+R2Juw+3doBb0FxwfN5vKTTLCYiYEigzeEgHTr4Mu2vKDMb3sRJpHXucpqcOtQ6R7yuAyS3QCWi18fzniEHHDQFf95j+0VrBxKqxRBcJm+YH/6eQfWLJsrrVldJun6YZIZWhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564350; c=relaxed/simple;
	bh=lLeabL+lp1rURRSFVMRjPvDY5M/1orEsyCGpmlHCvVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r71P5iV9AfkyXKJblaIdeCGVY/g/Psl+QaGDeVjIt/Lm4QRvepXvHiZKNDt7GXOd5Upl/BRLV7VDJY+JcXPM1e9pvQYsCVnq3AVix0UKRzGl4+glVe+32gwSbNt85RbSKBLUzIKL74fvQ9y4LEAcX/5smA/hwriiHte/X+JDUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I6N32AkN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I6N32AkN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso3157957a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745564346; x=1746169146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2OYpdMv/khopfwtAezkAButvuxM0Hf24SVyB0bdtiA=;
        b=I6N32AkNP+dSg3zymUmKctK2CA6y5aLRixx5BJ5sC1QXHG0QN9Cb2jKUXCh8sugBce
         o36w46j+TaRbw+wQurx6dWC1gm2QJq5QhK1UHPPA3rajaRiC1eWKB/hdIEbWZ6+vPen8
         OihGQJs8APAotdCo2PkAbUtA5B2i0A5LLFY+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564346; x=1746169146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2OYpdMv/khopfwtAezkAButvuxM0Hf24SVyB0bdtiA=;
        b=afGdfMT6s5Yg7/PWzX8fumGxDDQUOPkNHXff1FPS7w+lJ4Xs/in9EdbSb7ERw2lQHT
         8AuSBiOq9cbml8zJB713QTxwrx3uipYQnnVD9squ+mvHq+orjDRF9Br9uwlNFdE5APiU
         S60w/eCv+NqbkWq5qDG1FTIkrRBk0JhI2gy0z0u7iQe2jVhCPCUm8nTdq4Xq3Cykmk7o
         NEFtn+RdFiCS8S0MiN9bqQud9Gh28018z4dwQaBHZqpYZWPA2R4Naoayh+9gmPFVP8fr
         uMDhBpS7/aXDTXVwu6+SBMRbxX9oBLCpb4smhS+sVzO/v8hhYrnLtQaaMXnXQOPXd8Wr
         +5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUOVefmarG51a0FRb1IKX4JufX8p6MdzTxcTJ7fSoS6T3ED6IsaPuwOjbpAc5SOxdTQR4P4wNJaTpmMgtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3N52/x65fOEA4mlzcNWBmeQv5KUBSFiES/j5jwnMfGS5CzZV
	vx2op9KwhGZC443r2g0QX+htajzu/auUFPM4idhkSIB0PXGgvNHZD+Eeu2iUl8iie/8RdSa91sb
	kYQ==
X-Gm-Gg: ASbGncs+pv3c87EAgd/745ySGL6Y6VsiIyJDJ6EyOwgtdFFazAPCPXs8Fd3BJOumorb
	IsxezfWOeIPH1iQQgHyN4xnvr7uWuyHNQN9CpneC3EcYFFWpeAkkCp2xIdrhzXtoBhaZgWMIY63
	kdDUS81wzG5Qbtav9RAIgb98+wrUQI4Up/mcQ09eCbu7NaS5ebjgxOmsWO0NT/yIW1VWclbUYcU
	ksYfyUk2TkmSGNfekZ5qZ8HUCXkd1j2pCfzHZiwhL8T/fI1u3TtuqQuPfvnZH4JrWM0CGy+JpLF
	3DJePknY/kiuukiTNnSo7bLrTCUgYxeEL8WV+ecgEifRG4lGzCArPl5BAMXqTXis2OWDNM/E9i4
	X
X-Google-Smtp-Source: AGHT+IGAR1zX2mzPl+1RP7Lz9ZJ4SmvceSWE0qV6Q3Sl6JyUVlRO3m2nd03AtzgktfXDqup02qzQyg==
X-Received: by 2002:a05:6402:2691:b0:5e7:c779:85db with SMTP id 4fb4d7f45d1cf-5f72257a2demr924350a12.4.1745564346286;
        Thu, 24 Apr 2025 23:59:06 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm835771a12.16.2025.04.24.23.59.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 23:59:04 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so6900a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJ708OHDP0XWH5yjFv/BTBnsq+X3XXP1t5vcCDdUwALz3+63X1MAZ+rRXZQl7XD6DLrwHtLVg6CHgfIxU=@vger.kernel.org
X-Received: by 2002:a50:d5d3:0:b0:5e5:606e:d5a8 with SMTP id
 4fb4d7f45d1cf-5f6ff44dfb9mr63024a12.4.1745564343622; Thu, 24 Apr 2025
 23:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424070436.2380215-1-senozhatsky@chromium.org> <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
In-Reply-To: <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 25 Apr 2025 15:58:46 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGCbnStSI6UkeVZ_V1-Xf8ZXjyzbQSE9waDGuxZ0YnVCOZ_DRLR_5JBw5M
Message-ID: <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Apr 24, 2025 at 7:59=E2=80=AFPM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > Currently, hung-task watchdog uses two different loglevels
> > to report hung-tasks: a) KERN_INFO for all the important task
> > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > rest.
>
> IMHO, the two different loglevels make sense. The KERN_ERR
> message seems to inform about that a task gets blocked for too long.
> And KERN_INFO is used for an extra debug information.
>

I agree that two different levels make sense, but I think that
KERN_INFO is not necessarily the best one to use, because we have
quite a lot of usual/expected things logged with that level, but this
clearly is not an unusual/expected event that we're logging.

My preference would be on KERN_NOTICE.

> > This makes it a little inconvenient, especially for
> > automated kernel logs parsing.
>
> Anyway, what is the exact problem, please?
> Are the KERN_INFO messages filtered because of console_loglevel?
> Or is it a problem to match all the related lines?

The problem is that when we're looking at the hundreds of reports with
various problems from the production fleet, we want to be able to
filter out some of the usual/expected logs. The easiest way to do it
is by using the message log level. However, if we set the filters to
anything more severe than KERNEL_INFO, we lose the task dumps and we
need to go and fetch the entire unfiltered log, which is tedious.

(FWIW, we're also developing an automated analysis tool and it would
make the implementation much easier if we could simply use the log
level to filter out expected vs unexpected events from the logs - and
most of the time that already works, the case Sergey's patch is
addressing is just one of the small number of exceptions.)

>
> > Introduce CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL so that (a)
> > becomes configurable.
>
> I am not sure if adding hung-task-specific config option is
> the right solution. I guess that other watchdogs or other
> similar reports have the same problem.
>
> It seems that several other reports, for example,
> watchdog_hardlockup_check(), or __die(), are using KERN_DEFAULT
> which is configurable via CONFIG_MESSAGE_LOGLEVEL_DEFAULT.
>
> A solution might be using KERN_DEFAULT for sched_show_task()
> in hung_tasks detector as well.

I have to admit that I don't really know what else KERN_DEFAULT is
used for, but wouldn't that mean that again some typical messages
would end up being mixed in with messages for unexpected events?

>
> Alternatively, if the problem is console_loglevel filtering then
> it might make sense to create a config option which would force
> using the same loglevel in all similar reports. I would call it:
>
>    CONFIG_FULL_REPORT_USING_SAME_LOGLEVEL
>
> And support it for other reports.

I think that would work for us too, but I kind of also think that
having two different levels for the main part and then a higher (lower
severity) one for the other tasks makes sense and would be useful for
our analysis too.

>
> If the problem is matching all related lines. Then a solution
> would be printing some help lines around the report, similar
> to
>
>     ------------[ cut here ]------------
>
> in include/asm-generic/bug.h
>
> Plus, it would be needed to filter out messages from other CPUs.
> CONFIG_PRINTK_CALLER should help with this.

I'm not really in love with that idea - it would make things so much
more complicated, despite already having the right tool to
differentiate between the importance of various logs - after all the
log level is exactly that.

Best,
Tomasz
