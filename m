Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D23258CD0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616247; cv=none; b=dFENZ8QcZamNZdIE9yqjqEsKr3ocqjzZkBSAa6KwM52O6Ou4saZqaZk8VKAh/SS+dXOZVd/WxiRrAyhIc6D/8v9EtZ5m4N70rRH7KzRqKaSq1dYmT4l2NJwUXk9ZRIr9vMldV14JnyRn5k+b6+MdfWyXQ0BLqrHNZqygrt0+Ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616247; c=relaxed/simple;
	bh=elbZRn0KEha2cx13iQpfpa//89K5oQ0uVKk5PhMhcgM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pdmEzFQLqnxiY7zVbKvR7w4GiFc6FOUFTHAYlpLnm4o828jPQGXYHGWwlGnxm3PPe/clPaMjKnyrOIMAfqN026tFE03MH4cbhy/ovaqIKL5NzJNkIENm6NxqHQ0QbiPlCqN9FeIowAfukgpWsS2O1r6Xpm++hdq70x6IX/hT7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sN2yIVa+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sN2yIVa+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edb40f357so32965365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744616244; x=1745221044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epOflPPMn5sd54LuK8TeD9jvB1zpkeDQerq12nfOF1Q=;
        b=sN2yIVa+OY6YobE3P+A1k/d55sv7Ddnlz5oVeMcbb/Frm20bl813MIk7/3C0x2eQjF
         TkYK9mzM4jW+4FaUbUXHGoPGVYkVk5skd/CEPbBdL5n+TBA7Jh1c4FALwvNxsgAJjElI
         gO1u85P6/uymnG0LCqwkAx0JVYISbd2Zd6J3cAgmGETelA0y7Zpo7CfOEVgm3oN1h304
         Fvpj3gWkYhgOgO4fj3xxoJ8BaE3QqNEV+VbsVqK1DrGWXXbczoOrgASMQGwYIylNslSB
         SBCwaN9mI+Op8D3vB/WEURTLA/pP5AT6yXxzrX25+g5CRxqR/VaYZR9FdBwycTM1ONVY
         /1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616244; x=1745221044;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epOflPPMn5sd54LuK8TeD9jvB1zpkeDQerq12nfOF1Q=;
        b=ceuiMiamfFI1iUWsEfSTjdsjqZ4qcrJhknIb6DWh+qYLXs9OC3q0mW7VxecZ0Q480B
         7oY+LzJ661q+OLLKVhVn0t7NAr3BT2pJXN+g1U1Wobx0x1OY+XZGYjousoB28fN7wk7a
         H8tbEIFi10jA1JmTJ+05VUmiYzBI6gTKIhMFr0rUj2pkSH6hE9LtwbljtB6ekQcQkWQX
         dtyesctBymkQJH1r23AoFsTBn6un9eiNsO9faAsqR+WzRq3+CVFrCSDpQmCIsShDfNfD
         TCfH5kKBmItC9VfWc77oLDrKv/UO9wCYRtlKD/8XKthtnR3eyZ/KkLZ+fWSFSQiv1mrK
         eUHg==
X-Forwarded-Encrypted: i=1; AJvYcCVZajKzJvVq2qRXUDKZJtzjsWMTo1G8SwWmkfd9nSG7u10qekVr5XzzG6zlMtigI/wg+fcRFOWWtyjHQig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGhXx5Qe9oSoC56HzU0V83OguPw+ysYltScQTa/CXVeRBPEim
	OcpOjOEE8bcrYS11e/fEZYzpDKWtaRrmDzsy/f/H4FOHngPqpgnUg21w4Wr01PQ=
X-Gm-Gg: ASbGncuQAGH2Mj6pRxcGlzrVohVANezXCI1Me1aspfxFT/x9HqrMCfQOvN6QgDCA+VU
	91R0vweVRcS8VxOvec5xm+WQX9CXzwa7gQBYjCS93QvI4tzouaWdVyjigW4G1qS5hvKl9oTxHYt
	zaFFHWpPpLQpApL3UxM8s1OfVU0Wy8o2Fpq4ZyRp3JjBgvPoeu0dylGnI/5XdT1J/Lq9xbwta09
	rLujZyfdtAtOp+MJSWSs+c5K62CAXRCMyv54ZgfUzkzCJT3F6B1X2XByJbAjPWn5XcZgh4vJLSz
	KuPw2ztlG9fIL3tTxxbguX2GPTHYAV5xRKhwZm4eF+LMWTrGKHhgMfhJ5rmaUWtyua0UW2i9Kyr
	JMMzFLu5SyBXi4pVZvg==
X-Google-Smtp-Source: AGHT+IE30Q2IBg8vdQdMaK+lkm0TuOWEMeFPr4luM2VRd6nAtjAYz/RxT1+55R50LGFAcEjPktU29w==
X-Received: by 2002:a05:600c:384b:b0:43d:609:b305 with SMTP id 5b1f17b1804b1-43f3a95aee6mr100167945e9.17.1744616244198;
        Mon, 14 Apr 2025 00:37:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964048sm10193831f8f.2.2025.04.14.00.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:37:23 -0700 (PDT)
Message-ID: <07c6f893-1e46-4f18-95be-5519f1fe9c80@linaro.org>
Date: Mon, 14 Apr 2025 09:37:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
To: Andy Yan <andyshrk@163.com>, lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
References: <20250314075754.539221-1-andyshrk@163.com>
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
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 08:57, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> It is not recommended for drivers to include UAPI header
> directly.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0890add5f707..306e09a24a1c 100644
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
