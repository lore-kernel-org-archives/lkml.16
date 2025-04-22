Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7F28134E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330585; cv=none; b=vD6VKmEtC2O56ihRGZ6s+hEJrDEwYVxZHo2BWnh6p1a3OzyxI3qUIXpSrIip/W4+HJ3pg5P1aXPpL+Ib5Ifm67diAMqzt3V7fojMjrC3NHGI/hnTuVYLS1nZY6qeJE+PouWX3yamRpSw7gEKSFGg+QMc16kA2wxMViNzIXId+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330585; c=relaxed/simple;
	bh=pTCnnE0WvBlnr+Qj0FbjHqO/pnVNVLaBdILZogWqmAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wnxn3IiKurSmg0TblM6X1RvFEfMaxiirOsaw6GRjCE5VHkA/Q+eNZ4zlFuLHyDptbf1I5QPqw0TVXKiGBlB7nxwGQmJE9qDJqDGnbhrOobACI2Hmdm5q615fKGBQu+Fk5at1HBnkEsE27JPRB8v5K+TmMzT4RPmivTUmJaJA+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4Nl9lbf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4Nl9lbf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso864618866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330582; x=1745935382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KGkwbFW8mc6saMp1e+KcFytRng7jGJzpGVkRT08ylU=;
        b=q4Nl9lbf6s0kTmZExW4LxTs9tPg9p2BwcXii+YbRetth2qIQfuvqCSj+oXQ3b9dkcq
         q297wnmCcJEser5zebgKlEfGd6+ui7zhcx5HJjmTC1+GR5eJ9VeKSiPlZAHLtRrBQZVL
         JvGY0z8JMeYeE1HcsZ1g3xwAAMWN/Tqsm4iI3Xrcpqvvb4W+DGgjlmySKIlxFxlGLdli
         vr89s6NPxOUfpcCbOSj6WbOovLtYKKCpJYl/+tdsPTHv92EemM7fzBBhuqIj8Q63xGJi
         e6Ocy7ENfriLmNiUbNhHeYGpC2kk//Zw5dZ0JpfjmcDvsxNPM48Mtn9EwqAv5xakcV7l
         RzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330582; x=1745935382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KGkwbFW8mc6saMp1e+KcFytRng7jGJzpGVkRT08ylU=;
        b=dwhWo9wVzEFqHNY2rPOIIAK6DHKjxcvsCvLRNb5gWUva8+I7e2WG23VPBPGuiFPOvT
         PFrdhElLjN0WmVG7lXb4uIBBqaRGgM2JDNx0Fp2G0ih57x0VpWAmJfTDIDBtiaERILBo
         Ir7OdUE0U49ECl+NzfYvYpcHmn0LrJ6a1MmlXNgw+mrJc3+5ztKpcn98jgflEISHVKMm
         DxGkKDacMpg/iyMn1jz+Mw17q42I2RYy+Ymw6Tn47qkQ3rXGS9aEF9vncr8PSligWu5h
         eHtn//3JQI1SWan0pkFHA9s/vP7bSPXh+ae4Xozub1BXzCgYRKts/fLQJo94Hypyuojn
         U6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX328ukiRQ/ltopMxMwn8XoPz+4sih14IHfKo/GI+RM/boPb95v59vbDUA7vlK68NZRjDKuTgs29jUL4iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3AEWfrpurc/Ix6OF+Xg9PfnLNaGdaJij38UGGLqvwHXLnwh5
	rMgZvV5rFrG+H1SUKi2SvEWIMtMYcnrfkbw7NfjNy3+WokyRS8B23uY02odNYj8=
X-Gm-Gg: ASbGncsKy3KsNpUkBdpnl0M3ylPNNbpQ92nNjifRC4YxILtWkYi7RzD4ohm9Kfm2mAt
	IFzhmeB8xRmWKw9bLMMA/9rNgPC6zGzk+9iY2yTECxIE8/Er6eNjRuMzMXR9d52tbtY6Ee40yP7
	okjCaUBoqg/VuX3G2XsATwEXz9mLhp0B2ufqah030a8VHC3/rOUPrD7klyriiOx2sgLCC/teRqo
	/CcUvidEfnQq3TDufIYpY8tG6tTpmBBBF9EWZBUtNfKUaBdcRH4BTgxG4hqvTiEf206qFvPT8Iu
	K3/vFlpRMxoolhGMDtNsXKJ3U6a0i27NcFpgfQ==
X-Google-Smtp-Source: AGHT+IGXA0LtNrq/q99iH88FAI+tkMr5/gDahnmnJo4DPlV9/CFoB+qZ83sOLLUpScdf873PzsLhew==
X-Received: by 2002:a17:907:c16:b0:abf:73ba:fd60 with SMTP id a640c23a62f3a-acb74b862famr1643280466b.29.1745330581391;
        Tue, 22 Apr 2025 07:03:01 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm651907066b.162.2025.04.22.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:03:00 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:02:58 +0300
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
Subject: Re: [PATCH 04/11] pmdomain: core: Add a bus and a driver for genpd
 providers
Message-ID: <aAehkpXAxh3bI0WT@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-5-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-5-ulf.hansson@linaro.org>

On 25-04-17 16:25:02, Ulf Hansson wrote:
> When we create a genpd via pm_genpd_init() we are initializing a
> corresponding struct device for it, but we don't add the device to any
> bus_type. It has not really been needed as the device is used as cookie to
> help us manage OPP tables.
> 
> However, to prepare to make better use of the device let's add a new genpd
> provider bus_type and a corresponding genpd provider driver. Subsequent
> changes will make use of this.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 035b65563947..da51a61a974c 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -27,6 +27,11 @@
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>  
> +/* The parent for genpd_provider devices. */
> +static struct device genpd_provider_bus = {
> +	.init_name = "genpd_provider",
> +};
> +
>  #define GENPD_RETRY_MAX_MS	250		/* Approximate */
>  
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
> @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
>  static LIST_HEAD(gpd_list);
>  static DEFINE_MUTEX(gpd_list_lock);
>  
> +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_drv, drv)
> +
> +struct genpd_provider_drv {

I'd replace "provider" substring and expand drv to driver everywhere.

I think that's more in line with all other subsystems.

> +	struct device_driver drv;
> +	int (*probe)(struct device *dev);
> +	void (*remove)(struct device *dev);
> +};
> +
>  struct genpd_lock_ops {
>  	void (*lock)(struct generic_pm_domain *genpd);
>  	void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
> @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct generic_pm_domain *genpd)
>  	return 0;
>  }
>  
> +static int genpd_provider_bus_probe(struct device *dev)

... and then here drop the "provider" as well.

Other than that, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
