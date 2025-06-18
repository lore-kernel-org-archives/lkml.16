Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1F2E9EC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254198; cv=none; b=Or8ElUN6KKaTji22yFxIwq4gqlUQTn87eKfpvMUgk63YOU4IdO9h59IGVVs02Ah+E6ri9Ri57aJhP/KqefAQ+TrAt+61qkwXAmTbnCdBZ8eQWEXeJJGwfc9OrqB1idmHvsDSMjElyA3X787F2D4BKw9GXmSlDYQ7oPsmlC9MFUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254198; c=relaxed/simple;
	bh=lHq8LwJCpZsYnYoF7lpMvKsBXva+7QpieDXG+mexd9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKiWYOogE+0s5irDKiAkmLAu88/iHHS/mwp1rXg59LfBAykYOA3RzRxJRJXKY1eGXDrvbSWV1BFqR1y17pcDaxcJQB1dSZR/+6qMMcsKEKg9ntMwWdjt4sK+tP5aoWNkiUoqnuaeg2kVsEf3qfsk4//saqE1sHMREvdkUlcyeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xS6FK0x2; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xS6FK0x2"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b51f5218so5305022e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254194; x=1750858994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
        b=xS6FK0x2ckjJRDCOfYEqAjbObtuf7BegqO73WTslIpKQ4g2eYqv8ZhDYliLd466ZSc
         o39UBW+sczuzV42sNtiXn7balALacAz9Lc5Eu2hSo7zDC90FVasK6S5Emck63GNORAai
         UBbAOV4jt+ZzGCgtYBRgEGrQNDgYkl97ipxpK9vss5Ky0IqWkt2IZ4wSqNpAkP3aXoD/
         /APpDjU43hxKKFb2Z7HTJDX13f3lqxOCUvQSmoZAFDWzMArLBxDAKbDR01tLJEgJmck0
         XLDZ+u5UtcsdQtVKXSwMbHjPr+Z3DCG4GJmobsJYd4TgEZSEKGsR+8FRpACsTIusO3c4
         cw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254194; x=1750858994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
        b=qt26G/bM5MLkwF6Y7DN8H2qdfjoNEj8DmfNOqf20esDhN5j/XMYhC8gL/wQGCuWJOp
         Siyeu8I9w56YAsC8FW1xHxOXryE/MiIO1Fc7QGGGRS9lsq5bEyDHt6qTwK8esLf0P6Pg
         GoWBSj19KjCVsahpdV21l6yICEi4MfId12/i7+Mg5G4fjJ9kDXc9z8SoPx7IOdOmsR3V
         bVPBdHxEWXb4WueRB4QD65XNf8+f2uvWFu5e2XdvYBH9o9XmcbRRI3Hx9UVqfyqgCjTe
         89WX6RTobKqsrS5tpHtRFG0uJ7RAjyPIuopvQf6HKwagKdSZl9BP/WrpnxqUeA1MBaR6
         MlEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMV2zZURjV1ATrsIJKPg8LFoXlFcp0gAi2WKtYNYIcjwvJ/znTPXZTXmyYPppwUefYuuivOzOh5JBGiNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5jl7GbExVZYuoAa8bQSsFBvUUZvyqbknKPJJ0yHgQfPalSiQ
	n65ABRyZtUkYoIJo8f9PC1MxPvjmo+Ft1sTCyfTvy/Eqf6VIDakfr5vpQVlkJWaCgqAX9GhwP5F
	EBPPfN3v03S4tGsS7JaLqk/BdPLDR3GDYF1VGS4ea4g==
X-Gm-Gg: ASbGncuLoEHEIihk6guUSrulH1QmKeiRI5XxojpM+bR0PA7POy+yTTx123K1dcS3Clw
	jeBJwC8OTV57S+0TtlkXzyvNEqP+wW36nDULjnMAfKL4g2t2gTjOG/QdTGJvjnW8S3UQuDRd4fh
	oQ8KlwcEpBWgDR9jlQhFs7QbjyZDA/Hyd2LFDwudU2pUhF2g0Zh6QLDNRpMe354O/Gw/3B0IQ5C
	Q==
X-Google-Smtp-Source: AGHT+IEECYD65Et/LmSBnvEiKApYIkAD1brUDvo7BBfhvnXlFl9/WYj3FARtHuaHKB5NARXPoTCzd7KIs42A0Z1Qt14=
X-Received: by 2002:a05:6512:2351:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-553b6f5a056mr4801515e87.57.1750254193987; Wed, 18 Jun 2025
 06:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:43:02 +0200
X-Gm-Features: AX0GCFv-psDNb6_Ffk6XjHdwrMsid_b9idm2knOXcGXYQtnqAYke8L-CxfsFZ0k
Message-ID: <CAMRc=MeiCT2f902h4viFbue1tejv7EGBvEjdQhOTuqDqEViwRg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Add the "gpu-clkgen" reset property to the AON device tree node. This
> allows the AON power domain driver to detect the capability to power
> sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
> driver for managing the GPU's complex power sequence.
>
> This commit also adds the prerequisite
> dt-bindings/reset/thead,th1520-reset.h include to make the
> TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
> dropped during a conflict resolution [1].
>
> Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d6307=
2a1573431e51893 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>
>  / {
>         compatible =3D "thead,th1520";
> @@ -234,6 +235,8 @@ aon: aon {
>                 compatible =3D "thead,th1520-aon";
>                 mboxes =3D <&mbox_910t 1>;
>                 mbox-names =3D "aon";
> +               resets =3D <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +               reset-names =3D "gpu-clkgen";
>                 #power-domain-cells =3D <1>;
>         };
>
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
