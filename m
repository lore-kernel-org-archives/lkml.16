Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C19253334
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904824; cv=none; b=Pt2UGe5G1IoaHqPcJgJTj7d3TjGbBKAblz3SV/LNzlPayDA29USQEC6SDkSz8Lt+IUDJzqy35W7n/HxSGUFCfwMtFQqjKxyiwheanOOUu1u/yK34ixn3MYFttRggiwtE53ejckQSvSMtNvBjUE+g7ZLJ2hFPQ2GsRElUU4+Lhnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904824; c=relaxed/simple;
	bh=hW8DhRmQLt+7PNyHqQIgbj6TarVq/ro6XL6rQ01jk/c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VBzsAKlhwzYU9+pVApv1mLrkHvfRM5iN3KQcyL6vkt/Sjwwb215Oxdxdg4mpsQ4lz6zNCRvkNgyUueGdkRwR32oRE983n2vClJMMC+0ACRIWzIWdvy/VDlthXxpmc1Atiz0IBO8bul2Y0uY1QAs9r0EC61dhifLGdvIwhG+tF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NMf30haC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NMf30haC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so11369975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904821; x=1745509621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anQWKWRFiVVDUJzraGwpnlX/WovoTh3Ia3dOa/VFF9w=;
        b=NMf30haCYTsI9pIy82WeA/PzjduL7ARYTX4562bWxyDZ4sjTOFVeeDoINjMJTdxaor
         tLlrac6gHE7XmaiG8ctg43Si/fRwJHsmXQ9t4hHyiglLBRvBZAnx6/3lodUSOa5BkYz4
         gaOXhe+sCxQn99CvlIhSuoYe3Z6tHwz9jPASO+QOR8/ago3s/jHKZyxayTccYDb1vpdh
         a682PNsBq5awyA0/t94wkW1s+uo/trSuRY7ldvCIVEgH9n9ghmxD9x/nxTIdbUYzDPlF
         jlvumepJxF1hIfjIMO4o0ePmLQfuAp4ljz23KueRxcZilL0CIHtn6nie8aZTHBqIemrc
         7l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904821; x=1745509621;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=anQWKWRFiVVDUJzraGwpnlX/WovoTh3Ia3dOa/VFF9w=;
        b=gCpF2m3PXpFwVAGjCov3eDNXwBgNP3F/rO597XuW6UfTlkJoveUYuM2uWnxQKHblTj
         xLMBvzsqN5V6vBP+HpZTbsgnZKH4y+ZGLTXNw5jdYnOlENPoN3oemJLxPACLa4Ae5B+Q
         Uupn6gvIUMVWpC2oSAiiABSYu8eNiyLjltXPu6Z91uDyY9KqnEjf9Wdk2xzmXNNDRv40
         QTrtlLqeOsHysHB0T01aHQyR6EksOkR7xouycofyjBx1O3sJqyddd8k18QNx3hTyF/s3
         Fik5nIpS04S2k37w8FOUputGeAWgQtxHBrj3abo7BWb/YAMBikWGMyFW3cOc53wJN4qO
         Hulw==
X-Forwarded-Encrypted: i=1; AJvYcCVVnkaJS1EtoiJe23oCebxl7/3OZePwcBfeozXZHD3qJdg1oueme1wHLow7H3P2qBgde9Ol0nn5ibBPz7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59iE4zxUQ3xIorSA+euGRFefOTFhCFF1iINYkJFm2MCtxKz3q
	Es8T2R3UkHmqpK3ppmNoIuK1eOJpoqmDGZhJFe96g+WsQQIcCd4AUaXmFJiojmU=
X-Gm-Gg: ASbGncuwBMzyTe2Hk1F2eGYte5R4rgrkCf7YZVlO/STdtpbGeuHt9OP5FTaM6AWldXP
	KGAGrmDtb9G9FiRfcRryWdMbh2yPSIj7VR+olgC37zaQKV2VQEOhHdpKQ4JtKZX8EfazFg9os/w
	T1TVVknVR4igorESWcFJlqvqsX9dcQRX2VIuCXjQLYl1DpW1ApNehvPxeUSmVEzPqBTFKGSOGZw
	7qmCfZ6pGGh92Yfdtp0q8Z5+f1/q7BjfiqLUaSZmFUSlT91+uYpi8aG0NxT7VClQHP6qk9Y6OTy
	7wgsUOYFpbcREJIscNijZ90i/MmkTvxbpU1pIT56+CRlnXnMuBSbmBwoNEaO9+lCgwqvaf5DTM+
	ZJe6rHeVvXFkmG7c=
X-Google-Smtp-Source: AGHT+IGMaUh3Zh+gjjizVrvwEl709RDrx64QXefOl9IuZfv8jiedE9zPcg4C+YDL5xN6PNvjm2Ss7Q==
X-Received: by 2002:a05:600c:3b18:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-44062d6cb7emr29226165e9.11.1744904821005;
        Thu, 17 Apr 2025 08:47:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546? ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c661sm20374371f8f.29.2025.04.17.08.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:47:00 -0700 (PDT)
Message-ID: <d16755ba-8a68-46fd-a92c-9404512ae6c2@linaro.org>
Date: Thu, 17 Apr 2025 17:47:00 +0200
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

