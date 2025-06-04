Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707DB1E52D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046140; cv=none; b=ka9+iLeEj+32cS6+NiMr8bdtUotxlrgPxRY8tdvJsx2IoF6MGm3Dx97m3R6k9/aKOqMOJJh2RPX4nO+uNSdjONSQ4rTAeYzc26GnXEChhu33OSDhBnObPdue+rFSD2g72aVZ5iAaQfJ76lLgq+vGKu4ATM9v2gg+fc97IlG3Dcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046140; c=relaxed/simple;
	bh=gOOWlCX1FpgYOZem8m3o9sFlBzYMOYduHrSfBZ/m3k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9dJqY+NRx+6I6fIDqUXuEkCX6OahoMJ5k3xshGIHpn6E+JZrdD6o/RRm1X4Kdr6Doux9Xecit/kGCn+th0u8Ziobrx1Ojy1lplhSBRbQwcc4ixqIP5kmfKsdzk455fA6MiJ3ySS3k6578212QTV1km+GLCK6kmMtWMk/H+ig18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gERBw3I/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gERBw3I/"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e817ac96e87so711779276.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749046137; x=1749650937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
        b=gERBw3I/uRvzah26Ks6yrsFmAGUwdgbR/vhjn3pYabYRtf7KNBuZvRCzPbDOn80R52
         6YykBUvUXRZ4K3w7h3bdcumHrrpXhzL43TB29ppeD5dJkyu1EoQrpztuA4JhEI+5E/Es
         cmlWOqTEY0YZcq9Nuw39yFADRNNXjBgnqZTM0TSE0Flj80SnPHqdgFP+++Jsp/M8IVTa
         2MFO1CtradtwwzcYYpRGNTi5aASzT5f+xdLsEyG8XUHhW9nLqxESSVNoVVNhGfpvJnoD
         VuvfwbJQr2QO6crf2T+SSYc+7GpNbNiRfOBiCowswfTPLimDv8/EIcCKMZlDmeuI+Rq4
         d8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046137; x=1749650937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
        b=LJJ/fE5lpq62Fy+z4F/se6ptR9e8uUOaivkQEGEVOJQ60OGBKGPqhaDC69AgE/3BIo
         Lred9awW6HH3J+fOx8909oJ+sWb5dHTyByGcHwTpYlMm3jx5WhGP1lxQ0Fnb0tq/CTP6
         4UtoVp0NG1hSBEmCuuWGzL34AKKRDo33U4OGt0m997w/Ib6YJBDF5Rgiht8YZCYP7sG4
         4Dy2m1Pe9q9RZTdX1XKRQ76jFyx9R6Xi14irelykMadJYt0bL3HaM6Gn+PrSNi5co9Fn
         SYNSD8kpu8TncgP98EulKY0a5CJ+MwqL/pBQMqKIla6m4bpP2c13/q8Lu3hnsNeBTUrC
         HdXg==
X-Forwarded-Encrypted: i=1; AJvYcCXPRS+afg6l+zCVTdBHc48IuMnnOKWVTtTIPgiYu7ZtO1p/RiJtwa7w6KEBvB6eJvlJXV3UvtvTvV0ImpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBU2XbIHfu753AugFHNgOiI210mzopA0Uaxu61y3dAVzj2z6qq
	VO171EaqESulP3gMGqT8Ntu3wD9dxQjwAIKKeVcWED++GR19OkkGtw8JY2OZ0AL0pI2AuiKTber
	HoVpIHmYBgILVxVAHQCIyjSrjsV5EhFfuerdpK/N07w==
X-Gm-Gg: ASbGncuZyXlkJywEbGAlJbufFbFETtCtu7TU3EwKwtIYmcRX77o26vC3B+NrkXffCGC
	EgU0T+THqXBdQNSez9D5cFpiZdwOvvN/Ir70soUyT0dwl1m2/5CK6oZPqFcFI22/CubLNbus4Jf
	cNplmjfg7wy8kzyu0Pln/NZ7yWy7KHxDwJNw==
X-Google-Smtp-Source: AGHT+IH1uN9PQBI4TxvQgOMEHLZAQqYAI1FFT1QA2Z54eVoaJJVTZCIulnmyyn43PiYP3CgChRHTn+sbXKdyr+ZK87c=
X-Received: by 2002:a05:6902:2291:b0:e81:8639:c5aa with SMTP id
 3f1490d57ef6-e818639ce67mr1014126276.32.1749046137370; Wed, 04 Jun 2025
 07:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com> <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 16:08:21 +0200
X-Gm-Features: AX0GCFvzY5vbkEIzVaD80QV5URTGeK5dhN_mN9Qk3_Vhcas3hbWoHL7IT58BST4
Message-ID: <CAPDyKFpKkSb=kGn4y18uFy9uhxFkjt7Gi2bUAzzqGnyUtTAoMg@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] drm/imagination: Add power domain control
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, 
	Darren Etheridge <detheridge@ti.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 12:12, Matt Coster <matt.coster@imgtec.com> wrote:
>
> The first supported GPU only used a single power domain so this was
> automatically handled by the device runtime.
>
> In order to support multiple power domains, they must be enumerated from
> devicetree and linked to both the GPU device and each other to ensure
> correct power sequencing at start time.
>
> For all Imagination Rogue GPUs, power domains are named "a", "b", etc. and
> the sequence A->B->... is always valid for startup with the reverse true
> for shutdown. Note this is not always the *only* valid sequence, but it's
> simple and does not require special-casing for different GPU power
> topologies.
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Frank Binns <frank.binns@imgtec.com>

Realize that I am a bit late to this, but I was recently pointed to
this commit [1] by Michal.

[...]

> +
> +int pvr_power_domains_init(struct pvr_device *pvr_dev)
> +{
> +       struct device *dev = from_pvr_device(pvr_dev)->dev;
> +
> +       struct device_link **domain_links __free(kfree) = NULL;
> +       struct device **domain_devs __free(kfree) = NULL;
> +       int domain_count;
> +       int link_count;
> +
> +       char dev_name[2] = "a";

It's certainly good to use a name to be future proof, but we should at
least try to pick a somewhat descriptive name for what this PM domain
is used for.

Moreover, this requires a corresponding update to the DT docs.

> +       int err;
> +       int i;
> +
> +       domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +                                                 "#power-domain-cells");
> +       if (domain_count < 0)
> +               return domain_count;
> +
> +       if (domain_count <= 1)
> +               return 0;
> +
> +       link_count = domain_count + (domain_count - 1);
> +
> +       domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
> +       if (!domain_devs)
> +               return -ENOMEM;
> +
> +       domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
> +       if (!domain_links)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device *domain_dev;
> +
> +               dev_name[0] = 'a' + i;
> +               domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
> +               if (IS_ERR_OR_NULL(domain_dev)) {
> +                       err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
> +                       goto err_detach;
> +               }
> +
> +               domain_devs[i] = domain_dev;
> +       }
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }
> +
> +       for (i = domain_count; i < link_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(domain_devs[i - domain_count + 1],
> +                                      domain_devs[i - domain_count],
> +                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }

Most of the code above (and the error/remove-path) can be considered
as boiler-plate code and can be replaced by using
devm_pm_domain_attach_list() instead.

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com/
