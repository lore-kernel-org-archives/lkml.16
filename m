Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230B22ACEF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853943; cv=none; b=uJXbteU8PDaRzTsPjVJtdCvhXy/OKhc4L2V9dGKs2v5GVvFVbwpWkCFlcOHdKaoio4rnNzWYa2T9/JJlDXdSddxKLEj8ou/38u7FVTCZyVkQuIf7+fqYhwVJxOJfUfBh2gWYSiUghuytHUWSc/nke570Livs1xVxPLNRQu0VJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853943; c=relaxed/simple;
	bh=THpLSUo1zbryMD/lIPlz85eBltoAEkKOC0tgM66ddBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hoej8zyunzpMkyyeelLXP52HEPIFq40d7WZj6C82lZ7qIgLsppKW/uqdVFxpD0TbR1hI9FJ+VnktChuaMo3yjYqWdbM+LpPp4VchubbZwoqs53Z2eBjXoTypRmUm6PTtAkTfCd7yzokonzE20X1QIoa3hXjRS/lqRfq6pT/p8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=COhCUnlu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="COhCUnlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750853940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQj2nZA5hc1BOiPdMuCgn0JCpLJnPCr5nB5ytIjhmS4=;
	b=COhCUnluQR/GlhfPGWkbmXZSe7lyFaH/rJHg9Eysg8W55IfDoKBJwFjZHwL14F0GosD4j5
	ZO6tA+BW92hJb1YBEBqGJHWs5szYJ8E+p+Vp/6/GtAB2keGa58Q2/+5H6+M85WoZpHyNF8
	73bw+wzZhg7XyMEywxfPwK9DKEKtKX0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-sN56K696PjybWWhJmgARIA-1; Wed,
 25 Jun 2025 08:18:57 -0400
X-MC-Unique: sN56K696PjybWWhJmgARIA-1
X-Mimecast-MFC-AGG-ID: sN56K696PjybWWhJmgARIA_1750853936
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15C0819560B5;
	Wed, 25 Jun 2025 12:18:56 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.88.237])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84C9E195E340;
	Wed, 25 Jun 2025 12:18:53 +0000 (UTC)
Date: Wed, 25 Jun 2025 08:18:50 -0400
From: Phil Auld <pauld@redhat.com>
To: Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
Message-ID: <20250625121850.GA57862@pauld.westford.csb>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi Waiman,

On Mon, Jun 23, 2025 at 01:34:58PM -0400 Waiman Long wrote:
> On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
> > The HK_TYPE_DOMAIN isolation cpumask, and further the
> > HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
> > future.
> > 
> > The affected subsystems will need to synchronize against those cpumask
> > changes so that:
> > 
> > * The reader get a coherent snapshot
> > * The housekeeping subsystem can safely propagate a cpumask update to
> >    the susbsytems after it has been published.
> > 
> > Protect against readsides that can sleep with per-cpu rwsem. Updates are
> > expected to be very rare given that CPU isolation is a niche usecase and
> > related cpuset setup happen only in preparation work. On the other hand
> > read sides can occur in more frequent paths.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Thanks for the patch series and it certainly has some good ideas. However I
> am a bit concern about the overhead of using percpu-rwsem for
> synchronization especially when the readers have to wait for the completion
> on the writer side. From my point of view, during the transition period when
> new isolated CPUs are being added or old ones being removed, the reader will
> either get the old CPU data or the new one depending on the exact timing.
> The effect the CPU selection may persist for a while after the end of the
> critical section.
> 
> Can we just rely on RCU to make sure that it either get the new one or the
> old one but nothing in between without the additional overhead?
> 
> My current thinking is to make use CPU hotplug to enable better CPU
> isolation. IOW, I would shut down the affected CPUs, change the housekeeping
> masks and then bring them back online again. That means the writer side will
> take a while to complete.

The problem with this approach is that offlining a cpu effects all the other
cpus and causes latency spikes on other low latency tasks which may already be
running on other parts of the system.

I just don't want us to finally get to dynamic isolation and have it not
usable for the usecases asking for it. 

Cheers,
Phil

> 
> Cheers,
> Longman
> 
> > ---
> >   include/linux/sched/isolation.h |  7 +++++++
> >   kernel/sched/isolation.c        | 12 ++++++++++++
> >   kernel/sched/sched.h            |  1 +
> >   3 files changed, 20 insertions(+)
> > 
> > diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> > index f98ba0d71c52..8de4f625a5c1 100644
> > --- a/include/linux/sched/isolation.h
> > +++ b/include/linux/sched/isolation.h
> > @@ -41,6 +41,9 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
> >   		return true;
> >   }
> > +extern void housekeeping_lock(void);
> > +extern void housekeeping_unlock(void);
> > +
> >   extern void __init housekeeping_init(void);
> >   #else
> > @@ -73,6 +76,8 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
> >   	return true;
> >   }
> > +static inline void housekeeping_lock(void) { }
> > +static inline void housekeeping_unlock(void) { }
> >   static inline void housekeeping_init(void) { }
> >   #endif /* CONFIG_CPU_ISOLATION */
> > @@ -84,4 +89,6 @@ static inline bool cpu_is_isolated(int cpu)
> >   	       cpuset_cpu_is_isolated(cpu);
> >   }
> > +DEFINE_LOCK_GUARD_0(housekeeping, housekeeping_lock(), housekeeping_unlock())
> > +
> >   #endif /* _LINUX_SCHED_ISOLATION_H */
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index 83cec3853864..8c02eeccea3b 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -18,12 +18,24 @@ static cpumask_var_t housekeeping_cpumasks[HK_TYPE_MAX];
> >   unsigned long housekeeping_flags;
> >   EXPORT_SYMBOL_GPL(housekeeping_flags);
> > +DEFINE_STATIC_PERCPU_RWSEM(housekeeping_pcpu_lock);
> > +
> >   bool housekeeping_enabled(enum hk_type type)
> >   {
> >   	return !!(housekeeping_flags & BIT(type));
> >   }
> >   EXPORT_SYMBOL_GPL(housekeeping_enabled);
> > +void housekeeping_lock(void)
> > +{
> > +	percpu_down_read(&housekeeping_pcpu_lock);
> > +}
> > +
> > +void housekeeping_unlock(void)
> > +{
> > +	percpu_up_read(&housekeeping_pcpu_lock);
> > +}
> > +
> >   int housekeeping_any_cpu(enum hk_type type)
> >   {
> >   	int cpu;
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 475bb5998295..0cdb560ef2f3 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -46,6 +46,7 @@
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> >   #include <linux/mutex_api.h>
> > +#include <linux/percpu-rwsem.h>
> >   #include <linux/plist.h>
> >   #include <linux/poll.h>
> >   #include <linux/proc_fs.h>
> 
> 

-- 

