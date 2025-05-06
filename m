Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE82179A7;
	Tue,  6 May 2025 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558200; cv=none; b=GCVS3I0/wZYRZNIUp734bCgpYYVkN3/YyfccwVfaZDHq3XuybcvCsgohLovbr1v/a9vNX2cmKz0xZhfd8K8c+CYIryJN7JNXqihJK1CZM12/9d9m6xRRBRt0GkfZqpq/zorotAR2ZVzkAbRlxiO3TEZ+RQa9S8dLGHRA+jL5gRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558200; c=relaxed/simple;
	bh=o+bp12Z0FJ9fLuWY1TpSl72sJBupgVqpfkSZm49wCjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nuy4N2X/NFL1wLfiPEVz5Y9y4TM+yOn/tp2oS5KXL+K4OnNg9wSdCB4BiRRM9iXxxxgQiDxt7zlVBgBbvYKS5FPb2TubWbqrNhI7G/JIKPJatE/3KezNwNxARnvwytTdsjrKojErbjRxYZJZckuuWaWzMvnxaI5IX9zoGKa0cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEEAE/Ao; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEEAE/Ao"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so839113a12.2;
        Tue, 06 May 2025 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746558197; x=1747162997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7q2D+DX8gUEt0LGQO16zlU47C6emYh/iTsjzICyS8DQ=;
        b=CEEAE/Ao0prV7Mw6HXGMWjNUebeg3/fF1fZn7Ycq9oTrEEXL1lZNMvk84eyxc0p28W
         JJ7RUrYqAxGwvMT9G/oRagVQOp6uA7/M4M+VQn+Ir5EuHlZ4PivGGW1FB+zAJ07RtTW6
         /ZkqKHF4sRCXyWBKqvoUTEuP/ugdKT62Vf5l69zcJSefSdQtbpJ0JM8oZR6xqraMDA27
         6wWSBxiVFOawx66Hu4yyqrxnDS8tlutoYnT2+HbU95zKc2R/ZjT78jkKC5hZdSKbZYHb
         j+pIBu30JGyMQyfHKWkrz1DCjj5Og8QnAUqp4QB1fTdqWojxJjxJYgGaEnHGC2tyrJpe
         t17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558197; x=1747162997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q2D+DX8gUEt0LGQO16zlU47C6emYh/iTsjzICyS8DQ=;
        b=cf0JxFUzdEcERztgtjesPe2pR7nxiqgsB3CKsp9+r6PmapzlIxIw5JT4Tdq28kO+Oo
         a5SZPqiYfXFC8+W55khkoL0H5weLrARHaO3OpNkey3qGa6P436vlQDrIVQ1IP6xQyJKi
         VfIZZoPJzIsFKmJ8mxFPajTG11D481k1RLqEXMcO9Ulby5q6IBH+A/wGactSHSTy/Ew9
         SOCgBRXsTxR3byxfe9ildwXqQaOq0QPPGLZU897jrhcHIUbsUwuK6FT/47xzzfGL724A
         QIRZQqczEaHUBFLTNHKjR/vHUHW5xWFliyngRUtDOVomC/5ltNCQ3VUUAQWbgzmoKlcC
         SwJA==
X-Forwarded-Encrypted: i=1; AJvYcCW3I3rfna3nU4XJZZydOaSjBMn52TLcuGCsPIoXgoQLYsLC5s4FAjwfsYJzVoatISHfTC6I7L5AgV/b9Yrc@vger.kernel.org, AJvYcCXadlvLxci/JssBbr4jCn8LCZhEgdLpF1FcFFc+3a0yYD7wiZPt4KOtuv5a93Uqno/JoKH6oocab+Xo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Gd2wZ2pgxKhnK7sP6IRU89XT8TKwMlyrNzK/0oPSYs7al4Hk
	dPeP/8e+U3pFzs048GZouTnZx0A30nwgQ4baBg9qg6iWsMJ6YvRB
X-Gm-Gg: ASbGncto9T/aeu5VZIhV7OGqXb2LWAeqWIxiVg/nsLRYVwUWk23E2dqCr+zjkzBBM6B
	6fz7zwedvGMoBG/dgmClpfVjv464S6+UKu3XxIxig47XyVb91g9dAXCtptG43l63ZTc7y6Vv6KZ
	Ww0pkDWfOiUPiJi9Ts9t4dWe6fQuw1k55MtLNV99Y9HxRKjuM+3OKpL59nDCyBsGAEWke/y8wY9
	/202KZvw815NDnP7igfvNKfHMf5qr7Wr1KflRHnWjYGsh0mo35ov7uMaUDy3CSxAcZNIYlIXhRX
	5hvZnfiDjj+vJOYkxa8lvXtJ83N0AKgUkiqSNyIG9UNHlTJ3HZZZW41j54dB8wU5730fb+alpgq
	eJtuMwe3JOlv8xS8=
X-Google-Smtp-Source: AGHT+IGAIk6XhkOv4qY9hEVwQZjfW5uzWwoDsjl7pOXvlYuWalU+g9Aa0ZsyZk2gb/vxryl7lxtCng==
X-Received: by 2002:a17:907:a70a:b0:aca:cc55:fd35 with SMTP id a640c23a62f3a-ad1e8d2cbf8mr54940966b.56.1746558196869;
        Tue, 06 May 2025 12:03:16 -0700 (PDT)
Received: from [192.168.50.244] (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895090f6sm753734566b.136.2025.05.06.12.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:03:16 -0700 (PDT)
Message-ID: <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>
Date: Tue, 6 May 2025 21:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
 <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 18:11, Stanislav Jakubek wrote:
> Hi Artur,
> one note below.
> 
> On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
>> The BCM590xx PMUs have two I2C registers for reading the PMU ID
>> and revision. The revision is useful for subdevice drivers, since
>> different revisions may have slight differences in behavior (for
>> example - BCM59054 has different regulator configurations for
>> revision A0 and A1).
>>
>> Check the PMU ID register and make sure it matches the DT compatible.
>> Fetch the digital and analog revision from the PMUREV register
>> so that it can be used in subdevice drivers.
>>
>> Also add some known revision values to bcm590xx.h, for convenience
>> when writing subdevice drivers.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
> 
> [snip]
> 
>> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
>> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
>> --- a/include/linux/mfd/bcm590xx.h
>> +++ b/include/linux/mfd/bcm590xx.h
>> @@ -17,6 +17,16 @@
>>   #define BCM590XX_PMUID_BCM59054		0x54
>>   #define BCM590XX_PMUID_BCM59056		0x56
>>   
>> +/* Known chip revision IDs */
>> +#define BCM59054_REV_DIGITAL_A1		1
> 
> 1 seems to be the digital revision ID for A0 (couldn't find the analog
> revision ID), see [1].
> 
> Other values seems to match downstream (as far as I can tell anyway).
> 
> [1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82
 From my testing on a device with the BCM59054A1 (BCM23550-based Samsung 
Galaxy Grand Neo), the digital value is also 1 on this model:

   bcm590xx 0-0008: PMU ID 0x54 (BCM59054), revision: dig 1 ana 2

(This constant is not actually used anywhere in code yet - I just
included it for the sake of completeness, since the BCM59056 headers
in downstream listed both values...)

Best regards
Artur
