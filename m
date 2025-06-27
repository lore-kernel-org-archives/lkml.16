Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B6339A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021309; cv=none; b=mIBTe1VfROHCkFn4cmlIs1aTMUbPzyIiDeuQlqTMBrFKIRomau4FNzNIKF098T6rVXqDNmcdKfPd5t9KekS9FpM48yePVJAAk3sWuhClOqooVW3IMNB6qYJb/zl1Nu5Zgnb2OMk4MfvtSly2stOftai6l3EDkHFi7s3yiYQiPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021309; c=relaxed/simple;
	bh=eFj1+btSjZEPaH/IW2vBgj13L5OojBs1rm/OILxuOqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ej2z20V/zdapYguSV1warYCW0fizgHpMrM0cwWuZQmBdlGTXwIzaXWN/7dETyY47ud5D+DbQmzKeygRjItkI/X0SMFHXBRgt8Ps/odcd1sTQznlO2cMJWH7kx/Wo3nPoWVI9RriXufY9In7VKdFScEK8hRxEvJByszr4FrTmmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay9yT+yd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay9yT+yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751021306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+mjxlGnLryKd2zVpwd+9SietyVR3akmtZI2lh6mZec=;
	b=Ay9yT+ydvoHbODEb8aGWlqqmDUFZBD5H9uyAg8WZoBysDz1xdLgwCnSw9QiG5+zlAoa2BZ
	wKCMAM+r4HSCThqXWl4CfotC+zdEsDCycoBUc88/sYvaR0suhxgjd3ZmX0iRVviSc5eBPk
	78roJ0VPT9BHGLhtjgBSIWxRT/fJ2o4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-OHBknTC3N1CC6ZMy_z0uyg-1; Fri, 27 Jun 2025 06:48:25 -0400
X-MC-Unique: OHBknTC3N1CC6ZMy_z0uyg-1
X-Mimecast-MFC-AGG-ID: OHBknTC3N1CC6ZMy_z0uyg_1751021305
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e819c3f8861so2392094276.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021303; x=1751626103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+mjxlGnLryKd2zVpwd+9SietyVR3akmtZI2lh6mZec=;
        b=PxJ0RZWhwp08eoJGkkCmU582fGRNeUqV83VJXTvCgi8q2Y8fu7DW63VZfgzX3MsD/E
         rnsW7JDN+aoY6BDPEgjqBzrJNzGrgQ9/Y6q8XrxMMpxlqtYaLUyj/kCrjy8mb96FSQP4
         C8BG0uWRR56GKA9KAO+ooz3zw8HZcBIkBbn32kBycMsI+XSwsYECv3vf7/VOO4kwo/rh
         dGMD0LM7bOo8+C5YINXKaQo52re4cxmW78afwqHOusU5tChqB4VwKOiUQiYGe0ogAI5+
         90L3QOSVPRCUGVy8r2uRHhj/EJfeRVOBec3l9EHdv7o/kG0TfyoHnfJogf5fpPvcCUgs
         MlJg==
X-Forwarded-Encrypted: i=1; AJvYcCURIf9jP1LxYEkLG5BlnRx7ojw9tC0FK+W0gvrvLapZLjUK/QwHnxCZa2Z2IRZhvk8wWeAZyq0xOyH2mh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxztkxV65Vx/TvxQlss4obCrFP6A8eVfvg8+qOrgZ1jdHuMPiAj
	uTw46ZoJAXaBJv2wRKbLUgUpzvfdSmhtOuPBYXv7ZgF9pBM32Wq9xewqqat1xansk6ECR60Pl10
	HsLk0tpLJlxGGfpHZBnZlWvSudTOnl1UyDbFXpt0Bev/CLJvW9LUoCzBT5b1k8/dFimiBlxV+5J
	qOSxGaHTooqnC6+lzTkSjpNSfwK4OS9f+WY4uXVgjOhFmUBYUAY4MxOg==
X-Gm-Gg: ASbGnctFZa7z7KKMMGTino/XSvFP+3a6cTBi0PJy3Iv98jEY9ax77ZzJ2LxBjtqjF8B
	GEG2/qeHhITmuRZdqRXqAwkpwg5MwUJQMlvXU5ux2oWoJuWUqc2IjvJNg0sBXMs6BwXCJQVrFVc
	NhQw==
X-Received: by 2002:a05:6902:c0f:b0:e82:12a2:dfc1 with SMTP id 3f1490d57ef6-e87a7b8ccf4mr3590900276.46.1751021303180;
        Fri, 27 Jun 2025 03:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAe7KRXOilMJFEytsLHeVrI7k6Z6WK8eFV+oQopYrcMRav0x2t25iN62BLx3l4maANyIAfFcDtwK56JO3RT24=
X-Received: by 2002:a05:6902:c0f:b0:e82:12a2:dfc1 with SMTP id
 3f1490d57ef6-e87a7b8ccf4mr3590873276.46.1751021302838; Fri, 27 Jun 2025
 03:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com> <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com> <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
In-Reply-To: <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 27 Jun 2025 12:48:10 +0200
X-Gm-Features: Ac12FXw-63G1xJH5P3_zJU3Fgvj48yv-7678MraMeusIHO4F5PUVUovhOcnxOSc
Message-ID: <CAE4VaGC2ti=91CE6qsDPkJgUa6vxnMzuNGMXUnj+CxW-9OfKdQ@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Abhigyan ghosh <zscript.team.zs@gmail.com>, linux-kernel@vger.kernel.org, 
	Chen Yu <yu.chen.surf@foxmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenyu,

thank you for the patch! I will test it and get back to you next week.

The issue is quite challenging to reproduce, and it indeed points to a
race condition. I see different benchmarks running when hitting the
kernel panic.

As for stress_ng, we run the subtests like this:

sync; sync; echo 3 > /proc/sys/vm/drop_caches
./stress-ng --fork 24 --verbose --oomable --metrics-brief -t 23 --yaml
$(uname -r)_fork.yaml | tee $(uname -r)_fork.log

We vary the number of threads (in the example above, 24 threads) up to
the maximum number of available CPUs and repeat the tests several
times to record the runtime statistics and variations.

Try to run the test on several servers in parallel to increase the
chances of hitting the problem in a reasonable time.

Thank you
Jirka

On Fri, Jun 27, 2025 at 9:16=E2=80=AFAM Chen, Yu C <yu.c.chen@intel.com> wr=
ote:
>
> Hi Jirka,
>
> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> > Hi Chen and all,
> >
> > we have now verified that the following commit causes a kernel panic
> > discussed in this thread:
> >
> > ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> >
> > Reverting this commit fixes the issue.
> >
> > I'm happy to help debug this further or test a proposed fix.
> >
>
> Thanks very much for your report, it seems that there is a
> race condition that when the swap task candidate was chosen,
> but its mm_struct get released due to task exit, then later
> when doing the task swaping, the p->mm is NULL which caused
> the problem:
>
> CPU0                                   CPU1
> :
> ...
> task_numa_migrate
>    task_numa_find_cpu
>     task_numa_compare
>       # a normal task p is chosen
>       env->best_task =3D p
>
>                                         # p exit:
>                                         exit_signals(p);
>                                            p->flags |=3D PF_EXITING
>                                         exit_mm
>                                            p->mm =3D NULL;
>
>     migrate_swap_stop
>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>
> Could you please help check if the following debug patch works,
> and if there is no issue found after you ran several tests,
> could you please provide the
> /sys/kernel/debug/tracing/trace
>
> BTW, is it possible to share your test script for stress-ng,
> stream? It looks like the stress-ng's fork test case would
> trigger this issue easier in theory.
>
> thanks,
> Chenyu
>
>
> > Thank you!
> > Jirka
> >
> > On Wed, Jun 18, 2025 at 1:34=E2=80=AFPM Jirka Hladky <jhladky@redhat.co=
m> wrote:
> >>
> >> Hi Abhigyan,
> >>
> >> The testing is done on bare metal. The kernel panics occur after
> >> several hours of benchmarking.
> >>
> >> Out of 20 servers, the problem has occurred on 6 of them:
> >> intel-sapphire-rapids-gold-6448y-2s
> >> intel-emerald-rapids-platinum-8558-2s
> >> amd-epyc5-turin-9655p-1s
> >> amd-epyc4-zen4c-bergamo-9754-1s
> >> amd-epyc3-milan-7713-2s
> >> intel-skylake-2s
> >>
> >> The number in the name is the CPU model. 1s: single socket, 2s: dual s=
ocket.
> >>
> >> We were not able to find a clear pattern. It appears to be a race
> >> condition of some kind.
> >>
> >> We run various performance benchmarks, including Linpack, Stream, NAS
> >> (https://www.nas.nasa.gov/software/npb.html), and Stress-ng. Testing
> >> is conducted with various thread counts and settings. All benchmarks
> >> together are running ~24 hours. One benchmark takes ~4 hours. Please
> >> also note that we repeat the benchmarks to collect performance
> >> statistics. In many cases, kernel panic has occurred when the
> >> benchmark was repeated.
> >>
> >> Crash occurred while running these tests:
> >> Stress_ng: Starting test 'fork' (#29 out of 41), number of threads 32,
> >> iteration 1 out of 5
> >> SPECjbb2005: Starting DEFAULT run with 4 SPECJBB2005 instances, each
> >> with 24 warehouses, iteration 2 out of 3
> >> Stress_ng: test 'sem' (#30 out of 41), number of threads 24, iteration
> >> 2 out of 5
> >> Stress_ng: test 'sem' (#30 out of 41), number of threads 64, iteration
> >> 4 out of 5
> >> SPECjbb2005: SINGLE run with 1 SPECJBB2005 instances, each with 128
> >> warehouses, iteration 2 out of 3
> >> Linpack: Benchmark-utils/linpackd, iteration 3, testType affinityRun,
> >> number of threads 128
> >> NAS: NPB_sources/bin/is.D.x
> >>
> >> There is no clear benchmark triggering the kernel panic. Looping
> >> Stress_ng's sem test looks, however, like it's worth trying.
> >>
> >> I hope this helps. Please let me know if there's anything I can help
> >> with to pinpoint the problem.
> >>
> >> Thanks
> >> Jirka
> >>
> >>
> >> On Wed, Jun 18, 2025 at 7:19=E2=80=AFAM Abhigyan ghosh
> >> <zscript.team.zs@gmail.com> wrote:
> >>>
> >>> Hi Jirka,
> >>>
> >>> Thanks for the detailed report.
> >>>
> >>> I'm curious about the specific setup in which this panic was triggere=
d. Could you share more about the exact configuration or parameters you use=
d for running `stress-ng` or Linpack? For instance:
> >>>
> >>> - How many threads/cores were used?
> >>> - Was it running inside a VM, container, or bare-metal?
> >>> - Was this under any thermal throttling or power-saving mode?
> >>>
> >>> I'd like to try reproducing it locally to study the failure further.
> >>>
> >>> Best regards,
> >>> Abhigyan Ghosh
> >>>
> >>> On 18 June 2025 1:35:30=E2=80=AFam IST, Jirka Hladky <jhladky@redhat.=
com> wrote:
> >>>> Hi all,
> >>>>
> >>>> I=E2=80=99ve encountered a reproducible kernel panic on 6.16-rc1 and=
 6.16-rc2
> >>>> involving a NULL pointer dereference in `__migrate_swap_task()` duri=
ng
> >>>> CPU migration. This occurred on various AMD and Intel systems while
> >>>> running a CPU-intensive workload (Linpack, Stress_ng - it's not
> >>>> specific to a benchmark).
> >>>>
> >>>> Full trace below:
> >>>> ---
> >>>> BUG: kernel NULL pointer dereference, address: 00000000000004c8
> >>>> #PF: supervisor read access in kernel mode
> >>>> #PF: error_code(0x0000) - not-present page
> >>>> PGD 4078b99067 P4D 4078b99067 PUD 0
> >>>> Oops: Oops: 0000 [#1] SMP NOPTI
> >>>> CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
> >>>> 6.16.0-0.rc2.24.eln149.x86_64 #1 PREEMPT(lazy)
> >>>> Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
> >>>> Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
> >>>> RIP: 0010:__migrate_swap_task+0x2f/0x170
> >>>> Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
> >>>> 48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> =
8b
> >>>> bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
> >>>> RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
> >>>> RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
> >>>> RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
> >>>> RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
> >>>> R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
> >>>> R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
> >>>> FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:00000000=
00000000
> >>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>> CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
> >>>> PKRU: 55555554
> >>>> Call Trace:
> >>>> <TASK>
> >>>> migrate_swap_stop+0xe8/0x190
> >>>> multi_cpu_stop+0xf3/0x130
> >>>> ? __pfx_multi_cpu_stop+0x10/0x10
> >>>> cpu_stopper_thread+0x97/0x140
> >>>> ? __pfx_smpboot_thread_fn+0x10/0x10
> >>>> smpboot_thread_fn+0xf3/0x220
> >>>> kthread+0xfc/0x240
> >>>> ? __pfx_kthread+0x10/0x10
> >>>> ? __pfx_kthread+0x10/0x10
> >>>> ret_from_fork+0xf0/0x110
> >>>> ? __pfx_kthread+0x10/0x10
> >>>> ret_from_fork_asm+0x1a/0x30
> >>>> </TASK>
> >>>> ---
> >>>>
> >>>> **Kernel Version:**
> >>>> 6.16.0-0.rc2.24.eln149.x86_64 (Fedora rawhide)
> >>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2732950
> >>>>
> >>>> **Reproducibility:**
> >>>> Happened multiple times during routine CPU-intensive operations. It
> >>>> happens with various benchmarks (Stress_ng, Linpack) after several
> >>>> hours of performance testing. `migration/*` kernel threads hit a NUL=
L
> >>>> dereference in `__migrate_swap_task`.
> >>>>
> >>>> **System Info:**
> >>>> - Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
> >>>> - BIOS: M07 09/03/2021
> >>>> - Config: Based on Fedora=E2=80=99s debug kernel (`PREEMPT(lazy)`)
> >>>>
> >>>> **Crash Cause (tentative):**
> >>>> NULL dereference at offset `0x4c8` from a task struct pointer in
> >>>> `__migrate_swap_task`. Possibly an uninitialized or freed
> >>>> `task_struct` field.
> >>>>
> >>>> Please let me know if you=E2=80=99d like me to test a patch or if yo=
u need
> >>>> more details.
> >>>>
> >>>> Thanks,
> >>>> Jirka
> >>>>
> >>>>
> >>>
> >>> aghosh
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

