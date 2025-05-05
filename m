Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B511ACEDA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431447; cv=none; b=ghCO4y2kVyYfM1maptWU+5CsjlAgwiOdrNv0UOClV5pljM2ONYFV57b0mlyy58z3Px4Mp4fS1Hw2jqbPpBR5Uou4LHyfAF7Qr+OyiCPBuNwMOIC8xApQ4pvzO2m1CyIYRhSf6DpYqdvj6OxEF5BJ68XATnHdch3Uj58izIsmgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431447; c=relaxed/simple;
	bh=msS1Da7X8XNg1BESfPHuwoOlF+19DnOu3vYS93+IdM0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=REgo/gNaK5n6GsZtqbM51tEcREycqzatVDbDEa8g78312Z5zUxFRp7INsKoj7hd3TmEUHMI922DoMpMFKsb+MuMABAukE5SGTCSyNAwwgFHN4oW+qxJwhVKbSQHVft/r6aPRf65rLHtjwY4OiDJRSbxo8D/KjYfGwYMTcpzHG/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZO3hhHl/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZO3hhHl/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so4956074f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431444; x=1747036244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCzAWVJKudlGSsTTp8Mqf9Mg/VxXTDyWoombBPE5a9Y=;
        b=ZO3hhHl/UdbGZJC4oVzqqGo2SATz/0m4hm7z03BvxXzMk0vMqh96Xt010WqujFQXER
         uHhauuHepQDmXHuFzdpiEL0QhQYwrivcUQvSUpGk1H63sFICTTmCGhTKpTpbDAxF6/Ch
         jFC4ZA3cCnep6A44kIVuwlBe0HoYfnSVQMQCH4rN9Zzefn+yImBh1sBB5vvDJfTh3Ty6
         URnvreKWP2OPiyQ6F3lmFSu5agS700FlLO3Fxu6UMG2iNHF7kv2YaJcWi7cunmGo4u/E
         pCJV6STdD4IXr2iYhIvviLSLjlaNHPDQAZV6vvr5uMpPvk3u2UnOqxT188F2spUXWxU/
         aFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431444; x=1747036244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uCzAWVJKudlGSsTTp8Mqf9Mg/VxXTDyWoombBPE5a9Y=;
        b=JASH8n9HPPssiEO+HkBLi4uI9ctvVDXNLF/TgHeg9zDgUhbD/jlzrIe7xCG0AYsy3B
         9x4R5s4GDmR46spSGJ0cBMHUTsO+pAIXCtlFNabPP1G0cEohmB51JY0qy+JoZ+7XCjPH
         3nzlAIGN9kPG3y8TFfw+hK2bkx/5uohAJhwPFPKkFADhD6HGbrUPlfeuxsPgQntECBKF
         ubLPeq7TU9ABpgutDRIQTZ3vVppdX6VY97vpPmZK91mUZexU9g9CBbZQdNNDpTrGocbn
         g0cKXsvt9elAjiTrnmbrJs+VMVJAnJTupv1HbSR7TSZ5ATNH35LZ/HpA/T1A0YlsVYYY
         msIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmhNUYOyvRs+J8lbN5/obPUgyqteAufEFGau4+EUhd6W9h8GD+Xmh01vr4bRoVjlZ6LG8Odb64pUi3iJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczctD6XkjYlRzyGHSViUTPYEc6ky6SjZCTJq53Ptr0412sj8m
	W21Lz5XrIZ0DesaGS6z2x8r1Da7Xzw6JvWte3dkz2Lo0s/O+oJf9C81gKo+ymNM=
X-Gm-Gg: ASbGnctFjRPtI7V+l9Kl7Qby/1ZrtCsehCS+uIupdeyfL21GPB038HBC27WisL8JEmg
	n4gPm7LimSKrSCUSWn5+FAND/k+G3cC4YYwlSTt1Ry7avLVxC8s6bi+gZDyliah+ZoRLue8aCSl
	nEOIfe1zcet9LBBgkhFtVoUIWwpiXqFgC51pX4Cn0ZEwFy0RAK7Rfmx2tneUjvvfCHVcGCQYSJr
	JZJXtXlfDD8ejxmjHjLAcIvssgbSiP5eI74sQGD/mTHmZro66U5QfkCTl81mB2yjFgBF8j7/Wx8
	9ZaOPihTbqy5BU7MTecL9Fi8QvUjByToHLcCm3bGWHATrLWsDhiYIqXRMhbj2cxfxb0fbHpiBQz
	Po49B1XnGgPMnCYEZ3CJB70/MsRbx
X-Google-Smtp-Source: AGHT+IG0YjR0pOS+mPxGwAmH+DdU4Wux8KjtWtFkXVVNHEhAlQOHrjEqILqYPlZacgqXKNWhcBJj9A==
X-Received: by 2002:a05:6000:3108:b0:391:466f:314e with SMTP id ffacd0b85a97d-3a09fd88976mr4436114f8f.16.1746431444177;
        Mon, 05 May 2025 00:50:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae338bsm9395380f8f.27.2025.05.05.00.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:50:43 -0700 (PDT)
Message-ID: <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
Date: Mon, 5 May 2025 09:50:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250503094149.29201-1-clamor95@gmail.com>
 <20250503094149.29201-3-clamor95@gmail.com>
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
In-Reply-To: <20250503094149.29201-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Supported compatibles are:
> - hit,tx13d100vm0eaa
> - koe,tx13d100vm0eaa
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  13 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 +++++++++++++++++++
>   3 files changed, 341 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
> 

<snip>

> +static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r61307 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vcc_supply = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(priv->vcc_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
> +				     "Failed to get vcc-supply\n");
> +
> +	priv->iovcc_supply = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(priv->iovcc_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
> +				     "Failed to get iovcc-supply\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset gpios\n");
> +
> +	if (device_property_read_bool(dev, "renesas,inversion"))
> +		priv->inversion = true;
> +
> +	if (device_property_read_bool(dev, "renesas,contrast"))
> +		priv->dig_cont_adj = true;
> +
> +	priv->gamma = 0;
> +	device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc()

> +
> +	ret = drm_panel_of_backlight(&priv->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&priv->panel);
> +
<snip>

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
