Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11955230D35
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796858; cv=none; b=hWA4dKVrw9Bc4nSQvR+EW/vuDLgeq1PhrBCQExJRYYjvV432pHXxDMXNIv3WL+G8w3UNGJc647S08WsnTvaO9o/S/Imz2KMC/WyzobkyzTLU+Xl6XY44G0blZURZDSBzhVTEzOJWuBl/iXVl+sVOHSngL+1pWEGUctuCbMhWtOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796858; c=relaxed/simple;
	bh=swN/d1ArilqHXmC4tanvqClqj28FPmGCz/zycT8hDHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLX81G8/KApTCF5sfdWI5flpyvBFuk4uWeDTF/5H66uPic3XAemoi2uIA/+m7Kb4h+8IVcehcaFuRtZi9tXRpbzyAnfvzZAC0zy4iPKZ/uewKsYyVxhmDx7CPNAMeuLKiJGUNwX+wgqdZRyJP3uDipMi6g2oQPI18LBYdy6kFEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJpthMs8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJpthMs8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1213985166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744796854; x=1745401654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyl86y/1hon71hYziH4dS4SrSNyjZobv+uGhWBzXkK8=;
        b=TJpthMs8ka/LUS1/BMc+9MMGMRuESjbZbmT/imCyIyndz7W31VU20DbjB3wJYgjD3O
         n9hqK+YpWvtTys1HbmL7kIBegb9KFT7rLIspM6fM1IPgWisBwWdHDhAC1AyOKXvuiv8e
         jwIi+BDht7j7ZeHG+aY523OAB/kE4DSvQbSi0WdPPeiwgcRkmIQ55m7aHkkYL29Cnt+E
         XJQEyJv6vDLoTBMOFjpMVHD85s01BN+QyYL5VFSMS19UaZvkEZouTMB8MoYaEeHX3PJ5
         T8QrOwg2uqDP8ps6Fd+NtVPUucerGt3L2ECu+igknQAk0SdgvyC8LdfEY0fVAiVvbetJ
         3n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796854; x=1745401654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyl86y/1hon71hYziH4dS4SrSNyjZobv+uGhWBzXkK8=;
        b=MPZ2cs3xIYEu64vrNLHmFSYIdhK71AG2+LwqtVN5dF/76xfZl9/8WyaAlg2UiRCS5T
         jFws7tASJLALhKZCpgXmh4+6yDdVuUbTbA9LmYClEbpA3pQaM+bsWH5jwvCHxyF1qjBB
         JeBWAXAoBrccIRikOAg+t4bBD3g2kDLniIy3AKRn2OFEMu5G/6Hwe5AseT7kdk2eTqNX
         X9GwBNC7biBczYuTw819zMHmOYX18FKqPV5N5uu8ghe2O9FcJcN7vqxL4WCFjB3KWsRk
         EMkeKllKokRlSyinAYOdBqVTcZ8b8TFWbp5fQHxiq0bCEURHXx5HZLaIK2Drpbl2G1vj
         afbw==
X-Forwarded-Encrypted: i=1; AJvYcCUD4YiAyLATPT9CIMHRYabBgpdMlbdYDLF7mS5kVudq5dR1OaYMKuDRzpKnGEPGeFuWaUPSw7W0ph810co=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgKFELaEYUm8792j/9MeJyvPeEThCqkj02b/QDSpT3DrT1O2f
	EOWtiUHCxE4FJMPtsdLCDxbIqUkH/vfxG/xZwuaiy7nXOzWH50SkSyb8XR1Dh0OBPsBrKvqfO09
	oTgm5Bx+HuvQz3uC9otbETixeP7w/G/kUt2t6fw==
X-Gm-Gg: ASbGncvwH89vGfr0rnska58B5/Vdi+y41h3lysn4qLlcFyvUN38cIJzlCYOvAF3y1kX
	NJUW2xzjIk6Xa5k1U0dn9SlwiveY6FqNaIdr7U4+AAy5Rx2mo1b9+91RDeXrGArGSb7cfGfgwrs
	yJvw8yJSajExzrMz2D/hi64mn9bjH/AURR5Vuy/ij5VCyLnBfTFgo=
X-Google-Smtp-Source: AGHT+IGRnbaLq9ecJ6dzopwBDhjvPlvdQn5WNBtCGC6fa+uZuSew/YTmI/wGhNf943PcrWq8qAO676plKpqm2NmJUQc=
X-Received: by 2002:a17:906:f5a1:b0:ac2:4db0:1d22 with SMTP id
 a640c23a62f3a-acb42bfbe63mr86326466b.42.1744796854163; Wed, 16 Apr 2025
 02:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com> <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com> <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
In-Reply-To: <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 16 Apr 2025 11:47:22 +0200
X-Gm-Features: ATxdqUF5hneV2-KdMQQJo5D01DkUCayxhz2iH5zJR9RwvyFLjQ5VrOXgJzz4QHg
Message-ID: <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Doug Nelson <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 11:29, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>
>
>
> On 4/16/25 14:46, Shrikanth Hegde wrote:
> >
> >
> > On 4/16/25 11:58, Chen, Yu C wrote:
> >> Hi Shrikanth,
> >>
> >> On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
> >>>
> >>>
> >>> On 4/16/25 09:28, Tim Chen wrote:
> >>>> At load balance time, balance of last level cache domains and
> >>>> above needs to be serialized. The scheduler checks the atomic var
> >>>> sched_balance_running first and then see if time is due for a load
> >>>> balance. This is an expensive operation as multiple CPUs can attempt
> >>>> sched_balance_running acquisition at the same time.
> >>>>
> >>>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> >>>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> >>>> sched_balance_running.  Most of the time, a balance attempt is aborted
> >>>> immediately after acquiring sched_balance_running as load balance time
> >>>> is not due.
> >>>>
> >>>> Instead, check balance due time first before acquiring
> >>>> sched_balance_running. This skips many useless acquisitions
> >>>> of sched_balance_running and knocks the 7.6% CPU overhead on
> >>>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> >>>> improved by 11%.
> >>>>
> >>>
> >>> Hi Tim.
> >>>
> >>> Time check makes sense specially on large systems mainly due to
> >>> NEWIDLE balance.
> >
> > scratch the NEWLY_IDLE part from that comment.
> >
> >>>
> >>
> >> Could you elaborate a little on this statement? There is no timeout
> >> mechanism like periodic load balancer for the NEWLY_IDLE, right?
> >
> > Yes. NEWLY_IDLE is very opportunistic.
> >
> >>
> >>> One more point to add, A lot of time, the CPU which acquired
> >>> sched_balance_running,
> >>> need not end up doing the load balance, since it not the CPU meant to
> >>> do the load balance.
> >>>
> >>> This thread.
> >>> https://lore.kernel.org/all/1e43e783-55e7-417f-
> >>> a1a7-503229eb163a@linux.ibm.com/
> >>>
> >>>
> >>> Best thing probably is to acquire it if this CPU has passed the time
> >>> check and as well it is
> >>> actually going to do load balance.
> >>>
> >>>
> >>
> >> This is a good point, and we might only want to deal with periodic load
> >> balancer rather than NEWLY_IDLE balance. Because the latter is too
> >> frequent and contention on the sched_balance_running might introduce
> >> high cache contention.
> >>
> >
> > But NEWLY_IDLE doesn't serialize using sched_balance_running and can
> > endup consuming a lot of cycles. But if we serialize using
> > sched_balance_running, it would definitely cause a lot contention as is.
> >
> >
> > The point was, before acquiring it, it would be better if this CPU is
> > definite to do the load balance. Else there are chances to miss the
> > actual load balance.
> >
> >
>
> Sorry, forgot to add.
>
> Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
> the regular (idle) can take care for NUMA by serializing it?
>
> -               if (sd->flags & SD_BALANCE_NEWIDLE) {
> +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {

Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
set SD_SERIALIZE

>
>                          pulled_task = sched_balance_rq(this_cpu, this_rq,
>                                                     sd, CPU_NEWLY_IDLE,
>
>
> Anyways, having a policy around this SD_SERIALIZE would be a good thing.
>
> >> thanks,
> >> Chenyu
> >>
> >>>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> >>>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
> >>>> ---
> >>>>   kernel/sched/fair.c | 16 ++++++++--------
> >>>>   1 file changed, 8 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >>>> index e43993a4e580..5e5f7a770b2f 100644
> >>>> --- a/kernel/sched/fair.c
> >>>> +++ b/kernel/sched/fair.c
> >>>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct
> >>>> rq *rq, enum cpu_idle_type idle)
> >>>>           interval = get_sd_balance_interval(sd, busy);
> >>>> -        need_serialize = sd->flags & SD_SERIALIZE;
> >>>> -        if (need_serialize) {
> >>>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> >>>> -                goto out;
> >>>> -        }
> >>>> -
> >>>>           if (time_after_eq(jiffies, sd->last_balance + interval)) {
> >>>> +            need_serialize = sd->flags & SD_SERIALIZE;
> >>>> +            if (need_serialize) {
> >>>> +                if (atomic_cmpxchg_acquire(&sched_balance_running,
> >>>> 0, 1))
> >>>> +                    goto out;
> >>>> +            }
> >>>> +
> >>>>               if (sched_balance_rq(cpu, rq, sd, idle,
> >>>> &continue_balancing)) {
> >>>>                   /*
> >>>>                    * The LBF_DST_PINNED logic could have changed
> >>>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq
> >>>> *rq, enum cpu_idle_type idle)
> >>>>               }
> >>>>               sd->last_balance = jiffies;
> >>>>               interval = get_sd_balance_interval(sd, busy);
> >>>> +            if (need_serialize)
> >>>> +                atomic_set_release(&sched_balance_running, 0);
> >>>>           }
> >>>> -        if (need_serialize)
> >>>> -            atomic_set_release(&sched_balance_running, 0);
> >>>>   out:
> >>>>           if (time_after(next_balance, sd->last_balance + interval)) {
> >>>>               next_balance = sd->last_balance + interval;
> >>>
> >
>
