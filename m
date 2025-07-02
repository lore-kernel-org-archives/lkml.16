Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9381C25D1FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457206; cv=none; b=E6fjCWpEnmJGWFTmshT681D9i9nS6J5OlCS+tUddwE9G5xuLIU7UtFSBlEX5LeHFQiRR1rg7UWQzbI2cFnJLqqDm1J5IeIsMobZgAs/8iJzbjNgmMcYa+wcIPeG+S7J+ziu3V0rh1nTuNEX8VYbGDeCALq5hO19RUjH8fD9Kz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457206; c=relaxed/simple;
	bh=pBAQRvIMLCOIUWg2AnFiynE5ynX/9slk/WzderQksdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIJVU0IkbopDgIEt/cwOJbtOF0ipC/1UNSuPssjGqzklr5xFP4jrx/vg8FNGgsbZw8F2+dokw+3NEXv/Nj9mQn0E0SqqvzmIbvpOvdTwEYpJiwUPzJ2rMCES8yW+r4umq9EfhJ0nuWMoPjP0lRqwYlJu20a9eWYZrL3BljHWmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XerYiVBM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XerYiVBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751457203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb0rvgLx6x0ReK5tYnz2tSw29gjJy9fXBNnYeKLe10Y=;
	b=XerYiVBMN/EVxBeuM7N1d/Ps1rEzWofqYM4RNnTygftsjmpom08Rm5TQgmjvYijccY5FH/
	faikYhUVmtJbxzgRASGlK4TNBcEz04XCp9DJam7Z4qbIi2HQifMbJWffHkVwOMp5RC8Wfd
	wxQxFFbeGke5hb2mGE6OydtmzuiVQDY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-M0d_Qmk1Msq-ypV7obqcqg-1; Wed, 02 Jul 2025 07:53:17 -0400
X-MC-Unique: M0d_Qmk1Msq-ypV7obqcqg-1
X-Mimecast-MFC-AGG-ID: M0d_Qmk1Msq-ypV7obqcqg_1751457196
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b460a1aa1so15757631fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457196; x=1752061996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb0rvgLx6x0ReK5tYnz2tSw29gjJy9fXBNnYeKLe10Y=;
        b=B/BSn3fwIhJJogoLRG7Z64OdPGWYkAWSA94kCL6C/eAcJcU0x0lhWKQN4NbSP8pFKV
         46KwPe++ugGZ4MY8kh+3ZxW6MMGrZ2jusKLrYwQ3j+QFv6CPTO1j9CzYJUyQeWBwBKcR
         CnRkNp7UNMCVRBZnFyrpAzmmUK6PpHm5rDDNDNC8SdZTuBCVIf0EnONO/Mbq9Qz4H3sC
         aKmzwoYnHAo2cMF4bXjdyx4j1grywRQpS4SYe2rxKXCCfluY+c6ijiX6AkUd6uj7B6JK
         mASRKXzXpQwh6Se/20q9nFqydRdT4ehkV3MPJy/6GPqZgj1tsvRgGDM83bkLHHNRWOiB
         ziGw==
X-Forwarded-Encrypted: i=1; AJvYcCUYjpUrdSyLcxaXevf3POIdxPLLVNlNnqFt8RGN9XAiaSIuc7RuBZu2nmBiJ2bEcd/tR4D4VzaKwpbvTIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrwA/237sLE2DB/VCrrwqRnsbLtjQpCK9UqSUGslbwR8Fx28K
	EV/BM0mJhpNBqYzE51y5JZJYRRz05Hn3AXZJ+zDQkD6v+++6Qp4jKSeQ/cMegfBfiSyoH2VLCEw
	YmAHksGBIoNkyqz3HpcTUcWMGe+DYCOdmJJKwpAOiILJXThzT939U72A6u8EPeOVH0mEaHBqu3f
	GjmCJEnCoLv3chm+gUhOofGXd3fchmTJU0tnSCPgL6
X-Gm-Gg: ASbGnctazvzjEmIvMhDZSrzji+SHlcl2pCTgAS3WsTE8Lsy43xurZpsdqlm6T70f6HD
	t7r4gvo8T9ndg/xoy8yOal6+91Qaa/p2HjSUty52YSNmLvx18MphK33vznEcWzicCGjFZry2PF2
	JEHlg=
X-Received: by 2002:a2e:9643:0:b0:32b:35e6:bbe8 with SMTP id 38308e7fff4ca-32e0006a092mr8147531fa.21.1751457195773;
        Wed, 02 Jul 2025 04:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS5wtDo61UlgHmOi1QKC5V1RTSZ057e5wGRAemWuD/fixPLyVpNMT7qoH9FPOsuvXhYLpp0H/i9CDErhM2+4o=
X-Received: by 2002:a2e:9643:0:b0:32b:35e6:bbe8 with SMTP id
 38308e7fff4ca-32e0006a092mr8147481fa.21.1751457195322; Wed, 02 Jul 2025
 04:53:15 -0700 (PDT)
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
 <0ec290aa-0e9b-49cc-9dd7-2f58c51b6d22@intel.com>
In-Reply-To: <0ec290aa-0e9b-49cc-9dd7-2f58c51b6d22@intel.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 2 Jul 2025 13:53:03 +0200
X-Gm-Features: Ac12FXyuDQQ04F6uwUZD-NQpPQP1ccdfzPc8SyW2XeqPYn90Mnj-QAe6dvf2JOc
Message-ID: <CAE4VaGDgta2PrG2WhPQ6KndZd3pAf5Fh9oJEf9k1eZ4492Aw_g@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>, Abhigyan ghosh <zscript.team.zs@gmail.com>, 
	linux-kernel@vger.kernel.org, Suneeth D <Suneeth.D@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aithal,

thank you for the reproducer.

With the patched kernel, after running a reproducer, please do

cat /sys/kernel/debug/tracing/trace

If the counter is nonzero like this:
entries-in-buffer/entries-written: 1/1

please post the `cat /sys/kernel/debug/tracing/trace` here.

It would be helpful to check if there are any other race conditions
besides the task exit.

Thank you!
Jirka

On Wed, Jul 2, 2025 at 1:17=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> wro=
te:
>
> On 7/2/2025 3:36 PM, Aithal, Srikanth wrote:
> >
> >
> > On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
> >> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
> >>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> >>>> Hi Jirka,
> >>>>
> >>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> >>>>> Hi Chen and all,
> >>>>>
> >>>>> we have now verified that the following commit causes a kernel pani=
c
> >>>>> discussed in this thread:
> >>>>>
> >>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> >>>>>
> >>>>> Reverting this commit fixes the issue.
> >>>>>
> >>>>> I'm happy to help debug this further or test a proposed fix.
> >>>>>
> >>>>
> >>>> Thanks very much for your report, it seems that there is a
> >>>> race condition that when the swap task candidate was chosen,
> >>>> but its mm_struct get released due to task exit, then later
> >>>> when doing the task swaping, the p->mm is NULL which caused
> >>>> the problem:
> >>>>
> >>>> CPU0                                   CPU1
> >>>> :
> >>>> ...
> >>>> task_numa_migrate
> >>>>    task_numa_find_cpu
> >>>>     task_numa_compare
> >>>>       # a normal task p is chosen
> >>>>       env->best_task =3D p
> >>>>
> >>>>                                         # p exit:
> >>>>                                         exit_signals(p);
> >>>>                                            p->flags |=3D PF_EXITING
> >>>>                                         exit_mm
> >>>>                                            p->mm =3D NULL;
> >>>>
> >>>>     migrate_swap_stop
> >>>>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
> >>>>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> >>>>
> >>>> Could you please help check if the following debug patch works,
> >>>
> >>> Attached the patch:
> >>>
> >>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>> index 8988d38d46a3..82fc966b390c 100644
> >>> --- a/kernel/sched/core.c
> >>> +++ b/kernel/sched/core.c
> >>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct
> >>> task_struct *p, int cpu)
> >>>   {
> >>>       __schedstat_inc(p->stats.numa_task_swapped);
> >>>       count_vm_numa_event(NUMA_TASK_SWAP);
> >>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>> +    if (unlikely(!p->mm)) {
> >>> +        trace_printk("!! (%d %s) flags=3D%lx\n", p->pid, p->comm,
> >>> +                p->flags);
> >>> +    } else {
> >>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> >>> +    }
> >>>
> >>>       if (task_on_rq_queued(p)) {
> >>>           struct rq *src_rq, *dst_rq;
> >>
> >> I was encountering the same issue as mentioned earlier in this thread,
> >> which has been recurring in our daily linux-next CI builds within our
> >> virtualization CI stream where we observed this BUG appearing randomly
> >> during the runs.
> >>
> >> Additionally, we were able to reproduce this issue while running the
> >> autonuma benchmark. As mentioned earlier, the BUG would occur randomly
> >> across iterations, typically between the 5th and 10th iterations.
> >>
> >> We consistently encountered this issue up to the 6.16.0-rc4-
> >> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/git/
> >> next/linux-next.git].
> >>
> >> After applying the aforementioned patch ontop of next-20250630 build,
> >> I tested it in our virtualization CI and with the autonuma benchmark
> >> reproducer described below, and the issue no longer occurred. The
> >> patch appears to have resolved the reported problem.
> >>
> >>
> >> git clone https://github.com/pholasek/autonuma-benchmark.git
> >> cd autonuma-benchmark
> >> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
> >> Note: The server running the autonuma-benchmark must have at least two
> >> nodes.
> >>
> >> If the provided fix is final, please feel free to include the
> >> following Tested-by tag:
> >>
> >> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> >> Tested-by: Suneeth D <Suneeth.D@amd.com>
> >>
> >
> >
> > I apologize for overlooking that this was a debug patch. With this debu=
g
> > patch applied on top of 6.16.0-rc4-next-20250630, I am unable to
> > reproduce the issue. However, when I revert this debug patch, I
> > encounter the issue again on 6.16.0-rc4-next-20250630.
> >
> >
>
> Thank you Aithal, this is a debug + fix patch. And Jirka has confirmed
> that this helps somehow. I'll post a formal one and Cc you.
>
> Thanks,
> Chenyu
>


--=20
-Jirka

