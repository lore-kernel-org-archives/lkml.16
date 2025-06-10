Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E11A2564;
	Tue, 10 Jun 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558473; cv=none; b=CE8PaO+gJ6l7dIHejQDc4WyXrr0Ov9nYzZLbhNuUo2vQcDDuMzVMhGS42djQ0AVIDXVqD/jeY7Ug83Vshzhb5m400GCwPC60QwaFInQLQto48lC5pkF2eDxaKQgrHT+/UCCKuIXv9IpXXpuw6u5Nuo10n0CiQyoFiqOby/anO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558473; c=relaxed/simple;
	bh=82Tv+JywrEzeN7+F2roKe6TyfUGe+a+jBcbiVbqeg2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BazYI+DLf5tZzaRwG5B1cvu48SbBboJmcFTjoKveeNHRmwMApsq4qQzgstadX233MGYLRE0BZjZ0lF61lB0B78jcZX8eoeT22ZuRuKaNwbcGCpmKv6s0Om8stPZjf8jHJhziieV6fmSAI2H8WbT438Md5O1JBQQJ+LtjcihjDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87ed0adb356so1663066241.1;
        Tue, 10 Jun 2025 05:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558469; x=1750163269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV/AAFi4bJPlIAZpl/ccoe8eQmFHg/wsVBnhDrW4VUo=;
        b=PjfVwP9lIC08xvsCvsPT8vsjWmecyAes5NohaqRnyypCv7uMOBA4uqQpNzd2z8fV1F
         hyQpYu5WMSzOCLjbxEQqJlP7KTbiWXD40HQdF27w8uSEdiFgO/GmOnD+dvWS8fC65RM1
         jMfJRHEgqo0VwA2KgPIgn98k7AXvY95W4HaBJpEVNSGgCEWnLJ1VmJ/Y+6Pn0RkYh8nj
         /Kt5r1jW+u6REBbS7V873Eeda3W6yGi8PLc31OODvYXGX1qeywiE082yd6+oDIh5yWLT
         1gFbdG+8m7dI1A5O3ApRKFJAuHnA/KbBJepzz5pmy4LYfdOt35r+2eA3IBG6rZn1ouvq
         yeEA==
X-Forwarded-Encrypted: i=1; AJvYcCVNh+x6iHf8RQWEDXukFDSjc/APoftjH9yBzFSl2JX1YWk3iao/GFFco/eyOROCUqPcIABbxc2bPZZG/Q==@vger.kernel.org, AJvYcCWMrZbDVpE/Rm/VImD1atihOLJaUb/Zvu+7mo4zXvoWs3KXfkqcsusMt7Fu+Nwk02h8kKVM9eQECcAG3iNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzG9ydOZF+uJZWqnxjSrRXJLPbUTj7U9SmavChyjduY6hMEGmRt
	cZFMcH5MspyPRYwaUgMTbya6TncCrAbPWHhlbMZCwIOjGv+exK65kMw+68KJpaFK
X-Gm-Gg: ASbGncu2OHifP0v88HfZUSgwG7+iEKWCfoHiOLLSEoWrwCEMmRHi9CsAFOnKIWfD9lW
	3Yfl3ioAVAmeXG+XkRST4EuMYOlHFY+94Qy8gRLuoXTQ/otZS0qLub1HTRL7RoJpFXIQx1/cqdR
	jD6ka389BxZbgMhPWbfP8NY0EHa+baGUEp8S6dBKD51EhWX2PgiKMKw4DuLQ7uZAIJ51KfyaqXs
	x5LyxT7u2PgcZ8jOQWYjU0r65vGgsGHlL54p6c7YfAyjMQVPvDA5ybbrQ7ocaEwX975ayFmvjaT
	0HwNaIAgulrypyg+4/gVK/NvbaMwcAFME2baNwcyme+V/iG1FEsOAEMmP8sMVlRRYVH0Damu72u
	MnQa2j0w6B65dQ8F+cRAARDKM
X-Google-Smtp-Source: AGHT+IG3UeQGi9c2Lr+xwWr0yyZc1dTtM+7qvwKa+TzeOq4jJFlJaPSTvBcLJ+8f1cOgplrqZN17/A==
X-Received: by 2002:a05:6102:6e83:b0:4e6:f8b0:36f9 with SMTP id ada2fe7eead31-4e772a7ae8dmr9620748137.23.1749558469265;
        Tue, 10 Jun 2025 05:27:49 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeae649c4sm1109090241.8.2025.06.10.05.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:27:48 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e7b7b09887so61056137.1;
        Tue, 10 Jun 2025 05:27:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUH0NxBds6licNvtiEoU085lnenfhSFeZEfKEkv8Nv7FhHi8QRyzQxPQPCn1JrPt7KwzhcwoFpujzmRXQ==@vger.kernel.org, AJvYcCVd0CNssXlFvGt0yrVhxi2Jj1Gn+Wx2aZrkvo6Ek0+186QR0d5o5jqT2t8F8JtMescNV5/5nAFAYrtxvZ2B@vger.kernel.org
X-Received: by 2002:a05:6102:26cc:b0:4e2:8b49:9f96 with SMTP id
 ada2fe7eead31-4e772920634mr12954353137.6.1749558468114; Tue, 10 Jun 2025
 05:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com> <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
In-Reply-To: <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 14:27:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
X-Gm-Features: AX0GCFvq0j-NYwjZdT1VDta_fhx-7_VoHbeEW53EeevilO-aJz4dYkNq7bYlyoE
Message-ID: <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yikai,

On Mon, 19 May 2025 at 10:48, Yikai Tsai <yikai.tsai.wiwynn@gmail.com> wrote:
> According to the ISL28022 datasheet, bit15 of the current register is
> representing -32768. Fix the calculation to properly handle this bit,
> ensuring correct measurements for negative values.
>
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>


> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -154,6 +154,7 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>         struct isl28022_data *data = dev_get_drvdata(dev);
>         unsigned int regval;
>         int err;
> +       u16 sign_bit;
>
>         switch (attr) {
>         case hwmon_curr_input:
> @@ -161,8 +162,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>                                   ISL28022_REG_CURRENT, &regval);
>                 if (err < 0)
>                         return err;
> -               *val = ((long)regval * 1250L * (long)data->gain) /
> -                       (long)data->shunt;
> +               sign_bit = (regval >> 15) & 0x01;
> +               *val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
> +                       1250L * (long)data->gain) / (long)data->shunt;

Isn't this complex operation to convert the 16-bit register value to
a two-complement signed number equivalent to a simple cast?

    (s16)regval

isl28022_read_in() has similar code, but as the sign bit is not always
the MSB, it needs two additional shifts:

    ((s16)(regval << shift)) >> shift


>                 break;
>         default:
>                 return -EOPNOTSUPP;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
