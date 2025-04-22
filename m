Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801F280CE5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329349; cv=none; b=cSD5FsPLeDVB1ohrYTaKskSVOimjDjfmRCpbuZ8zNQC2AoXNgtJhlfAEl9EwtibxfsDUICrIHi3cVPEqTvy7n4KbBZJt9tqzlcMpeuOhe0ot73w3Y2yc9AmnVw83g6R5Q6h91meMbQTwN61OCP7o0VTPte2+1XtKNp/lgZnxcGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329349; c=relaxed/simple;
	bh=hbOVvc/4B+kqOfiu9CA5f99hcrMg6nVlqUgzf4atONE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IAC9YSgwpKIy0HGoUQafZPq+9ZRh2yxRMzbMb+K3olMHjtux4lwsTz7YG9T8SYFn1uaLLBVI2Rg47At5O+4Q1Ls/m8j3nTrpBAl+BSNrnwmao6PCTHn/bF+PaF8+mnySXZxvURVgjhzyIJWJmTsV0SPPZwBTGTrXjWRaouABiI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GN4QwAtA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GN4QwAtA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a064a3e143so341953f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745329345; x=1745934145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezS+UKTt7FTkEKz3yncsIXnl8e/3huKHv0TQIvewvRs=;
        b=GN4QwAtA2XWVN/iEwvor+omBll2Ly5Ciy+NpM/h/sgJTZQ9W+KqSqdQSMzTkfHUIHT
         hfBbWZ6/xjxcfuDBUQOhZ2DUJAYNtE3avWO+vOrxDT709V3U3pHA8QYVEvv2dhSzLP0i
         sx92q2I8s+G6OzvB5kARzboBSNFMrAdm0vMv4xfJPB3DcLBPatxISE7TG0wvz9Oi5aiZ
         IFKgeXxiv/iyLNa46xq0KwcLReZiOSMSGUj8eacPcVbexWu8Y+2lQkS7MZGKBeS4xbcH
         Bii5KU6Dqy53ggkDUwFA1lfChNDC8J50Q5NM7NdYV70iMw3S97utHO3Lawqf0e4UJ6Mh
         4MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329345; x=1745934145;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ezS+UKTt7FTkEKz3yncsIXnl8e/3huKHv0TQIvewvRs=;
        b=uh1HdAq00JTy5uwBiCOrjWAJqg/oKknigODcNrJCMpLXEOnXaPi+cmKonSHVeswane
         ThhCsB4JaGq8X81dq0ox106aRfLOpst/E8vG06um6hhfsYHvp/gVPQ+Uk5PlwKqVobEg
         EXrEkNaoMsXhmPHVZ1ceMjL1NY6LR23cq9Y1dLkzqM4pLLCUg6y6J0+efuNZb02Qs2mu
         cZfRfzLlVe9fe8/gr68YSNdUDPIaNrQioobjC2VisqEDE34riGYh5zAXKRY3RmFQx7IN
         nQBcb//89WxKieln4nhP1FaTJmUwgJpuXP7QDUxXjDYgltCgC17MX4+FazPZFu0U8JNI
         IKaw==
X-Forwarded-Encrypted: i=1; AJvYcCWBkbFC5nHe8lClz4KDYADrasvM534xSlr+QyNnT5ohMCRbNSqFWv+arcd8xo8EK4uJzq0gHF9OfQNNuRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7aiVa3hXczaI+S8RkxZU1avUI1qvoZdE2AfVrOJWuKH90FVl
	k+RZuSFE7DPFXwwTGwxVDsCYyM8kgwxw/82CAad5zpeeUOz7pnN6IxL4fFPtY4Y=
X-Gm-Gg: ASbGncsrhZ0YXePRklU6dWmhW6aIfjVSb1Q8sCuWKymGIDuht7b1pOMbGkkkyFk1ozF
	7kHzatAGKrSOnbJOBSjudXW41FF58E+9LxCUjx6VC5vb5MeRmnZAeoFkDM1Cad+apIEWSC3PEan
	slwMQKrqNwtK1V5GcsHLuefxzU+m/5oRJm3TxusVOkK4HaHatYoXdP6QNAnlSdI7mfGUH8n/4Uc
	d36A1059CgFIjLMCJ8C9Uueq5ozHzBepdOjOg8SGOZfFDr37iC/0NIrxoUudXzrZpcDCK5uwKNG
	OhAvu9S35Z7m2QVf/gJBTFszRR9AX5+YsrNkBBO4J6/XZAm5LoCHHpdE/Dubma9qSipXpw+D9UK
	bBvFgp3b8cag0kq0J+Y3QUJRqUGw1
X-Google-Smtp-Source: AGHT+IGMN+4BR6nL0mLP35BbAdCor169ALVsN+fLM5/TOgtQG6DoOCuPZ5euVFxSFq1TllouoAEn+g==
X-Received: by 2002:a05:6000:186e:b0:39e:f9ca:4359 with SMTP id ffacd0b85a97d-39efba5c0e0mr11633936f8f.30.1745329345611;
        Tue, 22 Apr 2025 06:42:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm15093185f8f.101.2025.04.22.06.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:42:25 -0700 (PDT)
Message-ID: <feb106ef-b735-4b79-999e-0de033d82e3f@linaro.org>
Date: Tue, 22 Apr 2025 15:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The dp->panel_is_modeset is now a write-only field. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
>   2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 82dc4b01806f9728dc882b0128171838e81f21b0..704c6169116eb2601d2ad02dc7294455ceff5460 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -964,9 +964,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * is false, the panel will be unprepared.
>    *
>    * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare. Once
> - * it finishes, it will update dp->panel_is_modeset to reflect the current state
> - * of the panel.
> + * of the panel and either prepare/unprepare the panel based on @prepare.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   				     bool prepare)
> @@ -983,12 +981,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	if (ret)
> -		goto out;
> -
> -	dp->panel_is_modeset = prepare;
> -
> -out:
>   	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
> @@ -1532,7 +1524,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
>   	mutex_init(&dp->panel_lock);
> -	dp->panel_is_modeset = false;
>   
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 774d11574b095b093ddf2818ad5b84be6605c9bf..b679d5b71d276f458d905c936160f107225bc6c5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -170,7 +170,6 @@ struct analogix_dp_device {
>   	bool			psr_supported;
>   
>   	struct mutex		panel_lock;
> -	bool			panel_is_modeset;
>   
>   	struct analogix_dp_plat_data *plat_data;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
