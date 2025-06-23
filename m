Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B025D1EC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689188; cv=none; b=JWSnHbG1JjfASbijcdajRCh5fssdUS1vl+yUmZ1M3+s/svnN9ISva/eKMZiE5fCdRFasr1u8BFSZXQaGaSgp3YeV4NAL43AZeJ8xEXB3bOqehzCbUxPf3XxrKFYogGXCYTgUD11mhyBtWIeB1DjD3HoyEPMf/YgZfu4ZpBoBosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689188; c=relaxed/simple;
	bh=x5KqFZXgElR9++LB0VjgJyofXv4fHihwvsOF6Nt7N04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWf6W0UCxBJlHPBF4pAgv45sWJc5L9aSyTcpyQKK3taltEOPuDo89BDUaIHGtqvnLl3JHdOkz0v8O4wHzpGvwkzcvVVB+FsQZSMMBTGorWfHQ94RwF1OZB9/2j9UyGcToP+UsE04T1AMsvfhubUnQdU6FDLnMFGSrnAZoGlc0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=opLA7Bwf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="opLA7Bwf"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5532a30ac45so3628942e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750689184; x=1751293984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
        b=opLA7Bwfq2WYyxdgGZ8FjpBS9HXoDSXsywQ7x1QeyLCuHXQCUiSPvEfiMResWfQ7Zw
         tBsU3ULEnQxu/Vao9DOsrCSkpuF/E8Mj13TSGo3q5dB/K8NUN7vspyrg3Ji9t5+lvfCE
         pdLO+zFY6KK675glZFE+t7jUXaHl80Y3MU3BfRjH5zB7pC6dEQ0G/mNHGZG1VbBZzetk
         HGLqSfCfqxgvZ/iCvMkL61WCi6jgdb2iqXzsFC2B1rrbzo2N4W/bPPGemCEOaBjAhFGY
         vFT7SG1UN7CG3FdkMRxAsZHXmtOGqz9Q7S5lmMZmA2rBttw5GrBDq2Gwfe2sZV4A4ojO
         Ag0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689184; x=1751293984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
        b=jx7DqFNIhJu1QXG9w1VlO+Odr3gmXfZqEg49ukIhTWd8UjUrE2+qOVfrZgVYHzS2oz
         I15Nz9RJI1g/PrfGnh/JdsPRz65nZZNccej0MqFPZVXkAYRhNNbjrl4wx+0YBXrhak94
         tHjKng4HtH0n0v028Z60OT+cb5dqNIddAwznslPMnSyUYS/+Gt4aGdvhOnpV2Pc2RQcl
         ZCcv/5FoLJIfzLYkmgtEiKVmF0D1SsJWJZQFP4Rx4VqOPUr2fNNqN7KBGj4dLI8l9t34
         u8w0Q2lId30H6Qc79zfpb9LHmY2XEYyJVtB8nJ2KPf8LLSk7z+J260RcvTQS6X/Jw5LI
         4OJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoxmyBI1PF3SKHjFcO6p9H9PRso5KjeCFbSGQG65dHccRwoCcwFIwezJpjapUzJlYRd+KP5mbkdF/wQ3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDI2IfHoiaHsoZ51Z4TF/tQ49OqzrH+gJOJPBFexhkQRsdw9bP
	9nI9DpkJwWXjnNNhEL1jJ6FO/L+Cd8Ea9Q0+Nl9fW48TUPSvCaxd2rtxuhd5ftF7YgykdZSdZii
	2FI9N+9qN1LVxbc22e9vtO3IZeSwzgxhudMs1qyZm4Q==
X-Gm-Gg: ASbGncvqgP6mNRxWlMhlZiP1A2Ix063WHt/vRLo0m64N4ED4kYJnjoOUCUOHdDKlxOe
	K0hqYqblKxwUlwrx7EoAFaS7JdHM30SXq9agxFYBgCbVRzhP61X/xnlc0yXUu0Ifu/dbHMjHbQF
	T/x4tWhBf6EIaORCuRDvp2nbcgPalUY8PYLxKk6TxMJyKytmKYlTVbzhPKleC/PHxW04kuWMJGT
	g==
X-Google-Smtp-Source: AGHT+IHy7lPbB51UgKZbeAiEHWJjzs4pV8mJk0NbuirPhDOStHcXQ3Z+f7X+tD5fIjGZbRD5DTCBFLexuzsXjZ0eBBQ=
X-Received: by 2002:a05:6512:3b25:b0:549:8ff1:e0f3 with SMTP id
 2adb3069b0e04-553e4fdf72dmr3670967e87.5.1750689183720; Mon, 23 Jun 2025
 07:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2@eucas1p2.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com> <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 16:32:52 +0200
X-Gm-Features: AX0GCFtTbdiml00OQLqQ03QSeuySTknlMk23hbdQ1cT1QnS7KP2eYmI1IjWfLlA
Message-ID: <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
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

On Mon, Jun 23, 2025 at 1:44=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
> controls an auxiliary device instantiated by the AON power domain.
>
> The TH1520 GPU requires a specific sequence to correctly initialize and
> power down its resources:
>  - Enable GPU clocks (core and sys).
>  - De-assert the GPU clock generator reset (clkgen_reset).
>  - Introduce a short hardware-required delay.
>  - De-assert the GPU core reset. The power-down sequence performs these
>    steps in reverse.
>
> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
> callbacks.
>
> Crucially, the driver's match function is called when a consumer (the
> Imagination GPU driver) requests the "gpu-power" target. During this
> match, the sequencer uses clk_bulk_get() and
> reset_control_get_exclusive() on the consumer's device to obtain handles
> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
> along with clkgen_reset obtained from parent aon node, allow it to
> perform the complete sequence.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

> +
> +       /* Additionally verify consumer device has AON as power-domain */
> +       if (pwr_spec.np !=3D ctx->aon_node || pwr_spec.args[0] !=3D TH152=
0_GPU_PD) {
> +               of_node_put(pwr_spec.np);
> +               return 0;
> +       }
> +
> +       of_node_put(pwr_spec.np);
> +
> +       /* If a consumer is already bound, only allow a re-match from it =
*/
> +       if (ctx->consumer_node)
> +               return ctx->consumer_node =3D=3D dev->of_node;
> +

That should be `!!(ctx->consumer_node =3D=3D dev->of_node)` or preferably
`ctx->consumer_node =3D=3D dev->of_node ? 1 : 0`. I can amend it when
applying if you have no objections. The rest looks good to me and I'd
like to pick it up into pwrseq/for-next in the next two days.

Bart

[snip]
