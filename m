Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5BB25D212
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727223; cv=none; b=hIE1DNbIDztla2tp4z8TGizm91Y8+RA0vLAtEWG6UZ3hUFuMLGzpf5iOk3Nlx7veHMbvRrBaC2q4LC+++KeQvCsWt+LXFb08veYEAbYqLesgNFK4VgPcTvzLe4o+V8Ora/TQwkoAB0ZWziQ36U2SdYiCa0lLaURw/dtpiPqFoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727223; c=relaxed/simple;
	bh=i8gDA2gMRw4S4BbwdWmfOqUCoQ+NU71nDQjUlO8Hl4c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=tcOQty1TqFQ8ebqtKqjc077ERvAj2AaPFjWQb5Kxve4BLfjT2ZJb/WsBgHuXCsslzKOW1zst9c0obnaSGCRVT/OooRnKyf6eAxInvy3B2gDjUxHHC2JBwtV5hA6fDhO6xZAF3EmM/u7KgCahzNcRYcaZfry3kLJ5fNmpsq/TmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWvvsCTI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWvvsCTI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so1419373f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727219; x=1748332019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlB+dE65G2Ur0seqsAhMBP6CXpePgtrf4hmB7DQXorI=;
        b=rWvvsCTIKQ9b9XWUkSG6fRUow7PUpwBfXE3h+hrbjCvjgjsjPh+rHyd40F4Pf6ZbTE
         hc44YGpC2TUSG44HpdlakCYW7CErpx5fPP2h8V5O/FKrksNen0IntBbrpOEbORxh7zsi
         x7CSWHe1MTchqaJ6OP2MT8JjX596m5zfTN+vGhJUfOaVeSGyc5XuNpxXRBVvWa4r23fz
         SO9UDXOTyhMAtgGhTrgUhQQEr3nr4+QczPKuQPHKBdb3U1fSMqLoBAncdmz4FN3nbA7o
         WwoG3ec0m5+wWSh1bfCUuJqOsIHYcDbeax5wpujqpiEo+7mBfnKS5/gXBhybk4u0WLBF
         iNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727219; x=1748332019;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JlB+dE65G2Ur0seqsAhMBP6CXpePgtrf4hmB7DQXorI=;
        b=NYclolAuA2E7icNeqPfxsJVE4kCDKzFxKzLJmmwhKmA0M5TvA1H6C02o4VEJRrJwN4
         Ei+/FT425120kz5yRa5bT6gSk+N8L0O+DLxrrknk3ACsG1S/9V1o5TDybQTZH36CfIuH
         xOSfW148U0H5BKVN3+xKlsUH0WO/OPoEpP/H2wiuNtlSxfnARdzt5/e5NYT1S+MYTnwE
         P4xA870ZLFGmpBT1PJX7JSxByl6RoUQJun8ke+tpJzaQBm2fxwR4gWf99bcBhgNEK7w+
         Yat4QHdCPhw6zqcZIpaqMpwCDg0HtF9DBVn9kejd/n3wz8eP7FY+OD1+ckZU05jn/x+e
         rUYw==
X-Forwarded-Encrypted: i=1; AJvYcCVQWxrXQjqVynRLJkyHSYuCIcdd2aU6iWmbCYHg29LPZT+9AhxUNVYjN4WLjSL3IOlr3ZTGDFfS+27jELw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcEMTeS5chtlzhk5A6inZofT4tFtGphuR24NRXxYVI3zzbx1H
	J5veRIxcwA/cJ2xYwTOiZ7Y7yj/oPCX2YK426GkLj2tRV/25ITi1YwFZZGnbadwfnxk=
X-Gm-Gg: ASbGncukPWWQNaejGSC6E3QNLqS3gF7h9rTUdSSKASmk05dC+OotIYbjH/M/hPbfMr/
	SxGC1e8f2ZtRqF5GFFqvW62DZP39GEKLZxYcTe6QhuF/24mCpvxQuR3svnWLyQR0UMDNP46le//
	u/cOJkAiCINQQFqe6nXVz0UoEMuswSef1/XhTcJwcNpWPGU1wPen9CKzQ8amsrDAJ1q55eHN36s
	jtRtNVJ6cECirC5F6qvKC60cJ1RQy/h/UB4LVm6neRsaPhPUuyxfG1chDKCsO5Y9K2Sk8RRxKVN
	yQMgpUilo8bzoBjv+5YCfHocsWcVNRj5SwLjwuCTMK4B4cZI4cDmvKtIhr7mVtAFTezvWxOpiTx
	FCe7+0Y+Q+Wmzynow2Wwi9KwQq7DB
X-Google-Smtp-Source: AGHT+IGK7f2w42ottfrsYDyLmGZa4jgdXicFht/tKBlXTsPAPrA9w+hQ5JYufY7Zgoo+dCFadCjcDg==
X-Received: by 2002:a05:6000:4284:b0:3a3:2aa5:11bc with SMTP id ffacd0b85a97d-3a3600db421mr11262183f8f.54.1747727219024;
        Tue, 20 May 2025 00:46:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889e6sm15464333f8f.71.2025.05.20.00.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:46:58 -0700 (PDT)
Message-ID: <f3bf5a4a-f32a-46bf-8429-5c1de37cf993@linaro.org>
Date: Tue, 20 May 2025 09:46:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] media: qcom: camss: csiphy: Stop spamming logs
 with version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
 <20250520060310.7543-6-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250520060310.7543-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 08:03, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>    qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>    qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.
> 
> The driver does not use read version at all, so if it was needed for any
> real debugging purpose it would be provided via debugfs interface.
> However even then printing this is pointless, because version of
> hardware block is deducible from the compatible.  Fix the code to adhere
> to Linux kernel coding style: being silent on success.  For the same
> reasons this should not be even dbg message (see driver development
> debug guide: "In almost all cases the debug statements shouldn't be
> upstreamed").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
