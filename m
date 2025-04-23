Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36326D4CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405734; cv=none; b=aQ1jfzgOs8yN3ff5WUTeKlSwykqieTbXXdvWJzvkp2xRIduFZ4pablR5+9wHSy1c79FG+uHYMkcd4TH4YFBPiYSm/Aoer0xhHG1XV+3+EmS4oJgRQAySBVXB194u+kT0sDiHdVcA6jMDCOyd3wU10N6in6NTDiKSYcWWNrEL3xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405734; c=relaxed/simple;
	bh=SKjFk3ffMxkD+dpYkzedNGkdOncbZzOJkyC9yRRgP4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSSjTuPBim1AXHttqxJ4YvAZ22RaDBukORW5hW3m/UY3ZUOJB+WeVUz5iL0sgDJBjn/vmyez88GNbo4tT8YMm+kziPika8PMACYrp4IE70jidKcGogm1iSavASKaDu8dXVuejuJf7SlTdK/q08MYOSrxaCd0YGWG9E9apeALUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qVuQPSwL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVuQPSwL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-548409cd2a8so8093868e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405730; x=1746010530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=qVuQPSwLwgkX3QNhRQpYTK/PvXRDY6DjmASI1/oqILesDlz7NAet+z8NQOp086efis
         brb2hSV3iZv7EOlcj/44dPta3cLI25UruAo+iQ7H6hWBLZIwMnCV1ybfDEK+qzdql1Yu
         YlzaQgZjDknt0+JaEYhQ2GpuEh+As01MJeV4p6GnBWMo6FXzwQFFgT/PcM4y3XEgnMDi
         ifYOIH/D9faqE5V7q9b/lfivnZLiH21XxybncxeRe3WylaoWLqMpkX+IbCPNYt0te80L
         QnU09eGtV268Jia/l6vQVU1IiFmIGtP2ByAmhyfYN6sQnZVo9qgx6AT/w9aKy7nvodk5
         kPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405730; x=1746010530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=bVs90Bt38WWj3R/2RI1u5ipxNHHUdnRnMB1WoHQ2q+CWli1ixEW3Zp5IjE9KXLhlvN
         SzLC3/XrPiDizXmC9KafgVCVAJcNqKSLW8j63RKKf2aL90moIAGG6v0Jeq4exq9vbYRS
         SU7Vfa7U0e8AZ9f6Sgbx0HjCGq93+sNNz38LTYU1wcdJuui3xMmJcR0hxeu99zqcAW5I
         HrbtfkfwalGV7Cw8Nw5+xAeRRyMmS7J5cIoTgn+T33uYbppPs6mV1WujcAgnKgAgRVf5
         HwdAVm1AgOcZlanwdonyZsOLndUQjwqBmegIvhd3dAgVbDesNi5CyD/QbISkKEMIzoiH
         z5Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVqPVHJ8wBO9TsViqQbYROzTjNsN8Io2DlcGin0K71c7d+9QPv8cUxg9a4Mnx+HbPmB+eU0fc+We3OnszU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYXjjsshdQqClpKRD2MMbmaeZN4nY9YbBYFGYsp9tcBsj2lQj
	YJU2G3Aryx1q/1wXStPrSTFTXIkdyT4+qJjlmP7N+wVzOE6Sxc0RdY+OkscXUPe9++3juCvZv1t
	wVyOsgbN+6UDZkGpBW5KJxcCRnjhewi0mboUcWg==
X-Gm-Gg: ASbGnctXAwp0AkekakN4yIIki87+u4B9zjyMRatCd9asqrA1l4pwoiHX9sbRmE3OF+n
	24QoMiN1pPqB4RdKP2I5seF2MuDsVpWxUMuTNmLVW+yYBBBqkvq9Txa5KDagdFywmMq6c8Cjq7u
	MiBiKSMXKSzKEWiF9v8BrF3g==
X-Google-Smtp-Source: AGHT+IH+wCC5kClOVa4KPQf9TkYFzC5VIZsHRFGsDXyoHjryg0sqITG6UMuWyQQrZUY+WCXhYGb106JflCU2vKSyjt8=
X-Received: by 2002:a05:6512:2315:b0:54a:cbfb:b62e with SMTP id
 2adb3069b0e04-54d6e657553mr6996509e87.35.1745405730442; Wed, 23 Apr 2025
 03:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com> <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
In-Reply-To: <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:55:19 +0200
X-Gm-Features: ATxdqUFXqKFRF-URPzhUFDAqkzV6vbnyL8yKyfMNTaK_xdGbJBDYNfkObBbEMA0
Message-ID: <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:41=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wro=
te:
> =E4=BA=8E 2025=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 17:09:42=EF=BC=8CL=
inus Walleij <linus.walleij@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >Hi Icenowy,
> >
> >thanks for your patch!
> >
> >On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> w=
rote:
> >
> >> +  starfive,force-low-inputs:
> >> +    description:
> >> +      The list of input signals forced to be low inside the SoC itsel=
f.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> >I don't see why you need this hack.
>
> Unfortunately these properties are not for pins, but internal signals tha=
t isn't
> bound to external pins.

We don't really care if pins are external or not, we are an operating syste=
m
not a philosophy department ;)

You calculate the offset and shift like this and write into a base+offset:

+                       offset =3D 4 * (pin / 4);
+                       shift  =3D 8 * (pin % 4);
+
+                       val =3D readl_relaxed(sfp->base +
+                                           info->gpi_reg_base + offset);

Compare to jh7110_pin_dbg_show():

               unsigned int offset =3D 4 * (pin / 4);
                unsigned int shift  =3D 8 * (pin % 4);
                u32 dout =3D readl_relaxed(sfp->base +
info->dout_reg_base + offset);
                u32 doen =3D readl_relaxed(sfp->base +
info->doen_reg_base + offset);

So clearly the entities that you affect are in the same numberspace,
and that is all we care about. They are not enumerated in any way
orthogonal to any other pins AFAICT.

Both pin control and GPIO handle chip-internal lines that are not
routed outside sometimes, that's fine. Just deal with them as any other
"pins".

Yours,
Linus Walleij
