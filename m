Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC522332A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517360; cv=none; b=dTj+v+1nTle+O/3xHslErRvZKct3lmWvrZvE0zT/AFUks30ESYSCRBYsIWKhim24MglJlKMlNulC+tcyINwFHblT3+AMqjix84g9FH+CB9wL4IXdC1xWdDSJ8iSxtQNzOdsTvdsGf0vGq/VlSsZUzf3KvMEVdnuHrBdkSRMBrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517360; c=relaxed/simple;
	bh=KQA97Ib1u0IYIIULA3QsoW91TyVnViRTpSzLr0WJqIg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=orNxh+vTWQ0zK81bMWkea2c7MHLHmgKLieJsL6KEYTQwLJkXyAkAVJhEeg9D0HpvgBv5UQpVCAaSXWzZqb1z1mhv5oZ70YFIsr8xRNlZmeEBPJFazzZ+eKqnVkLhfeuRLnrjNOxr6z6mucJqpH7pPRuyPaGb4p7epQMWN9vSShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dTzrH2VJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dTzrH2VJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so29408275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746517356; x=1747122156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh83Cr86myKpT/xxvxdNHA88dLzEPKe/Vq3zERRKRoI=;
        b=dTzrH2VJ7yrJZsUOvm2Dx//4+MSbDPVRQwQ99eeBIbTk+GrZ0vZWZMP1ozx1TllxBW
         KBm9+7XuQvHUhIWfSMQCc3JvXOaAsY3WTyArfEsQThfmp/fJS0ulb3wvk+ackwszwsmP
         CPOPYktGkVImcbBKI3SXoYjFTX0yUGOlNU9eiMjTtYpfpneqDnejHdOHnx0Z1Oadvco2
         gQStzvaOZyJFVXE6leAfLSv/xFxK+AkCKDVCblM7DYynyEYo0QH1w7Tqthynl570qR+f
         XKXLcPyNtfFitj6duysPoIqY3N7ABI0en2Hm2Xqu4fIt6HDaZTt4K3Bihly7h9xGoL39
         SgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746517356; x=1747122156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vh83Cr86myKpT/xxvxdNHA88dLzEPKe/Vq3zERRKRoI=;
        b=dcjVbp7xcsq5BKwDaJb7M2ZmXk8vXhNzDly3FyfivvPc3iJjEDh3XglhzbO9z6NsZE
         l8AuEN9bLWcjs+1npcECFZLRjufEZQl5kV+1BWcSdgfldiN02qafsjJFPopETl5A95QP
         a57yLS5jXPnzaTVQgWb1JVmHclGNO3hbVauiWwg0pcc1jx4kuhleOv0mx6xU7zrkL9Ek
         8/w98XfDJRLdVPhKft6j4kJetyP+q/nnxjLy7xJmzwSq0UAskdKVN8bmWgb0SfS8se42
         8efDY3vLCqioZ18a4Uz+9pM/i0N2zAOeajaNEGn4zqDod/6hw7kDI7DXXN41zQQ4pwfY
         rQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNVwXtDWHrTWLx4GcURp/2E7H2vYusQbyrta6+DJ/7wTG4VDlP+8wmmLSIiXpJjpcRUxoOpdASEv+n54=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBltZj/N8CqACIS+hb/pRBmG6sryxXYDBtMg+CTudOTcIjILCB
	rzJof0GFQci5V05tiHI4J/YrpYvMrMacXhuG95CIkcM4FTs2M32ZAs4lhtXPCScwaXx8Z5XL83x
	Z
X-Gm-Gg: ASbGnctkM8dWXPzhupQSQ7nm9URg7MQyD16zkLV4J2GHFnIeZk/w5lN/VPevzg0hBtD
	3ZzNj+4IXLlrKqDrwUUyJkpR7HVIARem4c+MCruWldfv/92BfR1sVdmPS1mxIf6GY3borOFQNJl
	PZnMktj7sRtzyQz8GqybvRpLparXw7nhwzO+uhiNRrd5f4VEeIsL46hio3aB+qun+bDFzmUZrvX
	bnZMIiPAWSrFta8u+eOXrXeJV89PG5mCefIleajviD1rVy9S4R4y0y0pB1RAXCq1YX/deqIgMao
	EzU0zvrFCf1T7tifPZZsxQiY+2Eh9Jgj0czycAhzgK+IBKDtdIIFN0dBkIfnqk9P+9Kj2QWi9WZ
	ESspFqyfaJPxgj/xcOoDBso3bgZMs
X-Google-Smtp-Source: AGHT+IE7lA05hqmzBtHBX0KgbjWpLd4PA2JGm5RJ1Hk27fXzxfMHd8z0NDIazoFMjl4M7chYqanXHA==
X-Received: by 2002:a05:600c:1d0d:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-441d04f3a09mr14783115e9.5.1746517356603;
        Tue, 06 May 2025 00:42:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f? ([2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f09dsm12842019f8f.63.2025.05.06.00.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 00:42:36 -0700 (PDT)
Message-ID: <d9594641-a6aa-40e9-b8fd-b6002000e490@linaro.org>
Date: Tue, 6 May 2025 09:42:35 +0200
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
To: Kevin Baker <kevinb@ventureresearch.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
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
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2025 19:02, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
> Fixes: 4fb86404a977 ("drm/panel: simple: Add AUO G101EVN010 panel support")
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index df718c4a86cb..c79dc8581054 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1026,27 +1026,28 @@ static const struct panel_desc auo_g070vvn01 = {
>   	},
>   };
>   
> -static const struct drm_display_mode auo_g101evn010_mode = {
> -	.clock = 68930,
> -	.hdisplay = 1280,
> -	.hsync_start = 1280 + 82,
> -	.hsync_end = 1280 + 82 + 2,
> -	.htotal = 1280 + 82 + 2 + 84,
> -	.vdisplay = 800,
> -	.vsync_start = 800 + 8,
> -	.vsync_end = 800 + 8 + 2,
> -	.vtotal = 800 + 8 + 2 + 6,
> +static const struct display_timing auo_g101evn010_timing = {
> +	.pixelclock = { 64000000, 68930000, 85000000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 8, 64, 256 },
> +	.hback_porch = { 8, 64, 256 },
> +	.hsync_len = { 40, 168, 767 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 4, 8, 100 },
> +	.vback_porch = { 4, 8, 100 },
> +	.vsync_len = { 8, 16, 223 },
>   };
>   
>   static const struct panel_desc auo_g101evn010 = {
> -	.modes = &auo_g101evn010_mode,
> -	.num_modes = 1,
> +	.timings = &auo_g101evn010_timing,
> +	.num_timings = 1,
>   	.bpc = 6,
>   	.size = {
>   		.width = 216,
>   		.height = 135,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
