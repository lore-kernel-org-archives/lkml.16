Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723921F3FD0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305470; cv=none; b=Jf/QghfhlIid4KwNuFYj7ECYI8rfpLhft+eykc5g9LH9O+GUzcuk5K+5es8eorzQvD8BgcyYu+zndzBmCi/GtjjZwLSGsDm1ZLE9xSyzD5zQw0Qb7zDIxIiJsMo0yYwFRsjhP+rPIBUAHT9uy/cHydoaH6G/XUVlbUP1jAVGLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305470; c=relaxed/simple;
	bh=JtGNBZ7BV1a4bILgL73ErdIHMrvmttVQwrmOPLmgjRE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rKH/f5eDwWT+MLWZt4U3Ax6kjrKsFvOVgnai+51V4n5LheYdQKYbiZ+f1heGNgvKA3EDG0f1O6Jf9XGoqd1Py0I1OHvgey3qFlp2e6ExiPkJNUX9Vt9PJtwLLYG2KXXhv1dfankD4EYIdGi6j4fl9W2G/HsxwWZvY4YFJqX9eMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ikZJkfaF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikZJkfaF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4691310f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305466; x=1745910266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=ikZJkfaFALBZshc2hL9/uJHtJ56zNGtkUrvKPydlLspR+LvAogvJYkEqK7Dciv6nF6
         +iA53yS06C/uXZEhwu1iOa6csHVHK962V3XdrWxJ6hPBmlF9+rUPzATJpLKpVN2JV9q9
         H041vzZcsH9NQG9t7REGn73/tA/vMZ0ebnVMZTu0nzlekMaEBBZYjWZjLvSfj90eqeQm
         70ipgqcc8r1AwV9Wvcd1i5YVLHwOikuZ5+6lem2vdUkU+3hSUG/kA4QAIpr9zYoBAojd
         H9GsYHDqKSFa23JPAhAvYx53pOBnzoa7tI4+N/WEXs/siLh+to02wMfviqKvKuFbObkT
         PawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305466; x=1745910266;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=EVC+zyHg5nBtZJ37A8hIcqelQBqlQcamEycswGsAR0jaMsnvSFpcPigg9aE4H6Y1bh
         Iz1DUkuDns0CXud2xvW0ANRH2j0CsjbMy9cjsIIrUAlwu7VaXc9SZqEJH43PjWr3n7Bo
         C6kBon5UYc14ARSa1mr8kTUnpZYBUCqyojnpqesNqY78McDKtBVe4zqV+1oyDa7K680A
         PiV/zaHTYUN//kjGW58fA+oiwiHIOoHq2GINKzFB7jWKpNwCHh1qv8LP1LSProid8PAO
         jvMNbyT2WRXqXB5rUzKR8SYDYyScPL3UtM+2bC4jDdXN8/8h25vLYa7dkwf9Cogwwhpq
         BtLg==
X-Forwarded-Encrypted: i=1; AJvYcCX74ojNTX4BQonCQlpSZKHQNUMJQl2B1GAUw2BSBoK7MJgAzKkvwvuTyCB3c8EKEqXEqV8dinL4Id4Yz8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QRoSBwjfarKki9Faa6YSGC177dnWJALY5YkUCKdH4nRKxoP+
	A9VAhEoRSc7c4+Z3xuuAQLCu0j8ckQq79D+0OdiG7s1sreTBjvYIvhiZb+N7sTo=
X-Gm-Gg: ASbGncujwL2BqmCz4ehAJIpvARfDsr6hOscujgBBSqAndtq1Rd7ehw9pcLFPpoI8MXR
	5hUxk3y7sTEI4Kud4FQwcaGZoiDuDohH40/o3eIO9rZgA6D5vfwsXB8SeLpocXFHzK692a8KzM0
	oX6i6K6a3K1asls6fRF6zQY2o3rPEnCVVu+0pdwNkAZ+CZ60iCwMto68zN5btV9P1g4ypIKXp7r
	x5B8N1mhjLi3VfgRbzSmQt75Ink76vlCOsw/4Ig45QaK+ilafwDRAKFPPxGvLA8REzehOvdGR4T
	G2Wd8hTLZfEJQBDbexNTYqDcZAYCTA5kuTCA+NwJFgIOG06e7HK2B5zIJof7MVu9ke3XXvgHqae
	rYb2q6vhMiceroo+xkZdAGaBN+QlT
X-Google-Smtp-Source: AGHT+IFkoSeVngdhH4gWhO7gH9R1jUTNRyHvXAKvr6AmKds7Pokhh7kLUhAv02Z1AP3MT8O8IomR5w==
X-Received: by 2002:a05:6000:4a03:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39efba8a4demr11868054f8f.33.1745305466576;
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d006sm14361970f8f.56.2025.04.22.00.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Message-ID: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Date: Tue, 22 Apr 2025 09:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
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
In-Reply-To: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/04/2025 23:32, Martin Blumenstingl wrote:
> Hi Martijn, Hi Neil,
> 
> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>
>> Hi Martin,
>>
>> Thank you for the patch.
>>
>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>> below).
>> My apologies for not upstreaming it earlier.
> No worries, we're all busy with both, offline and online life ;-)
> 
>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>> code was correct. Therefore, calling one of the following functions:
>> meson_encoder_dsi_remove()
>> meson_encoder_hdmi_remove()
>> meson_encoder_cvbs_remove()
>> in case their counterpart was not called, should not result in any issues.
>>
>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>> whether the encoder was initialized before proceeding with cleanup.
> Yep, that seems to be the case right now.
> Neil, would you like Martijn's more simple approach with a Fixes tag
> and backport that?
> Then I'd send my patch as a small cleanup which doesn't have to be
> backported. Otherwise I'd spin a v2 with a fix for the issue that
> Martijn found (and including Anand's Reviewed/Tested-by)?

Please send a follow-up, I'll apply this one today.

Thanks,
Neil

> 
> [...]
>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>> b/drivers/gpu/drm/meson/meson_drv.c
>>> index 81d2ee37e773..031686fd4104 100644
>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>> *dev, bool has_components)
>>>                        dev_err(drm->dev, "Couldn't bind all
>>> components\n");
>>>                        /* Do not try to unbind */
>>>                        has_components = false;
>>
>> Above two lines are no longer used, so can be removed.
> Well spotted, thank you!
> 
> 
> Best regards,
> Martin

