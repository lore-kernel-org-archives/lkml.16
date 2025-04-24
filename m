Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8720B808;
	Thu, 24 Apr 2025 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483931; cv=none; b=kFA1TTXNKrIwV803bloZicOBVaFJpHjovBQDNqAnw3MBHCFwFSM+KLUSxgJjfJrJNFPtc4EuM85nKLSMk+ULV/c2kegRnkhjAKXQf8b4HYQHXtK+rOMTVWTa4rFV6009HmPjW2lMl22KX9nPaMmDpt0gecm+4o7rXFENBVQiv+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483931; c=relaxed/simple;
	bh=YyV98+YaQfjZFxXDCixDSke2btG2skL0Xh5MEJ/fPDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI48jl+xCYKjZaUkKRdnbMtlznqrsgWrjmbKypViLmwP/BZE91mVl7kURHGeIoHMjfXUo2k7EoXIanCasFaC082vWT1pqYuu3iveQkt1Jl0YkvgZhOnWUstsfYJ1H48wO6+pKA14FZKkQ3+7zRr4Q778sLgW3+8vHtii53eUzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so369991241.1;
        Thu, 24 Apr 2025 01:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483927; x=1746088727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXX4mFHnm6kuIK55cjNxrp5WN6Ftx90SWsXCFruZ40w=;
        b=DU7L0oKnGPui540rhFmFTWnt2lC9/vfBlg/t/j9Y6RxDNz5zwpuSaduZgNMJnDrdah
         McdKqOFmxNAoQztjGN53phzagnl9wG2Yl8z/CjYNrPDo3fWgFXpVHbTwigwswXls40NB
         qloX8qFvnRZAs3XUzvpYga2XV1bNg9pGZWHgtrpbntO+JuF6r4ZW/rV1ZlG/Zm0vPRKu
         T18nWeXReojxEcIqrADDwqcNL7zNX5PU/f7qTwtdKsIiYeJo17wRTJzjhNzPoSJrtlaO
         8fGLulPGqykJmMRvwYyy4sUPongSCW4aEbVcve86nOvJVjT0OFC8XzIwpvoL9pFrscTF
         UlMg==
X-Forwarded-Encrypted: i=1; AJvYcCVXdazKI+e944hRbfn4e2GhSu5yL+6gnYge+PI0BtWBeh1pmbsZz/3ukGkRhdDK3kvZm0AqqFj7ciITy3/m@vger.kernel.org, AJvYcCWGOdGdpeG/X1P8Uih0X/KPIRNSDdtnd2JjTQ1NNOUOrJmuTSfXn0RPDAWgIxW5Lu0m6QWK4plNzyIR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzai+gISlV6ZaYGkDP+PhdRJTWD+L0/kJkCqKTQz1iEee2BQiwI
	0L/+asyWhHH+lh6KNgQF9c823x6b/xdD3dRZAVWmSho6TaKSX8mu5ePh8i4H
X-Gm-Gg: ASbGncuGxaNldn6K8pFXlhRXNb4YTDyADXVEZQYwME1cq0G3VhpyIekEOmgf2JjO5zA
	m4sVKPrqTN6e1ptmKo7IRjkN3kqE2dRDlslNFhujZcaWcO4Fytisa822zVwcPAu8TOBzXuj0nWW
	3qPgXXdee63GoY9mRHfbHWnqUk00KboWidBkWjODzbWsGSrZdLp2xtMAYODr7ao96wrS+zMerKT
	u+enKI9DbjIb/4SuOrM7dr2SIwaYwyywANn0M3UnVmovI8fi3X7AsDejybPNYjzTOkPpFAco4Uk
	zesrvionS13yH7Dy8I27plhSraW2/hCmsarbGAG0lt3CPitN6R8m1giug/z3VqwMawshvNx9X2+
	+OQc=
X-Google-Smtp-Source: AGHT+IExsTLlB8u9JhAiK1iS5nNtCNUwSoc3hXxsiQTNyRIFSlujlNMTBdv9qypfLs0zn8z99GqzHA==
X-Received: by 2002:a05:6102:1524:b0:4c5:1c2e:79f5 with SMTP id ada2fe7eead31-4d38ebec5d7mr1345017137.16.1745483926673;
        Thu, 24 Apr 2025 01:38:46 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4d3d4da039esm169240137.7.2025.04.24.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 01:38:46 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so335326241.2;
        Thu, 24 Apr 2025 01:38:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUExZj93gH1Ni3XJDLoNF4kyxuWEXCC4u6AquUCtiEojcjYPL+E3RAiPzJ1y3r+f8G88guhBNjX1t3v@vger.kernel.org, AJvYcCUNgK7O1t1mHzgnNjtl3nnD7u/KlNuAFTHbhXTqCjgHJ8to8kpHyX8KX3MmsShozgH70kAJPCF1e5teG0rg@vger.kernel.org
X-Received: by 2002:a05:6102:dcf:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4d38cb318ddmr1379456137.2.1745483925657; Thu, 24 Apr 2025
 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com> <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 10:38:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
X-Gm-Features: ATxdqUF2fRyGRvlnt9SP-qLlayAWLqGWTfteEXH26oVsrKfobO2Jdb0dn21RKE0
Message-ID: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
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

On Wed, 23 Apr 2025 at 21:04, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Thanks for your patch, which is now commit 4b35f0f41ee29505
("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
in drm-misc-next.

> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c

> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{
> +       struct st7571_device *st7571 = drm_to_st7571(fb->dev);
> +       u32 format = fb->format->format;
> +       char *row = st7571->row;
> +       int x1;
> +       int x2;
> +
> +       /* Align y to display page boundaries */
> +       rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
> +       rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
> +
> +       switch (format) {
> +       case DRM_FORMAT_XRGB8888:
> +               /* Threated as monochrome (R1) */
> +               fallthrough;
> +       case DRM_FORMAT_R1:
> +               x1 = rect->x1;
> +               x2 = rect->x2;
> +               break;
> +       case DRM_FORMAT_R2:
> +               x1 = rect->x1 * 2;
> +               x2 = rect->x2 * 2;
> +               break;
> +       }
> +
> +       for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
> +               for (int x = x1; x < x2; x++)
> +                       row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
> +
> +               st7571_set_position(st7571, rect->x1, y);
> +
> +               /* TODO: Investige why we can't write multiple bytes at once */
> +               for (int x = x1; x < x2; x++) {
> +                       regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +
> +                       /*
> +                        * As the display supports grayscale, all pixels must be written as two bits
> +                        * even if the format is monochrome.
> +                        *
> +                        * The bit values maps to the following grayscale:
> +                        * 0 0 = White
> +                        * 0 1 = Light gray
> +                        * 1 0 = Dark gray
> +                        * 1 1 = Black

That is not R2, but D2?
include/uapi/drm/drm_fourcc.h:

    /* 2 bpp Red (direct relationship between channel value and brightness) */
    #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
/* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */

    /* 2 bpp Darkness (inverse relationship between channel value and
brightness) */
    #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
/* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */

So the driver actually supports D1 and D2, and XRGB8888 should be
inverted while converting to monochrome (and grayscale, which is not
yet implemented).

> +                        *
> +                        * For monochrome formats, write the same value twice to get
> +                        * either a black or white pixel.
> +                        */
> +                       if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
> +                               regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +               }
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
