Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FA215F42
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683810; cv=none; b=iSOjLX4P5UkwK0feGTCKIfDAYLHuAAGiMT0R/yU706zTcHisacuofR3ePKo08edOYF5cFal7dWuUi13Cz3xI1X7NSNaBwbP5RCcATN9oEyXNdXPZvaDlVeVKtEVTnddR33yA1SGBFn8yZRSbxNs41VSP/veXWgln+9ZFlkX2q08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683810; c=relaxed/simple;
	bh=e/UexMOksvrB7O7Khta4wWDeQSE8uGdbLbqYSlNtCVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMwePOV+76n4VvzuqOcE6VNVxPqGFEyIcg8O5SPcH8N8mM1K5746XDjVK+xZs8J3bMcBiAWZE583RHPr6PTSMBbEEmVMbGsdmBtOJ1fxQRWjvBW+VlKcLXn+QcXvdxOkbfOE1WHoMKgxWunOm3f6ScHkNAi/nb/BJw0i/e7f+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE/1l29v; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE/1l29v"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4811fca8658so7465681cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746683807; x=1747288607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnVj8k1zwwEofkYD3XL9RaU892pM/QGPFfaIpSHsXac=;
        b=jE/1l29v4k3cAPtLnE95xEFHmuO4l5IqIaZMdnGqRqX9S4O3AD9DDQH67vHR/tXk6c
         lQrES2DqIY/9Iv4tsFeTpsS+dRvK807E8jHvJx/QBgvd4CuSqLwPYBs5Kt2Dv/7oUlKG
         OpOByoTPMNC/onT90o7YTfR2KvZs2+zHDXIrgZ24lSFx+7Jt2I8k5T7KSQjOCdFLuMqh
         K9RmX8im6XezrJIDi1VV5s/foVUNymyb+yBaSJtIf6507sn0F45tsLO532h44GMVsJkU
         BHCMpy8HhtF1rV0mDPuooaJZFg/+qDqZZNgzxITTTfv98/iqbxr3Iuj84CzmI7AHzneB
         nyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683807; x=1747288607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnVj8k1zwwEofkYD3XL9RaU892pM/QGPFfaIpSHsXac=;
        b=k/PBsQ5RVBNEqZR5J0MngDjYy2W7IsP22v0tRe3XbxXYOI5u45jR4u8XjrFqmvPEw7
         qv6rKTlb3H0lO+dkTjHNq2dWOSDb8auW3DE0UPSxYrmdpwrCvsSCk7ySXlcOXZipJdIH
         gGXjQwg5QBCt8YYlZ67pdhHC540oy8d8SgXWLLBr0tbRhvgxPDwrewSBpLB8TaO73mZg
         tsd+7e2yx+LBnUeT3PSNVTr9e9wtNckMarHGf1FC5PMLSXcbpOUusN6dAGpeaHzJuZIw
         nR/ezf+SAK/NSYY/LT7w9o9LDTZctpiv7RwfLGHNuvxpQqEQbo2qnbSfGoZopOCSyRDD
         kzxg==
X-Forwarded-Encrypted: i=1; AJvYcCW89cQa8hYVmIgVtZiR0vEYlNG0XharXiqcebqNidLZRuk2y0USKaS6L7ZxBpvFA0LJmJoSZHXp2+mLXOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGr5MQ74JhOd/MZH+rhw/EZhS1Addy64rLF1ToY5i2hYl5tuYj
	EBxkse1LeiR7l4DK/t3JC8+xhps/aA1LdTIFNBYbd4PiY89bUi+9zmuHm+4wOXFbdghip1DzQf6
	8PylIG8svp+8rrS7h+iri8gBKrYkkiM1y6wM=
X-Gm-Gg: ASbGncuYzdYmujPcokA2zzTD4GPK9GY+G5VGMXc4Z6kZwhjncwQswiE32oS2JXcZ87O
	1syVgP2Ofv+UNlLTyaMZMcJa0sC0wEHuODRcP3ezJj33hxSS5r4YYeeM1wWMdgI36j2QG68BXAF
	7PKmPHZne2QOmKwxnnjq7vteY=
X-Google-Smtp-Source: AGHT+IGR1FCkvcCTahpXI6m3x4+dHEqmv+jSBLte9BSLjO/d0R0hLxDzTdTwTZV/x4i3IpHa+jDFC5JmyyaHLAXkWEs=
X-Received: by 2002:a05:6214:19cc:b0:6e8:f8ef:d659 with SMTP id
 6a1803df08f44-6f5429e56e9mr76955286d6.10.1746683796676; Wed, 07 May 2025
 22:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506170924.3513161-14-mingo@kernel.org> <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>
 <aBsGXCKX8-2_Cn9x@gmail.com> <CALOAHbDGSpDnzQ7AKiMci0708DwYr8gmruVGdJZ_Nt9rmnbxNg@mail.gmail.com>
 <aBuI36FCDbj20x28@gmail.com>
In-Reply-To: <aBuI36FCDbj20x28@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 8 May 2025 13:56:00 +0800
X-Gm-Features: ATxdqUGkRbcH98Qh8IUQY5OVLZ7ok9mFHZWNiDSj6hUhvHDdfRa3YhOZaXIBnv4
Message-ID: <CALOAHbBK9_PTzZRxwcPc8uFSBFMmKq5-xJXeyRAZ91wA5gZ1VQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, ardb@kernel.org, arnd@arndb.de, bp@alien8.de, 
	dwmw@amazon.co.uk, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	michal.lkml@markovi.net, tglx@linutronix.de, torvalds@linux-foundation.org, 
	vkuznets@redhat.com, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 12:23=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Yafang Shao <laoar.shao@gmail.com> wrote:
>
> > On Wed, May 7, 2025 at 3:06=E2=80=AFPM Ingo Molnar <mingo@kernel.org> w=
rote:
> > >
> > >
> > > * Yafang Shao <laoar.shao@gmail.com> wrote:
> > >
> > > > Hello Mingo,
> > > >
> > > > > +CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > > > > +CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > > >
> > > > Enabling CONFIG_IRQ_TIME_ACCOUNTING=3Dy can lead to user-visible be=
havioral
> > > > changes. For more context, please refer to the related discussion h=
ere:
> > > > https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail=
.com/ .
> > >
> > > Yeah. I actually agree with your series. It (re-)includes IRQ/softirq
> > > time in task CPU usage statistics even under IRQ_TIME_ACCOUNTING=3Dy,
> > > while still keeping the finegrained IRQ/softirq statistics as well,
> > > correct?
> >
> > Correct.
> >
> > >
> > > The Kconfig option is also arguably rather misleading:
> > >
> > > config IRQ_TIME_ACCOUNTING
> > >         bool "Fine granularity task level IRQ time accounting"
> > >         depends on HAVE_IRQ_TIME_ACCOUNTING && !VIRT_CPU_ACCOUNTING_N=
ATIVE
> > >         help
> > >           Select this option to enable fine granularity task irq time
> > >           accounting. This is done by reading a timestamp on each
> > >           transitions between softirq and hardirq state, so there can=
 be a
> > >           small performance impact.
> > >
> > > It only warns about a small performance impact, but doesn't warn that
> > > CPU accounting is changed in an incompatible fashion that surprises
> > > tooling...
> >
> > Yes, this breaks our userspace tools.
>
> Okay, so 2 out of your 3 fixes are upstream already:
>
>   763a744e24a8 ("sched: Don't account irq time if sched_clock_irqtime is =
disabled")
>   a6fd16148fdd ("sched, psi: Don't account irq time if sched_clock_irqtim=
e is disabled")

Right.

>
> But we don't have this one yet:
>
>   [PATCH v8 4/4] sched: Fix cgroup irq time for CONFIG_IRQ_TIME_ACCOUNTIN=
G
>
>   https://lore.kernel.org/r/20250103022409.2544-5-laoar.shao@gmail.com
>
> which is also essential to fully fix the tooling regression, right?

This patch resolves the container tooling regression but does not
address tools depending on getrusage() for CPU measurement. The
getrusage() fix will be implemented in a subsequent patch.

>
> I think this last patch fell between the cracks, I didn't see any
> fundamental objections against the fix.
>
> Since the patch does not apply cleanly anymore, mind sending a fresh
> -v9 version against v6.15-rc5 or so?

I will send a new version.

--=20
Regards
Yafang
