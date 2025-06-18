Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A431E98FB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246471; cv=none; b=cPwdFf8tEzo7ETIT66RWfF/3hCJkBd+czrCWNRPQf9QI8E4dq06T5zTnrksbgMIu7KXEmCKjScmwGux9Rg+ZP13b8dTdI2MUjJ9+K34PTOhgH3R70RHRoC/uXECO39Jrm94PS7+L8z0TkmfMFgtJy2mOKAWsaajRTjiUT/KXOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246471; c=relaxed/simple;
	bh=CoLo+FgMJz2IqrSJoJbIQsMOlVFdg/xqNozMAo+4OGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHewq2bhMHK4orl/ru2RHKYVxuQb1n7XZc5aFLESl5lbnOlY8nx5fINoGoO1XpVDsrMnA8BesSeuz/6uG/SOUUVYTu5Hou+Fmg357RW8oe+w/q7JRJHNm3Ejy0WDOKt+VOcylWYOX732PBmsGDwxwm24nz2iLTOaezbR5/s0ezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMRw1BLr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMRw1BLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750246468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsp4uTmjHQYRzNNqZvWXnRPYFjfyM6c/Xq5fDqrdLyE=;
	b=KMRw1BLrLs8SXzenjex+CoxYYOvdZmYMINIDmpKE5lqIk3/p5gt2g9L2Di1oysJMNUrGUc
	n1o902ELhyYuS5D+7MnIOTjwtMS5eS/StJsmyIQvnbEtJXzQhcU1kAVYN0ij5+8JTFHODW
	iQI+69n0C4N+E8fwTinQ2k17fCkXwJM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-z54Z1F6UPpeYgkgyNdxaJw-1; Wed, 18 Jun 2025 07:34:26 -0400
X-MC-Unique: z54Z1F6UPpeYgkgyNdxaJw-1
X-Mimecast-MFC-AGG-ID: z54Z1F6UPpeYgkgyNdxaJw_1750246465
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-32b4b645bb4so16929561fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246464; x=1750851264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsp4uTmjHQYRzNNqZvWXnRPYFjfyM6c/Xq5fDqrdLyE=;
        b=P6w67boOsM4EdvqKLK7JxsDL4f3mb0/f+BQrQHAit6LLpuPjVDqmu8CKJsLsXp8p9n
         KHaqi4r03mrs/3pEXXaJAn0kGthUuOa7BkqkRzEb9Ip+Sf1Cf+/eIvVeMiZQKvppiyMx
         HAUDBCfvUvwhuxdYtExJ5oKCzg2QNz/EQ2WmQTGXR3cncNUkn3yGsusBCOpGWZQA1REK
         N52m/JG6Yaej2rLk6gnv6nXobSeGTNTJ3RhHrDIkIMRHRCAgLQ3bo94kE8Wi0f957I/X
         aDj3wlfHZokHrKoE/5lBY5CTeDeDY5Mb/RzUy8DScaT53ZGkY68QSXO7HFU8FJJD3cqO
         4U4g==
X-Gm-Message-State: AOJu0YwN9yjzLfrCfSDbEX5OKu2YGBn8B2X63GtXlM3To4yNo6XFAo1N
	/xYyMlUyPfO8/rwVBf7bvNDlfIXox20DQeHnxB361w9a9WTUg7BHbyZMsz16w/1p0iW4E5TbWzi
	TMFcKrYEa7rqojgO1TENNzJ0+AABY9VUCKenN3fSlq+EdIhMMsExuN0aizRTkqkGvDc71TnyZhK
	Gy0QdpWybGSEPrlsZ+0M+Vblbmr9jIOvRqfSUEM3pJApfo03iX0l0=
X-Gm-Gg: ASbGnctl/99kgwsnKdE29lqjGgYiE5CvHHlq1j3LUJh0Oi/GF1r5o0eDlcPg05nUSVn
	PhgAM4JVcdqzhfYTt4AbVAA9tJkYHlORY7JPA8tUyJ7oghSJzJPggaVIZlL6wleS2f0M/ATdHw+
	K04Po=
X-Received: by 2002:a05:651c:b1f:b0:32b:5179:a7d with SMTP id 38308e7fff4ca-32b51790fc2mr42291001fa.17.1750246463699;
        Wed, 18 Jun 2025 04:34:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa49VV+fUM3sv9hDa7n+Z2ZkH7lM9w4Iy8hiyGw2suf06NKT6/EvLnlZklRn372ZExt3eS+CKC0Qr/IlRMItc=
X-Received: by 2002:a05:651c:b1f:b0:32b:5179:a7d with SMTP id
 38308e7fff4ca-32b51790fc2mr42290911fa.17.1750246463242; Wed, 18 Jun 2025
 04:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
In-Reply-To: <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 18 Jun 2025 13:34:11 +0200
X-Gm-Features: AX0GCFtJEiOJ04EUwUJCJNL3aHaGxpXX_mqIgaqySr1gb55cWA0otDhOVj0NVbA
Message-ID: <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhigyan,

The testing is done on bare metal. The kernel panics occur after
several hours of benchmarking.

Out of 20 servers, the problem has occurred on 6 of them:
intel-sapphire-rapids-gold-6448y-2s
intel-emerald-rapids-platinum-8558-2s
amd-epyc5-turin-9655p-1s
amd-epyc4-zen4c-bergamo-9754-1s
amd-epyc3-milan-7713-2s
intel-skylake-2s

The number in the name is the CPU model. 1s: single socket, 2s: dual socket=
.

We were not able to find a clear pattern. It appears to be a race
condition of some kind.

We run various performance benchmarks, including Linpack, Stream, NAS
(https://www.nas.nasa.gov/software/npb.html), and Stress-ng. Testing
is conducted with various thread counts and settings. All benchmarks
together are running ~24 hours. One benchmark takes ~4 hours. Please
also note that we repeat the benchmarks to collect performance
statistics. In many cases, kernel panic has occurred when the
benchmark was repeated.

Crash occurred while running these tests:
Stress_ng: Starting test 'fork' (#29 out of 41), number of threads 32,
iteration 1 out of 5
SPECjbb2005: Starting DEFAULT run with 4 SPECJBB2005 instances, each
with 24 warehouses, iteration 2 out of 3
Stress_ng: test 'sem' (#30 out of 41), number of threads 24, iteration
2 out of 5
Stress_ng: test 'sem' (#30 out of 41), number of threads 64, iteration
4 out of 5
SPECjbb2005: SINGLE run with 1 SPECJBB2005 instances, each with 128
warehouses, iteration 2 out of 3
Linpack: Benchmark-utils/linpackd, iteration 3, testType affinityRun,
number of threads 128
NAS: NPB_sources/bin/is.D.x

There is no clear benchmark triggering the kernel panic. Looping
Stress_ng's sem test looks, however, like it's worth trying.

I hope this helps. Please let me know if there's anything I can help
with to pinpoint the problem.

Thanks
Jirka


On Wed, Jun 18, 2025 at 7:19=E2=80=AFAM Abhigyan ghosh
<zscript.team.zs@gmail.com> wrote:
>
> Hi Jirka,
>
> Thanks for the detailed report.
>
> I'm curious about the specific setup in which this panic was triggered. C=
ould you share more about the exact configuration or parameters you used fo=
r running `stress-ng` or Linpack? For instance:
>
> - How many threads/cores were used?
> - Was it running inside a VM, container, or bare-metal?
> - Was this under any thermal throttling or power-saving mode?
>
> I'd like to try reproducing it locally to study the failure further.
>
> Best regards,
> Abhigyan Ghosh
>
> On 18 June 2025 1:35:30=E2=80=AFam IST, Jirka Hladky <jhladky@redhat.com>=
 wrote:
> >Hi all,
> >
> >I=E2=80=99ve encountered a reproducible kernel panic on 6.16-rc1 and 6.1=
6-rc2
> >involving a NULL pointer dereference in `__migrate_swap_task()` during
> >CPU migration. This occurred on various AMD and Intel systems while
> >running a CPU-intensive workload (Linpack, Stress_ng - it's not
> >specific to a benchmark).
> >
> >Full trace below:
> >---
> >BUG: kernel NULL pointer dereference, address: 00000000000004c8
> >#PF: supervisor read access in kernel mode
> >#PF: error_code(0x0000) - not-present page
> >PGD 4078b99067 P4D 4078b99067 PUD 0
> >Oops: Oops: 0000 [#1] SMP NOPTI
> >CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
> >6.16.0-0.rc2.24.eln149.x86_64 #1 PREEMPT(lazy)
> >Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
> >Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
> >RIP: 0010:__migrate_swap_task+0x2f/0x170
> >Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
> >48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> 8b
> >bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
> >RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
> >RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
> >RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
> >RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
> >R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
> >R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
> >FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:000000000000=
0000
> >CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
> >PKRU: 55555554
> >Call Trace:
> > <TASK>
> > migrate_swap_stop+0xe8/0x190
> > multi_cpu_stop+0xf3/0x130
> > ? __pfx_multi_cpu_stop+0x10/0x10
> > cpu_stopper_thread+0x97/0x140
> > ? __pfx_smpboot_thread_fn+0x10/0x10
> > smpboot_thread_fn+0xf3/0x220
> > kthread+0xfc/0x240
> > ? __pfx_kthread+0x10/0x10
> > ? __pfx_kthread+0x10/0x10
> > ret_from_fork+0xf0/0x110
> > ? __pfx_kthread+0x10/0x10
> > ret_from_fork_asm+0x1a/0x30
> > </TASK>
> >---
> >
> >**Kernel Version:**
> >6.16.0-0.rc2.24.eln149.x86_64 (Fedora rawhide)
> >https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2732950
> >
> >**Reproducibility:**
> >Happened multiple times during routine CPU-intensive operations. It
> >happens with various benchmarks (Stress_ng, Linpack) after several
> >hours of performance testing. `migration/*` kernel threads hit a NULL
> >dereference in `__migrate_swap_task`.
> >
> >**System Info:**
> >- Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
> >- BIOS: M07 09/03/2021
> >- Config: Based on Fedora=E2=80=99s debug kernel (`PREEMPT(lazy)`)
> >
> >**Crash Cause (tentative):**
> >NULL dereference at offset `0x4c8` from a task struct pointer in
> >`__migrate_swap_task`. Possibly an uninitialized or freed
> >`task_struct` field.
> >
> >Please let me know if you=E2=80=99d like me to test a patch or if you ne=
ed
> >more details.
> >
> >Thanks,
> >Jirka
> >
> >
>
> aghosh
>


--=20
-Jirka

