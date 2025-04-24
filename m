Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056EF244664
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487554; cv=none; b=hyAv0ad2/imLq5Z70VVJY99lwsXaL1dMS56eE0hd61HO6G10azi4DjyLuqv68l+563P5Bjcjkx2yG6FBudUNVtqT3RhnWq8SpnC4ByJJObopkqlGO4EXpoDp75kXE6lYd+odfa8Qoxb4GSNWPMWJLlmMLhoG9zX8dvAzGRf6cqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487554; c=relaxed/simple;
	bh=NGTpgNQSHdqOl5pfWumTYmcWB/J97Ftr+L+Pvvmdr7s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=EJVCdymAPgmOVK2IvHAR1xoo5Toj6IjiVQHdsFpmJ3EUZFeoTGEoIlNNaKMI3PLcWzxN/EXcaIS5EGe+Aa6ksoPYyUDhwZxsXL7eJasylDIbaqWqJHPvQeLL0jd0rnn9Dxubu5LJOKbcqqGntDcmocNDiaoO1u6speAHUlIuqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+CUiHJ7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+CUiHJ7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so5073545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487551; x=1746092351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=N+CUiHJ7Mfu3T1ljXEw2eyEAWLTikbhwxEaXrjew8yo/zdgtX/f9/fDbJ+aGx6OREp
         3JVjhR1Z1F0PNYaRrGK4HRRvYVAZnZlqNz+i7LdfwEREQ6DEVoGAGhvtRnesuluS/3/W
         YprjhVdJ0P8pWFzsWo2OnUSvH3Gt6BjRR/joNFxv6nkx08GwvdB4TyqqYZjW8l72q4RK
         hAo9VIEHYOmF2CNGAcjNBhhkv3hUdSeoHaw+S0WWqurabXNFqoChs6iyywpaUQRxHt/v
         dyNkz5SzHdH1hoIurcUH/c8NMPw+91oemTh+dWedUws7hsBQ2SjOfU+SyWMo/t4yepzE
         nlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487551; x=1746092351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=nzmJg9VkQ8HlkdlaekXDXMfw1jkObNtU51KUmMh24VZCcdnXgCBqoCEGWQ4FV9ufQt
         871QNhf+zOxIznqgMMvX0pegs25VDK2QrbO0U+od4HVRJbYS+cYrDuRvbEUOfIe6OsgE
         3B5AbLhmBH+rX2p3MSaK+HIN+Kpj78aRU84CJqhvA9dqfqosSCT102svO7h9eEoz/NRo
         U7Al74kvYxHiXevf+en4hTobrxOC/IEm9SrKmRvf1tuSObDjfMFhV5UByaSBlhweDfFT
         fRZNWc9+FpFCjJe/f0olwBUBqQMLdfRT57kX2mRLShLPlxMKkOW0P+4j63WHpRPrN811
         Nv/A==
X-Forwarded-Encrypted: i=1; AJvYcCXB8P1O9+QvyCkCzUIv7k4cIHCBTwMFyt51bVXkO28JDCX8F1MIZy7z2g4jTgazxsr504FKR+ENG8lZ7cY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9McWhKT6X7bvb8U2lEYyDXg5LEKJDdkVvG42aGm4Qevo9E9m
	03zPX2ZWgdONXneDNmXXdzwc+M1ZTjj9I3xXXNYvvZduVOy688dku9iyq+nj94g=
X-Gm-Gg: ASbGncvTi2iaIGU1gJVG0iag/wemJFTUWfiu+tyxd1yD9xPmn9p/y8Vij59T+96Zd4I
	hI9dhL+3nYhf9vLj4EbGBTud3jPts/M75+OLPXeacFnBN3ct3ZhYHp38x4+zXFX7AaRbhJ6GnbE
	2Lg9qVFt9oag0yJa9rTwLMT7ba+xpbw5QOkbQ2RhpHPDZKzqGnoYf7NjkeQJy5NXYC7kH3EHHLx
	X9nBDzX6S28YHfxpbm5JYB+dDOamkxr0HzbLptGUxKnJRHW7ROjLVAVYOI5Rq+NICKFBIzeebib
	zS9OQNe85JFSFth6BLgAHyDFemVRB7r9bEBI33/FrD6Pgr7W8gAaRJmRMIWURK/tO38oysgIcO0
	LVYoIdRG7nQq7TWWHVg==
X-Google-Smtp-Source: AGHT+IGtCxdUC1xTXeKfOpcQHvdI3o0HG4SnS9XsPqaKHix8/5R2mY47yF7JotIiZRIK89NFdpuEbQ==
X-Received: by 2002:a05:600c:4fc8:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-4409bd0a445mr15832535e9.1.1745487551324;
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a01cdf59sm2453785e9.33.2025.04.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Message-ID: <3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org>
Date: Thu, 24 Apr 2025 11:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 10:47, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>    meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index ecaf678b23dd..9d5a481b309f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -217,7 +217,7 @@ &sd_emmc_a {
>   	vmmc-supply = <&vddao_3v3>;
>   	vqmmc-supply = <&vddio_boot>;
>   
> -	brcmf: brcmf@1 {
> +	brcmf: wifi@1 {
>   		reg = <1>;
>   		compatible = "brcm,bcm4329-fmac";
>   	};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
