Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401A4F5E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940803; cv=none; b=DH6S8hHV3b/OQ2ipwLqR1IqKyRSv4/8+y91cFqik89T1PPjBYW+scFXBWQ78ZMIt5HuwP+bPVhwfQE4jTLyntS3EZig8q/1nAAfPrkwlBmutQhxo57NgasQcqhgDXOQIYEpVRif/DRC3EV5CWrO/5u9EzMOuaM39NhN+mxgwldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940803; c=relaxed/simple;
	bh=KsItsQElrSAFoAGoVOG+9cVTedinDVNzrAHcrZgzLC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blHyzRFewjKKR4M2vV/AOJLUCy7TG9TsL8dV/HLevFRS+PTY4wV8Ts5Cf+ynTVocDtypH93T89hNf9oYgkZNgxWDQKjXN16b+Mz3UKhfkC9MJO0eUddou5A9jEUAN4FJuCkJfIg3u2z2tUH4rnw7xBBzYx4WeByT9PqgKluFyQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52f298abd9eso3560233e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940798; x=1749545598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TB2PHOhRXsp082ZJydrR8/auMtOhOL8SZH2MDXqRJ5E=;
        b=JSFPy6XbDyKeISGq+uok6uvOWBt1zlzRg88MmdUU7FZTgU7UuUPBsCvO3URaQs88eF
         htG8vZUYivxzwmEKaKYFGdE9sxYet82/yMbLoO6aCwKXq33NSuOjKhXZfUZCV8zaHv3t
         EFyRzdcWzWCOXFb30pai0/KzLKbv62QUKFTaNGA7HIv9lHlhwXZORgO0JnPPhReXcssX
         1DKsr/BN6USgRzxFqNg4zVFG0cp0mN8IGspRokVOn7zBGT1uhbPy3hLM8Qp9rZ0DmJm8
         YIBN+cMkiFn/qi4aREPdptO5fOQ8I0nWnYP+ZwIUuHGPFlmBw138ZlAycSaVDqx7FoIf
         to8g==
X-Forwarded-Encrypted: i=1; AJvYcCWEu+MgBjtabvcZPGp57ScUNXGIs8D6uO1kBCGCGqa5vDhOLHwDobbK4qZpSFHxsDzT/Ko6Wkof5rHIXqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTmZIsqtD43OoF9LxUW+h6p/NxUOLfL/qk/OrA0LWlFQHjW3F
	g0vRozRixHHdwpmDeRhs2aIBW808+CbZYLJ+9DOxslXU427JiPYlj0XurJZfu+pR
X-Gm-Gg: ASbGncvfHIA/jiP16Qn5KXQA5rQlkbbF6pi3kAyfDOHLtgL8AEIfaZcA6Ul6ySG6qgC
	iAY7BfxJHLsfBcosR0D2Pw/oXsjGhVUFKCr6CWfR8fH1r+l24VxL4x8pg40oWBbMrC9kyqHqqmg
	iXKwhfbrNHkP6kvns2wwGdK1i7O8f6b1VvOW6b6F+7v8oc2PYZW//qhMoneDtZOgknumtjEAMEg
	wL7UTqm1VvhBMFuyEAmX8ngbwBpEzAe31Rn89owYhl6sK2mX5Tzo3J9r4a/+K6bb5OQN6J4WBMr
	v/MbYQcUTUw+mNzFICHLoccyUqT5ZsswKwptHVBPDXNsnU55JLkJYYyrPF53BxVoT5t4Isx6hYT
	H/Mahe2xmajDjgw==
X-Google-Smtp-Source: AGHT+IHtWmWqtfHYvKQdSTnK4ytCjUvrQdsg4m5ArmgTRZiLbtXbN8gulX8tw9TtdIc+hh0632nvWQ==
X-Received: by 2002:a05:6122:168d:b0:52f:4776:f6a7 with SMTP id 71dfb90a1353d-530932a7a26mr7949271e0c.0.1748940797674;
        Tue, 03 Jun 2025 01:53:17 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5307482a15esm8991156e0c.0.2025.06.03.01.53.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 01:53:17 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e45bfb885cso3580784137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0MQveGXmhEpajYEcBMAVf2MR19EIShCx9hBn6WwEz+UM6Qw55pbu1qa8eIp53BkX3jO/yxfX85Z0rGbY=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac3:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4e701adfeeemr7965439137.16.1748940796757; Tue, 03 Jun 2025
 01:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603053120.3985-1-pavel@noa-labs.com>
In-Reply-To: <20250603053120.3985-1-pavel@noa-labs.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jun 2025 10:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyX-7Qh7RcdrFPmL++OSVFuUqXks6NArsssQvHX_Epog@mail.gmail.com>
X-Gm-Features: AX0GCFvnVYi8muICAZnC2LJqvm4V3u2ua1TwcEaP_WLEbZFODRgxcLcS6XUtt-w
Message-ID: <CAMuHMdUyX-7Qh7RcdrFPmL++OSVFuUqXks6NArsssQvHX_Epog@mail.gmail.com>
Subject: Re: [PATCH] Fonts: Adding all Terminus fronts from 12 to 32 in bold,
 and normal versions
To: Pavel Nikulin <pavel@noa-labs.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

        Hi Pavel,

Thanks for your patch!

On Tue, 3 Jun 2025 at 07:31, Pavel Nikulin <pavel@noa-labs.com> wrote:
>
> This patch adds an option to compile-in all terminus fonts, and removed the old bold only terminus version
>
> These fonts were convereted from Terminus psf files with the help of psftools and a script.

converted

>
> This patch is non-intrusive, no options are enabled by default so most users won't notice a thing.
>
> I am placing my changes under the GPL 2.0 just as source Terminus font.
>
> Signed-off-by: Pavel Nikulin <pavel@noa-labs.com>

> --- a/lib/fonts/Kconfig
> +++ b/lib/fonts/Kconfig
> @@ -112,15 +112,141 @@ config FONT_SUN12x22
>           big letters (like the letters used in the SPARC PROM). If the
>           standard font is unreadable for you, say Y, otherwise say N.
>
> -config FONT_TER16x32

So FONT_TER16x32 is now gone, thus impacting current users?

> +config FONT_TER6x12N
> +       bool "Terminus 6x12 bold font (not supported by all drivers)"
> +       depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +       depends on !SPARC && FONTS || SPARC
> +       help
> +         Terminus Font is a clean, fixed width bitmap font, designed
> +         for long (8 and more hours per day) work with computers.
> +
> +config FONT_TER8x14B
> +       bool "Terminus 8x14 font (not supported by all drivers)"

IIRC, the "not supported by all drivers" comment is only applicable
to fonts with a width that is not a multiple of 8.

> +       depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +       depends on !SPARC && FONTS || SPARC
> +       help
> +         Terminus Font is a clean, fixed width bitmap font, designed
> +         for long (8 and more hours per day) work with computers.
> +

> --- a/lib/fonts/Makefile
> +++ b/lib/fonts/Makefile
> @@ -14,7 +14,23 @@ font-objs-$(CONFIG_FONT_PEARL_8x8) += font_pearl_8x8.o
>  font-objs-$(CONFIG_FONT_ACORN_8x8) += font_acorn_8x8.o
>  font-objs-$(CONFIG_FONT_MINI_4x6)  += font_mini_4x6.o
>  font-objs-$(CONFIG_FONT_6x10)      += font_6x10.o
> -font-objs-$(CONFIG_FONT_TER16x32)  += font_ter16x32.o
> +font-objs-$(CONFIG_FONT_TER6x12N)  += font_ter-112n.o
> +font-objs-$(CONFIG_FONT_TER8x14B)  += font_ter-114b.o
> +font-objs-$(CONFIG_FONT_TER8x14N)  += font_ter-114n.o
> +font-objs-$(CONFIG_FONT_TER8x16B)  += font_ter-116b.o
> +font-objs-$(CONFIG_FONT_TER8x16N)  += font_ter-116n.o
> +font-objs-$(CONFIG_FONT_TER10x18B)  += font_ter-118b.o
> +font-objs-$(CONFIG_FONT_TER10x18N)  += font_ter-118n.o
> +font-objs-$(CONFIG_FONT_TER10x20B)  += font_ter-120b.o
> +font-objs-$(CONFIG_FONT_TER10x20N)  += font_ter-120n.o
> +font-objs-$(CONFIG_FONT_TER11x22B)  += font_ter-122b.o
> +font-objs-$(CONFIG_FONT_TER11x22N)  += font_ter-122n.o
> +font-objs-$(CONFIG_FONT_TER12x24B)  += font_ter-124b.o
> +font-objs-$(CONFIG_FONT_TER12x24N)  += font_ter-124n.o
> +font-objs-$(CONFIG_FONT_TER14x28B)  += font_ter-128b.o
> +font-objs-$(CONFIG_FONT_TER14x28N)  += font_ter-128n.o
> +font-objs-$(CONFIG_FONT_TER16x32B)  += font_ter-132b.o
> +font-objs-$(CONFIG_FONT_TER16x32N)  += font_ter-132n.o

Please use descriptive names for the font files, matching the
font names.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
