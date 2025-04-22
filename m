Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912A2836B9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328840; cv=none; b=isPO007NXegaL1Dl/Xjl9gn/zyx/0D99C3//lvLb67ttTm95w9hJVtLwcz491KcQ/CHyQf8gTyvi6Qf05kznjLOh2A5+6jRdK3sukECUQwjpEh6ezvA0FRPADAiMrEnz9Wdj4VvTy+xJ+TE9k37baYFWkZSUJ4xF0pJASoWh/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328840; c=relaxed/simple;
	bh=A3nvuiXOKYmcBoSdVozYUsuS9YtnZk6NJfCqb1EOxq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxkOfWDYfzudlFfgdC9W+t2uyYtv1T8sG4BM7MFTGI+Y6JCMfYaIM5cZo/ws1hLUzIYc4qcUtVVbPtk8M494WnJHsFvwM6WblTZkSMu0rQzCReucF1bXFH6MmmvxxaQwiDK4TSlIFvteFXm/JI67Z8A7LzWkLpY9K4gylNeA33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpeggOs4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpeggOs4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso7023002a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328836; x=1745933636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=;
        b=gpeggOs4fEbnDrKg7IkN2wU9yFFUamhVSEyn9gahOTUxoUd4HJcVrjgv6fP0brwNZd
         usXtqS9l7zRWGvjt/cuLFSYJC0ezoVHmik2Ew8u/bhqaM4E1L3OWgm+zuq9kGTtvTcap
         5aV+dNkYGL07Gm65WiX9apISdHuPQLHjbRMkavekK3tEwOL9177i4ZoQuZplFAzDuWff
         RvrvH6zs8rzQAy5e1VU6ZXXMafUUxfn+UxeAg64/YU8TtW1iGl5E2majsNCWqABIJk3B
         Vd/uw4c4Pk07E19s/28HNlbqwIZjolnn3Nj0j6dWAUTzUo3b1tmTiN9UmA72YMFONIvj
         7Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328836; x=1745933636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=;
        b=qh0WiShnCI0M98B6beW6qhrFm3UQNRgeCb+xzDVkp8t0shsaXyc6eZIGy8mhfahR5a
         1gYBgrYSo2d18uWaVV9XyUUExIAXIPhFPf41wCJkabf4dLgCgJMbx5MODWWtmxCguiIM
         KLLr9lM3rlJc2wGA79jF59BlfzbDvH93h1VGt91dRj0DbbJpqkzkalJTDr3hI/hLPrE/
         FuiQSTIAml6Te5oEXjDFHIKMw8bwPf1qE1ikZPiWkLWmcxYqt5vtBy5ywS1FErMlQAlZ
         rVabNRUPSAKxl++sNPIqdAp2UeUsd4MBg67ghgFy6M3lzojy6FBQKs90VoYdwOtpxFxJ
         DgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoqojl/HiuQQXr2oflcCvexkS23WSKphjTdoJPQzv/zsMlBkjZZOs5IxOUp1ISTbWj2CAKFyLLo4r0GpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUv+1N+0f8TkpbgkfJH0rAJ9bjC/tdaltLiBhE/aeJuV2gpTa
	vMM2EgmIx8oBZRr0O3afTwl9/DTpveqduqTFKPoHmk16BCtHHJFCteZp5492YKw=
X-Gm-Gg: ASbGnctjGCv/kj1HwAj8DgWDthQ8HIppvoB7uggzwbvC7H+hDPjdZB/Re76OsDrmOJU
	KB2xjROfCckQv2w9qMccg+SDddLoi/VWOIQmYP9GM3+6w9/7HbK7nwzcpCs26GZKXE06c6k1IKS
	zLlHyB2LUziBtAmLaXNTrmRjzgoP33J8f0zFHPyviPqyseTv/Fs3fIw4KQE7x39TJC9BaMW38nP
	yy9ZGfwaZ5riBT5b6Q5pmB5A965vrJsFud1K2ZOhzuzgqhKF7analF2/lenv0PdPWQw8Bpc2r+v
	4d4w5Gt4ss/hbqGoec7+aY7j6IbkN9oGoUl9yw==
X-Google-Smtp-Source: AGHT+IE1EtI1OOrrlbCcIfrU7oXR5x9XYZy6CrWuNjgB3jJjWKKJ4o/3rgwpzceFXX9Gk9S9IWierA==
X-Received: by 2002:a05:6402:4404:b0:5f3:f04b:b5d7 with SMTP id 4fb4d7f45d1cf-5f628578024mr14149274a12.18.1745328836222;
        Tue, 22 Apr 2025 06:33:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625a3f7dfsm5892419a12.79.2025.04.22.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:33:55 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:33:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] pmdomain: core: Use genpd->opp_table to simplify
 error/remove path
Message-ID: <aAeawWlODYM2w+xm@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-4-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-4-ulf.hansson@linaro.org>

On 25-04-17 16:25:01, Ulf Hansson wrote:
> While we add an OF-provider we may, based upon a specific condition, also
> assign genpd->opp_table. Rather using the same specific condition in the
> error/remove path, let's check genpd->opp_table instead as it makes the
> code easier.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 34a85bf347ad..035b65563947 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2343,6 +2343,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>  	genpd->provider = NULL;
>  	genpd->device_id = -ENXIO;
>  	genpd->has_provider = false;
> +	genpd->opp_table = NULL;
>  	genpd->accounting_time = ktime_get_mono_fast_ns();
>  	genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
>  	genpd->domain.ops.runtime_resume = genpd_runtime_resume;
> @@ -2617,7 +2618,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
>  
>  	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
>  	if (ret) {
> -		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
> +		if (genpd->opp_table) {
>  			dev_pm_opp_put_opp_table(genpd->opp_table);
>  			dev_pm_opp_of_remove_table(&genpd->dev);
>  		}
> @@ -2697,7 +2698,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
>  		genpd->provider = NULL;
>  		genpd->has_provider = false;
>  
> -		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
> +		if (genpd->opp_table) {
>  			dev_pm_opp_put_opp_table(genpd->opp_table);
>  			dev_pm_opp_of_remove_table(&genpd->dev);
>  		}
> @@ -2729,11 +2730,10 @@ void of_genpd_del_provider(struct device_node *np)
>  				if (gpd->provider == &np->fwnode) {
>  					gpd->has_provider = false;
>  
> -					if (genpd_is_opp_table_fw(gpd) || !gpd->set_performance_state)
> -						continue;
> -
> -					dev_pm_opp_put_opp_table(gpd->opp_table);
> -					dev_pm_opp_of_remove_table(&gpd->dev);
> +					if (gpd->opp_table) {
> +						dev_pm_opp_put_opp_table(gpd->opp_table);
> +						dev_pm_opp_of_remove_table(&gpd->dev);
> +					}
>  				}
>  			}
>  
> -- 
> 2.43.0
> 
