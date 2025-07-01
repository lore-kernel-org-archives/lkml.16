Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7343D69
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403962; cv=none; b=bzSIFQeeJ7PvYYvWwZkXiLItM+nIxRGar+Dg+I8kNGsF+rDt/cyZInFWZ4DdgWvCT2E8+39gWyuN4qZ38BmuNqV5rDWTBOJ6n04vW2vKXZxS5dP8ix2gQh1yQFiPvxYQeRAZxp0e2Zi7uP7yZEzVCgJD5hRp0KoXobaXUs7A7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403962; c=relaxed/simple;
	bh=6NGVu9Gw1mLq12WBPLvVDSq9INdbonrsa6mdpygU7tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW7yNzDDUp0wAwMoG5ERgvfXh/qBIv3AEU6JudcIaL9m8bMNwZI5X4UmHIZvzm4t+zTaw3sTpIK4Rm/Ggs1TEd6sR0Lolsgqm/LGUxZ0ISJd2bdVdcPD7G7x0QQrrRMBPS+g/AOWuCUxHAIEvi9bAxW0jyc6T6WYokn8Dvup/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UlOL3pdg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UlOL3pdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751403959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIC6maAMzd9F1Bv4xnL1mIZTIqfP1FK2fpdpF3O9Zu4=;
	b=UlOL3pdgheKUAQ09PNc24JEVGN2b+LiZEKgduAONbqC9BPL0IgvtsqytyAlVMBDm7HvtpX
	6ydWuN3oBscOT29rqDXTOBSC7CaoZL3l5U9iND5YV/Xn4i4y0anSw8DRWD9EU/cEEME4IJ
	hOiLNa50k5TjZDqA3N5ZnLZDK9/F8hs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-0i8UlSjTNniRnGlbeyLv9Q-1; Tue, 01 Jul 2025 17:05:58 -0400
X-MC-Unique: 0i8UlSjTNniRnGlbeyLv9Q-1
X-Mimecast-MFC-AGG-ID: 0i8UlSjTNniRnGlbeyLv9Q_1751403957
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-553c6367ec1so3387589e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403956; x=1752008756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIC6maAMzd9F1Bv4xnL1mIZTIqfP1FK2fpdpF3O9Zu4=;
        b=ASKMVAM9r76wsAU/WdnIXtb6uPQbUdRtniXHUJif3Mf3jY78jjiN907QYtumhCPDbj
         FP5dfmQCCb6yrX/sdI9SdlJy6cVI/ERKN0IHTxO2MYWfVTEwguW/tWsN3SViaZ3TR++0
         4xptQS5w9yP5LWK1eT4WN+iIwzSPeSz6zu4RKiIhsIb5eCG83qR7b96fczj3HP/eJTV4
         VhTTszsyiiBmx825YkgXgAonj9FsyF+8tjyIk5j4qqaXvzgkdsYBmMP98QpNxB/AVJZu
         nwyunQhicFoEA/vIC4vAasn2Lm26Pdfi0nNPsE8RjXeKmyuvvDxa9/d89b1324AKbUk4
         PJfA==
X-Forwarded-Encrypted: i=1; AJvYcCX2aeqpqpSa+QNWpkPLule61oagZzg/809HckvvtKX7IWBp8NBEm7Uf0aFTGIvWcUkA7iVLJlc3ThE9C4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk68NT6US3LtCdDJ9yPIPmBGOVCKMBHe3W6udAY4xWqSfspgIK
	gL8RoEB1Q6T2YlxuQU4lUztOysEE1e0A3qJKNAKX9ZT5ZfoZLZ5qO7tmiBD6YbEcq1oAeNSjJHI
	31+TvbSbZZ9SLqsh/xNnCGqSVdjEeRzQOKyIblQ1K1Z0JEm3hzvBA/qlbf8NFoDiO8d8q3r+34V
	YEktBVHBvOUCwDsyasAk9+OOGwiJRXZ0rgKe+vbpbX
X-Gm-Gg: ASbGncu4DAMOQQquL8mrtl+St2x5DMaVAhf2BJbJVFRPov8NuSHw9xRpRbKvEzHDiAH
	day/W5b2QH+J+2/ocNrnaUMX9mqqvhrOwfDuVXLXXFVFak9L98NQxLKNaB9H7sF20BjpBhQSUHJ
	OiJg==
X-Received: by 2002:a05:6512:ad2:b0:553:65bc:4250 with SMTP id 2adb3069b0e04-5562831b99bmr109496e87.27.1751403956384;
        Tue, 01 Jul 2025 14:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9k1BTfoDsDVlWJB961qyrlyvw4Sj1d27KnabnWjQMnxObi4sSpFyNeGJ3OSGSfZ/osbE0Q0btYLLfKQZyGXM=
X-Received: by 2002:a05:6512:ad2:b0:553:65bc:4250 with SMTP id
 2adb3069b0e04-5562831b99bmr109488e87.27.1751403955928; Tue, 01 Jul 2025
 14:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com> <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com> <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <b66b4e76-f07d-4067-8c99-55600bbd2556@oracle.com> <fe225d57-f1a7-4b54-aa09-6efbc11c9a0c@intel.com>
 <CAE4VaGBoRNSGcfK-_Mnd+fgs11MzkLPdQV9xKs_iwCgaqxE7NQ@mail.gmail.com>
In-Reply-To: <CAE4VaGBoRNSGcfK-_Mnd+fgs11MzkLPdQV9xKs_iwCgaqxE7NQ@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Tue, 1 Jul 2025 23:05:44 +0200
X-Gm-Features: Ac12FXw-TA8UW69aH3dn32LgSKtUnA6UcFtyOVumOrIS9MMDDjvkN-vbYNiR2fk
Message-ID: <CAE4VaGAzuexw79W+ZpAPf7dDKVtUZs_eNYX5e_ZWVirSt2tONQ@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Libo Chen <libo.chen@oracle.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Chen Yu <yu.chen.surf@foxmail.com>, 
	Philip Auld <pauld@redhat.com>, "jstancek@redhat.com" <jstancek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenyu,

I have the first

if (unlikely(!p->mm)) {
trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm, p->flags);

log from dual socket AMD Milanx 7573X server:

[74615.841401] # entries-in-buffer/entries-written: 1/1   #P:128
[74615.841401] #
[74615.841401] #                                _-----=3D> irqs-off/BH-disa=
bled
[74615.841401] #                               / _----=3D> need-resched
[74615.841401] #                              | / _---=3D> hardirq/softirq
[74615.841401] #                              || / _--=3D> preempt-depth
[74615.841401] #                              ||| / _-=3D> migrate-disable
[74615.841401] #                              |||| /     delay
[74615.841401] #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
[74615.841401] #              | |         |   |||||     |         |
[74615.841401]      migration/6-54      [006] d..5. 58590.368364:
__migrate_swap_task: !! (2939199 stress-ng-sem) flags=3D40004c

debug code caught a task with p->mm =3D=3D NULL during __migrate_swap_task(=
).

Trace shows:
  * It was a stress-ng-sem process (PID 2939199),
  * That process was in the process of exiting (PF_EXITING | PF_EXITPIDONE)=
,
  * And was a workqueue worker (PF_WQ_WORKER),
  * It explains why p->mm had already been freed

I'm curious as to why the command is stress-ng-sem, and the flag
indicates it is a workqueue worker.

More jobs are still running. I will keep an eye on them and report the
other cases as they finish.

Jirka

On Tue, Jul 1, 2025 at 5:10=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> wr=
ote:
>
> Hi Chenyu and Libo,
>
> I agree, let's wait for the results. Hopefully, we can fix the root
> cause based on the debug messages.
>
> There was a problem with the infrastructure over the weekend, so I had
> to restart the jobs yesterday. I should have results tomorrow.
>
> Stay tuned.
> Jirka
>
>
> On Tue, Jul 1, 2025 at 4:59=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> w=
rote:
> >
> > Hi Libo,
> >
> > On 7/1/2025 3:32 PM, Libo Chen wrote:
> > > Hi Chenyu,
> > >
> > > On 6/27/25 00:33, Chen, Yu C wrote:
> > >> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> > >>> Hi Jirka,
> > >>>
> > >>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> > >>>> Hi Chen and all,
> > >>>>
> > >>>> we have now verified that the following commit causes a kernel pan=
ic
> > >>>> discussed in this thread:
> > >>>>
> > >>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> > >>>>
> > >>>> Reverting this commit fixes the issue.
> > >>>>
> > >>>> I'm happy to help debug this further or test a proposed fix.
> > >>>>
> > >>>
> > >>> Thanks very much for your report, it seems that there is a
> > >>> race condition that when the swap task candidate was chosen,
> > >>> but its mm_struct get released due to task exit, then later
> > >>> when doing the task swaping, the p->mm is NULL which caused
> > >>> the problem:
> > >>>
> > >>> CPU0                                   CPU1
> > >>> :
> > >>> ...
> > >>> task_numa_migrate
> > >>>     task_numa_find_cpu
> > >>>      task_numa_compare
> > >>>        # a normal task p is chosen
> > >>>        env->best_task =3D p
> > >>>
> > >>>                                          # p exit:
> > >>>                                          exit_signals(p);
> > >>>                                             p->flags |=3D PF_EXITIN=
G
> > >>>                                          exit_mm
> > >>>                                             p->mm =3D NULL;
> > >>>
> > >>>      migrate_swap_stop
> > >>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
> > >>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> > >>>
> > >>> Could you please help check if the following debug patch works,
> > >>
> > >> Attached the patch:
> > >>
> > >> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > >> index 8988d38d46a3..82fc966b390c 100644
> > >> --- a/kernel/sched/core.c
> > >> +++ b/kernel/sched/core.c
> > >> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_s=
truct *p, int cpu)
> > >>   {
> > >>       __schedstat_inc(p->stats.numa_task_swapped);
> > >>       count_vm_numa_event(NUMA_TASK_SWAP);
> > >> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > >> +    if (unlikely(!p->mm)) {
> > >
> > > I am starting to wonder if we should keep this check and add a big fa=
t warning
> > > like  "there is a bug here, please report it!" rather than brick the =
kernel.
> > > A kernel panic, for sure, helps catch bugs like this more than a line=
 of dmesg,
> > > so it's a tradeoff I guess. What do you think?
> > >
> >
> > I agree with you that adding something like WARN_ON_ONCE()
> > could help, and it seems that the kernel panic is not expected
> > in this scenario because this feature is a statistic calculation
> > rather than the critical logic. Maybe waiting for Jirka's feedback
> > to decide the next step.
> >
> > thanks,
> > Chenyu
> >
> >
> >
> > >
> > > Thanks,
> > > Libo
> > >
> > >> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm,
> > >> +                p->flags);
> > >> +    } else {
> > >> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > >> +    }
> > >>
> > >>       if (task_on_rq_queued(p)) {
> > >>           struct rq *src_rq, *dst_rq;
> > >
> >
>
>
> --
> -Jirka



--=20
-Jirka

