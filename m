Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00092747B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985344; cv=none; b=UoQsiZNpTImG/VscIU0nUJN6DlDMDbPd5fcbe/ylxpQ79XdWS2GCRO/YXXkm8ETwc5u/uWCGXsQQZGpu9wK2qAV3cjYhuzgWOQK2cb45DAW4V6VuzO4VfAbXeW4TdixKDgfpxOdbUvYshTtMEjsS8Uj+DY9tD1aHX80y8RUZnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985344; c=relaxed/simple;
	bh=y3AmZRizhCYu2Dn2RysfKaGz8kN/CPxFAiMyRDa+2Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXL1dWWE4Mu1pqnfhq6MZgynTipHW45DhqzxUGPWRZVatTI9NXV6N1bCERxoJ+29NYWE2d8ZMu30to2kUEebvESHVE3OzvlifDdh8yKDKlqJMm9EE+a168T7fyWA53MU1fydrI7r5dJvSLvqoKa8SypceSfAN9Jwm/ktNGEiaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FayOwSZp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FayOwSZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750985342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLA+OYU1ylbvB7vJ0ft6aI2rAS7z7d9CDwxTqg9DYJE=;
	b=FayOwSZpYGW/Vr0YI74vsPyuzFrzssmG7uVyd0EIBpmZHKcsqe7VBQPDRiwpGcg9JiUWSP
	qv5ey//dutrhpb68LnoN5AgYdlX4qepXf/d2oyalgN8RzwY3dhFyqrM1tItsh3YOtMNHfY
	lJNiLUFihRzCssmBXkPagjt60f/8PXQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-oZyMqZ-7M8inndEbKaFkmQ-1; Thu,
 26 Jun 2025 20:48:58 -0400
X-MC-Unique: oZyMqZ-7M8inndEbKaFkmQ-1
X-Mimecast-MFC-AGG-ID: oZyMqZ-7M8inndEbKaFkmQ_1750985337
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 843FB19560B9;
	Fri, 27 Jun 2025 00:48:56 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.82.105])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58736195609D;
	Fri, 27 Jun 2025 00:48:54 +0000 (UTC)
Date: Thu, 26 Jun 2025 20:48:51 -0400
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
Message-ID: <20250627004851.GB222768@pauld.westford.csb>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <20250625121850.GA57862@pauld.westford.csb>
 <aFwI6sCtObAGoMBt@localhost.localdomain>
 <20250625155017.GC57862@pauld.westford.csb>
 <c205b6a8-89ee-424e-ac83-94584d59a449@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c205b6a8-89ee-424e-ac83-94584d59a449@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Thu, Jun 26, 2025 at 08:11:54PM -0400 Waiman Long wrote:
> On 6/25/25 11:50 AM, Phil Auld wrote:
> > On Wed, Jun 25, 2025 at 04:34:18PM +0200 Frederic Weisbecker wrote:
> > > Le Wed, Jun 25, 2025 at 08:18:50AM -0400, Phil Auld a écrit :
> > > > Hi Waiman,
> > > > 
> > > > On Mon, Jun 23, 2025 at 01:34:58PM -0400 Waiman Long wrote:
> > > > > On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
> > > > > > The HK_TYPE_DOMAIN isolation cpumask, and further the
> > > > > > HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
> > > > > > future.
> > > > > > 
> > > > > > The affected subsystems will need to synchronize against those cpumask
> > > > > > changes so that:
> > > > > > 
> > > > > > * The reader get a coherent snapshot
> > > > > > * The housekeeping subsystem can safely propagate a cpumask update to
> > > > > >     the susbsytems after it has been published.
> > > > > > 
> > > > > > Protect against readsides that can sleep with per-cpu rwsem. Updates are
> > > > > > expected to be very rare given that CPU isolation is a niche usecase and
> > > > > > related cpuset setup happen only in preparation work. On the other hand
> > > > > > read sides can occur in more frequent paths.
> > > > > > 
> > > > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > > > Thanks for the patch series and it certainly has some good ideas. However I
> > > > > am a bit concern about the overhead of using percpu-rwsem for
> > > > > synchronization especially when the readers have to wait for the completion
> > > > > on the writer side. From my point of view, during the transition period when
> > > > > new isolated CPUs are being added or old ones being removed, the reader will
> > > > > either get the old CPU data or the new one depending on the exact timing.
> > > > > The effect the CPU selection may persist for a while after the end of the
> > > > > critical section.
> > > > > 
> > > > > Can we just rely on RCU to make sure that it either get the new one or the
> > > > > old one but nothing in between without the additional overhead?
> > > > > 
> > > > > My current thinking is to make use CPU hotplug to enable better CPU
> > > > > isolation. IOW, I would shut down the affected CPUs, change the housekeeping
> > > > > masks and then bring them back online again. That means the writer side will
> > > > > take a while to complete.
> > > > The problem with this approach is that offlining a cpu effects all the other
> > > > cpus and causes latency spikes on other low latency tasks which may already be
> > > > running on other parts of the system.
> > > > 
> > > > I just don't want us to finally get to dynamic isolation and have it not
> > > > usable for the usecases asking for it.
> > > We'll have to discuss that eventually because that's the plan for nohz_full.
> > > We can work around the stop machine rendez-vous on nohz_full if that's the
> > > problem. If the issue is not to interrupt common RT-tasks, then that's a
> > > different problem for which I don't have a solution.
> > > 
> > My understanding is that it's the stop machine issue. If you have a way
> > around that then great!
> 
> My current thinking is to just run a selected set of CPUHP teardown and
> startup methods relevant to housekeeping cpumasks usage without calling the
> full set from CPUHP_ONLINE to CPUHP_OFFLINE. I don't know if it is possible
> or not or how much additional changes will be needed to make that possible.
> That will skip the CPUHP_TEARDOWN_CPU teardown method that is likely the
> cause of most the latency spike experienced by other CPUs.
>

Yes, CPUHP_TEARDOWN_CPU is the source of the stop_machine I believe.

It'll be interesting to see if you can safely use the cpuhp machinery
selectively like that :)

Cheers,
Phil

> Cheers,
> Longman
> 

-- 

