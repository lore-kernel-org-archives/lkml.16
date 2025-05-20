Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867F1DA61B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731402; cv=none; b=maH3pElzaPUWN30TuhGdn+4LSRzIf0fIPviMdpQXNMYEEiJY24xS7uKQiZ/ZmrZQBt8a/CFnVri+U3KWR0nkTE6NgbizF+vV7KHm+QC0emayTzqTQWFj5RCUJcH8i7tBKGXUgKbzpNG8loHvwoRvre8jeQQzcryv6mnr4EHWMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731402; c=relaxed/simple;
	bh=gTOEFHhEVtSsMXhUVOfV50UNmO+gWk1rhRzIRqfppwQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sNVoi+cJyqr3TvA85rYwNlc8OjkVC+8KShqiHRvknTMLoGY/6AbacPk1TcX8DulfGQ2PmPWLq8TzSE8qTEwgqyI0Pjh53zDP39VIL1ITvyElwOxmBcKoXPo6VwH/OevTbnwLPTFI/q9C8h4fIIrfPBJ595aUS7sAQIYYpaI6Ang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usU2oo39; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usU2oo39"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so65547385e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747731399; x=1748336199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJKlEALqukBWVIaZSvMQu0X1rlqrFGy0vpDP61lvuJA=;
        b=usU2oo39cNDyVJ/RDt6XxoI4HnsCj+NW5e9bRGd4ZM7tCWfUsaaIqxIN/o4SiVdrnH
         mKdaDlYswOQZMOQekKYSHpVIFTwaCL876p+SugGnECMz09Dk2c9akJLLFOoN7mguPTid
         3HGw7dF+dDWnw41xbwh7Nj3DEP4QWohdaVEm5K5GklBvSj9dP8a6GgFejMktfThco+op
         hB8qAGjG1GAFbwUM7/djA47woK16Sy31g6zHzTDHZMoPZpCASnSfXruCXitVtFEI3gw9
         7M8ct28+VdBWY0RLgFtcKZQE49CtQakm+olCHcMj9rVGlboNG45fjxLfe2v/PzB2A54l
         RjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731399; x=1748336199;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJKlEALqukBWVIaZSvMQu0X1rlqrFGy0vpDP61lvuJA=;
        b=MoJ/T39wOuh21D3EWuaShrg1gsSXEb/2BHSLyYxyn0/LhrfilucgaV0EauN8SyCCxc
         0tTSBY5VW/WyY+n2iwZ45gE0e3YZCiKGfn3m3IUjk+ioMsTaY9ZK3a/pBXnd6VHctp9N
         1amO13UbPlH7YaJs6gxj99R2OohQmZb24lbRR9L3+VqMEKo8Lc7E91L8ni2rm83GQp1u
         mctEzxr9wrDSTMgvqyuz/guU//56cV3UrZSop32WfZJPp6X+RfRdDZSFcFHKfAkbaW2p
         pWxVGRr55U4SuXwoVIobA5KqaXJ9ns/VPorXszo/kL0sr/Fsuc2Ztwlra0Rd3MOxAbhH
         1ruA==
X-Forwarded-Encrypted: i=1; AJvYcCWxlNjGr0DbLlcDfwyTDW/duYvbhX3wO9mUCJai1shgKUr7RizDOXnThXS767oGLbOBS7EdLyveCp9qBFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/v7PFInXWY1DymPm+cOlg/YYoMQcf/b3dAYbwx/DKPY3bplny
	aYqnbS0zHq/Hx1W8An2+ZhuUjh5mz/P3B4PMlrz733xrD9rjXtPwCdMAzxwMIVQGX0U=
X-Gm-Gg: ASbGncufApsP2f8N/X5mFoof9p2pr6FGh5mDt3kkCEZtJSxzUazaG3V2yfQUZOv5ISn
	K9rT2mqoueTCdOnfj0NoM35akx+vic2ekx5/luMTcdI52EuL+iIjeL/DjozJrr8KNOscZweY2B7
	giBlsMQOtz3bUznkoAf7V3L6I+IFaRW4+KPxUQSePTdl8KcvnnXsD/kJs8DDThqL6FXt9jnfS+p
	+HpFHFfzdchYsBorwRiCKl1Ba6m2JKXtIs1rVN0esV0UFuspFYRkTSDS75J5WIiemALrUojdoW1
	vE6BMAZMJVXGqRrXRd63Dm2lmV/7jAiMOrmWH6N96Rjh/WspBp9ELY75x0z8wV/CKsd+B5K1zLN
	MktPu8r+u/z7eFXDcbndVvEmSQQbY
X-Google-Smtp-Source: AGHT+IHNhmKQWrNn4QBK50SWwlms3o9VxLv7gTlj1bGD4mEbBOIXSOIVbGOCKtrZsXub4P9ruVz32A==
X-Received: by 2002:a05:600c:3c9b:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-442fd5a1e4cmr153219395e9.0.1747731399071;
        Tue, 20 May 2025 01:56:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99edsm22193575e9.36.2025.05.20.01.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:56:38 -0700 (PDT)
Message-ID: <35cf95f6-30ba-4833-a059-e455d7370fda@linaro.org>
Date: Tue, 20 May 2025 10:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-simple: fix the warnings for the Evervision
 VGG644804
To: Michael Walle <mwalle@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250520074110.655114-1-mwalle@kernel.org>
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
In-Reply-To: <20250520074110.655114-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:41, Michael Walle wrote:
> The panel lacked the connector type which causes a warning. Adding the
> connector type reveals wrong bus_flags and bits per pixel. Fix all of
> it.
> 
> Fixes: 1319f2178bdf ("drm/panel-simple: add Evervision VGG644804 panel entry")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 82ee2f12b8d2..0a3b26bb4d73 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2198,13 +2198,14 @@ static const struct display_timing evervision_vgg644804_timing = {
>   static const struct panel_desc evervision_vgg644804 = {
>   	.timings = &evervision_vgg644804_timing,
>   	.num_timings = 1,
> -	.bpc = 8,
> +	.bpc = 6,
>   	.size = {
>   		.width = 115,
>   		.height = 86,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
>   static const struct display_timing evervision_vgg804821_timing = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
