Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EE1ADC73
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780970; cv=none; b=sSg2Uor9uDnNY32Gj3JwJVPFLV0XqSAA4uAECaD5YWsqZhQ4YOs3rfvSWDvUNauzILCyvlNU3U+y2Yr3oSHIygrJPZ+2dp7c2dnMsDnDkPEZMchns8KOI9v0yFojp8wX/Aj6eWoil0/z5cBDPONV/R9rOrLasfhPtmTct1k6nlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780970; c=relaxed/simple;
	bh=bq8ZvLLY3sBFobFVReFNoN1iLHim74L7lvCBMNa9U60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nz3yzjo8rMZ7sy198qVbt+AyKA2yAzL9wpC+28GCjT/i8QdExzzdsAxRZkZJs4SaBOMfswNJUFNr6a5soIoK4+hs6PQBjM1MMDoKyNYEMkJz9v3l0q0ZvEmR7wQJUZ1FokqeKFmviwSFrrCg+Te8INF8p1G+e5jsh0OZIooKdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KCzhBJrz; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KCzhBJrz"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fae04a3795so16944136d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749780967; x=1750385767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=KCzhBJrzuBKajrJZ8jRIIiCPju9sJWppE3KqgUceDOLFz4m4AzNlM1dFDT1vyIEbIm
         apoUIPOTwGXqfWOzCsaRiUGyFNMZNm3C3rz/jfdE+1vwmVvtAbapfh3mdT/Bs71ERN7S
         CIVnTi0PUpuxAnlHM5tfXHaxqqzBw68LLUeAJSuxDO1ORDpWhsxqSdTFO5GUNoC3BxIx
         9QmHoPR0csnoN672QnrhE1IDXsRA/IOp7SUerRhCKk6gsMTp6IBLPY5A323Ul/VDAbfq
         WSlI+eXK4rkDx4Zc1MBMhcZBnqkM+Irh0WEtqppVk/ZJ6oEkEkPJCViqGbiGXL53q+uW
         tXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780967; x=1750385767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=WhYbxZWdsA/fom/8l7QJZGIMI8GrTHjC9fdC9zH2pMRq9im0DA//0sxUdakPJG9EVJ
         JT2sMA+UtXp9t8+tCi+xPuoPk7Q/0qa3QvsREy764oh7Fyx2oycKhouo60KoemEUVy2p
         BAwMZ4pmoX4dfc6AtkW/cPHZfNAQQQ62t2LxZgeL4Bvov9ODehqEUtvN+TLjzgvVztRP
         FdxZsjGODZPn+7fjpSoQAWhzeOcwBqlz06SGisoAtr2F4S0TdvGSw1Mlkc7C3/qY7TvO
         n/tGKZ4iyffDxdkEY4INr0z9KeZDlVKmOovvSTMQUboL9yLA64vgxbTVwXLEQzzsDFqm
         YykA==
X-Forwarded-Encrypted: i=1; AJvYcCVSx4hivIHytN4N9aj4hY9+Qskq9sb+MQqjQnzVFjLgGCCsyopIyTQx2BFCnx+p5K5Qp+yZKYpu5qhxkB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDawyfdOwGdCxh+k3wNgB5aTi21heb6jpiL+KI1Ico8rpNgKF8
	faZe6RxsTNdiH0rZZSVFdPcii+J7fuNTcbgaHR6omC8SWZSE3wcUp3rEB+vUo8YIm2E=
X-Gm-Gg: ASbGncvQufP5bzteN+V2I7M0xeHevZVnas1iiYOObr00hbgzLSw4icup4yFOc6WzGmU
	Fz67aTt8Zx3QotBpxwtIwljYFyL5705mx4s0CbCJWOtm95CzkZR4IPGbRBeLwTPC/kXfgxh5ofh
	8DlKQuVdb2TRdafq8yYMN+3FRVTgKdUF/TyhPsyBkEW4tHSSOQM/simCBY38ECwkGa7+/JU1ygp
	rvHpKVOHUn65jmAMqo/oLuLaOEoeMM6ei3e6l1xBFhYtSkZWrgzUFYJgsOp4TGPQRICR1OsCjVK
	t/4ZEog5UXM60g3bztPI8CqyjQcvu97sfXY6NWF8rbJdYHgtB1KSdCgy7cAxJmDSe7gq7KO7ESK
	cFKSTs9V2XA8c/ikIi03ODgGWpQ==
X-Google-Smtp-Source: AGHT+IEPrCYVuYaf2snbGSL6nYTSnkJ5v4bgC7WUqyASAClJfsf2Fn+WgQFF908p7KrLOpj+L5tcig==
X-Received: by 2002:a05:6214:230a:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6fb3e629659mr19306186d6.45.1749780967455;
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c895f2sm16333826d6.116.2025.06.12.19.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Message-ID: <d7f7dc4c-5d2a-4f63-9451-5e4d2e53cf1b@riscstar.com>
Date: Thu, 12 Jun 2025 21:16:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: k1: check for transfer error
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 dlan@gentoo.org
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250612225627.1106735-1-elder@riscstar.com>
 <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 9:12 PM, Troy Mitchell wrote:
> On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
>> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
>> complete, or if the hardware reports an error, it returns a negative
>> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
>>
>> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
>> which is the i2c_algorithm->xfer callback function.  It currently
>> does not save the value returned by spacemit_i2c_xfer_msg().
>>
>> The result is that transfer errors go unreported, and a caller
>> has no indication anything is wrong.
>>
>> When this code was out for review, the return value *was* checked
>> in early versions.  But for some reason, that assignment got dropped
>> between versions 5 and 6 of the series, perhaps related to reworking
>> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
>>
>> Simply assigning the value returned to "ret" fixes the problem.
>>
>> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>> v2: Added Troy's Reviewed-by
> Hi Alex, you added the changelog, but the subject line
> doesn't have the "V2" suffix. Is this a mistake?

Yes it's a mistake.  I contemplated sending an immediate
"oops, this was v2!!!" but opted to wait until someone
like you asked about it.

This *is* version 2, and I made the updates I describe.

					-Alex
> 
>              - Troy
> 
>>
>>   drivers/i2c/busses/i2c-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> index 5965b4cf6220e..b68a21fff0b56 100644
>> --- a/drivers/i2c/busses/i2c-k1.c
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>>   
>>   	ret = spacemit_i2c_wait_bus_idle(i2c);
>>   	if (!ret)
>> -		spacemit_i2c_xfer_msg(i2c);
>> +		ret = spacemit_i2c_xfer_msg(i2c);
>>   	else if (ret < 0)
>>   		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>>   	else
>>
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> -- 
>> 2.45.2
>>

