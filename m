Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4119F13B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631292; cv=none; b=q9QHq5IMrHSnthklg7xDMNo05sCSivUTzREIzTQMz/GqHdiQ7etq3e3fTxJEYpWc3BuL2M47UQ+PVV2ZqYgz1ko10X3xXaggr9JVfyIMISuCbPCfLVhWBXI8aLpF43ffzJTCcuH2/I7gw+HwggXCqI+MO783oJsIlxcPRPvXYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631292; c=relaxed/simple;
	bh=3yFtFVoyOKbTb4fufMEnhMtQDnmxmq+3DLwYw/rtUWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBJ06KJT4WVJDdvBsmDUCb77AoGlFiLAYlOkQtJQ3TdudEkDsyGNhlgSN/o+Mjfp5bpo8VKipyp3MC+fX2ECI2gLPSl/xR3JJN1QGlKjb4mqEa9yp19He5LkWon1Z0d0S3bvtnaC+zq+a8mgcHRR0mEpA8zgk7LyKKIBiJoWyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XOQQ9wJH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XOQQ9wJH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2255003f4c6so41061885ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744631289; x=1745236089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlpaLhZI3sjfGZiu06+714DQWbH/tsDoTMwzOA8Aq6k=;
        b=XOQQ9wJH/g3REFayblkkzG9UrRlmHnUQUEna4wOtl4vqedioTEAREHoN9OC2Z1dHxd
         TR/LOZGjYqBQVwud4qR9q4I0R4JW4mrA9395vfZ/FiZC8kU7zau2tqiCxmMq3bhN/35w
         LVeOmvZ9DphylY+/rk+/rDwo8lUIv225GWz7fzDTsfJht73mwRE938BJ9FUc7VKZ22iz
         1OlWNrG0UKOiWUY3zP+gsIe168NKCjFIwAejdTjCIFXI8P8AiCRTtTHNZ3YJdqP1cwBo
         gnMT6xQJ26kCHfoG7FTcdIsINQewjr36Qtv5fLEz/0+7kxYu/D/NE7tlx2U8qtrg/ENZ
         PEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631289; x=1745236089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlpaLhZI3sjfGZiu06+714DQWbH/tsDoTMwzOA8Aq6k=;
        b=RZdLPKbB1GoBscPZ6O4eGLhJo0EmLh/PTC/xxvUm+BXArpKX1QxVGUTnQJ/det2wPy
         ar+oSpoKbnILvE+Vdxrsbh4jCZWinU2dIj+957zdi9yBq0LLtZVxPfBg7Ba7RBZFSuaC
         3FHtwW7rzj40potNNNPizI2nH8o9JfqKDcb4aPYkq5avm+fMccF67knHJII1f5oHljVK
         jpPpw3qtUmEyJKibplVMOH7QExQ7vqLWKigOhuqQOuMvy1f98K41+ERSSKgi7+yzWSOJ
         /sCcofy3zR7qaT6tSV7qIiNY8Im9L3BZMN2n5ToZgRnTBNSj6FsZaGejB9X8yIEBJIXo
         zuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsvpQOPNXQOMQsbuU+Oc1clWldLLSWAV5uv6Me7XAN5g/zHPQf280eEYj7YzYL1aRloFjujPDyNQsvODI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/RWiVQuXeg7RZdvho+yCJRutCNO6ViZCHtzAq4CqiAvkmcfQN
	zab0WAz9aBU8e497YT0QMtA3ANVJO0awsAnBjp9sbur46tFxbi5coOaGF2PqPw==
X-Gm-Gg: ASbGnctxU8khNjO0RV3Xroms+aHox2FZps1EU7YUPT55jSghU4CEOWVs2FE2y58GGyT
	NHp4CoWNwdGtkp3xCTbQugCYmQX8UEP9AKAQYdqukTdX4oKFuIWNEph6YY87a8om5L7LnAIWiqC
	08HuHXhXTyoAGhcUckJWcmfApXy/DXDQThk/SwkWk1DgGVY2Gn0/v7WhvLUvQH9tTtRguOY+5T3
	Xk0vnQJSh8JCowRmgKgAHA/hI9/fhbNjXNbz8hTUx1Ndw9STkX+zO/VASGP7e7mMqKwMF73d+e6
	tx/ENyncpe/6hlsauv7ZgzgpXE281jJ8z8ysULy5
X-Google-Smtp-Source: AGHT+IEqh+Z88/1PvakhQvRinxi7Da8FFa6LpITTx4ZJMR9IljjZat5/z7v+/+iRFd0mLxYTetEERg==
X-Received: by 2002:a17:902:f650:b0:223:653e:eb09 with SMTP id d9443c01a7336-22bea495228mr160779705ad.7.1744631289219;
        Mon, 14 Apr 2025 04:48:09 -0700 (PDT)
Received: from bytedance ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230f2fcsm6334408b3a.151.2025.04.14.04.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:48:08 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:47:52 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
Message-ID: <20250414114752.GA3558904@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <4d0e1fa3-1faa-4dd2-95a1-00e7ca48aa42@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d0e1fa3-1faa-4dd2-95a1-00e7ca48aa42@linux.dev>

On Mon, Apr 14, 2025 at 11:05:30AM +0800, Chengming Zhou wrote:
> On 2025/4/9 20:07, Aaron Lu wrote:
> > This is a continuous work based on Valentin Schneider's posting here:
> > Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
> > https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
> > 
> > Valentin has described the problem very well in the above link. We also
> > have task hung problem from time to time in our environment due to cfs quota.
> > It is mostly visible with rwsem: when a reader is throttled, writer comes in
> > and has to wait, the writer also makes all subsequent readers wait,
> > causing problems of priority inversion or even whole system hung.
> > 
> > To improve this situation, change the throttle model to task based, i.e.
> > when a cfs_rq is throttled, mark its throttled status but do not
> > remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> > when they get picked, add a task work to them so that when they return
> > to user, they can be dequeued. In this way, tasks throttled will not
> > hold any kernel resources. When cfs_rq gets unthrottled, enqueue back
> > those throttled tasks.
> > 
> > There are consequences because of this new throttle model, e.g. for a
> > cfs_rq that has 3 tasks attached, when 2 tasks are throttled on their
> > return2user path, one task still running in kernel mode, this cfs_rq is
> > in a partial throttled state:
> > - Should its pelt clock be frozen?
> > - Should this state be accounted into throttled_time?
> > 
> > For pelt clock, I chose to keep the current behavior to freeze it on
> > cfs_rq's throttle time. The assumption is that tasks running in kernel
> > mode should not last too long, freezing the cfs_rq's pelt clock can keep
> > its load and its corresponding sched_entity's weight. Hopefully, this can
> > result in a stable situation for the remaining running tasks to quickly
> > finish their jobs in kernel mode.
> 
> Seems reasonable to me, although I'm wondering is it possible or desirable
> to implement per-task PELT freeze?

Interesting idea.

One thing I'm thinking, would per-task PELT freeze cause task and its
cfs_rq's pelt clock un-sync? If so, I feel it would create some headaches
but I haven't thought through this yet.

> > 
> > For throttle time accounting, I can see several possibilities:
> > - Similar to current behavior: starts accounting when cfs_rq gets
> >    throttled(if cfs_rq->nr_queued > 0) and stops accounting when cfs_rq
> >    gets unthrottled. This has one drawback, e.g. if this cfs_rq has one
> >    task when it gets throttled and eventually, that task doesn't return
> >    to user but blocks, then this cfs_rq has no tasks on throttled list
> >    but time is accounted as throttled; Patch2 and patch3 implements this
> >    accounting(simple, fewer code change).
> > - Starts accounting when the throttled cfs_rq has at least one task on
> >    its throttled list; stops accounting when it's unthrottled. This kind
> >    of over accounts throttled time because partial throttle state is
> >    accounted.
> > - Starts accounting when the throttled cfs_rq has no tasks left and its
> >    throttled list is not empty; stops accounting when this cfs_rq is
> >    unthrottled; This kind of under accounts throttled time because partial
> >    throttle state is not accounted. Patch7 implements this accounting.
> > I do not have a strong feeling which accounting is the best, it's open
> > for discussion.
> 
> I personally prefer option 2, which has a more practical throttled time,
> so we can know how long there are some tasks throttled in fact.
> 
> Thanks!

Thanks for the input.

Now I think about this more, I feel option 2 is essentially a better
version of option 1 because it doesn't have the drawback of option 1
I mentioned above, so option 1 should probably just be ruled out.

Then there are only 2 options to consider and their difference is
basically whether to treat partial throttle state as throttled or not.

Thanks,
Aaron

> > 
> > There is also the concern of increased duration of (un)throttle operations
> > in v1. I've done some tests and with a 2000 cgroups/20K runnable tasks
> > setup on a 2sockets/384cpus AMD server, the longest duration of
> > distribute_cfs_runtime() is in the 2ms-4ms range. For details, please see:
> > https://lore.kernel.org/lkml/20250324085822.GA732629@bytedance/
> > For throttle path, with Chengming's suggestion to move "task work setup"
> > from throttle time to pick time, it's not an issue anymore.
> > 
> > Patches:
> > Patch1 is preparation work;
> > 
> > Patch2-3 provide the main functionality.
> > Patch2 deals with throttle path: when a cfs_rq is to be throttled, mark
> > throttled status for this cfs_rq and when tasks in throttled hierarchy
> > gets picked, add a task work to them so that when those tasks return to
> > user space, the task work can throttle it by dequeuing the task and
> > remember this by adding the task to its cfs_rq's limbo list;
> > Patch3 deals with unthrottle path: when a cfs_rq is to be unthrottled,
> > enqueue back those tasks in limbo list;
> > 
> > Patch4 deals with the dequeue path when task changes group, sched class
> > etc. Task that is throttled is dequeued in fair, but task->on_rq is
> > still set so when it changes task group or sched class or has affinity
> > setting change, core will firstly dequeue it. But since this task is
> > already dequeued in fair class, this patch handle this situation.
> > 
> > Patch5-6 are clean ups. Some code are obsolete after switching to task
> > based throttle mechanism.
> > 
> > Patch7 implements an alternative accounting mechanism for task based
> > throttle.
> > 
> > Changes since v1:
> > - Move "add task work" from throttle time to pick time, suggested by
> >    Chengming Zhou;
> > - Use scope_gard() and cond_resched_tasks_rcu_qs() in
> >    throttle_cfs_rq_work(), suggested by K Prateek Nayak;
> > - Remove now obsolete throttled_lb_pair(), suggested by K Prateek Nayak;
> > - Fix cfs_rq->runtime_remaining condition check in unthrottle_cfs_rq(),
> >    suggested by K Prateek Nayak;
> > - Fix h_nr_runnable accounting for delayed dequeue case when task based
> >    throttle is in use;
> > - Implemented an alternative way of throttle time accounting for
> >    discussion purpose;
> > - Make !CONFIG_CFS_BANDWIDTH build.
> > I hope I didn't omit any feedbacks I've received, but feel free to let me
> > know if I did.
> > 
> > As in v1, all change logs are written by me and if they read bad, it's
> > my fault.
> > 
> > Comments are welcome.
> > 
> > Base commit: tip/sched/core, commit 6432e163ba1b("sched/isolation: Make
> > use of more than one housekeeping cpu").
> > 
> > Aaron Lu (4):
> >    sched/fair: Take care of group/affinity/sched_class change for
> >      throttled task
> >    sched/fair: get rid of throttled_lb_pair()
> >    sched/fair: fix h_nr_runnable accounting with per-task throttle
> >    sched/fair: alternative way of accounting throttle time
> > 
> > Valentin Schneider (3):
> >    sched/fair: Add related data structure for task based throttle
> >    sched/fair: Handle throttle path for task based throttle
> >    sched/fair: Handle unthrottle path for task based throttle
> > 
> >   include/linux/sched.h |   4 +
> >   kernel/sched/core.c   |   3 +
> >   kernel/sched/fair.c   | 449 ++++++++++++++++++++++--------------------
> >   kernel/sched/sched.h  |   7 +
> >   4 files changed, 248 insertions(+), 215 deletions(-)
> > 
