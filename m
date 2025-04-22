Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631092836A4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328464; cv=none; b=EbavHy//0WbQulh5KJ4TDoprB801Vz4N3PaWvHNvzZbzy7y6wDJkFci1Z5sbDD+KzZZkGlvjAF+VRHh7wFQbcxUv0BFrd+KBJyZE4ZYLZNrLw8Z4X46OIEL3N4Ao4bX16eVeAyDMvAxN0P4JnSARA5kUBXkvWrGApdyLvFk4A5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328464; c=relaxed/simple;
	bh=ZKWee/DB1apt/bMfFT+x3nlRqQI8FcxvUaoQ2VvmCPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSAqb/M9okXteLak4+TOy1F0jfKS/6ER9qwQ0ZaN1vpWpzLVN6AVn/4k5S2lXCMprzVKFI4JkHUu/8MUU+RAUZat7Cq5qU8A9lxtuDc3GPovjtMXpUFnxN0Avd1AmEHinwscTnL9+mNuIWqTXxtqO4BJJjK2gRw+GGUoJOTvGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/XrGQto; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/XrGQto"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso538036466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328461; x=1745933261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzfHkHHg9aFgClvuNUEbYziAa2wcOAWz+w7IrA4na60=;
        b=k/XrGQtoZBw1MLXzn8n/3WgCGXmxhLqI4UnzZCVVdfEQDIhHgOQVhge5kLA5FxzV0z
         Grpu2S4asR/ikHeUXImqSWKh6D+fPyAH7CeAlzLE8MKnxZpH2Lv0UK5VmQ/CgzAbus41
         8rorPlawNRjVE+MrpVC6yJQubGxs4d29L/zGaTtCvsuRuMiBm4oC4DfCXJ2zDfta0my5
         b51InZynJwL7ddzZeIkhWFaApma1Q/1FLPhYjsIqwasJOYQqF+U5Ja8VErUWb5LThNiv
         gA8JLgr5Mm7IxXYemEI81TrETPPllJ0DS4jGhMnWr8DehWHpjSb26SKcQAjs74DHnlNc
         YC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328461; x=1745933261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzfHkHHg9aFgClvuNUEbYziAa2wcOAWz+w7IrA4na60=;
        b=KyPxYwSzuwOkr1dYgAK56VeyeIkaMDuNSBs2AXvdiD27KIPTAO48sTZ3ae3G9F+cGX
         ySfdaZgURpB25/fDDGi+TTTBll2HIVfYuNbJHgAX175BHtPSmgMAPr5yzcqXsPUzJjA+
         w1579JmmN9XXlhDVSxhIcIvFOYBIFy2/ufTPNycUCN7zDs8bLwAVPMb8d35ddqTMPLy8
         haGE5gFVvr7RWbLZ626gaecPHkWNX12f4V6OUdBtuTNmXIJ3b9ja7pcKX3MT/CU8bGjT
         ClE5QgCXjL+gGTLaIy5dJ1QzBKvH6+F58bLhXuZI/eMxwuuClrIjFx/u7jv8/vtUDNtw
         M4ow==
X-Forwarded-Encrypted: i=1; AJvYcCVc/8eCAk7TO3lS9nqwB3RHzKrAnCdg5c+AtZZYda6JTvjJO9Ug1xnm0ZACRz5KgJm0yicqah0sPKKq3X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8e2TzYmgo7yl1fyEFMACI1MjypK9oKR8uxuJMs67/Oh76kg3
	y4zz1lqfpp11EIKR/uEOqPv7vJukOJhDa33wL2ytChLk1YYjwDX5n959AMKR6IQ=
X-Gm-Gg: ASbGncv77P+yB6e7VAE+9/M7U0YKcpxAMQ9+Tw/btiUXq7JFdGHZmmP4Ncdyvanbc+g
	zI/FYvpGGFNAxLfi/36boIYWAlr9R11yhYL+9Lj1LHhgZJtCEKH1xg+dW7H4AekOsGJ0452tz0S
	8LUrNKTno9omXFAEK9IPhaMVq5Ds0Jiafq2wxvBQp6U4qIxaJdEfuqtm9xLQqfbreEPRLkk0X7l
	+RfGjdG6hUjS6p5pxBxk7N3pgSSSSE3EqS5v0U1jQZenqtxBcn2VW/IqIdi77zDgjzpGs4njWhb
	fgKTinEDHoWyvzZ/yAJR8ifv4G7FyPb9shSCtg==
X-Google-Smtp-Source: AGHT+IGPMYljpeD4pnIPV4e6hdEW1ZBRPTLVTE817N1JQkweURcQG3ISuVkVno8eIM9O75BdqoVnPg==
X-Received: by 2002:a17:906:15d4:b0:ace:3105:afcd with SMTP id a640c23a62f3a-ace3105b6damr170970066b.4.1745328460550;
        Tue, 22 Apr 2025 06:27:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec50607sm657364666b.71.2025.04.22.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:27:39 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:27:38 +0300
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
Subject: Re: [PATCH 01/11] pmdomain: core: Convert genpd_power_off() to void
Message-ID: <aAeZSmRtVyxEzqvC@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-2-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-2-ulf.hansson@linaro.org>

On 25-04-17 16:24:59, Ulf Hansson wrote:
> At some point it made sense to have genpd_power_off() to return an error
> code. That hasn't been the case for quite some time, so let's convert it
> into a static void function and simplify some of the corresponding code.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 3523d0331cec..574a0de1696a 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -908,13 +908,12 @@ static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
>   * If all of the @genpd's devices have been suspended and all of its subdomains
>   * have been powered down, remove power from @genpd.
>   */
> -static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
> -			   unsigned int depth)
> +static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
> +			    unsigned int depth)
>  {
>  	struct pm_domain_data *pdd;
>  	struct gpd_link *link;
>  	unsigned int not_suspended = 0;
> -	int ret;
>  
>  	/*
>  	 * Do not try to power off the domain in the following situations:
> @@ -922,7 +921,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	 * (2) System suspend is in progress.
>  	 */
>  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * Abort power off for the PM domain in the following situations:
> @@ -932,7 +931,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	if (genpd_is_always_on(genpd) ||
>  			genpd_is_rpm_always_on(genpd) ||
>  			atomic_read(&genpd->sd_count) > 0)
> -		return -EBUSY;
> +		return;
>  
>  	/*
>  	 * The children must be in their deepest (powered-off) states to allow
> @@ -943,7 +942,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
>  		struct generic_pm_domain *child = link->child;
>  		if (child->state_idx < child->state_count - 1)
> -			return -EBUSY;
> +			return;
>  	}
>  
>  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
> @@ -957,15 +956,15 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  		/* The device may need its PM domain to stay powered on. */
>  		if (to_gpd_data(pdd)->rpm_always_on)
> -			return -EBUSY;
> +			return;
>  	}
>  
>  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
> -		return -EBUSY;
> +		return;
>  
>  	if (genpd->gov && genpd->gov->power_down_ok) {
>  		if (!genpd->gov->power_down_ok(&genpd->domain))
> -			return -EAGAIN;
> +			return;
>  	}
>  
>  	/* Default to shallowest state. */
> @@ -974,12 +973,11 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  	/* Don't power off, if a child domain is waiting to power on. */
>  	if (atomic_read(&genpd->sd_count) > 0)
> -		return -EBUSY;
> +		return;
>  
> -	ret = _genpd_power_off(genpd, true);
> -	if (ret) {
> +	if (_genpd_power_off(genpd, true)) {
>  		genpd->states[genpd->state_idx].rejected++;
> -		return ret;
> +		return;
>  	}
>  
>  	genpd->status = GENPD_STATE_OFF;
> @@ -992,8 +990,6 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  		genpd_power_off(link->parent, false, depth + 1);
>  		genpd_unlock(link->parent);
>  	}
> -
> -	return 0;
>  }
>  
>  /**
> -- 
> 2.43.0
> 
