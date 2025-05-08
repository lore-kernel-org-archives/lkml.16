Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237820E70F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702839; cv=none; b=WKB6yJWSf3QVLktBDsiXogqNBXxvIJ6JstWj5MxW/yaKFp5oPI8LQtpBR7iupZuy84+II+N5EzBZEvNzS9eTKPxo8jMDQrgg5atIn+eGBejqGG74J3PXfY6zHFJuoh7A2Vl4LKv/RwEAvJPXD0gqlVhFy3tVIgaTu/W5Aaz3HG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702839; c=relaxed/simple;
	bh=e4+TFnXdM69fcFGL/b3jY3DphIA64GgZdbMFENXZJHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYsWPWTCDEHDGxlwapmqTBJCPcCgO6idEn+tOCAyE1Uw+2jLIheEHFQ23EpN5xACIwegCyfwO5wVa1HljiI1JzEquI9BhritQ3BkP2vEo6ozcrZm9msHlMo3qGx6M74F8y7FNb4ci4WfCq73wQAJUX6T1pJq79YhtOBCPsCjkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZYMTcov; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZYMTcov"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e78e38934baso947472276.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746702835; x=1747307635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0l5OYYb4wZW+mHv+F5ZoKS8UyIRgGRSrQBEHKOgR8=;
        b=tZYMTcovbyzll392TvpgLGSdrUqlUC5vYRm76NGpJsmQhZx4emt6TGKOIQfVvMcmrr
         zu9v5g3EVbtrch8pCALsUJv2SFi4bnyMKtveQTE9oG5TExs/pLbt4rOSNooFSKlYaVMb
         NgEv/E0O9BO2iaHmdfgQNzIRcgA1V8r+KXjT6UU0Ufsw/P8/fx40gYm7PaSh8lYfYo88
         7XMN6rQ7WK24o5CZkgacvIn+UFYy9GS2LGWhWvy+vA1RPTE89OF4DBZROEZZAMGyKdKN
         AB2Y0X2QPZK3r+6iEiqH6rkweRepeiTeJMKPyLiLy3PZ6TNfXQZ0dsJdOeel1kAAtZ3g
         ajSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746702835; x=1747307635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz0l5OYYb4wZW+mHv+F5ZoKS8UyIRgGRSrQBEHKOgR8=;
        b=K4rbR4NvNppqcEVI0hPTo7LdXclF57aAXtt6qtf0yVLwfRTpOTe6S7zMRSo0sJPLsv
         oGqT4x8Q7SCCCig1yARtG9+JlTFXQX7pwirXGX0yI3uYJwXCMx6aMycb3xxRQ9JDgPGe
         zRlt50d0/XaNnV2V+jtkBmMqqwpwx7H/nHqzZ8j3dQKrJWpooa13ZqBU1Eq8hF9wCHb2
         cdlzCP/W+SReQemiMvxOFQqR/o546L0Xw5WBwcmf5mNVKuJTyBxwWwkj6HGoIiB1TY+7
         COcUO6KargOqzvwjBOlkAT6shQ13vFZpURLsa8V9BnGH+VtgLM4UJSbekTPHTxXqjVZx
         MIug==
X-Forwarded-Encrypted: i=1; AJvYcCUg9NVR7E/Jp28u82sGz6hTPKa79fs5cTIhuHY5W5YQptPJ5Abbcs017k+UQkWeW51e11WZMo6FfXGe9i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgJNdPVtQG7mrQ5k2GIFrlYr3ssLfZl98vv7EHWMhqk90rR9/
	ViBzT2jnYMit8FwZMt2T99mcXq2LBxgCnwnnbHiTI80vc/GVDOJ1401Vmj8TQY0vy/TUTosZz25
	3yajlkcgfYEphPoAAyw0uW1OAeFU3V1H9lCjGnw==
X-Gm-Gg: ASbGnctkEwpVZPGIX1DYCr6ILBZaZ7TNyCxyobSMFScitQb7z1/ZMvv0mfN3rotDydS
	j/ueBdhwWzLBVsB4FxSvplDWag7GIt6cfyagCEMTyKgtsxu/kZSoYGQwgWgqPvTXE5tRL5EdiEg
	T4nOGMEySWqpGIfPxlu53z8yg=
X-Google-Smtp-Source: AGHT+IFqQdI6e1trWbJBwK/oeHTdsQLNh5rp3zpOH+TfiAJBCwyBTZ7DbhV2v2lokDznxkf4DSHMOmiGIM30cUQx248=
X-Received: by 2002:a05:6902:1b89:b0:e78:ed12:6d92 with SMTP id
 3f1490d57ef6-e78ef73b5d7mr3479249276.40.1746702834996; Thu, 08 May 2025
 04:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288@eucas1p2.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
 <CAPDyKFqX5cjQe3-MX3W9wMoQW3gzwSvb0QMf-_sTJuq_TeGsCg@mail.gmail.com> <5413f5c7-8049-4490-bdd6-8c03f6e2057f@samsung.com>
In-Reply-To: <5413f5c7-8049-4490-bdd6-8c03f6e2057f@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:13:19 +0200
X-Gm-Features: ATxdqUFZBkfWWqLt3Ds_1EAZOWb0PLKmTy9yLzgOWSvL-CIrLIE3LaF4c8kkZg0
Message-ID: <CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pmdomain: thead: Add GPU-specific clock and reset
 handling for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 14:17, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 4/25/25 10:50, Ulf Hansson wrote:
> > + Bartosz
> >
> > On Mon, 14 Apr 2025 at 20:53, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Extend the TH1520 power domain driver to manage GPU related clocks and
> >> resets via generic PM domain start/stop callbacks.
> >>
> >> The TH1520 GPU requires a special sequence to correctly initialize:
> >> - Enable the GPU clocks
> >> - Deassert the GPU clkgen reset
> >> - Delay for a few cycles to satisfy hardware requirements
> >> - Deassert the GPU core reset
> >>
> >> This sequence is SoC-specific and must be abstracted away from the
> >> Imagination GPU driver, which expects only a standard single reset
> >> interface. Following discussions with kernel maintainers [1], this
> >> logic is placed inside a PM domain, rather than polluting the clock or
> >> reset frameworks, or the GPU driver itself.
> >
> > Speaking about special sequences for power-on/off devices like this
> > one, that's a known common problem. We actually have a generic
> > subsystem for this now, drivers/power/sequencing/*.
> >
> > Perhaps it's worth having a look at that, it should allow us to
> > abstract things, so the GPU driver can stay more portable.
> >
> > Kind regards
> > Uffe
>
>
> Hi Ulf, Bartosz,
>
> Thank you very much for your suggestion, Ulf. I took a look at the
> drivers/power/sequencing/ API and agree that it seems like a suitable
> framework to model the specific power-on/off sequence required for the
> TH1520 GPU, allowing for better abstraction than embedding the logic
> directly in genpd callbacks.
>
> My plan is to refactor the series based on this approach. Here's how I
> envision the implementation:
>
> 1) Provider (th1520-pm-domains.c): This driver will register as both a
> generic power domain provider and a power sequencer provider for the GPU
> domain.
>
> 2) pwrseq target Definition: A pwrseq target will be defined within the
> provider to encapsulate the required sequence (enable clocks, deassert
> clkgen reset, delay, deassert GPU core reset). The target will be
> named using the GPU's first compatible string with a "-power" suffix.
>
> Example GPU DT node, adhering to convention introduced here [1].
> gpu: gpu@ffef400000 {
>         compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
>                      "img,img-bxm", "img-rogue";
> };

I don't think the power-domain provider node is the correct place for
this, from DT point of view.

Instead, I would try to follow the same approach as
Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml,
which uses a separate device-node to describe the pwrseq provider.

>
> [1] - https://lore.kernel.org/all/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com/#t
>
> 3) Consumer (drm/imagination): In its probe function, the driver will
> read the first compatible string of the device node. It will then
> attempt devm_pwrseq_get(dev, compatible_string_with_suffix) (e.g.
> devm_pwrseq_get(dev, "thead,th1520-gpu-power")). The result

Make sense, but we should probably use a more generic target-name,
such as "gpu-power" or something along those lines.

> pvr_dev->pwrseq_desc will be stored (it will be NULL if no suitable
> provider/target is found, or a valid descriptor if successful). The
> driver will still acquire its necessary clock/reset handles via
> devm_*_get in probe for potential use outside of RPM (like devfreq).
>
> 4) Consumer Runtime PM Callbacks
> (pvr_power_device_resume/suspend): These functions will check if
> pvr_dev->pwrseq_desc is valid. If valid: Call pwrseq_power_on() in
> resume and pwrseq_power_off() in suspend. The driver will not perform
> its own clock/reset enabling/disabling for resources managed by the
> sequence. If NULL: Execute the existing fallback logic (manually
> enabling/disabling clocks/resets using the handles acquired in probe).
> Unconditional logic (like FW booting/shutdown) will remain within the
> RPM callbacks, executed after successful power on or before power off,
> respectively.
>
> 5) Resource Handling (via genpd callbacks): To allow the provider
> (th1520-pm-domains.c) to access resources defined in the consumer's DT
> node (specifically the clocks and gpu_reset needed in the sequence), I
> plan to keep the attach_dev / detach_dev genpd callbacks as implemented
> in the previous patch version. attach_dev will acquire the consumer's
> resources (using the consumer_dev pointer) and store the handles in the
> provider's context. The pwrseq unit callbacks will then access these
> stored handles via the shared context. detach_dev will release these
> resources. This seems necessary as the pwrseq API itself doesn't
> currently provide a direct hook for the provider to get the consumer's
> device pointer or manage its resources across the pwrseq_get/put
> lifecycle.

If we have a separate node describing the pwrseq, as
Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml,
it's should be rather easy to hook up and pwrseq driver for it too, as
drivers/power/sequencing/pwrseq-qcom-wcn.c does it.

>
> This approach uses the pwrseq framework for the sequence logic as
> suggested, keeps the generic consumer driver free of SoC-specific
> sequence details (by using the compatible string lookup for this), and
> retains the genpd attach/detach mechanism to handle cross-node resource
> dependencies.
>
> Please let me know if this plan sounds reasonable.
>
> Thanks !

[...]

That said, Bartosz is better with guidance around pwrseq
providers/consumers. The above is just my view of it - and I might
have missed something.

Kind regards
Uffe
