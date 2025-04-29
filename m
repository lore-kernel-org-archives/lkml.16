Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89428C5DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916973; cv=none; b=qcrBn/2Ig/zfJ07iWUGo+35DfUTZIk+hxOiFw1MyRdp6jvZajWoemBAZ2KdC+ctyEiJZzCnc/h1V54Xzl6jAZvWB+6RtjfUAfHRUqCDzueUwD07iZuiUQnFi57bwFfSm72+nHHnNJ6+jYpqEUc6l4WqH33rXC8sjNXM+dvtkT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916973; c=relaxed/simple;
	bh=VGSUv8IMyo/+7FSfMQ/md9GZ5yAXlVyAihHwpi/VFmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nu03bmA35bU1ba0OPdzQaF61V4Dvi98OegGPndA6O49l+SzmrbXJeZG3cXhDDg93SiKaC9KQaLUCrRg2XwdS7I/TBs1NliBQVMfWgAKSSiwFDaxAh8v5w6hv9Qt6wKPcrwdMZVcoiWHHuVUZdpsxp153mu94LMQMxPV72pdBoGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgUiQqKP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgUiQqKP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so58677565e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916969; x=1746521769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6o5hjRp85UWQQXUadf5ZOJK128HUInGP2DlPSifNAY=;
        b=TgUiQqKP5EVuFvI1+LcIgfzCNwD3zeWj4PrVF6Zi5u+evH0qpv2+9l8+5BZ/C0+goC
         D5cx9fl8eUxrG1JXAkF6Cyw7P9m8Q583Q6q6h0HCT7yD1mdJFBRHDfcJyNow4MxYvmqu
         akDXmWuDQSg9KoI/f5vLV/5bLHY+O2NyLBDMHEzl1qJhjkp0ftcl8iI7yKhwTAb6aIf0
         dipea8PMzBoDnkIJ8zwV2bmfRbktCrjoMnxvBJrXoizOkCi0stxP31nXDHfr9pwr8o8N
         9JEptMrwziCLUxD7UY3G2UwPOK+iqT933BrsAdjFWOMhIhKBy6riekX6xY6aymqWGq9B
         3D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916969; x=1746521769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6o5hjRp85UWQQXUadf5ZOJK128HUInGP2DlPSifNAY=;
        b=hIJkcSpqFoE/V97bJzMLjCXHKIIjGfpm1YUyvtrbqLB46qzHiLTWEdGTwLZBaRf8UF
         ywiliJsrp3IEc5rfVGRPM/mBKBTWCtQM49228aKg3BZI8Y5xfD9keMNEadsZb5IdWa41
         8Ula1lUUQX/NSVNBppORlSMDtXVtw8Qy8iCSxSvE5jo+eOiGdnPZh9jD/+IPuIWmdsG/
         uM+l/u3PbbEDhmlejIV9wEfnuKuoDqkpObZewTjNOBdH2bD6b3UjpKRNRvh9w1d/4GY1
         0FpXDUgRp5h2BfhvVCO8F2o+XGQwaSpRFlt+fkWNPBzHhAAOyGhwvOB+qTOP6vmXf7Lb
         DE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWqZIwa0eDvBKIjiBZD/Ycxs4UPBdKzcosWvi1OL75dpi6UaPrLrVzUjBM5Z/pwaXuPjxl9riITeTcA9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfAp9D3w96fAYnHXOk+kbl7fQn5+gPfw62fdGKFsgjh+Pdl61
	RjCYOZf1Pucw73o+/45KRgopffpYGio/dqkeeA+Jd22c0jzDzMSaP5Sj9Kt6NJI=
X-Gm-Gg: ASbGnct+/iOC9kX9cTlfR2jepMSWA5/9JoDPwgijRbvTtNQQ8RBNN1WVLkUDzLEMXuB
	VvOowD4rZADBfvRQqtjkx/B8YuV1N+Ki6FobaZL8M2K+t74U2alBbSFmyzhXyxf9TWXCDizkJtX
	Bf8DdV5QA82AA5JhJI738XFBvn9ZXPzJMUoqM2IPc9s3sczEojXxf6N7r6PgCFm4/pvCn4aJUY6
	G+o147q1OyrFjtbr02moWK0dq+dGBXesV+b5wcY5VJN/MTDSl/Au/mIRBEczXwI/98q+yAP8Haw
	D2ysVmHXGolpikBLgL01y1gWk+GbELNutNW4MQSYsglBL8HJkTG9g0FJ1I9gKATubRiZTlg9L4X
	PRkfuYQ==
X-Google-Smtp-Source: AGHT+IH9rqlanYRLVoejNADUZZK2BCLrA1vTjyKXJPEFx5S8Ym0qtiNw8zpAkebHLPNFkECSALlAsQ==
X-Received: by 2002:a05:600c:3c86:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-441ac8915ebmr16226495e9.32.1745916969184;
        Tue, 29 Apr 2025 01:56:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbe386sm13143769f8f.42.2025.04.29.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 01:56:08 -0700 (PDT)
Message-ID: <0b2c5b93-15f1-4d44-a524-bd444cebf377@linaro.org>
Date: Tue, 29 Apr 2025 09:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Add OminiVision 0V02C10
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>
 <20250428-spry-mustard-flamingo-78ef4d@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250428-spry-mustard-flamingo-78ef4d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 09:38, Krzysztof Kozlowski wrote:
> On Sat, Apr 26, 2025 at 11:35:21PM GMT, Bryan O'Donoghue wrote:
>> Extend the ov02e10 bindings yaml to describe the ov02c10 sensor which has
>> the same bindings with a different compat string and different i2c
>> address only.
>>
>> Other differences in sensor capabilities exist but are not expressed in
>> devicetree.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> I previously submitted a standalone ov02c10 yaml file but, it was pointed
>> out to me by Krzysztof that the ov02e10 yaml has exactly the same bindings
>> and we should therefore extend the ov02e10 yaml.
>>
>> Link: https://lore.kernel.org/linux-media/da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org/
>>
>> The accompanying patch:
>>
>> - Updates the overall description to differentiate between the two sensors
>> - Adds ovti,ov02c10 compat string
>> - Adds an example for the ov02c10
>>
>> Once merged we can also merge the ov02c10 driver, which contains a compat
>> string requiring yaml description as precursor to merge.
>> ---
>>   .../bindings/media/i2c/ovti,ov02e10.yaml           | 47 ++++++++++++++++++++--
>>   1 file changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> 
> There is no such file in recent next (0424) and no dependencies
> mentioned, so I cannot verify and I just assume that below:
> 
>> +        ov02c10: camera@36 {
> 
> makes sense and you are not duplicating I2C address on the same bus.
> 
> You should document the dependencies.
> 
> Best regards,
> Krzysztof
> 

Queued here

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=devel&id=7db2f2a8e6c51f65a099c40a7b580566ac44c805

---
bod
