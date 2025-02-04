Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDC216380
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697241; cv=none; b=IQPqit2SWehtgb3tzx23XbYTTn0/ntnabsEhoVEDtRRUZJzqQ/x99YIDNL6fZFHyhr+gLs3plszOy5UuM5DOSWt7iEbuhGN8b0/2i0iHDNSarc9b2/OYGUzd66csFDfM3JENHWaI7recFeM5I3T0CrDhCqFFIMvFYTzhfquQj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697241; c=relaxed/simple;
	bh=zPxLiOkXtzGsjn+GwakusEDM0bh+sGQcblbpxtQvUQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EASqvDoUaWprt+OEM4nMBKm+ZaImynUDoeU0KGNsL4TIwwLuw1Wz2GAyFSHfSCvUdThHounW1mQLJQcZH1z53c9f2CaNyEXOnUvG/a9682A3F94fsnpjhinRPYWq+bz9ZfyVsVlzvLz2rEKvWorhbpZuk9T6E/yjTkyjp8Vm1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff620b232so1825959137.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697236; x=1739302036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3b78cuhWs6gaHyyCJx1BQab0LmoernGKdWe4nH8fo=;
        b=Y3oKYXQMRezbhPQX9xGJCrXrA1k2F2NMTgPxfe/hZ5nFHbNw2/l7fnh3Gam6In04Fp
         iY4bCn8etYYkUhkat1psE/j4SJa3sXuGPv5etvQ/iWZni6PvW4255kRbKtfFwvtPPU2e
         IM3rI5bwrhv0WoyqSwhhfHcQblHG/UAZgdPuI4i75caHK5YOlZjViJ573X+QEklOGIzQ
         XW+PHAvH5dHnZcToT56+j1n5d4vQQdke/jRzmiNbx4nyaWbh7AKpNkWNOL8uBYIAY+O0
         4Bd4Zw0iT0ShJcv/mtW/S28FhUfZX/LFTxuy+2EV3qGEYrgb1Yx/YnNEkVR8kDd3aK5T
         ObLA==
X-Forwarded-Encrypted: i=1; AJvYcCWw56wyjH2HZl/JSnE98EP6MXSmaVi0lMUbzL8i6tUABb4Jnq2EhFDN/mXRN5ENgQs4UFWmctuHTcVVKEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTknaEjRTYmfuJSU4XJZXWev1LgKojI0oTLiU9F6fnrl4HyRJA
	hzRWVgqfNcj1espZSCKHDdPvubccGBRcVnapuwx7KV1+DZy305JfaVj+leQw
X-Gm-Gg: ASbGncsauiJlQM787jGox7B2Ph2kSx7F3RlCAExo3V61KqGfXm4dlzYoitLWVU2vuMD
	n9aZB1LQDwtkaj/xNup+PJg39f+AB2lMpVM2CNgX1+JsmX3bR20GPi77aO+J65cB9/TAXBuGT/2
	TBA6EwzSSNhBu8nQcy+hfLQkwDxLHOXaLxqci2wDIKb+Qbql94CqyxhXPDwcZebTnR/eLeLTXq3
	K+slTR6Y8zvdqO1OzVh9g9MYT6ihU+SoyTT6RNoyUtfkZEpkDU+ttFSggv5fSWxSKEmwn1IWs4H
	vPYgPDeVVWqDgT1r3rpKgVNZPgaO03YBv5goOTb4Yw557yedtpwJPg==
X-Google-Smtp-Source: AGHT+IEaYXr9gZPJ+a01X/GWUdLjOr0XT0AbB1HQO3PQ/9kTSZ9XB+wc61/mT4oAMyAv4TQt98fMCw==
X-Received: by 2002:a05:6102:54a6:b0:4af:d487:45ef with SMTP id ada2fe7eead31-4ba470aae1fmr331346137.5.1738697236280;
        Tue, 04 Feb 2025 11:27:16 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941da06asm2053944241.23.2025.02.04.11.27.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:27:16 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so1669870241.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:27:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC7khjxluSS+MePahnDBm9le5Ui+56V3V0pKTlMM3ZtTgp//dX9d6Joytlq3x0/8Z8bXWqCJH+IXh7vgg=@vger.kernel.org
X-Received: by 2002:a05:6102:3306:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4ba478b3694mr307261137.7.1738697235724; Tue, 04 Feb 2025
 11:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
In-Reply-To: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 20:27:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
X-Gm-Features: AWEUYZlQlNmj76XCoOTX0pCM3TvZkeXSJsqQ37Clwjit-zuQeYs4pDamYCinouQ
Message-ID: <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking IMR
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> The ColdFire interrupt controller can generate spurious interrupts if an
> interrupt source is masked in the IMR while the CPU interrupt priority
> mask (SR[I]) is set lower than the interrupt level.
>
> The reference manual states:
>
> To avoid this situation for interrupts sources with levels 1-6, first
> write a higher level interrupt mask to the status register, before
> setting the mask in the IMR or the module=E2=80=99s interrupt mask regist=
er.
> After the mask is set, return the interrupt mask in the status register
> to its previous value.
>
> It can be tested like this:
> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
> - Start a high priority cyclictest:
>     cyclictest --secaligned -m -p 99 -i 2500 -q
> - Start iperf3 -c $COLDFIRE_IP -t 0
>
> After a few seconds the dmesg may display:
> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: 0
> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
> [   84.784719] ->action(): 00000000
> [   84.784770] unexpected IRQ trap at vector 18
>
> With this patch, I never saw it in a few hours testing.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/arch/m68k/coldfire/intc-simr.c
> +++ b/arch/m68k/coldfire/intc-simr.c
> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int irq)
>
>  #endif
>
> +static inline void intc_irq_setlevel(unsigned long level)
> +{
> +       asm volatile ("move.w %0,%%sr"
> +                     : /* no outputs */
> +                     : "d" (0x2000 | ((level) << 8))
> +                     : "memory");
> +}
> +
>  /*
>   *     There maybe one, two or three interrupt control units, each has 6=
4
>   *     interrupts. If there is no second or third unit then MCFINTC1_* o=
r
> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int irq)
>  static void intc_irq_mask(struct irq_data *d)
>  {
>         unsigned int irq =3D d->irq - MCFINT_VECBASE;
> +       unsigned long flags =3D arch_local_save_flags();
>
> +       intc_irq_setlevel(7);

Can't all of the above just be replaced by

    unsigned long flags =3D arch_local_irq_save();

>         if (MCFINTC2_SIMR && (irq > 127))
>                 __raw_writeb(irq - 128, MCFINTC2_SIMR);
>         else if (MCFINTC1_SIMR && (irq > 63))
>                 __raw_writeb(irq - 64, MCFINTC1_SIMR);
>         else
>                 __raw_writeb(irq, MCFINTC0_SIMR);
> +
> +       arch_local_irq_restore(flags);
>  }
>
>  static void intc_irq_unmask(struct irq_data *d)
>

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
