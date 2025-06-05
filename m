Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AF1F1515
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148154; cv=none; b=Bn1DrZu0KtM00xFgHBYDn0tniOpLrKQfBweSfltw9/lNiLybLLuFqeD0qkwcIAv+tUShLqCsO94691RlAbWl+zC9/5IR/tJR2CfRj8Qqcv1tNaXzv5NhQ4hrJ+uUMpWmNsl6GYFdhaI6Py6BzqntyeHr4qQ94wilgEJH8xUOaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148154; c=relaxed/simple;
	bh=Wt5KC8ZNvg182Wq6/9VX19wy9cgLmZ7fK+da71TzJsg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=tl7gtGgi5YIIdULTo3Fde/On08hjXxpqVfG+0EBAqHsbLkU4kK3HhlgjAR2ZNRehVSd/MQv3DF90K17NtbKvtQ5NvBpG67vBJd002scFuheHr+rfZj3nfa1d6TTFE1Iz70gGU/b99StDOeK4ohPHIxnIEctFrYQnj9Why6pNnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExEl+NRy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExEl+NRy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so11649025e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749148148; x=1749752948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzQU0GYDCtvjDaFcIIDQKTVpPe5cNm+Sh+k7f14x/ac=;
        b=ExEl+NRywFLDK79RcL+C5tiWm9ZKaYeYIjQ00Kql5apoHOt78HFNJDN8s/5+LLWSUW
         qmy26XuOtHKBe+YdTPzvECde6K5WUPupOAbP049dIUEKICxYYl9BJX+YaCyvpbQZ/vt3
         V5GXXh0Jj9j/KmEmLu9xDDVbaXKF5qiV+KFvp0siZxsfudlMApfmeBOCoM2niiEFAYaO
         i0c4cvegZzd4MwJ1vr7pBT+VsAeUfYd46UUeuHlG/g+hqOSSmeydIb9D9FAqBtfoBt7V
         Oo/Hcqd2/9uAQLJsCJb+nfr3RuDsPmvBQ4rU2CUpRLKB+Di874JlaZ/27Oe4m8HOuZcb
         2MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148148; x=1749752948;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IzQU0GYDCtvjDaFcIIDQKTVpPe5cNm+Sh+k7f14x/ac=;
        b=OjoLDLsEHxn4sDdcRuiF6uqZsHBVgJYCJHbUEdpfQmGDDrsqmo11E9TkUyToIzZJzQ
         MfKdzG+007eYOQDGzOBhkFmmSFId9vTqaAOx0uL3oeO3QZ94vG2jATAFmaPMhPF1+Rnl
         00mGaafsT2oVzjPo4yD8k7aLFr3rBT+cJiFMM+Z1qPUpaKAzAv0SzQbO/7OyeucVLMiP
         XQ/9zX62uGzYhtauXUlqOw70lGQGOi88Hiq8LTkKBNjOn1p/3ZH7qHV3LAEPc8vJdIx0
         jS3SOjLsnDiTLJTyN4ZlC0tvaAZ2i2/u+X3G0dIKOYd0VYUnfvq5O8UBjL6ep/clX5km
         fQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCWhTYQtUsmt6aAbaNGFmb2MFXIzWKsazHEZYBuulFIZDLe9mYMQiNzeFL7779QGqGn0QLc8zAwrvWJRGUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgN8OCfcaOCx6raJUZsX87HPmqcvmnShPQIJ8k25DIzIZc1Ks
	QkCK2bRweA0iQ4Jj9M4//H3UPE9fWLko63GuUrYE3LZkXEvRlybUwQIQiVySVC7EzgjhqDJb595
	WM0zK
X-Gm-Gg: ASbGncvdCkv/2SwJ19k5VOHckspAKoX4huxw2OKraPagpoiqc+YNNqO2KpUb7WFksr5
	5U6eAwhJntq04PcWPBsAuuetqVcHMxXkbWpA6Ifw+UzQafvmrfFo0QUdidybIrbfM4lBWIZMqEy
	hTuv1Z80ZL0QwW0A071EFXlyq5KWY1VTy5K/wWZ4sZOr4+Wi6Ig0YPv1lDhT+pFvg1SDHP0qF+0
	lUkPduvOSj53J08BTFUaRZRtj7KObu4nB3aSPlYDfzfif8dYv30U1mPRS94gsbF12+PGCRT9pRY
	HIlvPYCcD19r4t0KqLFIAIoOBtaN1pQOOe7yV6pQzPkIOJ+15NWVOmRY34uNxzuYKPIJ3pG1lZl
	9pNZbD8Y65oIZo7o49XdSfNScipwa
X-Google-Smtp-Source: AGHT+IEeipGTi0gZyJq1VrPNmalkI1q5oXitMDq3faZIy63My4V9xLMQfKPT8mghoCRREMO2unFoTA==
X-Received: by 2002:a05:600c:3b95:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-4520134081dmr4658675e9.2.1749148137729;
        Thu, 05 Jun 2025 11:28:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a613:826b:6813:c968? ([2a01:e0a:3d9:2080:a613:826b:6813:c968])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213726c44sm847955e9.28.2025.06.05.11.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:28:57 -0700 (PDT)
Message-ID: <f2fcb48e-7f94-4e3b-bfab-0016d58a5674@linaro.org>
Date: Thu, 5 Jun 2025 20:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on
 Qualcomm SM8450+
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2025 19:36, Krzysztof Kozlowski wrote:
> Enable the drivers for camera clock controllers on Qualcomm SM8550 and
> SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
> video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
> DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Resend because I forgot to CC right people.
> ---
>   arch/arm64/configs/defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 62d3c87858e1..2ffa590b962f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1404,6 +1404,8 @@ CONFIG_SDM_DISPCC_845=y
>   CONFIG_SDM_LPASSCC_845=m
>   CONFIG_SDX_GCC_75=y
>   CONFIG_SM_CAMCC_8250=m
> +CONFIG_SM_CAMCC_8550=m
> +CONFIG_SM_CAMCC_8650=m
>   CONFIG_SM_DISPCC_6115=m
>   CONFIG_SM_DISPCC_8250=y
>   CONFIG_SM_DISPCC_8450=m
> @@ -1431,6 +1433,7 @@ CONFIG_SM_VIDEOCC_8250=y
>   CONFIG_SM_VIDEOCC_8550=m
>   CONFIG_QCOM_HFPLL=y
>   CONFIG_CLK_GFM_LPASS_SM8250=m
> +CONFIG_SM_VIDEOCC_8450=m
>   CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>   CONFIG_CLK_RENESAS_VBATTB=m
>   CONFIG_HWSPINLOCK=y

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
