Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D1B23C8B9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010477; cv=none; b=R9KOE8I7JW1/0CzVkES/MLQe1LPGPx2okAHvv1bELnCaz1eqPcE5yl56vrb7i7qp1TTGrrObPQ58pILsJUDh7mDnybULSaxsdUguuCdPuRS3+sQz5uT6/CH8tA2l6e2zyQMmoJz27tbjYXbpQqi6m7/AWDdO0GUz9seiZ16v704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010477; c=relaxed/simple;
	bh=d++5ONVx7RwzpcgypUj2vz9ayuiQlVvW2lqp2ocsLHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uiglw6W4ghoqFiCGaQprFKE07tHg3yQcORlnwLFAdmX2YTFKH7zPPy++lTIStqTIE0861wgzWKeVgqw5DOmBIXL4O5IF8SjXJ9ZJnY1feQKakoE457iNlxNl1a1jqOuTb8RJajHennF+jNB5j66+UhI1jQil/Rht2pTJZl929eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4lE9c0M; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4lE9c0M"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913d45a148so17863f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743010474; x=1743615274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Kc6grXY/4NDWrY/FzCdkN9sWHiujZMChJehHgKAOrQ=;
        b=c4lE9c0Mt3a3gcHkH3tVzLRVjs9fn0p2xY1AnsGok3tUjoc3G0cTFwE0IajcU30ceA
         BYUUkSeGdNEjA5gF91mxtU6j8a1z69pnMpTRsIgkqv2QcbH9WmjxeA5R+8He6BdPmC6p
         ohFQuI3jWljWYS1msYddrkvtrloLoBO+9C17c14N6zXz4rtx+QI2BAgJRiTpl7dcFpny
         BDitLP9Q2vFli6QynQlcNaGGPhw9sEed7yQCLViiKpi1ZY+/HS6iYj7M8Yfv2C3LIesH
         ZOBo/vYqWRJYFK5xGz8Pj1w6Hh8mwi08tuMsZQdDw7ACq7ViGUgEV1Mdt+GFXimxWNYp
         RMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010474; x=1743615274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Kc6grXY/4NDWrY/FzCdkN9sWHiujZMChJehHgKAOrQ=;
        b=tkRDxlYgnoQ7Lk10THlkdvFMw2pl6vP/FtLLVavdiMbyq5Gr9TUllpZNB88X7un89E
         x3I8rIsufw4Qy4ev9+nMUKHAEAkMBgrFdm4Rkc5NLLXV4dMjFihzRCwHUSfugWCoeZr/
         4GOU9WwfKz6ZkHTC5JHl7hepOsyuWkGT7M73XfseSniOs68LGcv7YNtir4vAlHGQ53lA
         qlkiTaie3x71gbUKxyaCwihK6e9eDsk9j3V1C3+fF0Nu/Ab0dVW0NrESIZsncd06PqUu
         Vn9c9emVTNlL13RvrNNHCiHOyNK0r7twMxj8yPv4sFkNAVFP85vMnb/V10XKFg3p3ZGL
         fAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUF9edYJaKlWkalMyQIeGdqCrMklhOO9oRKM1w2y+xKo0T7DGnEDuYzRwZ+5hjYcTQYDbBOf9XeivI2YYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8XY7yoxwu5lJDopXRGhtES5cpp9HAN2LbG7bTRuZZFhg6neg
	9PnKKLmNRhKCjbVb18NmglzC0SefcusCYCWDvmCZy9oi/VZWE2zHOuib5xGFOyg=
X-Gm-Gg: ASbGncu2m5hFa6RMbnqySoValP+/g1b5hzpBswHxbsWVJiy82Hg49goHdx/iBPeauXR
	PBDlCx54i90hRVbE3dw5VeixJkRJ9yemcv5+f2zn+WJCg4CTmJpnfPMDPlBpra3ucizN2XhkSRZ
	gn0rsiFnxOu9+us8DYqrBFnuQzn/yfkjgUmsvSEL7XGlwem5IY3vjQeRKJKNnTv6XgSLNJAi464
	4BEan//jEv9e/Zi7i3jgnp5fz0Yv6FgxAjmLdRo/rDDFWyaRQHno2RkYWQ1t9znaipx9ZOSAQXG
	5Jg1ggS34BoKulJgzsRggpXi6vCscX/DaJYdeyfdPaaYEAmyV88A1rLAcfbV6Qd63wsYaeLjZ69
	w9YEjSwg2Grv3yC/DaVP+
X-Google-Smtp-Source: AGHT+IHdeS6vxWy8prYQAed7HAJqShZ+3HTkJj1XN9SebgqM93xuW3ecPahTEyTYzdf0ChCT/E3JCQ==
X-Received: by 2002:a05:6000:1a8a:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-39ad1749384mr310868f8f.29.1743010473893;
        Wed, 26 Mar 2025 10:34:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f7c3d9sm9152365e9.36.2025.03.26.10.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 10:34:33 -0700 (PDT)
Message-ID: <afae182f-b264-4b57-acd7-2c2cf090e1ad@linaro.org>
Date: Wed, 26 Mar 2025 17:34:32 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Add OmniVision OV02C10
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 hdegoede@redhat.com, mchehab@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bod@kernel.org
References: <20250324171508.GA668235-robh@kernel.org>
 <20250326150114.71401-1-bryan.odonoghue@linaro.org>
 <W8_0Ch2J0PWJ5pKHojZjFbM8huvxWlaWajtl_uhQF3UszGH_O8WTRZdQxh_eHs2JzLOx7CCxx01UZDHPQqAyCA==@protonmail.internalid>
 <1dd46a9e-e97d-415a-9e33-67ee234c4bac@kernel.org>
 <0de575dc-5afb-40fb-be30-99906d0e493b@linaro.org>
 <c1959f95-9ee1-4597-b6ec-fbedc8a872db@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c1959f95-9ee1-4597-b6ec-fbedc8a872db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/03/2025 17:19, Krzysztof Kozlowski wrote:
> On 26/03/2025 18:09, Bryan O'Donoghue wrote:
>> On 26/03/2025 15:40, Krzysztof Kozlowski wrote:
>>> On 26/03/2025 16:01, Bryan O'Donoghue wrote:
>>>> Add bindings for OVO2C10 a two megapixel 1080p RGB sensor.
>>>>
>>> You already sent this and got some review. What's more, it's exactly the
>>> same as OV02E10, so just put it to that file.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> They aren't exactly the same.
>>
>> The i2c address of the sensors is different 0x10 for one and 0x36 the other.
>>
>> Also different data-rates for each chip.
> 
> 
> I meant bindings are exactly the same, unless I missed something.
> Devices are similar enough as well.
> 
>> Seems simpler to me to have two separate files ?
> 
> Not really, more files to maintain, more trivialities to fix if we
> decide to change something in all bindings (e.g. style).
> 
> Best regards,
> Krzysztof

Hmm, so we have two in-flight series and one yaml file.

OK, I'll drop this patch and add ov02c10 to the ov02e10 yaml as you suggest.

So long as the yaml file goes in first, the order of application of the 
ov02c10/ov02e10 drivers won't matter and can be fixed with a cherry-pick.

---
bod
