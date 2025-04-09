Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C452278148
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224260; cv=none; b=bf2lQBakp3kfqiF9zJVYL7+2BITvns9+CvrWoQNXb+64d+XLR16YyM6H/7fzfSJSyZ7Q3O7UK9+BlrPoTrnUOuV9tf7FkT4FsEEj+PJwQENiKL19jPDcD1dtV8yHuJAELto9cnl1YBh7IOx3YpNP42+vc2BYmlh2seenRa/U4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224260; c=relaxed/simple;
	bh=cLRXd2ba2CeeSosufDG2CuR6OG3+lGXoinJjPTZG6jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8mpu0BrmxEefhyG5C4isAWJDxLmgeSMuyOcLuleapooHlZV2XiVWsFbfH9fEG1NLgoOZSxLD9lvMEt11wwdODRCj6cjGLnrvsgND63EhItJ4JiRQ/m+gZRk7nQE/R1jkYhzHOtjSQoUzUm4ViCjn+hH2S/2KW8jqoHdSAsT5X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S9s1jBhP; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S9s1jBhP"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e15dc801aso3104439f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224256; x=1744829056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXLBtWFo1iG4jl/4yzD55CgxaVLgw5GIoTATgzYBQvE=;
        b=S9s1jBhPM9x0rJXYsw7ombzjkm8hWpkxtvse9piBqmAZu/yotvxo0uvAibPCvtC8sH
         1brKzqcYaoDlcfAfqIp8CTfWeHVzhC2unkRNgevpLCnf5AHlrz2CPJ34lCfioTijnAIz
         Aj6s5bVqyqq78W66E+1IaPr9ANToFLL/jKPiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224256; x=1744829056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXLBtWFo1iG4jl/4yzD55CgxaVLgw5GIoTATgzYBQvE=;
        b=eOwlEYacCy+Q/u8JHBXb+/fR8qREra0A5uORanL2bgo/KkUL+Y9emvsqH9KrK+18vr
         Sca5uXFuGZ9cdY0HTQ7oQb5GXCjNaxP8y5GlynJ1/lnQ7z085kY7cClbIYbVuQawnDyu
         FjQdxzDw1nx74pj+ICw2s+zKPDcxN25ompMcyk4Rfb5p4xwoONArXUwXtx/rZS0ctO9K
         IvJvUWej2jcBsBQyA/a1e/Ema3GaHVTw/uri3J2qPRZU5IdTt8NPXvr4QByd5OsxHAo4
         I91CAdVfpquvXW/HDN/cxBYBeklUBX2tFgymis2E2bHUfohfR4hdxm1j89awIgAKcKmh
         S3Og==
X-Forwarded-Encrypted: i=1; AJvYcCUFdMdSuMsUfzrzwC1wJjBaNfkLRmwsIm4AjfD+sOTaB5pP2oUbsGWGbpOM71oFQ3bM2ZM6hN8vZt5fYbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuF1udxllfyhPY+OQcSlERGrvZyaP6V6JwKwNTYzg5+/HYrxkE
	Yi3ahXp0unVIqUOoD+l8JN/acP6EvgEtfrFg4SzUOu3FFoNPUEQO1z0j9wcdJLw=
X-Gm-Gg: ASbGncvOXQNv32AO8biJxBKmpUZS3Ja0InZAGa5hDPoSX1KXFQXkY2aLuW1jUJ2HJ5W
	szD6SrLyYrems/zx0T+USGLYgNJ2+y/hL6LPlZ7gTYwNq11qXaFRG00+Kboa2syG6gMtyMn+Vxg
	ZpTpTT6koh23e4ah5nF3tGQShfLX+4MzxMpHWhFt7JPfXlNdqJDFoZS9tJGSi8WewrUDBGHBHSS
	Swu62u9KgdCZ9VmAxCVNnKPLsMTg4/ZEfbynk186SAcW6sr29TJbYVgClrinnUX8RaZgDEBVsc5
	8pl3JayDfv8TeOW9Dx+WJkgoU8OXBwy6MiZhzktfgi65RhqVHNef3KM7rkq8OQ==
X-Google-Smtp-Source: AGHT+IGO28kEay463v+HtpsW5QZR5xULtav+EFlWbau8kOYwbqxV37888Qg1KR8L2HGq5JcQPyhIkQ==
X-Received: by 2002:a05:6602:394a:b0:85e:17c5:bb94 with SMTP id ca18e2360f4ac-86161188b7bmr497863839f.1.1744224256359;
        Wed, 09 Apr 2025 11:44:16 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861656c8808sm28468639f.37.2025.04.09.11.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:44:15 -0700 (PDT)
Message-ID: <4f0ac0d1-9c75-4be7-ba3c-3daec2fdc91a@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:44:13 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/726] 6.14.2-rc4 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250409115934.968141886@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250409115934.968141886@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 06:03, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.2 release.
> There are 726 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Apr 2025 11:58:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.2-rc4.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
