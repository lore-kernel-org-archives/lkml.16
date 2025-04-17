Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CC1D0F5A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904770; cv=none; b=jszur+jX6Awb8iO05X9b+QLHgFfoz+B+0uzJGSht1QID+goH9/UB11d4T6oyvjfvacMF8MdJopYxxHJ5eeP6P/penprV4F0Q/X9uI2F9gxe9ye9i8+ogVWzdxB1KoDX3/VVIUfSAMI/iAcku8b7yyiTO7fLolVGdpUuyo01eMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904770; c=relaxed/simple;
	bh=DnH/RuyvJIXlNHHXxsklx/LjvPnAQP2uAfrKvQfc9xc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gGs+7XHGLvbcEy7Fq4hpYZDK5ujz+bCnmy1wIh7kegGslrMbIlGP7hGZnmOBwATSnZtiN7GdFmK1WJ+k1vRmI17A6hpwa/BeM4KjRVhRzEEJIuXgRC9HKY15BIbqCW9DTkbZmUMQJ70VzRRU3mrtrUb+AL1Dot7cxhPSPVHe2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhbu2WJz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhbu2WJz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so676762f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904767; x=1745509567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jF2Ywy9a4a1q4ukuAIcEGtnLsfiX39uzNX7jMdpR5E=;
        b=rhbu2WJzNmNlOAR00p2Gma9kAAdtULvkE7X2npDECKzwRyDc/j6YyImE3/+xvD+UJV
         LdBkpPZOIlx4VOzI2bs5zvq6WsWrRLVt+Q+AAhK4j6VdXsf++BlMkSJW6RPYVx+dPJlQ
         g9xEsqc5rnILD4gMY2tY3KP8efYvzgmOFzLpFsUgESchjUXJRdAmggapsm5rmY8jhmHl
         Ok0kfdVUdjMJLpP2FA8qf5Tbr15eHo+nL4NJQf95VJHB3lTFMGKe41bdPNXElTKRY42X
         JAFYFEDiPglDzIV6Sde89UlwFWRcDZGgGAdSTOXE0jHjBbLsxhvG75+L/PQjddCPSToG
         uVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904767; x=1745509567;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9jF2Ywy9a4a1q4ukuAIcEGtnLsfiX39uzNX7jMdpR5E=;
        b=WVhj5a6gOV08bgk0utZ6bKDAhvIkdbt6vxg6QI44p8+uzq4s7DmSvFioxtkA902j1q
         YfQXel66nt97y+jSOxpAF0CUaMhENC519bM2oJRCrhyqLwaaWvLhDDfBEfEjm1nuvfmi
         g32OmTIYEajpcEcq83d3ShXIoQj1AG7EFPEva3jT7PMV2ieei7uN4MgoQFT7meGoRo34
         Y/H7AL9YHJdaC5a7GnEHdfMrpLXmRDktoZpcwzCpZzyzFsKocsTjUY8XqYCaRCU/C1zK
         kvu4LxgCGAMXdbBfg/SBCc/IWGDKobkuXicwQRY8TNNeu6a8dx8cLODmKoML24WfclcG
         HLUw==
X-Forwarded-Encrypted: i=1; AJvYcCUZMIXoBplgwGPzyombSz8HBYOCbRC1zExxit3nQoQ4nQld5HGP6CTwTa2c5dygqpzb134udYTarCQBLPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRfLensl93QCGVv93xzwP7g6hVqDjfxHFgP8+OHKZ5gOJTY4uN
	Hhv7/QlkEj3jZwjiW3eWhAUrJY0X64gSg9NqHCusdHFTUp0KP7AgN+hVdmJnJls=
X-Gm-Gg: ASbGncvzfDl3hdl8BeP2+nkEEtxfAhtSs+K7nco8HT5jdJ4wPgyFMe8aSpfANfQ35G/
	ltJfBjqRsby1wZHTvkOjVoqRC9sCnDIcKlbumsKqUdt69wFz4sHRZAQzLFyGXYi24tUrL1xxndF
	uEzOc5BMNY+yrktCtqsioN4Qdj5lfUh/NcsHsIvJzOW16vnZZ7R14PVxDbXXN3eYiihPtc8DdcG
	raTlLio1pFhrxEi6CBf9m432koXYrRzhflcFqkdSFaVao2qgGm8jD8Yw+BzuvMMzMMPRTyJYsj4
	+8fgKYnc0WZSnlP64aSKRP85yG4y+WjUXRZdoOz1xMj2hFXanQ3KCsMcaNfojWsSr9qQquSZ3DZ
	6TYOYLATi7GO5dA8=
X-Google-Smtp-Source: AGHT+IHRa7u02VkiQVcOWbuErq1tBT4tuIRQemO4n8RrVbPAasOmBAb0aJuMUrhX45vEZidLeDC7Aw==
X-Received: by 2002:a05:6000:2503:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-39ee5bae695mr5575888f8f.51.1744904766709;
        Thu, 17 Apr 2025 08:46:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546? ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979835sm20849959f8f.57.2025.04.17.08.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:46:06 -0700 (PDT)
Message-ID: <1204ed65-c1c4-4bb9-b99b-262aa7593e19@linaro.org>
Date: Thu, 17 Apr 2025 17:46:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
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
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() returns immediately if there is no
> attached panel. Drop several calls to this function which are performed
> when dp->plat_data->panel is NULL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +---------------------
>   1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	const struct drm_edid *drm_edid;
> -	int ret, num_modes = 0;
> +	int num_modes = 0;
>   
>   	if (dp->plat_data->panel) {
>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
>   	} else {
> -		ret = analogix_dp_prepare_panel(dp, true, false);
> -		if (ret) {
> -			DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -			return 0;
> -		}
> -
>   		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>   
>   		drm_edid_connector_update(&dp->connector, drm_edid);
> @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   			num_modes += drm_edid_connector_add_modes(&dp->connector);
>   			drm_edid_free(drm_edid);
>   		}
> -
> -		ret = analogix_dp_prepare_panel(dp, false, false);
> -		if (ret)
> -			DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>   	}
>   
>   	if (dp->plat_data->get_modes)
> @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -		return connector_status_disconnected;
> -	}
> -
>   	if (!analogix_dp_detect_hpd(dp))
>   		status = connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, false, false);
> -	if (ret)
> -		DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> -
>   	return status;
>   }
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
