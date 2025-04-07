Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E71B4223
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019797; cv=none; b=GBzxwcd98/Alw75LqqHakgU+GJSXr/iYiirRkbp2CZF73sEBfb3chX9oWpRJ/HCXuxP2ThAcbsVneSuUdvypUOFXhj/4lHmnxhtBFykgV5LA17UpWDPcWEUGQzx5dvPE3Bv2HVYEbfDElREQpTWgZZihaxh3kh6dxWaZiU3H374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019797; c=relaxed/simple;
	bh=z/i/PJ2P127SxiUFDxhEq1kJ/bOlmR7ky+KzWt/n+Rk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QNfSNW+ZQoxaOa3R0c1vPstICD/bJ7MMsM8A3PYblQMGko7Bam8CsQJSScvXJEVvuBcbPh5W8fPeP+PkF/Sip4Q4wT++FhyTo8nGtUBrnB8lvWceTnNw/PrkBsySc/AobDKwjKXY0NJ8IFNJpDxMr7fn7yf7YTiW/G+ioKeQGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnkrK1UE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnkrK1UE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2302130f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744019794; x=1744624594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPyPXdxGGl2k8Sx7xGehlIxRAmU83EBTm5M3zS8a1q8=;
        b=jnkrK1UEYxazxK2f8wgMnb8EIACB/Fg9sjybaU1JKPPHawY0tLqFZ3rMP0QLEW4yfi
         EwZ880czvOtEuMuiu5cg1QsGGQJkenseTQTnBv5WAyujGwtJsm1YJRLcTfqz37Gvu8vf
         8W5xFcss3mWihiGMYCfWILI6tX2r82eC42BCt0h0YAyO6rvcx1fNlAoTDsSX49hHCl23
         dshfLgmzMUnRBds7l6taWAKmZqZPfJnNsPA1VRU4KF9HbYbaC0ByVJr37A5zfcHAQ1Ok
         JFfinGfpVY3UGwPqCi+VgTqxL7YR4qzilawe5DgxSnnMTfbjd4o6cyLV0AiAIJH899Wq
         WClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019794; x=1744624594;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fPyPXdxGGl2k8Sx7xGehlIxRAmU83EBTm5M3zS8a1q8=;
        b=EwPgTiczd++HhLgp4h/h+9F98Wvl/XD0Q1a4BaKWvgZCT38TA31HpR/BZRgFkhKeCL
         FBIy57yx6BW9NdyRyz1LkUDfX4/776ryG/keJcjuAWZ0eG7vyapk7bF/yFNqL/HqErF0
         RTtzfR9aO2hJIYplEDMV6Jn/ixSjkK1YBPzutpQxFv7V/3ClghnEPgYGeBJoShLhEkoB
         FRNjU6hbeikWhKFo2FSWvTDi0rU3XAUodmBkaOVcnzW7mNzgOD3EjDRbQGm41FO3yifK
         Ix64GejDYydEZL1eqOV10/sPrMIeK0aHNRvNWbruV9jQEvAo4nxqO8NBhWwqznere11M
         fXSg==
X-Forwarded-Encrypted: i=1; AJvYcCXmxe93KvwDaBA+mKs4lb6cv7eFq2AR+ah4rMb92hyoJCNUS6vHVWK8Cri9Q0Ge1JMPwY6XxaITCbAKZZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLC54v/LwaP0MI3eN7zniYG+c0CJ8ig8HVpOEMd7CmaBGViJx
	aQ6inzu+V9bSET7ljIXjcwRmq7aM3czbNR97dTVoS6+BTemtpNrAYAMQ1Y5alpQ=
X-Gm-Gg: ASbGncsWv4P+2ZAJsfLlunsiZBI9MN2qEGXfwjoMBODmiqc5A/EC0D1rotqOeFSIZYq
	V+iNq1/dg7BhZVeOrjdvPE0cy+5JeIZHOKRCas81SexcFtMM8v/r3t7CtUx1sQnn2KgqflD32V3
	QRz4OUbXXCobc8/LRsNuLXfrB0hBN1b8b6+ixEo4Qmfm32FYdV3Y6myZ3YfLp4RDFOh2zAgcARw
	mBXT2Pkzw3K4CNqu0rET2Wk8xNt6EkpLNXFeQux5uCqJJ6HLVCN+ly3cI9wyon9CYC5TjH3CPt+
	9qrwsM0Pj35F5PQk7wYItabXoUkECmxIpg2GVjZpqDqcyFCVdqMTO/BeEQ1hF9rdKiTs0vSwn3f
	K1flsFy2WCBiQ1oazWicPEQ==
X-Google-Smtp-Source: AGHT+IFQhv2mqllajCFsgpQFAgQzTAF18B1E7xBsbczO7Q+g0xg5pZyKhOMA/9Xcx2bdgRY1Us/lrg==
X-Received: by 2002:a05:6000:2482:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39cb3575966mr10636477f8f.11.1744019793828;
        Mon, 07 Apr 2025 02:56:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm124644015e9.35.2025.04.07.02.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:56:33 -0700 (PDT)
Message-ID: <2b5d8f63-d888-4f0c-91a3-216ef9d95d19@linaro.org>
Date: Mon, 7 Apr 2025 11:56:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 13/30] panel/jadard-jd9365da-h3: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-13-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-13-260c8a44c56b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> v2: none.
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 7d68a8acfe2ea45a913dff25eb5e9f0663503f08..6b02923de3f0778f45a6f9ce20d70d667772c64c 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -1120,9 +1120,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   	struct jadard *jadard;
>   	int ret;
>   
> -	jadard = devm_kzalloc(&dsi->dev, sizeof(*jadard), GFP_KERNEL);
> -	if (!jadard)
> -		return -ENOMEM;
> +	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);

Wrong alignment

Neil

> +	if (IS_ERR(jadard))
> +		return PTR_ERR(jadard);
>   
>   	desc = of_device_get_match_data(dev);
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> @@ -1148,9 +1149,6 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   		return PTR_ERR(jadard->vccio);
>   	}
>   
> -	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
> -
>   	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to get orientation\n");
> 

