Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8E1E1A23;
	Fri,  7 Feb 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933592; cv=none; b=SPmWQvhKwNnyAKjxDv4FDiQN8Qc3XWdhx5po1dBywzmcy4tk5xDKCKicjOqXlz8qt7/8j73aiJrRQPz6Cp9eMutWq97DEM1GaYU1MOGGkrEnJKTRKAYlW8njFAnMfOImoHG3DaRS7xlHn2N/lUwy2YNU7iMgKxxgouKlblm0lsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933592; c=relaxed/simple;
	bh=8Cn8wOqQXwSgklUp81RhPexa4WAAOJL7R116zLm9fOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlfpEMl7K+4RTUENmD6nA6dwQiCy9njosXke9zye67hqIVW8O2xh5gdH4PsThD6cY1Uh04MHf/zJWqVuOuSCzWcS+S4H3HpxK+lJC/PdgSdQTPPZy1oMSpJp+EyexOlh9+o6prNG2EcUwQ162N7iA9EnoaslnMYTqp3KEuOXcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGahV5tW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGahV5tW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7740ca85eso308550966b.3;
        Fri, 07 Feb 2025 05:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738933589; x=1739538389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAIDUvMqJF3HsOg5RQnZHEKgK80JM34bXGrZoZu2NKg=;
        b=BGahV5tWCsLSiIjhdGBwBjBU/+bfOM6pxKjxAD2jWvsSUw7asWlTXQOZbZD3bRo9Vl
         /LmORVtHmsZhrOkuQAvYuPRts21Crg8QnnTx39y5lNSlb7KDzezUV4LC0321nx7ZAD+P
         g8Gtd/duJYWLzX33c1LFhnZvmyHSbcHJvIOxgKfY1DcBUCfrlLPhYnfQJPQ8aKGLYEDd
         k+ICK5v+p3nSbGBsVOePJt62D5bAIOBPkeGmn+IDoEoBwfxINt1pabAY+7QRwzlwZ9BZ
         +Cua72xAHE4zV4+8QZCDXFTVW0Jw39zx9fypWat52qzyZNAvYQ3wD7cl8CCmlx/iMrPL
         e6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933589; x=1739538389;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAIDUvMqJF3HsOg5RQnZHEKgK80JM34bXGrZoZu2NKg=;
        b=bPwQgYzcdh3kjf5x7C68qR+rrhEMsFPcwsnd6GVubm1ZhSjH+CYsG2iGLNKZ0pyjcM
         gzZw3m4DJbbFGsqbMhpL+8Vl5vLUYLBBChGZx8SLrtsGoJlzGMxMQXHabJVjYRO8TTCu
         5dRccFSX3HM1ygJ7xSWHfdZj1PgYZUhB5Bq6hD9onmNW4j06QTZIxLzEk6cDaxlMLfmT
         Eccpw7yJ1X+k7zDk5YlNoebip1mHE78O5YOmacHGCRqiWFcuJ/zg4fLrUSntKReqXS5P
         HHtw5p+zrlTiw2GGLeh77L+a2X1TUEm4asewizB+bDQVsPYmPpfRxo0sTN6GTJj6D472
         gYYg==
X-Forwarded-Encrypted: i=1; AJvYcCUoKfGMW/Qgi/rHTKriVfEDFch2flPt3szoCkyr0SPp9njhf772sCal3gjONe+ZUz8c3VKQyXKk3YwOPcmI@vger.kernel.org, AJvYcCX/bF0ebp0QKGyC8CEi+YOm6xLefH+naDvFiSxUcgpbJVjBm8u1pNCWyvCVRQDLeeSSLN25EmOpooPH@vger.kernel.org
X-Gm-Message-State: AOJu0YwsLpzvvrgodwdM48kkyjxBbUo9HqKQUvGVwcWJf3saWUveB3UY
	TEMlVW1cSl5ASp4FABSojLL20Oev0k0nVBNTeZst5gIZtBdtYfv/
X-Gm-Gg: ASbGncv9/5RbRIR6S6sVPNKomqOrOP1knubz8/+M1rzq4DO31sfhebDbDLlov6z3QY8
	EKb5djkwjhEEr6/bpQqKYAenlVhmXWUKzMqGZXWyoBtGvWcAyDuzitN1/ZeAOMu2ly67sx1zOcv
	cM/9ruMqJBvv0RvNz0GzOoFvlor2yg1oWj8N/DnFZbg70KrX200iKKV1iyNwQBnJvKdVQKDbPMb
	pQAKwohISrmYNCEaAlzxI4C2gVT3clodT8+K/x/f6WPCEtEKB4hFJKLEtYoUIsVs03Ex9+SXrp5
	r0GnY6bSpNIHh6yOEl4UsOo6Cy669i1jHkytazlCQ41WfDGGd1lUD8/2IDyN
X-Google-Smtp-Source: AGHT+IF23i+bLVu6xQLagQY0iQsPCDtzqSfKx065HMgxZ1ucv21ADcRH7FJoEMrvnNJprAQJAMH5TA==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr308195866b.50.1738933588917;
        Fri, 07 Feb 2025 05:06:28 -0800 (PST)
Received: from [192.168.50.244] (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f893e9sm267815066b.65.2025.02.07.05.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:06:28 -0800 (PST)
Message-ID: <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>
Date: Fri, 7 Feb 2025 14:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
 <20250207084852.GC7593@google.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250207084852.GC7593@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7.02.2025 09:48, Lee Jones wrote:
> On Fri, 31 Jan 2025, Artur Weber wrote:
> 
>> The BCM59056 supported by the bcm590xx driver is similar to the
>> BCM59054 MFD. Add a compatible for it in the driver, in preparation
>> for extending support of this chip in the bcm590xx regulator driver.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
>> Changes in v3:
>> - Fix compilation warning about device_type pointer cast type
>> - Name the device types enum and use it as the type in the MFD struct
>> ---
>>   drivers/mfd/bcm590xx.c       | 6 +++++-
>>   include/linux/mfd/bcm590xx.h | 7 +++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
>> index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
>> --- a/drivers/mfd/bcm590xx.c
>> +++ b/drivers/mfd/bcm590xx.c
>> @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>>   	bcm590xx->dev = &i2c_pri->dev;
>>   	bcm590xx->i2c_pri = i2c_pri;
>>   
>> +	bcm590xx->device_type = \
>> +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
> 
> Why are you dividing pointers with each other?

That's not division, it's a line continuation (note the space before
"\") - had to insert it for the line to fit in 80 characters. Though
admittedly, there's probably a better way to do this than to force it
with "\"...

I will clean this up in the next version.

Best regards
Artur
