Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6710E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725599; cv=none; b=BatckzjWFAmCp/+6QGtpEGykCfSZBvAyVD7tsgvGXgrSm1+MNQ3FdgfSpnp2S+sXRDWyT+T370sah6wXyXzwkYYXu58vfc/ueE291yCrGOIrmPT+VsRgZyPzWooLXGQlz6k3zuvyp+wCBLmKPhHVmlivGU1Zu4iS2eIRFehDZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725599; c=relaxed/simple;
	bh=DVbludbWsr7DL5dR+0RMWG4gZxCOZqp/ijZj7TVbvxI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L/pgwlnoZCwsmQqb0qwJB60GhiVdVGnkc4FPKa2EbDaWCaBizWwM0NHieFjAVwp+aa38QUqJ9y6bI1SalPNl+v8Hw1ilgOVN+nmof6rwK1kU+a8KVLzqLwYrdnMQ5UfaTbZSaVagvGSVdg0zWMn68p5jJiBQi4A1hfbBzd8bjD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioE13PFW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioE13PFW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so57888135e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747725595; x=1748330395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrzFoxLHFMtpD5f0JYG/xNNGE+0bd6VyS7moHsbEFaQ=;
        b=ioE13PFWH53RDH8ywdKqCOSWoni5vMxSQZ6E0JPLMOEKzoSeHu9YuftolxXD9FtUGx
         E3Yv1eg+E4SXbACm/XeijXxXuGnJ55w8tMpXLUJjDsd3uzQqGQpCbJ3uVLBFkdpLMMJH
         LAvoIgA0ah8X69aKP8P/KZcHvjO0LNkXjTDXl6lSL42wQBDxbHu8dnx5jc62VI2yfbKg
         xX5rVP4B1p3LofiA+I5NVnVA0+gb6xdJ7G0e+QdbU0lOs6rxXGtoMDE3S9anGqKYYNs3
         5duM8Rw5Ur+xeOjkBUKdxiAkwqnR2QZJSSjFkxduJpCzyI99Bi1ss06xomILRovTfglY
         om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725595; x=1748330395;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KrzFoxLHFMtpD5f0JYG/xNNGE+0bd6VyS7moHsbEFaQ=;
        b=f3SncSmkbOpgaZ/BoKu30UM2eh5aXweydzdB7eHGT0d20P+UOyfAba0YnjD2bodaSa
         w8yanKETgdNSyZt8I8BcoSvlvSyiqIvd6bVqVIXJLXZRhSe55k8UXqokAB2bdXB86gsA
         nnKcHjuc5CnrkV1zcvW1fqv4yMtYp3LpsldAuqqWEPddhLj6R++LfRrSFjWCqZY10Iog
         YaH2/rq99ZLBuphNU/scbY9eN32T/y/2shOTXlnXuJbMYBPk1OxbFps9ZfbvCrwbksiT
         FSj99pc7ZWXjzO7IJvyUeRu75LIJ13djXltAdQ1zufSMknYAhWwqSm8a+GHSuwcTOJ23
         iF5A==
X-Forwarded-Encrypted: i=1; AJvYcCWX46V636zO6iraJOLnTGcQnPpxBG12oxAZvVvvRl17FnOAQW+XPZU+2n0Etn1FDIjLQDgEgWMIr9EgLW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYh2kiCRxiJAiY/qhGSf8cHQKARmYlK7uUmyShwlowMTCHYwJT
	D7bzDgknmzJX/WqCiE69O2pUPaTiHs5seXwwZdVUFCOPENekaDiftLVlZFkhHcDeAGA=
X-Gm-Gg: ASbGncv/z3P36cmxyD4ogAGRgZ15HSkNCMhnt1J85fWEA0XVW8T/bCuisJBLabp99x4
	kDwUpLWbIWVVGdogzWplLjueLLIh3qLly5eKqySnelmT0TdcSnLWXecFax50tUzHnQCEgls4Okf
	/sVwexshJFqFmQADvwNSjj2bFfzes577T2Ffx+JwGhrttGETON40tjXEylJarNesjMCNXGUmzL9
	G0i2vQLorKZTiC+Z1uto8BQQFKT1x8XKwvkhcCmt+9soY1o0KRlFNtJH5OUZEQimaT0wh8Rzd4M
	u9UfI8X1PFwtvOB00v25Mx6fls2T7/Gba7A8LMBh0aJtyD+nOqm2tN5pnNiLU7oGo0CJ4yQGmCH
	Xhe++SLPVy8naEVwcDtzq6XKuGZyT
X-Google-Smtp-Source: AGHT+IHiApHaQJ4HFVBUIlA5T8VIa8bCmFRMDdvIVfP4Qk5/4i3Sipi25obZe09eKCMes1lvmIHC3Q==
X-Received: by 2002:a05:600c:5026:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-442fd60a4eemr135516505e9.6.1747725595393;
        Tue, 20 May 2025 00:19:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ffaa75cfsm91300275e9.1.2025.05.20.00.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:19:55 -0700 (PDT)
Message-ID: <228f4064-6e6b-487b-b599-e8f65e3d8506@linaro.org>
Date: Tue, 20 May 2025 09:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from
 struct ili9341
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 15:33, Andy Shevchenko wrote:
> struct device *dev from struct ili9341 is not used anywhere, remove it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index ff39f5dd4097..2b5bd83933e3 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -173,7 +173,6 @@ struct ili9341_config {
>   };
>   
>   struct ili9341 {
> -	struct device *dev;
>   	const struct ili9341_config *conf;
>   	struct drm_panel panel;
>   	struct gpio_desc *reset_gpio;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
