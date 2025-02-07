Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84D1E0DE5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931109; cv=none; b=OhaDrHVVwqDChhLTMN8JGFNLctJJQEl88YVyKpO0YX2usT0QHE2oaP8y7kVVKaFtuHH+wjx6bzjNUTH7IhDCA/qBiIoxzLCRhu10gSCOF3nd/iAzbAyhekmdjM8g20pJiA479nwhrr6zK+dHI2ixW+KVi7IrObY2YLROellLAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931109; c=relaxed/simple;
	bh=YRb6AeOz1RqLmzMCWVfuqJ1sWZSxZBHIwyWEGJnMSpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDuOnovrSv0HYXfeba4Kcz3LvOYudJZict9hyArQavXkm4mdL8zm0hS9MhD1PgG2+cnyPg0irg6AzamWQaNy0z1LRM0uV22TrDavojopL8lUOT+joshtzPfPDjtotYvzEcKf9atDAKyxTV7Tm6qSIlZjxrgSc0yJRX6gzYffMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc660b56cso1076473f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931106; x=1739535906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Br3Loe5xkO2tw+VOvibWqFKoDDBPsOAhDYLOuWOSM4=;
        b=vHLvkyCMUvjM4q9ggj5mCl8yCZc+yTMgXxbFO4mvzuiHprD4TffRQy+QQ6c24q74cp
         GrXZaXwtIIMsevJpd39jch0W1LWCR1rMgGUHNaNUZACz/2WjFkgSFXXJAogh8hEVIo62
         G+maEEXIO4BGJ/WMierJ+6azlfo34Zq+Z3wUyv42KAyc3Y1JQjGmXokSKfrC3R/PDSMD
         l8e1dOdd8h4fyJJCsHdIQOuWNflQg8FwwmX6UqrXwnuWrFejZFcrdK6aHMWNLWS/BJhB
         sVaEFXe5WG7qS+b3GkjuwMcpSCPxMVD8Y+LNhwNisxRd5b6QSRVNXqOr3ymcMfiDsT1H
         BwSw==
X-Forwarded-Encrypted: i=1; AJvYcCUnE9cukVHL2XNHSwkV8oVASnELxbaGnZJnBuDgIF968Pgiy9POaIqeP98j5cpd1XvCewX2LeXuC94RKts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LhGoTmldsFGqfL3eioRqTMkBifM5GVZJepS7CptdJQgP4woa
	zPOFf4LM8JWSkZeX12bO9eAVu6nLBiQl+837o6hJQQ6ESC7x3s2X
X-Gm-Gg: ASbGncteEanoPu7CllDs6tr4xlR3qld6Iw4wb8qPNw1Dc2ArWcwraxK9/BgS63q/b8E
	o73Yar+acGq8PmsviDiDSkv17z6xKAmaoM9+ua8lfIOcNJ3z7UP62KuViZkbCC1jsn2ZJvZjYHL
	zMFoXATBNSLTKlnnKCgSpLdwlObVQMmTla/HftuYLOJoTkniLl7a2Htm73mI5nKi07nb5rkN2tA
	A8/J8bXq3jeoodtnrViqZhcXSlGqBO7Q0CywHwmx4ozQaaPOvjhquRqdCIsxXKBzyyJJdSfgj3L
	2BIXRA==
X-Google-Smtp-Source: AGHT+IH7DOIpj6/qlVtnMj01ml1oRAUIZ2yKNO7QyAzuAHGlzzHzw2o/AxRJsDZB6z7IfPtnZc7W6g==
X-Received: by 2002:a5d:64a1:0:b0:38d:ca76:9e73 with SMTP id ffacd0b85a97d-38dca76a03fmr1894034f8f.47.1738931105547;
        Fri, 07 Feb 2025 04:25:05 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f84400sm260858866b.57.2025.02.07.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 04:25:05 -0800 (PST)
Date: Fri, 7 Feb 2025 04:25:02 -0800
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
Message-ID: <20250207-tunneling-tested-koel-c59d33@leitao>
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

Hello Peter,

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

Thanks for the quick answer. I will pick it on top of our tree, and
start rolling it to those 1k hosts I have been playing with.

I haven't seen this patch in stable. Is it queue up for the next
submission for stable?
