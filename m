Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010311DFDE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399635; cv=none; b=QkQTfVWLsd7prDN3G43n8A6j0B9wWh5RqX1Dy7FM54786Pg3X3qg39poH2Et19rdzyQP0VafTCR8HlvhzYp01hZCldhsY2LI0aTqOBhTbNdlNRyoq+MmrUnHzMv7bhKxq7S4Izz/xNBosgJEeM9/eXvXTJTzPh5sFW2kDiGsynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399635; c=relaxed/simple;
	bh=m2lSo6KttgIFzZgohc+JXvnCpATp9Ptk+FCfYkBYpxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uK+U8UJMlOqIqdqWSTvPp3joQ949RRE3TTHwfhGR9c9xrpnhup49EXRImTuLU6Fe6byeQ081ea8k9T7c+9XEyvHC8E2WWS54qTdtIjca3XWo583M2OkL9JTml3qbFsIrxsQF+r8JEW2OsCrDRwXkebtp5YoaBromFlDu0h03N+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ejt/kDvZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ejt/kDvZ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso1956139f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747399631; x=1748004431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=Ejt/kDvZ59EX2KZI5HJkRrMRv6NBDk0ByqSS2Gu+VN7fG48mAqc20UoLGXCRcYo7vv
         t0wBB85i6DOXJBrQwH7zL9BBq5+FsJSXYXqDBaNqw87wwwi5eDvuncovNS3SphLalhBd
         fZBKwhvBcQl+K9xvoVkr9qfbuR/j9rhe/58hYXDR5harj2I13jA5eKzMeQuq0cNe8B8t
         CORWTbYIXE4O2Wlf62q3t+4jsSxuIwVA9SBdjOEUBmqoMxWId3X5RSAHEQRw0jP4wVxj
         qwj/Q2O7GGLAlK14gHlFN91+W2yo5GDATHBRqU5YKlaiQvNOxGR4uy+ABZHbB/OQxmRI
         BYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399631; x=1748004431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=PRjfKQ2bfYXDAyIIga85qj4kQ0P4Ak9T639pz9F93bZm+1jy+hzcNz4InRxhETuTr0
         8+NUqnCuIow9EvwUFszw6D4XPDSWexJ+liCGDTiHwVO330xF8GJ6vyOjDXRk4odv6w4w
         uf/k5bhgyo6diLsgsPl0dx/X54fhUNZBYzuO1PVCQ2Q+cQSyK5n+mm3/w0yQA06qI1QE
         rlCcapCom+Q0gRWZE8o0GvgQ9h3fxLazEJtgHO0wB0yHy2LwziF+QkldoCvlN8cA24mH
         L14RzlHH1VIXGvaZf5Lt03D0RY6xRQ8QHxuj5t+FJbcIQ8SCBwC7VqQzDKdNWOBLjXZx
         7e3g==
X-Forwarded-Encrypted: i=1; AJvYcCXKrKzxLU0cr2+4eFH83AsbCAftgfoEnBY2GXPwvSKKC8V2x+yXO/98EH69QnTqVGR2rSEWbSdSLbSXAm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvd5dZpAqzRmf9chiy1uZJPLH24NJQEJsqygGVeVqWLFCRYf68
	TaZImSeWvokjLjLcaJhlHgkB0JuFu+5bGOlKTr/Hee4uavKFXqkw7L4EwO76uCDnH8I=
X-Gm-Gg: ASbGnctK1RdjL/e833R/a3kPLfBOUll/QTmlC1DDxSHeMjM4eAD55i012vy5n4mDTNb
	l/G5tuhp61hoSlzCnUaGKgpkNJP/YxkZ45jbrqKwQdA6sCwi3UwvhpsJMNYNXPR1bgGKxin6KsP
	5KETciZ9WYBxgSxURywGOuuOBrt1fVP9/J6sVbmpWbKegohYl7dZNvE8cwiJzRjSoq2sWhBSxVs
	/46NdUk9iuQnIRdkGaF+QWQMTwmEdnzFywcUA80cfmErOw/QSuAqumuD561kA0hXH9bEdObJglP
	EhQGEb5n89I3mhHSUj6hlm6SahuMe254mNQnYpNJvkftSCpaGlGauVA3QNDslJIRI4uTBc8pG9l
	4xViXD35HSsz7PWU=
X-Google-Smtp-Source: AGHT+IH5gScMrCCTGF//8JROzSasDHWVQYCYlgMKE4a0wf2w3fuKAyBSQp+DJif8kHEnseMXKCoH5g==
X-Received: by 2002:a05:6000:144c:b0:3a3:62c6:d2cd with SMTP id ffacd0b85a97d-3a362c6d48emr1641333f8f.14.1747399631142;
        Fri, 16 May 2025 05:47:11 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm2792986f8f.55.2025.05.16.05.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:47:10 -0700 (PDT)
Message-ID: <70da4bf0-a36b-474c-8057-1ad056573e01@baylibre.com>
Date: Fri, 16 May 2025 14:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] arm64: defconfig: enable display support for
 mt8365-evk
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello

On 20/03/2025 09:48, Alexandre Mergnat wrote:
> Enable the DRM HDMI connector support and the MIPI-DSI display
> Startek KD070FHFID015 panel to have HDMI and DSI display working
> on the mt8365-evk board.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e615863..1e2963a13500b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 

Gentle ping.
Is that patch can be applied please ? The remaining patches in this serie
do cleanup only, then shouldn't block this one.

-- 
Regards,
Alexandre
