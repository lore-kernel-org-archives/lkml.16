Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D716DC28
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960485; cv=none; b=njnSJwrEHDsq+8fg09n9kfYF07xUgPWPYWMmqsxQJR9uUJCW3G+79iVxh/XYxCs7E7hp1J3MsowIO/cmKnCYaaG2AfccRoXcYvAf/c6pUlryNcoJGEk4kbNYIPKAv8T7qidBHLgEneymPwXsvI7gviKFDo900+pWOQk+f5QuAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960485; c=relaxed/simple;
	bh=7jkF+0Xvc5ohiJSD57T8bDpiYXjK1fA5PFEa9GgNpUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcKmirOR7pfmVNmLS3Ure81rjBDiWL2yoSDVayISVE/QaaYp/R56JMfisjyinNZjI0zlYO2gdJl963UylkXGFB3AMUwIjSo4fYS5KHAFc27U9eeAJ4E02rZQsTHLlI6aZbKmE4mKNEGctMHuDHMp4oux5sZtgv41sYuk2sSoXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aWaj4RCV; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aWaj4RCV"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 9s3FuK4cRBfs49s3IuBIq6; Tue, 29 Apr 2025 22:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745960385;
	bh=+TozBWijXodrVUon6QJfDncNinfpv/1bQpJAQR3zwHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aWaj4RCVHvwG0spz2veNVZYCrnM6nLNlGyfl8IqfdPa1TCsIeGu92xkP3nKUnmZQB
	 iE1ph39mdxBnpKYPgISulUUnSjatciPB0VOhhu3UNseGODeeaScNQyfQeUfXr6H9Ab
	 FdBUB3/lGF1wyxzCqhKt3KXO3s2C/t2kf/FAGdvsKF0loerODbMjXLxJDboeF7CeM7
	 yKqywcqMZ4qhiiMNCQCA0fagB9UG2+pxtuf271dJ9FEsnogOhvQeSw5TtBXDmtzSro
	 lSt2giOKSgCeWaTRAZW5BfagcjN7hoXWIgzEGRlyQQQWxpmR1h/9qZZxNtrhxooW0+
	 T7s3gEoxwIQrQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Apr 2025 22:59:45 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
Date: Tue, 29 Apr 2025 23:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250429190724.330883-1-richard120310@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250429190724.330883-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/04/2025 à 21:07, I Hsin Cheng a écrit :
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Cast the type of "mode->clock" to "unsigned long long"
> when utilizing it to avoid potential integer overflow issue.
> 
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 7752d8ac85f0..fe3d3ff7c432 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   	unsigned long long venc_freq;
>   	unsigned long long hdmi_freq;
>   
> -	vclk_freq = mode->clock * 1000;
> +	vclk_freq = (unsigned long long) mode->clock * 1000;

Hi,

maybe, using 1000ULL instead would do the same, but would be less verbose?

CJ

>   
>   	/* For 420, pixel clock is half unlike venc clock */
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>   	struct meson_drm *priv = encoder_hdmi->priv;
>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned long long clock = mode->clock * 1000;
> +	unsigned long long clock = (unsigned long long) mode->clock * 1000;
>   	unsigned long long phy_freq;
>   	unsigned long long vclk_freq;
>   	unsigned long long venc_freq;

