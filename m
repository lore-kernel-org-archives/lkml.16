Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C819ABD1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307428; cv=none; b=hF5N5fIaUaYv0Qcz6p1wrDjZ4thRbcDjP6GK0shtoOimvEJLc2NgSutHVnq1KmSs7aZgMQ0xzBZAaHm9D6Xm4Nl3eLZASzG1+Llk1ucUfK4GPP9+rbfcyrhHAi4Fsoj2HfxvtHx1XpNGE9xowkRq9+cF/fv7UdFH1z2LbCONTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307428; c=relaxed/simple;
	bh=RJ6gkmS+PVpZXxWYDusdzBdcIIZesHMT9xB0oNYoxNQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sR1lrE5RRbl7yEDCCgx92G3wvSZ/xyTalaPZY28kmdpJ3L+perL0GmBOf4zht6hKh7MbY+HM/qSshmQ5qiOGfspWYAqwcedmuaVhTfnKaScvIcVneTTCAiwYmlmexlxOvJy4pnHaWUdezetKSeHBLHDlseushBY3D1DxnE8wWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/UkN2eF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/UkN2eF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso32721415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307424; x=1745912224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUrrVHq/ZBK5ekax/PEJ1pXaon+z63IEgJE1VUWtPYI=;
        b=M/UkN2eF2lCEsX6OgkcBKaWWaG9GC7T+GbFDfrbTk9U9TmkVoU+y4XgHwZdFxQNDef
         2e16dS6i06MNs6BM7IfAe7eHa6eDqW8m23jx0tla/D6EQnABqY737QbXw3NCtaX+Efr2
         plrxCpRGe7V5DMfLwOY82j3hDyaUKgK1T0UMjpN90x9xrxnons8+SFLj7NyAcS7tX4Ka
         rCiRl5chS/BOoh7SWx/WIGKSCdzAQRGg2OcfiqWgNJkcCjhtopyhH26EoZUoBD4FB8pR
         eTJzQfAwnjcCk2BbciBrAn9fFE7yS0Ro0AkI0pYYu+mmacFmzFL0mQJ/QmV1oPgX/ih0
         Avkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307424; x=1745912224;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kUrrVHq/ZBK5ekax/PEJ1pXaon+z63IEgJE1VUWtPYI=;
        b=I+CJomEPKGBW6svFKP+uBzSfNVoB/TGBlzsLv4xL1GcmZQLtUQnG2SuEpJVOZ6gndh
         uSyLaMOzMZZyX/3LmUXNQeLDncncKkJUWetsJjdFpU1CGqIFP3tr9ctX9gBxuCnbdJbe
         ak3lyy5dF4MoixEgvCamL+Vez03lU5ZcX7rbuh0L73qhVDwYE0tmDhnTFkrOxErCr7e2
         D31S377LufWRY6whC0tfmQ4nDg8PPua2j+5MtZp8y3n10y0UfvrYev6H4LSBWcQVt+s5
         YLbhCv1hUmP2MR7ipNkprlNo/D5s8/0Uv7oncC8YSh9opnW9eVR+vHrU2NBQZJGiWVQb
         rlZA==
X-Forwarded-Encrypted: i=1; AJvYcCUWBNLBe7IL5blSPxCHIiqX+mMsBao0OaqtDbqzkr7WM4SjgqidkqPXYJCHq/1UVkRKWu+3IT/ZPcNPYbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfbAWC5Qk6J/2//g0q82BC1hBfI0oBE5RPEoyYqXJo2nrKE8J
	FfeFP499/iUJTsEn8Hu3wO4vnpLVcDx588eATtBRkrNhPv6MlK6mWfQXHRtrc+E=
X-Gm-Gg: ASbGncvmW28gyV7nzrER5ywsdB0b3HXsdmQRAfsR1O2WXOASdsHWloUoiNeHs+/CrRS
	FJ89h5ROjzquMBikD/E2LwP4PhyjXtaYSuWWbGg364B4ups7DSnaDgC6I1ywnbK9fR4EfDuMCfY
	BicYoqyim1N7cb02cjw1ZeOLmeJQl/oy0XBa098Cv1n9wsYhYripYnoH7lxyzW9w++hyAB12HY6
	X8WlkCGp2E8u6kdhSKyDoWIW03z/+QfKjwTJxzBMORoctWLbZQUNhGbNYAQCiLpwsVoqOw7Vm5j
	3YtNlov+hGG61/QVB9AwY+/qhdSaNdW2wHAXFqez7Q8xfUedmTBmUXDvTzrYEARDmQTHG5nyxc8
	Kshj37qYiQ3iKfhq4tg==
X-Google-Smtp-Source: AGHT+IGso4dABw4cs3fgHi8irDW9ZqoJpIBb6x5x5lb1dz6I2it3QInwrgMPc2vZyS0ImCdphiPnkg==
X-Received: by 2002:a5d:64ae:0:b0:391:2d97:7d0e with SMTP id ffacd0b85a97d-39efbae0795mr10423116f8f.42.1745307424555;
        Tue, 22 Apr 2025 00:37:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c7cfcabsm7042405e9.0.2025.04.22.00.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:37:04 -0700 (PDT)
Message-ID: <664fc9fb-aeed-4f45-8e4a-20bbba791d1e@linaro.org>
Date: Tue, 22 Apr 2025 09:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: panel: jd9365da: fix reset signal polarity in
 unprepare
To: Hugo Villeneuve <hugo@hugovil.com>, Jagan Teki <jagan@edgeble.ai>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250417195507.778731-1-hugo@hugovil.com>
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
In-Reply-To: <20250417195507.778731-1-hugo@hugovil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/2025 21:55, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> commit a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> fixed reset signal polarity in jadard_dsi_probe() and jadard_prepare().
> 
> It was not done in jadard_unprepare() because of an incorrect assumption
> about reset line handling in power off mode. After looking into the
> datasheet, it now appears that before disabling regulators, the reset line
> is deasserted first, and if reset_before_power_off_vcioo is true, then the
> reset line is asserted.
> 
> Fix reset polarity by inverting gpiod_set_value() second argument in
> in jadard_unprepare().
> 
> Fixes: 6b818c533dd8 ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
> Fixes: a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 7d68a8acfe2ea..eb0f8373258c3 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -129,11 +129,11 @@ static int jadard_unprepare(struct drm_panel *panel)
>   {
>   	struct jadard *jadard = panel_to_jadard(panel);
>   
> -	gpiod_set_value(jadard->reset, 1);
> +	gpiod_set_value(jadard->reset, 0);
>   	msleep(120);
>   
>   	if (jadard->desc->reset_before_power_off_vcioo) {
> -		gpiod_set_value(jadard->reset, 0);
> +		gpiod_set_value(jadard->reset, 1);
>   
>   		usleep_range(1000, 2000);
>   	}
> 
> base-commit: 7adf8b1afc14832de099f9e178f08f91dc0dd6d0

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
