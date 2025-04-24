Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18A224AF7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479293; cv=none; b=iRrMlayXy2DTKdnhQIzEGlAbrs/gr2fdsFEoU8ofpoFbiKo/nqkWduMXQUakIAq4OHVGjIsPXEB8s8WLBdPMnDiAKmIsQE414uDgLKfG/68+roUtRO+oOgANI5uVwJeyFW9ly872SvNecyApxVfx2t5kpw/tvqhEkeM4cGMe9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479293; c=relaxed/simple;
	bh=QG9Hg/8/to4LWR09+9YUrP29AfBWc4mW6szKx34ebAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj/0HppEKqosdTQgye+pvf8sCwf3B43J05HCQc8oNbA0BMdH0ak/pot5YkmunMDrfmz1zJVHs+cVFAF4s7QeHwFcoZF93mDIR3pcANJdkL+v7mgrlKBZvNm7o83d8u5EP1P3mNQKtjT6Ds4CM83GRLyFog4FLccAbLGuwHTB658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qR/QBki9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qR/QBki9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479289;
	bh=QG9Hg/8/to4LWR09+9YUrP29AfBWc4mW6szKx34ebAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qR/QBki9F3cJw8UQnOnoX1NSL4R+OZp4/wDsjTHqFzYQ5hBOY/3xGP6Rh7opD7/4l
	 KuuFp12IVPh///Rrump6kqSomCgglBkIMgB5B56ntGjrOw5K75y/9+Dh/7vG+WOPiC
	 ajrA3ssUjFb01nNu7TyVuumUx6nkQTcwZP0zkPKh/WbOOA8lJBm/lrmn4isuLuHxls
	 iGgGlzUk+PAuEDX2fI1Tb0DpHBfIvSeyF4W1gPCpsyQtdIjJlXDIYqJU1j7IxjSr41
	 zP2SUpKyrR0ND5SsMT6wMkMufPyMbFm8XbKnhGEPRhXJJb/8gGVwg1oo6cyQHryG8x
	 HZXfgsvKht93Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2711817E065E;
	Thu, 24 Apr 2025 09:21:29 +0200 (CEST)
Message-ID: <912d64ba-8f17-4e63-b166-be8a9224a643@collabora.com>
Date: Thu, 24 Apr 2025 09:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
To: Arnd Bergmann <arnd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250423163214.2276114-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250423163214.2276114-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 23/04/25 18:32, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> goa_even_valid is only initialized in one branch but not the other:
> 
> drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>    838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>    842 |         if (goa_odd_valid != goa_even_valid)
>        |                              ^~~~~~~~~~~~~~
> 
> Change the initialization to set it to the value of the condition instead.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..4f548430654a 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -835,8 +835,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
> -		goa_even_valid = false;
> +	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
>   
>   	/* Programming one without the other would make no sense! */
>   	if (goa_odd_valid != goa_even_valid)

