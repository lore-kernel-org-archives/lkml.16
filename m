Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BB27A926
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498606; cv=none; b=hDRBBwUPRdLTDGIXItHWzap4x0yxmvezPb67VxKLfw5ZnqRDSLnWN4KLnmiIMLEMcNRqJY1Jd8kWy+IPzo00LWWvCEN4v3Xd2Epqn0jG4ck+9hgqkyIPMGwSNpahBbFtxQUMSreFDRPBDgpD0bkefqDbgpJH4qxiANEvcgIwUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498606; c=relaxed/simple;
	bh=0+zl5wuGgPcf2CwpTpY77n4FYm2pqM3kEQ4akgqPcU4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YTj0WwNmOKZkyVDVdu73xy+iUn0GrZOsW1LWDuLtFrur6dSF/dkFomtcF7Iv1zrFUl/kN73r5wGc2Y12HH3CNpUIJh5BkB9nCTYXvxWkvyIQa0FCI86B6R6V2zgVpK0gHlC6aUXk39pIUGyfLNauT3wK/ObSNQ8ltjaj8RkIheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kp8GFliN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kp8GFliN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6911955e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745498603; x=1746103403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVyorItIXBjMu6EtOX9IrPexB43LsYGbQ6QOmhU4BzE=;
        b=kp8GFliNVrBGRP3zOL/EtaGk//QasOBklSeBggch3uunsIWR8on3g9p2n4G0iqallA
         DTVGtQXdtv+fu72yxg+oDSt6EJ7uNWjx5GXw/fnKeuzyhm7JKSnmVWBsSgx6QRZ6TWDq
         BlXe7W/fZe0dGOUeujNCS1uxjdcTlJEPQw2Pt+DSNgFxsIpHnlYU2B/+vM0tSvQsc+W1
         kevaNS9YKV8w4xm8OPXIxcRNAJuLIOM4d+gPYKbCT5w3LLrvl/zh2GR0EEo03xQ95aBv
         rVoa2nh8dTGbyj8Fqf549HhIsrTEK3eOAQEEG4Lk5j46O2OtTKsbfUCslGxtx88zHGfo
         zsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498603; x=1746103403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BVyorItIXBjMu6EtOX9IrPexB43LsYGbQ6QOmhU4BzE=;
        b=R6uw/LMdInRcX9jAxJAagVHwJOmavHYW5fAHPzFWR383wBlb6TuufxAqW0GZWzPg7d
         yt/TI39yMqnlna2jiUKc46Kp1p05ehMr7LgaIBNoV6tNsb3fSC7olUUEPtfBRTCH7DGB
         YEI9NL/yymEw7PjqCDQ54MibQZjqRSzGr47XzYWVP8aplsbo2HJsL/XEW42jqN/knP3n
         wsFTxrHzjEvpppUM/bHp5QKWNParjhxFMIqXg7ETZRxqVX0Wu+7QH3pU4sCmsiUAmP64
         mcGgkOS1UZ3Ls3M6PJ8EMwEHAkE0+iHgszY302XeidP4lcRyzM60EKHDSe7oLDs7ZZVF
         UhEg==
X-Forwarded-Encrypted: i=1; AJvYcCXprQXG7w490pgSs4QGJpgCQov/314EzYNhmCJSq+ffg3sOlJqkZCKOtbqeD0OJeP0N2/TWNH1BBZ9E9VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnavbOjMyBfNWWmJXFUDeLJiz5S9/PYBklmbeEzya0svlecWgL
	2ZKk5zgl+xkzqdWcGaYtvYSNTAgz9FetEh7GK/UL44UxzVNpdlPOErY96CX3jm4=
X-Gm-Gg: ASbGncvSV+Uh3N7fSbFnONSrJJ0R6aQ0xjrWHH0vmiNl83oP1hpuFhxS8z4gK6I9YJr
	SrdvkwX2tIjKoPjp59a7/MKgAONBn+At6oDoRyOYSbK9in7YuuXj3usBmHrqwqnNlsuZifZ+mLl
	6xoS0ou2R2TyNRyvTwAt/fsuB/bwqUz4xqP16zFz0jbEftTOG6+N52aoxArFUcNPxjMcPLqLdL/
	/AIOnGJjPBdoAipzbl3CZAQxB6Pq2pbdYRb4EtiAC8+ZcWXe9DNF8cHYh0i7c5s+ppul7wz+9ky
	U3pnUz8jGSA8JhBnVgZDo5GCMjzezz1n3KriEBPlgl4y9Q7bGzVfbIv1Qz47vaYDTG2PkNxg7KF
	zu7jwmUgBRwa9QBq77g==
X-Google-Smtp-Source: AGHT+IEZiItOnvjuwK4n71nVwqbzRSks9oEVy4kBUHEN1JIo6OdV/TXM2tKPDEjD88lmim4k1MJr7g==
X-Received: by 2002:a05:600c:c092:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-4409c399b9amr18483715e9.0.1745498602777;
        Thu, 24 Apr 2025 05:43:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a01cdf59sm8421785e9.33.2025.04.24.05.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:43:22 -0700 (PDT)
Message-ID: <dafa92f7-1bcf-46a1-9a86-5b41e31ab7bc@linaro.org>
Date: Thu, 24 Apr 2025 14:43:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
 <asfwnyn5grm426vq5qatrxfffv3wmbuzx6266rblanzqepffzx@7773dcxfaqe4>
 <571b6484-d3ac-4aca-a055-c143f7e4a5dd@linaro.org>
 <i3kzq27v2cqhyuyqjq6dll4h6u2hjl5kpbws3qioe3lzarkhnl@oz7gzssnx7kq>
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
In-Reply-To: <i3kzq27v2cqhyuyqjq6dll4h6u2hjl5kpbws3qioe3lzarkhnl@oz7gzssnx7kq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 13:17, Dmitry Baryshkov wrote:
> On Tue, Apr 22, 2025 at 09:07:41AM +0200, Neil Armstrong wrote:
>> On 19/04/2025 01:05, Dmitry Baryshkov wrote:
>>> On Fri, Apr 18, 2025 at 03:20:35PM +0200, Neil Armstrong wrote:
>>>> Add DT entries for the sm8650 iris decoder.
>>>>
>>>> Since the firmware is required to be signed, only enable
>>>> on Qualcomm development boards where the firmware is
>>>> available.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
>>>>    arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
>>>>    arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
>>>
>>> I'd say that these are 4 commits.
>>
>> I could make 10 and still be coherent, but do we really need 4 here ?
> 
> The usual pattern was sm8650.dtsi + one for each board.

For big changes per board yes, I still don't think we need separate commits
for boards.

Neil

> 
>>
>>>
>>>>    arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
>>>>    4 files changed, 109 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>>> index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>>> @@ -894,6 +894,11 @@ &ipa {
>>>>    	status = "okay";
>>>>    };
>>>> +&iris {
>>>> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
>>>
>>> You shouldn't need to specify this, it matches the default one.
>>
>> Hmm ok
>>
>>>
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>>    &gpu {
>>>>    	status = "okay";
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>>>> index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>>>> @@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
>>>>    	};
>>>>    };
>>>> +&iris {
>>>> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>>    &lpass_tlmm {
>>>>    	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>>>>    		pins = "gpio21";
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>>>> index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>>>> @@ -824,6 +824,11 @@ &ipa {
>>>>    	status = "okay";
>>>>    };
>>>> +&iris {
>>>> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>>    &gpu {
>>>>    	status = "okay";
>>>
>>
>> Thanks,
>> Neil
>>
> 

