Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C528F53B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297569; cv=none; b=bhY+gIWUDh1SoQjspuBHD43soFo79prwaW+LV4qDUAIX8yrQIQlUWdmmtRZiRMgBJtd38am5zmvtoMFSKd8i6ynzHnzQWE01YbJBwmVDPGqZagSEq3RHPL7/bl+VJZb3DTmXLIKteYkxdnTQhQVi+KIeby05BO9G2f0lX032Myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297569; c=relaxed/simple;
	bh=8jE24o7YZNAkQDGENd9+5jokCstRAjfx8mRG6Xlu7I4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y2hznoHQmA26JcCymYLyPUJ8FCMYq4EOLNZSltro1W93J4q74/Yr2ZbD/S3WEzVd82Q769Xkz8EhNA8XBzcQ3SRSJOJdJvJqrl4AJyTvMzM0dfrxDsSFOwhMVvLAchKpSDygfyv0IY0MAmOiprGfJBOZhpcxbmIax13dvDrVXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ib7iG3QQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ib7iG3QQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2410223f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297566; x=1751902366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atA/KC1m61iI/EQIA0gGrqTkbU+o+kg8hTMAb8HLbKE=;
        b=ib7iG3QQJPM5EV4ORhLmZhmx/v46+2gDTumaaywpZTxxCXVHonYToiAOfdlHPQZkiX
         YKVTrcMK5UiecsCotjd7g62LB1Wkq/LhBRBTEcIpTghVLm6+C7qoGYZBnBZqPrvpD4Aq
         thyD5r1qGil7VEusHT1Zd0KI5wzgLYPiqkZQZq/itytSCoSjXo3u+2isnGE3qB52GWv8
         jfE0mPHENMJu7gclX/SuHGkfG6DtrakQ35FiCQR+k/XBrXzxpxFYQ5wRcc6FdUcfHQgZ
         r09maOW5DAYrF11BZCvYfiSeiVCA/7ILxhuDO5plr3cQY3t/1MVAgO+echbv4nfaDBhL
         2E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297566; x=1751902366;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=atA/KC1m61iI/EQIA0gGrqTkbU+o+kg8hTMAb8HLbKE=;
        b=RonWX0MSyOsu83IBv6ZI0Y9IpbkntivWTVmAGRk2+8rQrYsElwCW6pUbocjfonD1Bw
         hPw1gXeWz6Bprxgb9rx3gDz8dSgcLyxXsBSjzUZybA986oIzA2JK/R6JpyJt0YoikbOz
         zghH7dcxPUgq3RMdtTwc9hw491ufOk1cz0DfNtrtMaZXUHbP66q0cijYfNobj4s+3SkE
         XqvJeU2xejLfUZFcXZu+WxggDcgS28VFGkh381+CxyifvV/xhIs/XS/4frPp1ZV4HkK6
         tEN03RdxdcaZu2Hq6QeMRgzMkMOHu4pj15siDMaHoCx+wN0HZ4ZrA8pXNLgSBIakKEEJ
         18DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTkLkbUT3xRtaIKu+J0lFCuTAkoWGYX6kL4M+lWU16xkc3DIy1/mRhSH6Qn4dPqrfkcPnAY5+6+0Eg1UM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOW7xj5FKLDFjAqukatbfhbxQE54Ru7Y3vLcaYg6mKIdcqOJD
	So9CcRGMTA9MFBiFdlcAtjCdvlRUHVvCAqsTfQBc1XyCunfGoo56MU+yhARk7zdqo9g=
X-Gm-Gg: ASbGncu7dNyq25t4ySAi4orSVbfudVFw0HpRyQkPaAQp6fQ/Am5Zfa0oHN8IowXK+pX
	vH9EpJcLnjyOfM1sqxIThB+YmPiFzwzjMCL3RbWHsjuYAnfodHf6+yoin711hSv6QQwnEBU4xwO
	ULu3/3oP1GO7RketGGU0Srw/Jxyc2W0urw4SoEcd6ws3Kp/YLVgxBHeDRlj4fvSt6n21lSpaIkY
	EPkgci9fIESp1b0vlA0pjzOYFrlDrfPMMalUrYf2qpxf7vYsf1vfquJIX0VPByRqcU2ae9/B+X1
	ybTUGcv3w00V+8QOECLAhssuAvBkK5JN3Eh9s2GOPFjkae7LVyz9RcO7XJUKjXiUuasJeSE6Tpe
	/rSeVUkFRwqc186Z/3NMkbqpdFJOyXPbjYVXpzHY=
X-Google-Smtp-Source: AGHT+IF1MxZOvenNiix21YlE5Sm5JmNj/5PZM5XXAtE+bWTuEZDv9V6ZtvTAasrMlYozwOUVfjtjdw==
X-Received: by 2002:a5d:55c9:0:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a900575c7amr9522396f8f.43.1751297566132;
        Mon, 30 Jun 2025 08:32:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm10573229f8f.88.2025.06.30.08.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:32:45 -0700 (PDT)
Message-ID: <2f317041-bdab-4cc1-a45e-952c97398687@linaro.org>
Date: Mon, 30 Jun 2025 17:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Add missing drm_display_mode
 flags
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250618080955.691048-1-andyshrk@163.com>
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
In-Reply-To: <20250618080955.691048-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 10:09, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
> pipeline to correctly configure its sync signals polarity.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> index add6099ae8a64..92c3e20b903f0 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> @@ -478,6 +478,7 @@ static const struct raydium_rm67200_panel_info w552793baa_info = {
>   		.vtotal = 1952,
>   		.width_mm = 68, /* 68.04mm */
>   		.height_mm = 121, /* 120.96mm */
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>   		.type = DRM_MODE_TYPE_DRIVER,
>   	},
>   	.regulators = w552793baa_regulators,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
