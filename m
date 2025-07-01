Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EB275B04
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382628; cv=none; b=M3gAuNX//QZbN1Jaij5XnKZe6Pxb5Tw1gbhWWJpHXHbYoO/itJFCLHQ2RWXG6T+6DwnxZsS6kQDa9e2YuDi9gcGsJ29BOLrO1kg1ISuu87WzdmGYXYwO2OrMVxEOJv0gjZStpmRPbhZXbKvaJt22PX8eIVwYiYIUjDEQ+x+MhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382628; c=relaxed/simple;
	bh=30M/5ir+bqY7kwFsw3fEqIARjMsvd1bYN1UNJq71nkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au7Y6iY8IlooMj5eW2LKxD/SoDpn/FgTPuEGsZbBT9MGpXVTs4bScUBYyo+VfyHVh02qFefdAhkVyXUQj01Gd6bBc81xwX6Vc74p/2xFjbybrsR/GVqbW9cAiMgte6nUH5J64JQUaVJDIh/j+0r8zFyualJQOIC3rup2svFZH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcLWUlTW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcLWUlTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751382625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEaS53QjzRDZxaTLxU2xjq4c25DJUBkvy0y676VCK38=;
	b=fcLWUlTWSJy9iPyj7b9jcCzebuhaTacEXs3OJ0FgZBrKbQDH2Wu/DyQvkoyHtOmlhMLyyZ
	TEvjUrZABxPt6/xyQF5gHTDv1L/67eOHJJHQbcx+6KCJhJqDxhMyXXKs4gyywFQervfIZE
	MElNO58e/qv4wp8BSHZs9rZWt4CE56E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-Gcz9Q2BbPYmGZ_ds1g5H1Q-1; Tue, 01 Jul 2025 11:10:24 -0400
X-MC-Unique: Gcz9Q2BbPYmGZ_ds1g5H1Q-1
X-Mimecast-MFC-AGG-ID: Gcz9Q2BbPYmGZ_ds1g5H1Q_1751382623
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b3f6114cfso16561721fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382623; x=1751987423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEaS53QjzRDZxaTLxU2xjq4c25DJUBkvy0y676VCK38=;
        b=HJ2SPBoRdMqxB8GipNQIoEJe4iV4WKqqhbt/5UK5uPFImAV5Kv1sW2YkIV2o5/TTqm
         x7eiNR12+bH5Xr7Z4jigfgLtpobFT3H3AHNlg2zAZD5HnpPaun68Y8F1vqaroIRFgHVe
         Kja6jVqHFQY+4h9WjKfRLsP9HTeWjNM4J7njtQ7c7+o+uG/n9Q2e0fQdpXuF7k8Ki5p/
         cUZ6z8fixGq6M8W8/bHIlBsE4R8NFd6zXaXcue064O37SRi0wMApL0Fh3KVMMuy6aH/9
         Y8MAp/kQi+AkX1Gw2zr4dIbotlauzHxX90wjiIZCLMmz1nU6t2vBnf4nYkoqf508KBRz
         fVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJblcWuGApWm3fCkZ0k1hGlGNki2eAkor8VS7UZMpt0cvW9emJeGcIPASbG7BC/gnhDnobBaSyx0Z5ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyek2VRxRhWXajs8bFAl20TAgIUBYCBvSSNOkXHhAtd2y3V9IqN
	/TadmO3B5I/UU4lWnxtvfVSYcv0QSQQFtddjzeUhQtNifrS+WZen2XJCW2m6duZtz9lPXBfyob/
	FWvIGMhDtmodTCJ6BXNTvAUidSnq2ZKVYTfOTWDKVvt+e1bIsviAcYuJJdM58BA5/0MZUSncWbH
	LoCEJw81rY6fUMrHmdsEeHxT93HKsJIbGRRN58BtBm
X-Gm-Gg: ASbGnct3vE/WJQBgi8a7H1AcFLv/rXGsiBXtUOtgUU40nbmRIyrLgW6Jnil/cn7FjLq
	0aEja2Z325CNJvVGOX0Qkf5VTgY0AB0i0Gdmi55OlOG9z9k9W+QkJsNOerKfiP9YCRFu6LlMZVF
	Zjqw==
X-Received: by 2002:a05:651c:54d:b0:32c:ef7a:cbd7 with SMTP id 38308e7fff4ca-32cef7acc7cmr39729281fa.36.1751382622544;
        Tue, 01 Jul 2025 08:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtWR7lI2McNxe2H+EHawpkFWJSkMCC5fU11DErnlMZRKMpMEBcQZACAKS2Fpn3Fx/wot0y9RbmqFd15teDPyM=
X-Received: by 2002:a05:651c:54d:b0:32c:ef7a:cbd7 with SMTP id
 38308e7fff4ca-32cef7acc7cmr39728831fa.36.1751382621923; Tue, 01 Jul 2025
 08:10:21 -0700 (PDT)
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
In-Reply-To: <fe225d57-f1a7-4b54-aa09-6efbc11c9a0c@intel.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Tue, 1 Jul 2025 17:10:09 +0200
X-Gm-Features: Ac12FXxe7GK6iGnoPsRgMs-I_Naqj4BNZzeY0efnDKks0SlhIz4cEveAX0UaOag
Message-ID: <CAE4VaGBoRNSGcfK-_Mnd+fgs11MzkLPdQV9xKs_iwCgaqxE7NQ@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Libo Chen <libo.chen@oracle.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Chen Yu <yu.chen.surf@foxmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenyu and Libo,

I agree, let's wait for the results. Hopefully, we can fix the root
cause based on the debug messages.

There was a problem with the infrastructure over the weekend, so I had
to restart the jobs yesterday. I should have results tomorrow.

Stay tuned.
Jirka


On Tue, Jul 1, 2025 at 4:59=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> wro=
te:
>
> Hi Libo,
>
> On 7/1/2025 3:32 PM, Libo Chen wrote:
> > Hi Chenyu,
> >
> > On 6/27/25 00:33, Chen, Yu C wrote:
> >> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> >>> Hi Jirka,
> >>>
> >>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> >>>> Hi Chen and all,
> >>>>
> >>>> we have now verified that the following commit causes a kernel panic
> >>>> discussed in this thread:
> >>>>
> >>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> >>>>
> >>>> Reverting this commit fixes the issue.
> >>>>
> >>>> I'm happy to help debug this further or test a proposed fix.
> >>>>
> >>>
> >>> Thanks very much for your report, it seems that there is a
> >>> race condition that when the swap task candidate was chosen,
> >>> but its mm_struct get released due to task exit, then later
> >>> when doing the task swaping, the p->mm is NULL which caused
> >>> the problem:
> >>>
> >>> CPU0                                   CPU1
> >>> :
> >>> ...
> >>> task_numa_migrate
> >>>     task_numa_find_cpu
> >>>      task_numa_compare
> >>>        # a normal task p is chosen
> >>>        env->best_task =3D p
> >>>
> >>>                                          # p exit:
> >>>                                          exit_signals(p);
> >>>                                             p->flags |=3D PF_EXITING
> >>>                                          exit_mm
> >>>                                             p->mm =3D NULL;
> >>>
> >>>      migrate_swap_stop
> >>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
> >>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> >>>
> >>> Could you please help check if the following debug patch works,
> >>
> >> Attached the patch:
> >>
> >> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >> index 8988d38d46a3..82fc966b390c 100644
> >> --- a/kernel/sched/core.c
> >> +++ b/kernel/sched/core.c
> >> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_str=
uct *p, int cpu)
> >>   {
> >>       __schedstat_inc(p->stats.numa_task_swapped);
> >>       count_vm_numa_event(NUMA_TASK_SWAP);
> >> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >> +    if (unlikely(!p->mm)) {
> >
> > I am starting to wonder if we should keep this check and add a big fat =
warning
> > like  "there is a bug here, please report it!" rather than brick the ke=
rnel.
> > A kernel panic, for sure, helps catch bugs like this more than a line o=
f dmesg,
> > so it's a tradeoff I guess. What do you think?
> >
>
> I agree with you that adding something like WARN_ON_ONCE()
> could help, and it seems that the kernel panic is not expected
> in this scenario because this feature is a statistic calculation
> rather than the critical logic. Maybe waiting for Jirka's feedback
> to decide the next step.
>
> thanks,
> Chenyu
>
>
>
> >
> > Thanks,
> > Libo
> >
> >> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm,
> >> +                p->flags);
> >> +    } else {
> >> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >> +    }
> >>
> >>       if (task_on_rq_queued(p)) {
> >>           struct rq *src_rq, *dst_rq;
> >
>


--=20
-Jirka

