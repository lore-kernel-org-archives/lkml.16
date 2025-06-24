Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3762566D9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751392; cv=none; b=YwvQhPNSlrlQxmJAdHcyKYfvmbC7TXZ7Nc4CtqzNN+eDIt9lkVJj9G0HF/NoukJuJ7XeIEhfO6HdUk4UDhJyt75yaaj18ClsCFnxQOA7SE75QJTO1dPfiKQXxt87G27Lza+4r5ALIrwfsuY3vQ7he5Pu70B26ridm2YwIrOs2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751392; c=relaxed/simple;
	bh=+790H+OZP06IcFIvm6YrSeEXldIMb9hgSxzVzG7Yysc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRM5hKbFUe+Wpbtzwhf7iGB0s84YzDqDkhwkLHi5aeDo9VqwoJig9jt2yOu8RiF1ZNTZjgGOk5uWYNX/jUDxms1Z2HWtUX1oQjvLEh0GVUYvcIyS/wBY8gi9fFXrZZJLkq4plkd8uJSjOBGfU4izHQ9/qyK4uTLIEdK81SDdIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VI/ijiW4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VI/ijiW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750751389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Up/VrTcRwD+YAjo9pT4ruHxc8Ce1CsMoQfiF4F6wCQg=;
	b=VI/ijiW4oeS6Y53Ne8B5iQ9r7AW/4W2BWKVK7gIFjV2LB0ChTBvmuEgbYwyNpydHBp/UHr
	DtdwPGrCiqr6Uqy1+WBuki0qFbeh/zFu4df+ZsRBRd+fR9/86bCV5mVRdHZO69ui4DXlFM
	wxqK5Yew2YstmcnzqChOmca4lp8QOok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-RhExCqg9OzuoWF7LCd05BQ-1; Tue, 24 Jun 2025 03:49:47 -0400
X-MC-Unique: RhExCqg9OzuoWF7LCd05BQ-1
X-Mimecast-MFC-AGG-ID: RhExCqg9OzuoWF7LCd05BQ_1750751386
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a52bfda108so51218f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751386; x=1751356186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up/VrTcRwD+YAjo9pT4ruHxc8Ce1CsMoQfiF4F6wCQg=;
        b=OxMODxuM+LckMB0+jXYAz3WQfVxJLkDjxNssPcHJQiM5CvRYDI5V+ZBqe/Bk6h8Hst
         uLIy2RBv3XSxoX0kku1H8gmJOLmDtxs0LMNXLjIDp4aF81XQkyzEBslhDnnpbSOXE27Z
         wjHYxxCKX21bwjNcgnt6N5B4MWk90T2IRbyjE7uCPhA8V6NP+Q91f5Unit0YGvz7SjWJ
         Nw16KFdS3vXyWbDhZzb0JHIil3YfQRSewBm7ZrMJojNTO/QPl0Qv+q0BdCw/8jrGYd06
         YmbCCy9JA+cyKyyqI6G+B66vF4Msr5L7cFh9wcdnXhxsrjWPwIXq0tz0D+1LIGlSFlNr
         M+3g==
X-Forwarded-Encrypted: i=1; AJvYcCXwmE3tNmndc2dYe1IxVizscZkHtnqD32xQ5wSxxKSoiqeY6tR8WLhZbdyWU6RNM0xt4trS3OH757RADbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykeN2WH4h9Bvq8jXEyTfipA6OkHXxe3gNuc3CJj5Rf9/Dkzry3
	FytVWwHqEQFJPFlIjZRp5tOHFqhsnuk33eTaS+jXRCzrfgRVo+in9HooFq0kd8kGS6CgrVOyTbY
	7NiaK7yAScOMGg95xBqNXlKQe7JHu1Gm03+44AXfB974HOfzahFDUbh12SStQWyxQSQ==
X-Gm-Gg: ASbGnct3wsoyTk8J2xdJCM2z+9LY3dd9jXhZEXkSqU52Et9G3DjyPC29k87XZ/qejli
	SM3lAMjjbQyNocKdjOXTbszmOF3a2AnmP5k4Z84EH6RIq78A1zd5q3skuQLXoyxF9frxsZi+VSv
	QK4MylOPh/zn95aqFOB6nPInb65V41iIg1U5YlZQvepCrpTtbJWMZVyMoVGn0MGsfSniHdrMpMQ
	sjxjoPoXJLSia9Oh66NPJgVj1R/iy8JiBnW9CWr+Ym8t/avm8lssSRi3x+2ao1bb7+/CSdjtl5Q
	f1ac3tberf0kmjBsCBAGW6GrLh4du8Vk5FJtQTZrpivHf8RWeKE=
X-Received: by 2002:a05:6000:20c1:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3a6d92fbb68mr5810255f8f.58.1750751386323;
        Tue, 24 Jun 2025 00:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwKdkWBcEmi1MSSCLKYuTVNaP1SUf+Ndsmkr41yqbOB+aWQLfy0QrufxA0X2CvDylZNVoU4w==
X-Received: by 2002:a05:6000:20c1:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3a6d92fbb68mr5810234f8f.58.1750751385902;
        Tue, 24 Jun 2025 00:49:45 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.4.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805eeffsm1246349f8f.34.2025.06.24.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:49:45 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:49:43 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
References: <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
 <20250620161606.2ff81fb1@nowhere>
 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
 <20250620185248.634101cc@nowhere>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620185248.634101cc@nowhere>

On 20/06/25 18:52, luca abeni wrote:
> On Fri, 20 Jun 2025 17:28:28 +0200
> Juri Lelli <juri.lelli@redhat.com> wrote:
> 
> > On 20/06/25 16:16, luca abeni wrote:
> [...]
> > > So, I had a look tying to to remember the situation... This is my
> > > current understanding:
> > > - the max_bw field should be just the maximum amount of CPU
> > > bandwidth we want to use with reclaiming... It is rt_runtime_us /
> > > rt_period_us; I guess it is cached in this field just to avoid
> > > computing it every time.
> > >   So, max_bw should be updated only when
> > >   /proc/sys/kernel/sched_rt_{runtime,period}_us are written
> > > - the extra_bw field represents an additional amount of CPU
> > > bandwidth we can reclaim on each core (the original m-GRUB
> > > algorithm just reclaimed Uinact, the utilization of inactive tasks).
> > >   It is initialized to Umax when no SCHED_DEADLINE tasks exist and  
> > 
> > Is Umax == max_bw from above?
> 
> Yes; sorry about the confusion
> 
> 
> > >   should be decreased by Ui when a task with utilization Ui becomes
> > >   SCHED_DEADLINE (and increased by Ui when the SCHED_DEADLINE task
> > >   terminates or changes scheduling policy). Since this value is
> > >   per_core, Ui is divided by the number of cores in the root
> > > domain... From what you write, I guess extra_bw is not correctly
> > >   initialized/updated when a new root domain is created?  
> > 
> > It looks like so yeah. After boot and when domains are dinamically
> > created. But, I am still not 100%, I only see weird numbers that I
> > struggle to relate with what you say above. :)
> 
> BTW, when running some tests on different machines I think I found out
> that 6.11 does not exhibit this issue (this needs to be confirmed, I am
> working on reproducing the test with different kernels on the same
> machine)
> 
> If I manage to reproduce this result, I think I can run a bisect to the
> commit introducing the issue (git is telling me that I'll need about 15
> tests :)
> So, stay tuned...

The following seem to at least cure the problem after boot. Things are
still broken after cpusets creation. Moving to look into that, but
wanted to share where I am so that we don't duplicate work.

Rationale for the below is that we currently end up calling
__dl_update() with 'cpus' that are not stable yet. So, I tried to move
initialization after SMP is up (all CPUs have been onlined).

---
 kernel/sched/core.c     |  3 +++
 kernel/sched/deadline.c | 39 +++++++++++++++++++++++----------------
 kernel/sched/sched.h    |  1 +
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a38..d152f8a84818b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8470,6 +8470,8 @@ void __init sched_init_smp(void)
 	init_sched_rt_class();
 	init_sched_dl_class();
 
+	sched_init_dl_servers();
+
 	sched_smp_initialized = true;
 }
 
@@ -8484,6 +8486,7 @@ early_initcall(migration_init);
 void __init sched_init_smp(void)
 {
 	sched_init_granularity();
+	sched_init_dl_servers();
 }
 #endif /* CONFIG_SMP */
 
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245e..9f3b3f3592a58 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1647,22 +1647,6 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 {
 	struct rq *rq = dl_se->rq;
 
-	/*
-	 * XXX: the apply do not work fine at the init phase for the
-	 * fair server because things are not yet set. We need to improve
-	 * this before getting generic.
-	 */
-	if (!dl_server(dl_se)) {
-		u64 runtime =  50 * NSEC_PER_MSEC;
-		u64 period = 1000 * NSEC_PER_MSEC;
-
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
-		dl_se->dl_server = 1;
-		dl_se->dl_defer = 1;
-		setup_new_dl_entity(dl_se);
-	}
-
 	if (!dl_se->dl_runtime)
 		return;
 
@@ -1693,6 +1677,29 @@ void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 	dl_se->server_pick_task = pick_task;
 }
 
+void sched_init_dl_servers(void)
+{
+	int cpu;
+	struct rq *rq;
+	struct sched_dl_entity *dl_se;
+
+	for_each_online_cpu(cpu) {
+		u64 runtime =  50 * NSEC_PER_MSEC;
+		u64 period = 1000 * NSEC_PER_MSEC;
+
+		rq = cpu_rq(cpu);
+		dl_se = &rq->fair_server;
+
+		WARN_ON(dl_server(dl_se));
+
+		dl_server_apply_params(dl_se, runtime, period, 1);
+
+		dl_se->dl_server = 1;
+		dl_se->dl_defer = 1;
+		setup_new_dl_entity(dl_se);
+	}
+}
+
 void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq)
 {
 	u64 new_bw = dl_se->dl_bw;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295e..22301c28a5d2d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -384,6 +384,7 @@ extern void dl_server_stop(struct sched_dl_entity *dl_se);
 extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
+extern void sched_init_dl_servers(void);
 
 extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p);
-- 
2.49.0

