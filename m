Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162A28A1D4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297563; cv=none; b=OBEnJZd2TMiGZcT3Ab10sQMmWQoszHC/qBb1dpf5DZfQ5xuuew1N4jS6bCo9OSYzlYU62AT5uw/cLZ6AL86DfPo5d99g0EnkORxdxJnbp3JHWwP5pFUZw+oaf7E5lSpbt1JF6w6iFK/KIGeJI3Stb+2RxY2NeQDOYZaEhqSPCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297563; c=relaxed/simple;
	bh=UGZ4dX185IMmeu++g+YtDe/3VZTqmjMncdY+4z12CO8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UeGmFYgspYziXYtLHlZxMmWYd3sd6c4vr2lzDxGkMewKELWV2Llj8y5CSyof9apHWrujCwlad7FJCnAdQObbCOcsALfiSM54HLrAOrYH/bRmpX7c/yVtJDc99agpGEKT0Q76kee6Gyogk+OyDmbMRM1GzLTr+tcxMDFP5SwfnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2ElEHHD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2ElEHHD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1310013f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297560; x=1751902360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM6bGARcZMrEFIPxun/H10tMl5YJTValxXf2mbuJKbE=;
        b=f2ElEHHDnfLJkcUKF0LE8QNP2hik9VUwVjRU8/XtxiwnbmJXW60rqUV+dnB691rMoy
         dlyjIOUF1ostn5DEWHxtAsoWEn2Mwn6Usy+BAubtMDHMocgvQd0/Jsz3dexyoucc62tT
         gltJh5IdcDFCVs0qyZ80e+qgmpXXkKdZubw9jR+Knc3wa7lnWxAk1seIvg/pUyEg0f47
         h7+xES2dSpom5pp7WpmHZaXQjlANLdozGNwmZwVHQBTpP5mGxEnFFDF2e4p3pYYFXdme
         KduoiS7LU/A/fNWq8wHKmNz1E2Di6S/knQKgJbgkGIdjPDCepsM5S0tPhzmzEvBSvNoS
         w/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297560; x=1751902360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TM6bGARcZMrEFIPxun/H10tMl5YJTValxXf2mbuJKbE=;
        b=hQizTKDQPXhbSPNw6nuzMiyQsmEJFlp79JxMd0GkbAfYhxQiTcMyQ7Fok1wdLtVFE+
         RR3kORJVUFfvfiZdpT6qmiY8vDAeCG7IBwstj6eqckijgMg+KLujrTJlU1NMDpTdEXiC
         QvwzLcTTAi+Gl8F4uqe0BphOSaEVn0HC1y7KnKC3z2PSg4xOiZvR+GPhUMj1OvUxmFwC
         NiCw86x0dAw4vKdgspGz9qTImp17t71fRsAz22hGpq6U/iRRLV1Rit00xb3ARg2e4xxq
         pHcbd4ZUG27g9VpANVbJRUid/Tor+rHoKxMI8SI+3BtW7SoWptrzL5CSv1OUTqOqSSJF
         VNsw==
X-Forwarded-Encrypted: i=1; AJvYcCULvPRBxZHVJui5giRV5wu3xWElgACuZZkgB9yYVOCgt4NQ75xrZy/SrmIMojaLWfp1MAVckZgVBh1hfpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4T6lR5FFs/hX30Azwvt+YvVRcXSmKqtiX/jcbm604mJHfPhp
	ww6AwIRqzTaTQSKITeRwX8ZjOEKCC/W9oQV5APjXTZ08bHtqj2UQO2hK82irTq+Cj0s=
X-Gm-Gg: ASbGncuzs3uTJNQbg2UC1FW6419NNF+o4PhloGs8G43KZqQKjMHzEuhm5QN+ajBvN4m
	f6YBqdrijGbmiFW6osKPQQWASJej07dAnR9zgfQoEqsVu/dB5HjR6i5bncKBGn2AfZ7bApOkLnv
	sajbQC8KmWzEXmfe9LQT2sn+hlPJ64bK3iVMrFmUeseWHdiNpLiZw6sXwrQdqpwg2GtcXW1vzhK
	cnlNih4w8uJE+bLbF9e7GeT62MSv2BoGWtzefrV/x05ynjJlSin/IMARMh7Iqs2nDsvIguXGkYz
	S5LJTNW0e+fhuDL8iWVh/nxwzeAASkWGT81LhUKPx3wo/m4UuZc/voaLECsSTEDhLQd6VFvryor
	V+FujlR47dtB7XckwGPscaQmIbJhRI1syjInryUw=
X-Google-Smtp-Source: AGHT+IHOKCfX8o6K3iSWVeSWTleKXFk/Ck/rHxEVE+zexb4rWH1ySnJbEv+nOY5vdoWp42ccJUnAgQ==
X-Received: by 2002:a05:6000:4b02:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3a8ff149453mr10644984f8f.47.1751297559841;
        Mon, 30 Jun 2025 08:32:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm10573229f8f.88.2025.06.30.08.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:32:39 -0700 (PDT)
Message-ID: <f29335b2-47c3-46c1-b183-f623a940f54d@linaro.org>
Date: Mon, 30 Jun 2025 17:32:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Move initialization from
 enable() to prepare stage
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250618091520.691590-1-andyshrk@163.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250618091520.691590-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 11:15, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DSI host has different modes in prepare() and enable() functions,
> prepare() is in LP command mode and enable() is in HS video mode.
> 
>  From our experience, generally the initialization sequence needs to be
> sent in the LP command mode.
> 
> Move the setup init function from enable() to prepare() to fix a display
> shift on rk3568 evb.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c | 22 ++++++-------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> index df6c1727237b5..459381d53847f 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> @@ -320,6 +320,7 @@ static void w552793baa_setup(struct mipi_dsi_multi_context *ctx)
>   static int raydium_rm67200_prepare(struct drm_panel *panel)
>   {
>   	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
> +	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
> @@ -330,6 +331,12 @@ static int raydium_rm67200_prepare(struct drm_panel *panel)
>   
>   	msleep(60);
>   
> +	ctx->panel_info->panel_setup(&mctx);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 30);
> +
>   	return 0;
>   }
>   
> @@ -345,20 +352,6 @@ static int raydium_rm67200_unprepare(struct drm_panel *panel)
>   	return 0;
>   }
>   
> -static int raydium_rm67200_enable(struct drm_panel *panel)
> -{
> -	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
> -	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
> -
> -	rm67200->panel_info->panel_setup(&ctx);
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> -	mipi_dsi_msleep(&ctx, 120);
> -	mipi_dsi_dcs_set_display_on_multi(&ctx);
> -	mipi_dsi_msleep(&ctx, 30);
> -
> -	return ctx.accum_err;
> -}
> -
>   static int raydium_rm67200_disable(struct drm_panel *panel)
>   {
>   	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
> @@ -383,7 +376,6 @@ static const struct drm_panel_funcs raydium_rm67200_funcs = {
>   	.prepare = raydium_rm67200_prepare,
>   	.unprepare = raydium_rm67200_unprepare,
>   	.get_modes = raydium_rm67200_get_modes,
> -	.enable = raydium_rm67200_enable,
>   	.disable = raydium_rm67200_disable,
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
