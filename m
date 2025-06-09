Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9818BBB9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749449089; cv=none; b=km9+biHIuCYmpaC6/t+QmA+3JBdwCUeyD0RjhOFfIKCTVNyjQ/tN8FhTh08EyEZ1COe4eyD7aVronBgw7wWwTJg1GpL9D11XLHfYeg4xfTq+PnPo5oQJdqH2OB6mXj3gZUSqQ3oI1Rh/XKtRbVlzSOo1v+x368MDux8ZOUE6auI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749449089; c=relaxed/simple;
	bh=LJaZ1jrsef25uHu8m8gN709ZbzBnoGPltw08g8+hFvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPZOMSxtk0S0QYkY8eeerv0XH+/reS3OjLpVCfEzR8BgWH51b1E4FiXQizqvgek6y+anTsKuMg/xK7UF6AfTqW9AKBhpe95tfxS3mpvY36+9fhmZhfhymOP8yRGEn2uxp/4MD7EkW4Mj3J7piQ0LwTqPFyHNEOhgaGxfVdZ9MNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ2kX65X; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ2kX65X"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32a61af11ffso39504181fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749449086; x=1750053886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uX7+IteoOmLwGwXjTAzkmeyRcbw2jwICqVLUW6lBGs=;
        b=GJ2kX65XQ8usJLN60EYbP+CexyxpYHHHb4jOCiDSynLHnwI5dM+PeVZ9TI+UxGMKiy
         4fjOfv7Vd9vrnPhMWzJZio58Hfoo3QiDnGczYz1kPhYZI1ovyU9U6QEzlwRQMwleDzkA
         BkZgpNLzHe2bcLgi2gSyIa8K2PRlCfFAleYqM1QYNiZ5zmVDUIGqS7GF5M4oKBa1tnSA
         sSR8KH9qZ3jErK8Ru7xIAmGufayUS0soheHqg0zdVj96tsvuWmaQ6M/UvF1ihizoK6i1
         5NuXbwMT/CLVJTBY7//Yada+Q4Y4prw7zIRmLynRSm9F4OgRa3Hx+z9+tooRhDHADCMq
         nTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749449086; x=1750053886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uX7+IteoOmLwGwXjTAzkmeyRcbw2jwICqVLUW6lBGs=;
        b=nkPRl1JyriGLmT/zMnTKDC4plK7wPtVcf+z/MUpqeWulp5fAVFoAMTD37G7h2RW77z
         aJt2EBq6o+aKcnHR340m+DVfBTldMpmqttYRhJvvks/XUVaePhazHD0lVGhk5O9FjmpR
         J5MyDCX/oVaikZNqzn6LE0Y38z+ygm+HjVrWqSd/mzESBs5Ii+5JuQ4zgPxEgXMBDLIU
         k5tq0V/H3b8hNYWSZQmLq9EmaEK1BlUi94acECSTaWPI4cdJDb2mido8xtVkjMH7/o9C
         jYEzaMR/ihj9/+0rRPeHpf2op7BSbyIieKGFuE7eqvD0C44J+QoJpgPC1WPOUKGS8cTm
         FeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqC3iV23PfElBg/PSNSG9NYgihoamb25nzDnVafaPTkGCvHPd8LWAOiAH1UYQXJ1uua355+CmZjbymV8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDNxzHr9+OPoGjdYv/R7gFL8+MJnUwBXu9MHK4b/y1Ti0kQ/n
	oNfKcxeR6+h1xCKK0sE8ylVz3zE/Lpn0cIb6/yV0+KlTevhOI9qZvdiTyTh+FjfPtG+wU2dsYSW
	bsGqILd25uJjdJpqrBgjdAaCB04+DgLo=
X-Gm-Gg: ASbGnct/0oiC788B8pXswGVEn5IHeljEFdRlW1YexztYwE8kCmFurb4eN7ztznhmKWk
	3Uo4K6R2HrwvNrEN+nI+sTtlKdiDjO3eQsYAscaBJeOeVbKPR29d1xR65i0YgjBwxoi61umoWbt
	g+6qDJXm4Fr7r5bj4pslC1NYd/VZi1w6jpFglL2Kz9yr8=
X-Google-Smtp-Source: AGHT+IHeCftiVXgwegBAZ9INWrJ8kacDkZC2PDSc0nFh5Vr82HGTOc74eLncrJLOoNY8k7dkm4C5Qn+99B3eHxwYSbk=
X-Received: by 2002:a2e:b8d0:0:b0:32a:6e20:7cdf with SMTP id
 38308e7fff4ca-32ae001ca21mr32003341fa.4.1749449085551; Sun, 08 Jun 2025
 23:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com> <20250608215127.3b41ac1d@pumpkin>
In-Reply-To: <20250608215127.3b41ac1d@pumpkin>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 9 Jun 2025 08:04:34 +0200
X-Gm-Features: AX0GCFs5cUXSP2EcA75yWqEffi8u2zoQ5Pwhzy_jGzwat6KWX87IHqcf7P6HE0c
Message-ID: <CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 10:51=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 6 Jun 2025 09:27:07 +0200
> Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), w=
hich
> > > > comes with a significant penalty on CPUs without the respective fas=
t
> > > > short ops bits (FSRM/FSRS).
> > >
> > > I don't suppose there's a magic compiler toggle to make it emit prefi=
x
> > > padded 'rep movs'/'rep stos' variants such that they are 5 bytes each=
,
> > > right?
> > >
> > > Something like:
> > >
> > >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
> > >
> > > because if we can get the compilers to do this; then I can get objtoo=
l
> > > to collect all these locations and then we can runtime patch them to =
be:
> > >
> > >    call rep_movs_alternative / rep_stos_alternative
> > >
> > > or whatever other crap we want really.
> >
> > BTW: You can achieve the same effect by using -mstringop-strategy=3Dlib=
call
> >
> > Please consider the following testcase:
> >
> > --cut here--
> > struct a { int r[40]; };
> > struct a foo (struct a b) { return b; }
> > --cut here--
> >
> > By default, the compiler emits SSE copy (-O2):
> >
> > foo:
> > .LFB0:
> >        .cfi_startproc
> >        movdqu  8(%rsp), %xmm0
> >        movq    %rdi, %rax
> >        movups  %xmm0, (%rdi)
> >        movdqu  24(%rsp), %xmm0
> >        movups  %xmm0, 16(%rdi)
> >        ...
> >        movdqu  152(%rsp), %xmm0
> >        movups  %xmm0, 144(%rdi)
> >        ret
> >
> > but kernel doesn't enable SSE, so the compiler falls back to (-O2 -mno-=
sse):
> >
> > foo:
> >        movq    8(%rsp), %rdx
> >        movq    %rdi, %rax
> >        leaq    8(%rdi), %rdi
> >        leaq    8(%rsp), %rsi
> >        movq    %rax, %rcx
> >        movq    %rdx, -8(%rdi)
> >        movq    160(%rsp), %rdx
> >        movq    %rdx, 144(%rdi)
> >        andq    $-8, %rdi
> >        subq    %rdi, %rcx
> >        subq    %rcx, %rsi
> >        addl    $160, %ecx
> >        shrl    $3, %ecx
> >        rep movsq
> >        ret
> >
> > Please note the code that aligns pointers before "rep movsq".
>
> Do you ever want it?
> From what I remember of benchmarking 'rep movsb' even on Ivy bridge the
> alignment makes almost no difference to throughput.

Please note that the instruction is "rep movsQ", it moves 64bit
quantities. The alignment is needed to align data to the 64-bit
boundary.

Uros.
