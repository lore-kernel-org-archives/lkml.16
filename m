Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F351E8342
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462318; cv=none; b=DidXUqjQ6tHp8qQRkl1VgYOR/53QJvbzfl4IOOdQAst3IY/0bLNzw+Uf3CfLKKWooA6H1hziu2nyBsEuzltXOdEdpgm7B7yCiSHzh3hWVTy7IhBOBs80xNcyQiPgyMp91tvjp8ioC5O6NylBWruCWV+x1YMNua8y5e+2psoqR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462318; c=relaxed/simple;
	bh=l46Zyr1FXkEf9lccwovEz6+KsHmtM94mUBKbR00UvZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sy43hRI61uK6R94DFngB9PvYO4ESHRKySA1zVwdrbp3lSknz7C9IOeHuFoMHYEGChVkMjqfUbh0177Fti6I30jZIYpqUJKtcLz9IYPusSRRzViPc0QL8ghPWoaqGNY0LGzOxHu5wzaFrK4EguI6UgELYX1oW9j4o8erJvOorZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1ua0A5fM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nZ0UYLH9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1ua0A5fM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nZ0UYLH9"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749462308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cHhK1h06yFqbndpg69rvwB5MOqgYYultp+E4tjZSIOE=;
	b=1ua0A5fMXOnF256xv++g+LuwW9CZFG89dq4TdikJ5Mdp3LJfZ4XV6Z7nZgag0gRbOE6DpY
	Mxh6aMm8hvHFODjxy3tmvWsf8ZOi90jJ42xrBg6sMpRaumIaZHp8ez/kGGqqLwG2wVbjgI
	xrcVywMI1UlCkhbth0r8Rtqm0h1d+dJ1ODUC57pnFi9DTM7yEy8ULKN8ThheSCvTrR1KFH
	a/+s5Ynmyz3OvqxzB7y8/AQQM3lwYGE2/dYR2P75L3NKyLG6h6ZOghIZ6NDeM1Qhu0qxj9
	eKqLXrITsHGTiojr5WDwTPqfgW7xhlZiExMRPUSQIVhMkG2Oo+xTQp00ZG1QAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749462308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cHhK1h06yFqbndpg69rvwB5MOqgYYultp+E4tjZSIOE=;
	b=nZ0UYLH9SsYLGUo9qRruAomGW91gyHnvfl3ua5dGYe0/bJavJfBoIuI66dmNb6/i4Q96rA
	kMMdQ7fP+oNWEvDg==
To: Pranav Tyagi <pranav.tyagi03@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, linux-kernel@vger.kernel.org
Cc: jann@thejh.net, keescook@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, Pranav Tyagi
 <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
In-Reply-To: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
Date: Mon, 09 Jun 2025 11:45:07 +0200
Message-ID: <87cybdp7to.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 07 2025 at 12:14, Pranav Tyagi wrote:
> Previously, the get_robust_list() and compat_get_robust_list() syscalls
> used rcu_read_lock() to access the target task's robust list pointer.

This is not previously. It's how the code is right now and you want to
describe the status as is.

> However, rcu_read_lock() is not sufficient when the operation may sleep
> (e.g., locking or user-spaces access), nor does it prevent the task from
> exiting while the syscall is in progress.

1) There is no sleeping operation in this code path.

2) Of course it does not prevent the task from exiting, it only prevents
   the task struct from being freed. But what's the actual problem with
   that?

   task->robust_list contains the tasks robust list pointer even after
   the task exited. 

> This patch replaces rcu_read_lock() with

git grep 'This patch' Documentation/process/

> get_task_struct()/put_task_struct() to ensure the task is pinned during
> syscall execution prevent use-after-free.

Which use after free? You fail to explain the actual problem in the
first place and then you describe a solution for the non explained
problem.

> Additionally, the robust_list pointer can be modified during exec()
> causing a race condition if accessed concurrently.

Sure, but what is the effect of that race condition?

begin_new_exec() -> exec_mmap() -> exec_mm_release() ->
futex_exec_release()

The latter sets task::robust_list to NULL. So this either sees the real
pointer or NULL. The actual problem is?

A similar concurrency race exists between sys_get_robust_list() and
sys_set_robust_list(), no?

> ... To fix this we

We do nothing. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> introduce down_read_killable(&exec_update_lock), a read lock on a
> rw_semaphore protecting signal_struct members that change during exec.

> This read-write semaphore allows multiple concurrent readers of
> robust_list, while exec() takes the write lock to modify it, ensuring
> synchronization.

Synchronization of what?

> This prevents an attacker from determining the robust_list or
> compat_robust_list userspace pointer of a process created by executing
> a setuid binary. Such an attack could be performed by racing
> get_robust_list() with setuid execution. The impact of this issue is that
> the attacker could theoretically bypass ASLR when attacking setuid
> binaries.

It can theoretically bypass ASLR. That's impressive given the fact that
there are a gazillion ways to do so.

Now let me ask the obvious question. How is the new code so much more
protective?

T1                                      T2

                                        exit();
sys_get_robust_list(T2)
   lock();
   					lock();
   head = T2->robust_list;
   unlock();                            
   copy_to_user(head);                  // T2 mops up
   ....
   return_to_user();

T1 has the pointer, which is not longer valid. So what is this magic
serialization actually preventing?

Surely not the fact that the robust list pointer of T2 can be invalid
immediately after T1 retrieved it.

> Overall, this patch fixes a use-after-free and race condition by
> properly pinning the task and synchronizing access to robust_list,
> improving syscall safety and security.

By handwaving....

The real issue what Jann's original series is trying to address is that
the ptrace_may_access() check is racy against a concurrent exec(). But
that's nowhere mentionened in the above word salad.

That said, I'm not opposed against the change per se, but it needs to
come with a proper explanation of the actual problem and a description
of the real world relevance of the issue in the existing code.

Let me look at the code.

> diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
> index 4b6da9116aa6..27e44a304271 100644
> --- a/kernel/futex/syscalls.c
> +++ b/kernel/futex/syscalls.c
> @@ -53,31 +53,43 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
>  	unsigned long ret;
>  	struct task_struct *p;
>  
> -	rcu_read_lock();
> -
> -	ret = -ESRCH;
> -	if (!pid)
> +	if (!pid) {
>  		p = current;
> -	else {
> +		get_task_struct(p);
> +	} else {
> +		rcu_read_lock();
>  		p = find_task_by_vpid(pid);
> +		/* pin the task to permit dropping the RCU read lock before

This is not networking code. So please use proper comment style:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#comment-style

> +		 * acquiring the semaphore
> +		 */
> +		if (p)
> +			get_task_struct(p);
> +		rcu_read_unlock();
>  		if (!p)
> -			goto err_unlock;
> +			return -ESRCH;
>  	}
>  
> +	ret = down_read_killable(&p->signal->exec_update_lock);

Lacks a comment explaining what this is actually protecting.

>  	if (put_user(sizeof(*head), len_ptr))
>  		return -EFAULT;
>  	return put_user(ptr_to_compat(head), head_ptr);
>  
>  err_unlock:
> -	rcu_read_unlock();
> -
> +	up_read(&p->signal->exec_update_lock);
> +err_put:
> +	put_task_struct(p);
>  	return ret;

You really did not have a better idea than copying all of that logic
into the compat code?

Thanks,

        tglx
