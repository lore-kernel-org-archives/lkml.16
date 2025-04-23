Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DE1EDA36
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367585; cv=none; b=vFS1Hht+Xa+3QpVUKGVeE8JVPCDIWA5QuGkpWjV7bGbl/aB8zHiAIum7jz+3qHYFvdMDrwoGc6LxY24nh34s8HfcAJaisMHinQ5k967O4hOa3t2SNOlTU31cvJvfUt4VQ5S7in0vIE0hQB1I2jbCHRS4GNd/q0s2s2iR9Mq4r1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367585; c=relaxed/simple;
	bh=3kmM2qqgxTVB7JWUywAuVTMZugyRWCYS+tSJARSp1qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUSb/Ogi2ZbJSqU4o6CdC56iD7K6Tje26Y+ZLygzFKfodnbKwOfRtj11TOf98VFGDuHsbkvRpyiTynp0X7LFvDhWL68L81ODAO6eojPXvPaFdPourWGxWhjR803+eiKN6qxKP2ouXWkq886naqLTVqSKM/QraiOh+e1eKrB8b/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=flgn3bZJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="flgn3bZJ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47666573242so203811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745367583; x=1745972383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3No/2dtu0+LXKUdzwtUjJdhYkwOoEuO1odhuEfxBQU=;
        b=flgn3bZJblWYlZ/qM/QY6U67Pg7mkAmysLImwbdGVMfSnA/jbhcxF9IMKuECFroMXu
         ENWBoXxoWNDm8OvLADbkT1zJvJw1x/nIsuicEh7e43gpUopAKub8vBMNCmjLQ4/wqmzd
         ZD9Kqc2IDGbyUUEG7HoWFXd2+BWUPcxfETsoI1nK1wiWH51SOsC1LdPOYie8aK/xfGeE
         rXv4XZpkvzF7reEbzoKQ1BkgPDG7MeVFvnt7kKmE0l4fedoWPDIeN2xjxErSZBCTumGE
         6tRREYcUYypC+cYWyNzTqI6rELHk6SR6y9CACO7+QOS/0y00QhDl6a/f2pg2ZgNU71Jf
         b08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745367583; x=1745972383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3No/2dtu0+LXKUdzwtUjJdhYkwOoEuO1odhuEfxBQU=;
        b=sIjrfzt9SVZ94kd3t9RUifMm+MnLPhSfJ1M51fwxBwRykbjUzr1IYUqcLYMT7DyKgo
         sPjdowRR45/7rNe7OTfdKtvoTcSBWnW0itbtxMpRhAz8cwN+NRLhxRuqVkzvoQVImvNV
         d01VqGHbnYz3oZr0MrpGGxFJIGMy0eDkLyzFXYnOWX1kN6Ap0TxkZC3YbxS/h4rsKjTv
         wEVCfL2us29I1wd1JsiprtkSDqoS20sT4YRiNQG9ZIchqsLUw76PX7BA4Dd5TPAoYO1A
         9g//Y+tpE9oebDP73049ZIs+7bv4SSHcU54ioXDXkGWmwhAl+Ugc/IGLp3A3zNMZHM2B
         VgNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFNenJ/ASKxhe2pt43MxmC1JHJBvZMtIDxHnszhhtVx6gsPLDOc95kEB0G7SSj8BSma2UZ/CVPPvuI3WE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCD3eXnGW0i9b+jv2VQE4f2UdF8v33DJH1j08T5pdVkaOuGQoJ
	jZKbbE8gXeqVSLBs0MLUDw0nNrd+TEFumz+LtT1crdN1e4zabz1EhxFADpUIR9Hsm9Ex+XLqzdy
	Db2YrAzGi8epnGFoG1ZCf23r1KnZ+kf2wjKH/
X-Gm-Gg: ASbGncsWt4Yob4Ss0O8gMQrUPkrROlaX/lK5yEBrPxTLtx/++gf6T3/rPRGp56+NE2c
	yt9oW+QuMPQP63uAkLoFtfxvUuwjQXOiNp1QOPZtsGRXPGO4o9J+qsRJ0tbTz0QAxpEOMMGSzZu
	BmmvxI8phHdFw2q2lUJZ2a2B5q2nWEUc382Ets+q/dkS2rp2rcqo4N2slwIx0SNrI=
X-Google-Smtp-Source: AGHT+IH7IorgCmV+iTHjEMuegFoDGcglumG/XFNa/8Q0aSWzo413n+eMzU+6LX09zNqmBYpuTFc45XT/cHmnWQol8zM=
X-Received: by 2002:a05:622a:5106:b0:477:1f57:5493 with SMTP id
 d75a77b69052e-47d139f00e8mr1861481cf.20.1745367582741; Tue, 22 Apr 2025
 17:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com> <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
In-Reply-To: <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 22 Apr 2025 17:19:31 -0700
X-Gm-Features: ATxdqUHmT4ZISXhJZbUGDnKoBch92eAZqzRFMlN3Azi0veRBlQYlRe8wECJBt5g
Message-ID: <CAJuCfpF4SbPWMgECD89e=QDcrCTNqnchYZ=dpod-cdRxfsCtjA@mail.gmail.com>
Subject: Re: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation failure
To: Andrew Morton <akpm@linux-foundation.org>
Cc: gaoxu <gaoxu2@honor.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:02=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 22 Apr 2025 11:39:30 +0000 gaoxu <gaoxu2@honor.com> wrote:
>
> > In android16-6.12, enabling CONFIG_MEM_ALLOC_PROFILING causes some modu=
les
> > to fail to load during boot because of failed percpu memory allocation.
>
> Which modules?  If they're in-tree modules then we should fix this
> issue in -stable kernels also.
>
> If they're out-of-tree modules then what argument is there for altering
> the mainline kernel?

These are most likely out-of-tree modules from an Android partner.

>
> > [811:modprobe]percpu: allocation failed, size=3D5200 align=3D8 atomic=
=3D0, alloc
> > from reserved chunk failed
> > [811:modprobe]Call trace:
> > [811:modprobe] dump_backtrace+0xfc/0x17c
> > [811:modprobe] show_stack+0x18/0x28
> > [811:modprobe] dump_stack_lvl+0x40/0xc0
> > [811:modprobe] dump_stack+0x18/0x24
> > [811:modprobe] pcpu_alloc_noprof+0x96c/0xb58
> > [811:modprobe] percpu_modalloc+0x50/0xec
> > [811:modprobe] load_module+0x1158/0x153c
> > [811:modprobe] __arm64_sys_finit_module+0x23c/0x340
> > [811:modprobe] invoke_syscall+0x58/0x10c
> > [811:modprobe] el0_svc_common+0xa8/0xdc
> > [811:modprobe] do_el0_svc+0x1c/0x28
> > [811:modprobe] el0_svc+0x40/0x90
> > [811:modprobe] el0t_64_sync_handler+0x70/0xbc
> > [811:modprobe] el0t_64_sync+0x1a8/0x1ac
> > [811:modprobe]ipam: Could not allocate 5200 bytes percpu data
> >
> > Increase PERCPU_MODULE_RESERVE to resolve this issue.
> >
> > ...
> >
> > --- a/include/linux/percpu.h
> > +++ b/include/linux/percpu.h
> > @@ -16,7 +16,7 @@
> >  /* enough to cover all DEFINE_PER_CPUs in modules */
> >  #ifdef CONFIG_MODULES
> >  #ifdef CONFIG_MEM_ALLOC_PROFILING
> > -#define PERCPU_MODULE_RESERVE                (8 << 13)
> > +#define PERCPU_MODULE_RESERVE                (8 << 14)
> >  #else
> >  #define PERCPU_MODULE_RESERVE                (8 << 10)
> >  #endif
>
> PERCPU_MODULE_RESERVE is a pretty unpleasant thing.  It appears that it
> gives us the choice between either wasting memory or failing module
> loading.  But I expect that something more dynamic would be a ton of work=
.

Allocating this reserved area dynamically would be ideal. OTOH this
change increases the area size from 64kb to 128kb. Don't know how much
effort we should put into it.
