Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E542BDC19
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842769; cv=none; b=mVhXO5Av49+WCGDsoz0aXyDP2vYoQUufaiZvr+SFsGDTlHLyy+HvcFZM2/+J5a+TDVtVibztVb6MOTDSqsZ/cTRLvGNKRE/rDUzNeI1RmdiAa7orpmX3aLSIi9R3+ti9tDKw1vbUmMSnRRhudBx0RZeGrp6+P78M5Idh1/I2vYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842769; c=relaxed/simple;
	bh=SGa/qh4yqBk9YT7vZT4NgomOg8NyvkoWxPRjILGTgcA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SMlcZKBYmoNkNMFcF33pW51XU5RC8vqxz6B8QPD9cbLpTunJNNfKLzO//pluK/IfWj2gHwxMFxh2V9yEPyQ9EUHe5+EFNuuy1jjrXMQpI/Rfr/TfolH1+mvxCAbluLvb+dKKGBGMhSgslctEOT1zbN18XlAwP4eViRkPHcuMCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nn6ZUaW4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nn6ZUaW4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so795845f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=Nn6ZUaW4cBGupWi7NO/CphA0HwSWdqVxGGwdQHaV9XSqLrYAGwz+YGncIZgKEEiwRR
         mR74lZksxPoVGcmE37mo+/v+qY/7O7Ys3ux5SMVD95rotxNtzFBDTVu9vx+yt7a03KQ2
         JdHFf5t2f+DJE87hdJVA2baO7rmTmNFLRPCJmyK5QD0FrQ+ph7+zK4UatYvO6cMaOY0E
         SLOGn0JIboXUe9PM4Nf/A5nJc/h2CeBd46S3OsvMvjcoG2WMx/OYTq3NLoU8ArQPdYm7
         Aizkp0V+0m9izHApjGTUxcCDduRjrduIeGvbdR0rcsEyNEGNf1CdyzSaIvJYsbcfya+0
         MT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=MA5/VB7Jh0VEQ/xUw9qMXpD60GpHe3s8iUIMfB/WkxhuUYYEW1RR3aMHf8yvAlthXy
         NfF++JxWOcxlmKY7ms0wwIXPS7faMaHi7Bk7F2lG3HovB/46zN9PQrb8ijTEeU/s4y3s
         kEvxdexRnIbvFSTz7YqqQM/j2Vp1VRBvHXAgcHzoG353JhHWSIBpQgB4HjsLptwNVl0v
         la260em0E4ZApPAJ+U64ZQ1aZmCnBpjRmR3kPjy6goX+Co9F9dmcytFHxC7hripW4z3k
         fpxjxLmnOG5E1M7cD6zL+xXy7WJulx+O/3sQNilHdBn0ox/UlS1E0FkSlDXDBijXwDE/
         WTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2Kd5+m6/w0JmM++TGqu2L+z2xTo4neM838JLxHD53yE7B/EixIrYzTXUmpc/p9/eWFskP4Cl9N1jge4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4gWNcqePd+mkUwCh76wJyviQDOKZDpTMwH76dPFwLdbqBxnly
	GFJij8E86QrhmpzgW2n6ztBPXbaYA5g9vQtrCbCglrSytvwCI9gMr03+L96yLNTOGrk=
X-Gm-Gg: ASbGncv6eaAn9wO+uFfZIyHpLSvvjUs0xZatC+2TEzSbDKgwEpckGX6oAKKXIM7RCfk
	9esfVQqaPmXKqV44KfOMqGi5Hr/lkfVw8VVR6eXFbJ0myZkDU5PGbNsPHslr5dFHJI2LzJeKdNL
	mCSOC93/UXxzNEjJZ2oMOCKyqH3mDcrGkE7RN5xcbal3aliRFygZMdgJYdjOIQ2UNfGSh6d1UNr
	75cAf1FSvIMeFpZ0Oh9MqsfMSsY25VzmwwmvJ5Fok5qE218YZnbELA+wymUmr5MUiC5sazg2NJG
	fgjq7/8Ow8Z6WcdVIzgKAwhhN/VTfufdUdVaVH3XosZ4O5bmLKroBGQ3gnDZyazH+Bkwgb8jGaI
	XYLzUpN/22LYnCcEWf2BDM2/m1ASANzGOBSqa
X-Google-Smtp-Source: AGHT+IHuOLH1/60wIoa8V0u6vvKa/s0mo8C3945entGfnua63X1EflGYum3E/5TURPbYBrq1UMJvGw==
X-Received: by 2002:a05:6000:2b10:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6ed660d0emr1180144f8f.46.1750842758503;
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6fa2sm13686285e9.27.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Message-ID: <13745cf1-10ca-4014-939d-2bb4224ecfee@linaro.org>
Date: Wed, 25 Jun 2025 11:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
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
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:11, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
>   			};
>   		};
>   
> -		pmk8550_gpios: gpio@8800 {
> +		pmk8550_gpios: gpio@b800 {
>   			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>   			reg = <0xb800>;
>   			gpio-controller;
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250623-pmk8550-gpio-name-3fa2e349d567
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
