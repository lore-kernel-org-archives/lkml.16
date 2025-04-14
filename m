Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25304430
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744599946; cv=none; b=TbTlZkGinkgpONf+HmVwleDIYLBtRppi9Mk7rqZEZVa4V5RIl1wULFf5TpRYC48x4WNL21LmantuddP2KDrc4W/y3wfznULRHwa3rDFsUI6twc89ZQD8fXOVv/pBpqLVh1j6GtSonAHcXrrqIaJM8ZndlPX5jOqF42W30sqSjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744599946; c=relaxed/simple;
	bh=gbjzAG2KnFiIyCNh/zOM0kP6pAKKooAHqoFquRqICzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkQi16crefVlwHxAgOxuvIAZVuuZqcSZ9yLL1tOF4gHdkeJJECOKgqbTngtF8/1nq+ctE+m4GbO1/A8PxT79fk5Mhb2HEA4yOGZ9Cm6BU1cOQtJZgwtyX5VvlL7yMV1lCyVgRz6FbiPN9IjZpa1V2VIlTnYS7VcN2gxSFy+kX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o+/A0+YG; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o+/A0+YG"
Message-ID: <4d0e1fa3-1faa-4dd2-95a1-00e7ca48aa42@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744599940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIraYhHvEQlhnX8KMnhmGlOUB+/vWj5nIXQ1kfcWVzM=;
	b=o+/A0+YGbdmPZ2K6N7T5ns2pyP7Ss6Y5BjcWPsTxf23bmhMmuS6PKgGv+hMTxwMKi+9Y0K
	tX6WQqUmblH9K6x/piTlpVXjmdf/ff3e2YmQCttH6gzUCm0YpR47E1uqee7OCxD1XOUGUl
	/Xqn9d+LfBLog1+IR1JLQ4SLhRdXa+U=
Date: Mon, 14 Apr 2025 11:05:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/4/9 20:07, Aaron Lu wrote:
> This is a continuous work based on Valentin Schneider's posting here:
> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
> https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
> 
> Valentin has described the problem very well in the above link. We also
> have task hung problem from time to time in our environment due to cfs quota.
> It is mostly visible with rwsem: when a reader is throttled, writer comes in
> and has to wait, the writer also makes all subsequent readers wait,
> causing problems of priority inversion or even whole system hung.
> 
> To improve this situation, change the throttle model to task based, i.e.
> when a cfs_rq is throttled, mark its throttled status but do not
> remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> when they get picked, add a task work to them so that when they return
> to user, they can be dequeued. In this way, tasks throttled will not
> hold any kernel resources. When cfs_rq gets unthrottled, enqueue back
> those throttled tasks.
> 
> There are consequences because of this new throttle model, e.g. for a
> cfs_rq that has 3 tasks attached, when 2 tasks are throttled on their
> return2user path, one task still running in kernel mode, this cfs_rq is
> in a partial throttled state:
> - Should its pelt clock be frozen?
> - Should this state be accounted into throttled_time?
> 
> For pelt clock, I chose to keep the current behavior to freeze it on
> cfs_rq's throttle time. The assumption is that tasks running in kernel
> mode should not last too long, freezing the cfs_rq's pelt clock can keep
> its load and its corresponding sched_entity's weight. Hopefully, this can
> result in a stable situation for the remaining running tasks to quickly
> finish their jobs in kernel mode.

Seems reasonable to me, although I'm wondering is it possible or desirable
to implement per-task PELT freeze?

> 
> For throttle time accounting, I can see several possibilities:
> - Similar to current behavior: starts accounting when cfs_rq gets
>    throttled(if cfs_rq->nr_queued > 0) and stops accounting when cfs_rq
>    gets unthrottled. This has one drawback, e.g. if this cfs_rq has one
>    task when it gets throttled and eventually, that task doesn't return
>    to user but blocks, then this cfs_rq has no tasks on throttled list
>    but time is accounted as throttled; Patch2 and patch3 implements this
>    accounting(simple, fewer code change).
> - Starts accounting when the throttled cfs_rq has at least one task on
>    its throttled list; stops accounting when it's unthrottled. This kind
>    of over accounts throttled time because partial throttle state is
>    accounted.
> - Starts accounting when the throttled cfs_rq has no tasks left and its
>    throttled list is not empty; stops accounting when this cfs_rq is
>    unthrottled; This kind of under accounts throttled time because partial
>    throttle state is not accounted. Patch7 implements this accounting.
> I do not have a strong feeling which accounting is the best, it's open
> for discussion.

I personally prefer option 2, which has a more practical throttled time,
so we can know how long there are some tasks throttled in fact.

Thanks!

> 
> There is also the concern of increased duration of (un)throttle operations
> in v1. I've done some tests and with a 2000 cgroups/20K runnable tasks
> setup on a 2sockets/384cpus AMD server, the longest duration of
> distribute_cfs_runtime() is in the 2ms-4ms range. For details, please see:
> https://lore.kernel.org/lkml/20250324085822.GA732629@bytedance/
> For throttle path, with Chengming's suggestion to move "task work setup"
> from throttle time to pick time, it's not an issue anymore.
> 
> Patches:
> Patch1 is preparation work;
> 
> Patch2-3 provide the main functionality.
> Patch2 deals with throttle path: when a cfs_rq is to be throttled, mark
> throttled status for this cfs_rq and when tasks in throttled hierarchy
> gets picked, add a task work to them so that when those tasks return to
> user space, the task work can throttle it by dequeuing the task and
> remember this by adding the task to its cfs_rq's limbo list;
> Patch3 deals with unthrottle path: when a cfs_rq is to be unthrottled,
> enqueue back those tasks in limbo list;
> 
> Patch4 deals with the dequeue path when task changes group, sched class
> etc. Task that is throttled is dequeued in fair, but task->on_rq is
> still set so when it changes task group or sched class or has affinity
> setting change, core will firstly dequeue it. But since this task is
> already dequeued in fair class, this patch handle this situation.
> 
> Patch5-6 are clean ups. Some code are obsolete after switching to task
> based throttle mechanism.
> 
> Patch7 implements an alternative accounting mechanism for task based
> throttle.
> 
> Changes since v1:
> - Move "add task work" from throttle time to pick time, suggested by
>    Chengming Zhou;
> - Use scope_gard() and cond_resched_tasks_rcu_qs() in
>    throttle_cfs_rq_work(), suggested by K Prateek Nayak;
> - Remove now obsolete throttled_lb_pair(), suggested by K Prateek Nayak;
> - Fix cfs_rq->runtime_remaining condition check in unthrottle_cfs_rq(),
>    suggested by K Prateek Nayak;
> - Fix h_nr_runnable accounting for delayed dequeue case when task based
>    throttle is in use;
> - Implemented an alternative way of throttle time accounting for
>    discussion purpose;
> - Make !CONFIG_CFS_BANDWIDTH build.
> I hope I didn't omit any feedbacks I've received, but feel free to let me
> know if I did.
> 
> As in v1, all change logs are written by me and if they read bad, it's
> my fault.
> 
> Comments are welcome.
> 
> Base commit: tip/sched/core, commit 6432e163ba1b("sched/isolation: Make
> use of more than one housekeeping cpu").
> 
> Aaron Lu (4):
>    sched/fair: Take care of group/affinity/sched_class change for
>      throttled task
>    sched/fair: get rid of throttled_lb_pair()
>    sched/fair: fix h_nr_runnable accounting with per-task throttle
>    sched/fair: alternative way of accounting throttle time
> 
> Valentin Schneider (3):
>    sched/fair: Add related data structure for task based throttle
>    sched/fair: Handle throttle path for task based throttle
>    sched/fair: Handle unthrottle path for task based throttle
> 
>   include/linux/sched.h |   4 +
>   kernel/sched/core.c   |   3 +
>   kernel/sched/fair.c   | 449 ++++++++++++++++++++++--------------------
>   kernel/sched/sched.h  |   7 +
>   4 files changed, 248 insertions(+), 215 deletions(-)
> 
