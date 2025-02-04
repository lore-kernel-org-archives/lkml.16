Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456620ADD6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738668198; cv=none; b=FtcTT26aAxpYk3wCXwThFwEwlzSCG/XEvPTCN1PiamevaGD4k+enusEuiS3zFaoGm2NffIchnf+DPKyXRd7H7ED/mCLGYoqDoE1VwTjbJudCePAz6A9xubHOab2aNCP/eCETEAzopK+7taQXWg/3NWUiPTZdhizlimARJEMUjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738668198; c=relaxed/simple;
	bh=r2OUljjOFMUtcu2bzNQ7vTYuPwoHROqnVI8Jgy8flww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUDGgygEi4YH0+KRgYeUzhucuNOqTPV5ODxNk/PDOXimnvxGdpBXMoFFsZW3CVx1KmkaA/YJzfNslphLeysxHWCJUynTYev7A+lAYkbypXCgkpoRiRcf4Kit/v9B40aI730i61G5us3XgwL3aALcceeldHVYZo0TWh1YxsoCmTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehh21thY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehh21thY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738668193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKIa4UFSD2nJXwtkZGNNMczMFUtop4Gh2HVEiZ0WPDk=;
	b=ehh21thY4BylqDHcRdVFM/Tt/s2KwDWRMNQFciMx4k3+GB3ExICF4wcASCoywBEvrhWTYb
	Ck5SF7EH+DmGqkZK3qCMh4/HjPMMpR1aww5H5Bhn3k+l2oxTogdSE7N7f3eq0HRWygYi8b
	+jcNeJ+WzP6/t3uGfx0oR0uK5i8zskU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-0OEyAW2xOFSETkgQLcfn0A-1; Tue,
 04 Feb 2025 06:23:08 -0500
X-MC-Unique: 0OEyAW2xOFSETkgQLcfn0A-1
X-Mimecast-MFC-AGG-ID: 0OEyAW2xOFSETkgQLcfn0A
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E697195608A;
	Tue,  4 Feb 2025 11:23:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 816531800268;
	Tue,  4 Feb 2025 11:23:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  4 Feb 2025 12:22:41 +0100 (CET)
Date: Tue, 4 Feb 2025 12:22:37 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] exit: postpone tty_kref_put() until after
 tasklist_lock is dropped
Message-ID: <20250204112236.GA6031@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-4-mjguzik@gmail.com>
 <20250203180623.GC1003@redhat.com>
 <CAGudoHEWJqJf4mhcs1+Oes3qK1zFOYnb8Dnkj0aQD52yjMO=ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHEWJqJf4mhcs1+Oes3qK1zFOYnb8Dnkj0aQD52yjMO=ZQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/03, Mateusz Guzik wrote:
>
> On Mon, Feb 3, 2025 at 7:07 PM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > On 02/01, Mateusz Guzik wrote:
> > >
> > > Instead of smuggling the tty pointer directly, use a struct so that more
> > > things can be added later.
> >
> > I am not sure this particular change worth the effort, but I won't argue.
> > I'd like to know what Eric thinks.
> >
>
> it trivially whacks an atomic from an area protected by a global lock

Yes, but I am not sure this can make a noticeable difference... Let
me repeat, I am not really arguing, I leave this to you and Eric.
The patch looks correct and I have already acked it. Just it looks
"less obvious" to me than other changes in this series.

And even if we do this, I am not sure we need the new
"struct release_task_post", it seems we can simply move
tty_kref_put() from __exit_signal() to release_task(), see the
patch at the end.

Nobody can touch signal->tty after the group leader passes __exit_signal(),
if nothing else lock_task_sighand() can't succeed.

But again, feel free to ignore.

Oleg.

--- x/kernel/exit.c
+++ x/kernel/exit.c
@@ -146,7 +146,6 @@ static void __exit_signal(struct task_st
 	struct signal_struct *sig = tsk->signal;
 	bool group_dead = thread_group_leader(tsk);
 	struct sighand_struct *sighand;
-	struct tty_struct *tty;
 	u64 utime, stime;
 
 	sighand = rcu_dereference_check(tsk->sighand,
@@ -159,10 +158,7 @@ static void __exit_signal(struct task_st
 		posix_cpu_timers_exit_group(tsk);
 #endif
 
-	if (group_dead) {
-		tty = sig->tty;
-		sig->tty = NULL;
-	} else {
+	if (!group_dead) {
 		/*
 		 * If there is any task waiting for the group exit
 		 * then notify it:
@@ -210,10 +206,8 @@ static void __exit_signal(struct task_st
 
 	__cleanup_sighand(sighand);
 	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
-	if (group_dead) {
+	if (group_dead)
 		flush_sigqueue(&sig->shared_pending);
-		tty_kref_put(tty);
-	}
 }
 
 static void delayed_put_task_struct(struct rcu_head *rhp)
@@ -279,6 +273,10 @@ repeat:
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
 	release_thread(p);
+
+	if (p == leader)
+		tty_kref_put(p->signal->tty);
+
 	put_task_struct_rcu_user(p);
 
 	p = leader;

