Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726620468C;
	Fri, 11 Apr 2025 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744354578; cv=none; b=mO2Rhsv4T29vcKsDo15cdnFjtTUFPFuCXld4BU4dNwkfADT1/aJZT7LE1es+Ege2eLHKvKQ0ulQ9v6FMQ8/BqIkY+tUWfl2sSidTeUbHHTPOUiVwF5xyA3sp3CVA/1rb+WFgbdfDqq0zRtmQfhQ3u/QmLjI/UGFMCRlCu4QEt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744354578; c=relaxed/simple;
	bh=5WP/vU5PDewgpkWN/3Fd2MxMTnu2oLhshOwmHHIIhR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBcTBm3UJy2RNyMHtWWDkyJhze66m++ZSxnEZClqCCyHqOmtd+5pQ9th4mVUMUIRZHE7Vg2qet8+RnuDUXvtt7EAXXxEn4Pj/dNr3ATql+GFd1yWRN9hWSiyk13uynVX6CA8G/p2w/+oWyJyfgmwldRqkAMSd/BmIhCk6xvMeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eD3F9eDs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eD3F9eDs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736ee709c11so1317444b3a.1;
        Thu, 10 Apr 2025 23:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354576; x=1744959376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfuuxX8hIrtK9DMaogg2N+2ARGcrO8WGuGbvU5xMwvU=;
        b=eD3F9eDswmCCINkfLC9CUzGDd2syKwhh2WSJ76FU+YIfPY55Dp7UgNuVWD5z00dBZn
         Se0ONiDjRSInfTXyLllOt42vjxCtJYOiRbSOVm3shON0TCepxLKBHNgYSqsSTb4ts7ZB
         yPFzTED+q70ha0XiL2hjr0/qdrSpfgmdLB6HMCtojHS/kF/aY16A7oXMCa07KLZ5puIV
         2Kg8t3G95LxNNo1jDksRMkAV9ChmuwE6RZRdOt57+Ohts6+r7ZJMMt0wfAcwQFxW7ala
         sgCRsrG0NdAZUaXIfpurDutq5UTwPXVH8njPuGlMbqR+/p0jpTriZWOZ3GkmOFY515sl
         /fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354576; x=1744959376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfuuxX8hIrtK9DMaogg2N+2ARGcrO8WGuGbvU5xMwvU=;
        b=LwNEmSI6d04j2yd8hbZqvyTmmj8BUUhFAL+C0/SaVs4SVTnrgXzwBUCg5JDLxE/pJz
         PagQIiy7Oge4kfQa0XvxkeN0c3OqVAEgfVuueQWOuXugQ/tJImx2vYtq1CqQsn/txoMS
         aEw061fzGh3WmTPmiLxmIMGciMMTBLy0P/zU3PmfbmHEq2+M8Xf4041Zj055UAC7sEQb
         aBjKAYk2ktJ85hBl1ar0raMQaGqbZH6Lp9ZksxyZLzH/mQBRHzRXNEG6Y4eCMfPfc24j
         cIrCgyBwSnzt0zaK9vGYh426e/89hQwACWj+ylvb5VSjrPyJvmiHpuD3JDqfQL1Rbhe9
         JOiw==
X-Forwarded-Encrypted: i=1; AJvYcCU/uN6lBY0+khh04UJ3wERxIuS67as/t2Ni4t/D2lUmU+69O5GSLgiLf2kGy9jZIQUSAERti3gpsVl9GjbZ@vger.kernel.org, AJvYcCVu/ltO4L5Z9YZhuFhWWZogGEtlS7pXaYIyRhae5fIFHoWWR50dGWSxY6IVFBG++V/ZIMak4RBPyxopsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsnk8QLvArgBtiTzxg13C7f1izNtuWq1E4OBWKgoVL1a4v5vyg
	9ftDPaYMV+yaWEE1z6ZDWStdIdBuhADE3OQFG/STWBc+ZupeKCn2
X-Gm-Gg: ASbGncvdu89ZY6n4AHiSRy+1QNB/WlD+AHbkhwjNOxEtbLw1f5J3ckiebszvAOpNWzl
	0nBDtcNwsCiAK/dj9oHY5NdzpjcEtBGs5wRGRZhoDb0WVTZueoDgCHU3KbEJ3uilzvl5n0ltGM1
	JBk0i1QonCV1gA+Sdb3PlJAnL0icRbGCilO0mZI2JYKFKO+UaI/tYHO7r1hfc37GoH56bIz35HC
	U93rgEtQ1lfIz10sRzNJX3S3FU1kKtcLmK/089+Va3LKxS2ytYblkhOZfqVN+IIQ8iECoCWdY8+
	viOy8CFXEWhDg0c66fimKPrrxa07Ds3yIkAE9xDdqnE2neA6AA==
X-Google-Smtp-Source: AGHT+IGezBemc+XoSzOeO1EuLMONf4zEDZd2si8T3oAdFqqazHTyYZyGFQbn07TBHpCAxJh6ZeuV3Q==
X-Received: by 2002:a05:6a21:6d84:b0:1f5:535c:82d6 with SMTP id adf61e73a8af0-201799831dbmr2591357637.35.1744354576060;
        Thu, 10 Apr 2025 23:56:16 -0700 (PDT)
Received: from [192.168.0.161] ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2eb3sm4117955a12.24.2025.04.10.23.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:56:15 -0700 (PDT)
Message-ID: <26872134-1022-4cd5-bd04-215d54c55791@gmail.com>
Date: Fri, 11 Apr 2025 12:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max31827: Fix uninitialized variable lsb_idx in
 max31827_init_client
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250410194833.21366-1-purvayeshi550@gmail.com>
 <f0ad5113-eab9-4e71-8363-1b7a005189c4@roeck-us.net>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <f0ad5113-eab9-4e71-8363-1b7a005189c4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/04/25 01:31, Guenter Roeck wrote:
> On Fri, Apr 11, 2025 at 01:18:33AM +0530, Purva Yeshi wrote:
>> Fix Smatch-detected issue:
>> drivers/hwmon/max31827.c:564 max31827_init_client() error:
>> uninitialized symbol 'lsb_idx'.
>>
>> ​In the max31827_init_client() function, the variable lsb_idx is assigned
>> a value only when data has exactly one bit set (hweight32(data) == 1).
>> If this condition isn't met, lsb_idx remains uninitialized, leading to
>> undefined behavior when it's subsequently used.
> 
> That is not correct.
> 
>>
>> Ensure that data is non-zero and has exactly one bit set before
>> calling __ffs(data) to determine lsb_idx. Additionally, verify that
>> lsb_idx does not exceed 4. This approach prevents the use of an
>> uninitialized lsb_idx and resolves the Smatch warning.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/hwmon/max31827.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
>> index 48e8f8ba4d05..c62eaf186d9d 100644
>> --- a/drivers/hwmon/max31827.c
>> +++ b/drivers/hwmon/max31827.c
>> @@ -558,10 +558,13 @@ static int max31827_init_client(struct max31827_state *st,
>>   		/*
>>   		 * Convert the desired fault queue into register bits.
>>   		 */
>> -		if (data != 0)
>> -			lsb_idx = __ffs(data);
> 
> lsb_idx is assigned if data != 0, not if hweight32(data) == 1 ...
> 
>> +		if (data == 0 || hweight32(data) != 1) {
>> +			dev_err(dev, "Invalid data in adi,fault-q\n");
>> +			return -EINVAL;
>> +		}
>>   
>> -		if (hweight32(data) != 1 || lsb_idx > 4) {
> 
> ... and if hweight32(data) != 1, it bails out here before using lsb_idx.
> The problem you describe does not exist.
> 
> Guenter

Thank you for reviewing the patch and clarifying the behavior regarding 
lsb_idx. I understand the existing control flow.​

> 
>> +		lsb_idx = __ffs(data);
>> +		if (lsb_idx > 4) {
>>   			dev_err(dev, "Invalid data in adi,fault-q\n");
>>   			return -EINVAL;
>>   		}
>> -- 
>> 2.34.1
>>

Best regards,
Purva
