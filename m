Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F352417F8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681883; cv=none; b=UVvCp9XVz57CZkl6Tk0DZ77zI83+En4QprRFIBkBvnV6zLZBgRjWO9In+ByjQrwjtLLT/G54fBtS87qO72732I0OSeHjM13VKhN/suLKmsO6pe1CdU+6Nqn8dZlHkXKZs+AshJi5M/c6t4bz4jA/pLNVH2cVrn/uqXLmchRq1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681883; c=relaxed/simple;
	bh=ND5F3RDhEWd8TAnZEx6zV7rgCBZhQ1SX09oMmDbWDDg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PkWsthk8qHDB44zZbSsv7MVGgF2BO+1WuCK4oMpyi5Y76JIGcSwUktD+io7+k7vQzAWVx9nWJNGzDWu0gDKUCuWPvLCHdI6czUPRSfzBsakmJuyBELJ4nFs2R9ji+S/PdxkrII2td6xAFD1p4x+eqTwFp+ULQqMX1qk6oYcg/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8cM5Vu6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8cM5Vu6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2290047f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681880; x=1751286680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoE9tAaWc9b9sN9LvIzsMZa1+Hj5pdYfOB30Om4GhJw=;
        b=O8cM5Vu6HB/UXLWfDvGwZtvIpqGiLVg7HHPdJPX5MYFZzc206K9yCLhZRmreenBAEd
         IXbTkZyz64hU9dkv6UN2RP3jrflyf9nlexnjSFGbV+fCmC3MrmPitxyk4QIvKNRDMHW7
         VwHNsG+6ApzOzDLJHSPjXOZ6ZDIoFugI5RcdaGoI6j2rsI9rs7jCX7whrIq++Z3kfcWs
         cxLkSTXhdZwuLI/vcFdRQ+R3D01AP6ia6FzGptidm8wtklFw0UItqKgK+BG9jlXfMibI
         RJ9A3UBqGKzdTcl5pjW1vfB96oTvpVxoWggWgv+X065Obi++aFXWmAuCaPoCQJpM49NC
         50OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681880; x=1751286680;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qoE9tAaWc9b9sN9LvIzsMZa1+Hj5pdYfOB30Om4GhJw=;
        b=qJA3tyvT7k3OHzU4NSYp3t7jwNdnLgv+Bl/sp3pVM9Sr/r8/R3bYgXe+L9x5j7Dlmb
         WN+Nzh1M0IBtgi/08cCB8z4136j3VM4AK8fD4ln11T4VSK5M+7xZm2TPF5gsrCxXB8Kz
         E8P/E4zYDtJQ48ha9odAQssYC3uHduSR3GPpMCxmC/bmyClryTcZNhkqMBePnRpyQS0C
         xk4MsCKNOXIhAy/LqH4cmmfr/R+EmQOBG0e0vOc9WQp9KF7Og2hlqpqqEfjpX8VnK7TD
         8RPgluYjS+C2ZCF0MiZ9s+7xqKvIktUw6ZPYUamv7oMQ/qo0sVaQOrUKE1Rg2+5yjCQg
         U/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDJB76T0RX7iijVTHIUQMI9Pptq3wkcsGis182fnzXXv2/JCtP6KmZVYWAYpfMoVwmO8ZaVbIqwij7W1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSWEhAlYTgcRQd0S59TRz0KcoII5W1bq/LyqQzh3ZufhXCXX9
	qZvhbQttq0U90pP6cAMx4vjYBSygFXcqCCRo4ipCupif3Z0AU7VFwPDwuusasw1hEnM=
X-Gm-Gg: ASbGnctdtAJtQDZKrsAKSb7h7owqIaTjyLvTwVatxqZYXNI6Y1V5JA+DMsl8JC0+M4z
	ywuVFXGAIvxuQZCSkHwWeYdAqGEbuDJ/eUUDhh8gv3K9y9dXKwtavEWahhP/VA0k5KUoaWLtLkH
	zWk+mWiUQH8fHD0Z98NtT3JYarWWuT1Pgjsy7OtAB4Cpj1pUV+MG4nCIFC8iBFRNu+SzVymg9WI
	XlOKEVVNFjlSf94A61wEAoP8lnphNZVbQukw81YEgU7GnidO9irdAwWrw9A9bARt76H5luEjqjA
	nyMfOAx3zY7RcyAKu3xm29BT3SOsF3Pw11oIH/5olxmJ8Sg6txNUDsa5QYekseOlLvWgIgfN9qg
	fyZ7D8EjhXMKyXbXHhugId5ZPQuOZypXuCI0Fxqw=
X-Google-Smtp-Source: AGHT+IGrnHR5HjuNNGYN2h4NQHfR9oLkgLDNygJjRDuk6P9puAV/nK1lNVJbr/+wKFuw9QwtD+0/Zg==
X-Received: by 2002:a05:6000:3ca:b0:3a4:fa6a:9189 with SMTP id ffacd0b85a97d-3a6d1322bb1mr10321158f8f.31.1750681880283;
        Mon, 23 Jun 2025 05:31:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18207sm9432462f8f.30.2025.06.23.05.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:31:19 -0700 (PDT)
Message-ID: <0c99fe5c-f908-4d78-acb3-d6bc128c9f26@linaro.org>
Date: Mon, 23 Jun 2025 14:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
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
In-Reply-To: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2025 17:52, Dmitry Baryshkov wrote:
> Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
> Fix assignment of the of_node of the parent to aux bridge").
> 
> The assignment of the of_node to the aux HPD bridge needs to mark the
> of_node as reused, otherwise driver core will attempt to bind resources
> like pinctrl, which is going to fail as corresponding pins are already
> marked as used by the parent device.
> Fix that by using the device_set_of_node_from_dev() helper instead of
> assigning it directly.
> 
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..af6f79793407f400b57f945fc958d613155417ea 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -64,10 +64,11 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
>   	adev->id = ret;
>   	adev->name = "dp_hpd_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_hpd_bridge_release;
>   	adev->dev.platform_data = of_node_get(np);
>   
> +	device_set_of_node_from_dev(&adev->dev, parent);
> +
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {
>   		of_node_put(adev->dev.platform_data);
> 
> ---
> base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
> change-id: 20250608-fix-aud-hpd-bridge-97ec55341c4c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
