Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB21B1547C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020242; cv=none; b=JxniGByAynTlPnIQXs5ME5Fs6siMZg4F+CON23OOjYqPZ1FBQCCrrs5njpfV+sAs5Jq8Q+loie6RQ0QXVy7BI5LmJTv3mSkjnK6sgoAXK9ckeh0zfyjJTyYMP3kTZBJX/nDJ34iVSU4WNTWJgZChX3CaJURozfKBn5psxnd8NWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020242; c=relaxed/simple;
	bh=MKO3i47EvsJXrvop+IZv3Lpx4xleOvTa9kD4tyDCfLI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LwI8DvAAHON9sLaZGNIJmdMRz3SHIm0aY8LlHwQxRmIcn2Qqk/uGOBsPbTntp434FaQbEqEeg7sqgpl7JvDvGQcGXRPFdSyXa9hdT/h+h4cyzY0hfE8n2cflnrkkZodpyGf7azg2OXUznZWkSKNkbOCvqkr9e36jZ0vgF4qhTN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tArmncGx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tArmncGx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso29059765e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744020239; x=1744625039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9HinkExaT6RLhQRIBbCS/ciYHS6bDl1MnAwf7+W0T4=;
        b=tArmncGxt9UbCQJw7EmAteyCm7O7ksnn/GQ2aDRGwnQqiwORH7vHIAo7qDramFbaov
         E8xVw1rgYDBjZ1dqxccXR+7m7DwlslU35+TU860IcISN3essZLNleU9r86LLDri/X3U+
         tG1mzFoDha2ZMSzqxbtgEj2GiLdV32EtqFjwclplmCYpx9AX3xIN4h79v3zxHOALPFcD
         ADiiiv06j5YFn7yxHbRZhnyBwwng3HisWdDofEQxk75FQ1HsSUtU1e+8NgFrpkOcKjVJ
         Fh02r6yR2TNBqsQ/9uhRnzjO2h0FA5j2pASMS0ffkbu2qvZ9JDNJ6AkEbpXJGe6yRBfF
         GyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020239; x=1744625039;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s9HinkExaT6RLhQRIBbCS/ciYHS6bDl1MnAwf7+W0T4=;
        b=qqs+MnqBflzfqvqVpXo3/uE+vzXQliAiiwYw+nt5O92BCcKfBkNaiKXaWYAJwcOtRR
         yHnx8yX0IZvWFymG8cP3KQrr2NTHxMNH/VbOUTEft2Ck7sEKbH+cCU+EX0imu1cp3QcY
         sc5U72QmEal9nMQnpXduJMZzoUYmplQp22U+9d2KQggRr05AtVli80rfoavSWPI6rj7E
         koupORO0uW3J5HXjInZ9ITdLXqy/Ad5+IBh2sxI5OMruZDEFROvYCTdvzws/xsdY/F3n
         2Hq8peJWfXk0BJyo+eHfBFpO+uq+QHnPyStfbR047wVIdwcIiyDXHlusc+XAE1EgK/rn
         sJgg==
X-Forwarded-Encrypted: i=1; AJvYcCXwhjj75vpjSp1hNGhCJrh6GR0mG2cTejAA10oWHYuF3tGRbFKC0KOHJ1RQD7YS1hemTcmfSwv6kg9GfaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2BUknK5JdUkMrVCbK+75OGQn5q/mw3Ym0mQwqOkpyw1gcSRA
	1mg7kT0EuFIS36dWumd0Pl8bhy+n0he/58OtUyhxGI8860lU1nGepvL6p4D5mzw=
X-Gm-Gg: ASbGncssANDZR2r8WWzDLCq+XeF6zM0DnYvW33kgW98UaeclmNMfcMbJ7U7rC2NcOEX
	U9FM+JImZ6OPgQ/opM5xYCpn7l8yPby2q6gl3pEa/W5k8g2XzUNNTUwTq1lCWEYi8DSe5/cFjT0
	PP9xxkhOOr6BJNiAJ+0lMss4YkI2PsP+UJWEglkdMC6A0NufePOBO7ohdH+j+EkBTd6HbMdMECD
	mY6zgMl2Po4OlG/QxP0/fgPIiyULj+JhEfk8St/VvbHF9Pwr8jLizI+N1/Y3cr0xroYE/oOH/oj
	dp9uMqAIGOdhNYGBZshMm1OA8muHrxJ7XcaALt71Xrj8J3LBpJM/RO2bJH4zrRBa968bFmWaYCH
	KohLbeMI9U+JunpSi0lGNdQ==
X-Google-Smtp-Source: AGHT+IFEBXP8z3vBW8Gz6AOncAEfHt9xZOag+3XoHAxfL5+aQNCPhWcFTfnqF67fNk0u+70yvCBGWw==
X-Received: by 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr133861595e9.15.1744020239130;
        Mon, 07 Apr 2025 03:03:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba17csm11679985f8f.58.2025.04.07.03.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:03:58 -0700 (PDT)
Message-ID: <69543597-5e7e-454a-b83e-dd169a95baca@linaro.org>
Date: Mon, 7 Apr 2025 12:03:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Janne Grunau <j@jannau.net>, Michael Trimarchi
 <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2025 22:20, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> Final set of drivers.
> 
> Part 1 of the conversion : https://patchwork.freedesktop.org/series/147082/
> Part 2 of the conversion : https://patchwork.freedesktop.org/series/147157/
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Anusha Srivatsa (46):
>        panel/orisetech-otm8009a: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm67191: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm67200: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm68200: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm692e5: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm69380: Use refcounted allocation in place of devm_kzalloc()
>        panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ams581vf01: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ams639rq08: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-atna33xc20: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-db7430: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ld9040: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d16d0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d27a1: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d7aa0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3fa7: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3ha2: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3ha8: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e63j0x03: Use refcounted allocation in place of devm_kzalloc()
>        panel/s6e88a0-ams427ap24: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e8aa0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-sofef00: Use refcounted allocation in place of devm_kzalloc()
>        panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzalloc()
>        panel/sharp-ls037v7dw01: Use refcounted allocation in place of devm_kzalloc()
>        panel/sharp-ls060t1sx01: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7701: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7703: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7789v: Use refcounted allocation in place of devm_kzalloc()
>        panel/sony-acx565akm: Use refcounted allocation in place of devm_kzalloc()
>        panel/sony-td4353-jdi: Use refcounted allocation in place of devm_kzalloc()
>        panel/truly-nt35521: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-summit: Use refcounted allocation in place of devm_kzalloc()
>        panel/synaptics-r63353: allocation in place of devm_kzalloc()
>        panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzalloc()
>        panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzalloc()
>        panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-r66451: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-rm69299: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-rm692e5.c: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-vtdr6130: Use refcounted allocation in place of devm_kzalloc()
>        panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
>        panel/xinpeng-xpp055c272: Use refcounted allocation in place of devm_kzalloc()
>        panel/s6e88a0-ams452ef01: Use refcounted allocation in place of devm_kzalloc()
>        panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc()
>        panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 10 ++++------
>   drivers/gpu/drm/panel/panel-lvds.c                       | 12 +++++-------
>   drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm68200.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm692e5.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-ams581vf01.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-ams639rq08.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c         | 11 ++++++-----
>   drivers/gpu/drm/panel/panel-samsung-db7430.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d27a1.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 11 +++++------
>   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c            |  8 ++++----
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 10 ++++------
>   drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-sony-td4353-jdi.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   | 11 +++++------
>   drivers/gpu/drm/panel/panel-summit.c                     | 10 +++++-----
>   drivers/gpu/drm/panel/panel-synaptics-r63353.c           | 11 +++++------
>   drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 11 +++++------
>   drivers/gpu/drm/panel/panel-visionox-r66451.c            |  9 +++++----
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c           | 10 +++++-----
>   drivers/gpu/drm/panel/panel-visionox-rm692e5.c           | 10 +++++-----
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-widechips-ws2401.c           | 11 +++++------
>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c         | 10 ++++------
>   46 files changed, 223 insertions(+), 257 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22
> 
> Best regards,

With the patch 41 build failure fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
