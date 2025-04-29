Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9820721ABDB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947591; cv=none; b=oxxFetwHyyECfIxoK/ExX2+G6+y52VR+OjRuTsSB++wTiyqhaJPi5N/J63vZ35e8cNuoXkszUhUCAl+brjDNqELAQ5FTjWxq7m0Pa6arNUCi9vHGOkMt4vtrnhZ9Ahl7KroeDQhYz79A02MoiHztsF319NxXDFvbXioQ+LhjLac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947591; c=relaxed/simple;
	bh=7/r+kRE8PwvZkzCqHeJ6cAWMXVFDXMKM0pFM4kYPawc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wdwg/XdmtoSGbsJl8DybvHdxAAPfwulsbL1zb/OmJp7Des5UFFgpDJmUzRFpNLJRl5WvN3R694sJmOuA7yV1hmRO+L1RT3doyPDPaB5OLHaGL6a6p6vX+sNWHW8O60n301/hwxJJsWWI4fVnIOvFHHuwQFw41gECO/KBQ6uP+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YsIeU8WW; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YsIeU8WW"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2d4cefac09dso3257362fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745947588; x=1746552388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QZ2g6zKZfle2bhJ5TIK6uWf8PPm/y7+YFw/ot4iG/gE=;
        b=YsIeU8WWHBPME2MXC4GS8pEI26o+/u4xh7g3hTPUgT4NKWs8JPhiJF+ij1JxkJGV2e
         8qLxpyzdR231Pf4DD5AAfRptTaKDznrItbIotIKjJb/VnFrNz5+6ViXNQ6XOIBUHC2f6
         AsZnfZoOaHx0QjiDmhMyZnN07Oei2/z64w3y9YY4igWZ74yFAYBqN6i2ha0U7mUlLMVe
         uZzmx9Nf1s+IwMmAP893p4l1om6hb6iu8Z/99XigCr62v1z6IcDCdW6wIomaENAw6ZtF
         R7hZmcrzB1Xb/OLZnnulcIlYQ1QTdd7gBkk3r3Hu00ZZ+v7xTTYORCuTmbfpyK9JO4lV
         VVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947588; x=1746552388;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ2g6zKZfle2bhJ5TIK6uWf8PPm/y7+YFw/ot4iG/gE=;
        b=uqCfiycZ3usfbdCm1En97rOXGB9hqzdThyydE0GYvbzW6INTLCBxpWSnrEQc+4Pqwj
         g3uHO5iDbYzo6lM+iRgBLpPlOyp2N2yFxrhPIXVBLsBhIQwaTX2uN952VgNjfddY9YQE
         SaDtvSDD6tosMtdRuVMjSL+Jq8zByy+PjgFezezy+pGEDAiIeBtctMd1hIQBYPuMlLfF
         mOKOgYTWZcfMRo/gxLodj6sUELp4m8O7GzlLT8SwPsBw2UjvHX9bHefbGcJ9f1y58OId
         /JzNTD0fxcqEH6drs5ItN+h7zQCUG2MH38gQBFOMGgD5igS4d0KLDWOJu2MChypxAIIC
         f27g==
X-Forwarded-Encrypted: i=1; AJvYcCXmDO2gEMo3wyharNt30y6QyPvz76oFwnphwdOzxJBoAYq0sTRN3z+YjvnMYCvz/kZ3YnAQcjp5MrhqHTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvRJWpEQILippIN6KA86XHy+55ZbeAzaf04QC9fsx7/fckf9vA
	P2YawOVIdWF04OswL563PQZPqtO6f4jf7L3278k0mAq+/xK0St7TIGLAVUjgkcI=
X-Gm-Gg: ASbGncsd6yXQKbMivxE37+CkkF5/1ZfM4Pah7XWJSAOvh04Oh16MD0iKShJBMx1c5/w
	sO+Css+/K1izyHn57St9crDtRggTNBr/H1ztUbMp7rqASzFtWzwl7ZbCg2dIXnd1H7cI0mpfGpP
	4IMkYu3gI1H/u77r5PH7OkQt6+yVOnHulu0ZdFr7+Abv5Uu+1ac1GtUAtrXeABPpIMgH95S6XQ1
	cPubNidmeXt0HSyNc8EctusuiDr+WCt+hd5BqJrqjA/CIITYhjBNnnmNkAwpog37mpMt5wltG1Z
	EHUZVhoYFKtc3PENzENOFbvskcueIid/AhCsYPCP2zG2T/bYLcJTNzTzoQQvkYLmkdRrTSdNYZO
	tB1a3hPsnrFUOLrVDvQ==
X-Google-Smtp-Source: AGHT+IEfTeUQO0w+CK2girx/RErz7NGrkaGNtLF/J9RvQJnFMJQ+cMG8h2DSovjttwNeq03UDsd/Uw==
X-Received: by 2002:a05:6870:9629:b0:2d5:2955:aa57 with SMTP id 586e51a60fabf-2da3eb9a0f3mr2337581fac.0.1745947588639;
        Tue, 29 Apr 2025 10:26:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b2ef3f3sm381658a34.54.2025.04.29.10.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:26:28 -0700 (PDT)
Message-ID: <7b11bb00-fd2a-4df4-bb7e-7e67ed396ba2@baylibre.com>
Date: Tue, 29 Apr 2025 12:26:27 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] iio: adc: adi-axi-adc: add num lanes support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, jic23@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425112538.59792-1-antoniu.miclaus@analog.com>
 <20250425112538.59792-10-antoniu.miclaus@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250425112538.59792-10-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/25/25 6:25 AM, Antoniu Miclaus wrote:
> Add support for setting the number of lanes enabled.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> no changes in v3.
>  drivers/iio/adc/adi-axi-adc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index bf0155830d87..8ff781ab5ec3 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c
> @@ -44,6 +44,7 @@
>  #define   ADI_AXI_ADC_REG_CONFIG_CMOS_OR_LVDS_N	BIT(7)
>  
>  #define ADI_AXI_ADC_REG_CTRL			0x0044
> +#define    AXI_AD408X_CTRL_NUM_LANES_MSK	GENMASK(12, 8)

Same comment applies here. It looks like this is common to all cores, so no
AD408X in the name please.

>  #define    AXI_AD408X_CTRL_SYNC_MSK		BIT(3)
>  #define    ADI_AXI_ADC_CTRL_DDR_EDGESEL_MASK	BIT(1)
>  
> @@ -451,6 +452,19 @@ static int axi_adc_sync_status_get(struct iio_backend *back, bool *sync_en)
>  	return 0;
>  }

