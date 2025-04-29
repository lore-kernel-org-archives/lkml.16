Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657A21A449;
	Tue, 29 Apr 2025 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908807; cv=none; b=Ya5F0Am/tCE0LJ5uAgpXOtjK1f1HinHCXjlqMh59aFKnhirXJHwrZ91pHMl54lpZGZRMfgXAp9WstpHOykgQ+EMOib4m6fokxaRgZhKN0+gC4dJE+X/MSN3v6mWygOvqSl82y61NsYDwLVa9PvvLg/t0k9ZoGbbm9/so4K7qySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908807; c=relaxed/simple;
	bh=ExfKrgglDVsFkrWeuDGnsYnAHGQeApbUp4wJfaMOEQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orYrYoCXmc7UDQCIj8o8i2oLWm9MCa/2OmHON5BTeAiLjBXSrluPFslGiPAiYRu+NIb2wYVXgqazDW3hpOk7Kea+FtcLDDK207/bqBqrShdPj0lDx3onLvT58Z1bE/jaKn0MUGqsq2FkKkQ2mJufdIhqF/ctM+xSk5zWRAHL9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-524038ba657so6571881e0c.0;
        Mon, 28 Apr 2025 23:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745908803; x=1746513603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pTZwWCx4AwPAg2sEXFNw62Tg9w8hwaYI+/a6YbFJHs=;
        b=Du+EvV2ng4Kjl3/pse9YeWdosnzI4ywl9wlHncEpANjX9/vl9QCaVB8DMsuZiD4wu0
         +nQ2OZGyfrEcS1Oi8NHdJEE2cHziJ4oKyO+AXBePngENSWE+zZGyqDAdGIGB7m1PM7eX
         3MLUMcTNZ7DW3ZHFGecxcRwPOCHbvY5FeiXAnZ3G7ZcH2ALw0nY3eUS57I7fzBhGz/li
         8e7Kwjc9Rc5zvn0Un5juFgN5Rk9dUh1UvSLLHo0C74Eu3/o7XaQfHxu4NmWUmjJMtsZk
         hvE88nFpi5Qo0X7I39GgiKqL2HzAsr8ietLc8jCmdqhmtw23rCcOoLOaawxasnFyx9ex
         nGmg==
X-Forwarded-Encrypted: i=1; AJvYcCUIPhBiTNe0r1+QBXKY6tXFU3qOV4twTQwxhkUTrbHcgdKG81mqEYVgeWENA1C8/peIfD6gj+5J4wsBN20T@vger.kernel.org, AJvYcCWHZP+1mHzqc2GRe7apMRaGoySziakcLL3rMSV9awBsCf+EOXDWGqpGSqxLDkFjjcSZ/VJu7hgPd9os@vger.kernel.org
X-Gm-Message-State: AOJu0Yznw/E5pqGMm1TerE/gVvZ/FZYVHWIF8GG3yZttbquF8c/yCSGe
	9EDTme6H7nVj7oGpHj8WVEovSsPh8goj8STicfChgDrY0blLwWrtt+rFXMDL
X-Gm-Gg: ASbGncvX6phqXTxqcsm6dLdJiRakp3LA0YmmFVetphP3FYjzseuIeicklsgp8+GOxMj
	PrSe3u+x9Wug7UzT3GuzvkpQyWOE6ijaJ4eHbZuCaLWgnHGH6RPT1A5NL5tzXpNu3/eevWkUO5/
	UA/ZKZ5aASMQ03iA/T/L6EmibQWHLt1ix1oq49ffxCd4ilu6bXvjl/3LWZfmKDAfryy/LmEH3sc
	tW0BFFN81BMJJv44YLrF2gzRQ5bSrVIKy6ZlUtGXv8Q74B2dqJFGtGiRFvRpQyqlBMN/fuC+eze
	hGUUBHDHT3Q7JksxRugMp+Dv4uJxdXFiPnuzKMuc1UUCvwdMPL13KRPdWEjbI1lPPBHJCx2ZI8X
	xfVc=
X-Google-Smtp-Source: AGHT+IG2Q1FYENVow2Fla461i+BdoFcG1zu5kxV6pZnTHfYQB/kz9J6WLvsiTM8nrfzen29vQndk/A==
X-Received: by 2002:a05:6122:1988:b0:524:2fe0:3898 with SMTP id 71dfb90a1353d-52abf7d30f3mr1232857e0c.5.1745908803430;
        Mon, 28 Apr 2025 23:40:03 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-877c6965901sm1237182241.7.2025.04.28.23.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 23:40:02 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so6031854241.1;
        Mon, 28 Apr 2025 23:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4PucIeoiX2++4KSGGt6gOsmxzmKrvFbOfuPrscxfLZOd1O2flIr5pcOotU5WjdKP+YN3soKkXGm2CRwGo@vger.kernel.org, AJvYcCWJhUyprX/Fag9lL4zroo4YUUxFrOooVllpW3juQABh6hVhgAR6Oz8kJS86SX1h4cX25okw4fxrFNJ7@vger.kernel.org
X-Received: by 2002:a05:6102:3751:b0:4bd:379c:4037 with SMTP id
 ada2fe7eead31-4da96bd8c66mr1250087137.9.1745908802569; Mon, 28 Apr 2025
 23:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com> <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com> <aBBukAqH3SKV9_Gl@gmail.com>
In-Reply-To: <aBBukAqH3SKV9_Gl@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Apr 2025 08:39:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
X-Gm-Features: ATxdqUF3MaMpFsIQbQe-FvL_1o_alODB-fPu_OUxCIJH3RlIBpudhPHHypgD7Vk
Message-ID: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marcus,

On Tue, 29 Apr 2025 at 08:15, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
>
> [...]
>
> > > +                       /*
> > > +                        * As the display supports grayscale, all pixels must be written as two bits
> > > +                        * even if the format is monochrome.
> > > +                        *
> > > +                        * The bit values maps to the following grayscale:
> > > +                        * 0 0 = White
> > > +                        * 0 1 = Light gray
> > > +                        * 1 0 = Dark gray
> > > +                        * 1 1 = Black
> >
> > That is not R2, but D2?
> > include/uapi/drm/drm_fourcc.h:
> >
> >     /* 2 bpp Red (direct relationship between channel value and brightness) */
> >     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> > /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
> >
> >     /* 2 bpp Darkness (inverse relationship between channel value and
> > brightness) */
> >     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> > /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
> >
> > So the driver actually supports D1 and D2, and XRGB8888 should be
> > inverted while converting to monochrome (and grayscale, which is not
> > yet implemented).
>
> The display supports "reverse" grayscale, so the mapping becomes
> 1 1 = White
> 1 0 = Light gray
> 0 1 = Dark gray
> 0 0 = Black
> instead.
>
> So I will probably add support for D1 and D2 formats and invert the
> pixels for the R1, R2 and XRGB8888 formats.
>
> Could that work or are there any side effects that I should be aware of?

That should work fine.
Note that you do not have to support R1 and R2, as they are non-native.
AFAIK XRGB8888 is the only format all drivers must support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
