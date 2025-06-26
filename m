Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2B2E9745
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947234; cv=none; b=QWWkgf/iBfGnYJHahJPvK0+rOvnwKe9FOEaqSPPwrwnbvfTAc0Z9HuTHySV07j7xA/75VYGqPJ9a/ZnUlSBPN3O4S0u2+jUzMZoMxbG/vvalRffAiNaBLa3TNZCSUMfgnRy3DXYNmccwVOJ394nXNE6I8EGv8bOygceChOd0YHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947234; c=relaxed/simple;
	bh=m9gYVDA+vIGLS/Y1cwTdJGaO3vOZMPWvV30eu6+ER3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ECeiEpENMgD2plr4pm6BIlQYWwDRBU+tCH/b+19ZFe2gtAVJN2v/WaY+wGZUSvRjqVjmnFqYtxrxyLDUuR14DyHae7aX9X09gxFlJxpn2dyBiokRvjOq8zjKOf5MjdD1vSljUMMa6S1wUZSL9aZYYWXR49mfe5wuTKDMVaK7HwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TcApoWX9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TcApoWX9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso6993515e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947229; x=1751552029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMJbxK+Vs0vHD/rLpXgatG28H8njeuPukA8Oh9Ztkak=;
        b=TcApoWX9+DqY1DYekru/PIyQ/0wOFY30HF3E7H/0AUR5gra/AhjC9yIv5STrhL1VPE
         TRxEt8SBNYBJxv+EqYk3ZE49IJqgvfX515NUsPi0g50FTomgZdMDJwZ1n3TaKF4sBbtw
         lwq+P3IrcwLOOWC66v8eK+p4SLBYhRKCbJvuUd2REXcNeBCs81jrHX3+T/8oaEDTCJ+K
         OHPlil9bWJnlMAbDEYwKFojG7GAblbWwNKekitKo7P2UMbT9lc++kKuimmhXO9p64SXT
         V5tfJXU9DKP8gXMEqq5ZZJisc9DcgZH3STNnkcTlzT8PjuNsMx7ZLCDfFbU/8G2+W+ZJ
         TiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947229; x=1751552029;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NMJbxK+Vs0vHD/rLpXgatG28H8njeuPukA8Oh9Ztkak=;
        b=IKoD7T9bxaij5byah77yMPVLgnzsY2iyYGtHDporAhMxpRsc8xSuaF0a2BjNyGSC9C
         GnS03ucL+NBoi8xm6FdhGWtPEuBc8f0yOXw8U6dnXKhmlOi6ebLAx8xm0OTHWAPLG603
         JClhcIXKynxcrdjHdC9h11HPPbDXZm0H0MY5yE9CyvBAK1gkijGu/3I5mKJH1eRleSqy
         2jR3GZecu3n/Q9skJGavKT0pF8rNO0ZXeBQQQGZaVDtZ+icVQCuduuAnJ+ja8kIqk4ii
         bLzsMEImv6Ov+MsEXv/vk8O9LN6G6iEjLnTUOpbhWUo9ktug4V1dmxyy4ZcHl4BQ5Ceq
         aYtg==
X-Forwarded-Encrypted: i=1; AJvYcCUf+sXU1cT9IBD3jqOtr9pP2b2EE5140jPdwgyyIHRD8ZAlIalwMwclWMa+TwqdCvD1offW80+K/hBcBgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOGQuWevWq8HeGA4fI3LzxLMS/RVe2hON6pOUpzLNiT3wdthy
	x+LkYgdA9ERUTfTuB6RIErnlTozqc4Hp2/92d3k/WAkiYUa1Y9KvLPDevmMJlqmQiLE=
X-Gm-Gg: ASbGncsrSE1JeJTM9QdymMGDMhENmi4eUE+shT9/7xhHlSf/Zf2lVUkzk2hf4oNpGh+
	pCDxygrKb+BZ8TZPAdBWAUhdT3pW19HcVlqsmIO2jY6clEQXXm1ju7d6wJLn34jUXGxYavfPBIj
	jIsTfWLpHb9k7JfYVMcZZPBxbx/bHPshGC/5VaXek4u16UCH2o/KsvHMM+svYxVJQiNzZud270z
	IjRt+JdI4WtnMfRNI5mjUOxdt4goD4OQ3XByMHiwoIGK6h96UOEgcBqnMudiwwYz9GSrpr22rHJ
	IYZqu/zCF94l/hZP9g2ue/xIdYrKtZgDO7KvBkNh//MyOSLatt65G02AgrtompVisRGdV0Hw0MG
	73qn4z1UGOal2alnaLUasO7/MXbwEJPBmncKv/8I=
X-Google-Smtp-Source: AGHT+IHAaJHtYzCJoYKM9gdvCp6tWkdRHXxVPebdwEL9y2imblqKnZ4SnYi7AI2VF2X9Y7HivIxDYA==
X-Received: by 2002:a05:600c:a01:b0:451:df07:d8e0 with SMTP id 5b1f17b1804b1-453889d0d93mr40114195e9.11.1750947228759;
        Thu, 26 Jun 2025 07:13:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm21614295e9.30.2025.06.26.07.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:13:48 -0700 (PDT)
Message-ID: <4da70304-96c6-4b2a-bd8c-0b53811089de@linaro.org>
Date: Thu, 26 Jun 2025 16:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] mfd: khadas-mcu: add Khadas Edge 2 registers
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
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
In-Reply-To: <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Add Khadas Edge 2 MCU registers to khadas-mcu.h and adjust some properties.
> Also, i've added some registers with V2 suffix,
> as same addresses were already exist for previous boards.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   drivers/mfd/khadas-mcu.c       |  8 ++++++--
>   include/linux/mfd/khadas-mcu.h | 25 +++++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ca4bd6cf5..199ed4925 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -26,6 +26,10 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
>   	case KHADAS_MCU_CHECK_USER_PASSWD_REG:
>   	case KHADAS_MCU_WOL_INIT_START_REG:
>   	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG:
> +	case KHADAS_MCU_LED_ON_RAM_REG:
> +	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2:
> +	case KHADAS_MCU_WDT_EN_REG:
> +	case KHADAS_MCU_SYS_RST_REG:
>   		return true;
>   	default:
>   		return false;
> @@ -69,14 +73,14 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.reg_bits	= 8,
>   	.reg_stride	= 1,
>   	.val_bits	= 8,
> -	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +	.max_register	= KHADAS_MCU_SYS_RST_REG,
>   	.volatile_reg	= khadas_mcu_reg_volatile,
>   	.writeable_reg	= khadas_mcu_reg_writeable,
>   	.cache_type	= REGCACHE_MAPLE,
>   };
>   
>   static struct mfd_cell khadas_mcu_fan_cells[] = {
> -	/* VIM1/2 Rev13+ and VIM3 only */
> +	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
>   	{ .name = "khadas-mcu-fan-ctrl", },
>   };
>   
> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> index a99ba2ed0..de570e159 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h
> @@ -35,26 +35,45 @@
>   #define KHADAS_MCU_FACTORY_TEST_REG		0x16 /* R */
>   #define KHADAS_MCU_BOOT_MODE_REG		0x20 /* RW */
>   #define KHADAS_MCU_BOOT_EN_WOL_REG		0x21 /* RW */
> +#define KHADAS_MCU_BOOT_EN_DCIN_REG_V2		0x21 /* RW */
>   #define KHADAS_MCU_BOOT_EN_RTC_REG		0x22 /* RW */
>   #define KHADAS_MCU_BOOT_EN_EXP_REG		0x23 /* RW */
> +#define KHADAS_MCU_LED_MODE_ON_REG_V2		0x23 /* RW */
> +#define KHADAS_MCU_LED_MODE_OFF_REG_V2		0x24 /* RW */
>   #define KHADAS_MCU_BOOT_EN_IR_REG		0x24 /* RW */
>   #define KHADAS_MCU_BOOT_EN_DCIN_REG		0x25 /* RW */
> +#define KHADAS_MCU_RGB_ON_R_REG			0x25 /* RW */
> +#define KHADAS_MCU_RGB_ON_G_REG			0x26 /* RW */
>   #define KHADAS_MCU_BOOT_EN_KEY_REG		0x26 /* RW */
> +#define KHADAS_MCU_RGB_ON_B_REG			0x27 /* RW */
>   #define KHADAS_MCU_KEY_MODE_REG			0x27 /* RW */
> +#define KHADAS_MCU_RGB_OFF_R_REG		0x28 /* RW */
>   #define KHADAS_MCU_LED_MODE_ON_REG		0x28 /* RW */
> +#define KHADAS_MCU_RGB_OFF_G_REG		0x29 /* RW */
>   #define KHADAS_MCU_LED_MODE_OFF_REG		0x29 /* RW */
> +#define KHADAS_MCU_RGB_OFF_B_REG		0x2a /* RW */
> +#define KHADAS_MCU_REST_CONF_REG		0x2c /* WO */
>   #define KHADAS_MCU_SHUTDOWN_NORMAL_REG		0x2c /* RW */
>   #define KHADAS_MCU_MAC_SWITCH_REG		0x2d /* RW */
>   #define KHADAS_MCU_MCU_SLEEP_MODE_REG		0x2e /* RW */
> +#define KHADAS_MCU_BOOT_EN_IR_REG_V2		0x2f /* RW */
>   #define KHADAS_MCU_IR_CODE1_0_REG		0x2f /* RW */
>   #define KHADAS_MCU_IR_CODE1_1_REG		0x30 /* RW */
> +#define KHADAS_MCU_IR1_CUST1_REG		0x30 /* RW */
>   #define KHADAS_MCU_IR_CODE1_2_REG		0x31 /* RW */
> +#define KHADAS_MCU_IR1_CUST2_REG		0x31 /* RW */
>   #define KHADAS_MCU_IR_CODE1_3_REG		0x32 /* RW */
> +#define KHADAS_MCU_IR1_ORDER1_REG		0x32 /* RW */
>   #define KHADAS_MCU_USB_PCIE_SWITCH_REG		0x33 /* RW */
> +#define KHADAS_MCU_IR1_ORDER2_REG		0x33 /* RW */
> +#define KHADAS_MCU_IR2_CUST1_REG		0x34 /* RW */
>   #define KHADAS_MCU_IR_CODE2_0_REG		0x34 /* RW */
>   #define KHADAS_MCU_IR_CODE2_1_REG		0x35 /* RW */
> +#define KHADAS_MCU_IR2_CUST2_REG		0x35 /* RW */
>   #define KHADAS_MCU_IR_CODE2_2_REG		0x36 /* RW */
> +#define KHADAS_MCU_IR2_ORDER1_REG		0x36 /* RW */
>   #define KHADAS_MCU_IR_CODE2_3_REG		0x37 /* RW */
> +#define KHADAS_MCU_IR2_ORDER2_REG		0x36 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_0_REG		0x40 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_1_REG		0x41 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_2_REG		0x42 /* RW */
> @@ -69,6 +88,11 @@
>   #define KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG	0x86 /* RO */
>   #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
>   #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
> +#define KHADAS_MCU_LED_ON_RAM_REG		0x89 /* WO */
> +#define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2	0x8A /* WO */
> +#define KHADAS_MCU_WDT_EN_REG			0x8B /* WO */
> +#define KHADAS_MCU_SYS_RST_REG			0x91 /* WO */
> +
>   
>   enum {
>   	KHADAS_BOARD_VIM1 = 0x1,
> @@ -76,6 +100,7 @@ enum {
>   	KHADAS_BOARD_VIM3,
>   	KHADAS_BOARD_EDGE = 0x11,
>   	KHADAS_BOARD_EDGE_V,
> +	KHADAS_BOARD_EDGE2,
>   };
>   
>   /**

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
