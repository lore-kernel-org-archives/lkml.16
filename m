Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E91E5B80
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935507; cv=none; b=lTpHoUnOhFSQNYQJZWsuCRyVFCj3I/c63UEDLAN0MO/t5hY4GxEEejOh3f7Jp0Cd5+7ZXvNx2THSQ9DdxX4lP29bBv2U97YIJ3QdRUKnuZzD8KPJqnRImO9MTK/L4cFkNt6NFbqEPiriFm/BhwmrtoAHRHSTG08901WDYKAb1Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935507; c=relaxed/simple;
	bh=7w/VYo91XaWPlrqMfBfdFW53J2iX/Ick6Q62makHB8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F81V0wwR37CYL1zd3jIMRRb1nFd8EYUeo53a8+eUFYcJlf6Swmkuyf8TeoESEpJpuuzLT8rav/9lrQarOZGbkkX6UglPN0/LtK4b4Jvhsswzcbu3pcMSdhjWaMy8uPx1B3skCJQQOrBfZ+y2d+RvsiQvC+1kkQM64M9q8q/N+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7800d3939so239364466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935504; x=1739540304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0X8gVoDe7vIzF+gIW8hQnlqRHQXAuaBqjbVYkejeMI=;
        b=jmu99AApxG27QGLgJ8H/r7w29MRIQg46vR4FOmnOOPX8M6zr51pZ2gX6DA1VgECoWH
         ikvY/faK9j8887BwbU4G6F1k4WQJEJ//xsHgJYItvPt3EHrDYAOHuFXjeiAAGyMWZgYS
         sZO1nevpw4NhO26mUCMgUk/Z+mESsxM14Zwg/MYoI/y8qa3u8bDWvktTrWSwjGWwV6s1
         7fJUeXgge1amxxDeoVQi8Lel/Kk/DoYPf18SnIlD/ypUFlg/3015qtgYwoq5TmY9bllI
         0w92e/HqWdqZBFH52Uv+rol4nUE3bH4DimrJDN+rSmjt5nMym3tj5QD3xi8P/NS9X6jl
         DKtg==
X-Forwarded-Encrypted: i=1; AJvYcCVLbb7I6iVqLDBqCPH5SO9pJVa/dahIxSGwEAShSOxAMnXCE/V+IfPDfBOqZ4Sm2+OewlRfQV3msipRly4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxebLsgbEJVssi8Q0atPb9lt3b6p6NBCW1KxvRvT96/i4u88eIo
	rhPiH4nkT5Wkn/2dg+g5mK6Ev5ADSf0ghxuiMQJNdQb3Uzqye/5E
X-Gm-Gg: ASbGnctD81twgVUMv9QGKh21DVLaS4sRgwYCtztq0rnYXuWisysAdICBiYXYvx2R5ew
	0F+PFo/vUVriraury781gHaBfriMzQx7i6z6q9pa6fgudYX+iB34vZ+yAEO4Be5if/JJgCtQ5yq
	UXj8hIAMjs3aSMCWVMRW025x+tCOfzsTToukofZmidO8GR/HIJiX7ZbGLqsdIWoCm72UePc4G7t
	uGHXzZ6ROJ2no3xp4aN92PNcDwjpbt3tvcA4sbwf8VwEnJ6l8yVh6rgvsQ5fWHkKCbZ94Xqnq3h
	VulEIzo=
X-Google-Smtp-Source: AGHT+IEdE5/8O4dXlE06WxX4TZ0D6F7HzCbiOIyWPvUz9f9czdsHfjs/CXklXvMq2tGOHvBZ1Q0CoA==
X-Received: by 2002:a17:906:c146:b0:aa6:acd6:b30d with SMTP id a640c23a62f3a-ab789c4da99mr260995366b.48.1738935504141;
        Fri, 07 Feb 2025 05:38:24 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77efe3111sm209129866b.51.2025.02.07.05.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:38:22 -0800 (PST)
Date: Fri, 7 Feb 2025 05:38:20 -0800
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
	qyousef@layalina.io, chris.hyser@oracle.com,
	patrick.bellasi@matbug.net, pjt@google.com, pavel@ucw.cz,
	qperret@google.com, tim.c.chen@linux.intel.com, joshdon@google.com,
	timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com,
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de,
	tglx@linutronix.de, kernel-team@meta.com
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
Message-ID: <20250207-economic-complex-rottweiler-ccc45f@leitao>
References: <20230531115839.089944915@infradead.org>
 <20230531124603.794929315@infradead.org>
 <20250207-petite-eminent-husky-7d1704@leitao>
 <20250207111141.GD7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207111141.GD7145@noisy.programming.kicks-ass.net>

On Fri, Feb 07, 2025 at 12:11:41PM +0100, Peter Zijlstra wrote:
> On Fri, Feb 07, 2025 at 02:07:18AM -0800, Breno Leitao wrote:
> > Hello Peter,
> > 
> > On Wed, May 31, 2023 at 01:58:42PM +0200, Peter Zijlstra wrote:
> > >
> > >  place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int initial)
> > >  {
> > <snip>
> > > -		vruntime -= thresh;
> > > +		lag *= load + se->load.weight;
> > > +		if (WARN_ON_ONCE(!load))
> > 
> > I have 6.13 running on some hosts, and in some cases, where the system
> > is getting some OOMs, I see the following stack:
> > 
> >           WARNING: CPU: 29 PID: 593474 at kernel/sched/fair.c:5250 place_entity+0x199/0x1b0
> > 
> >            Call Trace:
> >             <TASK>
> >             ? place_entity+0x199/0x1b0
> >             reweight_entity+0x188/0x200
> >             enqueue_task_fair.llvm.15448040313737105663+0x28c/0x560
> >             enqueue_task+0x30/0x120
> >             ttwu_do_activate+0x99/0x230
> >             try_to_wake_up+0x25a/0x4a0
> >             ? hrtimer_dummy_timeout+0x10/0x10
> >             hrtimer_wakeup+0x25/0x30
> >             __hrtimer_run_queues+0xf1/0x250
> >             hrtimer_interrupt+0xfb/0x220
> >             __sysvec_apic_timer_interrupt+0x47/0x140
> >             sysvec_apic_timer_interrupt+0x35/0x80
> >             asm_sysvec_apic_timer_interrupt+0x16/0x20
> > 
> > I am sorry for not decoding the stack, but I am having a hard time
> > decoding the stack properly. The values I got was misleading, and I am
> > working to understand what is happening.
> > 
> > Anyway, I don't have a reproducer and this problem doesn't happen
> > frequent enough. I have 1K hosts with 6.13 and I saw it 5 times in the
> > last week.
> 
> Weird. Would you mind trying with the below patch on top?

I tried to get this patch on top of latest 6.13 stable (6.13.1), and it
seems it misses some dependencies in stable. Field cfs_rq->nr_queued
don't exist in 6.13, it was added/renamed later by 736c55a02c477a
("sched/fair: Rename cfs_rq.nr_running into nr_queued").

Is it safe to just s/nr_queued/nr_running in our patch?

Thanks
