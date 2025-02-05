Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CC2147E6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743280; cv=none; b=YTnuAqDx23y32iEfJ6A0/3rOzhZUA80YOyO5SwGwJyYqOK4c1DjG57RY/l+K/FqSBu3upQDzru90ORDbAHZBq7KHckotRz6/ZdzdOs8TLFElsYhUsX2nmZePeohNYIrgE+s06kYktxqbPAqIlJ5exgGEmDAHq/Tab1HlqXpDoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743280; c=relaxed/simple;
	bh=NGSjDB1V6WWM4RX6iVKzZt0kwGkRuzRfak+IJV/Kw+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBw3Y1vR6mRTKl+jr2kAWhQYOs+MDga3qQZ+/nWkkgYHspWsnj9EpSRjHfTdX27wI0bFYu0IcFabXQTH1K1DDYOjETeI2mns+D52EDpT5sP5wDorJwE/mX+DrJQHeSEdEgdz4UAAmsTTdtgTz7r7WvUwGPTzJI6/nxiFifmiVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso2203006e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738743277; x=1739348077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2mUp798kx9ThWCpflmx6mCStgYPWT6eTK3413XXAoM=;
        b=K0NoEzXeLA4+vEMKzwmE6jcmvsBWEpWfflw86d2hxwXITSo1+h87Vixh7Ken+aXO3D
         KDXm9QQjswhGhVJ/I5H2uYN57x69/Fz2/ad6tu0uW566qtzjzkFedPSM8gUYwpFZ1wXV
         2/zwJ72ZQaDUM1nA+/w/L82Z12DIKZrnjl+Hnx2kqnClqHrUeRBqSCqzEJzAEUe47gRV
         a7HNRzYpbd9q0o74EjcTl6U0Sf/CjQQkV5pfFlg6IHuMcU64+tc9V6BNcY6T/uq3FEc0
         JQy0l0pQrR82tvydo8VuneaLQVtgowjwc8V/j/WniXr2j1YdHsU8/pBdFKdUtFoRZ9hG
         5vhw==
X-Forwarded-Encrypted: i=1; AJvYcCXCbA0y5PIPCZNjaPwGtnGrsSpR61rMfpMv/Fvb36onVIWYJNm/7aExQqMojebFy9CnIcyIbEK/nfqvsHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxErD3n2QnUQx3uEE+KCJUdzQ+F6QIDtHPKdA1DBQ7CMP6zjFg
	7av3wNR+lqeube72Erdyxp96hPQFk2n+LV5/tM1y01+DQuVKYNBBV79oW/zX
X-Gm-Gg: ASbGnctv+rf83upq/1nhBLeuue4NEOVqGd0C/gP9J4mzU7Hohj0x3P4EyfGoiFW0zRZ
	XFTrM4A+D0d++wDoYEQdatJlRaZwtiGh8gbMFPJq64OwUfnPL2uxwRx1VjrP9lKJ5XEbuHBa2NR
	gK8mVIhbHLFSlUyzeiBeYA3/90+op+5eimIXQLEkzGpqM45SToeGXESfLkprV0cvRtNXJIl8RUD
	HHXgZLAVcwlF0CpX2uIJ1w651VixWfzpc2YcpKmvpb9qAQLll2bczaxaNyLepPz7ECKh5EUQUxA
	/bWBOVfvykPvw3Aal8MBDU2KdtEaTu+D5Rvt8U+Ya/Oz2xUe0liTOg==
X-Google-Smtp-Source: AGHT+IGJXkc9iBgnsPA+OJbsmeGlE9qCvbg98ZqXMHRQlTcCLcdOtJpcdYbS46OKkpTDs5AMslYMqQ==
X-Received: by 2002:a05:6102:2b85:b0:4b6:1efd:4f with SMTP id ada2fe7eead31-4ba44e8292amr1721299137.0.1738743276923;
        Wed, 05 Feb 2025 00:14:36 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baccd5cbsm2248005137.19.2025.02.05.00.14.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:14:36 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so1887294241.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH+qqBNSefbKlDIIwiRTKZRaaMVmLNg4koeghzLcLZx1ojFBe2YoQXKVxlpqqf8eEodp9ZF1ZiIiy4YF0=@vger.kernel.org
X-Received: by 2002:a05:6102:41a5:b0:4b6:44ff:415a with SMTP id
 ada2fe7eead31-4ba47ab25eemr1270389137.21.1738743276301; Wed, 05 Feb 2025
 00:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
 <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com> <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
In-Reply-To: <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 09:14:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
X-Gm-Features: AWEUYZkMVSFkZSsrSgSBTQGObQzpU1fj9AacZI5GS-30X390deDW9PO1ikBqK5A
Message-ID: <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking IMR
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Wed, 5 Feb 2025 at 08:07, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> On 04/02/2025 20:27, Geert Uytterhoeven wrote:
> > On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> >> The ColdFire interrupt controller can generate spurious interrupts if =
an
> >> interrupt source is masked in the IMR while the CPU interrupt priority
> >> mask (SR[I]) is set lower than the interrupt level.
> >>
> >> The reference manual states:
> >>
> >> To avoid this situation for interrupts sources with levels 1-6, first
> >> write a higher level interrupt mask to the status register, before
> >> setting the mask in the IMR or the module=E2=80=99s interrupt mask reg=
ister.
> >> After the mask is set, return the interrupt mask in the status registe=
r
> >> to its previous value.
> >>
> >> It can be tested like this:
> >> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
> >> - Start a high priority cyclictest:
> >>      cyclictest --secaligned -m -p 99 -i 2500 -q
> >> - Start iperf3 -c $COLDFIRE_IP -t 0
> >>
> >> After a few seconds the dmesg may display:
> >> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: =
0
> >> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
> >> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
> >> [   84.784719] ->action(): 00000000
> >> [   84.784770] unexpected IRQ trap at vector 18
> >>
> >> With this patch, I never saw it in a few hours testing.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/coldfire/intc-simr.c
> >> +++ b/arch/m68k/coldfire/intc-simr.c
> >> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int ir=
q)
> >>
> >>   #endif
> >>
> >> +static inline void intc_irq_setlevel(unsigned long level)
> >> +{
> >> +       asm volatile ("move.w %0,%%sr"
> >> +                     : /* no outputs */
> >> +                     : "d" (0x2000 | ((level) << 8))
> >> +                     : "memory");
> >> +}
> >> +
> >>   /*
> >>    *     There maybe one, two or three interrupt control units, each h=
as 64
> >>    *     interrupts. If there is no second or third unit then MCFINTC1=
_* or
> >> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int i=
rq)
> >>   static void intc_irq_mask(struct irq_data *d)
> >>   {
> >>          unsigned int irq =3D d->irq - MCFINT_VECBASE;
> >> +       unsigned long flags =3D arch_local_save_flags();
> >>
> >> +       intc_irq_setlevel(7);
> >
> > Can't all of the above just be replaced by
> >
> >      unsigned long flags =3D arch_local_irq_save();
>
> The only change is the Supervisor bit in SR which is not changed in
> arch_local_irq_disable() while it is forced to 1 in my function (setting
> it to 0x2700 AFAICT).
>
> But I can confirm I couldn't see the issue with this code, while using
> the existing arch_local_irq_save() it still appears (less frequently
> than without it at all, but still).
>
> Any suggestion :-) ?

There are other differences: your version clears all other bits, incl.
condition codes and master/interrupt state.

Can you save the flags above in a global, and print it in the
unexpected IRQ handler, to see which other bits are set when
it happens?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
