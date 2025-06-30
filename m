Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626E28EA63
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297952; cv=none; b=uTL4c4+RMftHUsKNBwoakvwnQpTGjlqQQ2eiYopCmLvU5dPRRCHfI92Lj/TMKiG0A+BIQxLaxbf/PlNVxXZQaCuY/qC8akQu7TK+4tZL4HABAulVKj6IcZOkKTm9GOekIYJZuZtUbPFGSWgjbRI+fb+73vkjRtFCNSbthoywFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297952; c=relaxed/simple;
	bh=AD8rStqRodw5T386XM2RP94D9EpnHabJ0SZTUj7Qahk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MjEpMBoDnQdH+bY5AeFXo/MvghGJWLIKlcRu9zV6vJG5Q8wEjlX8tOAYeh59pKx7CavmNLa5xfJDY/eGxKAISCSpEx2R7Vu7vXPH7nwG3A7jq1yUep0cRC36r2z9Nc8P5b04dqST7cpa0NkP03B9TGeGWZAgWWX2+kUzMilh9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nig/9szR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nig/9szR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so15429745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297948; x=1751902748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZziG/0VfzA1IKuwjL2tWIJBNA1ugi01gvbDxIGbv/M=;
        b=Nig/9szRBPcWlOpv86qiRq7TZTMx08Uw5fSbfXD9hdSqFR0/Fae+UCUcQfk2E23rBi
         A3Vhnxwn/xmn8uKr8AxWXhFtTR7S3a1JjaLdwLk4k25It9F/IqD+rRIb7AI0sIFk6xRg
         hq44t2qRld5HTY3z8HshSlXjYZc4TqIW8o6f7LolSqUWGXL4g2c6cYqAq9DUwV0hkliZ
         KWFUGOjqDSX/BsdXo9jDqy+rcFXvjoy5U9SQ+kyms9mMd8Rag2w8Gopf16MvMjLS2AV+
         pTQF0DGirg0fCygSTUR1k8dAgPqyIet+rYNWZaHbKDiOtQ2byt1u/2RP/uNJlQ/lek2y
         B9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297948; x=1751902748;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ZziG/0VfzA1IKuwjL2tWIJBNA1ugi01gvbDxIGbv/M=;
        b=ndTRUg3pogWqS1aCmP7P6J/dIl2AEIzr7KgnHA/jY+dyILtPthE1+mZTbru9eMTHe/
         k4X5ojdRPeWlVonBNaw8l8vAqguCqKric9qteAhdS7Luth5Hu9seL/OWG/Bhh/EPNq3T
         pW68PFGS++3RDOOzdrxciTTttQaKtXr5IjkwpWOmCCVs+Pq+pVbyYqYLujgBOFu67wEl
         RB+AJDvSlzg3fpz+SI7OU8HWUu50OF0S5Cgutho1N2F7abVsRbJh/oKy5LhTmsAA+6tP
         6UDWBgtXr+wRcf4YwIOyltC+CYbC3IXRE+RFOVqqDaEN3n/aGtoEEjVVJo9/nYczMNKH
         +5EA==
X-Forwarded-Encrypted: i=1; AJvYcCVkZhSE2V0wXbvvLZmRFzu/duStELL7KI2yY8kO6WO35FAL1xixRU3wTFEUtyIgkKy/dOVCrHpOBaxQN7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YynQ2HSDXYeio7H9aNqzEzdJ/JirBIhu1zVQ9ANY+hJnw2kS0im
	ARcgeVReY/dX4te5XR3THvB3zC2KvpBEa5yQoGPlkw1a1wsET/G77genMzzwSXjNIjw=
X-Gm-Gg: ASbGncuoBYBJGJozOWC0Miu4ZfJP+4s6DpwAvCn0IrA+PbMTfMPMEhynOvIENSnNGmt
	05pTT0UFD9dRd8arb7U/j/g6GQejynUdXxEMCNJf6hWAyRWQUZndTCeuCx6B8rz4+xzZUiuyS5u
	tF45gjINvbf5y+4cItFIYnJOpxknivcYVh7gJA4rki5FSPJD/xaUaMD2HHiDF263TSINMbGDINj
	Uva2y+lJA20UfMzt8V4U2N65/BrH4I1qVHJe0zajUpI4+IaQjBH/RgJmf6lhcXnmtWSOp5p8Zqo
	BuFuQ0Aunug4zNP7RZV9FAD/fd3+SGxhhtDWcYdcbqs4As8Kq/ZyOPpARrc5Bs0/GjGfCuJwzQI
	k4XrSvFtbw4KsvtFQs91iUOm+VtBEZcSBOdt+XxCss9P3qYnAxg==
X-Google-Smtp-Source: AGHT+IE/EGZJuAhfhPDcepQz5wUmqLOrRpHMIC8QD5spKCHPPzfBv4cSrm45NH3NPOTs4Wj0I/lClw==
X-Received: by 2002:a05:600c:5250:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4538ee61eedmr121126635e9.22.1751297947477;
        Mon, 30 Jun 2025 08:39:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453941c67c2sm94163985e9.5.2025.06.30.08.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:39:07 -0700 (PDT)
Message-ID: <7b564815-c9e0-435c-bd77-63da42aabacb@linaro.org>
Date: Mon, 30 Jun 2025 17:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
 <20250627-dsi-vsync-flush-v2-4-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-4-4066899a5608@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the unused MIPI_DSI_MODE_VSYNC_FLUSH flag. Whether or not a display
> FIFO flush on vsync is required to avoid sending garbage to the panel is
> not a property of the DSI link, but of the integration between display
> controller and DSI host bridge.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   include/drm/drm_mipi_dsi.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..369b0d8830c3d14a4fc1e8e38d5fa55f04ca143e 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -130,8 +130,6 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>   #define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
>   /* disable hsync-active area */
>   #define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
> -/* flush display FIFO on vsync pulse */
> -#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>   /* disable EoT packets in HS mode */
>   #define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
>   /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
