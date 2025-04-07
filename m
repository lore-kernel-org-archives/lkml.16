Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF122B5A6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019821; cv=none; b=tg4cAB3dNSzvpR1BNH545v+D65aEkDpjSeaSEVunr3rMe8eD+dPLU9UWWnJf/bABEAyACd4JHUf8JDQWAjuOwg7vh5TFbRQCbzYvLf23Z0131g8RSlntVmYv6SDkyXaIgbozkSI5G2/wGeNVncW5jsvKcVcpuEafgTHXm2A2hxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019821; c=relaxed/simple;
	bh=A9ruL7xjLnG93RT5aR832aUSF+0MTTj6gLCmhm8jICc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BTQUcirofcQfo7WDmFGHtS318nIY+i+yznTIRhFtPusU3p0LemstF8MK0RfkrMIP3cLZS1q9gFU6rw1bscjKiQKkEu/vdZCjlqAh6rbgpzvJUkas7jOmVqL8kt4o/0WUuwGLhHcB5mYGVNCwqfa9c4yf/Byhdrn+FgkxVBDV1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPhdEh2s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPhdEh2s"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4655148f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744019817; x=1744624617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXtqCwPGOTKs8L6GKHRE/kkT9Mxg+yW3hoQGIrcCqFo=;
        b=dPhdEh2s2p6do1c8UZcCHxSEst/PyPX6kVx1X4Dpc8LLqhH2n3CcS1rcKwPvk3Stwd
         LN/DLv26pVjpwPtPyaIi9NaFtO869d3IgcKwP5uNk9+Oo/dhsbQq3Bl+Fd5TtZOavoQd
         ssLUNRt7eXhJxw++S7WMBDVev/l8MSF4m+XmcT7FVtQu3mw7nAxYypUQRSwQ7GnBNkJk
         5CLewXMfQSYpqExHhLcP1MQYpuyp5rM2CWUHw5nG5MuKxNWfsqsP7W153iR1OaSlNSHT
         JrBXWXk9KxvcqVK6wZors+0TBzkqEyCvqbk7Dy3QKqoS0y1zQB0uIWkKW1/cseeTDsNl
         XRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019817; x=1744624617;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXtqCwPGOTKs8L6GKHRE/kkT9Mxg+yW3hoQGIrcCqFo=;
        b=m3juxGHiuaDohQVD6BF5YTDol31Tdb06BUrZv8+d36hHer0F9H7f2lfAnGN/nBevsr
         zrBvTPqc0GI1eAgtzhPpagnHuqmrDK7mkQw9A8+LHcJpWG5TtmUTqhUAaBs0mGU8krtK
         sbRJg5+7HeVF4hBPyblPuBoKw4oX3ctMcxO3KhIcHhaFZ+i8PB8M4khuxWpCLZvPK9Pm
         PCTGtOGFIVnfSUtmCsL9JvMdJ7CvFpzXqFS6Z2XTKPg+t87gZONzFgoCvCkv2V9nXSbx
         3Hc9+xaEJeMb5AGJ1h47vaszuCAG8JADGA7oE75O2BWeyecXaf4RUpIAb1dn1fleWhPu
         SPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy2RcXovedmnKWIwBAjVXYdPl6LqrDMjCpuYWBmx6k3+YhqVmO3GQvg8S5wa7JqyU7MS5PjLega8pR63E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHYP5jLYx1+zI6Tz6U1j5/WSqt1p5AEfIkvxxhscW0Q9d5rbD
	o1KaWgg7jb0r0sbMJCAMNzYhUc3Q49bs/O1WERpvoM1l2EIb7EUJeucEOQLRdHI=
X-Gm-Gg: ASbGncvTDkBB881SqdFU4F4a2AjkFT4ts+RI0w9SbwEf09eCbqjuhK+dOwIk0TLpazb
	v1i82TLSroA8WO0YlV9ib2/EDa426JWHKvfco5Lw8/xGJIK9FWCc409IvBBwcEhGeHeY8MDyPVB
	6+cD4nmqxdYpyQyzjfZZDy4frA8m+02lwYIoJmgyPWRBSyQjFJXQnG56x5tUnGFPIoTBCIENe3v
	3s/Y5QZN88HEibuoOmg+536zFkXwarIWqWJjXU7k+Of2NXWvzXy6uMVVLYIQLrXtq12b6Id4Dbf
	/ORizt+t42Q3JV4WXtwcv3I7Ju0woLMKpkl0ccRgoCnB3HAhutn+dT8F4bkmGOpTDXx8MsR5URS
	/jIYS2be6xXetkoNUNJ54KQ==
X-Google-Smtp-Source: AGHT+IGU2+WQhScNT5O0ujSkyj7O28i+4bRrJV5EXLwXCElRsF8EUKl6PmmqVjvZ3YzPzMY4tmmXYw==
X-Received: by 2002:a05:6000:1849:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39d6fc49319mr7003160f8f.15.1744019817487;
        Mon, 07 Apr 2025 02:56:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b7dedsm11679840f8f.52.2025.04.07.02.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:56:57 -0700 (PDT)
Message-ID: <0f653e3a-0402-4a8a-9191-97de04ba2b7c@linaro.org>
Date: Mon, 7 Apr 2025 11:56:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> Sending next 30 drivers. Sending in batches for easier review.
> 
> Part 1 of the series : https://patchwork.freedesktop.org/series/147082/
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v2:
> - Remove drm_panel_init() from probe function in ilitek-ili9341 driver.
> - Link to v1: https://lore.kernel.org/r/20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com
> 
> ---
> Anusha Srivatsa (30):
>        panel/panel-elida-kd35t133: Refcounted allocation
>        panel/elida-kd35t133: Use refcounted allocation in place of devm_kzalloc()
>        panel/fy07024di26a30d: Use refcounted allocation in place of devm_kzalloc()
>        panel/himax-hx83112a: Use refcounted allocation in place of devm_kzalloc()
>        panel/himax-hx8394: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-ili9805: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kzalloc()
>        panel/ilitek-ili9881c: Use refcounted allocation in place of devm_kzalloc()
>        panel/innolux-ej030na: Use refcounted allocation in place of devm_kzalloc()
>        panel/innolux-p079zca: Use refcounted allocation in place of devm_kzalloc()
>        panel/jadard-jd9365da-h3: Use refcounted allocation in place of devm_kzalloc()
>        panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzalloc()
>        panel/ltk050h3146w: Use refcounted allocation in place of devm_kzalloc()
>        panel/ltk500hd1829: Use refcounted allocation in place of devm_kzalloc()
>        panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
>        panel/lincolntech-lcd197: Use refcounted allocation in place of devm_kzalloc()
>        panel/magnachip-d53e6ea8966: Use refcounted allocation in place of devm_kzalloc()
>        panel/mantix-mlaf057we51: Use refcounted allocation in place of devm_kzalloc()
>        panel/newvision-nv3051d: Use refcounted allocation in place of devm_kzalloc()
>        panel/newvision-nv3052c: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35510: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35560: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt35950: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt36523: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt36672e: Use refcounted allocation in place of devm_kzalloc()
>        panel/novatek-nt39016: Use refcounted allocation in place of devm_kzalloc()
>        panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzalloc()
>        panel/orisetech-ota5601a: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 11 +++++------
>   drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
>   drivers/gpu/drm/panel/panel-himax-hx83112a.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-himax-hx8394.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-ilitek-ili9805.c          | 12 ++++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9806e.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-innolux-ej030na.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 10 ++++------
>   drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c          | 10 +++++-----
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-lg-lg4573.c               | 11 +++++------
>   drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 11 +++++------
>   drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c   | 11 +++++------
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 11 +++++------
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 11 +++++------
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c       | 10 ++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c         | 12 ++++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35560.c         | 12 ++++++------
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c         |  9 +++++----
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c        | 10 +++++-----
>   drivers/gpu/drm/panel/panel-novatek-nt39016.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c    | 11 +++++------
>   drivers/gpu/drm/panel/panel-orisetech-ota5601a.c      | 11 +++++------
>   30 files changed, 145 insertions(+), 174 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea
> 
> Best regards,

With the 2 nits fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
