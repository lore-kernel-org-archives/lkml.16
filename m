Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9351E5213
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248079; cv=none; b=CQIF00WoIqeR1jBjAvt7fJE0WUv9/IWgYVmKZ8rDQLWt2ILMrM/p9RWyHLocaPwYrEiSLEGcFuKAVjfnROu7rCO4Yq1qIlBiG3f65hEeFBH9R36PhuzslkDzgLd1L7nshHUaUEXnn1P5VSAKBUNnr6YbSPBSCROpFXKyRckeKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248079; c=relaxed/simple;
	bh=tvR5PRn7x4LAHfOEndwVRZgDVfRb/y/8vcNMeiIGbLg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jKVA+4v1jH/ko4QHo/0Epsdt88Lr4x/kTF99eboDmbOyQdq/jg6h/K9YtxOilsxYtPraIp+cG/hLQ5DtAafZXHpiTkggBaGpwAHpAd60fKRaHdI+n6DxvU2ar9/jx9IwFp1Ie4pyCAkpwyxqnZyylHZUtMpZo6RAinww05OoOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD1ATx9u; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD1ATx9u"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a374f727dbso1810287f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248076; x=1748852876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5G6tpDiyouJsVacd8rEiVDib8LJf2JZCq2348YM5t4Y=;
        b=dD1ATx9uNOXg0G2Wca75EJtmaD9FLTsAihnnyap91eUAD0rylw8ogw08JHI/mnuqlg
         uvmBZnXDahwjucrY4uOiFaVbTADmBTVsruTdPGS4ayb0JNcMoVuzzhdUdvC5h6rSrw3P
         MB1xNc1P7KO/x/lrzRqM2E+mBPM3DAAkdEPjTyQzJY+uV3Jxp1bCdk3gdk2P+ysi7fZZ
         Enz0A6GNfGJkIoykJAmkEwz0uY0QyVy/tLP5qPnXs7ZdM+PLyVih6y+mCwxQtmldNkxO
         RyTLHEIpiW6L0u9kwWzOi6uPvxn1l+LEKh5fGGFG0Ewk+thvjKLWqiESlSLJUyuvyaJY
         Cb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248076; x=1748852876;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5G6tpDiyouJsVacd8rEiVDib8LJf2JZCq2348YM5t4Y=;
        b=EIVx4ncwTKNyNaIyokg4OA7nEMvRTahWLdim0k88XsgC0vjz8CqIxZWi+Xy2oq30p3
         Sihg97NGzL2Cw/RRI+Fn3+k4f8I0X6QRIoTj5mDgqwoUVQdkSfuedQM0qs5Edczz6d8E
         PeZygrVWbo8IPBeXaxi8suvBCDAB9CkXvFyfaxEHUUG0ssW28HUFBKorF24hWVWDT/Eb
         yBSieDhl+4TSX8CfEB4J76hAowrLiG98uNrr/Kj0TYniXvufpc/gXegcvCb6vnDUz4m8
         KS9+FPYJgr7tTLX51ptheEZSrJhnirh5rvJONis6Aguj6hFBbeNfLwnaGLhG85O4jj/6
         uXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWU3v6vFMnV7A5bxfdcQOOZFmoWvyHIH5DvC/JH7PsJSSqMfBPCq5AJllrhUzIy84lxDwCG/nLrxve+ar4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5rKSv+OjlI0HDvPLYNpmh57moa8NKYO238Dp5po7vGxhVUJd
	Y/ALozN0Hlrj6Rg2Nn6Kr6X8YyMhCyn67QuWrGJzNCoX+HojpP46eEVgIcUbWWGO0Vc=
X-Gm-Gg: ASbGncs0NOKyU1n1FmCifS1AhOE0PSyp+xHYoGY0eGcx/MLX7tP8k60HhLMscTucSEh
	/haQZKcljLdp/n0slYGUmNAp5IhRNMaY4QCbywBMZhnMYmT3GN8IPG+fUnYYfQ0bMqvzezMRrvC
	ZiqBrXOujo0oSN7NcyBViuc70q+1j9K4kL8c2eMY9LFlxuyLCfHnLOCLIawPpN5IJWtXATOeE1u
	rBpVcdRpSegWu8F2znjVG0bqd/NJo+dmwSb8l2rr4JvzBlNJQFC+1Y7TcyTWl+wDRcLOmgEzt/K
	K6jm9bRkGVK60Z9gl+Clmie7bkFynKUWAXEKJSqCIAEejX0EUiqq7x8PvL3+X6EkMAgo59UruWM
	NasPzzQTN6m9HMuiP9SV4R9Ij3eRC
X-Google-Smtp-Source: AGHT+IFywaZ7WQt9f4W28PM6YKq+YZunMKGH51H/mKJNCRL7k6NgtNSZnnr6EgePKY0RqirHPggd6w==
X-Received: by 2002:a05:6000:18ad:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a4d994bfa2mr1808284f8f.1.1748248075922;
        Mon, 26 May 2025 01:27:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c5360a13sm9086499f8f.96.2025.05.26.01.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:27:55 -0700 (PDT)
Message-ID: <178d1344-6c0e-4500-b26f-151e57ae9a34@linaro.org>
Date: Mon, 26 May 2025 10:27:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/7] phy: phy-snps-eusb2: drop unnecessary loop index
 declarations
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-7-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> There is already a loop index variable declared at function scope so
> drop the unnecessary overloaded loop declarations.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 328e67ebfe03..c67712bd8bba 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -552,7 +552,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>   	if (!phy->clks)
>   		return -ENOMEM;
>   
> -	for (int i = 0; i < phy->data->num_clks; ++i)
> +	for (i = 0; i < phy->data->num_clks; ++i)
>   		phy->clks[i].id = phy->data->clk_names[i];
>   
>   	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
> @@ -561,7 +561,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>   				     "failed to get phy clock(s)\n");
>   
>   	phy->ref_clk = NULL;
> -	for (int i = 0; i < phy->data->num_clks; ++i) {
> +	for (i = 0; i < phy->data->num_clks; ++i) {
>   		if (!strcmp(phy->clks[i].id, "ref")) {
>   			phy->ref_clk = phy->clks[i].clk;
>   			break;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
