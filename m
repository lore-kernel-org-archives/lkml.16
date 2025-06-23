Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F6424BD0C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695374; cv=none; b=pm30Ot4cVmjycGKnHwT+hwDqNsXrN2hhysKMFXFEx3OsQ0p/UPLE4/CYp7GzEaakfu7aN8BnZejMFPsYKhyhkwZGGMsj5nhOFteFFB7urkM+b1UBd1Wu/8Od17OPpi7Ehdw3+o0EtkG29eUrCxBhcJx+99rhUscKLU0ti3gw6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695374; c=relaxed/simple;
	bh=H/KTCfUC8NzbfsL3wBmW19mD4SmZMmkNhNd2hYhLg6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaYOoiCtUtifAkQuXaxoB+qBE9WEfB2QcQ2XMJdAOEKLMe8Lj5tWqBSv8TIbl10RHpoQx1m+4RbYar4Hn2CY7MlAS3Fs026FC5s70N8M6ZZk9F96X8yHuyMxloH1Dh03vEFQmcSff8y2hj7tsMn3lSl/g32MLjnf7OhewL03F7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyWuFtKY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyWuFtKY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so4101628f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750695370; x=1751300170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yO1ealRuE4yEPMjJdBgcY0UE9jWW4gYbcYd/I6gI6bg=;
        b=oyWuFtKYXpxKAyCSDE3bwqiSpBZ/J1ywko3cE7u1CBa7WT1Zn/4WDwjW8RVYFG9qJr
         LzT+92DM3OAs+/Zd7hWyGmVT35WhQX7NYC2skyduUy22hy/MBNvQITa5JQVsMr0BO8xU
         +ujK2tTb3hg1lM+aCx5utNoFgqC/GIQi/7D8oNuCVCtdiIqcH+vYW7Ti8omH1ThoBVXa
         HZLSlc/WRv+LOrhDOOVI38tO7KKcJHNkLcVLYbwc3eRlXOOkckGhR1IaifrD/ajfgpe5
         53U9DTIpA/7qcvfsOxW42tefe9h40S7w5ZIi3VejMFxcwGYBykzLVSGsGpE8O4+5+b+3
         dh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695370; x=1751300170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO1ealRuE4yEPMjJdBgcY0UE9jWW4gYbcYd/I6gI6bg=;
        b=IQBWGHULdrWOcjjCv21la4tkfYmIt7RFdNFW15AvnEZHZG7zgfRhIYMyUqsGqlBBcU
         SoaUKtumqBAlAfu94yi2IBg/VgdY0/DWBitgmnlrZE9Pbb3Qb+6KZe34HNlHpzpLkBzF
         2BkIdKT86IpD1T58EFzfsnrEVIQaYlZuoo/sUn4qyTBVmORZa2RnBW+KC3ISAHKi0gvd
         aI9U/hJw80Ex7iJOq0LUeMFnZHGbXFOfA5OmGX+uNJ+UWp7siaBFdyHlaDiOggHGLAQH
         yyub3ikOW1Hov80qJdbhnXDgT+h4rkth7w6wQejrmBiqoBB51Hw8yN/pwA6EJjr4+wNH
         1D1A==
X-Forwarded-Encrypted: i=1; AJvYcCVjXUo1I1o0Qpw6HbB6X4sdhZVuO6M0g6QkGR+vPCGhgb14cefRGQ7hs3WScuvsloV+IRL0nzG2jofCxWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHI3kHf8r7j77x+Zp64UbvxsdrDbLYXyg8i/tVgPM3dLTHIP+P
	1X2O+XdslkziuSiYGJ42uMGg/9gdlLjiqREgslyvLIAJ05/bPPC/jZveOYkmhQrNltc=
X-Gm-Gg: ASbGncu/WwIRmGncYU+2nzjKE0P4ViHKwyB6Fqmm9/cr0luMuxkG5UuS62klkCmJi1x
	SE5M+0Ztg4ugM5EOnesWCyOmeou526SWEZJjF11Z5HjpjhC+NubKgZpiCz/XypAcxkKroS1PI63
	mcNjf7ub+xKa6cFL+TgAoOuiHkWatNbYqQ3pVJG8RyEWR188xvDhNzPkqASyGH24tKYi/v9YceK
	0nsY4cm40uLV63rT0ciRoo46p89/54aXXpjPu7Kzc7KgQGcJMCIf6ATqTNTEj1CHfTW+RAYy7Ii
	HardR6zwZVKbrZUAdoARZb/Q4w6csE2fZdOvELxjgL/7LQWpVfq4pcrestoIpG5rNKvgr2uOIA=
	=
X-Google-Smtp-Source: AGHT+IG1GltRs/clSARzmRQhvHut60zejlD1k+oWtIeF50l7rVK9RZ/LkGHmFxG9oef8hykFwyx0Kg==
X-Received: by 2002:a05:6000:2504:b0:3a4:f9e7:2796 with SMTP id ffacd0b85a97d-3a6d12fb64emr12830861f8f.35.1750695370340;
        Mon, 23 Jun 2025 09:16:10 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c16sm147423325e9.19.2025.06.23.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:16:09 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:16:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Chaoyi Chen <kernel@airkyi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
Message-ID: <aFl9xBBLwSHxCPMq@linaro.org>
References: <20250620011616.118-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>

On Fri, Jun 20, 2025 at 09:16:16AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Thanks, this patch fixes the following errors for me on a Qualcomm X1
Elite laptop with v6.16-rc3:

[   10.900256] hdmi-audio-codec hdmi-audio-codec.5.auto: hdmi_codec_probe: Invalid parameters
[   10.901376] hdmi-audio-codec hdmi-audio-codec.4.auto: hdmi_codec_probe: Invalid parameters
[   10.909627] hdmi-audio-codec hdmi-audio-codec.5.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.910813] hdmi-audio-codec hdmi-audio-codec.6.auto: hdmi_codec_probe: Invalid parameters
[   10.918145] hdmi-audio-codec hdmi-audio-codec.4.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.919296] hdmi-audio-codec hdmi-audio-codec.5.auto: hdmi_codec_probe: Invalid parameters
[   10.919298] hdmi-audio-codec hdmi-audio-codec.5.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.928482] hdmi-audio-codec hdmi-audio-codec.6.auto: probe with driver hdmi-audio-codec failed with error -22
[   10.930742] hdmi-audio-codec hdmi-audio-codec.6.auto: hdmi_codec_probe: Invalid parameters
[   10.930744] hdmi-audio-codec hdmi-audio-codec.6.auto: probe with driver hdmi-audio-codec failed with error -22

By de-referencing the "bridge" from the outer scope I think the current
broken code basically de-references some random out-of-bounds memory.
This should be fixed ASAP.

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7d2e499ea5de..262e93e07a28 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -708,11 +708,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	if (bridge_connector->bridge_hdmi_audio ||
>  	    bridge_connector->bridge_dp_audio) {
>  		struct device *dev;
> +		struct drm_bridge *bridge;

This is technically redundant since "bridge" is already defined in the
top-level of this function and shadowing it (declaring it again) doesn't
really make it less confusing.

I would suggest either dropping this line and re-assigning the existing
bridge variable (as it was before commit 231adeda9f67
("drm/bridge-connector: hook DisplayPort audio support")), or perhaps
renaming this to

		struct drm_bridge *audio_bridge;

for less confusion.

>  
>  		if (bridge_connector->bridge_hdmi_audio)
> -			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
> +			bridge = bridge_connector->bridge_hdmi_audio;
>  		else
> -			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
> +			bridge = bridge_connector->bridge_dp_audio;
> +
> +		dev = bridge->hdmi_audio_dev;

The "dev" variable seems pointless now, just inline
bridge->hdmi_audio_dev in the call below?

>  
>  		ret = drm_connector_hdmi_audio_init(connector, dev,
>  						    &drm_bridge_connector_hdmi_audio_funcs,

Thanks,
Stephan
