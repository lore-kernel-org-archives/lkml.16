Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA213B5B3
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750005704; cv=none; b=U7TEjfS+WQNJBUFxolsHF4+Zu22swccmt0HTFAePFz5GH1/wOroecCWgllW32rhs32hdUC+G4UtRrvjs8DF2mN/VoRHIq5xX7k4sd6tVRkPzng2K/wZoObneAVd3Anj29ZzZWd7zmTuVLLvu5llCUHYMEXDFTjDLVCEEsXzznfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750005704; c=relaxed/simple;
	bh=z/CpNbOdsmoDylhW7PVXWk5oSPDUAohEfmIHx29Xnlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oe2+wPAmD1aYf9A8ew9HlbtNduC9y8DVwqliXOK+VKP1PXZbXn64Xi9jm2236szQjSHAc7FmNYUsn9aBbqB25Y44FJg+EUxTK5wD05vtxD6C52s6+nT424/DJegFULIyn1qw+/ez3WX0CP8wOlaBiUK6hNCsIrPETD5VVGhfakg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx5mWoVv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx5mWoVv"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b2d60f8caso30232911fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750005701; x=1750610501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R72aa+JhDIZd18QK74EtTt7kDoRODu1smPr1ewB8XeU=;
        b=fx5mWoVvH4igE293aJaN/OCsKGIngecihJdl1252GG/q/iiYWqUfM/SXKsFRKjoi/9
         jbNzNYpRXXB3gu94HI8RayAyCnEVXxp3iWMEALOZiVo6pE2Z6Jr+LRN8yge3d+PQjNx2
         b+tm4ba9gOtdGQeP1BcHeM585o1fy7Lfje7i3FqrrgOJoXzQDQ5164T94X4TQKoBop96
         zDJCRiPJhhC3MeGKiTsfqcAk1a3vI76LZdGBGS3/4sZQpErAq4KYBEIoRhgKAk1oEiFO
         Lycfr/zgnXGoC7vH1kJxgiJdqwtPHXfpYcOo+RCm3GgcfuqTXhkOOukHWqi5mWMANxvJ
         fltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750005701; x=1750610501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R72aa+JhDIZd18QK74EtTt7kDoRODu1smPr1ewB8XeU=;
        b=P6SZIW2enyfdPI2OS/YQZrDNSVTBuGKeZTBwAE5OmLc9/y8LYh91RmDAqDwDDVi6DE
         bxwtigObKmSKb+u9jAWK5MHn+v68SI4nNxHF9uBwSdxbwCvoOGmweuvc6yXgPbhVOuug
         oPbxFoDEn8v1ISfcf23OjlK+GbWbIb2O5YeHOQvEBg3QbyPs/sWRGyq6OJrm1cu5r87E
         nvuLCtG68OjLxPFUe6qyZhIzI6IqxPH3TXcEXmmzCJLmpSkQTQ7BeyH3DH9bQsPG5ULj
         PlT1Wj2fKS7SSMKhpZcxGc3ZU/7DVpQlrPnehanhz7NGs/6oem4JoDlkq1Jq/KIuiCxv
         lB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4zQSl+ST/1bE0XdKhPW/ENdPKibZwUlgQ4Zr6AGSmM3gNsIvJVh9d4ATvVPfEpk4I7jpNsJwXXkk6+4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYymLtYwNTz6rujqSpi7dwIpZcIVXtiU0hl1pt48q1i7ODFSkk
	UDXD7qp8cZSc1o1c6RVTUrVxBef1MWJMmmWghjoJOjk0tenK9LOsldtfDqE41E9e6tYzAuy/gha
	Jiz/n+oNI6xRkaGgDIQoNVLAaaNh6kXs=
X-Gm-Gg: ASbGncvx24ClaEZrwXZ1sQbGAU7YWhW30xgf4xJBmUFqxFU4SeUkSysj+ysXQqq5jwS
	GM/uAHEOlCYa8io+9OsqL5yo/f4PYOH1oCMYn+dmsUboZpC7ZoIRR1uc7YE8XJjaIOL5vVDAikS
	av9FggcSGoIoEUqwe4MbcvMTmcQ2wZw3fbvfDV1kWGA6o=
X-Google-Smtp-Source: AGHT+IFOBUk7tQxrKsqxu+5loPyv8wIPOop2Qh3qq/wvAwdoEzAMR6L/9cPplUgT1x7Voq58B3JB6uJ15UsoKbZXieI=
X-Received: by 2002:a05:6512:1396:b0:553:2f27:e96b with SMTP id
 2adb3069b0e04-553b6e7135dmr1340248e87.2.1750005700421; Sun, 15 Jun 2025
 09:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
 <CAFULd4Zito-1VasojoL7qZdu_yggDgQL_0qMSv6ZBrtMe3i1zA@mail.gmail.com>
 <20250606072029.GI30486@noisy.programming.kicks-ass.net> <20250609220901.5059217c@pumpkin>
In-Reply-To: <20250609220901.5059217c@pumpkin>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 15 Jun 2025 18:41:28 +0200
X-Gm-Features: AX0GCFtFIar3gKTlZnrXZoZWPpJRM32wSp590IJafCfgC5_WrIggr37-0JMM6eU
Message-ID: <CAFULd4bz1KvrcO14c8JouhpriNt2KudcwcWccuXD-b7yQ8rARw@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 11:09=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 6 Jun 2025 09:20:29 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
>
> > On Fri, Jun 06, 2025 at 08:27:39AM +0200, Uros Bizjak wrote:
> > > On Fri, Jun 6, 2025 at 8:13=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com=
> wrote:
> > > >
> > > > On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infra=
dead.org> wrote:
> > > > >
> > > > > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > > > > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes=
), which
> > > > > > comes with a significant penalty on CPUs without the respective=
 fast
> > > > > > short ops bits (FSRM/FSRS).
> > > > >
> > > > > I don't suppose there's a magic compiler toggle to make it emit p=
refix
> > > > > padded 'rep movs'/'rep stos' variants such that they are 5 bytes =
each,
> > > > > right?
> > > > >
> > > > > Something like:
> > > > >
> > > > >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
> > > >
> > > > This won't fly, because gas complains:
> > > >
> > > > z.s: Assembler messages:
> > > > z.s:1: Error: same type of prefix used twice
> > >
> > > However, it is possible to use " cs ; cs ; cs ; rep movsb".
> >
> > Heh, the way I encoded it was:
> >
> >       .byte 0x2e, 0x2e, 0x2e
> >       rep movsb %ds:(%rsi), %es:(%rdi)
> >
> > GCC compiled it, and then objdump grokked it (although it outputs one C=
S
> > too few). Your variant is much nicer though.
> >
> > > We can add a compile flag to the compiler, and it will be able to emi=
t
> > > the desired sequence.
>
> You want the compiler to use 'rep movsw', 'rep movsl' or 'rep movsq' if i=
t knows
> the size is a multiple of 2, 4 or 8.
> Then you can substitute a suitable function.
> But replacing the 'rep movsb' with a call is much more flexible.
>
> You do need to allow for the REX prefix (rep movsq is f3 48 a5).
>
> I also suspect it would be neater to repeat the 'rep' prefix instead of
> using the 'cs' prefix.
>
> >
> > Thanks; Linus, this would be acceptable?
>
> Any compiler change isn't going to be useful in the short term.
> (Unless the kernel sources start including gcc.)

The discussion is moved to gcc mailing lists. Can please interested
parties continue the discussion at [1]?

[1] https://gcc.gnu.org/pipermail/gcc-patches/2025-June/686813.html

Uros.
