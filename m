Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC72DFA5E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749144; cv=none; b=nykLem97CilNHCOLWHRqlZfZ6aY6id4yJDUs9PHYpYKTSIPwmCbXetClRXCH1YOiPQYl/OjxYdR8+CjtdlUF4Uq568KDCxM+b+ons7cSQSO0ll7JoubTJfaYEie0u+30Ehj666jlh8FSmepszc7MwFrxgREX93zAZ31jaS31Z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749144; c=relaxed/simple;
	bh=+A0V/gnOpVXB6XJxJDOObqJ3Uj9ersgzDRIFIOSUzcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAo8G8/k2t/UebxA5s4RNIrM9wnunHkLiJAUHXyn/uYk/xvhV87BwLmsyI1OF+l8EYHnfJvXvaac89uPUofhVsFH4VlIqe8CQ9GWo5DqOrFmvW73fl2KKI1l7CsUj0B1rch6PQpfSNEIZgF7qqQ+0evQ3PyASocIcFafP24iovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOCLkwsb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOCLkwsb"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb39c45b4eso11667966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744749141; x=1745353941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sC6hzfL5anfg0EoTyXmEdBCoJKiR614P099rsWHuaTI=;
        b=dOCLkwsbkTSV61zW4cvK8p3i2yyKgf5zhTwWXQV11LiRXv9XMTBSzt2qyiLuoHRBDf
         2pNIXaame/j69n4Jz9+Tx/oRyg8lp0GqEnRUuh8IlQPmxGUwc5GFU6jjAV5jYi3vjMDT
         IBJeDNWR4bmFVny1b4eskN4v7Ifb/u6LUhcOnrZj9Wl+V0dm+VGXL7EkXcthRpYn88Nl
         N8Le/d1Nc/Lw1s0gwq130Kpq3lteM3waQSCF6qNNvxa4+bhTkDbajNVSztvbotvpS6Oh
         Xu14x9bcumwssgqzDrQIJbfF4g3XgOEljnYDD+2FwnO0hx79iasfqpPLhivM5A8JWdMp
         LwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749141; x=1745353941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sC6hzfL5anfg0EoTyXmEdBCoJKiR614P099rsWHuaTI=;
        b=hhk2fsfgVL7llsyIU07nu7Jay1o9JHpoepSjBzSTxNw2S18emwvWMftSMr3umWhPzj
         xA26dMOv1iAOKeI6KLjowENkIrIVn8BWrxp5BM4x1CbTVObW9uO7bix5Ak+Amds97oux
         knTHYAF+Y0oRp1EzxeABpPDgDG+gmLtjrmoUiQy5yJDx23ApV6UeoUocAB+8wpzi0NJs
         0cjZo8QzvyvJG1FyH/ZHve2eBO+81kvLITgj4y4FcPCN/FVZCFAif1cxdDSdRKwqqQYA
         GNAhkw2aObMtCF1OPCsLnDE6tsOOgb06tD8EV3ZlNySpCqV8J+gAqO27a8G/ksuA2LO9
         1TGw==
X-Forwarded-Encrypted: i=1; AJvYcCX0vPDzt0aqpobwOVF9HbgmaqCOrMzXPIAVI4ePOqZw5HyHHZJ5oPTEGmwqmmTN3xXO5hNYLezF2FJDrto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxejnFD+uSMZ5BELCKHDA3GLFqGrZakDGkGs4zl7L6L7hu2T8Gy
	XHo2tpGB1MKOVQZlG96pgx/OiiVMeogXEzBClNscfXv3gYP6haCPFaeGtCjjqmU/ZRAOAnkUglz
	kMBhH1ag4pQfoCfZPiFh2TI8mwJI=
X-Gm-Gg: ASbGncuHrfBLwGAZdtnQmEebYdwld5GTPdd9VQCuUaitktbs4/onMbDqkhWEzai8hMP
	encykZMsrin9OWX4kbK8XbMslP2tHuJZuoRxjclDlOkcK/xQ2KQuMR1GbCCXfpAG5t3ixBv96EA
	13KJPm7BlC/xBlZsKjNijEQQ==
X-Google-Smtp-Source: AGHT+IG+RwrezVhO9OG2/ktJvuR/qvmQhUaHQnoey9PqyQqYd9KVm8tOx+1SGOGrI4kvB7cIn8PghjETp3kknafwCI0=
X-Received: by 2002:a17:907:3d0c:b0:acb:1184:cc29 with SMTP id
 a640c23a62f3a-acb3852e281mr42833966b.59.1744749140490; Tue, 15 Apr 2025
 13:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com> <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net> <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
 <87h62qymrp.fsf@oracle.com> <CAGudoHE2DW86hsx5H6iBwMUuKT=onTNd_OnBBCbv5dCpqvHjUA@mail.gmail.com>
 <87cyddxkgl.fsf@oracle.com>
In-Reply-To: <87cyddxkgl.fsf@oracle.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 15 Apr 2025 22:32:08 +0200
X-Gm-Features: ATxdqUGCZqrEztb1g35yZBHgJdxs14sSuGpBFoIakMeoOBGjY5edMHVccz-kHe8
Message-ID: <CAGudoHEMfM+ZnAiF6enrmsMZHU64XWXxU5tu1bH5LSBbCNsO9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, mingo@redhat.com, luto@kernel.org, paulmck@kernel.org, 
	rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:02=E2=80=AFPM Ankur Arora <ankur.a.arora@oracle.=
com> wrote:
>
>
> Mateusz Guzik <mjguzik@gmail.com> writes:
>
> > On Tue, Apr 15, 2025 at 8:14=E2=80=AFAM Ankur Arora <ankur.a.arora@orac=
le.com> wrote:
> >>
> >>
> >> Mateusz Guzik <mjguzik@gmail.com> writes:
> >> > With that sucker out of the way, an optional quest is to figure out =
if
> >> > rep stosq vs rep stosb makes any difference for pages -- for all I k=
now
> >> > rep stosq is the way. This would require testing on quite a few uarc=
hs
> >> > and I'm not going to blame anyone for not being interested.
> >>
> >> IIRC some recent AMD models (Rome?) did expose REP_GOOD but not ERMS.
> >>
> >
> > The uarch does not have it or the bit magically fails to show up?
> > Worst case, should rep stosb be faster on that uarch, the kernel can
> > pretend the bit is set.
>
> It's a synthetic bit so the uarch has both. I think REP STOSB is optimize=
d
> post FSRS (AIUI Zen3)
>
>         if (c->x86 >=3D 0x10)
>                 set_cpu_cap(c, X86_FEATURE_REP_GOOD);
>
>         /* AMD FSRM also implies FSRS */
>         if (cpu_has(c, X86_FEATURE_FSRM))
>                 set_cpu_cap(c, X86_FEATURE_FSRS);
>
>
> >> > Let's say nobody bothered OR rep stosb provides a win. In that case =
this
> >> > can trivially ALTERNATIVE between rep stosb and rep stosq based on E=
RMS,
> >> > no func calls necessary.
> >>
> >> We shouldn't need any function calls for ERMS and REP_GOOD.
> >>
> >> I think something like this untested code should work:
> >>
> >>         asm volatile(
> >>             ALTERNATIVE_2("call clear_pages_orig",
> >>                           "rep stosb", X86_FEATURE_REP_GOOD,
> >>                           "shrl $3,%ecx; rep stosq", X86_FEATURE_ERMS,
> >>                           : "+c" (size), "+D" (addr), ASM_CALL_CONSTRA=
INT
> >>                           : "a" (0)))
> >>
> >
> > That's what I'm suggesting, with one difference: whack
> > clear_pages_orig altogether.
>
> What do we gain by getting rid of it? Maybe there's old hardware with
> unoptimized rep; stos*.
>

The string routines (memset, memcpy et al) need a lot of love and
preferably nobody would bother spending time placating non-rep users
while sorting them out.

According to wiki the AMD CPUs started with REP_GOOD in 2007, meaning
you would need something even older than that to not have it. Intel is
presumably in a similar boat.

So happens gcc spent several years emitting inlined rep stosq and rep
movsq, so either users don't care or there are no users (well
realistically someone somewhere has a machine like that in the garage,
but fringe cases are not an argument).

rep_movs_alternative already punts to rep mov ignoring the issue of
REP_GOOD for some time now (admittedly, I removed the non-rep support
:P) and again there are no pitchforks (that I had seen).

So I think it would be best for everyone in the long run to completely
reap out the REP_GOOD thing. For all I know the kernel stopped booting
on machines with such uarchs long time ago for unrelated reasons.

As far as this specific patchset goes, it's just a waste of testing to
make sure it still works, but I can't *insist* on removing the
routine. I guess it is x86 maintainers call whether to whack this.
--=20
Mateusz Guzik <mjguzik gmail.com>
