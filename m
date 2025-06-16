Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1BC1DF982
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064607; cv=none; b=qPk0THxN9bT5OOTUgvLEf/LyP5uNb3Fj99JhLRyhDgfeLo+277e/0cXRz3fXfD2lXDrNAQ2xSWvnFV5IPXl3rC0rob9uWAix9fLQDDBXPbltRXNfsvgJn6iMZMNPVMER++LpwzrZOvbz0UZDWcETkpR6Rb4VbMgzZ1PVVm5G+6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064607; c=relaxed/simple;
	bh=WXKcyuXCN2cwE7iRsVEwDrGQgNYgwqFo1s+MFOFID8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8rFdb2ryKd9kKBEsyFL8znYoystR0rCevoXStraXgBrfzjVhw+d6VeGEUkIUHz2yDWklwGxJaciEy5TEIROYuWFk09h8t+sxXOEGy0pkVNxVEBTB0EMZsguTKidQfQfLkDI0sboEOWVpLflGosdVtHVePQlFhTSZUNewy2vhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LamL1+dS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LamL1+dS"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b5165cf5so2448700e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750064604; x=1750669404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx5rVpEUVwdAi8eec86Ny6xGsJCU5pwmhEcygOll494=;
        b=LamL1+dSIlV0jlkkiQEZDB3qk10SqbwL0YA+L2nwKGonzQz+I2TDvhOu3qkMGLinqr
         sbRb4HFroOCAa19kXltdXPqoPG5SzwQSiBvk0ytbGrQVBw7+awHNOZ2DDqEMB57q/1+c
         ZvpOlISqecPZ0tCJY7BzevDXOmJ8aAx/hq5N5MvzgGJ6ShU1felcaIM9uo4A65F6Quhq
         8ek4hW8mAbnx0c40t9g/Ehtd8nFqeZPir3dXAZuG9qnkc2IxA90amC/BdAregGYuSqN/
         PMM55kUbUTf4q4Dgs6g8otPMj5IUpM3e7SU7tZuQgTN6KooTQruFvk3DwW8wd3QXOy1l
         sABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064604; x=1750669404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xx5rVpEUVwdAi8eec86Ny6xGsJCU5pwmhEcygOll494=;
        b=YDLXTR5SycQloSKklojxCqmwK8rLyIL32/EoQVZnsmPU7QsQgGEWdMmZsr+U1atqwi
         LE8118WA/tTsYzq9Fe+1gCLMyLwNpmD9+ufzflSOAIoMP9ipFq6tL5C/+VZa7BLiI2qR
         ezHMvrJ44UuR4wto2I0Xdz4UFptnV56kzewqmiE86aJWhuKhmP4gvDMyfPEQscG6xgEw
         zgtBc8jQQ5ZgopxiGF0Pg9rx72be4vkCm0dhg4wPfAjpOOlYMBYMd7RnBOm5/oiO+7GI
         kBXWCN2cbR4KHONmrv/RV285r4PIeiW4qWFTYeI2hQIkn8BgYqa9t4dkEfn8xe57/dTK
         /OeA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSwQUlF7sb2fO+wm/JUGYeiDKfBO+iqgM3w7KWYETY1OuaI7qTwz9FP6puGGTOSuwhrFK+swoWuOmpqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Wq4ToRKhszBwVWdKBdDhcK0wtL9ejtr6bHlHKpJ8l6dIlHoz
	7Ofx6WpaGfVu0FJxmCankrLKZclGgcIloJFxjx2wvQmi16zFUF8PWZAwgJUUo+lLkj/Mwd//VCc
	05x47+/YiyYLVpRJDJ9UBVsk12F3vBN4zhxAFTe226Q==
X-Gm-Gg: ASbGncvvXusEnrSW6GHHFVmaGt3AxIcC4kaCAYwAuz67UexH1yeuoe1KSH3jCeQn/DB
	cPp+YrJdBEMDEFmG8L/i3xzTVgm3RtHEsNzlzhRFPtZavLnhNh+mFYP4qmLuiwv/vBh1K3shcVq
	qMxPb6H+iNjtbnyGHuVFkaKek1VSFKf60+j+ITOrWGG36OJki97qFgWh8TkcCludYebL3bbOUxv
	ms=
X-Google-Smtp-Source: AGHT+IEKz5GxiDZMedl4kRLQfhIpEe3pc+hqYuybDKDGhnHB2suO2b1GXYRiL9ZWIMd+ge7AE5Y+GZC5B+6d2sASF50=
X-Received: by 2002:a05:6512:2399:b0:545:225d:6463 with SMTP id
 2adb3069b0e04-553b6f2a050mr1884364e87.42.1750064603788; Mon, 16 Jun 2025
 02:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250614180907eucas1p13d341c30e495fb36598b1d7c10ec7070@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com> <20250614-apr_14_for_sending-v4-1-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-1-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:03:12 +0200
X-Gm-Features: AX0GCFtxlVZvyr37sX45inrPf7cyH3UqDZKKYjLQfE3pYlPIT0pT-qcpNasDxBM
Message-ID: <CAMRc=Mdf9ZYXyzYttzJtnBXPANxn2UYvvdDZqdNaYZwiKZrTjw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
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

On Sat, Jun 14, 2025 at 8:09=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver is
> an auxiliary driver instantiated by the AON power domain driver.

Just a technicality: this driver controls an auxiliary *device*
instantiated by the AON power domain driver.

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
> match, the sequencer uses devm_clk_bulk_get() and
> devm_reset_control_get_exclusive() on the consumer's device to obtain
> handles to the GPU's "core" and "sys" clocks, and the GPU core reset.
> These, along with clkgen_reset obtained from parent aon node, allow it
> to perform the complete sequence.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

> +
> +static int pwrseq_thead_gpu_power_on(struct pwrseq_device *pwrseq)

Please follow the naming convention of the callbacks: this should be
pwrseq_thead_gpu_enable().

[snip]

> +
> +static int pwrseq_thead_gpu_power_off(struct pwrseq_device *pwrseq)

Same here.

[snip]

> +static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
> +                                 struct device *dev)
> +{
> +       struct pwrseq_thead_gpu_ctx *ctx =3D pwrseq_device_get_drvdata(pw=
rseq);
> +       static const char *const clk_names[] =3D { "core", "sys" };
> +       struct of_phandle_args pwr_spec;
> +       int i, ret;
> +
> +       /* We only match the specific T-HEAD TH1520 GPU compatible */
> +       if (!of_device_is_compatible(dev->of_node, "thead,th1520-gpu"))
> +               return 0;
> +
> +       ret =3D of_parse_phandle_with_args(dev->of_node, "power-domains",
> +                                        "#power-domain-cells", 0, &pwr_s=
pec);
> +       if (ret)
> +               return 0;
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
> +       /* Prevent multiple consumers from attaching */
> +       if (ctx->gpu_reset || ctx->clks)
> +               return -EBUSY;

Isn't it the whole point of pwrseq - to allow multiple consumers to
seamlessly attach to the provider and control the underlying resources
in a safe way? I think you should just not request the relevant
resources for the second time (really only applies to the exclusive
reset and even then it's not clear why it needs to be exclusive) but
still return 1 for a valid consumer and let pwrseq handle the
refcount? Also: can this even happen at all?

> +
> +       ctx->num_clks =3D ARRAY_SIZE(clk_names);
> +       ctx->clks =3D devm_kcalloc(dev, ctx->num_clks, sizeof(*ctx->clks)=
,
> +                                GFP_KERNEL);
> +       if (!ctx->clks)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ctx->num_clks; i++)
> +               ctx->clks[i].id =3D clk_names[i];
> +
> +       ret =3D devm_clk_bulk_get(dev, ctx->num_clks, ctx->clks);

This is interesting. I admit I had not considered the pwrseq provider
being able to acquire the resources from the consumer node at the time
of writing the subsystem. As the pwrseq framework aims at being as
flexible as possible, this is definitely something that we should
allow but the usage of devres here is problematic on at least two
levels. First: you're acquiring the resources from the struct device
of the consumer and so the devres entries are added to its devres
list. They will get released when the consumer device is detached and
the pwrseq provider may end up accessing them afterwards. Second: if
.match() fails or even returns 0, the resource is still acquired. Call
.match() enough times and you have the devres list needlessly
clobbered with unused resources.

You should stick to non-devres variants and make sure they are all
cleaned-up unless returning 1. (Note to self: these shouldn't be magic
values really). You can then release them in this driver's remove
callback.

> +       if (ret)
> +               return ret;
> +
> +       ctx->gpu_reset =3D devm_reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(ctx->gpu_reset))
> +               return PTR_ERR(ctx->gpu_reset);
> +
> +       return 1;
> +}
> +
> +static int pwrseq_thead_gpu_probe(struct auxiliary_device *adev,
> +                                 const struct auxiliary_device_id *id)
> +{
> +       struct device *dev =3D &adev->dev;
> +       struct device *parent_dev =3D dev->parent;
> +       struct pwrseq_thead_gpu_ctx *ctx;
> +       struct pwrseq_config config =3D {};
> +
> +       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->aon_node =3D parent_dev->of_node;
> +
> +       ctx->clkgen_reset =3D
> +               devm_reset_control_get_exclusive(parent_dev, "gpu-clkgen"=
);
> +       if (IS_ERR(ctx->clkgen_reset))
> +               return dev_err_probe(
> +                       dev, PTR_ERR(ctx->clkgen_reset),
> +                       "Failed to get GPU clkgen reset from parent\n");
> +
> +       config.parent =3D dev;
> +       config.owner =3D THIS_MODULE;
> +       config.drvdata =3D ctx;
> +       config.match =3D pwrseq_thead_gpu_match;
> +       config.targets =3D pwrseq_thead_gpu_targets;
> +
> +       ctx->pwrseq =3D devm_pwrseq_device_register(dev, &config);
> +       if (IS_ERR(ctx->pwrseq))
> +               return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
> +                                    "Failed to register power sequencer\=
n");
> +
> +       return 0;
> +}
> +
> +static const struct auxiliary_device_id pwrseq_thead_gpu_id_table[] =3D =
{
> +       { .name =3D "th1520_pm_domains.pwrseq-gpu" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, pwrseq_thead_gpu_id_table);
> +
> +static struct auxiliary_driver pwrseq_thead_gpu_driver =3D {
> +       .driver =3D {
> +               .name =3D "pwrseq-thead-gpu",
> +       },
> +       .probe =3D pwrseq_thead_gpu_probe,
> +       .id_table =3D pwrseq_thead_gpu_id_table,
> +};
> +module_auxiliary_driver(pwrseq_thead_gpu_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 GPU power sequencer driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

Thanks!
Bartosz
