Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410AB27FD40
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023987; cv=none; b=cohkLv4Wd2alg9qhGadFu44XagAGbKlGXOyJeUCdv9DDxCMYBqAxmhnqg9fpYSmzNkER5ddPAPBPAxqxhGvDiLmK9fO2fJP0KAAZzVKF0be3iobzhJe6gWbIc0FpvR71Hfb3DLP6bsPdL3tONc8gtvn+hokrYeEM1n1VTiFm5OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023987; c=relaxed/simple;
	bh=TJ5otxNsHhue9kp4JXa7XfPZv5e97Dox5cS+GSYrlT8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e1GTjXTzZ8T+wbS3ehEXsbdhqGXczs889aPfDsVmSx43lFJiJe7brBYPY5xLOOHsjLeaLGOWhAARRYid38XMmMyGHkGLmE/syatDby0b3N9clqsRuqSy8O7qgfrRAxCmirRwd3O0b0+GhuXCW7fG9IN4GseDPOD07w9hXxOrbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXAO13eg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXAO13eg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so458403f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749023983; x=1749628783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDUJHOjsk0PN4jC3b9Kzo/hTk1CO4cybzs8qYU3UL94=;
        b=mXAO13egYSdDdYCLlH3DzfjX/zrDbwDRxYdcXmq1CzIuDRguKcochKQGFZUEvHcutA
         +jemyVbGkBjQjZt/w2L9XtkTqk3WT5Oryt4eAx5bdbLjs6q5sggJvzt+dwwUKkYEJFYE
         7WaI7ewbyZAOucteFxqMKM7G9oz8U/Rfr08w7ZcIjEgnCo2wF6QTGJBthIUHYYGQnSVo
         S9HhnVp49i3teaS4wC6vQe4b+WNyhB9bFqdPAPzg08X9GUO8PuG9b3s3JSXi5Gaf/Z0L
         qH8dPU+fbBEDEd8l7lCh3saBu9c6K9Ai77ZP8BKT6jWrtdHTRm9lXeeHDY32v9rMKkaZ
         0Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023983; x=1749628783;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wDUJHOjsk0PN4jC3b9Kzo/hTk1CO4cybzs8qYU3UL94=;
        b=LPQykQFLGHSsx7tDqCDWYf9hg67yQsmKf8GWZ62b4oUG3+YoNdI0wil9z1hfNPufR+
         eTPRp6waZIRjbbKlmbTjmSv9KXfGdCHBS9gwXgsvfmmrburAl3VqA+tkKhLRccj5UPHw
         hxsQI8/i26bh3b6l+Jyo/usa0x5tz4PNa00d8hzkV0ysFO6AKwZtqOeEDUUn4mgl+vSk
         6ValTG1vO8U6ivHoODA/9Ao77BXAM8vUAw1EXu/N1qctA/pg+EScK3mr41OIsOzUSmwJ
         DQ/6pDt18aBGB8EdNKWqI3KXpYX90VqmkOekT/ibZTZQ9W0KcYkQZpg4KZJpdzEuGUh7
         Sqxw==
X-Forwarded-Encrypted: i=1; AJvYcCUN1/BjvpVi1Tsg/UenqHE+T+YQER37akNiyCcD09LBMILlbPLDADN1uEYE7xeu9/fcIeRXb9V+aB7ncOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhoR61FvEcEmbB3pnwNkL1wcX3KAMT1BMT+S29pMcq2KUdlhgx
	KXS05sJbf6xxIVp6iFZG3LuS3VEk688dFqRriJRpgVNmAHd8bfPn9Xiqo579IExNoLs=
X-Gm-Gg: ASbGncvxlBytXkk9lkmz5fNBfhrqfcrsRJz+qiMcliSP/8o3kEDdI3bchmCJoPvd4zI
	T1SVex9Ey3+z6FOv97t/iuI+oDI07dzvZ2qG745RxeMvoh1BAMRCUli6y7IujmATxKwhs16k4Nu
	fFki77g1Jybs+Erpvx/nq4v6Z4Kg4gkdjHVJZHuDzsNlyfqAyGh3MjkId7IDwN/p8v1kkpYR4YE
	gcDb303UEmh9DvbVYmp9T/0dFvaVKX4qIl4qrpAkPKqk+yDBCx9Rs4MrXLIr1g+SmoT3FSzQVpH
	uVf4IMOOGKtPIIsB8wrFlez0B8CPbNItK1U6YiAFTAlI5EXRwANCqMHQ9KzeZrR/Bo7oBrTYhnL
	n/HyMeuct1z1LN6vGi7xlRfSuBw==
X-Google-Smtp-Source: AGHT+IEDZ3/g9hD5+uGWHuQy8gvoJHTUxKeNTODioWLsBtUDdVVJGD+TwYyLZLT16loC4wLG5RZzDQ==
X-Received: by 2002:a05:6000:2511:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3a51d512446mr1448546f8f.9.1749023983473;
        Wed, 04 Jun 2025 00:59:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097813sm21105303f8f.72.2025.06.04.00.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:59:43 -0700 (PDT)
Message-ID: <6b47f616-178c-44c9-a086-ee5dc4d1ae2c@linaro.org>
Date: Wed, 4 Jun 2025 09:59:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Correct the max voltage for
 vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, david.collins@oss.qualcomm.com,
 jishnu.prakash@oss.qualcomm.com
References: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
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
In-Reply-To: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 08:27, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> logs:
> 
> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> 
> regulator summary:
> 
> regulator     use open bypass  opmode   voltage current  min     max
> ---------------------------------------------------------------------
> ..
> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> ..
> 
> Correct the max value to 3200000uV, so that it is aligned to voltages
> allowed by the regulator.
> 
> Also, correct the phandle name of 'vreg_l6n_3p3' to 'vreg_l6n_3p2',
> so it reflect this change in settings.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 6 +++---
>   4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..fe46699804b3a8fb792edc06b58b961778cd8d70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -857,10 +857,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 5648ab60ba4c4bfaf5baa289969898277ee57cef..1e95a2849146e3eeea9f68085ac504e32b63fdaf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -624,10 +624,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 3a6cb279130489168f8d20a6e27808647debdb41..5a33d7d7ac923c7c0bf6aeb51d0db728e65883ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -700,10 +700,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> index 7d29a57a2b540708fa88fb59e821406f400a3174..073040fbd7ba215169adbe3862d3e1f6d2c786e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> @@ -485,10 +485,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> 
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
