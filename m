Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F92281506
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288764; cv=none; b=vFxlwKSgwFiLUyGHIdSVcbmcOOLHFyj6MW2Ir2D6JV+qW2SxB14eOIn8W5Dgnn8Lw3fNjZglHNFaVsG50P3Vo7kOQFaEg7xRKJfr7FKj7EI+2NqQG9WgPfYQTE/kYIuRJXkciRWiplRbANFXjFpBkp12tkmIkFkUo8EsqvWtvbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288764; c=relaxed/simple;
	bh=2CaeixBRt0vG5VXEkPe1WzaF95OakNuejAea8dSeWSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=herhZZ6Glw0iKDHSszhPAe3G33JoAFn4sGtiKfsLDXzz0x9ID3Ukj0dhBnZtlphmkiBZ9sHfggcqA4YJ40Ep0j/1Bhg6G9i2vll4DgKq7d+eoj0uohzXiNsbIaw3/fpS2iZiDSY8CH5prOtlpMZihXAditExcN16QPlhxI1s9S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZRK+0Dky; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZRK+0Dky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744288761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K93wQb2/mSAJZahQSAzOrD4hk2XT84rHR3EYRte3A3s=;
	b=ZRK+0Dky6XDYpO8+FxXOoX+TXORxz5NK8+FqKs28HA3RgzqWoHp1BXgHOqMR9MJDhTgDqs
	5caqvMrbPq0o44SdzAj3XILGhWc1EdhJYO7Vr37+4zJQ0uv175Fqjusw1GASpVYIU9ILOW
	8tfDankx7r7wL5krZ3Q/YjNldJbfTxM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-Sl7472ZeMN-A91E0ISQwxA-1; Thu,
 10 Apr 2025 08:39:17 -0400
X-MC-Unique: Sl7472ZeMN-A91E0ISQwxA-1
X-Mimecast-MFC-AGG-ID: Sl7472ZeMN-A91E0ISQwxA_1744288755
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61669195609E;
	Thu, 10 Apr 2025 12:39:14 +0000 (UTC)
Received: from localhost (unknown [10.22.88.250])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11DB03001D0E;
	Thu, 10 Apr 2025 12:39:12 +0000 (UTC)
Date: Thu, 10 Apr 2025 09:39:11 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>,
	David Vernet <dvernet@meta.com>, Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>, Crystal Wood <crwood@redhat.com>,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Juri Lelli <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3] sched: do not call __put_task_struct() on rt if
 pi_blocked_on is set
Message-ID: <Z_e77422QjeYfWWy@uudg.org>
References: <Z_e0uh36Ezz6isYo@uudg.org>
 <20250410122002.JxN9F-nE@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410122002.JxN9F-nE@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Thu, Apr 10, 2025 at 02:20:02PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-04-10 09:10:12 [-0300], Luis Claudio R. Goncalves wrote:
> > diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> > --- a/include/linux/sched/task.h
> > +++ b/include/linux/sched/task.h
> > @@ -134,22 +134,12 @@ static inline void put_task_struct(struct task_struct *t)
> >  		return;
> >  
> >  	/*
> > -	 * In !RT, it is always safe to call __put_task_struct().
> > -	 * Under RT, we can only call it in preemptible context.
> > -	 */
> > -	if (!IS_ENABLED(CONFIG_PREEMPT_RT) || preemptible()) {
> > -		static DEFINE_WAIT_OVERRIDE_MAP(put_task_map, LD_WAIT_SLEEP);
> > -
> > -		lock_map_acquire_try(&put_task_map);
> > -		__put_task_struct(t);
> > -		lock_map_release(&put_task_map);
> > -		return;
> > -	}
> > -
> > -	/*
> > -	 * under PREEMPT_RT, we can't call put_task_struct
> > +	 * In !RT, it is always safe to call __put_task_struct(),
> > +	 * but under PREEMPT_RT, we can't call put_task_struct
> >  	 * in atomic context because it will indirectly
> > -	 * acquire sleeping locks.
> > +	 * acquire sleeping locks. The same is true if the
> > +	 * current process has a mutex enqueued (blocked on
> > +	 * a PI chain).
> >  	 *
> >  	 * call_rcu() will schedule delayed_put_task_struct_rcu()
> >  	 * to be called in process context.
> 
> Did you test it with lockdep with and without PREEMPT_RT? It would be
> nice to throw some testing on it.

I will re-run the full set of tests on both kernels.

> This comment here "call_rcu will schedule bla in process context" is
> wrong. It will schedule the callback in softirq context. Unless RCU is
> configured to run the callbacks in rcuc/ thread which is the default for
> PREEMPT_RT. Also delayed_put_task_struct_rcu() does not exist, imho
> never did.

I kept the original comment about the call_rcu in process context, but
didn't realize that wouldn't hold true for !RT. Would you prefer I adjust
the comments (for RT vs non-RT and other possibilities) or remove them
entirely?

And I completely missed delayed_put_task_struct_rcu() vs
__put_task_struct_rcu_cb() in the original comment.

Thank you again for the review!
Luis
> 
> Sebastian
> 
---end quoted text---

