Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2807279799
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661405; cv=none; b=lDVMBEIQ5pu2171SOCnEeWk79mI1dJpkA/Yr8Qt1W5ceJAQEDdpFT0yH8BeMPxXP+ycT2Kyxxh79f9nUyUdKI288pukCmNfyhIgKWd13JBWRQp/F/zD2j1jv8q2ocf5fwaKF36qkR2Kb9zjUvG9jMj53T/uzCkxskBBKJyA2cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661405; c=relaxed/simple;
	bh=ceoocduNlo16bShRSxr/bYEvB6DSdiuerrL0JPRXSZQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aadAvd2H35eE2gnnPlJckrCVzqN1a0qnZzsjjRTtNZ9RFx0o0TzXTVCtSTZWcXDQHzjVUdJu91hBqgj1bSK9l5ZiU2b21JaJkT/2wnI8lt2tOwiI6bG5T8bgxWeI8ReiClec/Iw2LxnCGW2Vqin03EPrKkBmcRW9IkzA7fR+DkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddplbHC8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddplbHC8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34792335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747661402; x=1748266202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDBNlQ3g6oC2KKNqaV/PvSTd0uwtCUXu465+xGLQdN8=;
        b=ddplbHC8dawZY+lqgmoo04W0T15X1fbiqizQtDbLLU/iJ2uqq+HRfULyLJBjs4Vdo8
         KkBeSp036Sl+7YUGPO25jRmMd+Zm7rVeGMfavWj/1r9jL6e+ZyLH1yQbtxiDm1oug3+Q
         zIH4x4a6Q6WH5Wkv7n8VxRhriOtUl1mQOBUzt1cWQZirGXZx4523hLOjcsi2lOda1fEL
         0SUmenTy9vz58mg/XVzC1U5FcY7Jk0whh5OefVEyDCymjUCuZxUXpotspMOIpeKBcuYP
         3OAmJX0+feMcdMpcKPIgUslOLjo+XLcgue1zJPg7LL63Ku5jhXmwEdbWFaxw0FQK4ZXu
         JpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661402; x=1748266202;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDBNlQ3g6oC2KKNqaV/PvSTd0uwtCUXu465+xGLQdN8=;
        b=Xpt+9r/k6UdxOes42GYbdn4C6ZBOLwpgExbO7+OTYkrc43RCwtsVmIzECUgnpNgbFj
         RVp3+kc4IOWNK/Aue7LJmeUxDIanf6coUQnQMb2QhNfIjrd4L8oQ+PsOx6Sozy+5iCSg
         G3P2/AVuGDhIkMgmzw0/rCajZCatZUF8cUVsUBaoYaXn3sYolNZ6ncEWujDqKhPKvdJv
         c/ZB43Lucuqe0JQHp7kmKQR1Wed0/kBTGA87PqwiFkPQMvi1ZKxp73WEDVCSwM64Qtn/
         VgCO0OIsVuqmIZWZsuMfdTAAjvYMRpe989YzUdPHWIuoozEIS+sPSSjYyQ453trOBZ8Q
         YQZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQUCnhVKm6+eoc17LqBOQHqrVovs+0+PiRLqUeMmkoKUfb3q0jqySAdOHKLtzuN7ngw0yMiMYH//79SYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/Be5cgcjyB+lKrI2SQ1HgUYSOeRLmixpQqEtnH8n7YuMXcQz
	W6mGLoChD5556udAyudcg4Y/NkJOL7RfyeaRHipAL/fu+qPvIWtbuNGkP3j8u60wRow=
X-Gm-Gg: ASbGncuzJpr/rulIE5lFGU/GTW+kbOizVnnXKIV/1RZ5AHHmuEKfEHNniJ60o8CNfFZ
	/VvqLz6nHZJg4r+M3u+CUz86cYiOeMW3rx9y2np9/iTMxRi0ROB3zI1Mm9OkhzMC+ILTnLGkKgE
	fBTjIc61nV8fxTgsY4lH2KPgO6JHgrLbN7ri/a+j1iOVEisJC6ouxtWTq6gkVTBlNuXt14cvK0h
	slO3dKweghDxBHC2XtCaZMaOsS+GRIFXaVMOR87IpS//MwvqLmIukpFQUPb2NS1KxIS6Ed6CXxs
	Unab8qjUUS6GtJruFj5ZQ2P18FO5uogu1jTWcZyJSCUbrlWhBalFgjaRTZcuXEE3Q8EJ+boQ85o
	x3poV+Hm8+s627S4+4feINTpkUAtp
X-Google-Smtp-Source: AGHT+IEZZaVnqBZzCTNrAs0XlbgmkZpK+jBXgRrvy+8bDHfECKm5po9fM93yC+ioRRyCDCBRZdM+5g==
X-Received: by 2002:a05:600c:3b94:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-442fd60ce91mr110613535e9.7.1747661402047;
        Mon, 19 May 2025 06:30:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5beccsm13020104f8f.36.2025.05.19.06.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:30:01 -0700 (PDT)
Message-ID: <2328c351-1bd8-4ce8-afe5-a6df675a2738@linaro.org>
Date: Mon, 19 May 2025 15:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] interconnect: qcom: sm8650: enable QoS configuration
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: djakov@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250407-topic-sm8650-upstream-icc-qos-v1-1-93b33f99a455@linaro.org>
 <20250519082305.81258-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250519082305.81258-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 10:23, Pengyu Luo wrote:
> On Mon, 07 Apr 2025 17:16:47 +0200 Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> Enable QoS configuration for master ports with predefined values
>> for priority and urgency forwarding.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> [...]
> 
>> +static const struct regmap_config icc_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.fast_io = true,
>> +};
> 
> [...]
> 
>>   static const struct qcom_icc_desc sm8650_mc_virt = {
>> +	.config = &icc_regmap_config,
>>   	.nodes = mc_virt_nodes,
>>   	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
>>   	.bcms = mc_virt_bcms,
> 
> Hi, Neil. It seems that the config for clk_virt, mc_virt is not working
> on some devices. My device Oneplus Pad 2(pineappleP variant, mtp based,
> but without modem) shown the following.
> 
> Apr 30 01:56:16 oneplus-caihong kernel: qnoc-sm8650 interconnect-0: error -EINVAL: invalid resource (null)
> Apr 30 01:56:16 oneplus-caihong kernel: qnoc-sm8650 interconnect-1: error -EINVAL: invalid resource (null)

Right, those doesn't have registers, let me check

Thanks,
Neil

> 
> Best wishes,
> Pengyu

