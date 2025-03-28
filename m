Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004E20E002
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131526; cv=none; b=EteucsiEKOXd/Nh5dzexiNF3RSIMmIchO38kN5OixCe+KPppR5qd5GEbICn7NUfeagKE24LfUv0jaESPaPhOmSshVLD2F0j+cfIcvkmJh3roMqzTRk0LtFgXEVDD6Nk+N91zJWmfD1Fb0t/7j09AE8GYeLzAwFmzktbrRv14tGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131526; c=relaxed/simple;
	bh=5ASyXn3YsaNLm0wauR50PI3V7zl7+p1mx/bhoS5D0RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uof+t4TbeTHBJiELotkckwlsZrvJNURmx5Ixk68z0kJEqC7bF8leWg5KJAiV5DLA3yz2itqMoH28mlPAayHguhedjntckfQUUhCBWMqP6oeqfwVVmYvNm0eJXd7LWF1S51Vylz6pt9zu6xAYTfS6O6j6rp0vUVXjDeiS2nUbtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eZ+/2pIg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eZ+/2pIg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223a7065ff8so51669325ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743131523; x=1743736323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5NAfAgoaBYGrADoSG2+KedHfVaBehTkpDxDbM/r2gA=;
        b=eZ+/2pIgVSN9Rw+o2Xnm49ute3wNvxLQYAGQ87rEUVld2syqNTg2j7X96lbhkW+h1D
         O1MZW/KXQdqmwGnCdn7LqOR9mpqk6J8FatX0qwqvu0DTtdCz2Zaxv6xAcb8x+I5PC3eC
         0t3sC2J+WSt88uQ8aYz5TxS4znbfSlQ/Tj85WBpWGNrLNPvH3ZbXYrpAF8fHJIPkov8t
         eU/hwhmXWYaWYjyC68AK/bR11BZfdsQQBsKi0AhfvtyXBb1eK+ig5hU+RnJ9xs32k85o
         0aWB4XMJ9Lh0ocxYyHQ1WMllfyMtAmdPegQNK1DnTg01Ct+zsaROyrkRmfQMNoejjITV
         HbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131523; x=1743736323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5NAfAgoaBYGrADoSG2+KedHfVaBehTkpDxDbM/r2gA=;
        b=MTxDZySyClwIFeRdVCIyQk+F5dLl0cs1Ow3woMiIdsF2oIkSYQ+PDm7HpLw9u/R8km
         UmzmvZ+mk+IosnDit5JLi7tuXZk/FiTc+6ZgxSorgGYpdJkzi0W+Z+lICWqmbDAWIvzJ
         tmkW8ukfBz03XCICSu+JXxWZuTYcV6yDrWp1Ph4G9fXw6NkQasNxYPl3kPrIRv2iM9vP
         OEvv0FGbk/pir4P3VHrNjePpr3J8M1g5XER1jVzURjBLxZCi0FEbGSXo+clIHGshpmL9
         fkBi6HLpTEZprTUCaXHXR+aN42OvWAbpBK59iAwoTW0hT95ZAzr0k/i2QsGs1oRWhw0e
         /BsA==
X-Forwarded-Encrypted: i=1; AJvYcCXVJe3HojNumTTRRuMMnVFeoJFs+TTSGUOGB7vQzenKogcJ5xywS80UdMUGRRrb3G9fuSSasxDM6n7P3NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFfdDcKUQ6rfwiqSjuBoQReT8bCsnS4ZZijpkOxxZEyYzOgnk
	70pGzsNxd2HYp60uTk2LILGzClAbJY7PviUjs63y5THaMfOMJjRU+J2+13G7dQ==
X-Gm-Gg: ASbGncuQ6z/B1Cic6ljGY36LSEMP5S3/H0ngiqLTe3myxnpY5QRz3zYoSxAnGJAKlRg
	gbs96e3xN4GIYrUgg1I6GYKScbTsrkr/ib91hPHKatt3MGAiEpAouyBoMpQyTF+SkOVdSPOEC/3
	3rjlNrD+V8l6KhYttJMeCJyuWghZJDUbGjzL7n5ltNFO+ZCgb7Hd50QgEM9T5OiTUVoDUd+7rau
	mL2RWyZHeoqdTkGC1PTxAThupU5p2xhx6iYxNtY6ImXEQVFA1haUNqBnE3LsSc3uQBy1DPlS90J
	kj4XUNO84fNbOsyvN4HVEfPhwsmtpPUsvJpJThj4xNsm
X-Google-Smtp-Source: AGHT+IGSv1OkBQVKR7dqQQPh+5iJP8EGkVnQcafQ6i7bRCp0IFGJKjavz+gnrEfnV0DpjDzmpXqtOw==
X-Received: by 2002:a17:903:1b6f:b0:224:1579:5e91 with SMTP id d9443c01a7336-22804957dc2mr80666675ad.47.1743131522977;
        Thu, 27 Mar 2025 20:12:02 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec53easm7575225ad.24.2025.03.27.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 20:12:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:11:42 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Xi Wang <xii@google.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: Re: [RFC PATCH 2/7] sched/fair: Handle throttle path for task based
 throttle
Message-ID: <20250328031142.GA2304704@bytedance>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcFF7cnR4rCbU5MmY1Gq3M+r4gPXv39QPXXC=Cdr6sRww@mail.gmail.com>
 <CABk29Nuuq6s1+FBftOPAcMkYU+F1n2nebcP5tDK9dH4_KXA2cw@mail.gmail.com>
 <f121fdf9-aa0d-419f-9323-bd8b0c9682f3@linux.dev>
 <66a69f8e-6f0c-48d0-b8d6-6438092f9377@amd.com>
 <7d9fbee5-2a06-41ed-9ee3-93ef3c077eff@linux.dev>
 <CAOBoifh2Ya279_jjFBrSAHuczqz_FM4NGUne2Tk0sBV=gD4D+w@mail.gmail.com>
 <20250324085822.GA732629@bytedance>
 <20250325100225.GA1539283@bytedance>
 <CAOBoifh+VryF+R4tY=GHtzgO+nRAqER2sXjPCVvhtCgOyyG0Zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOBoifh+VryF+R4tY=GHtzgO+nRAqER2sXjPCVvhtCgOyyG0Zg@mail.gmail.com>

On Thu, Mar 27, 2025 at 05:11:42PM -0700, Xi Wang wrote:
> On Tue, Mar 25, 2025 at 3:02 AM Aaron Lu <ziqianlu@bytedance.com> wrote:
> >
> > On Mon, Mar 24, 2025 at 04:58:22PM +0800, Aaron Lu wrote:
> > > On Thu, Mar 20, 2025 at 11:40:11AM -0700, Xi Wang wrote:
> > > ...
> > > > I am a bit unsure about the overhead experiment results. Maybe we can add some
> > > > counters to check how many cgroups per cpu are actually touched and how many
> > > > threads are actually dequeued / enqueued for throttling / unthrottling?
> > >
> > > Sure thing.
> > >
> > > > Looks like busy loop workloads were used for the experiment. With throttling
> > > > deferred to exit_to_user_mode, it would only be triggered by ticks. A large
> > > > runtime debt can accumulate before the on cpu threads are actually dequeued.
> > > > (Also noted in https://lore.kernel.org/lkml/20240711130004.2157737-11-vschneid@redhat.com/)
> > > >
> > > > distribute_cfs_runtime would finish early if the quotas are used up by the first
> > > > few cpus, which would also result in throttling/unthrottling for only a few
> > > > runqueues per period. An intermittent workload like hackbench may give us more
> > > > information.
> > >
> > > I've added some trace prints and noticed it already invovled almost all
> > > cpu rqs on that 2sockets/384cpus test system, so I suppose it's OK to
> > > continue use that setup as described before:
> > > https://lore.kernel.org/lkml/CANCG0GdOwS7WO0k5Fb+hMd8R-4J_exPTt2aS3-0fAMUC5pVD8g@mail.gmail.com/
> >
> > One more data point that might be interesting. I've tested this on a
> > v5.15 based kernel where async unthrottle is not available yet so things
> > should be worse.
> >
> > As Xi mentioned, since the test program is cpu hog, I tweaked the quota
> > setting to make throttle happen more likely.
> >
> > The bpftrace duration of distribute_cfs_runtime() is:
> >
> > @durations:
> > [4K, 8K)               1 |                                                    |
> > [8K, 16K)              8 |                                                    |
> > [16K, 32K)             1 |                                                    |
> > [32K, 64K)             0 |                                                    |
> > [64K, 128K)            0 |                                                    |
> > [128K, 256K)           0 |                                                    |
> > [256K, 512K)           0 |                                                    |
> > [512K, 1M)             0 |                                                    |
> > [1M, 2M)               0 |                                                    |
> > [2M, 4M)               0 |                                                    |
> > [4M, 8M)               0 |                                                    |
> > [8M, 16M)              0 |                                                    |
> > [16M, 32M)             0 |                                                    |
> > [32M, 64M)           376 |@@@@@@@@@@@@@@@@@@@@@@@                             |
> > [64M, 128M)          824 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> >
> > One random trace point from the trace prints is:
> >
> >           <idle>-0       [117] d.h1. 83206.734588: distribute_cfs_runtime: cpu117: begins
> >           <idle>-0       [117] dnh1. 83206.801902: distribute_cfs_runtime: cpu117: finishes: unthrottled_rqs=384, unthrottled_cfs_rq=422784, unthrottled_task=10000
> >
> > So for the above trace point, distribute_cfs_runtime() unthrottled 384
> > rqs with a total of 422784 cfs_rqs and enqueued back 10000 tasks, this
> > took about 70ms.
> >
> > Note that other things like rq lock contention might make things worse -
> > I did not notice any lock contention in this setup.
> >
> > I've attached the corresponding debug diff in case it's not clear what
> > this trace print means.
> 
> Thanks for getting the test results!
> 
> My understanding is that you now have 2 test configurations and new vs
> old throttling mechanisms. I think the two groups of results were
> test1 + new method and test2 + old method. Is that the case?

Sorry for the confusion.

First result is done using this patch series on top of latest
tip/sched/core branch which has async unthrottle feature. Second result
is done using this patch series(adjusted to run on an old kernel
of course) on top of v5.15 based kernel where async unthrottle is not
available yet.

> 
> For test1 + new method, we have "..in distribute_cfs_runtime(), 383
> rqs are involved and the local cpu has unthrottled 1101 cfs_rqs and a
> total of 69 tasks are enqueued back". I think if the workload is in a
> steady and persistently over limit state we'd have 1000+ tasks
> periodically being throttled and unthrottled, at least with the old
> method. So "1101 cfs_rqs and a total of 69 tasks are enqueued back"
> might be a special case?

With async unthrottle, distribute_cfs_runtime() will only deal with
local cpu's unthrottle and other cpu's unthrottle is done by sending
an IPI to let those cpus deal with their own unthrottle.

Since there are a total of 2000 leaf cfs_rqs and 20K tasks, on this 384
cpus machine, each cpu should have roughly about 52 tasks. And one top
level hierarchy have about 1000 leaf cfs_rqs. That's why there are 1101
cfs_rqs unthrottled and 69 tasks are enqueued. These numbers mean on that
specific cpu alone where the hrtime fired, it iterates 1101 cfs_rqs and
enqueued back 69 tasks. All other tasks are enqueued in other CPU's IPI
handler __cfsb_csd_unthrottle(). With this said, for this setup, "1101
cfs_rqs and 69 tasks" is not a special case but a worse than normal case,
if not the worst.

When async unthrottle feature is not available(like in the 2nd result),
distribute_cfs_runtime() will have to iterate all cpu's throttled
cfs_rqs and enqueue back all those throttled tasks. Since these number
would be much larger, I showed them for the sole purpose of demonstrating
how bad the duration can be when 10K tasks have to be enqueued back in
one go.

> I'll also try to create a stress test that mimics our production
> problems but it would take some time.

That would be good to have, thanks.
