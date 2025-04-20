Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D281B7F4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745141559; cv=none; b=rb3ysTZF2ruPmyw6RKh5gva5N13yyfUPh8EjWmWRxcIsOuhPd4zw2fcpv/E4gsuTghxFwnNDVlBkTabNtDM/u4J3lrwL0Un1bOoeobcaCxy8NUjohWdBqJDu5YmMmxHF1eHT2Iuv6eVGLP+hQWId1IV5Vnap1xdK7RtKvfL3LP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745141559; c=relaxed/simple;
	bh=5ImCsy3Mr2IXsmgc0puEqNQGbzvWrpkd1bvJ4+E+8wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=I9yCQDc1Y+0VIA1jh5+PE/Z4mnmBVNyMfTrvOeOZIp9dpy8SplR8fMNZAiGG2yRI0nFLj3M7yAFWZ7CZlpF5o+0dWpWjm/4lVhF4w0pfgY2TWoM611geaaRNwlELblwALW93BmMniL3RxXCnsRzEiJKl0aFMVpdMG6B3UbPgdbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=AS5dK+IK; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="AS5dK+IK"
Received: from localhost (unknown [10.10.165.8])
	by mail.ispras.ru (Postfix) with ESMTPSA id ABE754076726;
	Sun, 20 Apr 2025 09:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABE754076726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1745141546;
	bh=fWQY42eWCmlkXVWhry1af/CWnxEZndFo/0hIOaKShAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AS5dK+IKYudFHNvytmLk+fqj7yxTBZjUdVJCcuHfpJwstkabClzSTiwtPwAfKq/Ni
	 1uTL0d3nV+qGrUEpkz09E1oWlkkcgtdcDsX8bZzKHIUDIwRKpfFhQISndwdTZ2QQpQ
	 +kYUP272fI7LfR9Y2z3cZgPezv/ClCT/kEpObEJA=
Date: Sun, 20 Apr 2025 12:32:26 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux@martijnvandeventer.nl, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, neil.armstrong@linaro.org, 
	Furkan Kardame <f.kardame@manjaro.org>, Anastasia Belova <abelova@astralinux.ru>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
Message-ID: <mpoae5tfugsnvdyv5yzmiifr242mc62gouqqvql7ucjtdxo7b2@7y4plckbcdbn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>

Martin Blumenstingl wrote:
> @@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +dsi_encoder_remove:
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +		meson_encoder_dsi_remove(priv);
> +hdmi_encoder_remove:
> +	meson_encoder_hdmi_remove(priv);
> +unbind_components:
> +	if (has_components)
> +		component_unbind_all(dev, drm);

As 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
states, it seems invalid to call component_unbind_all() before
drm_dev_put(). Wouldn't this patch reintroduce the problem here?

In that sense the diff proposed by Martijn <linux@martijnvandeventer.nl>
behaves more correctly.


I've also found this thread [1] with another error path fixing patch. It
was suggested to improve that fix with managed drm device [2] interfaces but
AFAICS using devm_drm_dev_alloc() will reintroduce the problem mentioned
in 6a044642988b, too.

I think [1] should be applied as well with Martijn's patch?

[1]: https://lore.kernel.org/dri-devel/20240809124725.17956-1-abelova@astralinux.ru/T/#u
[2]: https://lore.kernel.org/dri-devel/20240828110421.14956-1-abelova@astralinux.ru/T/#u


Thanks!

> +cvbs_encoder_remove:
> +	meson_encoder_cvbs_remove(priv);
>  exit_afbcd:
>  	if (priv->afbcd.ops)
>  		priv->afbcd.ops->exit(priv);
> @@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  free_drm:
>  	drm_dev_put(drm);
>  
> -	meson_encoder_dsi_remove(priv);
> -	meson_encoder_hdmi_remove(priv);
> -	meson_encoder_cvbs_remove(priv);
> -
> -	if (has_components)
> -		component_unbind_all(dev, drm);
> -
>  	return ret;
>  }
>  
> -- 
> 2.49.0
