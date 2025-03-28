Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9EEEAC6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120717; cv=none; b=Z2bNfMHuMlK0DNY+0HjDW30TxHLp+9iogX1RYtj0A+AjvWe/hiUoYaApj4yM068QcKhkc4h3ioWaKM+1zX/htTGkk6YKyaIPEdYKQCU4UnYXxvTYviHJ5/yEzCVplRtvSgXVJTLJGxKZwaYraEYY6Tuf8xKJA5EnevBnZdXA2nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120717; c=relaxed/simple;
	bh=hI+9cERA0Uc7PDzu53oangYyrIcVYIdnHrvzYD3jtiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AepvVcfGJ6QGyEQIFehmFyxlSSbDI0TInQ79+L5wA+S7nP1vJUNfe2diEKNlbCY08AhDeJT9Q1X/2R9+OVRdwyNKK51h47OxU5aIwwrAwzZ1M27arPccZqnoKXCzoceMZOKe9IvECeHcbJLZpLoQc9+CG6COEf2R4YMH0wouGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2k8xxkWS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2k8xxkWS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225df540edcso54199605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743120715; x=1743725515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f89CW37NI/EzBM83k2DENpQe2P5RjYBtblk/hJS7d0=;
        b=2k8xxkWSw/hrVbKcRuLzAueEXbQSqtQzEjCvpZast+2bTxpsc8VVAdAzPBbchWLolA
         yfEciTTGeVPDQKNwYfbhZ1wDzMjJClRx+zhfoxPvi4u3JLon8AtwgIm1hbwhdyLZ2HI2
         kv5eOH/V239APd4mZN35MDC38XR4aS+i/ZOI3/4Vnd+/FBPYhmjP/CRK407eWIWAwJyw
         AAaWyeFk1AfiGKd7tYLblsEL3m41FJCpoMwQ40hrkS0xiqQN7M1hsXt44oyDmxDyJrDf
         2My3PO+ikDfDLkGqyH7mTYj8sLtPYj3J/RNNhTlLgPewQjHBmakZCs5dltFMLTAx1Yd3
         qHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743120715; x=1743725515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0f89CW37NI/EzBM83k2DENpQe2P5RjYBtblk/hJS7d0=;
        b=e2jXYystiNbnsp0Y35J1HxUV8uQ+8ou4YZDwD9FFP7u6nNvzHxHLPVN37CjktMmha5
         osiMBJhWCT6B9NzhyBJ6AajaQG+z8t00d0K5zSnCdl+sit4az0yHM5ClqNFNLwRsBSLm
         B4QOqY8WH0NXxDWlp83eEzmrIZjhOCM1b0RjoNLkybGYAWpWFvQh9fNuS64vb29e5QIQ
         /Vhf8Te/Go5/drb6BU95OFuU4tCwTwM3l9wzoKxc7lN3mrF3pUY9T+zUZjlEZPC2lYXq
         5ycfrpJok6+vTZaVWicea86Q51A2Zb27MFdMCbTBkvKAX+5QJrs8mr5JMZTDQfS+4Vzw
         EPbw==
X-Forwarded-Encrypted: i=1; AJvYcCWCWrRgO/UJ2+JlGQ0h50bozZ+gEeBs7bNucxMKYSGospe8G3rk9L6mSZotsQObcA3DFFGeQsnFaO40tNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxE2W7r2h4vJBMK/Oe8595Z/nopdY+x9196K4mDUb1wgvVbhw
	6a5CfiMqVWOnA9lYdzxi/a0ysJNb+fHWw5J5QrnBx2amsu7uGiLxGabMCr4CUledTETOJvvmrQD
	v0HPtbY3uLLABGpU3Y5N2wNPry0+TZAzwt3+w
X-Gm-Gg: ASbGncvby7nCvYcuHEfpuDVM3WgmnMRABObPzLfIPuhmgLcUVbZzsWQP83OdTWINBxI
	GwrCiuD37g5DN11lWYMA8YkfPDYSbIABcT1+Fa1MEdMoupUTb2vS3j/U8P1msaq/SRUcQtxTCWb
	FFCb1Bbnazk/xfsECprgmpLhPao3d/yNwS8w==
X-Google-Smtp-Source: AGHT+IGO/LmuEnkCjHlWHIS+EET3HQdZSaP40VdnsajEXA0VKL1MjJH7saT9b2keJZl+fSjstO/jGGxi4s8xLGbytSM=
X-Received: by 2002:a17:90b:4d0d:b0:2fb:fe21:4841 with SMTP id
 98e67ed59e1d1-3051c88e52bmr1296600a91.8.1743120714456; Thu, 27 Mar 2025
 17:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcFF7cnR4rCbU5MmY1Gq3M+r4gPXv39QPXXC=Cdr6sRww@mail.gmail.com>
 <CABk29Nuuq6s1+FBftOPAcMkYU+F1n2nebcP5tDK9dH4_KXA2cw@mail.gmail.com>
 <f121fdf9-aa0d-419f-9323-bd8b0c9682f3@linux.dev> <66a69f8e-6f0c-48d0-b8d6-6438092f9377@amd.com>
 <7d9fbee5-2a06-41ed-9ee3-93ef3c077eff@linux.dev> <CAOBoifh2Ya279_jjFBrSAHuczqz_FM4NGUne2Tk0sBV=gD4D+w@mail.gmail.com>
 <20250324085822.GA732629@bytedance> <20250325100225.GA1539283@bytedance>
In-Reply-To: <20250325100225.GA1539283@bytedance>
From: Xi Wang <xii@google.com>
Date: Thu, 27 Mar 2025 17:11:42 -0700
X-Gm-Features: AQ5f1JomfHHnO8Ot2jl_tXSx0AdpumnVMHJ4ZBff65vGFwactRncTqzKpgOK--A
Message-ID: <CAOBoifh+VryF+R4tY=GHtzgO+nRAqER2sXjPCVvhtCgOyyG0Zg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] sched/fair: Handle throttle path for task based throttle
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Josh Don <joshdon@google.com>, Valentin Schneider <vschneid@redhat.com>, 
	Ben Segall <bsegall@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mel Gorman <mgorman@suse.de>, Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:02=E2=80=AFAM Aaron Lu <ziqianlu@bytedance.com> w=
rote:
>
> On Mon, Mar 24, 2025 at 04:58:22PM +0800, Aaron Lu wrote:
> > On Thu, Mar 20, 2025 at 11:40:11AM -0700, Xi Wang wrote:
> > ...
> > > I am a bit unsure about the overhead experiment results. Maybe we can=
 add some
> > > counters to check how many cgroups per cpu are actually touched and h=
ow many
> > > threads are actually dequeued / enqueued for throttling / unthrottlin=
g?
> >
> > Sure thing.
> >
> > > Looks like busy loop workloads were used for the experiment. With thr=
ottling
> > > deferred to exit_to_user_mode, it would only be triggered by ticks. A=
 large
> > > runtime debt can accumulate before the on cpu threads are actually de=
queued.
> > > (Also noted in https://lore.kernel.org/lkml/20240711130004.2157737-11=
-vschneid@redhat.com/)
> > >
> > > distribute_cfs_runtime would finish early if the quotas are used up b=
y the first
> > > few cpus, which would also result in throttling/unthrottling for only=
 a few
> > > runqueues per period. An intermittent workload like hackbench may giv=
e us more
> > > information.
> >
> > I've added some trace prints and noticed it already invovled almost all
> > cpu rqs on that 2sockets/384cpus test system, so I suppose it's OK to
> > continue use that setup as described before:
> > https://lore.kernel.org/lkml/CANCG0GdOwS7WO0k5Fb+hMd8R-4J_exPTt2aS3-0fA=
MUC5pVD8g@mail.gmail.com/
>
> One more data point that might be interesting. I've tested this on a
> v5.15 based kernel where async unthrottle is not available yet so things
> should be worse.
>
> As Xi mentioned, since the test program is cpu hog, I tweaked the quota
> setting to make throttle happen more likely.
>
> The bpftrace duration of distribute_cfs_runtime() is:
>
> @durations:
> [4K, 8K)               1 |                                               =
     |
> [8K, 16K)              8 |                                               =
     |
> [16K, 32K)             1 |                                               =
     |
> [32K, 64K)             0 |                                               =
     |
> [64K, 128K)            0 |                                               =
     |
> [128K, 256K)           0 |                                               =
     |
> [256K, 512K)           0 |                                               =
     |
> [512K, 1M)             0 |                                               =
     |
> [1M, 2M)               0 |                                               =
     |
> [2M, 4M)               0 |                                               =
     |
> [4M, 8M)               0 |                                               =
     |
> [8M, 16M)              0 |                                               =
     |
> [16M, 32M)             0 |                                               =
     |
> [32M, 64M)           376 |@@@@@@@@@@@@@@@@@@@@@@@                        =
     |
> [64M, 128M)          824 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@|
>
> One random trace point from the trace prints is:
>
>           <idle>-0       [117] d.h1. 83206.734588: distribute_cfs_runtime=
: cpu117: begins
>           <idle>-0       [117] dnh1. 83206.801902: distribute_cfs_runtime=
: cpu117: finishes: unthrottled_rqs=3D384, unthrottled_cfs_rq=3D422784, unt=
hrottled_task=3D10000
>
> So for the above trace point, distribute_cfs_runtime() unthrottled 384
> rqs with a total of 422784 cfs_rqs and enqueued back 10000 tasks, this
> took about 70ms.
>
> Note that other things like rq lock contention might make things worse -
> I did not notice any lock contention in this setup.
>
> I've attached the corresponding debug diff in case it's not clear what
> this trace print means.

Thanks for getting the test results!

My understanding is that you now have 2 test configurations and new vs
old throttling mechanisms. I think the two groups of results were
test1 + new method and test2 + old method. Is that the case?

For test1 + new method, we have "..in distribute_cfs_runtime(), 383
rqs are involved and the local cpu has unthrottled 1101 cfs_rqs and a
total of 69 tasks are enqueued back". I think if the workload is in a
steady and persistently over limit state we'd have 1000+ tasks
periodically being throttled and unthrottled, at least with the old
method. So "1101 cfs_rqs and a total of 69 tasks are enqueued back"
might be a special case?

I'll also try to create a stress test that mimics our production
problems but it would take some time.
