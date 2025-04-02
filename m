Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398991EB1A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628572; cv=none; b=mGPO2y+DBtBTzugzV2MX/0PvJBLbTLqNl5KvGIIHGbOPQRBnF360g3a87ny69dyrFN+NSygULqQetDNnHbf6E5nEIiwFHHX/sHSElpCOOBFIT2sQzIryF2k3nyEUFphZg+8YKnYvykZC4mXcvS/6VcQKmdZWqzHvLrOkE4KjNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628572; c=relaxed/simple;
	bh=NxU1qh4rEZ3galaYLuwWXch0mLJidkZNwrsLm5kun38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Onb2FzRRuZezS0vYNIHJJPjeSXTONNxGa46Zs4Dex78WibiM0y7qCHjbs3eqMfK2xCQIhNP6fbiA/p/LG9oF3OMOKHPhpkLH/ioijnjSEHn+zWAo1UthkPS+1HVTWAj0xUw56vCxWBD/pNA7OLUc8641/OOYfq/SBdbbxo6nBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=jqch+iqd; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="jqch+iqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1743628147; bh=NxU1qh4rEZ3galaYLuwWXch0mLJidkZNwrsLm5kun38=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=jqch+iqdF1HrmRSVsRvaiDzIazDlj460v0RiPrW6fX8k0OLkha4r9GXYn52s+HdTg
	 Avh6wXWHlXw7GhVOEkaNyRYQILZOlS+nMUSHG8rQ7puw1ZoAo6jQ+ajg9fQj/bi4Ca
	 4JkaiYZUeHryIItxpdaxsOca0xFD8PN7+pX6IUTI=
Date: Wed, 2 Apr 2025 23:09:06 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Icenowy Zheng <icenowy@aosc.io>, 
	Jagan Teki <jagan@amarulasolutions.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>, 
	Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/30] panel/ilitek-ili9341: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <75q6u7kgyhveuzlxujoocvqfzilaxsvh3udzeltk2itwigy2n3@f5sqxddtjxuf>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Icenowy Zheng <icenowy@aosc.io>, 
	Jagan Teki <jagan@amarulasolutions.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>, 
	Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
 <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>

Hi Anusha,

On Wed, Apr 02, 2025 at 11:23:45AM -0400, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..d87b7eefe9beedd290fb59065b389b3315c85720 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
>  	struct ili9341 *ili;
>  	int ret;
>  
> -	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> -	if (!ili)
> -		return -ENOMEM;
> +	ili = devm_drm_panel_alloc(dev, struct ili9341, panel,
> +				   &ili9341_dpi_funcs,
> +				   DRM_MODE_CONNECTOR_DPI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
>  
>  	ili->dbi = devm_kzalloc(dev, sizeof(struct mipi_dbi),
>  				GFP_KERNEL);

Unlike in other patches, in this one you did not remove:

https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/panel/panel-ilitek-ili9341.c#L529

	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
		       DRM_MODE_CONNECTOR_DPI);

Unintentional?

kind regards,
	o.

> -- 
> 2.48.1
> 
