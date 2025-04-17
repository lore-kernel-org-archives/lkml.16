Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3CE1B4223
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744869567; cv=none; b=mmi5/Lo4nEB6u1lNvMSfGEDfAyHBJgJtK3fAZHg+vgB8D08Jc+1n95ZNW7GjLLRRzFVqZxpLAjBqF1Iu1ZCA+iBbpaSEsBLF6Y8OP7XF6T0MghxSaJvM/A62POzaal6msmP9sNst9S+dpNtRuwUBi1X8J93dpEhhXr2XLAiZivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744869567; c=relaxed/simple;
	bh=0iFoUgnREDBc/ZlkVrSYb4nxLYJIRHF5kS2B/alzlVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeHJlwKOEcguQI6VzXHzAEygXwIz01YvkZVDLV16rv5FXDRxo3ssbcdWYmX3n1j2DZVFjFd3hX1YOYTUY1q17q8s91r2WNvd6YOpsSn2lZj9jtlW+kEn/2ZkHtlgwHqcELiGTn+BAICpvCLibNYGRe4xYHzQRHj6YeDaPc+mJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeH+NcaQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeH+NcaQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2241053582dso6027775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744869565; x=1745474365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf5v6WUNE0KkGFompqgKh9fVytzNPfs6PdhAhx8i7h8=;
        b=jeH+NcaQ136Cny5JE6BzgT/yh9Y+QiMe7/XWlZ82ZplqgFqPpUJmLv+BcHd1m8iAAm
         Kuaiq7ZwZSlBV+HlCEiikFvX/C1hEhW6DcoJva8Rzzl3wpYxgBI1je3kEzh1Qj46trqR
         ACV4KSaG6ax0QLeftv1OvUxH5oZ8bYWwjwuZoDubu0hWr1olXL3PXqc7IRd0YYrczNfC
         D7d7UcqH94khR5vgQ65voGX3RhRpvp8LAjgrL8gdt+RfKTLBPGbq1csU0IbWzzlcY76l
         huFoFRz5bUmjHl65GAdWUHFUQRnUsHhj/zKfUqWJi0lxi8cX9fV3+SBFMkjmVkk9pKOU
         fUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744869565; x=1745474365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf5v6WUNE0KkGFompqgKh9fVytzNPfs6PdhAhx8i7h8=;
        b=KDfTq+2h0NWv8eOzlurgVMZOcepJGGqKPgpBrr+1VX7KSSAUw7oSLqJMrQn6HcqFyF
         32cYM/wqBqruOibGQ9tJr5m/yoZGvUnAT6OAkP60NR6CDSLerxICdvPsl7I/ZKz3bjmg
         l3C6wqgnD1kDn/O+3iN6brePJHDmtbDLrkjPU/g259WxGZ82rF9qTWh+LXXEpE5xk+5K
         20ua5ed2NmrdfsDrNgjYaHXzeDn7cWGpMUPArIzLSHRPbHzxDvSODRCGhdJvyns2WiQ3
         5z1mYazWjWcFlXqGIU82W2DooslXUBJC9JNMjpCSobJgH+EidFFaz1BMrYXE4ERfEuIw
         ViCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxX4fu6V0ysGfybf9EDQ85caqJYqwer9lRHuU+9eqeOI1NctUJiJIn4zJ7fKQLzVbSCWrY2/0pEfVi1l8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy711yjR/zA+D8IY5ZCHjk/Ljt+vjDFDUWXNIHTRs1TeEUp7wS
	QUo+baV+10B/MDBjrk2I59XTFVYvdGpBxZn0+h9ymSkrA2gOndsUuc6pP4Jd
X-Gm-Gg: ASbGnctbbM6Gd0DKQJAfwlehnKkzMGfOiaoG7BOz7nMxxIKCsEmpnO6KdELIIz40aRi
	lYQtlZFBSNnIJrG3rnOILHf01Qy7mhTrqCZlz+U08vCKNkBe50FoecEPvsbBndKNB2Jum5klkso
	BK/WkzNWW7+iIRYn5/GWeFQqr+Fk1ESCbotdnePsmCjvMuk2BE1Kp7uari8a1TqrlZzTh/hkseG
	f8JuejPuAWFjxkwdDvBVwmtxvQx3BhrEZvBTkLmAw/n/MCwAk9GGv6w6jH4kmoAn5JP4r5L8jls
	K6nWyolDdExn7NnLan/pkiG0AOujLMcuajg3JIuL2nPFL6Kzng==
X-Google-Smtp-Source: AGHT+IGOpIi8n49rg5GPxgP5C8C9KBM2mgfe0CKcnaU5ra4euhedv6ChDXYp2gZNQ30AVod4qdgISA==
X-Received: by 2002:a17:902:d48e:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22c359a22c0mr69420315ad.43.1744869565054;
        Wed, 16 Apr 2025 22:59:25 -0700 (PDT)
Received: from [192.168.0.161] ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe6df9sm25021375ad.231.2025.04.16.22.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 22:59:24 -0700 (PDT)
Message-ID: <927ff3f8-8814-4f95-ab85-0e0c14c6ed85@gmail.com>
Date: Thu, 17 Apr 2025 11:29:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: mwave: smapi: Make usSmapiOK signed to fix warning
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
References: <20250409211929.213360-1-purvayeshi550@gmail.com>
 <2025041520-culinary-obsessive-1dc3@gregkh>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2025041520-culinary-obsessive-1dc3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/04/25 20:22, Greg KH wrote:
> On Thu, Apr 10, 2025 at 02:49:29AM +0530, Purva Yeshi wrote:
>> Fix Smatch-detected warning:
>> drivers/char/mwave/smapi.c:69 smapi_request() warn:
>> assigning (-5) to unsigned variable 'usSmapiOK'
>>
>> Assigning a negative value (-EIO, which is -5) to an unsigned short
>> (usSmapiOK) causes a Smatch warning because negative values cannot
>> be correctly represented in an unsigned type, leading to unexpected
>> behavior.
>>
>> Change the type of usSmapiOK from unsigned short to short to allow
>> storing negative values like -EIO without causing a type mismatch or
>> logic error.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/char/mwave/smapi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
>> index f8d79d393b69..37da1339357e 100644
>> --- a/drivers/char/mwave/smapi.c
>> +++ b/drivers/char/mwave/smapi.c
>> @@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
>>   	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
>>   	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
>>   	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
>> -	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
>> +	short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
> 
> This no longer a "us" variable type :(
> 
> The joy of using this type of notation, ick.  Please fix this up to use
> an explicit type (like s16), and fix the variable name at the same time.
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thanks for the feedback.

I’ll update the patch to use an explicit s16 type and rename the 
usSmapiOK with SmapiOK to match the new type. I’ll send a v2 shortly.

Best regards,
Purva
