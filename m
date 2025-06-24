Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990C126C03
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737477; cv=none; b=Nb+pUNZXU+xhrv1w2RYA04WALTMEq2l3QJB4XYp1EZkO7uLcdXris3fp85dBv2tD1ss8qXnQY87HzTonfd430kH/GSdOn41AfEv2D9+oVSlf0PQCj+/mjTuvgdBZOo5L7xlDAosBZCf8SFZOD/mftLQjAoyNiA3Y7ODQUGIkWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737477; c=relaxed/simple;
	bh=+QzU21Jo6D91iPMqSksxmcP7qfut/YubP7Ke/jZpSfw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nrBcMlQa7AECJcdMS/rKVcs00SWidGEwG9gtrEvdWZZv6F7Xcpkz06R/ATKj/la6hfZfMXLCOxxK09IAMc3XTvqw7IL69rOTqy1JptLi9q4exj5pSnaF0KBU1RFAqejTnASJDRgFOPmVo2lv2V1BQ/qzKCuF/IqpUGPjeBdbWYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCC3hbVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCC3hbVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30A9C4CEE3;
	Tue, 24 Jun 2025 03:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750737477;
	bh=+QzU21Jo6D91iPMqSksxmcP7qfut/YubP7Ke/jZpSfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kCC3hbVBNl6QWCLz+hYnASzTvBsSOfNInQMt9Ow4pBUveGWC0Ua0zCZEOJdtq1uOR
	 CG9pXr+wnzfI6sN3ObdMVJvLuIrgptLnJYqIXO2fEfpXYHIJhbdkT2iKzg2+wmB9zG
	 GWymzT6dgkBj6lMzY9gyn0z2FxouXAPr4n+DkUlC5hB37/6TyB9uehLDzKN0ujgl3B
	 GBUXJeu4o/4jGLp65SmYC4RwR4/KFneYVaH//wvMe3GhywBkgNbidkz/BQjtUuT3kH
	 ml1xff5gezX4/qn+Wtidw7DR2myMZ6sCIKOZjSzoq47c2vqBnY0yEky0r+fmpgA/Kx
	 sHjDsUFI7JS9w==
Date: Tue, 24 Jun 2025 12:57:53 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mhiramat@kernel.org,
 mingo@redhat.com, mingzhe.yang@ly.com, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, tfiga@chromium.org,
 will@kernel.org, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH RFC 3/3] hung_task: extend hung task blocker tracking to
 rwsems
Message-Id: <20250624125753.1b64a9b0dafbd2bd63239dbc@kernel.org>
In-Reply-To: <20250612042005.99602-4-lance.yang@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
	<20250612042005.99602-4-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Jun 2025 12:19:26 +0800
Lance Yang <ioworker0@gmail.com> wrote:

> From: Lance Yang <lance.yang@linux.dev>
> 
> Inspired by mutex blocker tracking[1], and having already extended it to
> semaphores, let's now add support for reader-writer semaphores (rwsems).
> 
> The approach is simple: when a task enters TASK_UNINTERRUPTIBLE while
> waiting for an rwsem, we just call hung_task_set_blocker(). The hung task
> detector can then query the rwsem's owner to identify the lock holder.
> 
> Tracking works reliably for writers, as there can only be a single writer
> holding the lock, and its task struct is stored in the owner field.
> 
> The main challenge lies with readers. The owner field points to only one
> of many concurrent readers, so we might lose track of the blocker if that
> specific reader unlocks, even while others remain. This is not a
> significant issue, however. In practice, long-lasting lock contention is
> almost always caused by a writer. Therefore, reliably tracking the writer
> is the primary goal of this patch series ;)

I think as far as it is reliable, it is better than nothing :) and that
can help us to debug some part of kernel crashes.

> 
> With this change, the hung task detector can now show blocker task's info
> like below:
> 
> [Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 blocked for more than 122 seconds.
> [Thu Jun 12 11:01:33 2025]       Tainted: G S         O        6.16.0-rc1 #1
> [Thu Jun 12 11:01:33 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [Thu Jun 12 11:01:33 2025] task:rw_sem_thread2  state:D stack:0     pid:36526 tgid:36526 ppid:2      task_flags:0x208040 flags:0x00004000
> [Thu Jun 12 11:01:33 2025] Call Trace:
> [Thu Jun 12 11:01:33 2025]  <TASK>
> [Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
> [Thu Jun 12 11:01:33 2025]  schedule_preempt_disabled+0x15/0x30
> [Thu Jun 12 11:01:33 2025]  rwsem_down_write_slowpath+0x447/0x1090
> [Thu Jun 12 11:01:33 2025]  ? __pfx_rwsem_down_write_slowpath+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx___might_resched+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_thread2_func+0x10/0x10 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  down_write+0x125/0x140
> [Thu Jun 12 11:01:33 2025]  ? __pfx_down_write+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? msleep+0x91/0xf0
> [Thu Jun 12 11:01:33 2025]  ? __raw_spin_lock_irqsave+0x8c/0xf0
> [Thu Jun 12 11:01:33 2025]  thread2_func+0x37/0x70 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
> [Thu Jun 12 11:01:33 2025]  </TASK>
> [Thu Jun 12 11:01:33 2025] INFO: task rw_sem_thread2:36526 <writer> blocked on an rw-semaphore likely owned by task rw_sem_thread1:36525 <writer>
> [Thu Jun 12 11:01:33 2025] task:rw_sem_thread1  state:S stack:0     pid:36525 tgid:36525 ppid:2      task_flags:0x208040 flags:0x00004000
> [Thu Jun 12 11:01:33 2025] Call Trace:
> [Thu Jun 12 11:01:33 2025]  <TASK>
> [Thu Jun 12 11:01:33 2025]  __schedule+0x7c7/0x1930
> [Thu Jun 12 11:01:33 2025]  ? __pfx___schedule+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __mod_timer+0x304/0xa80
> [Thu Jun 12 11:01:33 2025]  ? irq_work_queue+0x6a/0xa0
> [Thu Jun 12 11:01:33 2025]  ? __pfx_vprintk_emit+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  schedule+0x6a/0x180
> [Thu Jun 12 11:01:33 2025]  schedule_timeout+0xfb/0x230
> [Thu Jun 12 11:01:33 2025]  ? __pfx_schedule_timeout+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_process_timeout+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? down_write+0xc4/0x140
> [Thu Jun 12 11:01:33 2025]  msleep_interruptible+0xbe/0x150
> [Thu Jun 12 11:01:33 2025]  ? __pfx_thread1_func+0x10/0x10 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  thread1_func+0x37/0x60 [rw_sem_test_2]
> [Thu Jun 12 11:01:33 2025]  kthread+0x39f/0x750
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork+0x25d/0x320
> [Thu Jun 12 11:01:33 2025]  ? __pfx_kthread+0x10/0x10
> [Thu Jun 12 11:01:33 2025]  ret_from_fork_asm+0x1a/0x30
> [Thu Jun 12 11:01:33 2025]  </TASK>
> 
> [1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com/
> 
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

BTW, can you also add a patch to extend the test module
(samples/hung_task/hung_task_tests.c) to handle the rwsem
blocking case ? (reader and writer side)

Thank you,


> ---
>  include/linux/hung_task.h | 18 +++++++++---------
>  kernel/hung_task.c        | 29 +++++++++++++++++++++++++----
>  kernel/locking/rwsem.c    | 17 ++++++++++++++++-
>  3 files changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
> index 1bc2b3244613..34e615c76ca5 100644
> --- a/include/linux/hung_task.h
> +++ b/include/linux/hung_task.h
> @@ -21,17 +21,17 @@
>   * type.
>   *
>   * Type encoding:
> - * 00 - Blocked on mutex        (BLOCKER_TYPE_MUTEX)
> - * 01 - Blocked on semaphore    (BLOCKER_TYPE_SEM)
> - * 10 - Blocked on rt-mutex     (BLOCKER_TYPE_RTMUTEX)
> - * 11 - Blocked on rw-semaphore (BLOCKER_TYPE_RWSEM)
> + * 00 - Blocked on mutex			(BLOCKER_TYPE_MUTEX)
> + * 01 - Blocked on semaphore			(BLOCKER_TYPE_SEM)
> + * 10 - Blocked on rw-semaphore as READER	(BLOCKER_TYPE_RWSEM_READER)
> + * 11 - Blocked on rw-semaphore as WRITER	(BLOCKER_TYPE_RWSEM_WRITER)
>   */
> -#define BLOCKER_TYPE_MUTEX      0x00UL
> -#define BLOCKER_TYPE_SEM        0x01UL
> -#define BLOCKER_TYPE_RTMUTEX    0x02UL
> -#define BLOCKER_TYPE_RWSEM      0x03UL
> +#define BLOCKER_TYPE_MUTEX		0x00UL
> +#define BLOCKER_TYPE_SEM		0x01UL
> +#define BLOCKER_TYPE_RWSEM_READER	0x02UL
> +#define BLOCKER_TYPE_RWSEM_WRITER	0x03UL
>  
> -#define BLOCKER_TYPE_MASK       0x03UL
> +#define BLOCKER_TYPE_MASK		0x03UL
>  
>  #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
>  static inline void hung_task_set_blocker(void *lock, unsigned long type)
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index d2432df2b905..8708a1205f82 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched/debug.h>
>  #include <linux/sched/sysctl.h>
>  #include <linux/hung_task.h>
> +#include <linux/rwsem.h>
>  
>  #include <trace/events/sched.h>
>  
> @@ -100,6 +101,7 @@ static void debug_show_blocker(struct task_struct *task)
>  {
>  	struct task_struct *g, *t;
>  	unsigned long owner, blocker, blocker_type;
> +	const char *rwsem_blocked_by, *rwsem_blocked_as;
>  
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
>  
> @@ -111,12 +113,20 @@ static void debug_show_blocker(struct task_struct *task)
>  
>  	switch (blocker_type) {
>  	case BLOCKER_TYPE_MUTEX:
> -		owner = mutex_get_owner(
> -			(struct mutex *)hung_task_blocker_to_lock(blocker));
> +		owner = mutex_get_owner(hung_task_blocker_to_lock(blocker));
>  		break;
>  	case BLOCKER_TYPE_SEM:
> -		owner = sem_last_holder(
> -			(struct semaphore *)hung_task_blocker_to_lock(blocker));
> +		owner = sem_last_holder(hung_task_blocker_to_lock(blocker));
> +		break;
> +	case BLOCKER_TYPE_RWSEM_READER:
> +	case BLOCKER_TYPE_RWSEM_WRITER:
> +		owner = (unsigned long)rwsem_owner(
> +					hung_task_blocker_to_lock(blocker));
> +		rwsem_blocked_as = (blocker_type == BLOCKER_TYPE_RWSEM_READER) ?
> +					"reader" : "writer";
> +		rwsem_blocked_by = is_rwsem_reader_owned(
> +					hung_task_blocker_to_lock(blocker)) ?
> +					"reader" : "writer";
>  		break;
>  	default:
>  		WARN_ON_ONCE(1);
> @@ -134,6 +144,11 @@ static void debug_show_blocker(struct task_struct *task)
>  			pr_err("INFO: task %s:%d is blocked on a semaphore, but the last holder is not found.\n",
>  			       task->comm, task->pid);
>  			break;
> +		case BLOCKER_TYPE_RWSEM_READER:
> +		case BLOCKER_TYPE_RWSEM_WRITER:
> +			pr_err("INFO: task %s:%d is blocked on an rw-semaphore, but the owner is not found.\n",
> +			       task->comm, task->pid);
> +			break;
>  		}
>  		return;
>  	}
> @@ -152,6 +167,12 @@ static void debug_show_blocker(struct task_struct *task)
>  			pr_err("INFO: task %s:%d blocked on a semaphore likely last held by task %s:%d\n",
>  			       task->comm, task->pid, t->comm, t->pid);
>  			break;
> +		case BLOCKER_TYPE_RWSEM_READER:
> +		case BLOCKER_TYPE_RWSEM_WRITER:
> +			pr_err("INFO: task %s:%d <%s> blocked on an rw-semaphore likely owned by task %s:%d <%s>\n",
> +			       task->comm, task->pid, rwsem_blocked_as, t->comm,
> +			       t->pid, rwsem_blocked_by);
> +			break;
>  		}
>  		sched_show_task(t);
>  		return;
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index a310eb9896de..92c6332da401 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -27,6 +27,7 @@
>  #include <linux/export.h>
>  #include <linux/rwsem.h>
>  #include <linux/atomic.h>
> +#include <linux/hung_task.h>
>  #include <trace/events/lock.h>
>  
>  #ifndef CONFIG_PREEMPT_RT
> @@ -1065,10 +1066,13 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
>  		wake_up_q(&wake_q);
>  
>  	trace_contention_begin(sem, LCB_F_READ);
> +	set_current_state(state);
> +
> +	if (state == TASK_UNINTERRUPTIBLE)
> +		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_READER);
>  
>  	/* wait to be given the lock */
>  	for (;;) {
> -		set_current_state(state);
>  		if (!smp_load_acquire(&waiter.task)) {
>  			/* Matches rwsem_mark_wake()'s smp_store_release(). */
>  			break;
> @@ -1083,8 +1087,12 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
>  		}
>  		schedule_preempt_disabled();
>  		lockevent_inc(rwsem_sleep_reader);
> +		set_current_state(state);
>  	}
>  
> +	if (state == TASK_UNINTERRUPTIBLE)
> +		hung_task_clear_blocker();
> +
>  	__set_current_state(TASK_RUNNING);
>  	lockevent_inc(rwsem_rlock);
>  	trace_contention_end(sem, 0);
> @@ -1146,6 +1154,9 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
>  	set_current_state(state);
>  	trace_contention_begin(sem, LCB_F_WRITE);
>  
> +	if (state == TASK_UNINTERRUPTIBLE)
> +		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_WRITER);
> +
>  	for (;;) {
>  		if (rwsem_try_write_lock(sem, &waiter)) {
>  			/* rwsem_try_write_lock() implies ACQUIRE on success */
> @@ -1179,6 +1190,10 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
>  trylock_again:
>  		raw_spin_lock_irq(&sem->wait_lock);
>  	}
> +
> +	if (state == TASK_UNINTERRUPTIBLE)
> +		hung_task_clear_blocker();
> +
>  	__set_current_state(TASK_RUNNING);
>  	raw_spin_unlock_irq(&sem->wait_lock);
>  	lockevent_inc(rwsem_wlock);
> -- 
> 2.49.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
