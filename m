Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7161F27781E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748632477; cv=none; b=u7KcO6y9vkhEqDB+9xQWXD6cQ+5wit+5VQO2YcGvTPBlc4HpLOPxyeSiRzFsGpzGXvj46BCK1SRBCfDByqHeyBI31LO3z0GOVcN+mLKtpNsUCIiMNVl/HaZ1zRerc/pMAWybv+pu/1uIZ+OwfI4LhJ90M4iV0aNNszWA+kVerpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748632477; c=relaxed/simple;
	bh=n0bPzSDW+HlaSAhgO1u0Y2tk8Tz3wmhJR1U+ZzeshEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llDiUDEEoVeBHPumYjD2zuUBuIGZl16NpBpInKdOckcYCRMc2R5IJiBFr+qJ+uBc9yC/u2Ri74bLfojRxBZ+aq+1DcxTj25apkXxvIdantxexZ/Zb49LUtB8qtEr4hCbEZ8H4zEDO/AT6RX/w4LpnjDevu4ob49bvLVW2Jqoh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0PITlNZT; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0PITlNZT"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c09f8369cso924529a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748632473; x=1749237273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHHqZAsVpviFayOBzyBP+5p9wWvjbFoN8P1d5tfq8pE=;
        b=0PITlNZTk9EPbpGwyLacMtZMl6g8zuflihzfy5Wjtko//4KsuuUnHuNvDR5CCMkbxB
         CmESIVHgwcl5dMCNdlPMbBYkONHpG00Dss8akuWlb8u7cNPskQJRL3rTOHMsfgp6nZOL
         0gaQyi2tMRuD4qeOUKYpKtQ+HBkG+QwkB5hZ3PMMlPezWWGKIRuQwpQdEKmXWAnG038h
         6NEhM45bcmJ+hWu5B5sZaqtsjmHLCrPOKsk/OeilnYb60ZzNyXWLQncK6kNKGdeqDQ7s
         Ja+H94OLtE5uSc7HOlHosK4APizZHjRmKaS/b3YW+DfVN5F0vZXpzUTA6CkO8EKO5jul
         RyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748632473; x=1749237273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHHqZAsVpviFayOBzyBP+5p9wWvjbFoN8P1d5tfq8pE=;
        b=DXP7p18aDGVYZW+ts6G44pVUVPOPvjxm6avBOYThWdJE56Yzlns5h1gzk2OAE6MIeH
         XaeV2M51cMxXingC/qV2IiSFZVr96jDBymd3po/KVw88C4v6+F/6glW0ZgIDNFwTpxc1
         asYLqstofFMpcMebQtHoXAKnjoU+vk4fo91pRkqSS0O7M9JLco17HSET6el82omYKqv5
         F0G2rNrPMjn3/B3DsRwo0qgF+embkVx9tbsPbtACil+AmX2dR2oNef3b/voXja3FxIH7
         jVpoztRxR3MzaJvLn3pAIMp7nkYIBmV8mf0lf6iQoCI2hlEzzOnMl40Tz1kNDHDVW8PK
         ueEA==
X-Forwarded-Encrypted: i=1; AJvYcCVTWO5CiuqQ34xDsUqffLZQaT7R6yAYCDAm2+XZnw/0tRiKHkcCasLCROgfDmHsmF4ULzZdmINVGKCg1pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKx3pLa627/JscR1V0xQfZShdzfanphlYwlG3189Chp75D2imy
	AkxSUqX5D5niPRnB9GxwgyoSX+DnDjqq8qLZIrTize4EYQtQ2r3+ZyxlV8Sd9l3NpHQ=
X-Gm-Gg: ASbGncuf8u1dt0BoCWiaeNyOHHhmhe/rulJb7UVLNBs3Fy15IuXXt6qzp73Kv03jju3
	O7z2wRFBAeUslmg6Khjziv7vp+Y6ojmSNbbbsNysFFhHVz2BYfEfed309X6bVECq4PWvUlEEEsb
	Q88I9pDSzT400koR+VRdZH0YbIhqfq69OK4R49SNZzq/mswjZndj+D0RPwG4cZlFN2xKEpGy8Al
	rRqI95Mp8DpAMDPwfeRAOFP30eT1Jb0GV/Hf1ezhQSLq+8RrTy7CkX5sIWHvKcFe0K4/NY6Nb+Q
	43yT+i5qP004G9JQ7H28QR7eZiCOWGWgPY6348nka0DAnFh0gOoHuoxaL5cVfpjF96rRFJh/CQB
	s49+q47dv62GuisCcnHDvzuge5okz
X-Google-Smtp-Source: AGHT+IHPxI3UBPpTmwRtvH3AUGD4B8Qbyg+V45TvwOxwL3NJO9g1RZBHm35gXZgxpvqaXtWJbZSWDQ==
X-Received: by 2002:a05:6830:6a15:b0:72b:9a2e:7828 with SMTP id 46e09a7af769-73670cd6814mr2983963a34.28.1748632473479;
        Fri, 30 May 2025 12:14:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d4bfsm692406a34.1.2025.05.30.12.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 12:14:33 -0700 (PDT)
Message-ID: <90226114-646c-4af7-bd38-361ac383699f@baylibre.com>
Date: Fri, 30 May 2025 14:14:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: adi-axi-adc: fix ad7606_bus_reg_read()
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Guillaume Stols <gstols@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-v1-1-ce8f7cb4d663@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-v1-1-ce8f7cb4d663@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/25 2:09 PM, David Lechner wrote:
> Mask the value read before returning it. The value read over the
> parallel bus via the AXI ADC IP block contains both the address and
> the data, but callers expect val to only contain the data.
> 
> Cc: stable@vger.kernel.org
> Fixes: 79c47485e438 ("iio: adc: adi-axi-adc: add support for AD7606 register writing")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/adi-axi-adc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index cf942c043457ccea49207c3900153ee371b3774f..d4759a98b4062bc25ea088e3868806e82db03e8d 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c
> @@ -457,6 +457,9 @@ static int ad7606_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val)
>  	axi_adc_raw_write(back, addr);
>  	axi_adc_raw_read(back, val);
>  
> +	/* Register value is 8 bits. Remove address bits. */
> +	*val &= 0xFF;

I just found out that there is ADI_AXI_REG_VALUE_MASK we can use
here instead of 0xFF.

> +
>  	/* Write 0x0 on the bus to get back to ADC mode */
>  	axi_adc_raw_write(back, 0);
>  
> 
> ---
> base-commit: 7cdfbc0113d087348b8e65dd79276d0f57b89a10
> change-id: 20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-f2bbb503db8b
> 
> Best regards,

