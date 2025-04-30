Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316591EDA11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048518; cv=none; b=HWzr8OLDZY0fPF8TnEmBPE4t78dtibxlcoeZ0vHgyaiID1WZBYOhWD6QfCFF6IQA4s51D6OtMp708v0/wwbks1EZIqNdbcqxOoGguBmzb6e7gj7kgmb0hZCc5Y2LAlMkf1SLqB2lAtgYNFEwrkqB88RMUgVTCfvniT1TgNU/noY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048518; c=relaxed/simple;
	bh=YqAluL15fN3zgcGp6EDEaNIV2TWFeVKq3zBmJjBsYhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmXpgOrv7FR5XXlQjqrD+KFJaJ/t3zD86+2jdyxpQVFCshVipAXgRxC48OyXQBE8gPDWP9tVTe5drGP63iXDXPe8XtZLa5X9cQuruWRAOB9LP/7+fOWj4SwvcWxOmbhyWngK2iBm8TXzUiYw3bm3+/5+pRLHD4FfZAIq7fnGXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T+NlcjjH; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T+NlcjjH"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d812103686so1447895ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746048514; x=1746653314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6Q234hicpNrTkMdew1fU6M9FGq8oUuHNboh5He87eU=;
        b=T+NlcjjHuHfA1JZ28bnYk/soZ1SoT13mYL4RaL40AWdUr1fAdgxW+Y8zzySFN80eAi
         BuVIIdlth/NTT9r+2viqQp+ypCmBLrNTAUzV4kB7IrtoddZ5DgQjgBtFD4drg1Rnpojs
         8ZZJvzvqoQCHVTm8gBT3SN8ZVjPkrc54FcLh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048514; x=1746653314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Q234hicpNrTkMdew1fU6M9FGq8oUuHNboh5He87eU=;
        b=KjTaaHGzKnDaj7ahhzJMLx1U3krOYZQVg2V291L6F6PuibFB/5AIPnd5eJh7+5KKdD
         493ni46hVvnpoI66/Jq+F+SbhckErH4uV9W1bYA268RAj3ZZOiPwThorhU/QnF2OsHBJ
         sqpNGDwBPGRlHeU0M1eUsjtGnHEQMYLOVUdEAe+M2q9o51KTqqq1lhgn357D2T/KbiLq
         aXTMGz+OTWfmA1ip7kHuP4Yhjzjjjd6938ITwFHcPG1PRbkl/U6a5tsFugt9Q9weTwlP
         +uJx7Xb65m6YC+snkSn2Dd0UnY2MOZuJ6HG20Xo0/vmR+Pym1u5NSuktdtPqwKJjMhZh
         Lnvg==
X-Forwarded-Encrypted: i=1; AJvYcCWqLQiz6HTHYf4eIYpOH5k9KxkiaSl8wVqE1ueNSMJjTynM7sbW06iXRK8ViSEV5Xnt28Stu3UDeZG+pZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtjJHCkgfjuCaofmxcKs4Rp4IKSR5+Z2Jx00wgJfCP93KYW1KB
	d+r94Zar7ZnBGV+ZTgZKDBoD6hqet2hYJBXYtJDKUiSl4Ln5poUSHqsZyvfNgjk=
X-Gm-Gg: ASbGncvBmBj5xjVBuCPNVagFiMxzOZ4v2JukMTtQc2ue8cUaOBxuAL+sfW6KuCM7nww
	dj15R8hTS2yhebEuhr3BjYon3ovm/wv8xrP4eNT+uQmFKvK8yF6VSTE45PA1oeSeHb3gLW99/yK
	eB+naXdUQVqmfRFKACWpmeGHwgCuRVc1Wl0kmsywlSM2VBBdKdpokE8VSfed7uw0iGHsEwMYk7G
	oatxTI5OJQTIgifDG0CMJsNjIv8d1Q7+Lz3tcgroJCu5sRFiQrz2gxwhb6PYgvm65eJDyL5Z4aJ
	siFperqvjzOIJ6LX5IWFbgOIxiZSpsrCKmg0kkrcDIwBiyZZdSFh8vLhXlm2Aw==
X-Google-Smtp-Source: AGHT+IHr33UkYRxijRAM6C0PAuYUzQs+dTqaVy/R06IhM3g32uMluoDz2LA9U/xU2npCtEVgmVtjpA==
X-Received: by 2002:a05:6e02:1543:b0:3d9:6d60:709e with SMTP id e9e14a558f8ab-3d970a946afmr491905ab.4.1746048514197;
        Wed, 30 Apr 2025 14:28:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f40b9fesm10153365ab.49.2025.04.30.14.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:28:33 -0700 (PDT)
Message-ID: <041c11ba-476c-4a2f-b5ba-d686d403a023@linuxfoundation.org>
Date: Wed, 30 Apr 2025 15:28:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com,
 corbet@lwn.net, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <20250430071825.1e196cb1@foz.lan>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250430071825.1e196cb1@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 23:18, Mauro Carvalho Chehab wrote:
> Em Tue, 29 Apr 2025 16:27:12 -0600
> Shuah Khan <skhan@linuxfoundation.org> escreveu:
> 
>> Add tips to clean source tree to build help message. When user run
>> kunit.py after building another kernel for ARCH=foo, it is necessary
>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>> during the build. In such cases, kunit build could fail.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   tools/testing/kunit/kunit.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
>> index 7f9ae55fd6d5..db86a396ed33 100755
>> --- a/tools/testing/kunit/kunit.py
>> +++ b/tools/testing/kunit/kunit.py
>> @@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
>>   						'the options in .kunitconfig')
>>   	add_common_opts(config_parser)
>>   
>> -	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
>> +	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
>>   	add_common_opts(build_parser)
>>   	add_build_opts(build_parser)
>>   
> Would be better instead to detect if the last build was not done
> by kunit.py and call "make mrproper" inside kunit.py?

Detecting last build and printing out the right "make ARCH= mrproper"
command is good. I don't think we want run the call make mrproper from
kunit.py - this shouldn't be a automatic step. It would be annoying
to loose build artifacts if it isn't what user would want.

thanks,
-- Shuah

> 
> Thanks,
> Mauro

