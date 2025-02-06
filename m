Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECFB1EDA34
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859020; cv=none; b=aeVurFEgWS3i7U3d0FY45LkclKdk8q8XDOtcV5T0GMpRZowNDWrtKCjdKBIT3Y+2mexIRUhnpDmz2B9Vbrqjd2kNF5mUHsQpWr8IHf/+QZDcIDAq9jnVVYZt0yh+rpMuML6oraSGQ2KbgYXoID8biEUS5MTl9fNimNI84lvAGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859020; c=relaxed/simple;
	bh=MsruLnVQ6B5mwye0re6D9KUiNwxaZzb14td9G8CEnr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0QFNTYH3Sudc4LLohqO/jJgBYAqMhrmmxBdMC2wKhvf6hqmMKeRTv8i8DvEPLr3Sqx5SWE6Bkmy4MTaQ+TrxfefBSnWRauo+XCO0Sbu0yD5j7VMecBC8coFjnfBuuOUCR+Jhd6yRHF0bmJWV7/aQVWgWUTGb7ppeb0E15M6Yk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zm2OzPj2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zm2OzPj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738859017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=43obdfSKQHHpr6ZTgOx9ldS+5gfB0oAHhNs0QMRysaU=;
	b=Zm2OzPj2qcQoDUbLelF1iGzMSWOQspiEfFarg7XroOPvMcJtonpzN8r4xetcCzAEAKRw5W
	3Hoi6HqZCYRByp7iPoXDQzqpUTybiKhtC/KNMqvInF7fE0UlQkfr4upZBIRQYWYMCMUq4P
	tklF+LFQex2OgDWd83DOnScoA5tRIBQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-MyKJ-JxdON2H9mQS1XaQZA-1; Thu,
 06 Feb 2025 11:23:34 -0500
X-MC-Unique: MyKJ-JxdON2H9mQS1XaQZA-1
X-Mimecast-MFC-AGG-ID: MyKJ-JxdON2H9mQS1XaQZA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 153B21801A3B;
	Thu,  6 Feb 2025 16:23:33 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id F2F6A18004A7;
	Thu,  6 Feb 2025 16:23:29 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 17:23:06 +0100 (CET)
Date: Thu, 6 Feb 2025 17:23:02 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250206162301.GC5209@redhat.com>
References: <20250205175136.GA8702@redhat.com>
 <20250205175159.GA8714@redhat.com>
 <874j17nk11.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j17nk11.ffs@tglx>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/06, Thomas Gleixner wrote:
>
> On Wed, Feb 05 2025 at 18:51, Oleg Nesterov wrote:
> > A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
> > and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
> > disabled can triger a hard lockup, see
> > https://lore.kernel.org/all/20190322114917.GC28876@redhat.com/
> >
> > Fortunately, after the recent posixtimer changes sys_timer_delete() paths
> > no longer try to clear SIGQUEUE_PREALLOC and/or free tmr->sigq, and after
> > the exiting task passes __exit_signal() lock_task_sighand() can't succeed
> > and pid_task(tmr->it_pid) will return NULL.
> >
> > This means that after __exit_signal(tsk) nobody can play with tsk->pending
> > or (if group_dead) with tsk->signal->shared_pending, so release_task() can
> > safely call flush_sigqueue() after write_unlock_irq(&tasklist_lock).
>
> I can't find a problem with that.

Ah, good.

> > Also, kill clear_tsk_thread_flag(TIF_SIGPENDING), it was never needed.
>
> I'm not entirely sure about that, but it does not hurt to clear it,
> right?

Please see v2 which documents this change in a separate patch.
Again, it is not that it is really bad, just it looks very confusing
to me and I think it can confuse other readers of this code.

> > 	- do_sigaction() can hit the similar problem
>
> Indeed, but that's a tough on to solve.

Yeah... Although I have to admit that yesterday I had a very simple
(and wrong) solution in mind ;)

Thanks!

Oleg.

