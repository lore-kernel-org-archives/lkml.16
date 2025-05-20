Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C425E44C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727234; cv=none; b=FVyLt7IiSMZiIqdpqiPoF2ocoIRdVcmGCRs9pw069Zj9s2lxR/gBMaihW6GneTtYYvbJUMkd9uHTQlFsOwZCyHCBBPULt/OioPYZgw5UL+YQ5W+LfQVaAfOfL2yNV9VXMfpOsYIXiyS1pyoGiZjcXeRw8if2514w4axD8GD5uGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727234; c=relaxed/simple;
	bh=CQKXTh+yOMIZtQUJ/0Y2SeTA3aVkmSKk5cNZ9ONeNcE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=SHcfjM14iyM23tqpiL2d6Z96A0fxOvZj0I63XtEShrZcb8z5dB5n5DGdNqdyUSlTZRr40wvD0Tf9GL1MEzdLgv4Xxgo8rEW/HOH5XVQk0Ad/Vqavqz07nTvwQ+WrQK2pAC3NaFVhjzRKB1DQ97TRkfJvUbUWCKYQPk3NlCXrYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yS+pi9es; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yS+pi9es"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so34621665e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727231; x=1748332031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhQUwhnYU7FI75x6CtVnKEX/XR74SbbKqPe6yi9d5HE=;
        b=yS+pi9esHPzn9P8cnOK0HW60xsUX6K6tzLe8q0f3h37mVMk1RnkJ090KPSSiy2RLK/
         CDFgoxrs4K0hqcjSsY5d1p3WwaRgZiFsMV88Ae4OK4amOsSmaif6iPbDNsLvJpzOXrPJ
         CpVIUgL0pmsqW5KMjHjx5v91//4ov5zOVIweUvY7jov1lohcDzhaxiN9DoSwV+7p+ze7
         xQFDqKNUQkqFvS6HLFWOLCJL94bCIH2uNqWUf3bC0PXF+PceY7No7OxUktmb9FjlY3yJ
         8TC+7ifxs6i1CMpaoHJcvAbB03jEdh8Ubk6Y6ZYuTvtO0bJJinMSy6snbUnod4S8W7Gc
         YouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727231; x=1748332031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vhQUwhnYU7FI75x6CtVnKEX/XR74SbbKqPe6yi9d5HE=;
        b=MpAtWPERFZxIKFLRwz1VjCjhy33M0EZMlVqOc7h/C/U6myNE0w0ri1gctGEYtjAT9/
         VHsACNBX90Ro6WORjklAw2sSmgU0apdi4QI+p/rHrdl+p4y9nVJ9b4rWEG3sfbWp3c4f
         jBV6pu/V0eviduMYnYAx8FmZekLAPx/GeCBl4bfDZujOvegls4E+Rk13gKPaCOLvkXuD
         xsbaX1lZQ/PeHGhIeKWT0xs89Nz16J/eRdG1dQiC5WOAgNgujVOIwqlOmOKRasQBlia5
         cmCGW/rg0UyikmGQV6qWrGTCEf7yIMRmudeTSHfH+1Jf5JxDK0b1tfsGgFZEM+nT4XiH
         KR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC1L+mYhEpbgHpuJ01Mp1PCUHk6Sax/vIQJFrhZfZBLdkTSU+6+GVwtL7PJcoilckJv1ggtpg3spjPtvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLR2BCwNJZV1HZAkh0a1TTp47981XEKYqfe3pT8FKbMaVFlgk
	s+QlkAn+UrzfTSigcNM12uTk+BWEAAaEYn0iXh3zefsHYXmmnRmZQXkUMQBkmJfPZjg=
X-Gm-Gg: ASbGnctdKgO99vBbG4n9eXIv8HoJ3UnTKAGDCXQL+2a4lRY7d58hYq8eyThTvD7eIzh
	1LfQ0Fr6ZTUBh4RLNR9Q3PakMwYUc2dvyDisIzVycT2pweSlDTLo3HFCcUefii7HPmJwyHA6bqp
	B7ORwVKV+mAubHI/27R8Kc0TI5YDQtlSW+S9iaPoFsCXRxeCTueFhGzch2z2vHnkjlfKSGgoJSA
	urCkxAbGpxZIEgE3llgJSWwJWjsfnjNpSER1qTRqD6NLB8kCOp4QoBwUFnFqWTcfGE1Vf+L9tCQ
	FJc1gU7/b+dmNwAddR9N9OpARrmLdctH2W3ZQl17rCmkacPv2UdPvOljnqY+jICNgm0rPDPXkXZ
	O7GY3WOjhEtyeBzutuUAAA+pdVJbi
X-Google-Smtp-Source: AGHT+IFvrNxWWONN6fA7Izq7hKuoATdvJpsXif6rxp8mTFRfU9yuDA1SyNE9rZHKlxR6ynqs0C9K/A==
X-Received: by 2002:a05:600c:3e88:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-442fd6724bbmr165087985e9.30.1747727230609;
        Tue, 20 May 2025 00:47:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm15599930f8f.67.2025.05.20.00.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:47:10 -0700 (PDT)
Message-ID: <0c88d9e3-a6d4-4a28-a96f-d09da34b78d2@linaro.org>
Date: Tue, 20 May 2025 09:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
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
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
