Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6DE1F0E2B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276269; cv=none; b=tzF0Po68I9eq2SRtEDgzpAFve0R5QLKMNUMnks2Q4AXbdb5vvaoKaNzI7Ib0HveJZT+lNGed8Sh1if/JP5ox84ed8UF6QFpGLjQVjajSRdo+0Ey8c2zHHthJciHtEv7JOeZMB1p5sLRNDHJg+C8McdFSTN/sNU9yr4UcPg/ATEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276269; c=relaxed/simple;
	bh=NNmaBfrBHCWPgGIy3hxDwhYYJtOtt+JWbw2XlLZuqCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kA+QxnJyprMJ6+clPHqG8TlLdn7Vtr/9L27B5F9Gjazk+7izaUm6O89qok+gQIj0IOpPrSs8tx8TLbzoIdW/2VsWAlSVPq9wqEvIxUwgBB0x+/Fjo4aZF8UaTxpZ26htFN5qin8J8mUSnje5Bc8kG8sYMilOvchfYP+Tsan70dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso2286978241.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739276265; x=1739881065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQQhu1+eJSed5qS+FiuHYgY3XHg26ezj5+KoSTQrLcg=;
        b=irnb/j+fXllz2hooj9OVHWEmT8jYOPiiNzZK/m++kfjDeZwUvwFYj4TZ9VeXdxv38K
         XUoBzwBhL8Lym4+JmHKWqw+JBY7J4qItyBxYZ2SqwlLXBPPib9NMEy9bxjd1zrI6XjAl
         dlVYVLAhHjEMMslDYvOH4PZCVP5FOe5SvJq36xl6lC/2JNImpB4Ljh5a1EQI4gGcUNCM
         SRnULCRhq5mOFd4Lr7AVoRjNXMtI8ysPM/Ayq2zFIL+2Vy/wynk0SqYi7NNGi9SOIyD2
         YFrrwUVyGKOJA/ImrspQGGh4WQ+wdG6XLDaY8nCId5oles0k/cxbBr+vIhk4180PjLBO
         jahg==
X-Forwarded-Encrypted: i=1; AJvYcCW2LGaBT/dfq9aPU9FXXPlOQM7pu0CTUltsllA5ndGHmj1JXcb0bd8H4x2iBpQslRzBn7WuBqTvn6lcsD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Uxsc1phKUpbV0mz6fuS3Nqe8olPEGRGXWrQQfOEG2muEZWJE
	XRepGEFDdMncQH6Fj0VfxPEcnWVDQs64HSnb6nHIFo1Z6R1j91UDzlSbsqQezG0=
X-Gm-Gg: ASbGncvbLDlbQEoT+wPmthycAeNrFBgGtZMcV70849IybFnQGUB0r/18btyENRnLcj7
	JeGabQiEgmytQNpIftaRhzSVEKsS0hFB23J0UK9NL1aqAerRjPKHVhHcxutT3+GCJy35W0dwyQO
	YW8SRWmSbg9sYeR12BET+LHoM4Ws7BkRH82Pul5Vwh0Jdco76Y7bN20ZZ8Sx4TmL4iJ3vx9/o1S
	HGPPVlzx6jlemq1k3XrlrjCyV/O/LX9TLb1Ds7sieklHXvZTWLihvQhbT72YbRPahm7RArx2B5L
	Dl9tkG1wkcib3KRCC+sa8DDb/CW0dBwOzEqQ/RCb7kW/w7YsmCe5Og==
X-Google-Smtp-Source: AGHT+IFHBMOf8Q/R8jPv1g7zhYxytc8I5RwCK8SCYhSrT0YMKoLWsmEUpUcdXdjjWpeLH7zYn6LuXA==
X-Received: by 2002:a05:6102:3fa2:b0:4b6:8fc5:2e7c with SMTP id ada2fe7eead31-4ba85e20648mr12597793137.12.1739276265603;
        Tue, 11 Feb 2025 04:17:45 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbc93070afsm729132137.21.2025.02.11.04.17.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:17:45 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4bbe31ef430so449638137.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:17:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjtmvbX1Lbz2PtGIeRPDvVC+hJCkpesyt8JV7QTELACPGfG6wWvQ0nMTAQjr0mSVNN7vCAaqQejFiLKPI=@vger.kernel.org
X-Received: by 2002:a05:6102:6a98:b0:4bb:9b46:3f6f with SMTP id
 ada2fe7eead31-4bb9b467825mr4695448137.1.1739276265146; Tue, 11 Feb 2025
 04:17:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <077bd67861fe0ee246ba967a3406079373122439.1739271346.git.geert+renesas@glider.be>
 <6aa243e1-6e25-46c8-b75a-d5e7bc1cd5a4@app.fastmail.com>
In-Reply-To: <6aa243e1-6e25-46c8-b75a-d5e7bc1cd5a4@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:17:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM9+xTF_UEitagNvprjuXQ+=oo_ey=gN731v2QckXxug@mail.gmail.com>
X-Gm-Features: AWEUYZmHpbnzzUCIlLGH3HVBQWZ--_LLEiZfqrXuPATgJccm7iv7OXn8qzQIapg
Message-ID: <CAMuHMdUM9+xTF_UEitagNvprjuXQ+=oo_ey=gN731v2QckXxug@mail.gmail.com>
Subject: Re: [PATCH v2] platform: cznic: CZNIC_PLATFORMS should depend on
 MACH_ARMADA_38X || ARCH_MVEBU
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 11 Feb 2025 at 12:04, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Feb 11, 2025, at 11:56, Geert Uytterhoeven wrote:
> > CZ.NIC's Turris devices are based on Marvell Armada 385 or 3720 SoCs.
> > Hence add dependencies on MACH_ARMADA_38X and ARCH_MVEBU, to prevent
> > asking the user about these drivers when configuring a kernel that
> > cannot run on an affected CZ.NIC Turris system.
> >
> > Fixes: 992f1a3d4e88498d ("platform: cznic: Add preliminary support for
> > Turris Omnia MCU")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Drop PPC_P2020 from the dependency list.
>
> Looks good to me, one minor issue:
>
> > @@ -6,6 +6,7 @@
> >
> >  menuconfig CZNIC_PLATFORMS
> >       bool "Platform support for CZ.NIC's Turris hardware"
> > +     depends on MACH_ARMADA_38X || ARCH_MVEBU || COMPILE_TEST
>
> Technically the MACH_ARMADA_38X check is redundant here, as that
> already requires ARCH_MVEBU.

Thanks for your comment!
Somehow I thought the former covers arm32, and the latter arm64,
but ARCH_MVEBU indeed covers both.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
