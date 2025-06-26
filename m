Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC21DF980
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974399; cv=none; b=Q/CLXm50tevQ4Q8AEF3Xm8/mIsBew/DyDW7Wulh4MANHvZGZXwE62AOdPnC2iVLeMFLhe2gsdNINzVQ+ZsvoNY7FtEkiFdC8M/VOMkITFsgQpG1mDY6v/V6M8AuSG+Ypc1J4purlV2Vbn1M1JAcAz2YDN6qNCC4TrzEgHtiKYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974399; c=relaxed/simple;
	bh=KW9Lfg+lbmjekAkAI4oT3QKKFoRIwb8Y49FbuyPcryI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brcw+GzlBTrj+nvK7EY39wfjyx1sxqjQwHiEQtJF8GbCmsFu1YRuq52z51pKfHuGQ0KZZJ+otBVH0AfmveyDPFugNFqDVsK9sHbFdnHuECGHdVKiYnmU6rkZrKPdpfKc6jCqFtNUPC3K+3tVaO0HqM7R6luZWLkRnnstRcimGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EVmskrAD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EVmskrAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750974396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEIwcAh//bLSFr11N6r80UvFKVQIKaGAn37cyVp7eJA=;
	b=EVmskrADvXwp3dsj3W0mpZzI4qi1iH0vunjrPTUautYBu8rr9Y6GODR2TbMEPFFzc3peWB
	4qZ/vRQTuXfjHk3oz1kx/TOMYOjLEv2LmffnFcg3eCNNjUMav6VoZ8cSfTAWxW/SLWi/Ug
	N7YYRySlj9PFcrmiRoxwfdl7S67fGzs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-fGpD0pHlNRyPZz8Chtmq5g-1; Thu, 26 Jun 2025 17:46:34 -0400
X-MC-Unique: fGpD0pHlNRyPZz8Chtmq5g-1
X-Mimecast-MFC-AGG-ID: fGpD0pHlNRyPZz8Chtmq5g_1750974393
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32b4a06b775so9352171fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974393; x=1751579193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEIwcAh//bLSFr11N6r80UvFKVQIKaGAn37cyVp7eJA=;
        b=gqUVO9j4veLfIt8FQx3hWV37Zl2GKtgakNqWum4nxcSx0YfLxKGrHyzSwRcgG/jBX7
         cbnwbNHbcMACizDJtZazbY59X9Xh9VOhnqsvkO+vEWuQin5S5Ip+8kKsubviGzyn2lEn
         /5sgEYivORsGK5z61hhshv5RTqDWUkjaXayFFcCzCWm5IVEquPqTKig4iVJfC79GW3P4
         sDljTuIKbMGnfds0Ejci23Zunn0vPm6F8ey7pvRPK8GMDjyBzdpMtZfJARYOFpZ8UXk+
         CgZx1uKUy2Fyew06T6y+PVuyrGJS8yoAHOGzvKX4nojBlYDE7Huq/7Wt9TfMthQU+7xY
         rEYA==
X-Gm-Message-State: AOJu0Yy/eGTTRC4Ei704b8Ivq59aWeIxCjDEWMuntUA9uNXVKKX1kEBm
	jfEf5EUZhnEpPBVHXZxii0kDbEgTIOOXMaa6eKseXQ+/6WYNJATMSYOn8Y1epu3b18nzCZ8i0CG
	NKMGt3okfLYPRmgd+58sB4y4aM2QwBEEmHy/Kh3Jwlf4nSscU1O96IiIiPG3kPUmndGK4lFdos8
	terJggHH0K68zrnVe0MjDIH4V7n7vlwgVE5gP7xwsP
X-Gm-Gg: ASbGnct+QVUKiVz5thJkKze1CYQjiFWONlipxeD1kbQ910DTwH7DX2MVhjC9Vfr9zXi
	R0iUqnFXY0BOE0iawVlN3Z+b9AKq+vst3s2bMbtLOdJKegH1kb6eUxHuVY/yxwGvKuBowWwWeHH
	HZTP4j2+PYjHJO1UvHh7xullcBgoQjUMBrGOVYrw==
X-Received: by 2002:a2e:a554:0:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-32cdc34b9a8mr2496141fa.0.1750974392923;
        Thu, 26 Jun 2025 14:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLkCDPqfuAAv4VonXPu+OfJg/QtaT8+iN7fKBBKniZNSyJLL2MDx7tNa0FDO8wDTWGZLk3qFoakjaiOIojaZk=
X-Received: by 2002:a2e:a554:0:b0:30b:b987:b6a7 with SMTP id
 38308e7fff4ca-32cdc34b9a8mr2496091fa.0.1750974392466; Thu, 26 Jun 2025
 14:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com> <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
In-Reply-To: <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Thu, 26 Jun 2025 23:46:20 +0200
X-Gm-Features: Ac12FXz68Ok5RQxwZUtwTV1YryI-nh8ZzccmBrDaY9K7wbAsJEsem1q94-nvDxQ
Message-ID: <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Abhigyan ghosh <zscript.team.zs@gmail.com>, yu.c.chen@intel.com
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen and all,

we have now verified that the following commit causes a kernel panic
discussed in this thread:

ad6b26b6a0a79 sched/numa: add statistics of numa balance task

Reverting this commit fixes the issue.

I'm happy to help debug this further or test a proposed fix.

Thank you!
Jirka

On Wed, Jun 18, 2025 at 1:34=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> w=
rote:
>
> Hi Abhigyan,
>
> The testing is done on bare metal. The kernel panics occur after
> several hours of benchmarking.
>
> Out of 20 servers, the problem has occurred on 6 of them:
> intel-sapphire-rapids-gold-6448y-2s
> intel-emerald-rapids-platinum-8558-2s
> amd-epyc5-turin-9655p-1s
> amd-epyc4-zen4c-bergamo-9754-1s
> amd-epyc3-milan-7713-2s
> intel-skylake-2s
>
> The number in the name is the CPU model. 1s: single socket, 2s: dual sock=
et.
>
> We were not able to find a clear pattern. It appears to be a race
> condition of some kind.
>
> We run various performance benchmarks, including Linpack, Stream, NAS
> (https://www.nas.nasa.gov/software/npb.html), and Stress-ng. Testing
> is conducted with various thread counts and settings. All benchmarks
> together are running ~24 hours. One benchmark takes ~4 hours. Please
> also note that we repeat the benchmarks to collect performance
> statistics. In many cases, kernel panic has occurred when the
> benchmark was repeated.
>
> Crash occurred while running these tests:
> Stress_ng: Starting test 'fork' (#29 out of 41), number of threads 32,
> iteration 1 out of 5
> SPECjbb2005: Starting DEFAULT run with 4 SPECJBB2005 instances, each
> with 24 warehouses, iteration 2 out of 3
> Stress_ng: test 'sem' (#30 out of 41), number of threads 24, iteration
> 2 out of 5
> Stress_ng: test 'sem' (#30 out of 41), number of threads 64, iteration
> 4 out of 5
> SPECjbb2005: SINGLE run with 1 SPECJBB2005 instances, each with 128
> warehouses, iteration 2 out of 3
> Linpack: Benchmark-utils/linpackd, iteration 3, testType affinityRun,
> number of threads 128
> NAS: NPB_sources/bin/is.D.x
>
> There is no clear benchmark triggering the kernel panic. Looping
> Stress_ng's sem test looks, however, like it's worth trying.
>
> I hope this helps. Please let me know if there's anything I can help
> with to pinpoint the problem.
>
> Thanks
> Jirka
>
>
> On Wed, Jun 18, 2025 at 7:19=E2=80=AFAM Abhigyan ghosh
> <zscript.team.zs@gmail.com> wrote:
> >
> > Hi Jirka,
> >
> > Thanks for the detailed report.
> >
> > I'm curious about the specific setup in which this panic was triggered.=
 Could you share more about the exact configuration or parameters you used =
for running `stress-ng` or Linpack? For instance:
> >
> > - How many threads/cores were used?
> > - Was it running inside a VM, container, or bare-metal?
> > - Was this under any thermal throttling or power-saving mode?
> >
> > I'd like to try reproducing it locally to study the failure further.
> >
> > Best regards,
> > Abhigyan Ghosh
> >
> > On 18 June 2025 1:35:30=E2=80=AFam IST, Jirka Hladky <jhladky@redhat.co=
m> wrote:
> > >Hi all,
> > >
> > >I=E2=80=99ve encountered a reproducible kernel panic on 6.16-rc1 and 6=
.16-rc2
> > >involving a NULL pointer dereference in `__migrate_swap_task()` during
> > >CPU migration. This occurred on various AMD and Intel systems while
> > >running a CPU-intensive workload (Linpack, Stress_ng - it's not
> > >specific to a benchmark).
> > >
> > >Full trace below:
> > >---
> > >BUG: kernel NULL pointer dereference, address: 00000000000004c8
> > >#PF: supervisor read access in kernel mode
> > >#PF: error_code(0x0000) - not-present page
> > >PGD 4078b99067 P4D 4078b99067 PUD 0
> > >Oops: Oops: 0000 [#1] SMP NOPTI
> > >CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
> > >6.16.0-0.rc2.24.eln149.x86_64 #1 PREEMPT(lazy)
> > >Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
> > >Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
> > >RIP: 0010:__migrate_swap_task+0x2f/0x170
> > >Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
> > >48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> 8b
> > >bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
> > >RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
> > >RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
> > >RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
> > >RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
> > >R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
> > >R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
> > >FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:0000000000=
000000
> > >CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
> > >PKRU: 55555554
> > >Call Trace:
> > > <TASK>
> > > migrate_swap_stop+0xe8/0x190
> > > multi_cpu_stop+0xf3/0x130
> > > ? __pfx_multi_cpu_stop+0x10/0x10
> > > cpu_stopper_thread+0x97/0x140
> > > ? __pfx_smpboot_thread_fn+0x10/0x10
> > > smpboot_thread_fn+0xf3/0x220
> > > kthread+0xfc/0x240
> > > ? __pfx_kthread+0x10/0x10
> > > ? __pfx_kthread+0x10/0x10
> > > ret_from_fork+0xf0/0x110
> > > ? __pfx_kthread+0x10/0x10
> > > ret_from_fork_asm+0x1a/0x30
> > > </TASK>
> > >---
> > >
> > >**Kernel Version:**
> > >6.16.0-0.rc2.24.eln149.x86_64 (Fedora rawhide)
> > >https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2732950
> > >
> > >**Reproducibility:**
> > >Happened multiple times during routine CPU-intensive operations. It
> > >happens with various benchmarks (Stress_ng, Linpack) after several
> > >hours of performance testing. `migration/*` kernel threads hit a NULL
> > >dereference in `__migrate_swap_task`.
> > >
> > >**System Info:**
> > >- Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
> > >- BIOS: M07 09/03/2021
> > >- Config: Based on Fedora=E2=80=99s debug kernel (`PREEMPT(lazy)`)
> > >
> > >**Crash Cause (tentative):**
> > >NULL dereference at offset `0x4c8` from a task struct pointer in
> > >`__migrate_swap_task`. Possibly an uninitialized or freed
> > >`task_struct` field.
> > >
> > >Please let me know if you=E2=80=99d like me to test a patch or if you =
need
> > >more details.
> > >
> > >Thanks,
> > >Jirka
> > >
> > >
> >
> > aghosh
> >
>
>
> --
> -Jirka



--=20
-Jirka

