Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1109383A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744659952; cv=none; b=YQwtDyXjcUQ9hjl2m+bih3PVyRXl0vmiaBfn5+fztQ6rZv+9qNdQt3ZN5ghzqGdzXzoQJYxcaZgFX+nKyZHj3piP7o418IC5Ttl6XCWqS3g441SEs6cPIOX5kDkCEED/hQdH25FPDvVnigcBsZmQXbAR8YGqaoopE498WM+vM48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744659952; c=relaxed/simple;
	bh=gGAOAvXXP3g5o4qWMuK9xAKBXiSHTywiF/4zfjc839k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itHZNb1oD1JGKDbI7SCHH0rPr/xxHYcGFsd1fz/bil88tSneS0pY+evv7NVxf5znzlFWTa7HeKIllcMEOtlssVeAvXvtfTjpH8OOMzKCIxVA8Qd4tw0KIvs3JfjrGw3TmRt1Z2Wm4glSAYB3pyaASjCs/SDCSfL4wtj+n2+O47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYgJhrV9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYgJhrV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F2DC4CEE2;
	Mon, 14 Apr 2025 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744659951;
	bh=gGAOAvXXP3g5o4qWMuK9xAKBXiSHTywiF/4zfjc839k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYgJhrV95Qru0xGAZIGifxHyxEn+IZvVFTJIZ9w95QNYBywdM+YurXAVQQS+xy22F
	 APmMlqCULP307Yg2PlQggyuEVm/vwyamMJkVVqyJ+0CHoxJx9Czw0VIJKD3u7FU6X9
	 pg1utThJZXmmIRL9qkgEywrI5r9h2/1IjmIf7THHrvsaw89QyLWcN/NpLl7Si42X1n
	 K1OZ1/odBfjYy021OXLcVufXawLw4ghO7zvExcYibgyOOKVh7nRbDjbCf9h26/I8hm
	 ujNueDi15PWv2ZYJnVciBTkOEwsHu9L75SEESejnzYNGPAf11Z3BG68uv/61p2VdXy
	 w+K/PA/4NwYig==
Date: Mon, 14 Apr 2025 21:45:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250414-tintenfleck-planbar-656144f25a3b@brauner>
References: <20250411121857.GA10550@redhat.com>
 <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3y3eckwwezwa2z46"
Content-Disposition: inline
In-Reply-To: <20250414-lappalie-abhilfe-eb7810af39bb@brauner>


--3y3eckwwezwa2z46
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 14, 2025 at 09:39:47PM +0200, Christian Brauner wrote:
> On Fri, Apr 11, 2025 at 02:18:57PM +0200, Oleg Nesterov wrote:
> > After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
> > of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
> > free_pid(), proc_flush_pid() can just use p->thread_pid without the
> > now pointless get_pid() + put_pid().
> > 
> > Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> > ---
> >  kernel/exit.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/kernel/exit.c b/kernel/exit.c
> > index 1b51dc099f1e..96d639383f86 100644
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -239,7 +239,6 @@ void release_task(struct task_struct *p)
> >  {
> >  	struct release_task_post post;
> >  	struct task_struct *leader;
> > -	struct pid *thread_pid;
> >  	int zap_leader;
> >  repeat:
> >  	memset(&post, 0, sizeof(post));
> > @@ -253,8 +252,6 @@ void release_task(struct task_struct *p)
> >  	pidfs_exit(p);
> >  	cgroup_release(p);
> >  
> > -	thread_pid = get_pid(p->thread_pid);
> > -
> >  	write_lock_irq(&tasklist_lock);
> >  	ptrace_release_task(p);
> >  	__exit_signal(&post, p);
> > @@ -282,8 +279,8 @@ void release_task(struct task_struct *p)
> >  	}
> >  
> >  	write_unlock_irq(&tasklist_lock);
> > -	proc_flush_pid(thread_pid);
> > -	put_pid(thread_pid);
> > +	/* p->thread_pid can't go away until free_pids() below */
> > +	proc_flush_pid(p->thread_pid);
> 
> This cannot work though, right?
> Because after __unhash_process() p->thread_pid may be NULL:
> 
> __unhash_process()
> -> detach_pid()
>    -> __change_pid()
>       {
> 	struct pid **pid_ptr, *pid;
> 
> 	pid_ptr = task_pid_ptr(task, type);
> 
> 	*pid_ptr = NULL;
> 
> 	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
> 		if (pid_has_task(pid, tmp)) /* will be false if @group_dead is true
> 			return;
> 
> 	WARN_ON(pids[type]);
> 	pids[type] = pid;
>       }
> 
> so this needs:
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index e6132ebdaed4..9232c4c684e9 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -244,6 +244,7 @@ void release_task(struct task_struct *p)
>  {
>         struct release_task_post post;
>         struct task_struct *leader;
> +       struct pid *thread_pid = task_pid(p);
>         int zap_leader;
>  repeat:
>         memset(&post, 0, sizeof(post));
> @@ -285,7 +286,7 @@ void release_task(struct task_struct *p)
> 
>         write_unlock_irq(&tasklist_lock);
>         /* p->thread_pid can't go away until free_pids() below */
> -       proc_flush_pid(p->thread_pid);
> +       proc_flush_pid(thread_pid);
>         add_device_randomness(&p->se.sum_exec_runtime,
>                               sizeof(p->se.sum_exec_runtime));
>         free_pids(post.pids);
> 
> I've folded this diff into your patch, Oleg. Let me know if you see any
> additional issues with this.

The task_pid() needs to be moved after the repeat label. I'm appending
the full patch I applied.

--3y3eckwwezwa2z46
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-release_task-kill-the-no-longer-needed-get-put_pid-t.patch"

From 0a36bad01731e71568bdd365764d38b6bd576ab0 Mon Sep 17 00:00:00 2001
From: Oleg Nesterov <oleg@redhat.com>
Date: Fri, 11 Apr 2025 14:18:57 +0200
Subject: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)

After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
free_pid(), proc_flush_pid() can just use p->thread_pid without the
now pointless get_pid() + put_pid().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Link: https://lore.kernel.org/20250411121857.GA10550@redhat.com
Reviewed-by: Mateusz Guzik <mjguzik@gmail.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 kernel/exit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index abcd93ce4e18..c33ecde016de 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -258,7 +258,8 @@ void release_task(struct task_struct *p)
 	pidfs_exit(p);
 	cgroup_release(p);
 
-	thread_pid = get_pid(p->thread_pid);
+	/* Retrieve @thread_pid before __unhash_process() may set it to NULL. */
+	thread_pid = task_pid(p);
 
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
@@ -287,8 +288,8 @@ void release_task(struct task_struct *p)
 	}
 
 	write_unlock_irq(&tasklist_lock);
+	/* @thread_pid can't go away until free_pids() below */
 	proc_flush_pid(thread_pid);
-	put_pid(thread_pid);
 	add_device_randomness(&p->se.sum_exec_runtime,
 			      sizeof(p->se.sum_exec_runtime));
 	free_pids(post.pids);
-- 
2.47.2


--3y3eckwwezwa2z46--
