Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3D266EEF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024027; cv=none; b=bhJ4JmTFt2ZV+0Xu3ok9WVGVqYGOi10kDI397Ul75/uj6m3uk/omHIObC1adP3CCLbKmnElLP3s5qkKG8nIn3zaZ9I++gQeNsuFyMSvJJKuSbpIH3gZUrzOiqUu72r4MMqBYyUuAXXVcJ/Ttf5MzdqFzT0Sk/LTg9Kjj5v9LI4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024027; c=relaxed/simple;
	bh=/cJFnMlse7RWxna3VkvcHVFPwDx5Cy1PmrI0XBK8/5k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aujBbJGe4j3yZzsxHB+W4lKYZOLeMgBVvDtOotI7lRjti4wlpuzazUeiVY/zi820vRjccqPE6f1XH2tAro5CjRRbLuXPHZ+7zP/PvMFtJs5HMbl5llysxg035h9FuhHiYKRZ/65aizEisc6GKceALkH0EwUnic+lmVNYJ7exB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBC52mcs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBC52mcs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442fda876a6so57835775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749024024; x=1749628824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sANRT0hkS1nS58qjAo/Q8mNoQu8ppvh5ekO1WmLw40Q=;
        b=NBC52mcsjpnGNjiWSzDfkj8+4QQCM/4eoecnz0KeWXWBE1LbXIbS+DhBDKCXZ7CNdY
         8cdsO5bSNNMWqK6tGNbWrE7ykSEfZ6t9BiDNb+8qhc1SmDyPqtVgR8au0bpHehopD3Ka
         UIRvy8hl0oEN+V7VK10RlCyrkhhhfhFJSJgYYrG4u35jIm3hP0oO3BkkhHYpKxbLGAKR
         xXjle78J5LUY3O9NWxSIBmrHggO1n+0TNJfVfGvGh9l6EstdKOcKaXJ5jE6GD5XW4zWQ
         hRDGHd3r9ciqZ1oJXYCjZ0ohXns0n0RKIaU9RYDl/jEM26mCtNothtfFEcoU7r00J9Rx
         C85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024024; x=1749628824;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sANRT0hkS1nS58qjAo/Q8mNoQu8ppvh5ekO1WmLw40Q=;
        b=kk4P7jroIc7mJW1b0S3UQhESCmjD48MOqAR8LrMF27pcU138U0TGdeQtb5+dNzQr/O
         rHGExcRrKPuMVm00k6arDynMHALn1a2EGehUCl80uvM21tyVEJewXPW8EjlT44a8DqWs
         +ivIDvuKLEskUL8KLKDd4pLCgJSJOM76nYJ2UqHUSJWTQmQ02EsPf657gqB7eq4kpYCk
         hHyogHN/CcAHs+x4FiR7zmhT7qPekFuU8aXUZmVgXJzuhrzCCCSO/t6XQUE6xdRBVHtK
         oYouusomiN/LtqMUjU5rA13FaLmEmKzWVKsMq/l7zKr2QM3wKgrkX3Rluk8CHF4iN8k3
         He2g==
X-Forwarded-Encrypted: i=1; AJvYcCUZp9qHqINj2+w83a/EWoSV0ufIOsP035964ZShrCC8f8lVsqZ8KcMCU8MK5v5OfvwhOghOH/L6ctyW+7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEzj/1OAqCyWJbp2PxoMYXnlk+HIaSCeURQFGkHAbWwaQt1vx
	w5E2BAhzVe2SdsZafyQdfc4eFJbni+FhDXMV7b9TOUmEr30daIwkr+y0WoZmMItTcEw=
X-Gm-Gg: ASbGncsbaDm9qUtvAXE6DVp6W79QbeC0t4lgqdABDHI5nmvEcWSXa5QntF3uQYuEKGp
	6QGMSHrZfOomDh4V/1oDM53on8yyDBIMouKFjXsQ++qb4y+pYPaSXYGDR8DLgZ0TAiRkG586Wa3
	4rWf/LUU+GECjCkbncxd6nEsYVepq1zfcVsmyJivbcNk54gtKY5wWSFbME+r5jEuP55ZgN7JLSn
	spSiAbtNizrNmesRNVGRnjLWcQKOjYmsowWV2Lqj6Cg1oUTtj47nFXijln2Sp9SLp1A0Kv+/b4C
	iRKdjDxNO20S6fNZK/Tji1DB7SXmBjHblGIKYoStH1UlVcwwh6voNbL5LdyJDWpuocsiJChgipX
	Z72SCgtCy+sYjnmbhL9MUJSfp0w==
X-Google-Smtp-Source: AGHT+IEiSVk+GsJ7gKqLlFbibh6a5OQ1RxB6hEQgdH9DwIP7LVANZQyVpXDzrnaT1mq3Cr5B6EX4Fw==
X-Received: by 2002:a05:600c:3ba6:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-451f0b268cfmr10617375e9.20.1749024024244;
        Wed, 04 Jun 2025 01:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7415asm20985691f8f.57.2025.06.04.01.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:00:23 -0700 (PDT)
Message-ID: <5af110d8-105b-4bea-9af2-1ed8949daff6@linaro.org>
Date: Wed, 4 Jun 2025 10:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sm8650: Explicitly describe the
 IPA IMEM slice
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
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
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 01:18, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..7b80d281cac4349ffc2adac0650e07329da461aa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4344,6 +4344,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			qcom,smem-state-names = "ipa-clock-enabled-valid",
>   						"ipa-clock-enabled";
>   
> +			sram = <&ipa_modem_tables>;
> +
>   			status = "disabled";
>   		};
>   
> @@ -6637,6 +6639,20 @@ funnel_apss_out_funnel_in1: endpoint {
>   			};
>   		};
>   
> +		sram@14680000 {
> +			compatible = "qcom,sm8350-imem", "syscon", "simple-mfd";
> +			reg = <0 0x14680000 0 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			ipa_modem_tables: modem-tables@8000 {
> +				reg = <0x8000 0x2000>;
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0 0x15000000 0 0x100000>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
