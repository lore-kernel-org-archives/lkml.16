Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FC4204E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245776; cv=none; b=OJrNbAhL96My1YmUMeUWF1gk1t1UJzTjl0ftPzmlq92o2fSMR/s6YlprY6hgmGg1H+ym3+moPYWwhXQ+GUPpKPH0KKr/PYBRK5Rh+EIHEo5niGhrjiO2utheXniXu51sH2f76WycRP23WAdVrXoq6mpz8KZ/XyKXRnPTQEJM8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245776; c=relaxed/simple;
	bh=uc3i1WhQUUkwMMY3yQUDHZw1NsQvbmjAnwg2hbLg+iM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cxzVJHXcudQXmI0+0Jm0iX26Os7nQroNzPsG6inqld3F6zpB6/kxY504xpmwe5EaP+OXmOBODiZUGBWBbi5RTwI1SK+SnJNuTlkj2wH83pSOaScRe4oqUY7aydxX3Zu0esQNw9mKjDKeDsn+a0I/sShBVuFeTlX+4pRd9K4eoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVdIdi4d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVdIdi4d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36748920cso2003210f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748245773; x=1748850573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRUTU1NetmsFrFoWWpkcXRiBW9YN8yoQeAXDLuhOFNA=;
        b=EVdIdi4daG46f9BEnoSfwURVvnssscycbCog2FpCUcEnLOQmGYQY8jKfEcYQJ0lzP8
         S4Vglb++P8sChNb9xjE77E1VcEiPHGXTjrVYhHcRMDfFW+RltMuq8jIvwtBQ3FE6hww1
         gOzCXtZx6cVvjvjs1QC1a1liN7FDQQTtma6u7RVZA9Vrwfbz5rw5bJcDkxHczU0x2/Zf
         adMwBnEWEDUJXmULprBfegLuPSKC+hRV4euQCmnVLd3WDUJ74g6883ci1A5BWo0duF8O
         z83UPIXI5hRcEeOKrmzQ6jdOShMt3YwoN60Kiah3RE0PmTnNH2eoqgbc0pL2EKBtKYOI
         gVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245773; x=1748850573;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uRUTU1NetmsFrFoWWpkcXRiBW9YN8yoQeAXDLuhOFNA=;
        b=Xi3TqYMGPrMs5j8qYZaICcBFAzi4xRRwZl6ky5HgUUOr/fEuOXQBvskEEdN6wOCBkQ
         swHMOllajJPIvd/sfzYioAWExdjEQxs8gV0TdLy97C/f2IVJizQDbEwhQToCp0Fe7344
         qLcdjCGxr87GXduTLMuXDG3ySXYV1xAbqlDt4/2SNVKQMp6LxDV9k71yWXONn3ykD36g
         dv77cq2cyUt/QSh6sksVLFBOFHsUWoeG0DUPkWxawZBATW1GbccPRjHWtM51GAqwhw8P
         nzI8aSUBpq8smVXVarupAD7V0mIr2SmuE9hmTi/aOujRJU80rZUSeWV6o6VoOGo5wXEu
         rMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1kXsfwm4P7ZpKIcLCasAD0Ky3zIfTfe/mwda6aOsMSz2NbBEOkv9rq60APKHuw9r8w5m/yuTz0NzW3hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3TU9HokTr5Yi6P7/lmzE3tyFzW8x1vVr22GzR2H9TJvhPowI
	J3nJ6EEOS20qvRIEvjc8kNuRIVPY7ALH+AjX71pPK50FoNXO2scYw1g/mE1V+gg0otM=
X-Gm-Gg: ASbGncusaZ3HqISvYw859RCvq1ko3HbFoZTq9x0sBwcLUS2BQhkWZLGaaIS1zyaouT5
	Y40nJv6vhwF92UBQiQUzLALBf8h5rsJrw8JBf5BU1fP/2jsVaGgqXPGUfFwDboXo6Ham7n8xSkK
	+GQ7pQd8H52Kmq5itklM6Af4w83YV+AHvIMq2WtLclnX3ck1XcYHvLq3qQ/cwmDSlfRRhopMqFV
	kL/Imn1De//c37AhY8uWWwTJ2r1yO0gpVdCGxxwSawJ6cMbBQyEMWHVJK4eE6qpkYUkPdQx9aeo
	SduA+cwdeHLGWFOs7tkoOJREofFUEKgnKjFtYsHv3TzxM4pAwXLnsdbhTvWEMZ+60ImChkrtUdQ
	+eGuPRQkcrC7plXMGaBmhynCoG1su
X-Google-Smtp-Source: AGHT+IGY0fzSwOzvu/t5G721cP6pa2lSOTELMsSGevJGpoz3wocXRKDBG0SQoxtENkHGJLPrEEcAkg==
X-Received: by 2002:a05:6000:258a:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a4cb43dbe5mr6053731f8f.8.1748245773190;
        Mon, 26 May 2025 00:49:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb7fsm224254685e9.26.2025.05.26.00.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:49:32 -0700 (PDT)
Message-ID: <848ada30-37d7-4890-834a-4de91b215ff0@linaro.org>
Date: Mon, 26 May 2025 09:49:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/7] phy: phy-snps-eusb2: fix repeater imbalance on
 phy_init() failure
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-3-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> Make sure to disable the repeater PHY also on phy_init() failure.
> 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 19af3f99692c..a799c3d2bcfb 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -468,7 +468,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
>   	if (ret) {
>   		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
> -		goto disable_vreg;
> +		goto exit_repeater;
>   	}
>   
>   	ret = reset_control_assert(phy->phy_reset);
> @@ -493,7 +493,8 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   
>   disable_ref_clk:
>   	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
> -
> +exit_repeater:
> +	phy_exit(phy->repeater);
>   disable_vreg:
>   	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
