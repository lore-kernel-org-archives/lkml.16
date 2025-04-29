Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297D259C8A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969590; cv=none; b=pin2I6af4sbRO2GOAkSfuzX0sc5tmw2EarDNCNr4SWPzKyizvt2bZbU8yEQPBUG0a7v2D4N02lu+Akp2JxGHgMtErvGGgQ6JNqw7cJIRpgBh2FO2lbXC+zCvU8jKmxlEDzemzTIn2DB/eacnmHYXe+haZaGO8L0Yb7/pazz3Uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969590; c=relaxed/simple;
	bh=91lQyvhQ0vUeR2C5rjMPbLayVwhJTn0+N8ztV6/O+FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syNUTtVSreZNPQWM/w5zqvhOkl9UXqPRkroSSaefmkZWm++Q2n62hR6c/MT5V2o+3sUufzQTps4In+0mt+Piw5kbkOgaMNXI8sbj9+gGJlXyloORbATXHCDuhWMxo+14thzinYxr+38pCuJH9E9OWGTmpkXDIS0Kh6FwID8t3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XvOjz2Z6; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XvOjz2Z6"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d90208e922so32717925ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969587; x=1746574387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=XvOjz2Z62vKzRHJ1GfxUhlkG3jS/VRjAY2VIOgqSyZilWjplmYeE53Db7viuRjL6c6
         eOrcu5fM+5unfQ4ty9Dm6OYlI7J3C/eej/8cKvYjx4CF9TIB/OlO1S5/mg5bQYdPLW8h
         UZZ9khG30C3crwfmvY8SunPMacIi1jDIV+TA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969587; x=1746574387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=UsfhCrDBoWoyRHfeQ9ejDUTr1Y8M+C2yFW0v/NSvpp+DhZLw2A1JO66TX2B7EXJ2Jz
         rAUaeRGctUJv3FBMoRHo5rVAQ9Jwxw+XvpvscWQcvWXUAnsB4+yO8N/vfvye2hHOKVBH
         +xIkjmMTPFNpAUkEp54G03TdkU95Dft4Fl5ZAkDcZ3cXy4cwYf5seoJndHESJH9Mw+v8
         bBbwz1kqmAqxUFoE6dGsVsV3hzoun8fnOeC/8Ux/9+fwcO1SO4Q6FmHTTyC+AQ8S4zr+
         5C5OPV8ol+gm0qm4rHzBDzBV8NE/97tI8Ta0q8/h+YVPo2zejO0Ed8BizTqs/Qjq8zov
         SoDg==
X-Forwarded-Encrypted: i=1; AJvYcCUvzVoSt5+9dMAa5GRhNXJpJmZ62W22QFeDYt4DLW9onFmgZKCveiZCNAbR9aIEx9wBCi8yQL3zQYlMf60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdd7uR3ZSzjNK8qQ2CMQwGj89XCdU+mOkoKfITkjxoeZ2W2KPb
	XWvsWZGNjNixfj9TysEP+W7O8U/re+Rm6nwDibR8gPK/XTnff8IRH5pGln5qNdY=
X-Gm-Gg: ASbGnctxE5MreTpN6eZaqd1fu/SpS4EirH/7k1jyy3SiJWlm36GjzWcYUuqZDbYd0VB
	iyzKgqHj9nj7PDRBtlavnm5dBwr/vF6XVKlzoHROahrrPYBLpcWhionlkZNHizHuODUlTp/bI8+
	vIJiI9viDEA+g5yeu5CsnDDwQjFZ3sype5DMaVr3Xp3WMBOQwYD1buKyS9xT2AjI9e3y/zwZq/O
	aBzWmhzsFvVLRy35MCU7l2LwxPzF/TiQYsPC8yVXh89Bkd0Af3YPLIL8+AAnhWDBME8T6xQ7j5G
	/lCbaja3R+uyCNP54/YO8irCQTt+e3A/CTtlJhHq1K5xDpL2Jhg=
X-Google-Smtp-Source: AGHT+IGmi1rtml3AlLb1Q65Dbn3WTPaIc0r44Elktf5kpSPRnHKwm8fFiAMDfsyaGULJj9rb9LE01w==
X-Received: by 2002:a05:6e02:2502:b0:3d6:d145:3006 with SMTP id e9e14a558f8ab-3d968009f6amr4296895ab.20.1745969587055;
        Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f476892sm5211075ab.65.2025.04.29.16.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:33:06 -0700 (PDT)
Message-ID: <589336a3-4df5-4f58-a627-2b75716f7b61@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:33:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] doc: kunit: add information about cleaning source
 trees
To: Randy Dunlap <rdunlap@infradead.org>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <7104475f60568f6a580b03d84e61abe311d63e46.1745965121.git.skhan@linuxfoundation.org>
 <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:29, Randy Dunlap wrote:
> 
> 
> On 4/29/25 3:27 PM, Shuah Khan wrote:
>> If kunit run happens in a tree in which a x86_64 kernel was built,
>> the source tree could be dirty.
>>
>> "make ARCH=um mrproper" will not clean the x86_64 build artifacts.
>> Running "make ARCH=x86_64 mrproper" is necessary to clean them.
>>
>> Add this information to the documentation.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Documentation/dev-tools/kunit/start.rst | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
>> index a98235326bab..568e29aebd6e 100644
>> --- a/Documentation/dev-tools/kunit/start.rst
>> +++ b/Documentation/dev-tools/kunit/start.rst
>> @@ -39,6 +39,18 @@ can run kunit_tool:
>>   	``make ARCH=um mrproper``, just be aware that this will delete the
>>   	current configuration and all generated files.
>>   
>> +	You may see the following error if a prior build leaves behind
>> +	header files which 'make ARCH=um mrproper' fails to clean:
>> +
>> +	"undefined symbol sev_es_trampoline_start referenced ..."
>> +
>> +	This is special case scenario when a prior x86_64 build populates
>> +	the source tree with arch/x86/realmode/rm/pasyms.h. This header
>> +	will not be cleaned by 'make ARCH=um mrproper'
>> +
>> +	If you encouter this problem, run 'make ARCH=x86_64 mrproper' to
> 
> 	       encounter

Thank you. Will fix it.

thanks,
-- Shuah
