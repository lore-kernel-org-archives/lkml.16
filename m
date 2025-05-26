Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4894204E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245813; cv=none; b=hYrfVhvlgLrV3fjMD4TkdpP8nKm8Z4SBrHS/B0myqUAntwP5hQ4cJymQSdKtoVKvybZzkhEAI7qn04zC+vLvrN4B1Cq3dAGytXCwSvHXO7zll033XiMDyYdw8QnOpCFmqGzev34wc1ue8ChTr1jsdz2hdCCxEnzb/ABHmFlFsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245813; c=relaxed/simple;
	bh=xFLY31dxkf/JJEPmjQh4uECytDTloz/dZP17HYOyk5Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KAMuG3edbsxm7EgTJB7db/TkfqJSq7VVxs1yWuTaRtzZxtfTAu9K++GBmhigR2htGGhzKVI7Xl/EJd2cmWsCrsDC0XC+rw421K86XqOtr3GEcRqk4mXYjJYVWXuyalOCEvOlssOPiPokzjB6LUhFM6adWJtoMvRecWNoMdL6IcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vx5rNZXb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vx5rNZXb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so16028165e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748245810; x=1748850610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s2TD6bDYSb15QeqSffpz33dcHGJGRttLHbdrFUHcio=;
        b=Vx5rNZXbn8F5HPZnTz+lNb4Dis+iDRP6pQMQjU3D20j3D9CgMEdP5XEHvMRLYNfUUn
         Qzll5TRfvwbMwb/ZDHQrtjqysNpIdjEYtLGoVI+NUL2sIO95hCab6pML/ipitfVVeyWH
         LByNBLIsoFwpPWw3vGOOI2fpNLZ4tfEzFl3j+YHN3EUKFjieXE/i47FgfwG54SwKeUk5
         vLU0KKAaCLWr9CDCbYxPyAdSm+nshPgiEP/Kqk0LIZjwOreQidt+xEJzOp5o2YaDj2BN
         BU2lCB3qOnNYOxFEQ1HPVy5m+midn5lVWIJdgAQSsSSEfilZHp+kqUVIXevdofxPSrtT
         XuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245810; x=1748850610;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7s2TD6bDYSb15QeqSffpz33dcHGJGRttLHbdrFUHcio=;
        b=kXQg+LeXAUJzOpAer2pFF39SpTJChr7mx+3a2ICo/NERlpEjpTEs2X5IMvOFdkJjlF
         oqp8SDGfcUqbP7JmVbt54R8e/KPgjtG+C3MZ9/LPqiG7f66Ma/2Lh47xjSlR0YPw5HSN
         BSy+uczktsB50ifItxxPFmZFYuq9n80uqLmHaMiYkmh5ONfv7PWdjlfPKFTisEwnY7eb
         7EuNe2reJWqkGjuoXBzaszDmZ3izdM19Gn4XVb+yZUmuqzAQuMfcDjxT7Py5NjDhs3tG
         CMX5JLBZDJID8iwMl0spV+OhVEYSvgmlHlAdrm5VQujvO5sdZ6tVT91vwutzygYVH8jx
         6lkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWQB4dVQonsC43RCTGLa42bhvVs1e2Em3witZxwEfWrk3qTpkZ963WHvRc6bT4WTTU7Ld7NcM95DGUg1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmtl5K85m+Y2Mrxbr0RW3Z+QMAyi39b4Q63/BtWWopeidABZDf
	cbw6gm7EMb39JeAtReGzWoHDq0rJHw8Wym7KzvYqHNby7qdqeyJb7oHDYw/0kH4WDHSqMn30T3X
	iRL9l
X-Gm-Gg: ASbGncuCcgbbuKGyIIUyuBsGbkk9eW3Z1F+sRwEHGSzTKNo2vMZnLkSj5PhhRb8X5zK
	2U2WBLNPm8IvfkoK6Of0jSWYI6jwg466kTZCPj5MRKCYngotywIItf+hkrdSjk8vBJlLdyhmBnV
	9WXkKro9T8l4mCJzlGVme8wcdxtaezrzOfln22pwqjl9LcIaQUPlBlNl3hb0I6zgfJndhp2N3Ey
	la7b2+fdhgcakdETw4d0uVCbf7oetdjnx8t/CaxLLPeA9wMF0/JFS2CX9QqNdmSsLITqs+V+PkE
	98oSEFnP5VHsCdTlEhKjK9uqY38QMMhBx6MmAbVoRjPLiO/nngYq2twYxWYObbZLe6zpyknxgJK
	TCFyzxzlutrA5Do2KFNJ3L+axLZIfOxkWZ9SviHE=
X-Google-Smtp-Source: AGHT+IHVWT68ZiYLEJCf/N+WMc0R3baXtGAcc1HRtOWNhQ5KgUM9rath+/pJxLrpBJVB1YAClPqo2w==
X-Received: by 2002:a05:6000:3111:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-3a4cb445323mr6181832f8f.9.1748245810012;
        Mon, 26 May 2025 00:50:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ce458830sm6439665f8f.14.2025.05.26.00.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:50:09 -0700 (PDT)
Message-ID: <00f6b550-d5e0-498e-82a1-68b0925efb02@linaro.org>
Date: Mon, 26 May 2025 09:50:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/7] phy: phy-snps-eusb2: clean up error messages
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-5-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> Clean up the error messages by using a consistent format with a colon
> followed by a space and an errno (or unsupported frequency).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index c8f14f8fb9ac..232c5e8a554f 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -256,7 +256,7 @@ static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
>   	}
>   
>   	if (!config) {
> -		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
> +		dev_err(&phy->phy->dev, "unsupported ref_clk_freq: %lu\n", ref_clk_freq);
>   		return -EINVAL;
>   	}
>   
> @@ -293,7 +293,7 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
>   	}
>   
>   	if (!config) {
> -		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
> +		dev_err(&phy->phy->dev, "unsupported ref_clk_freq: %lu\n", ref_clk_freq);
>   		return -EINVAL;
>   	}
>   
> @@ -461,19 +461,19 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   
>   	ret = phy_init(phy->repeater);
>   	if (ret) {
> -		dev_err(&p->dev, "repeater init failed. %d\n", ret);
> +		dev_err(&p->dev, "repeater init failed: %d\n", ret);
>   		goto disable_vreg;
>   	}
>   
>   	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
>   	if (ret) {
> -		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
> +		dev_err(&p->dev, "failed to enable ref clock: %d\n", ret);
>   		goto exit_repeater;
>   	}
>   
>   	ret = reset_control_assert(phy->phy_reset);
>   	if (ret) {
> -		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
> +		dev_err(&p->dev, "failed to assert phy_reset: %d\n", ret);
>   		goto disable_clks;
>   	}
>   
> @@ -481,7 +481,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   
>   	ret = reset_control_deassert(phy->phy_reset);
>   	if (ret) {
> -		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
> +		dev_err(&p->dev, "failed to de-assert phy_reset: %d\n", ret);
>   		goto disable_clks;
>   	}
>   
> @@ -588,7 +588,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>   
>   	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
>   	if (IS_ERR(generic_phy)) {
> -		dev_err(dev, "failed to create phy %d\n", ret);
> +		dev_err(dev, "failed to create phy: %d\n", ret);
>   		return PTR_ERR(generic_phy);
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
