Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F21AB6DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108544; cv=none; b=cjkEaeJO5fDuyTjQRMldyIbVFZXOJMUXaQUAMkpILFZ6+1C4KU8fxHmiakcUFRx7dXHL2j+/vFG47lq9Xd1Z0Mbz+b1Uj7RENKc/5MDhsEbTjXOWzRf2QNMvaCw2MU6MHFIb5kCBvpERId33koqwEqGcqvRLURA9SrJtpGfO8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108544; c=relaxed/simple;
	bh=2bmPCW89rdzOGsDm72m7yTGa8DocL/QHm7jaXbJsMD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptGMousEF65qc7rvAWUzefOXJFpCZZEeZ1HCYXfruLwDlug6AtW/7jNu8UVqQ7cvYuUd8bOUESWYMvoK/yYftRTUZz1ma70DBmnCY51x+nW63Q/6B0II05UfMx7VSMBHjF/oEj2skYTEM+zjbF4aHhCtdYtK1/+wrqy4shm/Amk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cE+3jtUK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cE+3jtUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKAZMdqz4k8C7gJy26linTtjioeiTxT5WSsWc9mj6gw=;
	b=cE+3jtUKSX6v3x7VkKKqnGANyyirSbvO3UvLWwFL6qUAWB9ymFIlFsSMYRH756XJxmVCbV
	GTSFqU/XiSLJ+Zuozft4hseKD2Y/FA8udsJtwDmOBV7qoG2Nv+3vVzMCXVJ5DQE8MPRha3
	msLLNLEds/wmRgKlRa+CW1d50bqKHew=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-7Rc41SfWPnONDdrlTNBfdw-1; Thu, 01 May 2025 10:08:59 -0400
X-MC-Unique: 7Rc41SfWPnONDdrlTNBfdw-1
X-Mimecast-MFC-AGG-ID: 7Rc41SfWPnONDdrlTNBfdw_1746108538
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso63875666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108538; x=1746713338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKAZMdqz4k8C7gJy26linTtjioeiTxT5WSsWc9mj6gw=;
        b=mNj8uHcws7KOEnDFl98KoEjF02rMn0Q/r9jESb9QCXSNa0KQLuHoNuKiBS5GX0oaL3
         WQ4imxN97zgCO6l3Vr1ublQ8oYdV+RItpAM4r4O2PBwXz4wP9BNX+wbAkJH5Yeo37+rp
         XlZKkoQnfaf0rLEvOXRwQL7vSiItLFaJRuDa/LzM1dDw114jl4UKtZ4b+zUyMKNLxBjO
         54rfgEG0vHR4Iocwv85sIztHvWN0MKhfWhpqEQTmA4T54YoUzHzWWNMY2NowknX3GhSL
         Pe1aXEybuJ+h9NzbzalHd8gRP6qXhDOMvdYsjKvE1/bFQ9tSDTL0zFDGi4Ibu6J26hSm
         LgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp/V5/1EUYljK+49xM3yAVrvP78LO8Jjn7QjbIlp3ojCZhegXcEyz0mBDJXY8NEDNjYwkHOJ9mIvVUYoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEu6kdEnGaFLOo3/2JpX1DlDDU3BziCPqb4lOrIbD3bGruE8y+
	FtGgn5tbfxjvy4hW40c0AzywJvyUoMeKQHbnZnBGqXj3TKOKEzo0UZVaeiHQj5Sj0K5+by4q/m1
	hRjaB/+9gO/2VtIznl+ozC1QVwmHayg74eTNd6pIlo9j4TGKd/fCcMbFemK+bSg==
X-Gm-Gg: ASbGncuH37nDMowLM9w3i/micMvYUinKiwFw0lMmwB8ogW+1K5rrKS5mXzfTPsViqPN
	NkIk4KTtuwHCrxyES+AyJVq3NYqQtmCxbU7XRTuBLJWQOtUzIkJe8cO2VOHk1CzOvaK8N7QQyus
	ezVqvruLeOyJGwhOJuJQg7zk89b65lHACSxeHdB61QLMe+RkB81J5SzNIuvz1XRttp+jxLZ+Dm9
	V2ydu4KY9vShacxjyrwXEePJB3VqmLOnlJofM3lCVZ4J5xqpkkAnd67EfnixpiecR/bSXdaC805
	t9DWoXjmb61ScfMdJ78k9+G4DImhBYYE6JjEeC6uTMaiboSnbbxMRC1en4e7x1rHSaRxd3of6M+
	zpk/rM6iFYQXE+TBdSh2MjPH1xLEEnD5LAe/AKbQFH0wk+t0L9gVI1lE/vKW+Gw==
X-Received: by 2002:a17:907:1b11:b0:acb:8492:fe with SMTP id a640c23a62f3a-acee25ff191mr654029266b.52.1746108538372;
        Thu, 01 May 2025 07:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGReZdqnjWQp8R6Eug67um016BAdvbQ+pNPuexOt79SVpL7qqesrqW9/D//xMT6llQVb+QjXw==
X-Received: by 2002:a17:907:1b11:b0:acb:8492:fe with SMTP id a640c23a62f3a-acee25ff191mr654022266b.52.1746108537846;
        Thu, 01 May 2025 07:08:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a01sm44965966b.104.2025.05.01.07.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:08:57 -0700 (PDT)
Message-ID: <55cd679a-1ade-4fe3-88f5-13772b7d068c@redhat.com>
Date: Thu, 1 May 2025 16:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: i2c: Remove unused macro definitions
To: WangYuli <wangyuli@uniontech.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, zhanjun@uniontech.com,
 guanwentao@uniontech.com, chenlinxuan@uniontech.com
References: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi WangYuli,

On 24-Jan-25 4:44 AM, WangYuli wrote:
> Delete obsolete macro definitions that are no longer in use in
> mt9m114.h to improve code readability and maintainability.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Thank you for your patch, but this entire driver is being
removed, so I'm not going to apply this patch. See:

https://lore.kernel.org/linux-media/20250501134312.104711-5-hdegoede@redhat.com/

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/mt9m114.h | 105 +-------------------
>  1 file changed, 3 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> index 97820db90827..9c4b85bea765 100644
> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> @@ -22,29 +22,15 @@
>  #include "../include/linux/atomisp_platform.h"
>  #include "../include/linux/atomisp.h"
>  
> -#define V4L2_IDENT_MT9M114 8245
> -
> -#define MT9P111_REV3
> -#define FULLINISUPPORT
> -
>  /* #defines for register writes and register array processing */
>  #define MISENSOR_8BIT		1
>  #define MISENSOR_16BIT		2
>  #define MISENSOR_32BIT		4
>  
> -#define MISENSOR_FWBURST0	0x80
> -#define MISENSOR_FWBURST1	0x81
> -#define MISENSOR_FWBURST4	0x84
> -#define MISENSOR_FWBURST	0x88
> -
>  #define MISENSOR_TOK_TERM	0xf000	/* terminating token for reg list */
>  #define MISENSOR_TOK_DELAY	0xfe00	/* delay token for reg list */
> -#define MISENSOR_TOK_FWLOAD	0xfd00	/* token indicating load FW */
> -#define MISENSOR_TOK_POLL	0xfc00	/* token indicating poll instruction */
>  #define MISENSOR_TOK_RMW	0x0010  /* RMW operation */
>  #define MISENSOR_TOK_MASK	0xfff0
> -#define MISENSOR_AWB_STEADY	BIT(0)	/* awb steady */
> -#define MISENSOR_AE_READY	BIT(3)	/* ae status ready */
>  
>  /* mask to set sensor read_mode via misensor_rmw_reg */
>  #define MISENSOR_R_MODE_MASK	0x0330
> @@ -55,99 +41,32 @@
>  #define MISENSOR_FLIP_DIS	0
>  
>  /* bits set to set sensor read_mode via misensor_rmw_reg */
> -#define MISENSOR_SKIPPING_SET	0x0011
> -#define MISENSOR_SUMMING_SET	0x0033
>  #define MISENSOR_NORMAL_SET	0x0000
>  
>  /* sensor register that control sensor read-mode and mirror */
>  #define MISENSOR_READ_MODE	0xC834
> -/* sensor ae-track status register */
> -#define MISENSOR_AE_TRACK_STATUS	0xA800
> -/* sensor awb status register */
> -#define MISENSOR_AWB_STATUS	0xAC00
> -/* sensor coarse integration time register */
> -#define MISENSOR_COARSE_INTEGRATION_TIME 0xC83C
>  
>  /* registers */
> -#define REG_SW_RESET                    0x301A
> -#define REG_SW_STREAM                   0xDC00
> -#define REG_SCCB_CTRL                   0x3100
> -#define REG_SC_CMMN_CHIP_ID             0x0000
> -#define REG_V_START                     0xc800 /* 16bits */
> -#define REG_H_START                     0xc802 /* 16bits */
> -#define REG_V_END                       0xc804 /* 16bits */
> -#define REG_H_END                       0xc806 /* 16bits */
> -#define REG_PIXEL_CLK                   0xc808 /* 32bits */
> -#define REG_TIMING_VTS                  0xc812 /* 16bits */
>  #define REG_TIMING_HTS                  0xc814 /* 16bits */
>  #define REG_WIDTH                       0xC868 /* 16bits */
> -#define REG_HEIGHT                      0xC86A /* 16bits */
>  #define REG_EXPO_COARSE                 0x3012 /* 16bits */
> -#define REG_EXPO_FINE                   0x3014 /* 16bits */
>  #define REG_GAIN                        0x305E
> -#define REG_ANALOGGAIN                  0x305F
> -#define REG_ADDR_ACESSS                 0x098E /* logical_address_access */
> -#define REG_COMM_Register               0x0080 /* command_register */
> -
> -#define SENSOR_DETECTED		1
> -#define SENSOR_NOT_DETECTED	0
>  
>  #define I2C_RETRY_COUNT		5
>  #define MSG_LEN_OFFSET		2
>  
> -#ifndef MIPI_CONTROL
> -#define MIPI_CONTROL		0x3400	/* MIPI_Control */
> -#endif
> -
> -/* GPIO pin on Moorestown */
> -#define GPIO_SCLK_25		44
> -#define GPIO_STB_PIN		47
> -
> -#define GPIO_STDBY_PIN		49   /* ab:new */
> -#define GPIO_RESET_PIN		50
> -
>  /* System control register for Aptina A-1040SOC*/
>  #define MT9M114_PID		0x0
>  
>  /* MT9P111_DEVICE_ID */
>  #define MT9M114_MOD_ID		0x2481
>  
> -#define MT9M114_FINE_INTG_TIME_MIN 0
> -#define MT9M114_FINE_INTG_TIME_MAX_MARGIN 0
> -#define MT9M114_COARSE_INTG_TIME_MIN 1
> -#define MT9M114_COARSE_INTG_TIME_MAX_MARGIN 6
> -
>  /* ulBPat; */
>  
> -#define MT9M114_BPAT_RGRGGBGB	BIT(0)
> -#define MT9M114_BPAT_GRGRBGBG	BIT(1)
> -#define MT9M114_BPAT_GBGBRGRG	BIT(2)
> -#define MT9M114_BPAT_BGBGGRGR	BIT(3)
> +#define MT9M114_BPAT_GRGRBGBG	BIT(0)
> +#define MT9M114_BPAT_BGBGGRGR	BIT(1)
>  
> -#define MT9M114_FOCAL_LENGTH_NUM	208	/*2.08mm*/
>  #define MT9M114_WAIT_STAT_TIMEOUT	100
> -#define MT9M114_FLICKER_MODE_50HZ	1
> -#define MT9M114_FLICKER_MODE_60HZ	2
> -/*
> - * focal length bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define MT9M114_FOCAL_LENGTH_DEFAULT 0xD00064
> -
> -/*
> - * current f-number bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define MT9M114_F_NUMBER_DEFAULT 0x18000a
> -
> -/*
> - * f-number range bits definition:
> - * bits 31-24: max f-number numerator
> - * bits 23-16: max f-number denominator
> - * bits 15-8: min f-number numerator
> - * bits 7-0: min f-number denominator
> - */
> -#define MT9M114_F_NUMBER_RANGE 0x180a180a
>  
>  /* Supported resolutions */
>  enum {
> @@ -158,29 +77,11 @@ enum {
>  
>  #define MT9M114_RES_960P_SIZE_H		1296
>  #define MT9M114_RES_960P_SIZE_V		976
> -#define MT9M114_RES_720P_SIZE_H		1280
> -#define MT9M114_RES_720P_SIZE_V		720
> -#define MT9M114_RES_576P_SIZE_H		1024
> -#define MT9M114_RES_576P_SIZE_V		576
> -#define MT9M114_RES_480P_SIZE_H		768
> -#define MT9M114_RES_480P_SIZE_V		480
> -#define MT9M114_RES_VGA_SIZE_H		640
> -#define MT9M114_RES_VGA_SIZE_V		480
> -#define MT9M114_RES_QVGA_SIZE_H		320
> -#define MT9M114_RES_QVGA_SIZE_V		240
> -#define MT9M114_RES_QCIF_SIZE_H		176
> -#define MT9M114_RES_QCIF_SIZE_V		144
> -
> -#define MT9M114_RES_720_480p_768_SIZE_H 736
> -#define MT9M114_RES_720_480p_768_SIZE_V 496
> +
>  #define MT9M114_RES_736P_SIZE_H 1296
>  #define MT9M114_RES_736P_SIZE_V 736
>  #define MT9M114_RES_864P_SIZE_H 1296
>  #define MT9M114_RES_864P_SIZE_V 864
> -#define MT9M114_RES_976P_SIZE_H 1296
> -#define MT9M114_RES_976P_SIZE_V 976
> -
> -#define MT9M114_BIN_FACTOR_MAX			3
>  
>  #define MT9M114_DEFAULT_FIRST_EXP 0x10
>  #define MT9M114_MAX_FIRST_EXP 0x302

