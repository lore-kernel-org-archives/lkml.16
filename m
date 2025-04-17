Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11341189B8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883406; cv=none; b=cLc3Tde8jHwY2slz7V6BdJQ3JXfiNx7MxxX6OqLMtOoosRoPYjxiz7iwZFp56QhDfSnXoSLTvQoUq7eBBZTn40VY8IajlsmlxHqc0X4fbyPvQ7V0i0B+0bcSoMT+BpKcSZCCXRCatxs+Oap1VnNSJp5KerROYVNvweneYORU1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883406; c=relaxed/simple;
	bh=mNKS1ThIMK9sL7OpJ0Pq/t3emuB0Q9NPwGbtSCIlblM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLcGK8+3u9ye9/bFMLnoVLGEZunD0WNWyHUzCZSxcZu48Gml85MGxHl5tC24exKuXlF6TrWsbOkdJi6YPyDyvVRNYvrakUrnFU5WQ7dwKyHrCgkRbL0PQKT04bayvklEotxDHGgxknQ0mrYARVWzfwPp9gf6vi4WDjxZksvaZ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2ifBvHF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2ifBvHF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301c4850194so398261a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744883404; x=1745488204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xaPJLxjZQzO6WPICu5Fd6vdGKGk6l1RenIAqdzuK74M=;
        b=Z2ifBvHFXQnKU/jUnVv/eGWL40yOnNMLaANQESOlT2qI1ekrqRAJfq71qY33LSHJAg
         Vs9J0xG/QhfH7ETxV5Flo4fBbyGcxtSUbilxGNGvKSS7/8wLD4HB3DnaWqGwxyK2qBEI
         G1wv1APBQXI+HxapXOT4cjESAIpvu1vuwnlsBts5M0UYZr6e7cY5zyN+Vm8kWzlN4ebD
         n4l6jraTp4rf2f/oBtT2hsdKKOnqjHnSFNMH98DPXJogo42D1AXshJSLVaixu90u66us
         /LBBuBr6Ma7PW9Z0Mw2Hv65J4hrtz0C05RsmXRl8a23f52Xf7nhj6ktBfbjVvGN8yhFg
         MHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883404; x=1745488204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaPJLxjZQzO6WPICu5Fd6vdGKGk6l1RenIAqdzuK74M=;
        b=YoingDMbI+/0J21e8mpHftMdLXp4Ezv8WD1p1a2n8ttVkNFycBH/ui2HOpcMt0n9rk
         iI17Znyk325TIYLSkugHr4o0uLr5WuCgLHf0Hybpbm3gcwMhgsh8AmIbwTczutYfPFKe
         MiMK8Temunk+rxW7BBT1uCOy4mvaIscV4j5pgxSKQPw+X7KWahVUfzdWfAaIIm9b4S+y
         Z9poxb/c1c9TLeXdpksRRRQnSWDLA8aXKM7tLbw6FwsOqzFgAWNmjyuS6zJHgItungFN
         B+Tz4GNKIc6o6jYrC9pMAmAUAaGpFz557YSLCMF56OyidRpuMKq4O95nmbYzpZ1V5pry
         QHyA==
X-Forwarded-Encrypted: i=1; AJvYcCWxrYlMm2Kp33W4qNw9ysZ6ZmZTUiyN3MUWBVxSPrM8sOjbImjmhWK+pvK2ZpM3SPz+/U3aeFEy12jigBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KDZtc8twcnliEeD3ScqqNOk4suOUuYYxADdmpyWE9YLtvqV8
	LA7mxNCT0mhcgiJEDGWOi/1KqbTzRtk9e2N3LCcOEOYIRvhjNvus
X-Gm-Gg: ASbGncuoQRCDKKeI19aQN+5LpbNOLQPVVvrfR96itV9/JJiz3epn9SH5u8CVFLaoDay
	cnrhJBq5DVWEzvbrikrfvDuzKfCTpj7hPsrUZhT1hpQDXdW9tWqc/QPrF8NmlKAlu7s4rnOLr7M
	o1dItNJY4A/IdGsEDY1GSWf5ABLRuf5Vs7s/2xdpJJPv79lnQdmp0om0/05o/d9+UXhGkia4VSH
	qrp1Wc8kyECz4P+ITTaT6Aa8+RnF+d9dOqLg+j684LEIyfpC5wgznuIQLwLLlZ0VmBNG0WhtUCc
	K87il93qk4O7IhQJdbQLAp1UOyK+qOV1N1Ul8kcb51OUyhkWvg==
X-Google-Smtp-Source: AGHT+IG+WOEsN1LmJFiT/mzJmJwNWQ5XF0sNlAZUKFlAahuiD7DpiUrQfZYFyHw4sgCPgHxAYCVweQ==
X-Received: by 2002:a17:90a:d603:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-30863f19942mr7493340a91.11.1744883404174;
        Thu, 17 Apr 2025 02:50:04 -0700 (PDT)
Received: from [192.168.0.161] ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb6fesm3155801a91.41.2025.04.17.02.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:50:03 -0700 (PDT)
Message-ID: <d5e06499-781a-4bc0-a43b-8ef2aa89930b@gmail.com>
Date: Thu, 17 Apr 2025 15:19:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] char: mwave: smapi: Fix signedness of SmapiOK variable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
References: <20250417091018.29767-1-purvayeshi550@gmail.com>
 <2025041728-calamity-unsuited-4ba9@gregkh>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2025041728-calamity-unsuited-4ba9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/25 15:08, Greg KH wrote:
> On Thu, Apr 17, 2025 at 02:40:18PM +0530, Purva Yeshi wrote:
>> Smatch warning:
>> drivers/char/mwave/smapi.c:69 smapi_request() warn:
>> assigning (-5) to unsigned variable 'usSmapiOK'
>>
>> Fix Smatch warning caused by assigning -EIO to an unsigned short.
>>
>> Smatch detected a warning due to assigning -EIO (a negative value) to an
>> unsigned short variable, causing a type mismatch and potential issues.
>>
>> In v1, the type was changed to short, which resolved the warning, but
>> retained the misleading "us" prefix in the variable name.
>>
>> In v2, update the type to s16 and rename the variable to SmapiOK,
>> removing the "us" (unsigned short) prefix as per Greg KH suggestion.
>>
>> This change ensures type correctness, avoids confusion, and improves
>> overall code readability.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>> V1 - https://lore.kernel.org/all/20250409211929.213360-1-purvayeshi550@gmail.com/
>> V2 - Use s16 type and rename variable to remove misleading "us" prefix.
>>
>>   drivers/char/mwave/smapi.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
>> index f8d79d393b69..65bc7e1ea6cf 100644
>> --- a/drivers/char/mwave/smapi.c
>> +++ b/drivers/char/mwave/smapi.c
>> @@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
>>   	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
>>   	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
>>   	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
>> -	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
>> +	s16 SmapiOK = -EIO, *pSmapiOK = &SmapiOK;
> 
> Do you think that "SmapiOK" is a valid kernel variable name?  Doesn't
> look ok to me, what does checkpatch.pl say?  :)
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thank you for the feedback.

I ran checkpatch.pl on the patch, and it reports 0 errors and 0 
warnings, so the variable name "SmapiOK" is valid in this context.

Regarding the "usSmapiOK" variable, it was used only within the smapi.c 
file. Therefore, I have renamed it consistently throughout the file to 
avoid the misleading "us" prefix.

Let me know if you have any further suggestions.

Best regards,
Purva
