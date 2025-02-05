Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194E7DA6A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766317; cv=none; b=Ik/2LTVpFWddsesFDXjS5iqP+fI+L/CEG4CSDm/N3cFHUko9upEfMXxZnr5z3byLfJ+ILcqGsseD32Afrej0EJDhGJgeuP73tlaqNFTKFSk8H21RxkE7a0KFV3v0lJ9f5HK1mRaa5hV/O4YKkvsKag7+2A7fYm8NaLePi4ft1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766317; c=relaxed/simple;
	bh=yInImsKQbVwOq9Y3VP/wgX/4vbpq9EssQaLbs4/X7HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnXnQPVgvWPWwaURCVRoiQbOmWE1EQdaxkTR1h7pwhm0RAYsUVFopnV4HZGyDgo1Wd3+P+B3MrMhkGFclpSOfkAM/R3imnVNew2hvFOApvO3H5Ek0tcHMq0KX2Xssl7rIqRFsoSVbauvR/6XMRU0bz03dS6kylsZap7/Qy2U5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WY9PZxfZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WY9PZxfZ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c52000fso6502424e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738766313; x=1739371113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3s/LLOq0dPV7UNCIkOxXe+oy85qndr/lTrPV05GR6w=;
        b=WY9PZxfZgQj8RtpoKCxVo5wMKPCF4pQniSabf9iwjp8hfHbO63suknoIvfuYlHVysa
         Fm8yqd9tfhdSzmAYqGMCbQCS+mZinxdMOw/KxOkUnhCvGrGSc68P/T+k2d/BJ+QwGSBu
         ALdcoWPj0if1OqU78IKN8d0OaXuJJtoCv1nLtS27U0uj2He+DqfYLjOyLqYBqqltPFb9
         9gYGA2sMc8nLx/8EIaCH2PhYiob6NaueoHazm8sqcxbtwVQZWa6sDnYl0xG/CsD3XdYv
         YDLQ7Ya7W3l911GSWHk9qZQYpEOAQ7nRou3UmgSK5pnGWO4/cjZn0OgQC65rRztl3+BI
         W3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766313; x=1739371113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3s/LLOq0dPV7UNCIkOxXe+oy85qndr/lTrPV05GR6w=;
        b=CXrV85+nUus69QSkU9LxeQg12vZsTeVTsVDmEr6LOx+Vu4atgQR/HktTJHRKwjulWK
         bQ2sMiKSUJOOHY1JOip7s2NajnhCybcJ0zzCjj1mA1solQoVmfGnKoeg0E0+eicK4rXj
         T9EGtLvUPzsmxap5sWRyP4+eSVzDqFNQaMxx85ipFE6sjvElrbV7dePROJW4n9TGg2R4
         sf7bo/9EsoqUJcBPqLXtquc92t6FoCMOe7mw5OoicJNz1D9tDR7wbTelEVgWUvE4mEpu
         54/0N57zRKDl/sK/hZ4rj83CtjA4WPWMuedQ2Crx7qxkZCBAG7Zn142z9XXeeH2S6JA0
         RGMw==
X-Forwarded-Encrypted: i=1; AJvYcCXxpdj2Kq9l80KZ1+ZmFmWvgNidZLmJ4bypvUDWNfyhdycYbGBMa+euLC/S9hQ4hOTFQqe1f1jYlCQmD4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lsrVQQ2RxHlxoaHYGYRG17ymcSRwsgRxKbxgN6qGbm4CEF/W
	42Kih2rguk5AjYxil5vr9bww7qDtTScfyKWS5yBMNPKipLyDRyrDGM6/NManR4s=
X-Gm-Gg: ASbGncvbrEk30CgdQXbYG8B6gWhcElIyuBYbhDz2BhnZv+wB6cuhjZPTlrIBU1CeFQg
	tUlIzssuiU27YA99f+6M8GiiLVR4tauzMjm/cllt0O0coTHm1Ou0zxIfT6AyKGNZCEyISxmkNZ0
	95DEhCHPA+nRnSy4012qXGJl6+WcjTGNfRLkGgwKs/16kSAZdATnYgI5GMM+OOTQkGKtC48lHo2
	zE4IPIZGRMacIqn3DJfg8KdtgKcTdenEEttg2pQbo6FEp0wkjyUvLR/xUy9GRGphJsdm0rtyJOC
	ckwMqt1ZaEnOb5KiDA/zRtqclFvdS9tc/YyJYX4iQeikqrNfxYYRrU4Iu0PY7sK9CBkg2NA=
X-Google-Smtp-Source: AGHT+IE6siSiYqoCqQTIpeksExMipCrLJz+JIWoi0AVtVuBjC0/DHoH67kNXH9JZjIrWHluYAMlZXw==
X-Received: by 2002:a05:6512:3e15:b0:53e:38fd:7518 with SMTP id 2adb3069b0e04-54405a0c4ccmr1152151e87.3.1738766313153;
        Wed, 05 Feb 2025 06:38:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe219e8sm1918090e87.106.2025.02.05.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:38:31 -0800 (PST)
Date: Wed, 5 Feb 2025 16:38:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, treapking@chromium.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, 
	Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v3 1/2] drm/bridge: it6505: add support
 DRM_BRIDGE_OP_HDMI to drm_bridge
Message-ID: <t2nd3xjgb4nomasdlb5cmgxxystyo66si7gdqafzi56noknzvc@6i366tvzpfl7>
References: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
 <20250205-add-audio-codec-v3-1-26cfadb2d81f@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-add-audio-codec-v3-1-26cfadb2d81f@ite.com.tw>

On Wed, Feb 05, 2025 at 02:41:03PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add DRM_BRIDGE_OP_HDMI to bridge.ops and implement necessary callback
> functions.

Wait.... Now I feel really sorry. I stumbled upon HDMI_related bits and
then I thought that it's a HDMI bridge without actually checking the
datasheet. When you have a hammer, everything looks like a nail...
Except that IT6505 is neither a nail nor an HDMI bridge.

I'm really sorry for pushing you into the wrong way of OP_HDMI. However
I still think that DisplayPort bridges should not implement codec
callbacks directly. Let me play with that over the next few days. I
think in the end we should be able to use .hdmi_audio_*() callbacks
and drm_hdmi_audio_helper.c while not (over)using the OP_HDMI. I'll ping
you in the next few days.

> The native AVI and AUDIO infoframe configuration API are removed.
> 
> In .atomic_enable use
> drm_atomic_helper_connector_hdmi_update_infoframes().
> for infoframe updates.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 185 ++++++++++++++++++++++--------------
>  1 file changed, 115 insertions(+), 70 deletions(-)
> 
-- 
With best wishes
Dmitry
