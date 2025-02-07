Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC11FCFF9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936774; cv=none; b=Jica2xpzzKvMdU3lqEX1ZxiI2MuvEi3Jo6oXGXYrYEG/wT/i0kib10urX0UsMB8DamqU14xuM+/gy9Fxf869DPmxvgy7N1oBpTl/Fuq/f4p/m9zY09/gADCDF2AtX/L0xaKYVYlQDSr97JGT63wxx/yE2InflObV0HCtTADbnR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936774; c=relaxed/simple;
	bh=p8G/aUYuUCjMyJNrkYWYOuNMl6ZI+6nvf9k5rhYzVoc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WVd/YA+s0nXrOLopQesj9CDybj3kfI8fhrfFvP2EH6MH3yUsWZsHPhcBUawWVMvkn57ia1Nzax+T8O4wlzWSTuWRyVqOD8NZ27oOsQiQS2PNQr8hI1WYSFfJg7fecUd0lYOGlGiSGUgepQJCnLrirnNLBcrOM+W4IIz6koRBlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GUDzYYsV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUDzYYsV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso434548f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738936769; x=1739541569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
        b=GUDzYYsVz3c14Mj32SeSkILpPa+u39at/Vfqfp+roaR74XiYG8peNdtqIfDJ+AbMRQ
         VilT/62QxFdBRlKZ7e4tsTvyePvXbtwPdNUTonpY0X47rtx8Gjq0T8v9ABX9zA6jrZZw
         6yP/VuSZ/upLhPuvB0P/1fC6KFO2oRfyZj8TMGJJk6hRvYFRkmGmrcVTwA5VJXKZwHa7
         ISmWKTAPxtjoCBHNjK9ZW1vnmLk+73qZ2E0bjKbFsZiiwdSFU0vq+ztTl33JZ2U15Fl7
         QIkpU9Cu+q3bPQRNctC3nkNL0Ona9ASdpr/MsGVzAHz0oK7kLqBl696E7QVqXyBA+iSi
         frzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738936769; x=1739541569;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
        b=gHT8led3Bdw/4qFcd8ROIsf9LGBylFZXcy2fDN4hVIJbfcg/uaWyA95+NYvpsZ+8aj
         XU7dYshvipefGm0zl4k6Om9tW+SMxZzITMM6ylV2sZZORqM607/XKsE6OvtPd5khX6xD
         kjoDQDwQufURH+LxM40lXYvM5PuKS5aK9yFC63NI5kk5Pi/cmZcDsvAzzAiooO43WPsn
         TGJHWU9CDpY4PiwvoqCuPr7gmbYqwrW/BRxlfjO5VtPNNNWWaJAprPJRiXXTovMZ8984
         oq+qcC7Nd1fA5KLjOQKGM1skD5DBSK0f5g1/Zzmih5x8eSSBr9DhbE6FeTIugTgivNaT
         UFWA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Jcfv/YSh3GKuglVMlVwmp2ODelrT74Mp/CUyXXleB3kf8FAkN2F7jZ8QNr7Lge1JJDGIcpFNGgDGws0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeAJ94EF5JSU9nP2bwBiLuNMCopcyz/ReoyUU0U+M5dUiyBj9
	d9k/YQfbxmuoniCSu2uaL8zkFilph1bjJKowlFIdO78p3iBdAD022Z9ZCD9navw=
X-Gm-Gg: ASbGncvkNOcAD7wpw42TBWW6iwS2PeUtaI+ABDih/BsiUynz8Jy+6a6b2pGFYBgxW/u
	QyVFdlt88dLJlebHkw0FXiofvV1lk0oG6DWB9UcVtzNbYDuRRVsKlBvrx4ttn0eV+QcZRmkQuz9
	GzgvfVzcSUcLaOiqxJU1W/cT5mAXEYKqbF4u9QoPAJccQUBPkkHoROp6a6qtsK49EoOlpPrM1LR
	ty0IZ0jKJLssYoGW/UzbQ5QWIJtcUKvh1PqKFgjQvqOMoAjTWqZUPv7X/F+FlJE5o/kpJa0c2zH
	E5D9L68qCYqmdiuwgOLq+q7Fe8ZsBsJ2jwJltnATTrpjBHGASJOVwJFN4MAso64DSe+B
X-Google-Smtp-Source: AGHT+IFaHTGIHzKLUvnWz9+Y5u7+raJr/5Kf7pvr1qGvrp3QDa8oLg2Fjp7WNSzvc3RsTpW1NE2RGg==
X-Received: by 2002:adf:e60b:0:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-38dc994edbfmr1754061f8f.15.1738936769612;
        Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm4646491f8f.15.2025.02.07.05.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Message-ID: <ec30d033-f53b-4d71-8c36-b6448879b691@linaro.org>
Date: Fri, 7 Feb 2025 14:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: display: qcom,sm8550-mdss: only document
 the mdp0-mem interconnect path
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
 <173893208278.4072473.6097194764742914829.robh@kernel.org>
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
In-Reply-To: <173893208278.4072473.6097194764742914829.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 13:41, Rob Herring (Arm) wrote:
> 
> On Fri, 07 Feb 2025 11:50:37 +0100, Neil Armstrong wrote:
>> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
>> mdp0-mem interconnect entry.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 3, 0, 4294967295, 13, 0], [4294967295, 0, 0, 4294967295, 1, 0]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Damn example, went too fast...

Thanks,
Neil
