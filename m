Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ACF29DB91
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918508; cv=none; b=skNqUJLyT8uR9a3rsqVxcoTO5OZRRbbT1ZN168aXXhFM0r1/mLsYN/YgZ7ClGq90K4B6hqa6fEnoFFiTs+uyPCE6AKJuouQx+RnFio8DbQS2L80WqNm9YFkE3u9mjx6+LjPZ4OciheDoQGSq0FxpV8+Brw0mCB5jNoOKAUZAu8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918508; c=relaxed/simple;
	bh=yylSKJDv8HkOf0iH+SYlqcQffyWxREZ928vnNlKrMhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsCYu3jBLluEYlxkyRee8HfzYEW6ZHDZuhTMrpR8vl9Uml6ltaJFCpOVRtm3IXMQrd5DVXDE20F3ZpapXYladAo1bH2qiq9R2Wy45qp9/r7IwglgolDhME/DhZgr4i+hZtrk3x611i3e9iQaGhQ7YsxkNbdbWfMOAuRWgvRnqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z90x38ny; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z90x38ny"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c30d9085aso4207212f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918503; x=1746523303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TI3jdvpeyG/XLxQ3dsLKaff+2PtCT4KthrhFkzjVZAM=;
        b=Z90x38nygZHLQlMLbTcx4J7BKNQ3skhVLdP8aZYZ5rH/RdqkSCQ/IiMYkhxdfm0o+w
         fPM4KpFd0+8rLvVmXtgbXHIzyTIgiHj3Q0shjAf/CZN9cRhdCoiZEjvNyM6R32fvJveb
         ul9ZfypIvW6qqZ2JPdJLXKe91fQZTQRK6c+EYOg1BeOE333s6mtYxEhjN0nNjzrEEsM7
         zr8XMkwzkdc25MXIECUAKkLF/lt0caGQDQIgQ3M0wwIxfwlUMlU5+592pi5mTN38SuT3
         U93Eo7qqPqRCeRPdRPhahpRgAqCVwGT5fLO552j2B6I9sV1r+C30cp0X9c3fHe8XnPL7
         LSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918503; x=1746523303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI3jdvpeyG/XLxQ3dsLKaff+2PtCT4KthrhFkzjVZAM=;
        b=T3BiKzsSXXFfh+14MxslM1NJ0Xtuj3VC5C0ae7eHf/lOnh4jOmEekfjFgHaHRdSgRr
         RXpcnah7Fl+Q3tRc5IAmmv7prIV082pfzoR9fayqqoRw0PIl/CJ1nDgp2+HJqe7ogj3A
         3WyF2NtNHMXhi4BUICBygU89pC0l6Aqh3GGfiDYoGZt4X4nNMTfqRXQMfm+fK9jzGJ+a
         /h4ul4N4gXd6jG4q/p9qvfEwgJXot0Hm0ErXveIINkLlgurqf7Qy2e6mBHldSXoH7FF5
         D7nubXvjPu+dw9q3udCV7SaxznyP0TsA955fibUED+3zFT5xBXVrTPxGIsftUhlENi4V
         i/0g==
X-Forwarded-Encrypted: i=1; AJvYcCXs32xLuFiu9NWuDCjoDCaO/nomSr+32Bt3oC1zvbcPHokys2iA/4iZetsPIbzMLSTLfhfyB73KuVJ3q3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRWPZkOgq0hlp4HcfDbCflGFOCrkjR6Pl/PJTf9Ac8IeIDtKL
	lHS8NOBewc+DvH/KqzuoWHXWRNPAz+y+u/+Tb5zBhaa07Hz5VbSKZ4MGmI8LdKo=
X-Gm-Gg: ASbGncv8eKjO3vloDbm0sliBakIoA3XVL9Ii0Fcbfa3hjjzw4NE8xwANFjrr74Gk8b2
	xTpXIJv4G8yqeWCRw0LPdvrkh02EVabPhJZUSpKiHbwLmxWSyPLXoAFhHqoKILkpbdzmjIZGoIS
	wpR5XRUdW73LP9c4Mjqsqiw7QbbSHhLqr6NzFwKm2sDH2PVipQRP91ynKOvqsaSqOqbMHBXnaFZ
	iQ9Fm8mGaEZhc1aQSuxqNuKmkaJXwzRF3AlL7XdzaTlWoAGoV8etlA7ETsyykRi6fftYpTnBom0
	dIQanHGXZNEWO6RWTcN7jKlwCbE7QmBddsuvZ21xBz5fuV8sU5DATg==
X-Google-Smtp-Source: AGHT+IEUGW55N4u/mThqrlEDhA9YSxZ89qDIJshXeMtSzbHkz+MFGGxdrPryOqnbUPm5rxvbTdTFqA==
X-Received: by 2002:a05:6000:18ac:b0:39e:f89b:85dc with SMTP id ffacd0b85a97d-3a07aa65134mr7471133f8f.17.1745918502621;
        Tue, 29 Apr 2025 02:21:42 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c6a0sm13337100f8f.86.2025.04.29.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:21:42 -0700 (PDT)
Message-ID: <b2f05ef5-4ba7-4041-8d11-021aa2c3f6e3@linaro.org>
Date: Tue, 29 Apr 2025 10:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf tools: Fix arm64 build by generating unistd_64.h
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, arnd@linaro.org
References: <20250417-james-perf-fix-gen-syscall-v1-1-1d268c923901@linaro.org>
 <7703f88e-ccb7-4c98-9da4-8aad224e780f@leemhuis.info>
 <4c92fd9c-e545-47f9-bc67-0dfff962f506@linaro.org>
 <4c5eb1e1-f8ef-46a5-92da-50d77aba1405@linaro.org>
 <f0bab5f8-ff61-4eee-a736-8c2dbd33bc72@leemhuis.info>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <f0bab5f8-ff61-4eee-a736-8c2dbd33bc72@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/04/2025 9:02 am, Thorsten Leemhuis wrote:
> On 29.04.25 09:52, James Clark wrote:
>> On 29/04/2025 8:42 am, James Clark wrote:
>>> On 28/04/2025 2:23 pm, Thorsten Leemhuis wrote:
>>>> On 17.04.25 15:55, James Clark wrote:
>>>>> Since pulling in the kernel changes in commit 22f72088ffe6 ("tools
>>>>> headers: Update the syscall table with the kernel sources"), arm64 is
>>>>> no longer using a generic syscall header and generates one from the
>>>>> syscall table. Therefore we must also generate the syscall header for
>>>>> arm64 before building Perf.
>>>>>
>>>>> Add it as a dependency to libperf which uses one syscall number. Perf
>>>>> uses more, but as libperf is a dependency of Perf it will be generated
>>>>> for both.
>>>>>
>>>>> Future platforms that need this will have to add their own syscall-y
>>>>> targets in libperf manually. Unfortunately the arch specific files that
>>>>> do this (e.g. arch/arm64/include/asm/Kbuild) can't easily be imported
>>>>> into the Perf build. But Perf only needs a subset of the generated
>>>>> files
>>>>> anyway, so redefining them is probably the correct thing to do.
>>>>
>>>> FYI, my daily -next build for Fedora based on its RPM spec file broke
>>>> on arm64 (x86_64 worked fine) while building libperf. I haven't checked
>>>> yet, but due to the error messages and a quick look in the history I
>>>> wonder if this is due to the quoted change, which showed up in -next
>>>> today:
>>>>
>>>> """
>>>> kernel.spec:3115: build libperf
>>>> + /usr/bin/make -s 'EXTRA_CFLAGS=-O2  -fexceptions -g -grecord-gcc-
>>>> switches -pipe -Wall -Wno-complain-wrong-lang -Werror=format-security
>>>> -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -
>>>> specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-
>>>> strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -mbranch-
>>>> protection=standard -fasynchronous-unwind-tables -fstack-clash-
>>>> protection  ' 'LDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-
>>>> relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-
>>>> hardened- ld -specs=/usr/lib/rpm/redhat/redhat-hardened-ld-errors -
>>>> specs=/usr/ lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -
>>>> specs=/usr/ lib/rpm/redhat/redhat-package-notes ' -C tools/lib/perf
>>>> V=1 DESTDIR=/ builddir/build/BUILD/kernel-6.15.0-build/BUILDROOT
>>>> mkdir: cannot create directory â€˜/../archâ€™: Permission denied
>>>> /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250428/
>>>> linux-6.15.0-0.0.next.20250428.435.vanilla.fc43.aarch64/scripts/
>>>> syscallhdr.sh: line 98: /../arch/arm64/include/generated/uapi/asm/
>>>> unistd_64.h: No such file or directory
>>>> make[2]: *** [/builddir/build/BUILD/kernel-6.15.0-build/kernel-
>>>> next-20250428/
>>>> linux-6.15.0-0.0.next.20250428.435.vanilla.fc43.aarch64/ scripts/
>>>> Makefile.asm-headers:81: /../arch/arm64/include/generated/ uapi/asm/
>>>> unistd_64.h] Error 1
>>>> make[1]: *** [Makefile:108: uapi-asm-generic] Error 2
>>>> make: *** [Makefile:128: all] Error 2
>>>> error: Bad exit status from /var/tmp/rpm-tmp.vAfil2 (%build)
>>>> """
>>>>
>>>> Full log: https://download.copr.fedorainfracloud.org/results/@kernel-
>>>> vanilla/next/fedora-rawhide-aarch64/08975350-next-next-all/builder-
>>>> live.log.gz
>>>
>>> Yes, this is the error that the fix is for.
>>
>> Sorry I had it the wrong way around,
> 
> Okay, for a moment I was confused and wondered if I was holding things
> wrong. :-D
> 
>> I see you were asking about a new
>> build failure caused by the fix. Looking into it now.
> 
> Many thx!
> 
>> I noticed some strange characters in here
> 
> Sorry, that was my (or my browsers) fault (some encoding mixup somewhere
> I've seen earlier) and highly unlikely to be related.
> 

Yep, not related it's just the quotes around the error printout. I just 
need to use $(OUTPUT) properly without the "/../" on the end of it. If 
OUTPUT isn't set it tries to go up one from root rather than being 
relative to cwd.

I'll send a patch.

>>    mkdir: cannot create directory â€˜/../archâ€™: Permission denied
> 
> Ciao, Thorsten

