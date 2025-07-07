Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E428D849
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879777; cv=none; b=stjpHunfFETT/GSEswEnL9FwFzlbqMliPkQ8F1NHAzpGQyKDw+d+R/tdsGABGxsJp/N/qKPiMWQv57DEufnPN2SOIEV/9epTFVbWAYkI8yHTry7xvSYMOVL29BQLmztwqAVyjQdiovoVz63ts4TlPavudbmvjHyIyx1gZDmiyhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879777; c=relaxed/simple;
	bh=2N0U1EDqI/jQKzqP2h1Jsj1CKcBZm2BCirQSwgH6hIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzwDH8X9YK6uCgvGZDpg03brxQ54xkX5ZklFjIBdPHzKOxv2SyVoRZMgVdSqm778oyKGKXersY+sZTMbVExhq1QcyWu9y5CP/of6wtQ8GQAK/V6OpG+HdPa7ltUmVOjBJKdO22VJXIus7dkiCdUAHSiS+JlwRLquVJm+rmv16Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKz4l6Bi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKz4l6Bi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso2806835f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751879773; x=1752484573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSMRH5QDvCqW5KnIuvKRJN2G/mVFdVuXbgUbVefRVkM=;
        b=wKz4l6BicRPAH8Tcx9JEwTsy7t2f2Dhfub5lrK+q6mJmzwinjf3PHwigni2zfviSpk
         oBoQ1QQfgHHzmSZDazPEHpvWSQ5dDsmfez9xFDfoPQDdjMffkhncJGiXVRml3qjUR24M
         NFucxuvIhmqKYR/lmz69dvvyakmi0xlr6WI6WguFKAW5/EO2RN9264c7ZwMvejQCeG0r
         4mswesWiNMnU2U6D2Qddfpc9Zie07tNFZhFzCOte3xaK6xkOWEl0FV0OgaNSOIQED3VQ
         1AzBmMaNq0APaXUc+TBz1B0MLCRwwC6MrCTypZ1+ZMehIY0pr6iiMdAIJ2kDhYtOrRkz
         K43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879773; x=1752484573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSMRH5QDvCqW5KnIuvKRJN2G/mVFdVuXbgUbVefRVkM=;
        b=Bm6F3/JjIR0ukD4kNR25f8UyH7Uh/8UbdbW6DZVBBUBPuJeUXmCunLQjbOMpB3Weq0
         VV4Kc5FHPGdojGBgZyHkCuZHgDXU+g/cXAzXpAV8jLMVVNffn1tqU0JS/bTBaQICgZj/
         lP4YpoXF5i7CYMmTyCLoIM9srscspphYxxoQB92QsFMhyMSLPem4Nokz0x/ETOprYfx1
         xyGD2+hK79fO1j1ZrKzhiWIRYY8YNnRZejDMHH34YtPk4gzX9gjBTg+1rd9Oz4VD6hil
         rRvcMOBRMCZ3m55B5mUAfoC4/BO0XmxmHXnD1gxx5nM683qjcUoyZT9T2Oz/axKIR/vV
         1Wmg==
X-Forwarded-Encrypted: i=1; AJvYcCUha/ADNhZWxHxoubrcHeYY6laext/d5CEIyDxoS+NxnpSF8rmQqRUVEgv/Ps0CLglesZqM7eG1UR5A5xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGnBcrcIJ/e62H6Dvw4+dDETixT44EiPQnrUHTtALlWoO3sX5
	4vH6l74aJtivm/Rt41nApdrbOLTRZjUS6LadLl7vQlgIaFtblvxH/lDRKAdqxgAqkR4=
X-Gm-Gg: ASbGncsGg0thmQlsEFRWMu9YN1w9HA1lwbyBLctHRnlPaNBQuS1B11cPM3BI1CC+sOw
	k/l5T2LlNOcq/oZp5rst86Yc7Ni0BlBxSS7CK1EVipNA8i/gZYqPPXXPptU4mz4+hPqIVCn756f
	96VMn4Jqqw43XREL9yY95TOY7vtNCuWj/lmgl/YZj+LhV2HdoWrBhB7pqveGT8vJBhVxQJ11Sh7
	YsbbTsTPTKxtK4dyRfYR+7Y/J0KCnrXR+OUVAh8f2//VMO15T8GPWD8EAp+GCBGi/zg3V2/voud
	BSWyaUfU9Dw5eiUg5XtDtFT1IbA67TZgj8pNH8kcDmHLOqH3YkYQHYzTDTHlmrI1J+E=
X-Google-Smtp-Source: AGHT+IGGCWZfAUj4VNzkhRD8HfhSu3KCxQFzzdO1XpeV+D2rkMvRTzngh9EBKomoGoCaM7fN+nIbCA==
X-Received: by 2002:a5d:6f1c:0:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b49aa0e8e8mr6353994f8f.1.1751879772702;
        Mon, 07 Jul 2025 02:16:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm9687980f8f.53.2025.07.07.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:16:12 -0700 (PDT)
Message-ID: <207d1f3a-60f6-4a8d-8adc-e03e95f198e7@linaro.org>
Date: Mon, 7 Jul 2025 10:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/139] 6.6.96-rc1 review
To: Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Anders Roxell <anders.roxell@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
References: <20250703143941.182414597@linuxfoundation.org>
 <CA+G9fYu=JdHJdZo0aO+kK-TBNMv3dy-cLyO7KF4RMB20KyDuAg@mail.gmail.com>
 <CA+G9fYv4UUmNpoJ77q7F5K20XGiNcO+ZfOzYNLQ=h7S3uTEc8g@mail.gmail.com>
 <2025070605-stuffy-pointy-fd64@gregkh>
 <20250707090308.GA2182465@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250707090308.GA2182465@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2025 10:03 am, Leo Yan wrote:
> On Sun, Jul 06, 2025 at 08:55:32AM +0200, Greg Kroah-Hartman wrote:
> 
> [...]
> 
>>> Bisection results pointing to,
>>>
>>>      coresight: Only check bottom two claim bits
>>>       [ Upstream commit a4e65842e1142aa18ef36113fbd81d614eaefe5a ]
>>>
>>> The following patch needs to be back ported ?
>>>     b36e78b216e6 ("ARM: 9354/1: ptrace: Use bitfield helpers")
>>
>> Thanks, that makes sense, and is easier than me fixing this up by hand
>> like I had tried to in one of the branches :)
>>
>> Now queued up.
> 
> I built for the Arm target in my local environment and confirmed that
> the build failure has been fixed on the linux-6.6.y branch.
> 
> Thanks for reporting and resolving the issue.
> 
> Leo

That commit only fixes it by transitively including the header though. 
I'll send a proper fix to include it in coresight-core.c so it doesn't 
break again in the future.

Thanks
James


