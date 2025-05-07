Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AC20C001
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658114; cv=none; b=RfJlIWvhJwG4BuJ3+XBYexM1swGUtDh9gr8OUrxDXrG1VzUj7X49hIM6E+T+myXLaR9QKciQ6kgFV/HXlw3xqYuelu1e2mLwOB4/gMDPRnpRO3BdV/Ul8KuBkTOCFlA0zY9S3GFxk+fdC0anMIZwQka5CJHHaPrrX51kYV/b5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658114; c=relaxed/simple;
	bh=UeN+k4ZyO9Dh4Nb3AcxJ0REtDmmRTFGNUAhRgZfmPmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYtskLh4fv5MZY4FLtBMEthEdm2R25iTpqtryBTXiWtnQJeShlAqWEq1GncNPjEyYXZ3GrIuKQLUAsXLmBzabtjQDsQiNH1wpER3qh3buDKGnaVsBK8PiwAvgL4I+OOHPeL3CKOCKlV6Z4FvxyoOW2DZl9D8cFVHuMY2pgENyO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fBKEeWeT; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fBKEeWeT"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85dac9729c3so25522239f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746658111; x=1747262911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acGmQM7tifOr8+Eoy2xvyAghcRlqFxatC9kGV77CrC0=;
        b=fBKEeWeT7LAh5q3Hfexz1acUu3KaF8wA+VEz5n4a8OJ1KF1hIU1Y3+xIxwDvyZ8+YU
         orMO0lTWaMNQLDdlTH0sLkzgnoNuQ7uly9Yy68uJdtH5SYnavqhTHi+ZGPOKLcI+M3QK
         sFMXYkciKpq6vNO1SpwLAWr0yDP5sa+6XbNK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658111; x=1747262911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acGmQM7tifOr8+Eoy2xvyAghcRlqFxatC9kGV77CrC0=;
        b=IywZh5i2tlzMA7XCR5FmOSY8+h34PTGpiCVGzKcQaiEKXp6CgJGi9xjBUeBE/Ov2Ge
         DztNuUzKtn00JgLXc2Y2iw5uONoIgR6jEmjB/ba9bNhqbQCw7Ts0uuKxtO4hhsodPx8E
         9vBCxR2R7ghl91X7+zzzUt+bQ8YsVhlLnYbeRSN534glh+JnrjC8wKiYfaSDEvREoVP7
         gXzg19gDyVPzMYU+drjaShmg9EsKmzqOTJODbDY8H0AbzN5UwWxfVE4Iai11S8njv2if
         Ddnp7q6BTdw01wJzo7+Dyvq1ATGnyX+qbLRj04umDJtC0WKdmZhGosnkus/LqvYisacf
         czgw==
X-Forwarded-Encrypted: i=1; AJvYcCVLPpQBNk8/5b1ZDaq285oHLGHkE/mxGGLTvsi4qBJLfhMxezAu9pmMTM1/Eplq80Q5c/u9xTAUa2UqDh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNJygbThXEdqqmhIZzZzyb01EOP5rboyRMmeANjF7RASJJvtN2
	rUZ0ycWLyk0j6Jx4YjodNmoOO1Ilr766LDWqsDfLBlMta0VANFaCUhi2Zlmdiao=
X-Gm-Gg: ASbGncsMcm+myPJOCUcZQusc34DsHjuyoINjmfQH0l5L+xgvk5wrQ7P1SHyCtSYLGD8
	wMja7rp1AJncaU9VhQefaVIV6Lcu2RvyeEx2xLLWWsdyEMw70xeXkO3BIF0PXf52q3s69leyzob
	cPpTHWDbjjtJq2aIsqF/tPM+XMKJ76IAGa6htYJJbtIvNQPPgrOBWFnVuWNSRigqMrqf65pLgSH
	kLq28OLvvM/1HG6MBLhV2f4ZLPgskICen9QW+C4iyygxLLl/4hdz9Ael1ROY47DefNPopZ477Fi
	L7lMArTOZjHNNE7CGP1KAjll5fFEJXJ3+cWsQGtxdFIrXO+VwQw=
X-Google-Smtp-Source: AGHT+IEu5aZ8NNHwHrPGNG8KVywgZI2cgKqfKJOrqQm1obC1gOdxK5HIUSdN3QGZNXi+lEbcLcKzDA==
X-Received: by 2002:a05:6602:490:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-867473aae44mr662438539f.11.1746658111089;
        Wed, 07 May 2025 15:48:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8ecb9sm2907127173.122.2025.05.07.15.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:48:30 -0700 (PDT)
Message-ID: <9458d0d0-3096-4b77-bd20-3c051b082b57@linuxfoundation.org>
Date: Wed, 7 May 2025 16:48:29 -0600
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
 <e7b517ee-08a3-4bbe-a9c0-497f1469b04e@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e7b517ee-08a3-4bbe-a9c0-497f1469b04e@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/25 16:21, Shuah Khan wrote:
> On 5/7/25 01:23, Masahiro Yamada wrote:
>> On Wed, May 7, 2025 at 7:07 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 5/6/25 05:12, Nicolas Schier wrote:
>>>> On Fri, 02 May 2025, Shuah Khan wrote:
>>>>
>>>>> When make finds the source tree unclean, it prints a message to run
>>>>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>>>>> line. The ARCH specified in the command line could be different from
>>>>> the ARCH of the existing build in the source tree.
>>>>>
>>>>> This could cause problems in regular kernel build and kunit workflows.
>>>>>
>>>>> Regular workflow:
>>>>>
>>>>> - Build x86_64 kernel
>>>>>       $ make ARCH=x86_64
>>>>> - Try building another arch kernel out of tree with O=
>>>>>       $ make ARCH=um O=/linux/build
>>>>> - kbuild detects source tree is unclean
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>>     *** in /linux/linux_srcdir
>>>>>     ***
>>>>>
>>>>> - Clean source tree as suggested by kbuild
>>>>>       $ make ARCH=um mrproper
>>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>>     files under arch/x86
>>>>>       arch/x86/realmode/rm/pasyms.h
>>>>>
>>>>> A subsequent x86_64e build fails with
>>>>>     "undefined symbol sev_es_trampoline_start referenced ..."
>>>>>
>>>>> kunit workflow runs into this issue:
>>>>>
>>>>> - Build x86_64 kernel
>>>>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>>>>     as default:
>>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>>
>>>>> - kbuild detects unclean source tree
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>>     *** in /linux/linux_6.15
>>>>>     ***
>>>>>
>>>>> - Clean source tree as suggested by kbuild
>>>>>       $ make ARCH=um mrproper
>>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>>     files under arch/x86
>>>>>
>>>>> The problem shows when user tries to run tests on ARCH=x86_64:
>>>>>
>>>>>       $ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>>>>
>>>>>       "undefined symbol sev_es_trampoline_start referenced ..."
>>>>>
>>>>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>>>>> x86_64 build.
>>>>>
>>>>> Problems related to partially cleaned source tree are hard to debug.
>>>>> Change Makefile to unclean source logic to use ARCH from compile.h
>>>>> UTS_MACHINE string. With this change kbuild prints:
>>>>>
>>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>>>>     *** in /linux/linux_6.15
>>>>>     ***
>>>>>
>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> ---
>>>>>    Makefile | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> index 5aa9ee52a765..7ee29136b4da 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>>>>                -d $(srctree)/include/config -o \
>>>>>                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>>>
>>> Would it make sense to check for include/generated as a catch all?
>>>
>>>>>               echo >&2 "***"; \
>>>>> -            echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>>>>> +            echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \
>>>>
>>>> Please 'grep' option '-s'.
>>>>
>>>> There are some (rare) occassions, when there is no include/generated/compile.h
>>>> but still the source tree will be considered to be dirty:
>>>
>>> I considered adding a check for not finding include/generated/compile.h
>>> and figured if include/config is found we are probably safe.
>>>
>>> I will fix that.
>>
>>
>> I do not think this patch makes sense.
>>
>> Kbuild correctly detects that "the source tree is not clean enough
>> to build with ARCH=um", and displays the following message:
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_srcdir
>>    ***
>>
>> This is absolutely correct.
> 
> It detects it can't build um - but it doesn't detect that the
> source tree is not clean. The problem is once user runs
> 'make ARCH=um mrproper' - these checks will find the source tree
> clean even though it isn't - a subsequent x86_64 build could
> fail.

kbuild can no longer detect that the tree is unclean since
mrproper um deletes files and directories kbuild checks to
determine if the source tree is unclean.

These failures are hard to debug and wastes lot of time.

thanks,
-- Shuah
