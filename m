Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D207290DBD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656518; cv=none; b=jSOLnL9yrFdv83crCrOetVZ3WgXvYAnXhm4sF0lGs+farxEP+4Z6Mn+s+SH5Bl4CZAjDTxndTss/lGIuhkVoisNICoHeLv8TPIG6MQdxlcReTRqpsGRYnKBcbe0lrQRrmyCEgCg56ZZcbOo5DJMjSyV8ngY1Q+ZtM9KTl1WWUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656518; c=relaxed/simple;
	bh=mrD5bsbfiH527bvGHd0iBOt9QRfNgNUuHAYvbUekAJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+kHNeBDJxXLG7oETYaxp/MvaovN31xF3a8VYwAIDvkMzNWNcXHtd5pIv1gge2Al3jaQTKgyR4j2od9NoaTLeEpac50vq30FRAQ+94wGzupKENs5IURQXoYXwlHFVwqwgKDUsWyQAwoDqrOGYt0HqkRxZUmvZEQgYf/YRjKw/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZcfgaoKW; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZcfgaoKW"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b41281b50so10826939f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746656515; x=1747261315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peoXh4ZZR5wrf3LtTG3kUEylrZGuLJ/i6YQpu8s7aQo=;
        b=ZcfgaoKW4oy9ZOf3Yy0H/h6osjz9o8zImGfuMfXxFgImbSUdFgiZRXBkl1mVbH56Rm
         UmBntRK7qi53VBrTSkrfXrGNrtrzuQH7U4qvwk9nafB1+Pv09XNvSpPs4bxTUkB5QQ1T
         RxVILX8b8fN9nP9rh3UH38V+TD57qWToR4m4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746656515; x=1747261315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peoXh4ZZR5wrf3LtTG3kUEylrZGuLJ/i6YQpu8s7aQo=;
        b=wCrX74VeWXsm5BqyiF9Fe8QK8njWL9nzoPD8Xf9FPC3+v5oalv5ATJLGeyjCohjqOZ
         4tQHTbzj0EWAaDDunO/J/VnXiF4EGi75b16QOaJ7JWkzCUub+8I+41K2h9BVrYEZw+zI
         5V1t/H8fhL6K042rnDUyykQJ2S3wJMffRcTxD/FXVNnxiJj0ZqBxxf88B0pe8q33Cd3k
         ab6rDMipM8lgqgqI74PD45u2TuEmR3M45fyh8rMvC+O9gf79Jg4SlJl0snNtAFi2ieyx
         fhqD9M1T/CZnU06HXsahU1BKitzy7wObM9iBzJBUZCzAmNHsH61j7z3nUwHvLi+RTl+2
         o/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXKDfHCj8qKYQdvHJKQRCPsLiU8BZwFD3O3nVpk2Gjrhewxxm5Cx0Rxpzu0dSTodqPXGT2dtwjnMsoBrto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7j7E9jRTXcLvlkWKvdXla11iT5jForLhziJdBCUpCDDtEki4
	kbk2NVGx8RxNs4Bw937AzWt9vxXvbVJZINCTMlfATz10IBvnwx6WSgk04ANMJrI=
X-Gm-Gg: ASbGncsMrI5AVFxLIRABgaHNbYup/FhP85NRoMb8LUvHY1f7LuOloyqzT10IlgkkVVR
	jRBT5i8JbkhkNlzweKBPUJU+JCJFZ/PIdH1Z/N6RrxxJ9hBv5IhNyPr0XXzrWDVcsQ2YAkva5bg
	RwTk5GnB2bu9Nx6eZ6efeGwrD6jhdUir4CSSBTZiaDqDmQZwyKL0svVaq6YPSZgK3zcKNXURUPI
	dASeGZ0Zf/9WuhFXK373RGDnPeKeEKAxz82A1GK0EfoPXLG6ZrFvJY0qdnbnIimn22jiTBVKEIG
	9O5QonpaGGzbcKRs3eAbUduQYnap83AFMg1rl5oH6cpCP5QE7hQ=
X-Google-Smtp-Source: AGHT+IEOSe4tST32x99VUilc0RUlJlbiI4RGJPhAVxNSyIT78hlykWguNOUUPQ6VWTh8yR5SUwC0uA==
X-Received: by 2002:a05:6e02:3001:b0:3d5:8908:c388 with SMTP id e9e14a558f8ab-3da784e3bfcmr19528015ab.0.1746656515177;
        Wed, 07 May 2025 15:21:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da71591c4bsm8824615ab.40.2025.05.07.15.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:21:54 -0700 (PDT)
Message-ID: <e7b517ee-08a3-4bbe-a9c0-497f1469b04e@linuxfoundation.org>
Date: Wed, 7 May 2025 16:21:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: use ARCH from compile.h in unclean source tree
 msg
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, nathan@kernel.org,
 brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250502172459.14175-1-skhan@linuxfoundation.org>
 <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
 <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
 <CAK7LNATTE62vNgW5bMhh8rA3=eDO5WoGGvt0N0AkNn3DFGR4bA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAK7LNATTE62vNgW5bMhh8rA3=eDO5WoGGvt0N0AkNn3DFGR4bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/25 01:23, Masahiro Yamada wrote:
> On Wed, May 7, 2025 at 7:07 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/6/25 05:12, Nicolas Schier wrote:
>>> On Fri, 02 May 2025, Shuah Khan wrote:
>>>
>>>> When make finds the source tree unclean, it prints a message to run
>>>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>>>> line. The ARCH specified in the command line could be different from
>>>> the ARCH of the existing build in the source tree.
>>>>
>>>> This could cause problems in regular kernel build and kunit workflows.
>>>>
>>>> Regular workflow:
>>>>
>>>> - Build x86_64 kernel
>>>>       $ make ARCH=x86_64
>>>> - Try building another arch kernel out of tree with O=
>>>>       $ make ARCH=um O=/linux/build
>>>> - kbuild detects source tree is unclean
>>>>
>>>>     ***
>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>     *** in /linux/linux_srcdir
>>>>     ***
>>>>
>>>> - Clean source tree as suggested by kbuild
>>>>       $ make ARCH=um mrproper
>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>     files under arch/x86
>>>>       arch/x86/realmode/rm/pasyms.h
>>>>
>>>> A subsequent x86_64e build fails with
>>>>     "undefined symbol sev_es_trampoline_start referenced ..."
>>>>
>>>> kunit workflow runs into this issue:
>>>>
>>>> - Build x86_64 kernel
>>>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>>>     as default:
>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>
>>>> - kbuild detects unclean source tree
>>>>
>>>>     ***
>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>     *** in /linux/linux_6.15
>>>>     ***
>>>>
>>>> - Clean source tree as suggested by kbuild
>>>>       $ make ARCH=um mrproper
>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>     files under arch/x86
>>>>
>>>> The problem shows when user tries to run tests on ARCH=x86_64:
>>>>
>>>>       $ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>>>
>>>>       "undefined symbol sev_es_trampoline_start referenced ..."
>>>>
>>>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>>>> x86_64 build.
>>>>
>>>> Problems related to partially cleaned source tree are hard to debug.
>>>> Change Makefile to unclean source logic to use ARCH from compile.h
>>>> UTS_MACHINE string. With this change kbuild prints:
>>>>
>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>
>>>>     ***
>>>>     *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>>>     *** in /linux/linux_6.15
>>>>     ***
>>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> ---
>>>>    Makefile | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 5aa9ee52a765..7ee29136b4da 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>>>                -d $(srctree)/include/config -o \
>>>>                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>>
>> Would it make sense to check for include/generated as a catch all?
>>
>>>>               echo >&2 "***"; \
>>>> -            echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>>>> +            echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \
>>>
>>> Please 'grep' option '-s'.
>>>
>>> There are some (rare) occassions, when there is no include/generated/compile.h
>>> but still the source tree will be considered to be dirty:
>>
>> I considered adding a check for not finding include/generated/compile.h
>> and figured if include/config is found we are probably safe.
>>
>> I will fix that.
> 
> 
> I do not think this patch makes sense.
> 
> Kbuild correctly detects that "the source tree is not clean enough
> to build with ARCH=um", and displays the following message:
>    ***
>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>    *** in /linux/linux_srcdir
>    ***
> 
> This is absolutely correct.

It detects it can't build um - but it doesn't detect that the
source tree is not clean. The problem is once user runs
'make ARCH=um mrproper' - these checks will find the source tree
clean even though it isn't - a subsequent x86_64 build could
fail.

If kbuild suggests mrproper for the existing kernel build instead,
the source tree will be cleaned correctly.

> 
> 
> The real issue is that "make ARCH=um mrproper"
> does not properly clean the source tree.
> 

The patch you sent doesn't solve the problem I am seeing.
You can find the details on the patch thread.

thanks,
-- Shuah
