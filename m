Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB8201270
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988555; cv=none; b=izgUlGROPg9aHd4phT5T8Pp+CONR52ISBKlrbkSY7HoQPEj8Dq3sLnfoxZEyS5lfAIZCNs7ap1KY9tKc/awVQdnc1i9K5qg7NS1QukRIRXYqPa14PvhJ2DxT9KnmFKOk//NZ7Ol/Br5vgVhoiWoJBU5VGcMCnj6w0hMjrQA6nuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988555; c=relaxed/simple;
	bh=1D0CMx3RB5PP/TuxOlDPnB3079/Z4dAnHuBK+0kYVxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ii3smS3DTQIuJmtMbXD+0YsjzXIWIKqJFvKxddnZdKZrejuUIZT5c7IypoWdQwKwQzcJh4cmCEx20Sz63CAH4xstudDMHGJU0jIQr5DqBJSuVFnSHphmXJtxPXcnEiZwFglZrpX8EX+wLY48mg6o6pV/lNfyGFiB9+kJM4KN4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rb8fxRy0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rb8fxRy0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac29fd22163so303451766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744988552; x=1745593352; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZplAbuCJ93+qljEScFSyxJVW4G0IymGWM3hz2fkUeK0=;
        b=rb8fxRy05skrMSmg/ChSQJi8ws9XbkmXNU2zCNQJbUfkZk0w6KuGZug9gxEjTY9iSY
         1TuvNUdo+GlVFEvLtnUJqiAhaQyV2xgfTI3R/pDGtonNzZ99O3b6/osaNvtVshwpEgjg
         BQYfhVt9b4acUMLMQkWwoPK+lsll6oOgTfbh59+aEWqhy9VEYVAj0kmJgaiDgxu/lDeU
         Y/u4kVNfttleDMARRpqACzqwm0udXgV4ihHpRvNtR+yE5LbFKkfUajWt1rb1EZOFWUZp
         l4G6KgtB39XrZrGDMZr0toBjtBXY/e4GHxG8YitrcfxF99SaHUKEefOK6jJ1t0BKFefw
         Fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988552; x=1745593352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZplAbuCJ93+qljEScFSyxJVW4G0IymGWM3hz2fkUeK0=;
        b=Au1DUL70qywltQB+yaOD72KhM08jaX35pjFjBFg8UQXBDpCsbHlLmdpB+2HkQ65wNG
         s8YshBG2SLG5VwoGQ8ABX+poowGw/xANYX4CSGqmOoc+3m5sK9LoTnYrClXCyFjZ3Zmn
         GfgiOrl4qpPOiDnL7c2yqDL116MeOIVChxs9E1ZJztDT2ec9P5fIWzbvtd+mKYZb8meH
         7BJB8tSJH/6hm17wYKJyQMAewHZWcTqhgpagA0PPezosBL7QnafKWNg82eB6DJp5y3PL
         5QpH9PWLdrfMLdCkTBJTBR5BT2UL+pqxy0nKl8VR+xJWSiPahOtQZGny4EAN2aLKLHZ1
         cz0A==
X-Forwarded-Encrypted: i=1; AJvYcCVMfnSnZxzf52BiDHSwpfWxlhaWEX04KqGfttH5qCpMWqMjNScrGr8ur4jSgjp9BBQ0NF8JS3dIq+iTExc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2M7AbS+b0xAtjPRgPcyqYPMOvMoBwMrpVC1YRtV31h69UXb/
	ngURUW8PaBSAKXRvJGIwwb5vC0eAcBS+H48RXO/emRHtfyZTPkjxA2xiuUv0+QYGjLcvsKmGnNl
	Ogx/fKO9VJdruL2eUtUQTfJfxbfuw/Z8MjXIR3g==
X-Gm-Gg: ASbGnctbZwo1dAg+xnnS7zm9dU38ECCH7bS2xlUuoZJJUxC4TRhSDHPbYl8VenlsViK
	Hg+VpbfBC2IzaNYS0sQ2mQtmal9lSqtdCJpwLIfS0CJoJjOuDATbCQzdzrsHMZu++INQahDUzKc
	K4tbOZjxOFfdpIcNjidTr/4TFiXksKU2BHDAn1gwiPvWB1rJSaju86LUbw66C2xQ==
X-Google-Smtp-Source: AGHT+IGZqkKlBRi+5duZiiPxTdEZgVaXqi19EF+iCxqAUD4Gl6pyXMH9+JJokhmRdLI5k5+PS409YhAPBPaU2Wjp4wM=
X-Received: by 2002:a17:907:9801:b0:ac6:cea2:6c7 with SMTP id
 a640c23a62f3a-acb74d65b00mr246575066b.42.1744988551493; Fri, 18 Apr 2025
 08:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com> <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com> <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com> <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
In-Reply-To: <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Apr 2025 17:02:19 +0200
X-Gm-Features: ATxdqUEk-F-J3gRNxEfYslnzPYWvnD0i_CLwt3xKWwakFgq2Rbc-uiPpqJrs8iI
Message-ID: <CAKfTPtDcFTGai=HsFUgrrUWZ-Dxq0D3RtCSSVsyXaXBXc2W=sw@mail.gmail.com>
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Doug Nelson <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 16:14, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>
>
>
> On 4/16/25 15:17, Vincent Guittot wrote:
> > On Wed, 16 Apr 2025 at 11:29, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
> >>
> >>
> >>
> >> On 4/16/25 14:46, Shrikanth Hegde wrote:
> >>>
> >>>
> >>> On 4/16/25 11:58, Chen, Yu C wrote:
> >>>> Hi Shrikanth,
> >>>>
> >>>> On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
> >>>>>
> >>>>>
> >>>>> On 4/16/25 09:28, Tim Chen wrote:
> >>>>>> At load balance time, balance of last level cache domains and
> >>>>>> above needs to be serialized. The scheduler checks the atomic var
> >>>>>> sched_balance_running first and then see if time is due for a load
> >>>>>> balance. This is an expensive operation as multiple CPUs can attempt
> >>>>>> sched_balance_running acquisition at the same time.
> >>>>>>
> >>>>>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> >>>>>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> >>>>>> sched_balance_running.  Most of the time, a balance attempt is aborted
> >>>>>> immediately after acquiring sched_balance_running as load balance time
> >>>>>> is not due.
> >>>>>>
> >>>>>> Instead, check balance due time first before acquiring
> >>>>>> sched_balance_running. This skips many useless acquisitions
> >>>>>> of sched_balance_running and knocks the 7.6% CPU overhead on
> >>>>>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> >>>>>> improved by 11%.
> >>>>>>
> >>>>>
> >>>>> Hi Tim.
> >>>>>
> >>>>> Time check makes sense specially on large systems mainly due to
> >>>>> NEWIDLE balance.
> >>>
> >>> scratch the NEWLY_IDLE part from that comment.
> >>>
> >>>>>
> >>>>
> >>>> Could you elaborate a little on this statement? There is no timeout
> >>>> mechanism like periodic load balancer for the NEWLY_IDLE, right?
> >>>
> >>> Yes. NEWLY_IDLE is very opportunistic.
> >>>
> >>>>
> >>>>> One more point to add, A lot of time, the CPU which acquired
> >>>>> sched_balance_running,
> >>>>> need not end up doing the load balance, since it not the CPU meant to
> >>>>> do the load balance.
> >>>>>
> >>>>> This thread.
> >>>>> https://lore.kernel.org/all/1e43e783-55e7-417f-
> >>>>> a1a7-503229eb163a@linux.ibm.com/
> >>>>>
> >>>>>
> >>>>> Best thing probably is to acquire it if this CPU has passed the time
> >>>>> check and as well it is
> >>>>> actually going to do load balance.
> >>>>>
> >>>>>
> >>>>
> >>>> This is a good point, and we might only want to deal with periodic load
> >>>> balancer rather than NEWLY_IDLE balance. Because the latter is too
> >>>> frequent and contention on the sched_balance_running might introduce
> >>>> high cache contention.
> >>>>
> >>>
> >>> But NEWLY_IDLE doesn't serialize using sched_balance_running and can
> >>> endup consuming a lot of cycles. But if we serialize using
> >>> sched_balance_running, it would definitely cause a lot contention as is.
> >>>
> >>>
> >>> The point was, before acquiring it, it would be better if this CPU is
> >>> definite to do the load balance. Else there are chances to miss the
> >>> actual load balance.
> >>>
> >>>
> >>
> >> Sorry, forgot to add.
> >>
> >> Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
> >> the regular (idle) can take care for NUMA by serializing it?
> >>
> >> -               if (sd->flags & SD_BALANCE_NEWIDLE) {
> >> +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {
> >
> > Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
> > set SD_SERIALIZE
>
> Hi Vincent.
>
> There is even kernel parameter "relax_domain_level" which one can make use of.
> concern was newidle does this without acquiring the sched_balance_running,
> while busy,idle try to acquire this for NUMA.
>
>
>
> Slightly different topic: It(kernel parameter) also resets SHCED_BALANCE_WAKE. But is it being used?
> I couldn't find out how it is used.

Hi Shrikanth,

The define below does the link

#define WF_TTWU 0x08 /* Wakeup;            maps to SD_BALANCE_WAKE */

int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
..
  wake_flags |= WF_TTWU;
..
  cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
        select_task_rq_fair()
          int sd_flag = wake_flags & 0xF;
..
          for_each_domain(cpu, tmp) {
..
            if (tmp->flags & sd_flag)

>
> >
> >>
> >>                           pulled_task = sched_balance_rq(this_cpu, this_rq,
> >>                                                      sd, CPU_NEWLY_IDLE,
> >>
> >>
> >> Anyways, having a policy around this SD_SERIALIZE would be a good thing.
> >>
> >>>> thanks,
> >>>> Chenyu
> >>>>
> >>>>>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>>>>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> >>>>>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
> >>>>>> ---
> >>>>>>    kernel/sched/fair.c | 16 ++++++++--------
> >>>>>>    1 file changed, 8 insertions(+), 8 deletions(-)
> >>>>>>
> >>>>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >>>>>> index e43993a4e580..5e5f7a770b2f 100644
> >>>>>> --- a/kernel/sched/fair.c
> >>>>>> +++ b/kernel/sched/fair.c
> >>>>>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct
> >>>>>> rq *rq, enum cpu_idle_type idle)
> >>>>>>            interval = get_sd_balance_interval(sd, busy);
> >>>>>> -        need_serialize = sd->flags & SD_SERIALIZE;
> >>>>>> -        if (need_serialize) {
> >>>>>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> >>>>>> -                goto out;
> >>>>>> -        }
> >>>>>> -
> >>>>>>            if (time_after_eq(jiffies, sd->last_balance + interval)) {
> >>>>>> +            need_serialize = sd->flags & SD_SERIALIZE;
> >>>>>> +            if (need_serialize) {
> >>>>>> +                if (atomic_cmpxchg_acquire(&sched_balance_running,
> >>>>>> 0, 1))
> >>>>>> +                    goto out;
> >>>>>> +            }
> >>>>>> +
> >>>>>>                if (sched_balance_rq(cpu, rq, sd, idle,
> >>>>>> &continue_balancing)) {
> >>>>>>                    /*
> >>>>>>                     * The LBF_DST_PINNED logic could have changed
> >>>>>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq
> >>>>>> *rq, enum cpu_idle_type idle)
> >>>>>>                }
> >>>>>>                sd->last_balance = jiffies;
> >>>>>>                interval = get_sd_balance_interval(sd, busy);
> >>>>>> +            if (need_serialize)
> >>>>>> +                atomic_set_release(&sched_balance_running, 0);
> >>>>>>            }
> >>>>>> -        if (need_serialize)
> >>>>>> -            atomic_set_release(&sched_balance_running, 0);
> >>>>>>    out:
> >>>>>>            if (time_after(next_balance, sd->last_balance + interval)) {
> >>>>>>                next_balance = sd->last_balance + interval;
> >>>>>
> >>>
> >>
>
