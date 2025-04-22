Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE42367B7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306618; cv=none; b=qVFBOcDgZCSWw2Fcfu917/PQorcSVBRxYhjwm9dnfCfKX41JzTofN2TfbUix31F0mbEdyq8S5P2z72eW7b1JZk9b3Rl91Sg7kBtvrm62946H58OMS88hLEt67S7U0jFueYFHjgtDM0mhXGmEjUo8t7dKhUWUjxBvO2acZqllgvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306618; c=relaxed/simple;
	bh=jbMhpArJQhamnGSoHQi1yj3ovTy+Rc1UArR9DMaZUvE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pLNkUK9lsEtyLWd2O7E9ZPzBcz9J6d5b/krG3jxRnzw0Zm+Dv5jaLeir1VpEcNJagFuqX8mp5RBTC6ETdnDYMS9JSRXUMNX1y6u6nplM13vMiIpvoFGe6Y8MrUSwJvmy12He8b9UDGxvi+XwMJZZH9BZFGadOF0xoEV6dXp1gWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBckiebv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBckiebv"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso2848657f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306615; x=1745911415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=CBckiebvnkhEJ9S5SIpTN9geoeZoGwOgUvYX2Zq3vsdCFW8RQjfvrRSXW5rHEPrOQV
         obJ2mMqwcGGpdimGhgWUzpcBkluyH1MEiF9tZJaAA0u2861MIA0IewxdVNLTbASs3vCH
         4+oXNhweazRvqhJr8X7J156bsmd1FGrpzaTE1kewo+1wVVIfty4yDEAT7pUX9T+Ow5Cb
         XNKuWptRcDhqONzetsOdHkkHxzKDMR82q9RPMwdekmYig/uvmDgtUgXibPrl5ZAQrfSG
         2awi24uKTr1y6Atn9cpjYR755U8AmyQ+R9FDWMBkmS739Hp06TsNpNX6KCFFiAxqHHUD
         YKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306615; x=1745911415;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=RrYdRUroDiMNj9E/LbSUib6P3/ZEpVc3UDppvCq1z/aatsxbzFWD4MUI5tBb07bTvl
         4FMoIzKGyfT+/nTb2cun1EXgemGWpt2U0DF8JIs93IMLGEoKAvTp4dyi/QV4oMhVjy9M
         rT/IWXdfEc+EhWFIAf2kekCKNVK3B+iSbHqlI8XwuebXF49mqjrnxYYupoFfGJ3Ctv95
         yv83qs0LtV7gGprBo6B/NdbOhilElZnbvaXBCU72v4my7Ikw8ttghdExJGlRwQqB/LWy
         3RaLHnJF+wdKglu8ddBNgyq/QErwzBrktxf0Y894v9WI4udov0IT9DZ9BJsEhzRlNlqS
         AJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJKhWeYetFcumf70IUvGLkF6NqFrINoUzBCpW7ZmavzNneJUCd8M2hI0lhKonJaaK5/9v+DYBZeUm03/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjg9Ln8SiDLBLFc4Pqi0EKcGnRghTsBynJlIHRWgnc9dZ/D/wF
	8G0JCA7n6YvIFUrDp2EV80UWcMrQJ7BLgK3tKvC6bY3o+t7Zj63bHiWVP/i+Vw0=
X-Gm-Gg: ASbGnct8v1+ejlpGaVJ+XJGLA9pyH94OS3LD1dT3sBO3N97SXUbpd7sRTcKrgRwrJe4
	dOl5d2jCQI+SxFPtLNtvApsf0fC3bMURqzz6/l+anM52zIFBnX1LFaOnTuN7pIrC+MSkrEFB1Zt
	OOBk4aY8vwgyCrVnUIZOj4I/yPENstLe+cOC/AqCRhM4zmScvdw0bpxlKXB0Xg6jeX8VJUZozKt
	tf6Y4HbjelijlB9UmrlHltO7BeOSsdcFd2Fje/EnQlaYiwZdbERmyAFyg7E4Np0jMoFH5tsRMKj
	/Kyxc4me1bUYgaVvhJcxVG0DxEObgmytTvVXYiM2M6VuwJZvc5ADvr+BMPw93ZZcofIPG8TSA4p
	tnd3oqJC//Tt+mAS4DA==
X-Google-Smtp-Source: AGHT+IGywozzMisXwYOT/E5KYtUsJDT/HnunTc8XE7Knara8DcfAQ+yJD6UJRsAe6X3X6bs1me8xhw==
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id ffacd0b85a97d-39efb9538afmr11846283f8f.0.1745306615026;
        Tue, 22 Apr 2025 00:23:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm13981589f8f.48.2025.04.22.00.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:23:34 -0700 (PDT)
Message-ID: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
Date: Tue, 22 Apr 2025 09:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
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
In-Reply-To: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> On 19/04/2025 23:32, Martin Blumenstingl wrote:
>> Hi Martijn, Hi Neil,
>>
>> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>>
>>> Hi Martin,
>>>
>>> Thank you for the patch.
>>>
>>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>>> below).
>>> My apologies for not upstreaming it earlier.
>> No worries, we're all busy with both, offline and online life ;-)
>>
>>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>>> code was correct. Therefore, calling one of the following functions:
>>> meson_encoder_dsi_remove()
>>> meson_encoder_hdmi_remove()
>>> meson_encoder_cvbs_remove()
>>> in case their counterpart was not called, should not result in any issues.
>>>
>>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>>> whether the encoder was initialized before proceeding with cleanup.
>> Yep, that seems to be the case right now.
>> Neil, would you like Martijn's more simple approach with a Fixes tag
>> and backport that?
>> Then I'd send my patch as a small cleanup which doesn't have to be
>> backported. Otherwise I'd spin a v2 with a fix for the issue that
>> Martijn found (and including Anand's Reviewed/Tested-by)?
> 
> Please send a follow-up, I'll apply this one today.
> 

Yeah finally please split this in two:
- patch 1 that can be backported
- patch 2 remaining changes

Thanks,
Neil

> Thanks,
> Neil
> 
>>
>> [...]
>>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>>> b/drivers/gpu/drm/meson/meson_drv.c
>>>> index 81d2ee37e773..031686fd4104 100644
>>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>>> *dev, bool has_components)
>>>>                        dev_err(drm->dev, "Couldn't bind all
>>>> components\n");
>>>>                        /* Do not try to unbind */
>>>>                        has_components = false;
>>>
>>> Above two lines are no longer used, so can be removed.
>> Well spotted, thank you!
>>
>>
>> Best regards,
>> Martin
> 

