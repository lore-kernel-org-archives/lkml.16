Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D235946;
	Wed,  2 Apr 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614669; cv=none; b=hYHgdymo/zvGWWHfIMkYnWHnt+dqYBfqFffVtCk7my25HBRBe6ruuLnHnxEacijCuJvvDSNMfz+uG7ac+94Jv5VQz/3Mt2iORvzV5HH7ErIYIm/+pjuCVvu0ugIAnF0hegLj2ptwnw3GBbAZ6yjMqU0hZdIiZNTzQpSrz90ills=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614669; c=relaxed/simple;
	bh=6/IQIWw81YF4I3ww+QWFv/mTo+GnNJlko6uLlmyFKl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJA68kof907UNvavvO2B3iET79Cd17bImbtWnEOCRcDG84fH/CTH+4h/KIj3qBB68oi64sWC5UKHls+37btfQFvI9aGBBs4Bl7NSOF39CXMv5q+VpdyOg41GAztpJ9yf3jmFgzz2MtKziv+5zqyhJR/uDq+e2BtXoMPsMPlR7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBTJ3C40; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBTJ3C40"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fca43972so181226d6.1;
        Wed, 02 Apr 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614667; x=1744219467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
        b=TBTJ3C408FGSKKnqfB6Os+D4FIqzDT2Zl6fP9zmn5qfWiSwTkcPIO/b3RZ2GOBbEGb
         bkppGy9jbdzWbDLq6M6AXIOFykmEbeSzxZq3ywym5E39CHcEujMdXsfJf6fkoCo1INA7
         DDihd6PRPvKqhAUT7Hn2KvXD8k3bSV+iGMkNdviROUSx9GNLpM55Sa7qsgCAkLpaiO6U
         C9XNezUAuf6ca+Yii1W6TXJjJUhb1TXcqBMI7HFYtow47CCc4ewkf9DvEuEkDkJBKNUw
         mGtEskpRKIyoROGdjIK39TX6gpF19ejY1Sv+19GbVBGC6ARTSUlRlvCcYk6IQTR7E/vc
         7MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614667; x=1744219467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
        b=jYZbjNa6O7xddmcpvpeQz4mrHTJDbAczP4EFsKcbv4dUSJoQ+UpVulc4e85+C/F7KE
         k+LqSBkDKukJoMkbvBe/CnsGWyY2Bxh2it8MuO91Rf5cHKj0fWvU5dpLf+q6Lv39d92c
         MOS+5i7o0DK6UV9WjMoPfru43kIua1mliz+AOVSmISlUIVUjCWa19ngU+7FYxsw050hf
         XsipJzBiMDMrXFKDgZD3tmBNMjpDlUDq0oIJK9v7nXlDe5Hcx1mo5fnA4/boGpzT0C66
         jKXimPIjnDV+e/DvX39W/+fxhh0UHxTCE+Nxqv8P4H2Oi0GQlN0ikZbLLXvHxXRkR7pl
         3knA==
X-Forwarded-Encrypted: i=1; AJvYcCUAEiKozbD5OvAYW+SnddE+8w4w+CJMxnMef6gTux4ajUq112ugSkYwFo1cZQvqDBDnKjTbEknCJbl4@vger.kernel.org, AJvYcCUhFoq9OhDHoYaQ8ssiEx062xl4ksQa08RSMkDBUQsRhRDvOAdi9zCwPq7emwtSt3ood14abR3/nPinegSF@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPr5S5rk+wC5MAzV6b1adCiU0OX67qgN5eKuFSn2/1eIxzk5y
	717pFKrPCUKZk4xNGIaC++a+auEPUbO0RJFyUfB7WEx4l00eUFc=
X-Gm-Gg: ASbGnctspVyb6J0nPq1d6uEqwQP2qj9Zr+uZDZhgcXdKJO71urgDUbX6H4B3vWeJuaq
	PXyAMpQYsJmTFSEJAmHo4m3MskGvYBwbILySXPbDgHCSJ5EfFgOMW1uqG9PBB9Pa39xFNlJlnEk
	XQlRQHfZkwwU9OJHvTqGSS0sOUEsBhNFP08P/FIpCc7SysOkXEQv7l9d5/6zHvuyxbgCFpaLoPP
	cUEtukBW5tg6oh7hiaQC9lzaIMGv9vF9D7k+AiQfmTXNRPtonFy3oT1dlfZAKtnqo8BCzWVHrit
	2tDte1aFwGR7CEMXXhVJsYEofhE2YuS9SkNI6Kr1S3gFyKrXaWJozOi/hBqvT2bz+r/ULamQNt9
	7+Ft8gELPlqLe
X-Google-Smtp-Source: AGHT+IFMVDYLTn3P+AqF4w5EM6NFHR4DM/rUbBAs9Vcoe+DJhPsyf1ed5wxi6pxvZTB9jpF+/uNqvQ==
X-Received: by 2002:a05:6214:258f:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6eed6271744mr284133846d6.28.1743614666448;
        Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:edfc:c609:ae5:4b2c? ([2a02:810b:f13:8500:edfc:c609:ae5:4b2c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9643d6asm77042556d6.28.2025.04.02.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Message-ID: <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
Date: Wed, 2 Apr 2025 19:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250402123150.238234-8-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Andy,

> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First included in v3
> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> 
>   drivers/gpu/drm/bridge/Kconfig                |   7 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
>   drivers/gpu/drm/rockchip/Makefile             |   2 +-
>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
>   drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
>   include/drm/bridge/inno_hdmi.h                |  33 +
>   8 files changed, 741 insertions(+), 763 deletions(-)
>   rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
>   create mode 100644 include/drm/bridge/inno_hdmi.h
>

...

> +#define m_RX_DONE			(1 << 0)
> +
> +#define HDMI_CEC_TX_INT			0xda
> +#define HDMI_CEC_RX_INT			0xdb
> +#define HDMI_CEC_BUSFREETIME_L		0xdc
> +#define HDMI_CEC_BUSFREETIME_H		0xdd
> +#define HDMI_CEC_LOGICADDR		0xde
> +
>   struct inno_hdmi_i2c {
>   	struct i2c_adapter adap;
>   
> @@ -68,41 +395,18 @@ struct inno_hdmi_i2c {
>   
>   struct inno_hdmi {
>   	struct device *dev;
> -
> +	struct drm_bridge bridge;
>   	struct clk *pclk;
>   	struct clk *refclk;
>   	void __iomem *regs;
>   	struct regmap *grf;
>   
> -	struct drm_connector	connector;
> -	struct rockchip_encoder	encoder;
> -
>   	struct inno_hdmi_i2c *i2c;
>   	struct i2c_adapter *ddc;
> -
> -	const struct inno_hdmi_variant *variant;
> +	const struct inno_hdmi_plat_data *plat_data;
> +	unsigned int colorimetry;

thanks a lot for doing the bridge conversion for this driver.
Please keep the custom connector state which was introduced after Maxim's
review during the last rework of this [0] driver. The colorimetry is not
part of the device, but of the connector and thus should not be part of the
device struct.
It's, however, likely that the common (hdmi-)connector framework will once
hold its own colorimetry property and then the custom connector state in
this driver can go away, but until than we have to keep it here.

Thanks,
Alex

[0]
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ceeb0f0104a62c867656c2730a51df47e7350b8f


>   };
>   
> -struct inno_hdmi_connector_state {
> -	struct drm_connector_state	base;
> -	unsigned int			colorimetry;
> -};
> -
> -static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
> -{
> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> -
> -	return container_of(rkencoder, struct inno_hdmi, encoder);
> -}
> -
> -static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
...
