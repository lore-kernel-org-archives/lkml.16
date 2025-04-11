Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3F1D89E3;
	Fri, 11 Apr 2025 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744354072; cv=none; b=Lfn5gcUJqO96uK7lfj50Ugzg3HjHoxhH4846otio7mTN9cnSh1yOzSEx6KKhz4zK0TOtI6P3Kb6ysOqHMsKTVMwzJF8BPT/Sd39eIvi+JQJuZY3PbFTfBMqvxv7BmbFLXUZsy+9Axd660rlCyLh6jpfLTtXFanjIxQzHEsH8/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744354072; c=relaxed/simple;
	bh=RqadmLPaZF0x578wny3UFhKJ113jfZrccssXqxKx2cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3RY356yI4Tp3eo0DvGFo8xQkDzuq4c9+ka6Xegpq4gZordwte9wiRSaWntqJKr7p+xmFZhptbSqP0X4vBUiFsAF965xjc1Z8+8v7rMq+d2bEhNTcMaez3y+JChYIAFzb7Jesstof5pxrOUGpu5AY2rLGiIhFzR1cnPQtjy3V/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52403e39a23so1333088e0c.2;
        Thu, 10 Apr 2025 23:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354067; x=1744958867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGR7mWRmEzIrpJUi7UWHEZEg/9QQ43c6MiXTxlPQcq4=;
        b=rAnuWFz15PO+T4FtfENdWT/I5qf1jnV1ZFHj/8Dup8+H8NoEc3wqPDBJr13WOxtf8x
         ksfB0yoNqAPDM1CieloIHN7uAFn3UBfFONsCfH4CdrppIXoI6iwifw9ZU/IyA+NJ5iPD
         Ng+nXTrOQ2A6PF9gBhCkJz6RpKY56f9uXcEdjw0WHPzMrCEDG4K0cJgukX5DGqPyEwEY
         vgJipVYt1G7h0PZdsI6V1lQgyzgSWiuXohAc5RsJMNQjdr7WZoOrKFhy371nDSkQt7Zx
         iKNkUInwJLktf4JikwdpxpEYe1cQCtCgVQ0FaH9xDQp1FJ70a/1B7rmVbl+OSl3ceWSi
         qqpw==
X-Forwarded-Encrypted: i=1; AJvYcCVnWTMBu2pECRtFqZBiDlz/w/uxMZlguOGjj2dV2AOU5WwrMH5MPMLhCTeWLOgHPIRfn3SgGRhavdJk184T@vger.kernel.org, AJvYcCXrEAavlgiYRY6ThHG5PrxuJta3IVN+MOL/h2/zP0EWir4zTl77akJ6vkM4eESl0ujuiXKUQSSB8Zvc@vger.kernel.org
X-Gm-Message-State: AOJu0YxxUqGYi1rMlV9igp7h9ibYUMudlDvPk5C2S3fp+nYy5aELGVhZ
	cgIijSFK/d0qfjqGEADLkanNQDk39xNY3RZJlOqfUHUoXoAGAtu+bjiLVF8K62Y=
X-Gm-Gg: ASbGncuva4OKt+lnNyN9ngWD48/GPLS849JWNq/FzIaqPpCL8Tqa/FWPMPTfq1hFt+F
	C5nZjgfKSwIMiwgm9vJn6BgNActIyubJR4Pl0TfMJb3uUa+fDiqFzCuBLmoiHnRA/iGVAEADjoP
	U7pJyRNTYKwxwYT/gTYspyiKRzm0jTQi6gIAgcedh5UQjDAu33oxAFszN40rMcVJY0s2RdeyUmo
	dB5pwd9AJZhMjT8ZmX+mXAcSRxnoEnxwDgGVmP7/pN4j+afuS/Bttwn8wTlcmHLN2N/I7nY80D7
	qpPwCyRkNDC2stO8u4Ajrb8Rcj+9AGwi1E7MU9YXBQUmCLSQkytetErMxbhwkAGuZveRn/v+BUx
	NgVO4Zb1mvhJMYg==
X-Google-Smtp-Source: AGHT+IHJhjzEBmIYWLMNO3LXPCyowY7XaST6CpjAE25Yw5SMPaHsjU9r3GZ/17Rb66KkpUmMC5gZRg==
X-Received: by 2002:a05:6122:8c03:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-527c35e80a5mr886268e0c.9.1744354066798;
        Thu, 10 Apr 2025 23:47:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abeaffa3sm986412e0c.42.2025.04.10.23.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:47:46 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso1495210241.1;
        Thu, 10 Apr 2025 23:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF2gVCtaZ3o4dymCveEizvw/RcG81TZfXKRROwvy3T8Z37BpMWc9FAgioLTqMXppMyeOnoCdoTG8vo@vger.kernel.org, AJvYcCWNs+fXoAKe21alMrTqlCQCmCx5UalGApOerqrRjzVVQPFCHoQ30B86Bg+dy+oz3G8+ClNG1zVY5TC0nWoc@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4c9e4fff1e7mr792684137.19.1744354065547; Thu, 10 Apr 2025
 23:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-st7571-v3-0-200693efec57@gmail.com> <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set> <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set> <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set> <Z_Z1UOan6Qu5d3VM@gmail.com>
 <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:47:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVF+QOm5JZf+1ztu=aEW_3+aFkpThzsLWMv3D=Anny_Tg@mail.gmail.com>
X-Gm-Features: ATxdqUF8Hu7Y_9qSny4hng_3kDPGLSDJJ_ESs8MJgeF-Dkf4QBXCDJVP__ItJPU
Message-ID: <CAMuHMdVF+QOm5JZf+1ztu=aEW_3+aFkpThzsLWMv3D=Anny_Tg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Apr 2025 at 16:16, Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
> > On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrot=
e:
>
> [...]
>
> >>
> >> Likely you will need to define more stuff to be specific for each entr=
y, maybe
> >> you will need different primary plane update handlers too. Similar to =
how I had
> >> to do it the ssd130x driver to support all the Solomon OLED controller=
 families:
> >>
> >> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/=
ssd130x.c#L1439
> >
> > Thanks, that sounds like a good idea.
> >
> > I've now experimenting with XRGB8888, and, well, it works. I guess.
> > The thresholds levels in the all conversion steps for  XRGB8888 -> 8 bi=
t grayscale -> monochrome
> > makes my penguin look a bit boring.
> >
> > But I guess that is expected.
>
> Yeah, the XRGB8888 version is a boring indeed comparing with the C1 one..=
.

To see the nice monochrome penguin logo, fb-helper needs to gain
support for R1 first...

> The drm_fb_xrgb8888_to_mono() helper is very naive and just uses a very
> naive midpoint thresholding to choose if the pixel should be 1 or 0. So
> there is a lot of information lost there unfortunately.

In theory, it could use Floyd=E2=80=93Steinberg dithering, like I did for m=
odetest.
However, given the display receives partial updates from damage clips,
it will look ugly, and may flicker.

> But that's what I did for ssd130x, to at least have a working driver. The=
n
> support for R1 (for ssd130x family) and R4 (for the ssd132x family) could
> be added as follow-ups. I never did it but Geert has some patches for thi=
s.

[1] needs an update, and still more rework to make them acceptable.

> > Please compare
> > https://www.marcusfolkesson.se/xrgb8888.png
> > and
> > https://www.marcusfolkesson.se/c1.png

Yep, the latter is using the correct logo.

[1]  "[PATCH v2 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1"
    https://lore.kernel.org/all/cover.1692888745.git.geert@linux-m68k.org/

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
