Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6278F24
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898414; cv=none; b=Tv0DtGoMru1CHN/WxQDLC06On+/gJ1yW4Se5xbW7TzDPnJ/9DFVDqbs44kl/K9tjJK1ba/qLEO9IiEfsLDTSYzu/PDBRgxPXtkm0Bh10pAfpxDMFXzUF51zOpZLruaYz228RL1fJcI4ni1+KsBdc0hffiFqREiSRKpTEq7HubTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898414; c=relaxed/simple;
	bh=liqnNj7ip/N1rCH19BeTslPD5eKFrKq82qizbs+1Dn4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=izLi/zGehLeI5E+oBRG4yGAagHj0SQ1ZhyDzNyXeett+EvagmiIL0Bj7X9Be8SYodUfrSje+PJAlb4eFyT45HxzH9vFTINKXtzV6kQ74f5XXSmbAvJb8M7FwBR0dtX6dQmXu9BvYklGoBRDC2nRZafOBybt9U6Oa6bWQ3h3ZrjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SwWWEPaG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwWWEPaG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so85052115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898410; x=1748503210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9uBgcPlsHvvGQ1VX4ZUYkfYF9TUaS+4+Ub/ZJyGnTM=;
        b=SwWWEPaGdf6fGTQbch6pURPt7knSkv9m5p1vU8Ota5cZmAq1L9tsdlieqmLJf6hlSy
         8BARwN2wjgJUOS3sYeIaU5ybFQWfl9SE+IOYuxqmYK7ZrfL1nUa9VWhQ9dvx+nO5K03a
         4Um8+dO5qzS0cM/NFk2FEG5962ts+tQ8VW5BGgRgbEJkKRQ+VEw6bdE2UABWqVO+Xep5
         17TqixJ7AlAi2gsSmF0q4GfW40T0k5AQbM56pQ8EtVZtqPNi0rm4EYSsNRxBMzeyGqD/
         p3cgFxAMabtvcnHUCdbmTl+6MKNC3a79VGQ168h48fcAy+/s9kpkZdKwBoEesj7aO6yv
         p3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898410; x=1748503210;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h9uBgcPlsHvvGQ1VX4ZUYkfYF9TUaS+4+Ub/ZJyGnTM=;
        b=XgTEIgroz7CJ/WAAAPVZSdMbMCX/Xqe7Da/zNN3dZIvInhIecZX2ioNXYNjBtFd919
         44eqhKpW75seu1D6yFZG1nundBTjXA+kjgoLGBNChlYb4TSFouGt66FtV182zDDXmKog
         3rSgIWQJ91HygAFdObKJKAgCoa96KdYPXuSFn+ntrPPj4Yrp5HkHVThxv3hrFbwKPkm2
         p/lCznfWLGCWhutasyi6urAAZhfGFZxgiUCY8U5gNgGSMsWu9lg5rQ6FtJu3zk6BDlxG
         tcKunxC4OtcAVkhgkQ+sur1r2fzA7VL5Rfrv+KIZi71/pSBuv/4JECcl2teVzkB7i+0d
         5PiA==
X-Forwarded-Encrypted: i=1; AJvYcCWF7saidMZYhjSJF+JcnKMbREWB+/ZASqgRsO7zLsldOqNpBFx6vWEkNkghS3YqkEd1113HPG2c+0PgRIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjvCfbhvYeeHHWcJ2qYuh4vSh8okmKG61wjMLaF6deDt0WFKA
	o0YrgXl0ljgKkrTiLAPFAwn94kzntlVbG32Y4wlisyA8OMxrwKXg5qImVkXIuqRZm4g=
X-Gm-Gg: ASbGncu/REBpWdpm6RDFua77HA3VT1FwxgHXOwKJsUO9C/c5lTjy72uVRH2uLD98yO+
	0LVzTvw/qOKB3DX5EVu9FPyUAIAf27mdUWaIf6syPukwXeIcMUXD4RoHbc9y+UdqqEOfc4kwoSv
	3/E441BLKpFM0vYXysVXaFZycS6m9TORrlqFvpfJTwKPrWPx5znlTtFqdRfB4qN+j6VHdp1hBUv
	5qvAsolJl5RdgMEiIheoLQsst1U2sdHg3QpkYNvOtToRr4MWWk+XNyNNYvk7jIhl7IdNscEcxol
	R1wBvEN54RNUxOB/xtiN8fbOkWv8fWk6m7cpVctBPivAmgvhxmyNukh4cSe27b8veu+Mou7esQO
	eCtvXNsBiCJNVfV7vGo3xO9LfH8Yq
X-Google-Smtp-Source: AGHT+IFWnwzP1okJY9tdDyyXM1yRdATlSP2aBPuqUBU5LyfBrvXpHgVdO6yXg/dSidOoUi6+IdDWUg==
X-Received: by 2002:a05:6000:2385:b0:3a3:4ba4:f3cd with SMTP id ffacd0b85a97d-3a35c821e38mr19239803f8f.1.1747898410577;
        Thu, 22 May 2025 00:20:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3699a9bf3sm17123530f8f.54.2025.05.22.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:20:10 -0700 (PDT)
Message-ID: <6d3e41a3-4fc0-4ebf-badc-6258ee7236cf@linaro.org>
Date: Thu, 22 May 2025 09:20:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable`
 description in comments
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
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
In-Reply-To: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2025 02:32, Douglas Anderson wrote:
> It's unclear why I originally wrote in the description of
> `prepare_to_enable` that "This is not specified in a standard way on
> eDP timing diagrams" and then also wrote "It is effectively the time
> from HPD going high till you can turn on the backlight." It seems
> pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
> wrote this or I was looking at some strange panel datasheet that I can
> no longer find.
> 
> Update the description of the field so it's easier for people to fill
> this in. Couch the description with "usually" in case there really was
> some weird datasheet where things were specified in a different way.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/panel/panel-edp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 9adbe0f11421..74f5f9006a5b 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -113,7 +113,7 @@ struct panel_delay {
>   	 *     // do fixed enable delay
>   	 *     // enforce prepare_to_enable min time
>   	 *
> -	 * This is not specified in a standard way on eDP timing diagrams.
> +	 * This is usually (T4+T5+T6+T8)-min on eDP timing diagrams.
>   	 * It is effectively the time from HPD going high till you can
>   	 * turn on the backlight.
>   	 */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
