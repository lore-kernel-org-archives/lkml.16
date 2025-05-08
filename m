Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F4E223DE4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742486; cv=none; b=DzaPps03w67Md85x7V1AxC74h1//t9GSNrab1n0Iruv4Pa/6cZobWMh482Lwqcv7mo5YoiqJJ6ZRlnwHLmpUwag9OB/td0ehD0kqHwZCQg5KMPcWTa154ndnI7M2uDquSQX8F6DB/ayM07HfqBsXuhajmV8rh96ASh4dQ7KjPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742486; c=relaxed/simple;
	bh=oQhDfKn0pMpd3jEaJ5ukmAhurZ7x+QJ/lmdMNdMwE2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIw26S448Ie57C0YqqVVODPBQOVaFoa3A7PfYIav3HeJv/K7i9snh28y7205ixa9Pr7YymWdAeWJRa7MXrxIt/mLQ3PeKGCaMGoeJUIF0Cv8bkJC25uxUVB4i4AngCF9mubuCmkgbmAbPA/zE9gcQuuBATxHSly1MmnmL4A9YYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J1ymQxiY; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J1ymQxiY"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-867347b8de9so95148339f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746742483; x=1747347283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CK1elPKWXClSLPdRPqW5P03MZNYsbIZRsBDl9jKU4I=;
        b=J1ymQxiY/w1ewYwN/07QPFeUtNMbMZfNC1cym//JUkwdy774nrgj5V7IvLoj6MKgvR
         iTDaBoDAF1PO8M2qXz0nHUAhzf5jfG0VXShJMVwxhJGnFVv5fDji+kA1KUIqXNSPy9Zx
         vw+ZGwdvOpNk2+4uHsTKLMdU0mmQ0UEzVX0vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746742483; x=1747347283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CK1elPKWXClSLPdRPqW5P03MZNYsbIZRsBDl9jKU4I=;
        b=CtrtiI9yZuvPoXUyHUlw3r81J8eJrdd9gnxeZRyfTUKTyjRWqpYWYzr5CYd1xGhN6x
         BJah/pa9TfmthQCqKIAtdei98nlOaKHAey78JLuRR+ZfVE8dgsHsfRPMGBBEVb+bGW9o
         LWriRvfwXyZYTYnTaSLd40vf3BT2Qr5dfRpSYYxud4LX+RAfOoK0Q8vtdjmp6eblbX5t
         k4rbKIP0JCMerL83XzGcw2WESJx076ebNpgfT+34Wq2+5Nrs6mz4eSwSoeWkT1jsyxHV
         IJTmEAsSBemPfpCbfKRem054KKyasj/OLolc6rVehYunFniAm0+0aVUgG9jYPgAdfNd0
         LIuw==
X-Forwarded-Encrypted: i=1; AJvYcCUibJ1Vx2NeIwQclSuFU+u03rnwoq1DsK3PEen+4Bs5a8V4Bd0kBahI0ct9KlBbigUQmygebyNDQq7cfQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSQXBoqbixohS9+6FhseaHYXLAmVdyPC0CH9WX0dt+GtXVa3U
	sL7aqDFep4Kq7W1xUPKJppIGrRzslD9NWIB9NM/gTMmGWFz8S4W73vbrY9mHKK0=
X-Gm-Gg: ASbGncvENZ4SbV4Um4o1Z7qy70X/y4SdGgPjdni8EZ1J/NqCGIK9E/wlSjuazXYNz5w
	1V1CTmAMJoNy3lXqIHajSXCwGyHcFMe0PxVPpfa7qo/rnmG+l1dYtymyiMCw8vFwC/KGF8UrNay
	zeUAxhvWYB0TjFjBUkuSxDPF9/aYn7SBg7AHLjdpop8UiirSWB4t+RWxD+RIQWm3z393syIqp2y
	ciAtu9tBqzxk+0koGWw72Ss8EChTShs9ELBv2JDLw93cD4tt71R5pnD8UwN3XMgbv0Ii3lFjAhm
	mFScGVAifmBWRvViS/dGFbNs7Tnu4xakea8CVblmwYuh8/BnO/Q=
X-Google-Smtp-Source: AGHT+IH5MQwed+065d9LOVuxEKO6ubkA9Ob6pEePe9HD+g9AN4JF3g2On82Lij+nTEGd4vyd0n7qaQ==
X-Received: by 2002:a05:6602:1401:b0:867:c17:a6ff with SMTP id ca18e2360f4ac-86764496f6fmr113977539f.8.1746742483142;
        Thu, 08 May 2025 15:14:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0efdsm15990639f.29.2025.05.08.15.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 15:14:42 -0700 (PDT)
Message-ID: <a4558815-f400-41c9-973d-90680ceb3ede@linuxfoundation.org>
Date: Thu, 8 May 2025 16:14:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as
 well
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250507074936.486648-1-masahiroy@kernel.org>
 <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/25 17:49, Masahiro Yamada wrote:
> On Thu, May 8, 2025 at 6:38 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/7/25 01:49, Masahiro Yamada wrote:
>>> Building the kernel with O= is affected by stale in-tree build artifacts.
>>>
>>> So, if the source tree is not clean, Kbuild displays the following:
>>>
>>>     $ make ARCH=um O=build defconfig
>>>     make[1]: Entering directory '/.../linux/build'
>>>     ***
>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>     *** in /.../linux
>>>     ***
>>>     make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
>>>     make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
>>>     make[1]: Leaving directory '/.../linux/build'
>>>     make: *** [Makefile:248: __sub-make] Error 2
>>>
>>> Usually, running 'make mrproper' is sufficient for cleaning the source
>>> tree for out-of-tree builds.
>>>
>>> However, building UML generates build artifacts not only in arch/um/,
>>> but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
>>> files remain under arch/x86/, Kbuild will reuse them instead of creating
>>> new ones under the specified build directory.
>>>
>>> This commit makes 'make ARCH=um clean' recurse into the SUBARCH directory.
>>>
>>> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
>>> Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@linuxfoundation.org/
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>
>> It doesn't solve the problem. I still see arch/x86/realmode/rm/pasyms.h
>> after running make ARCH=um mrproper
> 
> 
> Why not?
> 
> This patch allows 'make ARCH=um mrproper'
> to clean up both arch/um and arch/x86/.
> 
> It is really simple to test the behavior.
> 
> 
> [Without this patch]
> 
> masahiro@zoe:~/workspace/linux-kbuild(master)$ touch
> arch/x86/realmode/rm/pasyms.h
> masahiro@zoe:~/workspace/linux-kbuild(master)$ make ARCH=um mrproper
> masahiro@zoe:~/workspace/linux-kbuild(master)$ ls arch/x86/realmode/rm/pasyms.h
> arch/x86/realmode/rm/pasyms.h
> 
> [With this patch]
> 
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ touch
> arch/x86/realmode/rm/pasyms.h
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make ARCH=um mrproper
>    CLEAN   arch/x86/realmode/rm
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ ls arch/x86/realmode/rm/pasyms.h
> ls: cannot access 'arch/x86/realmode/rm/pasyms.h': No such file or directory
> 

I ran another controlled test starting from a totally clean repo
and the building - looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

