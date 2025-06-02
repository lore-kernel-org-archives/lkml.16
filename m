Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076C22F177
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875605; cv=none; b=H+gq+IBGSj6wk2vPRIY2qs16oiXfuSl99Y4F8bG5WWWrFAFlfH/pjou2bFMVOqB20tC56YZalOlj63/9j9IUP05RMv8kdNGdJe9myosVlhrPM5TaTgnn7b1Ht6kGPJljvx+Pq2u38u/Vzr/S/UwAs1LOaos6B+XJTkP4g7qaSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875605; c=relaxed/simple;
	bh=WXB5l7SzCJBSPdEQilpoEP7QHtfjo27lF8GSaY5y34I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+9+fD/63PNPL0oZ8K0cbezYirCRRy+9pxtGm1nfeJdf+g6+7dUTwcqjX9fL+kLUQFg5EHlFU4YqLxj90i08sydBcOWzfq1OczkUUNNW22uk9jA5gpRCF4Uw90ysB82cllBO2h3jGAcADM3jaaPCk+altjezkbKwAb6dy9HRoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yUjZPn44; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yUjZPn44"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55324587a53so6235846e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748875601; x=1749480401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
        b=yUjZPn446rujo02dzBJulRuegACSjZ+/0204I4U+F+kfL4gq25cDacCrhheKFgIbC6
         es7cJBbR/2PM41mPlGSk/pZXkIy6yAw4rEciKQJFdRnv9nOxerR9aSttr8XZ4oFwEgjD
         YjRz1oFhRkpb8im01iyUDr+1QajDbai7NfYRlepWkTClrVxvfYvX1V12sgLGorTo4eqI
         KBEeq6ll8GuejwdOIC6mSW45zpczk1rf28lrwSTbwspYAkp1is5QogCpZLadltY+BsbZ
         R6QK4X0egEWhMx6v5HxfVLqvW+EhfiStxgisvzOrSgZCThYO+PcoCps99l9TAeIg39/f
         fxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875601; x=1749480401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
        b=ej0+7gLRzzWKidgR8ZP1w3QtEDmjjdWpCS7YyKnzibtx5ar0CCGdcjHo5uT/7lzntE
         d8YQpWFjbDURYhJzzmXavclLSigc7gmoJqKRp+27H0e8Np88sGb8ehGC7oWZj9xQJboW
         h7Foxs/0UorukNz3CXQG1SSHTQv5TzgWTi5P2G1qdM6RjoTSARAktD/F6dhRONHH3Sno
         7+s/f6OIqBxjwhttGcM8wSLuFpKgTszH1qyWBgRXqaPG6+WUpsX/2pML4bQ7xEKca5Jx
         7no7Is7qiTYXlrPi/Uw8W52hNzUx1hI1qVa3Q68N0LmC/txxEFmaUXW2fkVR14nYbANZ
         lofA==
X-Forwarded-Encrypted: i=1; AJvYcCUzEeLB5ALZP0hpjjUJXDWShTZxlmkqteyoAUopQODYCyfGHoUAuGJVrH9cQXq+IPePr6O7Ux2EHPJWcCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzj0btSHeMYrY36u/1yZEn78cayIFbPLEUKJkbpS+kaSoyvx5/
	E9z9PdXnWHPTAyXG6kBmx0LXCFz/ubALz8TKO2LOP5m+YJ77/1SAbgydTSlL/APxCytCDm7g+QS
	F1aYcpxNPkiN4bHkuuW7azWaUHV8Sv9vmsim7/2HXCQ==
X-Gm-Gg: ASbGncuuZvydXoybFyeL1pfaa6KmzRES2YLvZ+NpRW5wG4H1Rg2Jp8h/AQXZcQaF4vY
	/YRmH6j8S8Au5tKOARG+k0lYpZ1+NUrn10E+1etxjA3H2YfPO/Q7e+MgOQb8MvrG9D6DQ6sT7FH
	PdUrqYn50MoxWr50s89nTP+wPKUmLtW/w/lEgiu7VsNQPd+bbUoHZH/niLSUQuT987x+A+hV3jA
	9M=
X-Google-Smtp-Source: AGHT+IGw32F/MdMOccKhZO4XhdGXd2zDj9BI3w6oPi/36aYPhkJHPAtjAIeBiB8am3xWo3XPqYfLxYrbf7Mw3kihmy8=
X-Received: by 2002:a05:6512:118d:b0:553:2bdf:8b87 with SMTP id
 2adb3069b0e04-55335b117ebmr4997380e87.10.1748875600944; Mon, 02 Jun 2025
 07:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com> <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 16:46:29 +0200
X-Gm-Features: AX0GCFvisvrL36l-aUNnU_LsfSK7tpw2-raHvXmZ5rzs225tzGALdRdBL2pjUL8
Message-ID: <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
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

On Fri, May 30, 2025 at 12:24=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce device tree bindings for a new power sequencer provider
> dedicated to the T-HEAD TH1520 SoC's GPU.
>
> The thead,th1520-gpu-pwrseq compatible designates a node that will
> manage the complex power-up and power-down sequence for the GPU. This
> sequencer requires a handle to the GPU's clock generator reset line
> (gpu-clkgen), which is specified in its device tree node.
>
> This binding will be used by a new pwrseq driver to abstract the
> SoC specific power management details from the generic GPU driver.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-pwrseq.yaml        | 42 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.=
yaml b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4c302abfb76fb9e243946f4ee=
fa333c6b02e59d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/thead,th1520-pwrseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 GPU Power Sequencer
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description: |
> +  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
> +  This sequencer handles the specific power-up and power-down sequences
> +  required by the GPU, including managing clocks and resets from both th=
e
> +  sequencer and the GPU device itself.
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-gpu-pwrseq
> +

Before I review the rest: is this actually a physical device that
takes care of the power sequencing? Some kind of a power management
unit for the GPU? If so, I bet it's not called "power sequencer" so
let's use its actual name as per the datasheet?

Bart
