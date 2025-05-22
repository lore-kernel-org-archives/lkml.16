Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E9728D8C8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926047; cv=none; b=lXjNqZw9OIPBentZs7VIWns2ymYOcI08ye5nhrbq0XiGT4gwpXhFbGkrb+xtxJb6rn44/cJ1M37iMVYDfnXaBfl3G1kVGgsyCecEhUPj0cM8NXWAMk5QXWGWew46T2wS1YmLqqEzqOpust1L0wgvZhsBlWap3vFU13It8+e4Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926047; c=relaxed/simple;
	bh=INqSYwIkBzquXHjZjpFokyd/V+TNZVV2+cCBbLXvxuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UU4vOaZE13SwY+KaE8YmbwioW2r5oItW36jJh5PJApqHK2UPZ9hpv0y99rttuYQjNSgg1gMbBWRYobasREkxYwsi3SXaydszh1WEVagvdIUPrwW+ZUpiiCsP/zWlH7vjpxywPmhEGEfXlTqRGcvaw7UFulHGlvOgko/wodyJQo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=angnlFix; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="angnlFix"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e1b40f68so959587785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747926043; x=1748530843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RntcQFrhCFAacTrxQLWTJkPF8ANO7nKuaZmsqGHxdlg=;
        b=angnlFix9LPmMZd4MBvOzfHsyFfXotcTH4a2eCRWkyiFJvISnTHcm7n0uhIZlHSRss
         vtPy4xRwiEaeEAa5MxMto1WJFYZFForStysRXjuXngjf715qu+lPiKACZ9xqI1fw25yL
         IxkfJZWczUEK/9qj5U4keFLp2L+xNV3OO+yEKBInwMc372SEzfdAtt1JQUMe+dkGHwT9
         +cAVTVQHF4yqjzSn/LEXR2Cbmt01l0l6F4D+AdqWPame3f8iusb6HtZybHijGT0d7e/Z
         C+I3xpj9UyW+YsE96s3cXaioYF/tOh7PlaZJzpzybLkqNnbXvMUsvudA17H9gDGhab6t
         7qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926043; x=1748530843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RntcQFrhCFAacTrxQLWTJkPF8ANO7nKuaZmsqGHxdlg=;
        b=lWBA2st18t8gKkQCGuZfpjp3Y6AlAwtGvcLIsz02dRFe5zSjUkb7os2o0ZmyrARoeG
         FFQFnIRQG49iATIIL/FozqnhwWXJr4hDluDr0vrl/m84FE/soohvkwxtTh4atL9rDAYn
         ertqB6pWQysduHuTrZDJruyHSzIkAgyzz29VIXBBBusQFfaxVXfaKIZodvlaMzk3jz9C
         RP69Kk9tw6BRTVo/lYK5MRB4mAhfKMW5/Nt5DYvIl0KFAVM9cQn561FOdnoWlGmgnObA
         pIox70KZ1MqqQyZz+bJc2DVXsR6FoZW8wa0Gi4WKOIiQnODu1W7ATxGEhzxj8SHjpk5e
         JSew==
X-Forwarded-Encrypted: i=1; AJvYcCV8DZDMJAUfclw3z/aCnWXatcr62Kn+jmkxvgOrr2qraoLgY5+VQLcakeIYVjX8WDClOeyYa6dxJ5ndxlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztyKI6Vp5/Z6Z0XQfrZ3OjxdLjEME2YSlSL/lrSUg4WoThRQB5
	fZ6s+zB06OzxqK+V617nGpBjqUiUB1Ihh2R4v4+20jV+wXiaXz0nMuhNAJKlFy7HJXg=
X-Gm-Gg: ASbGnctGZViMJfuqW49goSoaqD2T3obJ5Ch4Q9e7apP9HXIBctcQx6eOO7MVz0wKTBi
	UDqERWeV7LQdBjmXvCWsA6zkFd+/LbEVDQWudpanGOHoS5Qh9XXsoCwm8yBOkrEoX7QapHqZ56J
	tBLJNFYqqKjKVDeYvLdGWitnj6MnVfGvwBFMWqLwpY9jfNQ3xPM782Ah2SqbePiM3TtfU5PgLdo
	ONytKclkmZ6Np2roEUi2dkf6IWqp8MfbzfNOTC53XuYvceIhPQlg7PMFv2jD8yWsbVSU461nBAO
	tF7/jiVyL28OSgPrFSoTbwCX0DDeD+dlIIqZBtPwKHQJ9rMt7w==
X-Google-Smtp-Source: AGHT+IEnJzZ79njSENk+JeuZPwPZwL2+OpjoVsTKNGaJ/y+nMe65TH53vU6mRb8uFnxwB48phhewPQ==
X-Received: by 2002:a05:620a:2845:b0:7c5:61b2:b7c with SMTP id af79cd13be357-7cd467bec25mr4234754385a.47.1747926040353;
        Thu, 22 May 2025 08:00:40 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468e5c38sm1030602085a.115.2025.05.22.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:00:39 -0700 (PDT)
Date: Thu, 22 May 2025 11:00:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Chris Mason <clm@meta.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250522150035.GB1065351@cmpxchg.org>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <20250521145447.GA31726@noisy.programming.kicks-ass.net>
 <20250522084844.GC31726@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522084844.GC31726@noisy.programming.kicks-ass.net>

On Thu, May 22, 2025 at 10:48:44AM +0200, Peter Zijlstra wrote:
> On Wed, May 21, 2025 at 04:54:47PM +0200, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 09:38:31PM +0200, Peter Zijlstra wrote:
> > > On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> > > 
> > > > 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> > > > 
> > > > With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> > > > 4 times per task switch in my setup) in:
> > > > 
> > > > __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> > > > psi_group_change().
> > > > 
> > > > There seems to be another/other v6.12 related patch(es) later which
> > > > cause(s) another 4% regression I yet have to discover.
> > > 
> > > Urgh, let me add this to the pile to look at. Thanks!
> > 
> > Does something like the compile tested only hackery below work?
> 
> possibly better hackery :-)
> 
> ---
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index 1396674fa722..8fb9d28f2bc8 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -136,6 +136,10 @@
>   * cost-wise, yet way more sensitive and accurate than periodic
>   * sampling of the aggregate task states would be.
>   */
> +#include <linux/sched/clock.h>
> +#include <linux/workqueue.h>
> +#include <linux/psi.h>
> +#include "sched.h"
>  
>  static int psi_bug __read_mostly;
>  
> @@ -172,6 +176,30 @@ struct psi_group psi_system = {
>  	.pcpu = &system_group_pcpu,
>  };
>  
> +static inline void psi_write_begin(int cpu)
> +{
> +	struct psi_group_cpu *groupc = per_cpu_ptr(&system_group_pcpu, cpu);
> +	write_seqcount_begin(&groupc->seq);

Ah right, since all the ancestor walks would ultimately end up at the
system's seq anyway. And always have, really.

It does stretch the critical section, of course. I ran perf bench
sched messaging to saturate all CPUs in state changes and then read a
pressure file 1000x. This is on a 32-way machine:

     0.18%     +1.34%  [kernel.kallsyms]     [k] collect_percpu_times

and annotation shows it's indeed retrying on the seq-read a bit more.

But that seems well within tolerance, and obviously worth it assuming
it fixes the cpu_clock() regression on the sched side.

At that point, though, it probably makes sense to move seq out of
psi_group_cpu altogether? More for clarity, really - it won't save
much right away given that deliberate 2-cacheline-layout.

/* Serializes task state changes against aggregation runs */
static DEFINE_PER_CPU(seqcount_t, psi_seq);

Otherwise, the patch looks great to me. Thanks for including a couple
of cleanups as well.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
