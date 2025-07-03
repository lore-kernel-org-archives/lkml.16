Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8029C351
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586631; cv=none; b=lWpeFTJZgq68spahZAWCibabNJ3xs2OyKqAbJmYFYLuEV0WJhCyCYepifvOzRMuLwrGfe9TFTSJqDveItMhy53gj1seQh1jmmwAewREvfxnaoI6Xhu6gBuA5eYiLuxCjdNLCVPy22ytor6bbvNcR/b4JYyXtNkjvd1arxbpENJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586631; c=relaxed/simple;
	bh=otFU39X49SPvq6AuX7M7b5XDYHDfU/YMI2r+8lBZBJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEvNIjRNFWBVjzDE2OMLlf34rQXHmGTJdvl+kIi6Tuh/XZl+/4LT2EjIE2f4QISBw6LaNCVRZVPgsjS0+Itf5FPulz43q9opVwkY0TwXzf/D3vQg80qRm/CU33zm7QqO7jeWNV2YBpIt8UYxBiyZ7ENhs1MEBRTYQtEndOw1vME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=drId4jLZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="drId4jLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751586628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgiImv1VMeYH6/rBbML7INvdeMXur4krxVW2wOy6WY0=;
	b=drId4jLZAXNjrMjM58VdvDM3piGcLLbCGOmPhCrMw2EvfrI4JVlsJqLgEVkhzZRY+6yS56
	NM1VbwcaXW9/oCdKP4kWCvq6Kq9V2W87w3QgmIc/DxllXo2VjanK2cgrjsqJW/MRETFYkr
	3eRulruTbRcaQ5gk3kXRVvDzUlIw/Og=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-C7xmFyhxNoaLOWR8Y25-ow-1; Thu, 03 Jul 2025 19:50:27 -0400
X-MC-Unique: C7xmFyhxNoaLOWR8Y25-ow-1
X-Mimecast-MFC-AGG-ID: C7xmFyhxNoaLOWR8Y25-ow_1751586626
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-553a89531fdso187415e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586626; x=1752191426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgiImv1VMeYH6/rBbML7INvdeMXur4krxVW2wOy6WY0=;
        b=Mq3bWRcyFjA8CgRqM6HoFIJroyt5eCnUoXelcywLl1dlbMKaaO/BWXrB3CGYx6w2C2
         H+JLPVI04ucVj3ltqCy1r4PPm/NX5nDOUf7Br0slsbrz4bS25J74od0KPDcGUlA1OcGh
         3aqqYJVldwEJfdO7+RMBwkkL2HMtMIEdnRGN0CENKAWFJomsqmql/Vb0BUEj5KlEAw4U
         6k6dR+dG3iMs13uJBXznbNIe3bOHhCAAqmvlc4gnCLKLNUHjX59z3r1ytF2qTIkxLScM
         asvtNR1q5vBKrBOZK8DROC5OvHFbdIVTfdfcBlbdMUawaTB3CkC/VXoLd3dxtJ4683nS
         pQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwxDX4/WLKUx0wztrM3u3eriUW5zp2BJJtsxXJb3Y9RoRXoyvWxycmCFdVPD3Xic08eD5hnwwyBybKVmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqh7E0NX85flxYkC4+eYh6aeTk2Im17CC6oJtVQ3Xm47ZANg4s
	p3q1NOkF4m2o3WOVef6fuxV766VhGGJWr8NN5j1d+YHEItanyk9TclskDWmzhtMeCiBOlUZ4msn
	28KuvERxNq3jsP0Mk0vxQWJNV1GBwz8Ajd9WDkU8xnf/ruEbWcDPkR85P96Ls7Vjs4ASlljTm7g
	T059YgaUNCSsnhsHSqi+TaANETBbrbdRCs+q/NNV8m
X-Gm-Gg: ASbGnctH8gJlzWcPQkoQj7tnjLRWn0v/uKgnPAD88eJl+fV8EFfumeWIqicwx4EmfS6
	3cuBOlzvQcdFMyov+hRQ/AU9v+JbNBxawyQOr5blgZNcGa3ybCQshJL9oud1hGuMg1RWeiA8Oj0
	eeFw==
X-Received: by 2002:a05:6512:63d6:20b0:554:f76a:baba with SMTP id 2adb3069b0e04-556d1610e92mr77257e87.3.1751586625546;
        Thu, 03 Jul 2025 16:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH2HNSaz/pT4IUvEiYfSnWDDZ9NQ1+1mBfj7UWn7+wMd4wvUSmmapH8L3NK6gB/querX3R7aCRdeb3rOJgJSA=
X-Received: by 2002:a05:6512:63d6:20b0:554:f76a:baba with SMTP id
 2adb3069b0e04-556d1610e92mr77253e87.3.1751586625109; Thu, 03 Jul 2025
 16:50:25 -0700 (PDT)
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
 <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com> <8a919ef6-4105-44e0-a17c-e41c1c0abbe9@amd.com>
 <0ec290aa-0e9b-49cc-9dd7-2f58c51b6d22@intel.com> <CAE4VaGDgta2PrG2WhPQ6KndZd3pAf5Fh9oJEf9k1eZ4492Aw_g@mail.gmail.com>
 <5bcb752d-813e-4ab4-8519-fae897472b5b@amd.com> <CAE4VaGDvBM20+VGbe+uCYOsuRX1bnQugHH=9DZCAuqAxRV5KiA@mail.gmail.com>
In-Reply-To: <CAE4VaGDvBM20+VGbe+uCYOsuRX1bnQugHH=9DZCAuqAxRV5KiA@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 4 Jul 2025 01:50:13 +0200
X-Gm-Features: Ac12FXwqLd23g3dl_Tw9RdBYlLDCpTRL2AG6WuYtbbZs2NK1Jr_bFRr70gxCIvI
Message-ID: <CAE4VaGBcXDUn+i4GuZyod_g_uKs54641-D-O14_QCR5w9pddbA@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Suneeth D <Suneeth.D@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Let me close this loop.

All debug messages I have collected were connected with the task exit.

Thank you
Jirka


On Wed, Jul 2, 2025 at 3:24=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> wr=
ote:
>
> Thank you, Aithal!
>
> Chenyu, here is another debug log - the flag is essentially the same
> as before, except that PF_NOFREEZE is also set, so it points to the
> same race condition (task exit).
>
> This happened on an AMD Bergamo 9754 single socket server.
>
> cat /sys/kernel/debug/tracing/trace
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 1/1   #P:256
> #
> #                                _-----=3D> irqs-off/BH-disabled
> #                               / _----=3D> need-resched
> #                              | / _---=3D> hardirq/softirq
> #                              || / _--=3D> preempt-depth
> #                              ||| / _-=3D> migrate-disable
> #                              |||| /     delay
> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> #              | |         |   |||||     |         |
>    migration/96-599     [096] dN.5. 84281.647548: __migrate_swap_task:
> !! (2886754 sysbench-binary) flags=3D40804c
>
> On Wed, Jul 2, 2025 at 2:19=E2=80=AFPM Aithal, Srikanth <sraithal@amd.com=
> wrote:
> >
> > On 7/2/2025 5:23 PM, Jirka Hladky wrote:
> > > Hi Aithal,
> > >
> > > thank you for the reproducer.
> > >
> > > With the patched kernel, after running a reproducer, please do
> > >
> > > cat /sys/kernel/debug/tracing/trace
> > >
> > > If the counter is nonzero like this:
> > > entries-in-buffer/entries-written: 1/1
> > >
> > > please post the `cat /sys/kernel/debug/tracing/trace` here.
> > >
> > > It would be helpful to check if there are any other race conditions
> > > besides the task exit.
> > >
> > > Thank you!
> > > Jirka
> > >
> >
> >
> > None of the four machines running our workload [with the debug patch]
> > showed any entries.
> > Entries in Buffer/Entries Written: 0/0
> >
> >
> > > On Wed, Jul 2, 2025 at 1:17=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.co=
m> wrote:
> > >>
> > >> On 7/2/2025 3:36 PM, Aithal, Srikanth wrote:
> > >>>
> > >>>
> > >>> On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
> > >>>> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
> > >>>>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> > >>>>>> Hi Jirka,
> > >>>>>>
> > >>>>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> > >>>>>>> Hi Chen and all,
> > >>>>>>>
> > >>>>>>> we have now verified that the following commit causes a kernel =
panic
> > >>>>>>> discussed in this thread:
> > >>>>>>>
> > >>>>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> > >>>>>>>
> > >>>>>>> Reverting this commit fixes the issue.
> > >>>>>>>
> > >>>>>>> I'm happy to help debug this further or test a proposed fix.
> > >>>>>>>
> > >>>>>>
> > >>>>>> Thanks very much for your report, it seems that there is a
> > >>>>>> race condition that when the swap task candidate was chosen,
> > >>>>>> but its mm_struct get released due to task exit, then later
> > >>>>>> when doing the task swaping, the p->mm is NULL which caused
> > >>>>>> the problem:
> > >>>>>>
> > >>>>>> CPU0                                   CPU1
> > >>>>>> :
> > >>>>>> ...
> > >>>>>> task_numa_migrate
> > >>>>>>     task_numa_find_cpu
> > >>>>>>      task_numa_compare
> > >>>>>>        # a normal task p is chosen
> > >>>>>>        env->best_task =3D p
> > >>>>>>
> > >>>>>>                                          # p exit:
> > >>>>>>                                          exit_signals(p);
> > >>>>>>                                             p->flags |=3D PF_EXI=
TING
> > >>>>>>                                          exit_mm
> > >>>>>>                                             p->mm =3D NULL;
> > >>>>>>
> > >>>>>>      migrate_swap_stop
> > >>>>>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
> > >>>>>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NU=
LL
> > >>>>>>
> > >>>>>> Could you please help check if the following debug patch works,
> > >>>>>
> > >>>>> Attached the patch:
> > >>>>>
> > >>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > >>>>> index 8988d38d46a3..82fc966b390c 100644
> > >>>>> --- a/kernel/sched/core.c
> > >>>>> +++ b/kernel/sched/core.c
> > >>>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct
> > >>>>> task_struct *p, int cpu)
> > >>>>>    {
> > >>>>>        __schedstat_inc(p->stats.numa_task_swapped);
> > >>>>>        count_vm_numa_event(NUMA_TASK_SWAP);
> > >>>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > >>>>> +    if (unlikely(!p->mm)) {
> > >>>>> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm=
,
> > >>>>> +                p->flags);
> > >>>>> +    } else {
> > >>>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > >>>>> +    }
> > >>>>>
> > >>>>>        if (task_on_rq_queued(p)) {
> > >>>>>            struct rq *src_rq, *dst_rq;
> > >>>>
> > >>>> I was encountering the same issue as mentioned earlier in this thr=
ead,
> > >>>> which has been recurring in our daily linux-next CI builds within =
our
> > >>>> virtualization CI stream where we observed this BUG appearing rand=
omly
> > >>>> during the runs.
> > >>>>
> > >>>> Additionally, we were able to reproduce this issue while running t=
he
> > >>>> autonuma benchmark. As mentioned earlier, the BUG would occur rand=
omly
> > >>>> across iterations, typically between the 5th and 10th iterations.
> > >>>>
> > >>>> We consistently encountered this issue up to the 6.16.0-rc4-
> > >>>> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/g=
it/
> > >>>> next/linux-next.git].
> > >>>>
> > >>>> After applying the aforementioned patch ontop of next-20250630 bui=
ld,
> > >>>> I tested it in our virtualization CI and with the autonuma benchma=
rk
> > >>>> reproducer described below, and the issue no longer occurred. The
> > >>>> patch appears to have resolved the reported problem.
> > >>>>
> > >>>>
> > >>>> git clone https://github.com/pholasek/autonuma-benchmark.git
> > >>>> cd autonuma-benchmark
> > >>>> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
> > >>>> Note: The server running the autonuma-benchmark must have at least=
 two
> > >>>> nodes.
> > >>>>
> > >>>> If the provided fix is final, please feel free to include the
> > >>>> following Tested-by tag:
> > >>>>
> > >>>> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> > >>>> Tested-by: Suneeth D <Suneeth.D@amd.com>
> > >>>>
> > >>>
> > >>>
> > >>> I apologize for overlooking that this was a debug patch. With this =
debug
> > >>> patch applied on top of 6.16.0-rc4-next-20250630, I am unable to
> > >>> reproduce the issue. However, when I revert this debug patch, I
> > >>> encounter the issue again on 6.16.0-rc4-next-20250630.
> > >>>
> > >>>
> > >>
> > >> Thank you Aithal, this is a debug + fix patch. And Jirka has confirm=
ed
> > >> that this helps somehow. I'll post a formal one and Cc you.
> > >>
> > >> Thanks,
> > >> Chenyu
> > >>
> > >
> > >
> >
>
>
> --
> -Jirka



--=20
-Jirka

