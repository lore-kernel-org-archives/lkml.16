Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1C25BEF3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458021; cv=none; b=MWFtOFKEwtKPePRhxEN150chUr6uufDv3f0aGUCFdvqeEUa5EfJkeow7/8mEH1ZdLgWOIKJ/pSs7DkHjH2VsOITWCC39G8pNgGswhQF3R1RZfe/GFU8Dn7WqoM6yzDfQmGwswg4oLnPdeuFQ6JLuVXdcWJs5gzsQro2AughfIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458021; c=relaxed/simple;
	bh=mdHutE0as3n8u7f3A7Ru6GJrK4RiB1Pta9XS95fCFnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VipqjKjbl1Euri0r1AfU6yu3KLiNFXRWSiWGeCcv7KC37fsRP9tfbpZTJcJokC7/mZtR5braWHg/t6QMiP6DBz+wOMYQeeh2Hn0Ouk4sPi8vGxYHx0lBX+amHOxmGKGa8elbFC6uWaPoHGEIFlKVy53S9ZR+SkafA9/xzlDac9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhimG29U; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhimG29U"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e5e6ab7b8so62696537b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458018; x=1752062818; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H//zs/SGlHTwFgjneb586KPEfZCC73lRKW26G4B/bNw=;
        b=MhimG29UOWbN0SPcvqLu/Qlo34CZNlfrm1YzZWHB7Wt6CBoFLTmc22gJYJ43GZ8nJW
         gcLEVN4inwmPinW7/x5Ry8Wy+s8nKIgYfNK5l9VwmWHaOOaZ3/z1VfVSYoMfGQKASRzh
         EokeylsT+k1XoW/EqBcAWYFBECkaY7wvCd4aCJqoL/llcWL7Dp2uKsa/HMrMz+ngUF5/
         OQoYhpUeGViiFm8gQAgqy9ujhpJSxlm64InQVCi8y1om4EqnEvfjk0PK4xx3/45cynB7
         T33qXPHE/7gkre0Y28oV2SaHEg0Ap98Yog8zoYVBqmRsyKomGxTomQh0R5SAoCgQUENJ
         kBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458018; x=1752062818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H//zs/SGlHTwFgjneb586KPEfZCC73lRKW26G4B/bNw=;
        b=rA7XzIfa+3s8QUVdMkRvVZgoYBQVG/LvafbToGt0GSGyvP125usNGOYRROA1DT4uBU
         rvEEFXPqE4Qc4JbSV8sYQFpnol3BZUu4rLCm9JLZT6R0Wyi5xn0PxZb68cYTtd5QIeNO
         qR3eJGi8HUXqdQDOAzYjLrkRpgnHzpFd/J+Z7izYizTFZ/6iyn9m5E90Vimt3I2e5Ex7
         l0rbZ4OZCQwu4TRuVSdgSxq0XziRossOFVoOGMs53e7+sN3/qEVtFwQiUC7272CA6r4k
         NIUQuZCGSkwJe7aRcX9cfD2m7z/QSTVwIvkUXY1Tnf0JL/M632DbeQIo9YOqO6NYN5xG
         fA0w==
X-Forwarded-Encrypted: i=1; AJvYcCULY0Ad52vN4s+3ZBQJoUPqzF8PSMhHZt6lQ88oFUzKwAlnKDl5yGdRGsUMDBE2yzCpgQX8xRlXVha468I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4R03hWI09vqqA0u9Rra++ZIHoKJCKFlis+BD7Gy8cbjFSeER
	51sjE3atFclAEQ+Z24Iv5bFukMQN83dGWfVjlNMOj5NoJRE22c7JrWbA7q/hosyFU3585+R9sml
	rt/6F4/vvAfTeJ6Z3t8Emeu5+ibFJOVo/HROKzmYfTw==
X-Gm-Gg: ASbGnctze1rgelTXlnvSLPWGzvKcM0ntV0zYv/uvy//8epsScKz3hjGi9O2JPy7brXN
	1ZXSQzAXJ3tHkc43k5XVrCIQueVgD3BuehgQ0zxSVlUg5tmkhwMAMSofvJoeQu7g4enHoALlChH
	fnlqpiT8Il1mPSF6QnVQtzyGKBD0Yx8SwYW+EJbVlv8LvP
X-Google-Smtp-Source: AGHT+IHvy4ot4cVEUqJ9OPaKV3B11/w9tqUUihTLRsxteLbI5hVPVLYtxESKS56YJ2QmEc+ggte5xRAak7cDxYT6glw=
X-Received: by 2002:a05:690c:6305:b0:70e:7638:a3a9 with SMTP id
 00721157ae682-7164d54935amr34553827b3.18.1751458018380; Wed, 02 Jul 2025
 05:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204821.1150459-1-k-willis@ti.com> <20250627204821.1150459-3-k-willis@ti.com>
In-Reply-To: <20250627204821.1150459-3-k-willis@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jul 2025 14:06:22 +0200
X-Gm-Features: Ac12FXwakGRpH39p6UXOySAygWsMTsisIa17xEeHOgmtuD9NMJOQScXlVEjSnu0
Message-ID: <CAPDyKForKeb=uTkOXWcJea-P9c+7wQ3ZRWFYpTXk=xLoQPsQaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: ti_sci: Add LPM abort sequence to suspend path
To: Kendall Willis <k-willis@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, d-gole@ti.com, vishalm@ti.com, sebin.francis@ti.com, 
	msp@baylibre.com, khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:49, Kendall Willis <k-willis@ti.com> wrote:
>
> Create ->suspend_late() and ->suspend_noirq() hooks to add abort sequence
> to any driver within the PM domain with either of those hooks. If a driver
> fails to suspend with those hooks, add a call to the DM to abort entering
> the LPM. The suspend hooks of the PM domains driver inserts itself into
> the suspend path of all devices connected to the TI SCI PM domain. So if
> any device in the PM domain with either a ->suspend_late() or
> ->suspend_noirq hook fails to suspend, the PM domain drivers suspend hook
> will send the abort call to the DM.
>
> Adding an abort call in the ->suspend() hook is not necessary. TI SCI
> suspend sends the message to the DM to prepare to enter a low power mode.
> TI SCI suspend ALWAYS occurs after the ->suspend() hook for all TI SCI
> devices has been called.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 46 ++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 82df7e44250bb..975defc16271d 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -2,7 +2,7 @@
>  /*
>   * TI SCI Generic Power Domain Driver
>   *
> - * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2015-2025 Texas Instruments Incorporated - http://www.ti.com/
>   *     J Keerthy <j-keerthy@ti.com>
>   *     Dave Gerlach <d-gerlach@ti.com>
>   */
> @@ -149,8 +149,47 @@ static int ti_sci_pd_suspend(struct device *dev)
>
>         return 0;
>  }
> +
> +static int ti_sci_pd_suspend_late(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +       int ret;
> +
> +       ret = pm_generic_suspend_late(dev);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ti_sci_pd_suspend_noirq(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +       int ret;
> +
> +       ret = pm_generic_suspend_noirq(dev);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  #else
>  #define ti_sci_pd_suspend              NULL
> +#define ti_sci_pd_suspend_late         NULL
> +#define ti_sci_pd_suspend_noirq                NULL
>  #endif
>
>  /*
> @@ -264,6 +303,11 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>                                     pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
>                                         pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
>
> +                               if (pd_provider->ti_sci->ops.pm_ops.lpm_abort) {
> +                                       pd->pd.domain.ops.suspend_late = ti_sci_pd_suspend_late;
> +                                       pd->pd.domain.ops.suspend_noirq = ti_sci_pd_suspend_noirq;

This doesn't work as pm_genpd_init() is assigning the
->suspend_noirq() callback, hence overriding the callback.

Moreover I am not sure this is the correct thing to do, as having your
own ->suspend_noirq() callback would mean that you will be by-passing
genpd's internal reference counting to understand when it's fine to
power-off the PM domain, vi a the ->power_off() callback.

Can the LPM abort be handled from a ->complete() callback instead?

> +                               }
> +
>                                 pm_genpd_init(&pd->pd, NULL, true);
>
>                                 list_add(&pd->node, &pd_provider->pd_list);
> --
> 2.34.1
>

Kind regards
Uffe
