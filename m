Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB195381BA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744659592; cv=none; b=RL1yqSVSsV/aFvounqR4E4zHOJcO7ufZyjhqP7qXBWPtjT5wotXI6Mk7LDM9AyPrBDvtQjQEGj0SUpRvc741ZMZtl15sPl0M1vjchP9x+GD25hOSTz3KMVJxd3PYd1YxM53w6Az44nlAIOVwk3mCNWRcZGsG24CzffnyWiIXna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744659592; c=relaxed/simple;
	bh=VAPAWj9KgaKp1pJYnNxYFRe2ktXp1fJivXatkEg8gEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2jyw8rgV6o4AH6fCnEQ6hwb0KMx4/mBHQNYHLn2e5JCPEinRzWpwaMziYMpZkXL9r2hNmfyRWlXKiGGVo2uKOBQSPcs6mXKCgc9TqRw6Bn5UDtMruunERROazSzG3spopTCyfPf03xfSq19RoBuVLgdwPxOLlJhiBfDBAiU5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hzetm9LB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hzetm9LB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E850EC4CEE2;
	Mon, 14 Apr 2025 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744659592;
	bh=VAPAWj9KgaKp1pJYnNxYFRe2ktXp1fJivXatkEg8gEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hzetm9LBMQYQrmN3Qmmx6vaJOj/EvQgGH6nuiYQNbXXcxgBPLgJnVfFTv70v2BSGf
	 4BK6JLfSOvp+O4Fjt4BU/eTXKfExee30eAjxW+rRX6lkj8vtFMPlDljSUI2AeipJkQ
	 T3nv/eFI1UWjWoqSzVejeEg4tWH+oUQ5qKjObfnRvxdn+8DRKLMpM4zfdU0WlFSTWh
	 ZY4qBnMwxjwQ9vequMTplTLxNVyvDYXm0WciWWFOGU17bD0U3wvAW44RdCWJ60izkT
	 fDGBLAX2l2xBwG6k9HDlJVxnRPV1h0Ma5tPlNBZ8kilYarxLAsNQ5u48Ib2GVndsDO
	 fNEblfvgXT00w==
Date: Mon, 14 Apr 2025 21:39:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
References: <20250411121857.GA10550@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250411121857.GA10550@redhat.com>

On Fri, Apr 11, 2025 at 02:18:57PM +0200, Oleg Nesterov wrote:
> After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
> of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
> free_pid(), proc_flush_pid() can just use p->thread_pid without the
> now pointless get_pid() + put_pid().
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/exit.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 1b51dc099f1e..96d639383f86 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -239,7 +239,6 @@ void release_task(struct task_struct *p)
>  {
>  	struct release_task_post post;
>  	struct task_struct *leader;
> -	struct pid *thread_pid;
>  	int zap_leader;
>  repeat:
>  	memset(&post, 0, sizeof(post));
> @@ -253,8 +252,6 @@ void release_task(struct task_struct *p)
>  	pidfs_exit(p);
>  	cgroup_release(p);
>  
> -	thread_pid = get_pid(p->thread_pid);
> -
>  	write_lock_irq(&tasklist_lock);
>  	ptrace_release_task(p);
>  	__exit_signal(&post, p);
> @@ -282,8 +279,8 @@ void release_task(struct task_struct *p)
>  	}
>  
>  	write_unlock_irq(&tasklist_lock);
> -	proc_flush_pid(thread_pid);
> -	put_pid(thread_pid);
> +	/* p->thread_pid can't go away until free_pids() below */
> +	proc_flush_pid(p->thread_pid);

This cannot work though, right?
Because after __unhash_process() p->thread_pid may be NULL:

__unhash_process()
-> detach_pid()
   -> __change_pid()
      {
	struct pid **pid_ptr, *pid;

	pid_ptr = task_pid_ptr(task, type);

	*pid_ptr = NULL;

	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
		if (pid_has_task(pid, tmp)) /* will be false if @group_dead is true
			return;

	WARN_ON(pids[type]);
	pids[type] = pid;
      }

so this needs:

diff --git a/kernel/exit.c b/kernel/exit.c
index e6132ebdaed4..9232c4c684e9 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -244,6 +244,7 @@ void release_task(struct task_struct *p)
 {
        struct release_task_post post;
        struct task_struct *leader;
+       struct pid *thread_pid = task_pid(p);
        int zap_leader;
 repeat:
        memset(&post, 0, sizeof(post));
@@ -285,7 +286,7 @@ void release_task(struct task_struct *p)

        write_unlock_irq(&tasklist_lock);
        /* p->thread_pid can't go away until free_pids() below */
-       proc_flush_pid(p->thread_pid);
+       proc_flush_pid(thread_pid);
        add_device_randomness(&p->se.sum_exec_runtime,
                              sizeof(p->se.sum_exec_runtime));
        free_pids(post.pids);

I've folded this diff into your patch, Oleg. Let me know if you see any
additional issues with this.
