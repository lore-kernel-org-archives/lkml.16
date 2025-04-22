Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938810A3E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305392; cv=none; b=UUg/ONXyh6PDvVmVtY5iis0H31OUsdZlRdHhd2KLgW82IT6U2AXigNqmuhhEF7VPqgyUoPwfW6dCGKjUazXpBKZWE5Et7cXQFyv5mUmTnDAk/W85PrUTnY4G7aKv29RzZEyTOB+/ocw8ypV7S+tEbMUff7mLnDbiZ0ifqie5o00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305392; c=relaxed/simple;
	bh=46kyhEqphEQE7F/TPHVsZNyk/z1K0PgJAjcPqUH4CdY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UXdLuYojxHsSMbGQ8oeq+yT5H3lyJd9QnKpr7om04mNLiWPckXDRhduABj9rxonJYSoMT0AhSCDzQW77uLDre6E8KQcsP+Q2HXoq6t7wGqz8xcFKIOPlq9M2N9VFJLNrqmNRhlMmTzCsZSzs2wZviRValX8e/eZBWya48qQHXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5ZvBwBn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5ZvBwBn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso4609142f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305389; x=1745910189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=s5ZvBwBnqfxw+ZdxMzo8gT66zWvTSk57B5DpifUydK9F6bYGiwEab61RRcZdugViXE
         aA3MAguottH5VtIjtAB9s5bCEfruT62pXudAIVcag904U016XKIP6o6TiLAig8ZGnB3x
         Of49LwreUWky2fNYcjCXLe/AYWEtklmhKzpRRQI/L/iJqxs9Oi4s2QtYQWJuPqVHoJbH
         2SMiExJfMEBjghWuu6bwz59h17OhGXjakqXw1gxd37tu4ydKMlRuqE5vVIOQmmhQWgK3
         djtUcdn6lFGs6G7LZisDzugI8yh3eb5JU1f6u47LYRqcfP8oGDvSjHlxfjgC6Si/OGsg
         bb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305389; x=1745910189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=Z8s3KvA9TEXvamxSCcwaDUjYvFB3CohoK0JufqUemDL0OXHyJxoecPBn1P15kImmk9
         5oGPA1314AyeqmiZ90goAjV3SNDLZUhH+n85s1c4KakKNubFfVbd6pbxTRbLKCzsXW1u
         WiYrvwHw+jENT9BbY3YxuTNsFYu/4Zx78w/e8Z6WeV93VgOlwqeozI46+rsPSkhzq25M
         0Q7W91gISR+yOWctQTaQeMv3CRAEzSDlr4gi3GoM3+WZD5/xSYr0J+huGt2QdFy6B2AP
         7rf7FoBwCe/9iQGN9co0ykaOD0KL8o/G4I8CoR2lohTI6UaGtjY9chhtzH0hbqSrxc2t
         1zMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpBxDbQ2ZQO2WwssR7mS9mJh6tdeIVOXnbDYowxHgKhc0ctGE3TLhEmpiuLb8ABb+dcMQofcn/rZ1aj3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YybveaLv84ECMApEFSaMX6PSurMfq14M2jBYGNVkl92wDvpU9gg
	d+GDGZmzfRvdT9DJ5il/gglfRt+K38ZopsepY+kaj4YgIVMz1Rq7KAYP9TQ5pQKNrSvaaVLF650
	4
X-Gm-Gg: ASbGncvKgI2fZc+In1gBAUJ9V+nWE6w9xE1qpq+5ZC1gBiy51HMBb/7v3GfazNtcHj9
	alKrMfKHZZIdaE5ZpZ9wrIaYZXN7SEa0xJIHtzym5AghOEN7v2KqUtwvG8pKI8GI8yEut6g/C7b
	/7YvqbR/O8kgqcon7tFXdC95F2snyDxT2mb5sfT7JntMYlb/o0Z+viLkoS2FLIjh0cHAzaBHopV
	Y21jJo32QjwlEBwVeZJIJ8tTxoNH3Mf4tyUj8B3G1TSINzUd95d+nu6UpYaZhxufYC9oE5+vMiA
	JBHbfBEPY8YSYPlxnR81bFrJ6B7UlRZTwVO0xD3c5L4urgZWX6U4TY/3Eiy6wKmk/ktjGeakMt5
	FBwgvrEUSb14ZsX+HcA==
X-Google-Smtp-Source: AGHT+IE3A44CHRZT4LFqIN9Z4MWfOqywDl3gBVdthcSxAs8gC51/XERlOdOoQsF0+0M1L1XTm+SLEQ==
X-Received: by 2002:a5d:6da6:0:b0:39e:cbd2:9129 with SMTP id ffacd0b85a97d-39efba2acd7mr10294748f8f.10.1745305388778;
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c37sm14496017f8f.98.2025.04.22.00.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Message-ID: <b88bfe5a-9256-4de0-822b-b22d74dfdec0@linaro.org>
Date: Tue, 22 Apr 2025 09:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/04/2025 22:12, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> Neil, I'd like to hear your feedback on this approach.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/
> 
> 
> Christian Hewitt (1):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
> 
> Martin Blumenstingl (1):
>    drm/meson: use unsigned long long / Hz for frequency types
> 
>   drivers/gpu/drm/meson/meson_drv.c          |   2 +-
>   drivers/gpu/drm/meson/meson_drv.h          |   2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
>   drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
>   drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
>   5 files changed, 126 insertions(+), 115 deletions(-)
> 

Thanks for re-spinning, will apply.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !
