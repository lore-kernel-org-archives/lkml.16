Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4A7259C9F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456650; cv=none; b=a7bECNIQkbkzxodLIGRZbzfH98KVxqsny6tDgvmg3xEBqeXx+TxsJyLLZfttecSBLfKo7U41BXH744woBHuycZ6NjTlwufUsglHAX+PiqTewyFEYkYRwgnpYWxUgSYRVhRyamtDCNkL4osZK5WqY2kPBHmAfaKp058YXxb5yyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456650; c=relaxed/simple;
	bh=XyJQQrjGyURK6ZX4Ik7eoAEjJc1VStWAh8fD6Ngby2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfcV6b0vC8S8OH+uKAEHSitTmDr9kWDvp54S52MYwfdjm2lpaqqd5PxIjvGX9gl0ZID6BhQhHr8M1/3AflJHFcqk5qrMcKxy3XfQV7z97xlYK4gu95Ckv9vTvOVlNpxmPpvrUL4QC2ADtCZEuvMmJoAc0sbUnsafLqDMwS3ONls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikUxyExd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikUxyExd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751456647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQydJQMIExuYJFFRrW0JUNh8gF4u7xGBSlzgpyZpbv4=;
	b=ikUxyExdZ4fxgjnlAmTDUXo9AU++czJuNFX+3O3/yCW6ZclKYyRY7pjil4IZ/i1uqtUd9U
	zrJu5/ey8iR4AeVaHX4LEyEc5jZzIUrMGGgg6JocHDy6KQdmbHKB1Ic9YemL4Us9bG06C6
	yCKqDLyvJHU6I9aefws0f3+DZMaVWsM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-8N72hiD-PtiW6BW4GAYeSA-1; Wed, 02 Jul 2025 07:44:06 -0400
X-MC-Unique: 8N72hiD-PtiW6BW4GAYeSA-1
X-Mimecast-MFC-AGG-ID: 8N72hiD-PtiW6BW4GAYeSA_1751456645
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32b3ce96f8dso21087721fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456645; x=1752061445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQydJQMIExuYJFFRrW0JUNh8gF4u7xGBSlzgpyZpbv4=;
        b=eC9yV/PqvcpKVz0K3lvab7Wxo18agPo5tmPGXZ+h8/wjAnYjIDDZ/qz/tCl5erXkIX
         VirtMteeL2kJj/TswxxTNtweM9hyZ6zbS/0Tll3WWY7a4S93axp/MI6PPS98rKmZE0C+
         iJDvvJetH5CrET+hdGoU2u+A6HryhArosY6T7olurERTebCTv7fVD7fU+AgnNwqvcMiF
         BX/8NouTq1r+G33SNoJLGfbQQLmHKIofZcHN7we8A6z6FWNzZePa4w2gwCOgAjN1Rth4
         gBsC7XexCQiJB3KmTRtXCIAXS2FMwJKskBCDB60u9aCT3/0OtqENjovx8Hh7Hl8RdaDL
         agJA==
X-Forwarded-Encrypted: i=1; AJvYcCVfdOes3dVZhGH+uu22KUu+RSwzzQsWcrlL+cQQV47UNbiYF75f0DlGbH6t9d7N35i0LVdGSoXr5iCGpuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwslZL0LlWaIPWUB3kwbxDSXQ9S7JJYZTISoIoU2Ru5DqE9vV93
	ZLCx30N7sMOe8AjULB1kHnZ7Vd0eGiZWBIVrX4ltQoJe0CH+9YVlx7wUJg0/QNqLHDXynJgJDDf
	4Z1ZZdzBYYgBnmwunJiKrqKyr8ItZrAntCkpzGkv6mhssocMNC6jIV4Cinn8a9yWuNH20JQXmzd
	QNtorlPt0/ox3fl4QmZGdQlARWsYRYzbzc1QtwhUFM
X-Gm-Gg: ASbGnctJe1q+DlxkQTaUI6sIPIFSoda9XoFMLyFnBuCr0CD6GmTa0dUy5B/l8Db/GCL
	FJZWKhymARVVVt65sujSzQHjMbmC54SR/ODrloK2rGdr45XO0OAtoVndhgaNsm2RlLAjE6R8WOD
	ebxEs=
X-Received: by 2002:a2e:a58a:0:b0:32b:7614:5724 with SMTP id 38308e7fff4ca-32dfff377damr7695121fa.5.1751456644999;
        Wed, 02 Jul 2025 04:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuHeNX1ybbdYM5ETE0NWgJNJv2I8U/o3WxUpUp97IT+6hoL5ZVdBd0BQkazHEyux0U5AoVX7zeCrHqBPJ3WWY=
X-Received: by 2002:a2e:a58a:0:b0:32b:7614:5724 with SMTP id
 38308e7fff4ca-32dfff377damr7695011fa.5.1751456644541; Wed, 02 Jul 2025
 04:44:04 -0700 (PDT)
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
 <CAE4VaGAzuexw79W+ZpAPf7dDKVtUZs_eNYX5e_ZWVirSt2tONQ@mail.gmail.com> <4c827399-955c-4c7e-9a52-d38bc6a55aee@intel.com>
In-Reply-To: <4c827399-955c-4c7e-9a52-d38bc6a55aee@intel.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 2 Jul 2025 13:43:52 +0200
X-Gm-Features: Ac12FXwZT4HF7bIUFLJCVgTf4n_kAt42VZ4FwbSsBrQSCfxbVkkVyoviFr-breA
Message-ID: <CAE4VaGDBoqa-vj7MUuK12DV=XUNUByiNpzj4c=bse+zBSRBJTg@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Libo Chen <libo.chen@oracle.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Chen Yu <yu.chen.surf@foxmail.com>, 
	Philip Auld <pauld@redhat.com>, "jstancek@redhat.com" <jstancek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thanks Jirka. So this race condition is related to task exit.

Yes! I'm glad we've found it! :-)

> The flag 0x40004c is
> PF_EXITING PF_POSTCOREDUMP PF_FORKNOEXEC PF_RANDOMIZE
> according to latest
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/sched.h?h=3Dv6.16-rc4

Oh, my bad! Thank you for the correct pointer.


On Wed, Jul 2, 2025 at 1:14=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> wro=
te:
>
> On 7/2/2025 5:05 AM, Jirka Hladky wrote:
> > Hi Chenyu,
> >
> > I have the first
> >
> > if (unlikely(!p->mm)) {
> > trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm, p->flags);
> >
> > log from dual socket AMD Milanx 7573X server:
> >
> > [74615.841401] # entries-in-buffer/entries-written: 1/1   #P:128
> > [74615.841401] #
> > [74615.841401] #                                _-----=3D> irqs-off/BH-=
disabled
> > [74615.841401] #                               / _----=3D> need-resched
> > [74615.841401] #                              | / _---=3D> hardirq/soft=
irq
> > [74615.841401] #                              || / _--=3D> preempt-dept=
h
> > [74615.841401] #                              ||| / _-=3D> migrate-disa=
ble
> > [74615.841401] #                              |||| /     delay
> > [74615.841401] #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTIO=
N
> > [74615.841401] #              | |         |   |||||     |         |
> > [74615.841401]      migration/6-54      [006] d..5. 58590.368364:
> > __migrate_swap_task: !! (2939199 stress-ng-sem) flags=3D40004c
> >
> > debug code caught a task with p->mm =3D=3D NULL during __migrate_swap_t=
ask().
> >
> > Trace shows:
> >    * It was a stress-ng-sem process (PID 2939199),
> >    * That process was in the process of exiting (PF_EXITING | PF_EXITPI=
DONE),
>
> Thanks Jirka. So this race condition is related to task exit.
>
> >    * And was a workqueue worker (PF_WQ_WORKER),
> >    * It explains why p->mm had already been freed
> >
> > I'm curious as to why the command is stress-ng-sem, and the flag
> > indicates it is a workqueue worker.
>
> The flag 0x40004c is
> PF_EXITING PF_POSTCOREDUMP PF_FORKNOEXEC PF_RANDOMIZE
> according to latest
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/sched.h?h=3Dv6.16-rc4
>
> thanks,
> Chenyu>
> > More jobs are still running. I will keep an eye on them and report the
> > other cases as they finish.
> >
> > Jirka
> >
> > On Tue, Jul 1, 2025 at 5:10=E2=80=AFPM Jirka Hladky <jhladky@redhat.com=
> wrote:
> >>
> >> Hi Chenyu and Libo,
> >>
> >> I agree, let's wait for the results. Hopefully, we can fix the root
> >> cause based on the debug messages.
> >>
> >> There was a problem with the infrastructure over the weekend, so I had
> >> to restart the jobs yesterday. I should have results tomorrow.
> >>
> >> Stay tuned.
> >> Jirka
> >>
> >>
> >> On Tue, Jul 1, 2025 at 4:59=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com=
> wrote:
> >>>
> >>> Hi Libo,
> >>>
> >>> On 7/1/2025 3:32 PM, Libo Chen wrote:
> >>>> Hi Chenyu,
> >>>>
> >>>> On 6/27/25 00:33, Chen, Yu C wrote:
> >>>>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> >>>>>> Hi Jirka,
> >>>>>>
> >>>>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> >>>>>>> Hi Chen and all,
> >>>>>>>
> >>>>>>> we have now verified that the following commit causes a kernel pa=
nic
> >>>>>>> discussed in this thread:
> >>>>>>>
> >>>>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> >>>>>>>
> >>>>>>> Reverting this commit fixes the issue.
> >>>>>>>
> >>>>>>> I'm happy to help debug this further or test a proposed fix.
> >>>>>>>
> >>>>>>
> >>>>>> Thanks very much for your report, it seems that there is a
> >>>>>> race condition that when the swap task candidate was chosen,
> >>>>>> but its mm_struct get released due to task exit, then later
> >>>>>> when doing the task swaping, the p->mm is NULL which caused
> >>>>>> the problem:
> >>>>>>
> >>>>>> CPU0                                   CPU1
> >>>>>> :
> >>>>>> ...
> >>>>>> task_numa_migrate
> >>>>>>      task_numa_find_cpu
> >>>>>>       task_numa_compare
> >>>>>>         # a normal task p is chosen
> >>>>>>         env->best_task =3D p
> >>>>>>
> >>>>>>                                           # p exit:
> >>>>>>                                           exit_signals(p);
> >>>>>>                                              p->flags |=3D PF_EXIT=
ING
> >>>>>>                                           exit_mm
> >>>>>>                                              p->mm =3D NULL;
> >>>>>>
> >>>>>>       migrate_swap_stop
> >>>>>>         __migrate_swap_task((arg->src_task, arg->dst_cpu)
> >>>>>>          count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NUL=
L
> >>>>>>
> >>>>>> Could you please help check if the following debug patch works,
> >>>>>
> >>>>> Attached the patch:
> >>>>>
> >>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>>>> index 8988d38d46a3..82fc966b390c 100644
> >>>>> --- a/kernel/sched/core.c
> >>>>> +++ b/kernel/sched/core.c
> >>>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_=
struct *p, int cpu)
> >>>>>    {
> >>>>>        __schedstat_inc(p->stats.numa_task_swapped);
> >>>>>        count_vm_numa_event(NUMA_TASK_SWAP);
> >>>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>>>> +    if (unlikely(!p->mm)) {
> >>>>
> >>>> I am starting to wonder if we should keep this check and add a big f=
at warning
> >>>> like  "there is a bug here, please report it!" rather than brick the=
 kernel.
> >>>> A kernel panic, for sure, helps catch bugs like this more than a lin=
e of dmesg,
> >>>> so it's a tradeoff I guess. What do you think?
> >>>>
> >>>
> >>> I agree with you that adding something like WARN_ON_ONCE()
> >>> could help, and it seems that the kernel panic is not expected
> >>> in this scenario because this feature is a statistic calculation
> >>> rather than the critical logic. Maybe waiting for Jirka's feedback
> >>> to decide the next step.
> >>>
> >>> thanks,
> >>> Chenyu
> >>>
> >>>
> >>>
> >>>>
> >>>> Thanks,
> >>>> Libo
> >>>>
> >>>>> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm,
> >>>>> +                p->flags);
> >>>>> +    } else {
> >>>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>>>> +    }
> >>>>>
> >>>>>        if (task_on_rq_queued(p)) {
> >>>>>            struct rq *src_rq, *dst_rq;
> >>>>
> >>>
> >>
> >>
> >> --
> >> -Jirka
> >
> >
> >
>


--=20
-Jirka

