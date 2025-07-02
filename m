Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD727A122
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462709; cv=none; b=OzPczijgD3TqrDVa9wRP4oa+YKYrXp0D+YNAlLWYPqwxXazdf0nBJ0x0d5SU57jr/274G2bgW3l58Uyg9zM+nOnnYxRXAEvyBUwtsU0lUTT3VHK1Eu3Hu/ZkR205/DSOCwCXZ7xgtSRbFeWRqIkShyJvWYnB+A07mTX9qfEI3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462709; c=relaxed/simple;
	bh=+DPhhkCqhCjY4HudI0WMpZlk/Iw/TdRAjF3onlmBOA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SS0qkfYv+/MISD3YwkEFQJnf4bRWYihBUEFP+LDQYHHm5KFxJlKgypqGwc+liTYg81DOs1KxrxpFpcn0SadQBRY6lO+9iKL0URx1UVrDRYViuRg7WTfEkweTyfQ4F2SPttiFr7QsVH7ixJ42hf2/awbwroaHYQKzmQwFbFQKpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JrTAIG4c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JrTAIG4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751462706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeBgXnTH5r2aHEQZ3vNU+jyCuCVHJOcl40pBVmcDFfA=;
	b=JrTAIG4cOD8/R1Kkj+psfY9ryvsNxgX6ottHG9kjxxtREsah36lgrexXaZjXMrXa2Lr2K7
	/SZGjoKUbTlMjwYpmpr/GPJIhN7d3dHLsA4jjw7iiBiDNQEc+IgAimAbM9YP6ZQCmbmycA
	eWXs6/lwfgbwwDVKClHdiHdfENXesV4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-VxsB-c_VNCCpD6VnaROYiQ-1; Wed, 02 Jul 2025 09:25:03 -0400
X-MC-Unique: VxsB-c_VNCCpD6VnaROYiQ-1
X-Mimecast-MFC-AGG-ID: VxsB-c_VNCCpD6VnaROYiQ_1751462702
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b93fa2e51so21944881fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462701; x=1752067501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeBgXnTH5r2aHEQZ3vNU+jyCuCVHJOcl40pBVmcDFfA=;
        b=kPdBalh/VuqMIuUfEmqJ2zWbMKGMhMKcf4D3KzcdEoGi+c1pZh/GDdE2RK+bs6QCQu
         OfYoqIBgY8YOxfJK22bHVF5GVL/2A1q+kBX11Wq+fiwMg9gE8vuVZEDPQ0WpTYq8LiW9
         dUMsuZo4Q2qJNZCe9BwnBWVsvMxMXUUbj+Ve2ylD99L+wx0Gq18jyNl2/qAIakM4w1yP
         jlOgRAXCusaZnXexUeobMRBtUoTtK6dm2qMFaYMzp9wI+B0s5eRNhz+XO/gVe8SG03U2
         MtMe4+7KW6XGl9DTolTkcWR+m7scvUZq/sI0CHMY+4mi/dfVaJN+4kN4/6UyjWQjN1d4
         xpcw==
X-Forwarded-Encrypted: i=1; AJvYcCUGN3PNZh/OYlB47VYlk7EpUx3bEgcZNlB7864FWMHj77aRz/uAqTnPppF+KX/ZoK1T1+N8XBB1dR3Oim4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzetztUdvLwFlm6cHDFPpO2khm/v8uK+CIc48PdN6OpUvHTq4IJ
	83KCmZIhvwihCkNTJnA0ztUmAcYjZEh4q0FpaBG1yt4WFJb2JUWwQicjbrJnQpaTsFRL/CKmmOR
	h0iv8QQsdAjrlufZQOayn6LKo6YzU+cRyT6FRJZnKKRcOWFaZ4zmgtHFU6v8ERe5C1yO9GKvyZn
	LZW81fP1vhgxEVlTX0+8o81TNgGXGITQ9mo5I/HA3jAQ1Vhcoh4Rg=
X-Gm-Gg: ASbGncvbeNKiGWfl6v9DxXTdd79eXFO/D/HwyXtoUsP5DW47E5qzmElKLkOozCaOeoy
	94U3OaLQt4fPAARgubTBRWWhaoTbzXwinZEtEMm1KXBlL/84zKP6Q6wQ7KhWUZEBwFoQWwPUdRY
	3//9E=
X-Received: by 2002:a2e:bea7:0:b0:32b:3879:ce7f with SMTP id 38308e7fff4ca-32dffdef4a4mr9111151fa.0.1751462700861;
        Wed, 02 Jul 2025 06:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHha/4r1kt+uXecZZusV0b51ZWt5zi1mY0uZGr2yXPSdqq30GrvFgxrEf7cJ7AoWe6sDVWLya/lQjalGXgETNI=
X-Received: by 2002:a2e:bea7:0:b0:32b:3879:ce7f with SMTP id
 38308e7fff4ca-32dffdef4a4mr9111061fa.0.1751462700365; Wed, 02 Jul 2025
 06:25:00 -0700 (PDT)
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
 <5bcb752d-813e-4ab4-8519-fae897472b5b@amd.com>
In-Reply-To: <5bcb752d-813e-4ab4-8519-fae897472b5b@amd.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 2 Jul 2025 15:24:46 +0200
X-Gm-Features: Ac12FXzsNHIQ1kyflPsrdraidMZd6ZkY2iHE7gHyz9XsSz5l6DQ7ztArEBIrp7g
Message-ID: <CAE4VaGDvBM20+VGbe+uCYOsuRX1bnQugHH=9DZCAuqAxRV5KiA@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Suneeth D <Suneeth.D@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Aithal!

Chenyu, here is another debug log - the flag is essentially the same
as before, except that PF_NOFREEZE is also set, so it points to the
same race condition (task exit).

This happened on an AMD Bergamo 9754 single socket server.

cat /sys/kernel/debug/tracing/trace
# tracer: nop
#
# entries-in-buffer/entries-written: 1/1   #P:256
#
#                                _-----=3D> irqs-off/BH-disabled
#                               / _----=3D> need-resched
#                              | / _---=3D> hardirq/softirq
#                              || / _--=3D> preempt-depth
#                              ||| / _-=3D> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
   migration/96-599     [096] dN.5. 84281.647548: __migrate_swap_task:
!! (2886754 sysbench-binary) flags=3D40804c

On Wed, Jul 2, 2025 at 2:19=E2=80=AFPM Aithal, Srikanth <sraithal@amd.com> =
wrote:
>
> On 7/2/2025 5:23 PM, Jirka Hladky wrote:
> > Hi Aithal,
> >
> > thank you for the reproducer.
> >
> > With the patched kernel, after running a reproducer, please do
> >
> > cat /sys/kernel/debug/tracing/trace
> >
> > If the counter is nonzero like this:
> > entries-in-buffer/entries-written: 1/1
> >
> > please post the `cat /sys/kernel/debug/tracing/trace` here.
> >
> > It would be helpful to check if there are any other race conditions
> > besides the task exit.
> >
> > Thank you!
> > Jirka
> >
>
>
> None of the four machines running our workload [with the debug patch]
> showed any entries.
> Entries in Buffer/Entries Written: 0/0
>
>
> > On Wed, Jul 2, 2025 at 1:17=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com>=
 wrote:
> >>
> >> On 7/2/2025 3:36 PM, Aithal, Srikanth wrote:
> >>>
> >>>
> >>> On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
> >>>> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
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
> >>>>>>     task_numa_find_cpu
> >>>>>>      task_numa_compare
> >>>>>>        # a normal task p is chosen
> >>>>>>        env->best_task =3D p
> >>>>>>
> >>>>>>                                          # p exit:
> >>>>>>                                          exit_signals(p);
> >>>>>>                                             p->flags |=3D PF_EXITI=
NG
> >>>>>>                                          exit_mm
> >>>>>>                                             p->mm =3D NULL;
> >>>>>>
> >>>>>>      migrate_swap_stop
> >>>>>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
> >>>>>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> >>>>>>
> >>>>>> Could you please help check if the following debug patch works,
> >>>>>
> >>>>> Attached the patch:
> >>>>>
> >>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>>>> index 8988d38d46a3..82fc966b390c 100644
> >>>>> --- a/kernel/sched/core.c
> >>>>> +++ b/kernel/sched/core.c
> >>>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct
> >>>>> task_struct *p, int cpu)
> >>>>>    {
> >>>>>        __schedstat_inc(p->stats.numa_task_swapped);
> >>>>>        count_vm_numa_event(NUMA_TASK_SWAP);
> >>>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>>>> +    if (unlikely(!p->mm)) {
> >>>>> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm,
> >>>>> +                p->flags);
> >>>>> +    } else {
> >>>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>>>> +    }
> >>>>>
> >>>>>        if (task_on_rq_queued(p)) {
> >>>>>            struct rq *src_rq, *dst_rq;
> >>>>
> >>>> I was encountering the same issue as mentioned earlier in this threa=
d,
> >>>> which has been recurring in our daily linux-next CI builds within ou=
r
> >>>> virtualization CI stream where we observed this BUG appearing random=
ly
> >>>> during the runs.
> >>>>
> >>>> Additionally, we were able to reproduce this issue while running the
> >>>> autonuma benchmark. As mentioned earlier, the BUG would occur random=
ly
> >>>> across iterations, typically between the 5th and 10th iterations.
> >>>>
> >>>> We consistently encountered this issue up to the 6.16.0-rc4-
> >>>> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/git=
/
> >>>> next/linux-next.git].
> >>>>
> >>>> After applying the aforementioned patch ontop of next-20250630 build=
,
> >>>> I tested it in our virtualization CI and with the autonuma benchmark
> >>>> reproducer described below, and the issue no longer occurred. The
> >>>> patch appears to have resolved the reported problem.
> >>>>
> >>>>
> >>>> git clone https://github.com/pholasek/autonuma-benchmark.git
> >>>> cd autonuma-benchmark
> >>>> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
> >>>> Note: The server running the autonuma-benchmark must have at least t=
wo
> >>>> nodes.
> >>>>
> >>>> If the provided fix is final, please feel free to include the
> >>>> following Tested-by tag:
> >>>>
> >>>> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> >>>> Tested-by: Suneeth D <Suneeth.D@amd.com>
> >>>>
> >>>
> >>>
> >>> I apologize for overlooking that this was a debug patch. With this de=
bug
> >>> patch applied on top of 6.16.0-rc4-next-20250630, I am unable to
> >>> reproduce the issue. However, when I revert this debug patch, I
> >>> encounter the issue again on 6.16.0-rc4-next-20250630.
> >>>
> >>>
> >>
> >> Thank you Aithal, this is a debug + fix patch. And Jirka has confirmed
> >> that this helps somehow. I'll post a formal one and Cc you.
> >>
> >> Thanks,
> >> Chenyu
> >>
> >
> >
>


--=20
-Jirka

