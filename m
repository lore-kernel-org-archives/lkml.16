Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276D1B4222
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227425; cv=none; b=hlGVYwYCQ6ya+ioPgJ1blndQzSb9uyRpw1hptdtq1GaiwUJeiOGsmBCZb3uMnBUsoJP/G8fkMCAZ9tUVrm7r11j6fQ6MuWwWzQGQl6oweMLNiu32yuK6MtTuhUcOYaxbvvdXnY5XnqyqqfbdR8M/AbostVmFt4ZW+HwuoM1yf9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227425; c=relaxed/simple;
	bh=H6AeHUVjoA+VFoeRyLlW4tNiCef23TVcyY1wg2oyQUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5Pb2Bwk8OHluQFpzIlKaiORc8v0dUO7sxt/ucp1fVhP3dRI8Ko8k41rdcVPEut9F8HqmUQVz7pZNvwT7naRa2zq1eyEjKc7nNZyRjLUAwyyCYPGhpAn3owD8HUmzFCQb9k3qL+v9BKmWTUo8pd8nEu//GhAKoIXkOW4p+Wrzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so305146137.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227422; x=1738832222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov2YCY989UGke35/WwFQcDGlSTiE2zF57DyCrlhClqQ=;
        b=llkNLqLXPs1gjTdRzFusYSWpsnYMt2ixH47bzZIcshuKrCxRj336ikvs4USsTN53Ak
         ka1vauAOtz+IhJQ04Rb/BbIWKQ93LtpeU0F3Cbd4KjsUiGVrarYjCohgDEioggxvm+RQ
         VVPfqN1Do2ZrFw7j/Kves7EpgAEDKU8M6XIemI5rFTJqdim2jSggC9QIhWCLy1krRfwk
         qpnaga5j+iQj9y3LL6zwz9yO/Q6Y+/Vt4SsS4ZwgpAHkutYQ98VTV8HCoBIEMS7btZ1A
         eN4j/S0W9lEbN0rHH/x0KgvpLvAFlFvpTet0LhsT+SA4jFcdDcuJC+FZXVD8ecalGAG1
         7Nfw==
X-Forwarded-Encrypted: i=1; AJvYcCWChCAwRRpT4ZpmWArDE6N6HCqAFxMvrnJTyER/WXSdN+3/+teiqfA826C0IKbZOJ5LXwtWp+xvxdZg5mU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42lRQ92k7bW3M9vgFWgjg/sXzKeFKx2kINFtgHL7gybJFHfCZ
	q9ijFJXIZpipeIKKXLo2OJSLV61vjdGEjkKgQFuCGPUC1l/uCKc3TfrUG2V3
X-Gm-Gg: ASbGncsVFm9l8pkisa4Fwr2YIB6fxOzhzwbOHqeBIKg8+4r1+rOBQJnUDOoQUNDuyBA
	HpQ3hnacO7vBAtLD+YtWYeLvXkJQsln/UWoyYaH/+tDkjpx1ytzspldZ3fAMTreo+0fPA522AkG
	qZIDanwfbVyz/XeUxTWj/bxmDQ/rM8M+O4nWv+II1SesNLKYc8SIH/51SP6q2/ReP+7zxrXvhs5
	J6WIYVeTi2YNDLNPYBN6a4X0Bfh4wNxEst5TtuGdWHEzG678xJfbTYxE8CMvJwNY59xeIaOk9v+
	CLLDrTrdM6Gj75gVsnr0IdzanZtr2ZgoREJJ7ylLA/iq4T5JsYzSrw==
X-Google-Smtp-Source: AGHT+IHIX9zVlW8Mls/LU9AmleYI1CxyeoPJZGwsKHZVZSZzu9fUSyl1hvpctbbjjLRz3Z2nn5xLUw==
X-Received: by 2002:a05:6102:308e:b0:4af:ef82:ce8d with SMTP id ada2fe7eead31-4b9b6e71520mr1688574137.0.1738227420772;
        Thu, 30 Jan 2025 00:57:00 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baad3194sm164646137.14.2025.01.30.00.57.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:57:00 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so311098241.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:57:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0smWwbXR/PJHkip3I//q/lN4L0uLBSlqEbnunwjhww7gw1t5EAckzIxi58dF761SiIuOrBQ+s/ZiUNiM=@vger.kernel.org
X-Received: by 2002:a05:6102:442a:b0:4b5:c302:37b3 with SMTP id
 ada2fe7eead31-4b9b7187ff0mr2254180137.5.1738227420046; Thu, 30 Jan 2025
 00:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501291646.VtwF98qd-lkp@intel.com> <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
 <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com>
In-Reply-To: <CAHp75VcUEaUSeu5K2GDbkgevTkFjR8=4ppw_e5FAy28iW=NhSQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
X-Gm-Features: AWEUYZmbGOlHaKJVd-BR1--srbTjC39-5HvMappwqGN083hGvwhvSO18LYQeNkw
Message-ID: <CAMuHMdVsCt=x_3KdHKHFmr9xgqcMvFNjKGjd4WNHx+LEwiEDOA@mail.gmail.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2025 at 13:51, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Wed, Jan 29, 2025 at 2:45=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
>
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Mo=
ve Surface 3 Power OpRegion driver to platform/surface
> > > date:   4 years, 3 months ago
> > > config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-=
ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project =
ab51eccf88f5321e7c60591c5546b254b6afab99)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprint=
f' will always be truncated; specified size is 10, but format string expand=
s to at least 12 [-Wformat-truncation-non-kprintf]
> > >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3=
pE%6pE", buf + 7, buf);
> >
> > 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> > formatting string...
> >
> > >          |         ^
> > >    1 warning generated.
> >
> > I do not know how to properly address this because it's false positive
> > due to the compiler not being aware of pointer extensions used in
> > Linux kernel. The w/a is to increase the buffer if we can, but is it
> > practical? OTOH, this warning will be translated to a compilation
> > error in case of default WERROR settings on `make W=3D1` builds which i=
s
> > also annoying to people who want to have that clean.
>
> Actually using %pE implies that the buffer should be 4 times bigger
> than the input string. So, with the given format string the
> ARRAY_SIZE(bix->serial) has to be equal to or greater than 3 * 4 + 6 *
> 4 + 1, i.e. 37.

    #define SURFACE_3_STRLEN                10

    struct bix {
            ...
            char    serial[SURFACE_3_STRLEN];

Oops...

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
