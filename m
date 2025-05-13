Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BE28D8EE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139089; cv=none; b=fosYoyYvTi3xQOeZc+QQFU0RMLsPrckl1eYhR8Q22Bvu3M2PIEenQ5yDJacvFFgb7LhcDGJB2JccOGThnzi61+kQt4keSmSsxe6Q/34KLg6CAl3ufKvwfl+0TXePJLW/O9L1nhvQDFZYAdVd0NzKKyqQpXZ0oqBBIhl6RX8dtA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139089; c=relaxed/simple;
	bh=nCH0DieIdmLcW3j4bl0vM0PoHomAZV2rslViEgt6WTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7D+UeNeYUvinAJQH5PhzKsaEE4m/c5Lq27Yhyuk9t/Ii5fsayTRxfjpyqGwMntiJceFwJNuQ9Q0NCM5XZu2m7NBhl3xkodOZRPphHmfG+5m+JIz7QSHJ+po4JdPCDbipYml99M9zlAH2ZpPl32F6YMkphqL7zDFPyKt7Jh2r64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=LEV3MaS4; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="LEV3MaS4"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so28617925ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747139085; x=1747743885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=LEV3MaS4S1gduBJmnnC8Wzj2vCAnz4136bjJdvM3Jx9rMBwFuX7oIIQdsIutSQRooh
         e/KXRRtLhhcjizvQoAA/jVOg2DHk/mOzJyCjoypGL+domoffEORglwXDaPjzHjNz8f4x
         AWGEibG4x3xaoFRo1Gm/WoqbtcY4b7RX4usAbctMxYC5f3IVLGxf4YrV2I+Aeg9r3Iae
         KaL4uzMV9Hn2GkvPSRVou4bbfatpvqwboZs5teujQdNErZc6iuhXGgwBw6jZTd6zcpxx
         Rozu8AXRip7v7tkLOzHvnjveO6qyahXT0EUwye5ADdbo/8mmRh96Gc2599tBF/ksRR81
         Fn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747139085; x=1747743885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=Vc6sAnEwQVZPYQaJlX3xHc6nodGFmG3lmitTJKihod1j025hHj0MXxU7VZn7ZE5aK1
         k9sinBL7VCG+seKjHGB8IlUExqBorDkNTT8Z87CLlcTl/wAh/QLu9d+H5damHskELAsp
         +MAYhlqUPPbG60Ztvt69xWDn/YjJXvmPDezDAXP9E57BL8uFmfSM0CGCwTyWjrnQOJQp
         GNhCrZrweiBI/bEAcDvnBvN2/cnsXDG1o78KC8sNoKovhFlc7W5kIXiRe91xBxZbNq7g
         lje4fT/cifpZ7WHby95YcPFfr5zDp/rCB9Z4iFOMYuZEg3A1iX/P4uAXFvTBD1YNfs53
         mUXg==
X-Forwarded-Encrypted: i=1; AJvYcCX5NVC2qY3HL7HmUGsUPHen2OXbAxwoXx8rVrtPIY6OZrxwOJd/hSQ3XzQ7xHTBe928QHXzy3UzBT3veOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9ehkj2bQjwBExouDPy3XbPTa2sDGOpodIcirzoWJvRAjKM6x
	I9agjOqAWslD72o71Z6sKVY3vy4Yu0sgq91P1czcyxYtwhNAYauiHY+FvTLF0V4=
X-Gm-Gg: ASbGnct6AfcqZPKOtlSsj9PfRaPwm2CJjpu6Nl3e0pUQI3EVwnQrwgLFRmnZ2W5dr89
	KiVi7k5u3VQWEHnAPXb9gBNOjuccV+cd7XES9R/WrhV2boXLUZSOzX7YOcmQnG8RDBplBnq64yP
	T84nnZ1fd4pMtDJjlrcxwtvrmvcCGriJgXKQjt3cx1/T7aXTD1QOWw7tpI6uMx07CpvWup6WePu
	QPZsNH/zrR4p/yFPB4/1KNk20eg5fTGD4EYCom3Z5BIkYhmzHRGh9HRYFxq6efNa9DKTQ1SeMhR
	NeMFqrwZOnjXASZrtlPLSIZhB8cOXJY47u3+Fox32LVfuaLvrDJ5jo4i0DWBD82cbbrmT6VaIZM
	qqjeoXK1wnu8HMDM=
X-Google-Smtp-Source: AGHT+IFa99yDPla8yOwa2Lb0IIWEjfvTvZm04RmCYhnJ6t18LZAeThH57cdW66O3OAMcaFau7kC0qQ==
X-Received: by 2002:a05:6e02:1a08:b0:3d9:644c:e3b0 with SMTP id e9e14a558f8ab-3da7e20dd8dmr165655765ab.14.1747139085428;
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm26965915ab.58.2025.05.13.05.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Message-ID: <560c33a8-4917-4c89-a8f3-ed7810fd675f@riscstar.com>
Date: Tue, 13 May 2025 07:24:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-5-elder@riscstar.com>
 <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 4:21 AM, Philipp Zabel wrote:
> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>> device is an auxiliary device associated with a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already define clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig          |   9 ++
>>   drivers/reset/Makefile         |   1 +
>>   drivers/reset/reset-spacemit.c | 246 +++++++++++++++++++++++++++++++++
>>   3 files changed, 256 insertions(+)
>>   create mode 100644 drivers/reset/reset-spacemit.c
>>
> [...]
>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>> new file mode 100644
>> index 0000000000000..eff67bdc8adba
>> --- /dev/null
>> +++ b/drivers/reset/reset-spacemit.c
>> @@ -0,0 +1,246 @@
> [...]
>> +static int spacemit_reset_controller_register(struct device *dev,
>> +			       struct ccu_reset_controller *controller)
> 
> Align to open parenthesis, line length is fine.
> 
>> +{
>> +	struct reset_controller_dev *rcdev = &controller->rcdev;
>> +
>> +	rcdev->ops = &spacemit_reset_control_ops;
>> +	rcdev->owner = THIS_MODULE;
>> +	rcdev->of_node = dev->of_node;
>> +	rcdev->nr_resets = controller->data->count;
>> +
>> +	return devm_reset_controller_register(dev, &controller->rcdev);
>> +}
>> +
>> +static int spacemit_reset_probe(struct auxiliary_device *adev,
>> +				const struct auxiliary_device_id *id)
>> +{
>> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
>> +	const void *data = (void *)id->driver_data;
> 
> Unnecessary (void *) detour. Just cast to (const struct
> ccu_reset_controller_data *) directly. Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you very much for your review.  I'll update to incorporate
your suggestions and will add your Reviewed-by.

					-Alex

> 
> regards
> Philipp

