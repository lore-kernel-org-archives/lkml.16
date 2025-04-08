Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249E22F39F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135823; cv=none; b=UyUkfI8WU2AWZiuIIN3+E73DaKCuyw+91GwJsWP++H5SNbmRCG9TmsleglrlaSMWzobiZ2gzpZwzKMykyp+XUld+EbZKzbK+X2o2zTSjGQfWd1DbsvnpeQWvuOHHY+reoHQV9HgH3NtbVisdQ8yVCftVmzmwzfi7a/wOPk0mBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135823; c=relaxed/simple;
	bh=uUwPvmcHkJhjMjUdNgSFgwUWiW1CgHzEHSwQ6u4hBk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpl9XiA80C4pKLwvJaI2Z4cktFLvALvHnj8cy6BhJ2q/QqosbQ3eWBnffouCcKh07SwHJLmfeRZnZugdme/D5R5D8pnWF2fTfD+zpPytEBXMY8hkH7kyohUfFrCVMGfNygwwz7xNVNUWgoAsv0AJbCtM3RqhX4ilZr4/rQqgmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c554d7dc2aso959626785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135819; x=1744740619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9waQqUciDIKf2OGaUGdjEc76EpaWRZahK7BUBpwDcY=;
        b=KDcWxgHN5sYHwycavzA2bDRzmponiL/wuekyxqeS7tCv/8RRznPsj3I7T2OmIBHXLv
         Vs8LcXZyUvyCMsL91erm/ZCDObsYddunFf3OjOsKNcroxr8LJ4J8EV3ySzz11+UYrEqq
         rUuiaaJejDrB23By/aXMEl8cVnW307uTJCedeKOOALOMygToF5wNxm/P6Tj+5Ak4/5KA
         9fS7PC1ZpgDklE2rUwVsJUQ6xtJwwzPRdABjB8cKm5MX43UqXDAMeNPAPD6E3pJl0hnZ
         XG1OJ5NPUs3O4V3mBOcG8Bo1qbfO8fmPHF73ZXPaxNrGn9JqxbXeTzVOhv1BTT59qsM/
         +KvQ==
X-Gm-Message-State: AOJu0YxdJ6XptWFNyndtlp6t/ALHWsTvvTcNeyvSPCyQzvlP9kvuiVpz
	1UW5fqmCfc9HxkXrNuACjWTKUxlUuwOegXcJSjhjBarUl3wlZSRE9QPGPjYW
X-Gm-Gg: ASbGncsoE3IQFud3Y/pMDXvr77JiE6gbBsVLD5g59YQ0ck3pfDhOjXvTybfc/FSu3dO
	7V8ea9whjx3ZTCm1mnmjKuYmROev6GnrCeYQgu+JioadkM2ZhcYexK2hxSTxKHYchDMzpNWH2AO
	J47oJBwcl5s+m/0I6neFz5oH03gvJKDh7WmctKj6DKDk84Vm3QfQPjeSMbNNzWh8B2zU+dUa+aF
	hUNgtioi976Pxj5JeI1dy89TwBKrpdHBr4tgaTT8z8bu+O8Zn5wttiAlbF7ypVjHf2bU7gg2IAe
	Hs2Q6cT9sCfTiR5uGxy1knGKNni+fPj2fCkcDb/6+2lo2uu0UUjrjwpSLu9fnbm5a2pxDKgxX3C
	WQjVNfDX4sHU=
X-Google-Smtp-Source: AGHT+IEzFhJetuoZQqSBdAQZKKKFf1NfW3uVt1/svR7xDR7AQaSeuZE9460nRPsut0xplfIqO6CcWw==
X-Received: by 2002:a05:620a:430e:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7c79cbca854mr19020185a.1.1744135818907;
        Tue, 08 Apr 2025 11:10:18 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96cf01sm788691885a.55.2025.04.08.11.10.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 11:10:18 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c54b651310so791398785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:10:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8396:b0:7c5:3e89:c6df with SMTP id
 af79cd13be357-7c79cbcbba5mr18703985a.12.1744135818636; Tue, 08 Apr 2025
 11:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313142404.896902416@linutronix.de> <20250313142524.073826193@linutronix.de>
In-Reply-To: <20250313142524.073826193@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 20:10:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkEpo4qPZe271H1=nBHRhKkKy5X70s9OSqxACxT3HJxw@mail.gmail.com>
X-Gm-Features: ATxdqUHEvw7NfKjidAV-WhdwgNBcIDBLbokd5YcUmHD6sPSE5Rml4gkomkj1-Iw
Message-ID: <CAMuHMdUkEpo4qPZe271H1=nBHRhKkKy5X70s9OSqxACxT3HJxw@mail.gmail.com>
Subject: Re: [patch 2/7] genirq/generic-chip: Convert core code to lock guards
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Talel Shenhar <talel@amazon.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Guo Ren <guoren@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Thu, 13 Mar 2025 at 15:37, Thomas Gleixner <tglx@linutronix.de> wrote:
> Replace the irq_gc_lock/unlock() pairs with guards. There is no point to
> implement a guard wrapper for them as they just wrap around raw_spin_lock*().
>
> Switch the other lock instances in the core code to guards as well.
>
> Conversion was done with Coccinelle plus manual fixups.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Thanks for your patch, which is now commit 195298c3b11628a6
("genirq/generic-chip: Convert core code to lock guards") in
irqchip/irq/drivers.

> --- a/kernel/irq/generic-chip.c
> +++ b/kernel/irq/generic-chip.c
> @@ -340,9 +330,8 @@ int irq_domain_alloc_generic_chips(struc
>                                 goto err;
>                 }
>
> -               raw_spin_lock_irqsave(&gc_lock, flags);
> -               list_add_tail(&gc->list, &gc_list);
> -               raw_spin_unlock_irqrestore(&gc_lock, flags);
> +               scoped_guard (raw_spinlock, &gc_lock)
> +                       list_add_tail(&gc->list, &gc_list);
>                 /* Calc pointer to the next generic chip */
>                 tmp += gc_sz;
>         }
> @@ -459,7 +448,6 @@ int irq_map_generic_chip(struct irq_doma
>         struct irq_chip_generic *gc;
>         struct irq_chip_type *ct;
>         struct irq_chip *chip;
> -       unsigned long flags;
>         int idx;
>
>         gc = __irq_get_domain_generic_chip(d, hw_irq);
> @@ -479,9 +467,8 @@ int irq_map_generic_chip(struct irq_doma
>
>         /* We only init the cache for the first mapping of a generic chip */
>         if (!gc->installed) {
> -               raw_spin_lock_irqsave(&gc->lock, flags);
> +               guard(raw_spinlock_irq)(&gc->lock);
>                 irq_gc_init_mask_cache(gc, dgc->gc_flags);
> -               raw_spin_unlock_irqrestore(&gc->lock, flags);
>         }
>
>         /* Mark the interrupt as installed */

These two conversions are wrong. I have sent a patch:
https://lore.kernel.org/514f94c5891c61ac0a4a7fdad113e75db1eea367.1744135467.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
