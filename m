Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA4192B81
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616324; cv=none; b=XWQjiGL5erhg3Il1TPdNWF74l7ZJixIUDDIycUwvVrZ739Mi7rz9w5nHcgzw5UVXdMy5YFVGfHFw/uqxe0SQ63wdWppfGu7z6XsTs46DpIzxh29q59B2OrCfWd7sqGeBMk+PY/xZnfhnuGOH+995CdCaarCI6DT/xGt+0CpU4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616324; c=relaxed/simple;
	bh=PK6Ht+HiH5w4/GX57D2MeAlVstDo1/+T7zOn0/kvMGU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XySPjAkjXM3zpj81V8hfDUcwNBtzpLPL3BGCanbapTfQ7kUX2Kcv4am2HO2uWR86mAWB4pQ9QXzFZButGy/2PBbFX7fsEcJmJCHl1w18hDtMedjQ/8wqXs1B9vwChy2iekOyxARiU8JX25tpLmdpY8D2fg3HYt7uX2q4KBbimak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+woZfum; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+woZfum"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so44243905e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744616320; x=1745221120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYNlI03NSFPCRVzjpBp2v2uGfOYgtNYlYwGUmgY2K2g=;
        b=p+woZfumRN62HneljWq+5QA9rsfyMXOs8gip9uWgrrx3vnUqCtFzuVzS/nNrsLs3l4
         YlCk+q4bYBejKSmi6jq1P6moNjajReIV5YVERf2oinP2+Vc0qpu0flEdDMZQUuUMpbSj
         AbJtr38y2pTiAqBxIDxo1AalZnR+1aXebndYVDimPLYQS870nPByTwnwbo1Oh+U5m6wu
         +oOtGeftUOEhoOGIPNF2rlUUfGNTTWkj6D5XcAXAVT0O2X1Xpcpg4mhxKrZtgIlnKQEK
         k8H63ajubCR1lwdhim7q5KOU0UGAjqTirS2fx82iouYXXY2kGRq6oBn+g3XhKQq5c7w2
         TjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616320; x=1745221120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MYNlI03NSFPCRVzjpBp2v2uGfOYgtNYlYwGUmgY2K2g=;
        b=nmWx54+E/6/GmZuzDIfNh//jOi7IcXkpG/Ha/WFV164oo/mpvkKb9r9db/k5f0ySIR
         OK2BwqWtrZZxDztHbWmpnMiMZmOsShFdGYYgr3pKLzo/2duvlN9hB9noudIl/SH0H/Ow
         LKDkpGZCYfPIbi4xbf1oumlxjP+IT400G0HOUVdhdO6D/5x8t7LZHS5lzexKZROSVOKT
         kY7/HmxLchVLU4mKbNyVag+C/BTxlz0TOK7mOXmzCnldLZ7iGRTuNRYQBV5iMH9zjKCY
         zIBEYxkTbPg/SgYyGeaISEMwCG2ITVyZYr8S3EM/yi3VPo+PLXzBafcNl6Hex6AnpM6V
         sYjA==
X-Forwarded-Encrypted: i=1; AJvYcCUsw27A9XpGbNcZg3/Pama9G10wC5qJJlt+L/Y1U8IQFfovr6hP2SPortJFfmPuyjRqFqlz4le3BYSv38s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhLu2uVj4POUhsBussTEpRY8o5TK5qgCTLArSPO5XmM2beV5X
	qUbWsZZNpwq0iqUaOtrUGycFZrwbv38pTgpwL1ltGne547qzC5IJsCL685Rq89o=
X-Gm-Gg: ASbGnct2KZ7WfGfa29zCHgVcZPTSwjcA5IQ0stdFA00K+ooaMSBC0LZjruVk2DCJgmY
	gPtOUdm5Kxr/YsNpI0X1oQeiObZoCAl5vr61xUVS+HKqzVrY03U59FhQOyeSFE0rbIUjA+1kzYB
	HnVtxSl3gaCAMD+XFjWMNsxeNVw0miKzrYqpNvlO8hRiQAE/T98Ial82KVOiLWJvxTew+vL60Am
	ySGNnWgAblwo66FTrof2vLXuhjRCXR5rTsaJWBJPbmoHnAsMVZQ5SGJdVR8dtpLKb7JJueq3Oea
	kY0cvrfFj+TCTfsLYU8AeHi3uiWn5bKq7jE908OeHbt/0Q7z7uwNBsy3mmoB5TZin+AW7IP7+mz
	M8vYqkneUYTC6Bhbstg==
X-Google-Smtp-Source: AGHT+IGBsTeZKgtEIA6eBsKtlhTmfJORjmAjg8djc+8TB0H998iWJMOz7OhNgNtbKdy1asdxt5v8ww==
X-Received: by 2002:a05:600c:3848:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-43f3a94d9bbmr95557245e9.14.1744616319738;
        Mon, 14 Apr 2025 00:38:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c49f7sm165738265e9.17.2025.04.14.00.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:38:39 -0700 (PDT)
Message-ID: <ea1af202-6349-4f1f-ae15-41a483e99c2c@linaro.org>
Date: Mon, 14 Apr 2025 09:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Avoid including uapi headers
To: Andy Yan <andyshrk@163.com>, lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 andrzej.hajda@intel.com, dianders@chromium.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
References: <20250411115941.318558-1-andyshrk@163.com>
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
In-Reply-To: <20250411115941.318558-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 13:59, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> It is not recommended for drivers to include UAPI header
> directly.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> ---
> 
> Changes in v2:
> - Collect R-b from Heiko.
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b1cdf806b3c40..deaba3b6f9978 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -22,8 +22,8 @@
>   
>   #include <media/cec-notifier.h>
>   
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
>   
>   #include <drm/bridge/dw_hdmi.h>
>   #include <drm/display/drm_hdmi_helper.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
