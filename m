Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311826B95E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982563; cv=none; b=QgMDy3VB9dBJuqdKCtjdpR1yIoZhQqyU1O23bcYwMcvyHEa1TYMCjr06siraA6OYUpn4Bh69oIlkFyNuwdwpFKC4/Ej3fd/TQ0402TSwW2svv7yPGC+dXbg1hlwic/2fUauyU9lBMzSG6Qprb2uQpsyL9I76c7HlAqnMNjYvVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982563; c=relaxed/simple;
	bh=/AVFD8LzpgluQR2DOcjxELaJPEiB/ExBAgzinvv9OAE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PZ4sbYag9A+d642JSHBeCbQTLRZGQjcu7P3RLqVCtipTRnJbNaKwi9CXDg/Vxg5gh35ik1ckHXP7QpJrvpRKp158RUyoDCA5j5VaMnN1RwBKVyyBeMYR2AtoH4bvrZaXI8/FqBZkZIyg4dJMaNorPskMSpCd2C/XcJ6qmVFSGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l27aFM7d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l27aFM7d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1088455f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982560; x=1745587360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nPNAmpQ4uOlcUbj8tZpDHE6nlLkjo04jE6tZHQGka8=;
        b=l27aFM7dMjgMQIZjeUAeZQ7c9bmLcKV7SXiV6NjcF0BS5dvujGM3CnhFoblqWCklx5
         9tO0YROON5r6YoKzbdMU8dretuQ5E94KSZk63de0YQCbotmLQh7gvM8PwK9l/GMna4Lv
         S3VKlnrbXsWQXjOZl6TXI0K7sGSwEpxekr+Mdg2Fokfet3bBd4OsX4zCjrL3d/a1J/MB
         D8FzRyrMsdIfUZ5N1+FYssnQ//dtbEN+PIlOwTPVzurQUEZ4ROXF6JWqwd4LEhhMvpoB
         59gsCmiTFzHDMCklkiM6hLmK/+fS7VVQUbuD9wSuQfX806tdkAx5WaH37JCCPErtyjAp
         h+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982560; x=1745587360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3nPNAmpQ4uOlcUbj8tZpDHE6nlLkjo04jE6tZHQGka8=;
        b=gM3WppQNdF+lNKpy8plHp3U1SYfiaP7qeO6KKbc8rlamRJreXhigY4B3A4oJb4fzoW
         HCFkZeDxsp6wdTBvtGZGys7mgNTESYh7Lw2z1wrxPLjOkOGk7RPDVJs+kjRXuhqIg38G
         UT98VcIwAS6PyT6HzxoGGArxHR918+H0euf3OP17EFZ6HXin8vXEGfyn8LZ1P9lztgG/
         zu0Vvinut8oc3Zy4MYvT4vcpWw2+9t6F9iFxc0dDw29lReXUME/dpPgQa1HikJF08FOH
         ao46SrAPbBkehh/hJt3ar1jHYrO4dTk9lUaF71MiNgIWy3F2S8bLyIDd71G11awNWs1T
         Gzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUzlKCsAqG9ZV355k/7m8VEroRAgyFqavkQEe3EX6VdFP9ZDr7TfR7R1Jms7k4FRH+RtANcOuJhnTTpFf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUaC5yB1Y/9SpHPsGe/n+JUm1e4pfHaCkXtJQeFjMsAkyoNmqc
	t7Douu/jcKCgoQ/nEglVQJmRZF0ae3wa/vXBpmkD71g7voEOwwaiP9OCFxtvpKQ=
X-Gm-Gg: ASbGncssl+YAJi652zJaGcPI4i/IhXO6L78cYBpVn5akTxLqUSroqmtW27eL3jip2eJ
	dMZbPTDRCNGn4lEZPFqJ9PL6c4ljr9DaxosYnHbbecbneF77nKEGg8SGPpp81czgsURKbkGadGY
	8BKZ1BxRBF7FgjTcJg+LsSUNX8vbtjZ7hh38XDkKcWXfNXyRgEbOPqrczteSnGp8krOsaVNemP3
	BNHILEsS6LLAi7zZxgfkXVt1KxSGnszw8a4iUjbbwmVtIn+NCCRjar1Csmc7otd9sXq3/0N1HKD
	pbJEJcVHX/aNwmiNka41MoWNyfBmYo5/vIxmeO8jiqY+YQTesl2FQdA6oP9kJrlVinyqTtGkvN/
	Nc6Hwb3+4BE0lpyF2gg==
X-Google-Smtp-Source: AGHT+IFNOOW2oODeAWlVCfKeEYLmpeo6ibOMwXQlsAWVEng9c5Elbns2WJGlRXKAds6lbZMvMnC3UA==
X-Received: by 2002:a05:6000:188d:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-39efba4657amr2309409f8f.15.1744982560266;
        Fri, 18 Apr 2025 06:22:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a498csm2697352f8f.85.2025.04.18.06.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:22:39 -0700 (PDT)
Message-ID: <107cd28d-bdb4-4b59-83e4-4b85dce97290@linaro.org>
Date: Fri, 18 Apr 2025 15:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] drm/panel: make prepare / enable / disable /
 unprepare return void
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> While it makes sense for panel callbacks to be able to return an error,
> the state-management functions from drm_panel API are usually called
> from atomic callbacks, which can not fails and must return void. Make
> drm_panel_prepare(), drm_panel_enable(), drm_panel_disable() and
> drm_panel_unprepare() follow the same calling convention and return
> void.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (7):
>        drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
>        drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
>        drm/bridge: analogic_dp: drop panel_is_modeset
>        drm/bridge: analogic_dp: drop panel_lock
>        drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
>        drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
>        drm/panel: make prepare/enable and disable/unprepare calls return void
> 
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 107 ++-------------------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   3 -
>   drivers/gpu/drm/drm_panel.c                        |  54 ++++-------
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   9 +-
>   include/drm/drm_panel.h                            |   8 +-
>   5 files changed, 33 insertions(+), 148 deletions(-)
> ---
> base-commit: bfb20a655848a9088e3e9ae24b1dcce1bbf016c2
> change-id: 20250401-panel-return-void-d461c71ebd35
> 
> Best regards,

I think you can respin with the warning fix on patch 1 and then apply

Neil
