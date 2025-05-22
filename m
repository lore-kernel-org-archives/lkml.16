Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D321AA1F4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893028; cv=none; b=dTOji44HnSK8wB+zh45ZN5LgsYtygbrAmM+rBlAP1G/6xMt+Z9REZ6+rhtFVIXFCGf2CFyGAxfX9trIe8TGdA+BVPx80mKmWPoVpQUKofrgYk2Wjezar4wjWqynGr6kTeAzkidcaMKQeBnRq0WlpbQg2zQ7he7MkuyF0YWRre4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893028; c=relaxed/simple;
	bh=Br8Z2qLM1alZfuJoGH20Rj2y5Q2janj34N6MoOLCWCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2bJyc54xS4bApyoXcpFJpV6iYcUZNvlAew23x8dEZxEIvBxKd8EvN714DXU5jOw0I2OF4wD3igfjFxRRQyhAvtHbnt6GXIq1IRgtM8EdZW6FPDYoAiU97wKh0MJJscsQhyu9IraSaQEeRt8reiq6YmTgkdYZfDZNyfhwBWQvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLqigToy; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLqigToy"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f8a70fe146so119887146d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747893026; x=1748497826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1qpFnTcgGion41Px5xurQp8nrVCqkHrOjl4A6Q6LuE=;
        b=CLqigToyk1DTFOqMOGhRATE9HESpIz3DWbR8yOl/4ueuxwkN0b6CxaV0ofizQIeXSg
         aCaXafERkcPx80CwwghROxuRM5wIldl757pCFgPRe12Yw5qhjMUWJbYJ3vYYVyr2FPih
         kF7BQ/uBiQYkHULw6abtT4yUQSs88XOoZH+vzsjGJtOSTH8uEWb9Ma4L7AgQ81oSa7Rc
         PL81oP0byj61vZSslblds/1/Yb2YPtH1wyoGWus80/6r21o8OKVwHWL2m1ExAAE7KDHU
         Zaie7gxv2cuDfnOaDPu4z7oa2vl8blu/SejFGgbqSmWoh9W86p3EdWi2I0A66p3OVSHi
         8kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747893026; x=1748497826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1qpFnTcgGion41Px5xurQp8nrVCqkHrOjl4A6Q6LuE=;
        b=TBBtPXscIzDf/G+URNlbTjVL4k3G24Ku/KpDW8H+w2gOwRfPkq20mPNKajTyq1SPp0
         6FeQhG5RXpm2wYT3xN6r6yimXH/BiNcuayxZOLqAxhUysKsnpr3l/AzOm3wpvPA3JRJy
         pHl5IBOtCZeMmTf+h9nkJripn7vspIxN7rrxUXaSfyIKq/YRk5ZK/vuQ+2M6OtrH/GSq
         jzoPwCckhNisJKXf4N9olyy9sc98bMGJEZ0BTqi6Xp7BD1z+PdCCFD5bvRThBk//GRSD
         h6603NP3AUk4OWlpu8ONfSZ7WY5zFw+bMS1UKG+YPKXRNP/sTo/wE1qu7t78QiHY1Anq
         yLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsCqW5qRfDkCOvw7WU1bkVwOihJxlrzfBRr7R2cpZho9961FbevXNhHGZ2Fw9RlbE5utmKg/XcLgQBs8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0IvnmD5PLDf+8vjG0jL19IawIzN8ndgn/RB5aW0c7gteOTZU
	P7m1T2YCf++Wrno8R+3FdjDULOF4T01nl3MlfWCp8PZGxTfqqxOuxxwO7OPmnsty7OCbN7H/mHh
	kz/5XZpoPx21GU/ndP//qtSekkDLk28s=
X-Gm-Gg: ASbGnctw2ZxslWh5NIrbxWwZfRmXpSGmyhx2j/+TIoa8uhxI+0gUC7FkA5tcL4ErFbu
	dGJfB7uBfTyl3RTOI94LIVXpZbQx1R/JBhAlMu1HieAYKgDGH26wj5tmcOeNWS9jxof3tsiGseF
	vtqYR/dTTN61nYi08r7TR3wnkflREXZ2kOGw==
X-Google-Smtp-Source: AGHT+IEuz0/Hk3w1WqWGZ88Lf83NrFuJCU+5jfbmO4GVVOXTbKqmHG3Vv2pva95zhlD6w6VOlLipgPqPBmG44l4cTfI=
X-Received: by 2002:a05:6214:1791:b0:6fa:8c07:2da5 with SMTP id
 6a1803df08f44-6fa8c077b58mr11674146d6.35.1747893026026; Wed, 21 May 2025
 22:50:26 -0700 (PDT)
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
Date: Thu, 22 May 2025 13:49:50 +0800
X-Gm-Features: AX0GCFs3_y9zIWtD_M5cl4KKc9RX8WK1ekAALE1VVu0rnu2S016L9nASt-ZCK9A
Message-ID: <CALOAHbDw1uw-MTYSCk7t22HdVuxwvHgs_FT8f2pvH1GsdGrh4A@mail.gmail.com>
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
>
> But we don't have this one yet:
>
>   [PATCH v8 4/4] sched: Fix cgroup irq time for CONFIG_IRQ_TIME_ACCOUNTIN=
G
>
>   https://lore.kernel.org/r/20250103022409.2544-5-laoar.shao@gmail.com
>
> which is also essential to fully fix the tooling regression, right?
>
> I think this last patch fell between the cracks, I didn't see any
> fundamental objections against the fix.
>
> Since the patch does not apply cleanly anymore, mind sending a fresh
> -v9 version against v6.15-rc5 or so?

Hello Ingo,

I have sent the v9:
https://lore.kernel.org/all/20250511030800.1900-1-laoar.shao@gmail.com/

Could you please help review this? I=E2=80=99d appreciate your feedback.

--=20
Regards
Yafang
