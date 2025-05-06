Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768704B1E60
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569262; cv=none; b=cxJtWMUO0SpTHa+NT9dT2n7b0wMpQ/fN7jWhRdGbBPtHCfut3zp8/Su5SJrxbiXZrApqcYX9SUiBnfeckEJyjL3xqj1le563nXzEVcFlnR4MYpsKcaII0g9Bovda9I9kMfoVDLnjb3wq5VFr4/qevxru1jPSM9xqD2bwFLQmYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569262; c=relaxed/simple;
	bh=QjE1nlrSZya14I8EJupdzC/BpPZW2TwLrhAF+5ao5JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDBVPTQKAHwVOysn39koC+LqdIiH7rHZEgxtH00lw6qZuoa6YIhFt+c+dPRBlOB4CwBRS0BE11VbPpvOjZGrYErvHp0SrEiNPOsgBwd7lPAvuYtHBqwxnGZqRTLzllGQ0NIe9oxhqSSxbf1k8Dhjj5m1fTrNvspfh40VAXoMB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SiJPQmub; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SiJPQmub"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-867347b8de9so13205039f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746569258; x=1747174058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KblXo4CIEIn6gd3GGRAaOBy56G3y46NU1/f1UBl2plY=;
        b=SiJPQmubE4+VnCI0oHshxd9zl9kMVL1rucKYnk44P3PKxL6NBaz7IfC+bNO7NOP7Mm
         rvOzzwsIvhQ8ej8Cf9ve/O+J3kaD9JSxYvZsfzoQMszZj6QrV07a8n2+VfmaOIDeg1cx
         l2EAh+Pvd3u5WNuj5+DLKZXnZLwUp2OSEmUXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569258; x=1747174058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KblXo4CIEIn6gd3GGRAaOBy56G3y46NU1/f1UBl2plY=;
        b=TETbaZrnAWP6sBnOfujpKNyXDXjwsomcXitimJsJpXGtqpizy/3wFcObkdLSlscBwY
         AlVo4P4auAf1+bZYc/QSczdL/GSrN1s0BftqfNFEH+hNCjzuWqZV9zQzLi3Lt10tUHi2
         gtRJ3ybN0AJCCKapQECiTwokJqvO9VJ7IBIKOb/ze5wyVtLV3BkCx03NyP2gt7yXH6i+
         jKTeXC3fdcn33PkMyMfi95yx1XzKcezWmVfFH15aMpC5r6MIbvXnq12Qh3Fq3y1uwSfD
         yPu5RdNgSlc/Js6oY8qpgiYf5Cq5cZAkryuEvKwPavveCjdyClqdkuohK3y08WIZBpyL
         HhHA==
X-Forwarded-Encrypted: i=1; AJvYcCU4NzDWYiPYI498VILs/tgPxuuLnsuWp/YSGPeOpyxJXEHGf82TsXxTCya2aQ90QWYXH6B9sCzuXgx99TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYoOvHw5TbM/JI5CqxiV5YxgicblrjZbWi8nWsh2SKmtsqLBY
	fXJnKB9CVotjBkSgPRMMeckGA+t92kZWaQS794Zai6P0bzbEWNqnJ2WjOLLWy+3fISQlM0Uz7IZ
	D
X-Gm-Gg: ASbGncsXRiPQeanw5MS/YIj/uHR7h0BQXIvvjDoWjvShfQ1RLhmyVnq84AzEFC1xldo
	ZkL4xhKqYPCVgMUHWpjM+cZwEQTYiU1Et1w4UJCdOOmpgXDDOm4K1SC+YD/U4FBNvqIi+WhFtpv
	CPA8KEUAMj4Q4ScnIPO6Vs7JjVGLwOAwkUNi5weZzVdmZ7MKqtKjLcmMkCJmoCstAdDbneC+dH1
	WTm/WtRy1AMW+IRU5FWv540qeqJUUkDmJoFspU+HHPgZeycXiZs+NiWH+Okv9aEYHiQT3xH8f99
	e4l2dG36ozjgr/3TGP5G5tMz0T79uIwnuIEs+hUdlswy0TSiTUM=
X-Google-Smtp-Source: AGHT+IGefz039PqNhxopulHgibNakcS2hQwx2wuEu+yzw8CisJq34UbImELUvr3RlJI24jHT18c8yw==
X-Received: by 2002:a05:6e02:180b:b0:3d9:6e2d:c7fd with SMTP id e9e14a558f8ab-3da738b974dmr10086125ab.2.1746569258415;
        Tue, 06 May 2025 15:07:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58866sm26961125ab.50.2025.05.06.15.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 15:07:37 -0700 (PDT)
Message-ID: <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
Date: Tue, 6 May 2025 16:07:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: use ARCH from compile.h in unclean source tree
 msg
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, nathan@kernel.org, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250502172459.14175-1-skhan@linuxfoundation.org>
 <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 05:12, Nicolas Schier wrote:
> On Fri, 02 May 2025, Shuah Khan wrote:
> 
>> When make finds the source tree unclean, it prints a message to run
>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>> line. The ARCH specified in the command line could be different from
>> the ARCH of the existing build in the source tree.
>>
>> This could cause problems in regular kernel build and kunit workflows.
>>
>> Regular workflow:
>>
>> - Build x86_64 kernel
>> 	$ make ARCH=x86_64
>> - Try building another arch kernel out of tree with O=
>> 	$ make ARCH=um O=/linux/build
>> - kbuild detects source tree is unclean
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_srcdir
>>    ***
>>
>> - Clean source tree as suggested by kbuild
>> 	$ make ARCH=um mrproper
>> - Source clean appears to be clean, but it leaves behind generated header
>>    files under arch/x86
>>   	arch/x86/realmode/rm/pasyms.h
>>
>> A subsequent x86_64e build fails with
>>    "undefined symbol sev_es_trampoline_start referenced ..."
>>
>> kunit workflow runs into this issue:
>>
>> - Build x86_64 kernel
>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>    as default:
>> 	$ ./tools/testing/kunit/kunit.py run
>>
>> - kbuild detects unclean source tree
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_6.15
>>    ***
>>
>> - Clean source tree as suggested by kbuild
>> 	$ make ARCH=um mrproper
>> - Source clean appears to be clean, but it leaves behind generated header
>>    files under arch/x86
>>
>> The problem shows when user tries to run tests on ARCH=x86_64:
>>
>> 	$ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>
>> 	"undefined symbol sev_es_trampoline_start referenced ..."
>>
>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>> x86_64 build.
>>
>> Problems related to partially cleaned source tree are hard to debug.
>> Change Makefile to unclean source logic to use ARCH from compile.h
>> UTS_MACHINE string. With this change kbuild prints:
>>
>> 	$ ./tools/testing/kunit/kunit.py run
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>    *** in /linux/linux_6.15
>>    ***
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5aa9ee52a765..7ee29136b4da 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>   		 -d $(srctree)/include/config -o \
>>   		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \

Would it make sense to check for include/generated as a catch all?

>>   		echo >&2 "***"; \
>> -		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>> +		echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \
> 
> Please 'grep' option '-s'.
> 
> There are some (rare) occassions, when there is no include/generated/compile.h
> but still the source tree will be considered to be dirty:

I considered adding a check for not finding include/generated/compile.h
and figured if include/config is found we are probably safe.

I will fix that.

> 
>      grep: ../include/generated/compile.h: No such file or directory
>      ***
>      *** The source tree is not clean, please run 'make ARCH= mrproper'
>      ...
> 

thanks,
-- Shuah
