Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBD292B2E;
	Mon,  7 Jul 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881869; cv=none; b=R21+f1mzO1me0oilMmONxpcnzmJBevXxqTnTTtsTugBClaZVIq3dyMZNa+tgGVYBl2A9pR8mv1YWg6xWCbVsiGCb1dOhaJU9pU7xSTM7OD8dzPkJzvZ9YGu2rimW8QG11hbI3Hqr8q8pq97jUAvxLOXzUHQ+rAo30Tg5NDt27Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881869; c=relaxed/simple;
	bh=+HetFi1ExroIsOoN5/lcGI2lk74GVglG+0Rv3wYS/5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsPJKuyKvEE96Z86lwfkJoSU1GPjri1J8JYTbc8qHJMIx0ceTlKRUvQLrTMnNrIYQHRtg/kKKQDTB4q1ZXw7k00uuBSdfn7eKuzm4C4VeP80TFNqp7qNCbl6DA/zJXfy22t8rPZxbRTbjEbAE0mgCOnUWbPOL5RWgNrcwsQphM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apRb+luG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apRb+luG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso2545146f8f.1;
        Mon, 07 Jul 2025 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881866; x=1752486666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=apRb+luGkLeOZNfD5BJ4wWyQ6xUa7w8JtxtqBXN+j/XiyCcp55/yEEPHhZXUI0vQ4i
         iqpsdmJsjl5YT9+y0XYROYXfiiAi8j03YNMUbiZBGwnh7gRVy9/EibV/3inxFBDYIhT+
         dQM4efGMJt3xywlsUwDHfC3dMrcHSSAvcOIfHCxcrR0D2DxXBmHt8honJeLryXfvgdW7
         vxTyZNw4qYhLQuq/EazypK3Q0XcaQA4NmZeTsLFwXhmuLU7//5NHsudgkky57IrSe79N
         H+BJ0L3suMJOqRLuRFcFeLYsBexTlwifQbE3bjZqfiIc5aDUy17jjfgaAsjI7VbPmNoB
         mxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881866; x=1752486666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=Jw8IzGG47tqKYgRKIoIROGxfgtWiguew7EtfRXFH5MuF4I1M8MMLGM1FRJWhFJNrz3
         /A1ev+tkvypT/dgoF+CSXdLGsjVjyQFmQG8GhNAJwVGRkkxfNYF9/YO7dYCiHAk0+ilq
         ZC9qANpYjBW7NMkumd1tEPWzLZUnQiGyIvAG+t80uKPe5WBpLSylnJUqzynfb5O4dcgq
         OAOzCUP/VIEnnozdyVJUfusLe7BUw2/CndMPQlHWHKJZAsiYNrEMTWcA3dFgAE3ff6RZ
         J7H57k8BNDifoQkN9cIeUNPJ3786gmQKSbBIbv3/6WWWiXJiKWW+xNdU8ujRPz+EC7pY
         9bZA==
X-Forwarded-Encrypted: i=1; AJvYcCVmRoNkUzmiZ95bhFPhUjrD5TsUzODsuR949iqrxupK1/F42Gdo0iyh9HDHI2/yjBipvbozoicCKfOJ+Za2@vger.kernel.org, AJvYcCVyfQgz1TSzzXA6cz6vieLp+6ryeAmg2f23oasiSiS5M5jtAh6N+FbZTwtkuT0o9QBOXQ/sLw7Pe2/W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoz18d0Luuca4wj9/+Cte2jU3g8/Gbp0mUIXXVxL3jRlyWXcW5
	xsNqth9878jSHoNCfsfPP0+gTaH3zBiG1GbxI+h4UDI8YBRM4Md9BpFDRmV9yVPBax27JXmBmKr
	9dBNggbDri+NgzCn4mtFf1BLbXdhF8O0=
X-Gm-Gg: ASbGnct1X/IctH8XjfVAmXtBOoWVxMin9vnADUniueh3jwKacMoaGFyo4b6oV/hsIax
	RsuuTNDZS/GQ7jIMBM3I+vTRVOBP2/6zJ5bY1PV5IjP80JvyjgH7Z7LK6ZhAQ1wi+o7GXpXVAgB
	jdv4GP9ZZJP2C71Ssy6rnvBMasfndj2+ytMReONnoeQ9sngg==
X-Google-Smtp-Source: AGHT+IHaemfV7Yc8MYTOKmXHmjBgPc678uQXZOdUIfyot5vgXXAe6u2p/8rl0gl5MOdA1YcH9Rs+GNziSjER+UHyVSs=
X-Received: by 2002:a05:6000:1449:b0:3b3:9c75:a4fb with SMTP id
 ffacd0b85a97d-3b497029621mr9832614f8f.33.1751881865712; Mon, 07 Jul 2025
 02:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-2-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-2-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:50:38 +0100
X-Gm-Features: Ac12FXx7rJuxVDh4Pe2HacJlhHB6J3LpsyU6J4KL8NZ4EBGUAf2JV3T_SbkKDpM
Message-ID: <CA+V-a8unFMmA2NdwuofTL1fx8vVHtD8Y9QbW2ec8B656DK6AAw@mail.gmail.com>
Subject: Re: [PATCH 1/8] riscv: add Andes SoC family Kconfig support
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

Thank you for the patch.

On Fri, Jul 4, 2025 at 10:02=E2=80=AFAM Ben Zong-You Xie <ben717@andestech.=
com> wrote:
>
> The first SoC in the Andes series is QiLai. It includes a high-performanc=
e
> quad-core RISC-V AX45MP cluster and one NX27V vector processor.
>
> For further information, refer to [1].
>
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  arch/riscv/Kconfig.errata | 2 +-
>  arch/riscv/Kconfig.socs   | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570d..be76883704a6 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -12,7 +12,7 @@ config ERRATA_ANDES
>
>  config ERRATA_ANDES_CMO
>         bool "Apply Andes cache management errata"
> -       depends on ERRATA_ANDES && ARCH_R9A07G043
> +       depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
>         select RISCV_DMA_NONCOHERENT
>         default y
>         help
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index a9c3d2f6debc..1bf5637f2601 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,14 @@
>  menu "SoC selection"
>
> +config ARCH_ANDES
> +       bool "Andes SoCs"
> +       depends on MMU && !XIP_KERNEL
> +       select ERRATA_ANDES
> +       select ERRATA_ANDES_CMO
> +       select AX45MP_L2_CACHE
Do all the Andes SoCs require all the above three configs? (If not I
would add it based on the SoC which requires it.)

Cheers,
Prabhakar
