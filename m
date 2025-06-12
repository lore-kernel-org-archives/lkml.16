Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890CC22A1E6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720838; cv=none; b=Ej/8UXjK99F3Ft8L+GZp8+59uqzB2/hitn1iBo/TcbkVyFM4n1PocyXetWgVSMqy7aJs8fj5S8jUD/cd+ggbKDsjPwfeslZsqs7KBOhXYR1dWz6NZMfKwIvU+D7hJNXzKrjo4dll3ky3Tb/dPa2Hei1gQlhOZDkR/rRutqE5TbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720838; c=relaxed/simple;
	bh=6dRei3ZosXB8ENiNImH8iJ3Wad/iOoe28y6eMm7mJL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6EDYNoGJ+Nyfl/r3gCs96SfpVew8tAqBaXXBMJ/D0bAbpx3pI6+QeuEE+U96MMghprH7HJdQk8Sme6B8OReg3Xm7Rld18p0lbXjr0T81EUtJHox4peDZouLa98r+TMhOVrnwqQBOWyhjwRgC5pTvKNP2e4Gk4OtUYBviOf/e2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IODf2t9J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IODf2t9J"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D04257E4;
	Thu, 12 Jun 2025 11:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749720825;
	bh=6dRei3ZosXB8ENiNImH8iJ3Wad/iOoe28y6eMm7mJL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IODf2t9Jy+7F3cYY8TCQ80z9zr8C9ks2u44UfObyPFWI8svEDO4AKnMrq6uu1s7JK
	 GBm9OS1pn+432vPlvPbJ0cCzvpPK5bAt04Fp2eoW+jcEg1Mi/JpSyaL2rLKeKqQcKh
	 o0J/DChrImDrKG2aoeqikmJ08LoAqCSZRs9D+0ZU=
Date: Thu, 12 Jun 2025 12:33:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
	biju.das.jz@bp.renesas.com, luca.ceresoli@bootlin.com,
	tommaso.merciai.xr@bp.renesas.com, aford173@gmail.com,
	jesseevg@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Convert comma to semicolon
Message-ID: <20250612093339.GC25137@pendragon.ideasonboard.com>
References: <20250612055218.1517952-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612055218.1517952-1-nichen@iscas.ac.cn>

Hi Chen,

Thank you for the patch.

On Thu, Jun 12, 2025 at 01:52:18PM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

This should have

Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")

While at it, I would also remove the parentheses. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9df18a8f2e37..418a403586f6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1278,7 +1278,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  						  SNDRV_PCM_FMTBIT_S20_3LE |
>  						  SNDRV_PCM_FMTBIT_S24_3LE |
>  						  SNDRV_PCM_FMTBIT_S24_LE |
> -						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
> +						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE);
>  	adv7511->bridge.hdmi_audio_spdif_playback = 1;
>  	adv7511->bridge.hdmi_audio_dai_port = 2;
>  #endif

-- 
Regards,

Laurent Pinchart
