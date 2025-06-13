Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7B2E11B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835663; cv=none; b=Bx8WOTnOkxe3jYAaLLUU/iQN36lNWWPQw6oPM7gYda+F8TnZeepMjc7LVacspgHqUaOonlts2oDpiiRlpngoqu72C/EBEGAzhDGtuAoKaDHKDQttY7WhMVXtAu/9/IcMGs822zRtYKrjx32mvvxFtjbOGZDu6W8xv9k6KGJ67xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835663; c=relaxed/simple;
	bh=pdf3rqtSJWicFOpYX+TUwUicneTlx6LcwlH4TfWiZAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2rLWGumVEwqvxWGfDcw9XJm6PjTVi/mLSXoQsU9uYhey4VRonXJu5baFYRu6C2CsMmenirPLeUb03UL0LzQKeLnr4XyixVTf7wgO4kZGLbb5aRuPbc051WtHHfAf3iDZ2viYasK3BVgccLBooUduLZyouE7vukFSrJGSQ+jkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bpup1IH8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bpup1IH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749835661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHfylN3K1/V0HnMVjNxiIhUPIWtFFj9Wr15mzi0PzWc=;
	b=Bpup1IH8GEgyALQxs8mq+SZvWiup6wrEV/OAhIFPtpN2lbouY07uI43ctqLb2xW/dBBWS4
	UWABg5Dqv9Vo4fhNlYt6/yAGKbi+Bk5M79aBw87BO4A8tao+O/QMccJmY/XCPJvOfUNx2X
	RxhsQmokL3TC2KEwGykkydP5pVvgwbE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-PKjtGrgLMSeYFf9Yb3R15Q-1; Fri,
 13 Jun 2025 13:27:37 -0400
X-MC-Unique: PKjtGrgLMSeYFf9Yb3R15Q-1
X-Mimecast-MFC-AGG-ID: PKjtGrgLMSeYFf9Yb3R15Q_1749835656
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC3E3195608F;
	Fri, 13 Jun 2025 17:27:36 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 35F3D19560AF;
	Fri, 13 Jun 2025 17:27:33 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 13 Jun 2025 19:26:54 +0200 (CEST)
Date: Fri, 13 Jun 2025 19:26:50 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Sevens <bsevens@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Zander Work <zdw@google.com>, security@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] posix-cpu-timers: fix race between handle_posix_cpu_timers()
 and posix_cpu_timer_del()
Message-ID: <20250613172650.GA26022@redhat.com>
References: <CAGCho0V0x_Y2+vg5G8-r45Xc6uftLbZK5K1=vpavd_4783fogQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGCho0V0x_Y2+vg5G8-r45Xc6uftLbZK5K1=vpavd_4783fogQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

If an exiting non-autoreaping task has already passed exit_notify() and
calls handle_posix_cpu_timers() from IRQ, it can be reaped by its parent
or debugger right after unlock_task_sighand().

If a concurrent posix_cpu_timer_del() runs at that moment, it won't be
able to detect timer->it.cpu.firing != 0: cpu_timer_task_rcu() and/or
lock_task_sighand() will fail.

Add the tsk->exit_state check into run_posix_cpu_timers() to fix this.

This fix is not needed if CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y, because
exit_task_work() is called before exit_notify(). But the check still
makes sense, task_work_add(&tsk->posix_cputimers_work.work) will fail
anyway in this case.

Cc: stable@vger.kernel.org
Reported-by: Benoît Sevens <bsevens@google.com>
Fixes: 0bdd2ed4138e ("sched: run_posix_cpu_timers: Don't check ->exit_state, use lock_task_sighand()")
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/time/posix-cpu-timers.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index 50e8d04ab661..2e5b89d7d866 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1405,6 +1405,15 @@ void run_posix_cpu_timers(void)
 
 	lockdep_assert_irqs_disabled();
 
+	/*
+	 * Ensure that release_task(tsk) can't happen while
+	 * handle_posix_cpu_timers() is running. Otherwise, a concurrent
+	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
+	 * miss timer->it.cpu.firing != 0.
+	 */
+	if (tsk->exit_state)
+		return;
+
 	/*
 	 * If the actual expiry is deferred to task work context and the
 	 * work is already scheduled there is no point to do anything here.
-- 
2.25.1.362.g51ebf55


