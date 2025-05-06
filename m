Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140F257459
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534795; cv=none; b=txkucEOqCuwzlGQ8t/0PCiT2c/B3roYjqegNDgJ/QQBmvlU4L6O0TuqpcjhN1WOCwDpzPvJYeemXOXgWTbywTQQDFjH+g+YX6fzSReX7pSPgnmOFFTJrOWYmSHIXO0r90+Yuyg+8sMxiKVfmH6pjGiPd6CZuPDQ8SFXYP8bqN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534795; c=relaxed/simple;
	bh=47vAcbyle/puwSeQOM+p45S1yN+zQVF27ceYuf20yDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cp5oYEZOcQwaLRxTS1nliQH1Otne0tZ/RVw/YE6WNg4SdN4/YM3uL6HUe6Coj53nbIXH2bBvJbk5OJ2vvC7/U2wMGFpht9Ru1K9Co6z64ykXt3p4tvYCEch1KuR1dnLcpEW3ZVjHvm8X6lkTCf5RuV8fdU+/id1ueVgmWEABjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3WIOhMw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3WIOhMw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so47138105e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746534791; x=1747139591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tINjIjjqhDEFfQ/0pvAG/DtTHkRARd9gjmCmeJxg65o=;
        b=m3WIOhMw9Nq4C6XQMTV3kuJ23qx/7uz566S+4Y4XNghhl2Pb3jgd7+rPJUfZhN+mYc
         8WULU5D2UsOedStWio4IFUoXnYeqctcDwTiPXK2QfRwFnV9XOWinoM9y2w5XLi2LVrXt
         dboIApGBM0Gwc/bts1AAdmmX1Z84e5CcIOolJ/uMHU3SxBgcxJGeLlJukF2THEbrG5Y2
         UQWuJJ/3clMv6QLVquJSy7waojNQQFgoCrvbmVFgv3xKXYEvk1CTi1Zr/3hrqgyTIxOZ
         SUrT/yhyfAUcdK7s+Zj4v5ePofN4YSHFt7u2D2rLQgIAi8hmwoorBXQCOmsNNP9Zng0G
         RkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534791; x=1747139591;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tINjIjjqhDEFfQ/0pvAG/DtTHkRARd9gjmCmeJxg65o=;
        b=tsQSE5N5pIZgBm29feBQj7YPDTHPpkRFCchich+4c6zZEW71l+soKUgyw/DL7ZcyJJ
         8AsFNnPllHJmxtucpndPUhUIKDUIIYtipkDiFaF689L/q+BbaNGHCACtB78jVC7dEHd5
         6em0C24umuzhFgseqgSzPo+XbRu8l7iTDTT3XXCTfZzm0rAAli7jShQy1wbuQEQCondI
         ks7qV/obHRdp++ZCE/EkBnpKw2dpBJa6bbofbkGnjth2A/+6uoHR8fHWABYbuLXd8QY/
         1YI4S5rVGn6vLlOKMMGbOUT4lYIlS0Iq59YwUzPNhiREgFdWYs1praPTHvXlBZlcoZh/
         280Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4HHQoyV6tZ1hRVCSDxAyAw/tI5ISaCYqh1CUUogbPd/Sxy2qXrdcXsBwMum4i/hgHnWzA8vwogtmAv6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/puDkW2OKCowTeVrOGMj5bJ492V/ZWMnhcE8tcFsj7qNaD6/B
	tCDnca0qgSJnEalv0iB58tkvFgqldSHbTrggYeyyIG0NbJHZ8cfb5PzN4+UjYhw=
X-Gm-Gg: ASbGncujjarbSEK1UXJSVFgQd7B+Rl79/XYal96OtNjRLqGmzWRapPjU8cxn15Y3KVA
	imAlDi3iHxRY5rLI4cJmr5LtFnXcOTGrMjdHWqRLza7FE8jJDMT2gITz5VbkV6g0TqlZnxG4y8q
	DtO6EkfdrX/ARJKxerhR6EPFbYfukOTJxItk8+asK/QiyySSbGf0h8+sb6uljgTb8J5SLHZVyJB
	ROLSSKqKvC5wYJVsITB+FMZfe1a9DcOCU7etxbgdfFiHs9d8MK4BtEbAQx7sXbQR1mWTAgzhw58
	ySjiX5KmU3zbn+cWvWb3ACRRatrfBmXUVfFtDw4LEidd3zGlhucgCRes1i/SMQYPRoHjpgf9BKu
	Gpw1GDyP+QLdYM7f+0Q==
X-Google-Smtp-Source: AGHT+IFLUzofA3vDK/kszQJLZSyj4bajkP+IkCV5UVmoE3eaxq2yBD91w5LJoJ1Tfb0QNKkwp9cU/w==
X-Received: by 2002:a05:600c:46c9:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-441c48cf5dcmr113339485e9.17.1746534791552;
        Tue, 06 May 2025 05:33:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f? ([2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm169854865e9.40.2025.05.06.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:33:11 -0700 (PDT)
Message-ID: <27d2deda-3a18-41fc-a6d7-1c18cba2c1e8@linaro.org>
Date: Tue, 6 May 2025 14:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO G101EVN010
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
 <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
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
In-Reply-To: <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 13:59, Dmitry Baryshkov wrote:
> On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
>> Switch to panel timings based on datasheet for the AUO G101EVN01.0
>> LVDS panel. Default timings were tested on the panel.
>>
>> Previous mode-based timings resulted in horizontal display shift.
>>
>>
> 
> Applied to drm-misc-next, thanks!

Hmm, I applied to -fixes how it should be

> 
> [1/1] drm/panel: simple: Update timings for AUO G101EVN010
>        commit: d5d283d45c85e774b64100137f34e7d55bfbe45e
> 
> Best regards,

