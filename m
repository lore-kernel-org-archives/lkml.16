Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EC21D516F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431505; cv=none; b=ZrL/v8xNhc+ktTctsIvmVJEyeSTp8SmIWXrJ3dNS25hnRh6baJoFBPxWyWvKgvNn4S9wtUiqQ883rK+6cql7EiSJ8qdCd2EzayCHxk9lpdyTy1SzParYWPwcjzQVM96tvP0DYioQyZsi1LUS8Vm1kdP3+08wNcBA4vvZ8bmzcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431505; c=relaxed/simple;
	bh=V9wBKhsABzmC5MV0f8VU88b7eCISUk+3HgrSsQfRuSQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pnCw1HkxBg350qTbIq4+uKHttTBLzpMFC0KM2KB8RnJdpcOAunhyAfbJ9GcKC1FsPmmEvlegZyRnV8VvDnGLH2FDYDke/iWbNM2WuKxwDsTLBPVbxXK7MOuqkMaqvAbIR5b7TK2cQAJSSSHOsCQT+LlsmrHea3RjPi06aCqYZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUSbL1gG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUSbL1gG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so35310935e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431501; x=1747036301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wie8r7wwaj4hCKnvUhWZAyBhmz21TlJyJxhA0DAvZ0Q=;
        b=hUSbL1gGxMiJtk5uGRtz+Cp0+KIltRvL7+BfMF9wUHgEcgmOiBmqVh1HFAi8sh23lS
         Vf1TH8RYG36hZnIlHDfPox5clhecn0TRiHu2LDkdw2ja9E0q/ia1hjln1a/zeNQq40uC
         sJ4DnOxBuDR20hhn2qzU5mpyFVmm1H8XEu2SDlJbC+UrzWd0p4C+B7zY8Zg+OAoqyIzZ
         TrEwXtgnXaVxvalhsnXM49M74n7qNHSpM6vRAZZaPmGmiBoZJ2Y+Ke7uqBMAaQ4qU5qZ
         sVpEam8+rvwaRcMnCVDyxN4KhLSrB9s6q68htpYjPlXZXWwAxw/8b/m7z84xyrThuUY5
         nVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431501; x=1747036301;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wie8r7wwaj4hCKnvUhWZAyBhmz21TlJyJxhA0DAvZ0Q=;
        b=VCcM7a9X8S9FXSywoVjEwG1NEk9WppXaunz1OvE4tZvkvZy6yot7I3zXWSPlXIBcAl
         srpF8lpirpqKR2O60wm8SRuh7/xbFE1dAILMbXJ9WKuAL19qwpZ7oenRqfBG3JvjL2jL
         PCXrd/eGWaJuHit151pFthE7mywLFX36GbMF06ID5MW6a/JkWkZfOGI8SaIV6ixe1sLW
         +vsvqm6lKmrxcAPYJr6bOjq7deQTLkeCZRugW8GJOrQdNKODATxjFZ+26QZ/xGb6+jEn
         uJtYjXC3TwgyFouUyF3mfH0I8AA6bB70Y7uDW8+CTN89/biBNhfpqiWXsaHxZmXLNmVD
         T8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCV5x0LnpPP/PdxkOlpMn/MIQg3pmxDVfwysFYGkegMPOG9p/6RWeJThNLC+gTWFtK0opf9TqSiWZ/77gHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEORc3j0AH1iDWCj03jn0wb6ByVxQCBkQ/rawKaeN9LORvQzib
	RYRFPK/g/w1FD+81tAyy3sQJpClMfK8RvDpStzvDcA1J+FvgBD3HU0ebEmK0n0s=
X-Gm-Gg: ASbGncvZaeMWhA3Y7dHBDSR5j1QCMM0ry7KzeTAB9l5dIbT/ymRMq+inxUXtxBvHRLg
	gOZ6PkqjFzBhcHAWpFzUJxwMUOwKTKPHgd2wSD56NsdGC4o1xWHZcdWgu512ljbvFBf/vv8vP8k
	F1WAo0PAEc/m6Ym+stq3eMGU3Yerq2zBvL4MhwxupqadOgBxWqSTP9ovg1l5e6okD8Mt9lOGg+C
	Oe6XihMnfoMwp5iMCZoagrJClPiMv5/NyltDVdealHMZ70RP/fgCbVtwCDoAesl3ALyiWxV8QgP
	UCpBzWSIvTlgFidLDvFUAdon11kp8VJ0JJ2FT8b9Rt5lq6I/bPWPk46MpRpjsShhxyVLGg3l4pv
	Ceg/Adwp8HrASDTHy8g==
X-Google-Smtp-Source: AGHT+IEPiJdLqcTbJfTjzTOjuxs/aLJDBS7MKFlyLDYrt9pnVYYisdtCF0Hmrjuu4qXzSBKFvNZbXw==
X-Received: by 2002:a05:600c:4ec7:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-441c1d73a7emr60072165e9.29.1746431501488;
        Mon, 05 May 2025 00:51:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af32a0sm172561445e9.23.2025.05.05.00.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:51:40 -0700 (PDT)
Message-ID: <d1fd162e-9d12-4913-81b3-56f4455784c7@linaro.org>
Date: Mon, 5 May 2025 09:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm: panel: Add support for Renesas R69328 based
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
 <20250503094149.29201-5-clamor95@gmail.com>
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
In-Reply-To: <20250503094149.29201-5-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Driver adds support for panels with Renesas R69328 IC
> 
> Currently supported compatible is:
> - jdi,dx12d100vm0eaa
> 
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  13 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 283 +++++++++++++++++++
>   3 files changed, 297 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c
> 

<snip>

> +
> +static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r69328 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vdd_supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(priv->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vdd_supply),
> +				     "Failed to get vdd-supply\n");
> +
> +	priv->vddio_supply = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(priv->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vddio_supply),
> +				     "Failed to get vddio-supply\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Same as patch 2

> +
> +	ret = drm_panel_of_backlight(&priv->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&priv->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&priv->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
<snip>

With that fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
