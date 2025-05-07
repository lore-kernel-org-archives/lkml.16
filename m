Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83942217F46
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602971; cv=none; b=YbQ609LGk/Iz6YYTQDWjIVt8BZPoXQbADauGO2Je2p4FNjPcd4WbQTgoHNBR8E9DC1D2pF+akxkbovTwxLqs9hCZ+CaJ47c+gFftMbAl+4O+rpb8Okxv1HhNqUZ62iaNEKbquFA2kVWWIYHn35tzKkT5R9GuxwS9m9+KzOcXFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602971; c=relaxed/simple;
	bh=3ofFTovtnJvX5M/xuhvl18Z0GfLNgQGP2MJvinEcTik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpeODfDuzNZ3dFOp5X7QPqpq2lI0rsNpX7mh+7Dbuv9E+Oan+gEtOHPZmnAjJjXmF3w23aOTHHG7jHJxucSa0H3alhKls8AQmPJ02g0BxpMsGtgXUAMKsVcQ42iSL4NWAFZqawl62D5TT9mOcOOCHogAmQK25rXPMSX6o46E3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqcX8HWj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqcX8HWj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee651e419so3438488f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746602968; x=1747207768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exh3b5R7L77rlGB9XDLUTNFBk7LtXN6j6kHQ/wrFppg=;
        b=lqcX8HWjoX36WHrfdPUWIjNj0BPu4jxR/vDN0sjAWhBJQ7QMdXwwwRn20Na67XyaNs
         zHRWU9RdQEm52VDinC1WP3zhufhSSap2ix1APn4UVW706vlBGsTTSr7E1kOYi/Z0yrHb
         TTYmpP3N0NXBHnieEZKmqSuC9UsAvDTniQz82qqKpTkd+wKP8fiHBBQR3gWkSjKtXjaE
         u1K0iGAv7JdeeqgIYPqdeTRQ2q6VfzsWxDU1vLI/y+pkJZ5YicQstZdEmoPGpih70KZ5
         IpzulRQDCE2YGYLBW6+NN+uJmfQmESsHDdaVmVMcnOWUgDLz7gFX//YoL6mv3zx4Q++8
         9xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746602968; x=1747207768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exh3b5R7L77rlGB9XDLUTNFBk7LtXN6j6kHQ/wrFppg=;
        b=spOUEC+XGmgGdqQzXKO4PaEdyJp8DiN3SEGIk1t0lUQGyiBVm+m9C4ADN1KC51qf9s
         QjFaHWtMSCO5Ffoapxu3sXFeJ+pOjVt3x4TfZTYkajNM4BhMpSDZf111nx+HQXqYhdA1
         ErC8zcPZiStEGkCIEVQv+bfibL0ZITLDzuVKnZMbcc8HFn9tJKO4N1D7pbLwNheX5ANn
         +q8/VRHmuIAQLeZBYrVQR/dX5uWykKupym7S/BVYu7QMWHmNKpHg2EySiTKRumLNCMu4
         UB7pYNy6E3KmVeVS92ighfF+dhw/45i1SQfI1+eYu2UJlXkPREGMpJqVvVaI7D6qAfHi
         QF3g==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZvWto4rN2HzkAWtyPHh0/RRI74FexFIXPaiHM5yranGLrq4oR366TPs2T4qL6sgSdts9wz34TRqjY7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAaOPrATx5qTcl7pJ89o92MbrNh3pcyBOZPviB/5YsKPeT8v6y
	EY1cmWTJGa9r+/dDIYeYg0MZakrcSCZud08sYRookFSPgtWKWgYDp9EOK3inDTI=
X-Gm-Gg: ASbGncudHcNJy3s2VOkwOR//se50mAhrlK+D0Pa3bjfltssIyUEd0hBB55T5kBaLhzD
	LTdyDrLS+LZe7V+QGZlWFILPk+gqrIp8BkAo+zxoH5IzJnz3RFGgwGB5f627Mi4M8zlctPS+F90
	dEfWmKfX9dVPbWoT+0ZIOfQGvD0QJokDrQxCv0ycGdkKEa5PdX7HE/CejFoyCjUOsRiHz4KpXJS
	mPaknH0S0Bd/wgrhSGeZxSwYBbM4RYQcGNfiPujN/TrTdWtzyyM2ejAlO9yyyB1cemqDZr2EGIF
	FrRvnLRZ0oTywt///sJnktbmI4A6bhi236zDS7qAeUvOLZcSvQLfuC6gFMTnLfdsjVWXR3/o2bJ
	LtP2r
X-Google-Smtp-Source: AGHT+IEH+UhigDV51ycf06z5unZsxUS1KzhCHNWdikOd5Jo+ShmTKo/P+eDgWolx1p8pfsovDvmOIg==
X-Received: by 2002:a5d:64e7:0:b0:38d:b325:471f with SMTP id ffacd0b85a97d-3a0b4a16497mr2004847f8f.15.1746602967790;
        Wed, 07 May 2025 00:29:27 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a0b350f604sm2547973f8f.21.2025.05.07.00.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 00:29:27 -0700 (PDT)
Message-ID: <c0e9a395-41d1-4edc-a759-f958ea10387a@linaro.org>
Date: Wed, 7 May 2025 09:29:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] thermal: Add support for Airoha EN7581 thermal
 sensor
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250226003608.8973-1-ansuelsmth@gmail.com>
 <20250226003608.8973-2-ansuelsmth@gmail.com>
 <a9f58437-5992-4042-85cd-b9150c4855ff@linaro.org>
 <6814de0d.7b0a0220.2add1a.0689@mx.google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <6814de0d.7b0a0220.2add1a.0689@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2025 17:00, Christian Marangi wrote:
> On Fri, May 02, 2025 at 03:30:56PM +0200, Daniel Lezcano wrote:

[ ... ]

>>> +static int airoha_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>>> +{
>>> +	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
>>> +	int min, max, avg_temp, temp_adc;
>>> +	int i;
>>> +
>>> +	/* Get the starting temp */
>>> +	temp_adc = airoha_get_thermal_ADC(priv);
>>> +	min = temp_adc;
>>> +	max = temp_adc;
>>> +	avg_temp = temp_adc;
>>> +
>>> +	/* Make 5 more measurement and average the temp ADC difference */
>>> +	for (i = 0; i < 5; i++) {
>>> +		temp_adc = airoha_get_thermal_ADC(priv);
>>> +		avg_temp += temp_adc;
>>> +		if (temp_adc > max)
>>> +			max = temp_adc;
>>> +		if (temp_adc < min)
>>> +			min = temp_adc;
>>> +	}
>>> +	avg_temp = avg_temp - max - min;
>>> +	avg_temp /= 4;

Why 4 ? There is 5 samples no ? one before the loop and 4 with the loop

>>> +	*temp = RAW_TO_TEMP(priv, avg_temp);

Does RAW_TO_TEMP() on a average raw adc value report the same value as 
an average of the temperature after their conversion ?

>>> +	return 0;
>>> +}

The routine is a bit confusing because of the initial adc read.

avg_value = 0;
min_value = INT_MAX;
max_value = INT_MIN;

for (i = 0; i < AIROHA_MAX_SAMPLES; i++) {
	value = airoha_get_thermal_ADC(priv);
	min_value = min(value, min_value);
	max_value = max(value, max_value);
	avg_value += value;
}

avg_value -= (min_value + max_value);
avg_value /= AIROHA_MAX_SAMPLES;

>> Does this chip support the averaging with the filtered mode which prevent to
>> do this expensive calls when getting the temperature ?
>>
> 
> If you notice in this function we read directly from the ADC sensor to
> have a more precise and realtime temperature.
> 
> Yes the thermal module support averaging (and this is what is set for
> the critical temperature monitor) but since we base everything on
> interrupt the expensive call is called only when the user poll the
> temperature with sysfs.

When the temperature reaches the threshold, the interrupt is fired which 
in turn calls thermal_zone_device_update(). This lead to a polling from 
the kernel at a higher rate with the governor taking cooling decision.

> Do you prefer to use the thermal module entirely?

It is up to you. I would say if the sensor has a hardware assistance to 
compute the averaging while the CPU does something else it is better. 
But if the filtered mode has the same issues than the LVTS, then it is 
probably not worth it.


[ ... ]



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
