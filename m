Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8322A4F2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010484; cv=none; b=gaF6PXMXb3BzilyF+9snIVL/rZFQKs1Rz7HHOSYa0SjUI3G5Sdp18K34jZ83GLiJ1II8E+IrKMCXfZ+yJjLfZokyx/HMbHuznv/+lDs5nROWBghYADf3a5o2N+XMpRWmZwJFJTOHWWqfPqhtH6tV7M92rCtLXDuNEqfID/ricyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010484; c=relaxed/simple;
	bh=/F/iBzjj16HR5A1tU/0Iqh0+C6+AwZaA15eTTFZRf+Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PK8SN+re+SbnrFmHtRwhohKdM1jl11N78ioIqNuVqIAL12vYrH32nRL+u1HfFRuaY8nscGyS6jJZJjXzHm96+Y4o40fut5XRJ3V0JXsfbHDl4lRf/xyaV11hhI6wVY2dib0fZrpdhh9UMISqvRL146D+CcvxbQWZDWce5K7Dr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSENOmfC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSENOmfC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso43401135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744010481; x=1744615281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPzcXHfwhTdJf1G6SrL4mmAYOzD/PgqXyH9Vw5LY4tI=;
        b=vSENOmfCIvh+7wAIvBberLDCOLdppjpMMnI53wSCNAXAym6V6wGWOm3zVLadGBvfnt
         vg5TVxaZvgmSkm+wRqtP0wHaskqoCgflLeMR3IaYtuYfAPhmCAMuUXWEYanqe2eFbTY0
         CfHiroY2uvrdvONpwxEQDlmjqfV5WQKh97v0IK/hWjkd8aD1E0/ZZsSlIIDiK+sJcvEE
         nu2QP7xMYa0C5LPy0Dz0yP/OiwG0UeRNnQcUfXh7NI/YfRVdaXmpDBAp2hbQGKyAuNBE
         /AG5WyPqBr5dQnhIhkD1ALZ6h3wmViA9b5pmXv2U9HvGuuURoxwMnVE8bpA2d4iXO1DY
         ckAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010481; x=1744615281;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MPzcXHfwhTdJf1G6SrL4mmAYOzD/PgqXyH9Vw5LY4tI=;
        b=L0zO0tS7C4fvd5YbSaFHVM6vwnaco2TBNJhp4ySZ4IVux2axZWGlraOaf3J4IEAnmm
         Ubakg4kqB2dzfTA6nsf/eLQv+76qh/Vk8cnwucjf0xfD4kw/hCjLhkHaD3VYnkspiEwl
         1SVU6LX8t7cbKRgFZgffuoCc8XnOw5fpXqLx0LQ8Fx81Taam01Qx39o/FIrBFsvhXXn6
         6nKX0DjtIk/YsnZ1YmP+tJVOlfbD2cwLbWc/CUlmcXkcYLgUJ6fr1x4EhH5WhcRZ0UhU
         dy7ZG8M8EtFldwlVkzi58SwycnXQBChaMu7C++CglaO0rVLUECrbbB6SruNEL7RtvQ3j
         Zsug==
X-Forwarded-Encrypted: i=1; AJvYcCXtmGhNn2ql7Rrdpj68IjCnb9T7DTOC+PFR5A93E4eTh6SXcAagkk8rJ+pYfYC1RlkIwsbbCtBtsXkA7ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxChuGpTYhCCosHUK8tzLhITMNYDouJrqylGhZL2QsX2TBpPFI9
	2jq0Bdk8Hv4ilsECtRWEXFIeBW0g6uZIrJ7GsHjpUtWtgJ0u/SVi0aMREa2iRMQ=
X-Gm-Gg: ASbGncuW3nzLRrdKuK0KKRZ2D1o2qjNf0WAVP5nEP8tqM77Lh2/cFvDF3Ok30lgakWx
	47loj/Yom4toeTNJGcJkTfIVm5GBD1IlxDFWYBSSUtcwvZg9kBIf8DPzBb+id2nZAWIwLkcxAjS
	TLtcNqqx0M8DtNUyJwW1Mz8Gi4g3ClVITlOUCMxL93+c1prlRuYhNBLb8XXRbNKo8qrSz1e16wV
	RPN3Rtq8JYyD5UyTGnCmyAmU7B/OFfLzVVwU2+OABPNvyZuYoJZovKbm0G4RFqX8coZqZvWN8L4
	d0MpL3QXs+eRA5g4rGdb7rV6lOoMrXIiTvRsqUXuQdNu/tzxhep+VZcPl2k2bcyYPRS6RIUnsXE
	tZvesKwpURmjmGBdoI54qUw==
X-Google-Smtp-Source: AGHT+IFJ3CMu84fXDTqeLnCZf0ZAv7p6xftmF7goGvJ/KQTlLSUGGhXyq2rtRBXb/kV7Ak897AXDFg==
X-Received: by 2002:a05:600c:3b08:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43ed0c50883mr87435595e9.16.1744010480636;
        Mon, 07 Apr 2025 00:21:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm120966035e9.35.2025.04.07.00.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 00:21:20 -0700 (PDT)
Message-ID: <3ab630f4-8b1e-46ea-a8c6-a2878cfff78b@linaro.org>
Date: Mon, 7 Apr 2025 09:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add the missing l2 cache node
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250405105529.309711-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250405105529.309711-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2025 12:55, Pengyu Luo wrote:
> Only two little a520s share the same L2, every a720 has their own L2
> cache.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index a2b3d97ab..f47f29ec8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -187,7 +187,7 @@ cpu3: cpu@300 {
>   			power-domain-names = "psci";
>   
>   			enable-method = "psci";
> -			next-level-cache = <&l2_200>;
> +			next-level-cache = <&l2_300>;
>   			capacity-dmips-mhz = <1792>;
>   			dynamic-power-coefficient = <238>;
>   
> @@ -203,6 +203,13 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>   					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
>   
>   			#cooling-cells = <2>;
> +
> +			l2_300: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
>   		};
>   
>   		cpu4: cpu@400 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
