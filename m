Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044401607AC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245768; cv=none; b=VB8rQyAKyj/TaaHyKLR9rxbs18zCPGLJ/9eWp9yUb4wz8oLvZJdFHNs3zJ2yTpCjIiWhE1ws6g2lNoKFx9nd6FgOvoM9Qh9Sx4C0ctIDJMNBa4XgZ7nwboeWqP/c1VDk1f/YtL1lVw2q+cpkVXrYu6utuOa+X9hKqj9y9oleg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245768; c=relaxed/simple;
	bh=qaWGdtWWEDWbuAk2OjVRZIF2uXcMsAOUPGyIsxogANQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s25DRvPlNLOMUYvKYohzKGGV+5MHCCIOyp/Wbl0BFsY10zA85aEJ4mTQVaSf9KLx0c6E7gy3ttCEYxc49ySUzLxP8CgfV8NjIKnvx6+YUuSxdeQGUNKY1ifTXPO4Sw2ApRIRLgFyQyAS741JHcSI9oEmT2kINgAYZkfZyQjaa/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E344Hcw/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E344Hcw/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a366843fa6so1167382f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748245765; x=1748850565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h0uQSHhstORVTEbKYqVuq9uAIameHHdgMLaxLpM/tQ=;
        b=E344Hcw/I3MQIwZbL9HYi5u9QEy9UhfSuGO5sK2z3E2hf5Yiow9NgaIc5lPtM0XPei
         fTRzvfu+oWgigN5mr52J3mUiv6AvA6SMD6bgY1F1cSO2Lzepxp1hRBVbkR5+iUyhxJWP
         PuJeeLNX6l1hOFjbYjVCo/3rRumSBiS+8JRZhRbQLBx5cbxsGdYOOxxqSd6l+kCanYHM
         etk57sLX2R1vWRWTcxe6u8Kf31TT/+R6Mm1/ZiaIIB2CqfoVgZ3RFrC93zUTBvulTwDI
         4eOEsTw3M+hIakjv/M9r0nZ1UBldf2a8/Roti77oY+2CB/2vSw8Ld2C/4aK5Ia7DVNvw
         v6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245765; x=1748850565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6h0uQSHhstORVTEbKYqVuq9uAIameHHdgMLaxLpM/tQ=;
        b=pnxrD2a5CJKQ4yNKz6h3z8f6zMSL9614TYs4MY5FfTgX4ddR+1iAq1lvfhvSI5bUHb
         6xSJrSiFGj8YyILVIitLb8pbh0PHZizUwPMhbl4ekexW7qBJIM0GSBcEIYOpSM2QOA7V
         toW+bT3LFFI+GzapVwDIjFVMtJJUZ6+meUiFT2n8Ntzmi/BtpovvvL6Z0AOLvGJ7l3tl
         14SQL50JcwWhOMoHbP6KSz47neYPhRd+eQXGi3tLXmKwitFh59OeYHjPfop3YDd9Ay1E
         3NfyKGeeIw3KI/gewQsJD4bve4loodTc2pYe3ODPeD1ecwhYOwZ/0O6MQmhpzgqiUAy1
         n1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVa4AeaQRt+PrWj08eXjja4+uV+mn5LLp6U65yK3EVErdJUiUFHAQcehlRC5dirns2JVbJl+TbuApLfFOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSz/tRpZE2EV1fLakQUTz+hq+V7L8bDO2DTopyGldW5AOSA9x
	hWXtk22QRwAVJXQP0e+TPy0V2tzKYRMRKn0ts4aUZ2gnsrgRr12qvNb2XGS+njNSkGc=
X-Gm-Gg: ASbGncuHstscbq4oIAX7l7rU7seFl4VnUjhJb0ERimfjRZVBcalhH35dgxTCTrgCkDw
	sHE4yaKie5rbkflEJekl0iey4MBh/SUMxqtFGSQg2hplBprefUWqzXL4nxHKAzYb+w4bqyIQNXO
	APxQds/ad0iFii4BgplZ+Sq4YemVeH1yCDYcpFnSXr+Ljjzs5rELvEJmXPDx71a3rmJLM0AsTUN
	IhFapk0qQ8eGZ6ACUDGsteQTNpfk+JeN0BxWg06kDpuVJES0UyIs9v82Z24RkIWfctkfZ/8oHpO
	3EfsOReDXFOcxzjSxBErrIpWCa1tVp6Cuj8E1ackjE1rFxzK/94xyI0Iriorb8mkOGVZbU7K2Ij
	LgXDXaUsuxclTal2CZb3TxjkLVr/U
X-Google-Smtp-Source: AGHT+IFwn6e9zs2iK8JeOSnEW3hHwjsZM4zOs5Vujf9EUKXgUomiCoAj1Q8i7GhrfTZfdCXNcRPt1Q==
X-Received: by 2002:a05:6000:1a8d:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3a4cb408865mr5600086f8f.8.1748245765248;
        Mon, 26 May 2025 00:49:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm34899073f8f.55.2025.05.26.00.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:49:24 -0700 (PDT)
Message-ID: <fe84a168-a6a7-4663-8c42-e469272b497b@linaro.org>
Date: Mon, 26 May 2025 09:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] phy: phy-snps-eusb2: fix clock imbalance on
 phy_exit()
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-2-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> Make sure to disable all clocks enabled at phy_init() also on
> phy_exit().
> 
> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index b73a1d7e57b3..19af3f99692c 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -504,7 +504,7 @@ static int snps_eusb2_hsphy_exit(struct phy *p)
>   {
>   	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
>   
> -	clk_disable_unprepare(phy->ref_clk);
> +	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
>   
>   	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
