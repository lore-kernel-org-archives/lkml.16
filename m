Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A27DA6D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492341; cv=none; b=hIvszpFB8WFA7BGERKgG6MHRU0qdEdpZBFNyfB/uG3KDgnJ5sjmXqjyXVTIfhTzLqhdav1+nOPY680gxWHYKtcm5q/sfxg33ejxSSRTW8t/wtt/IxcWYpmwufgRE8qKlHeA27OP4oI6IpbCLSkEJ7gc6OjZpLUjsFciq2GxVvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492341; c=relaxed/simple;
	bh=AyI6HaGJhard7G55BIzaWmc/OKjvYn2CiesyIyki6Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kURX5VDJAfDxLyaNc7bpyVCgobjl97V7P/9Tp4XpweTFiBhhVZLRJ27daV3zSHNTbiLaguW+ZLdFjl9ZDdkxMTZrO2LiweiGXNwtiJDcCAmBpo7SbSpibJEfpcT0UcFdwXNqZaaJKjDs2VrgXsLtdEL+ywRaqqssnXEiKRH3rD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cvm6QXCh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cvm6QXCh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so15309645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745492338; x=1746097138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tifnhm1QuiaX90jOrJgpvhCX/AxzA/UMlKX5zUV412k=;
        b=cvm6QXChJmZM/3b+4cSaBwHue6gpniB4j7NNN/ZnayZs9Co5Q4HIomgBEDN57W2J6Y
         dVMc5Y0imCaaT7NaiMyj3+Xt/xPWccOeLHdwehpjF9I18jezS+klkypKiUabBXFIMy6A
         FmSywCW6WsSdQh5V2r2Q2dogT0J1bUK0SdLwepf2HwYeoDr+IC4FBply7KiugmmPYsQ4
         9mYYbqzwPJ/90joWfcclsiu9Gf2/gRoH7JQxjTMDIhKNCZx769bqo84yeUTy6t0i+MXR
         LIJXmjB2e2V0ZUaB9O/nQePVqdR5la4cPCt0JoLqXy+CDhREDbfJaTdGxHdlKyKVcPxO
         pO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492338; x=1746097138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tifnhm1QuiaX90jOrJgpvhCX/AxzA/UMlKX5zUV412k=;
        b=ZURZrJG7GyJm/u91CSAt8wHU0a+icqUhjUj3aRDGZR3Gs4A7WEF2c2gee06Gcm+yDx
         3aiQr7WiZeGwqxBbKodctR1gP6pGKwR5bI0BQKb/GIDQyMyJTSIsW5XCXwC9IcpFY3RU
         y5GGUYhWIRLLG0yZztII+noRBgFC7yfEDNjZ5buTTD1r1WGWlesF7oRfa6geqpN/jE2S
         7/i7FUNqrxd3kmwRY1Ida6+iRnKmb/zFZZAie/r88q15BLmG4Ysk+XKht9Z5v6jzbyLz
         vNVVyQKLQ3j0tpRDS+TvknATxCbJ0b808mDRzkDEz1RbxkZQYWG6bhHv/+UMB7Ta3kPD
         QVDw==
X-Forwarded-Encrypted: i=1; AJvYcCXTjUtIgz8swdkaGWArOqQPqkkx+6eRprZGKpAZhUtrtcy3I0k2UYRWZLZXVqDGjCzEIWDgBv6UsHpNi+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YztGH0s2o/yxNmX4yiJSHBbq2sL9wkGYWjPfDNFdnxP8PKRAORQ
	i2bMIH3YuXUn66DB14/ycalY3hpnB8btyCVR9YkEIKtMEqa/lvSgM3MvSVT45Mw=
X-Gm-Gg: ASbGncuEXXvcxhYBc4qa2F2rk6XB46wWu9F3oczSLjmz/KN7ahE7N8nKeRhvH67VmJq
	bnG15WtfJ7/5XYla34pXrVDf9D3MSTirPwqU6NwPskBHDE5hxt1JdI8fMoqAnlWh6OJfuayu2LZ
	K+AHG+Rwjpka2ljQMnZ0T1AFjD7GBqj1CQWr1YCWodOU2yOezTIgmPFaLimu283OaN8mgp5gB1E
	Fh8AzQ1UJnGYv/iBtG/Oig2Ca4MH2El5f9m56WsF1HO/W4wAhldnUfdsp6lRnLxHCUUG/ZiKd31
	IoCjg85ovlHsVIYfinmCzAhMH+ZxasKHTAoaMimCGRE=
X-Google-Smtp-Source: AGHT+IEW8trgvRoa0K0IaMGEMECnD7jFiV+Eh2lPUX5P/0+5Oq0euC+JkwNS+1wjJ3KadbijGuWfZg==
X-Received: by 2002:a5d:4d8f:0:b0:39f:d03:f567 with SMTP id ffacd0b85a97d-3a06d674b62mr1425416f8f.16.1745492337782;
        Thu, 24 Apr 2025 03:58:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d532ac1sm1708184f8f.72.2025.04.24.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:58:57 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:58:55 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Tomasz Figa <tfiga@chromium.org>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424070436.2380215-1-senozhatsky@chromium.org>

On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> Currently, hung-task watchdog uses two different loglevels
> to report hung-tasks: a) KERN_INFO for all the important task
> information (e.g. sched_show_task()) and b)  KERN_ERR for the
> rest.

IMHO, the two different loglevels make sense. The KERN_ERR
message seems to inform about that a task gets blocked for too long.
And KERN_INFO is used for an extra debug information.

> This makes it a little inconvenient, especially for
> automated kernel logs parsing.

Anyway, what is the exact problem, please?
Are the KERN_INFO messages filtered because of console_loglevel?
Or is it a problem to match all the related lines?

> Introduce CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL so that (a)
> becomes configurable.

I am not sure if adding hung-task-specific config option is
the right solution. I guess that other watchdogs or other
similar reports have the same problem.

It seems that several other reports, for example,
watchdog_hardlockup_check(), or __die(), are using KERN_DEFAULT
which is configurable via CONFIG_MESSAGE_LOGLEVEL_DEFAULT.

A solution might be using KERN_DEFAULT for sched_show_task()
in hung_tasks detector as well.

Alternatively, if the problem is console_loglevel filtering then
it might make sense to create a config option which would force
using the same loglevel in all similar reports. I would call it:

   CONFIG_FULL_REPORT_USING_SAME_LOGLEVEL

And support it for other reports.

If the problem is matching all related lines. Then a solution
would be printing some help lines around the report, similar
to

    ------------[ cut here ]------------

in include/asm-generic/bug.h

Plus, it would be needed to filter out messages from other CPUs.
CONFIG_PRINTK_CALLER should help with this.

Best Regards,
Petr
