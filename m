Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26E2609D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028763; cv=none; b=l4d9DMFFfbMhT+sdlkmBJBzw2/KgxPkP7LOQHT88cHObbOh1w8c6fwo19S3dESJLJJJyegs6DOCCGVvd/8WPp33HHHq9PZg+ns5G7/1QG5y9uJ2+lBEQwppzmKQeay+jtsqeQhSFzjH5yhGwTmqIkiNSvULobZNuNyGuF9jwOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028763; c=relaxed/simple;
	bh=T+jWp7m5MmJAhHAncr831UxJIfIxqvS8QZ0MeuyejaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSjczTrEEKqcCkhVuqAlaJOQDA1l8G7Dkqn7kBsgSTEPoOfbR0P/2mhXgGzrw0YVllN/TwzgPBVy7Q5uIECWIJ0yfQwyjVjw4Yl+Fg437i9gEgppl9Lwg2MqY7ZuMBb1WP3u/AMZu3o1IfCJEBrNk1U6NVrHBFmtVdetrfY16tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CRYBIXXK; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CRYBIXXK"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86135ae2a29so646626439f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746028760; x=1746633560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHfH8/RuvOHiVMcKgXPSO7Ua/1QwmE/VSmmffsLEhDI=;
        b=CRYBIXXKfp4ppam+UqM+P81a6KfT+OlVZkWSP2pn0PYmB3X0/ucoulpbd2POlsgh7i
         DK4ChL9KmfgQwXcZXsjILw6lkrX3uS0RoRH1cmwG7HKDafNrEW+UqSE76mFZHsgAqbfV
         iZuD7+/t5+nhjXZYQY1tLHQJSXbCgFvzrYBMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028760; x=1746633560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHfH8/RuvOHiVMcKgXPSO7Ua/1QwmE/VSmmffsLEhDI=;
        b=DyVEEuLMy9yFfDm/Ym9BnmqUH/iNc9boWRLOxYKaPgzU8D0Al2aszcSdS+e5za9amY
         R4fg4C5GdF3QafAm1Etfe+k3db16Ceja36cHp6MmLrgr9TmiMcITq2PEDDeQ5eZWcnFf
         x7rigdgdwh2y+EhASz+z34MUkwN7YurYfAwPfx9HeoeG4eFyvb+GEpH7JRbI8JC/U9vB
         EkbbKPJN6zjF8CI8jy1DjrX1mY5lc3lJvPWxEkwQPOtELrLCzvJvrXScJ9XzX4ggf/YW
         u/iHkDpDo2a9bUxai1XVjWIF/NEhdNcIsR0Clo/7CaNOHhCiQu/T4W+VS4qiFfgT2bKJ
         Jnfg==
X-Forwarded-Encrypted: i=1; AJvYcCVFwJGo/cUt/mVcos+3Gx0bcq8iKP02gi0Ne3mmIwEXsLQTpfGOJHC9qM8u1A07avH03ATOS+RLN93bM58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBNz0Pv0ANmLmoNLjHWPQ4bxb91lbzbrN8AjpjiMEjlnYw/RSS
	NKW75r1zGSfrpdL8yCNZ/WSKhdQzt7joURsoHjN0nUlOz4ml4mzGDNnHwZMzbEY=
X-Gm-Gg: ASbGnct74+Q4Mpeu9WMnHWoDNMrubPyMCTZzv0H7+JVa3dtne3Tflrx7DsNi52dMefh
	JZHItoqNEti+4DO3f41hCXf6aBZW++NMtUmTcycP/oDucqedIyVR5ZR3LFz5VI1YVHp6R72bnLu
	FPX+jL0wb9dyoj202zsVkaIdnhV2IEZo3OkS+qo7JdrONbjHBqv7fa82nebKCNp6HML3vw/9MO8
	agUjB9jp8KzUox4dLFMfZLuMIxy8lQKjp5bp+PifmQpuYBRV009br4P+714PNyvFUCTsA9uWnG1
	+BJ8DIGXtr/rx7XCt3Qn7ATMIpFy966nM8SswlChWQVZW6IXjGo=
X-Google-Smtp-Source: AGHT+IEiAIs8OYji6l+Z+0g6CqLLwH1qcgR8c8xPWDGgB+PEAq1VbP+QvofEs/k8l//Tlnpao+jlRQ==
X-Received: by 2002:a05:6602:4749:b0:861:c4cf:cae8 with SMTP id ca18e2360f4ac-86497f4455emr318828139f.2.1746028760602;
        Wed, 30 Apr 2025 08:59:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862b5d6d7sm864389173.0.2025.04.30.08.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:59:19 -0700 (PDT)
Message-ID: <4d1ff5ab-23b1-410e-850a-b0e38d7b743b@linuxfoundation.org>
Date: Wed, 30 Apr 2025 09:59:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/167] 6.1.136-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429161051.743239894@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429161051.743239894@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 10:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.136 release.
> There are 167 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.136-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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
