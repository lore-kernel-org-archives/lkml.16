Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3213BAF1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198335; cv=none; b=WsWvRK4MFTLmDWinsuXMSmUtgxxYgw9AVzkoxh5GHdhn7N8xDSEBNo6yST8NUVnp8tNy6vjZwQr9w1mXKqbVuVx/uGNmamBcbrGjFxSusKvhnrWGrdEKGYYdAnXKfU3ymmDXMyEBYI9Q9+Zxyg28yXTQLxv+1yS1XySMVisnE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198335; c=relaxed/simple;
	bh=WBA6nLQe8joG/my3C5u6nL1ej4fO9221Tk0CQPKsLsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvgWk8s7B4t1u5fV3pGacACS2ejE9D/obryT+U+ztCXUwCxfACkWAKduIPYP/zE57o3Y7ap0xVlNaKJXn0eqfgAJHYb0w4nNLzIK6ayXEePoZWvNgGwddCN7XduBMWYEbzFyUQKOQ9G/eAdyZVNkxry1T5l34ohDKhGYE9Bn8xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BHgOGCX0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BHgOGCX0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso19651655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746198330; x=1746803130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUUqJqXdMAXvNKqNSMlG2zg2SYLu8m1srCpogvfdg5I=;
        b=BHgOGCX0EjaoTN6g4pxVwLy3c370R/5uVFL/dNvCTfdn3ofYRIKqvP4rdnYh2Ub/FT
         IZqmkfua9bGtCML2gr85DijP8AaGFuFUGoAZXWFv+va+Kf1lX577a1n1zMSVCPL63Pk/
         5vK9veUiuHMbRIKfY5F4CZbxCZ8Fj+mGazHWlOIT3isVF9zpkbtE1T3PVxFU3wuZV/TQ
         vMcHNI9UOzs3h0NHiB/EIA46T1d+zn1rYKO/zLG4avm+zvdgUOnuhkS5lxHe/WQNkTr/
         qqjUnB4zm0Tp2XIJ6nxpMYoAOicH4wJ54ckQLimhqV7mV5xDgNftqzfIEHw7fuPoK/id
         8AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198330; x=1746803130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUUqJqXdMAXvNKqNSMlG2zg2SYLu8m1srCpogvfdg5I=;
        b=tNJw7k7cYkH0pGNu7aJWqjpjqCP+uZ973ki3w2pd+U4fAEB5H43DEvfHrn8aW3GN5g
         4SrH1/5nrcxI1NH64wceFm3x8BkYBGuS/gQcNNWfOYmis2UdoEtNv24GfZZaS+xsRIQf
         vkbFIw+zcZo02onEcKR1U8QzXYlVcBSuPUQwyUVwPqd+uA3POUjYZIgIHZ1NCiuRAiXc
         FbmIv7SZ9nroHZUAS49dVFZROlyoGXDazg/w5Rsq0bxY+/UQpO/dqQRgIKZTSXcNSnoV
         6sL0a2oGQJLHqdYoQWotx20e+23fJUcQz00CwBRrK0iEetsljZr/eHwsXmysLJDESOw9
         V/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5jwaW9bujI+NB1zHey+Ao6zmtPM6M+s+ObRb38TNuY0nR9VhhxmMM9ClDy0zzasg9qi0l1lnxL7gvSu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBlyVjsr83Tz/FoL9SVcSYXKVrjvlFp3uJ32AVCo9ZDdgBwpU
	ZDvZsOgqE9fp2Zdzn6YdCSY6VzQe42qsdW3i/NTFoDhZM8h+fKoWZRB5FtStkdc=
X-Gm-Gg: ASbGncs/OdN2azxGvrNc8kOjVPaaBXMHKehR3jZzXQ53stuM9gwnQTBClksWhZsq5Nn
	8toPtKv/yeXbzmC6nQCBhfIVzkSigME++qoOJKdhOWArRFOciLnmAAQcvV0LyVMvesGjruBpeR2
	SMko3f/GyYzIxt8H3vrHnBDrqvUSnKi3mmhe2wkKn6Wp3wJhEgQBcYKMIacE3+VQ3ussLOHFS07
	2/A5zYj2nEecUYhI28qF6QkcXDPlZtZYXeNIzd4lSzpRu49wZfH1N+vSTC+VpOyyLY+AIrQxhTG
	MrXLKjNJWyaq9RY54bdLj7E3yNQQRieJCr4BFvlg09/74xhobZE=
X-Google-Smtp-Source: AGHT+IFXKO2eaYj9WQNsXFZBnyRG5zyUeT5yoGy+Aye9Box0ALPIoMb345ZkFLHvpxcJWYdb5aIGcg==
X-Received: by 2002:a05:6000:2209:b0:3a0:82f2:3094 with SMTP id ffacd0b85a97d-3a099af1a8dmr1781237f8f.50.1746198330197;
        Fri, 02 May 2025 08:05:30 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b9069csm1304030a12.53.2025.05.02.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:05:29 -0700 (PDT)
Date: Fri, 2 May 2025 17:05:27 +0200
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
Message-ID: <aBTfN5cSrPvHHvCS@localhost.localdomain>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
 <aAuq-3yjYM97rvj1@pathway.suse.cz>
 <CAAFQd5BeJnYXZt06WVFBWu8cvCmXWTe_tH8Ly3ywTNRCjxXCMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5BeJnYXZt06WVFBWu8cvCmXWTe_tH8Ly3ywTNRCjxXCMA@mail.gmail.com>

On Wed 2025-04-30 17:42:51, Tomasz Figa wrote:
> On Sat, Apr 26, 2025 at 12:32 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Fri 2025-04-25 15:58:46, Tomasz Figa wrote:
> > > Hi Petr,
> > >
> > > On Thu, Apr 24, 2025 at 7:59 PM Petr Mladek <pmladek@suse.com> wrote:
> > > >
> > > > On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > > > > Currently, hung-task watchdog uses two different loglevels
> > > > > to report hung-tasks: a) KERN_INFO for all the important task
> > > > > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > > > > rest.
> > > >
> > > > IMHO, the two different loglevels make sense. The KERN_ERR
> > > > message seems to inform about that a task gets blocked for too long.
> > > > And KERN_INFO is used for an extra debug information.
> > > >
> > >
> > > > If the problem is matching all related lines. Then a solution
> > > > would be printing some help lines around the report, similar
> > > > to
> > > >
> > > >     ------------[ cut here ]------------
> > > >
> > > > in include/asm-generic/bug.h
> > > >
> > > > Plus, it would be needed to filter out messages from other CPUs.
> > > > CONFIG_PRINTK_CALLER should help with this.
> > >
> > > I'm not really in love with that idea - it would make things so much
> > > more complicated, despite already having the right tool to
> > > differentiate between the importance of various logs - after all the
> > > log level is exactly that.
> >
> > Honestly, the more I think about it the more I like the prefix/postfix
> > lines + the caller_id. I am afraid that manipulating log levels is a
> > lost fight  because different people might have different opinion
> > about how various messages are important.
> 
> The problem with the special lines is that it completely breaks any
> line-based processing in a data pipeline. For a piece of
> infrastructure that needs to deal with thousands of reports, on an
> on-demand basis, that would mean quite a bit of sequential work done
> instead of doing it in parallel and taking much more time to answer
> users' queries.
> 
> That could be worked around, though, if we could prefix each line
> separately with some special tag in addition to log level, timestamp
> and caller, though. Borrowing from Sergey's earlier example:
> 
> <3>[  125.297687][  T140][E] INFO: task zsh:470 blocked for more than
> 61 seconds.
> <3>[  125.302321][  T140][E]       Not tainted
> 6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
> <3>[  125.309333][  T140][E] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> <6>[  125.315040][  T140][E] task:zsh             state:D stack:0
> pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
> <6>[  125.320594][  T140][E] Call Trace:
> <6>[  125.322327][  T140][E]  <TASK>
> <6>[  125.323852][  T140][E]  __schedule+0x13b4/0x2120
> <6>[  125.325459][  T140][E]  ? schedule+0xdc/0x280
> <6>[  125.327100][  T140][E]  schedule+0xdc/0x280
> <6>[  125.328590][  T140][E]  schedule_preempt_disabled+0x10/0x20
> <6>[  125.330589][  T140][E]  __mutex_lock+0x698/0x1200
> <6>[  125.332291][  T140][E]  ? __mutex_lock+0x485/0x1200
> <6>[  125.334074][  T140][E]  mutex_lock+0x81/0x90
> <6>[  125.335113][  T140][E]  drop_caches_sysctl_handler+0x3e/0x140
> <6>[  125.336665][  T140][E]  proc_sys_call_handler+0x327/0x4f0
> <6>[  125.338069][  T140][E]  vfs_write+0x794/0xb60
> <6>[  125.339216][  T140][E]  ? proc_sys_read+0x10/0x10
> <6>[  125.340568][  T140][E]  ksys_write+0xb8/0x170
> <6>[  125.341701][  T140][E]  do_syscall_64+0xd0/0x1a0
> <6>[  125.343009][  T140][E]  ? arch_exit_to_user_mode_prepare+0x11/0x60
> <6>[  125.344612][  T140][E]  ? irqentry_exit_to_user_mode+0x7e/0xa0
> <6>[  125.346260][  T140][E]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> 
> where [E] would mean an "emergency" message, rather than something
> usual, regardless of the loglevel.

This is an interesting idea. It has several advantages. It would:

  + still allow to filter out the extra details on too slow consoles [1]
  + work even when the "cut here" prefix/postfix lines get lost
  + obsolete the config option forcing the same loglevel in emergency
      section => safe space in struct task_struct. [2]

[1] Note that there is still floating a patchset which allows to define
     per-console loglevel, see
     https://lore.kernel.org/r/cover.1730133890.git.chris@chrisdown.name

[2] It might be eventually replaced by a config option which would show
    all emergency messages on consoles.

Best Regards,
Petr
