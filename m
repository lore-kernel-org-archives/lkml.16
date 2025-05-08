Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9BF1C860C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716452; cv=none; b=YFrxXPF52ipWQ9TrNp5pErlVh0hx5xlonJnsLBjj+3By8YiKwBfzcYGr7Ev9CQ8PwyzywG/Vv81X3HtDLPsDOTMWIyn2FDZI+Wi1uYKEgeZUtfh7upgk4HCaYw5ZsxwLheIeElRiB4/Mp5zc0W9+uOThNI0G6TxSkQqcT6Hk4p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716452; c=relaxed/simple;
	bh=bE/GlSLGGPFXT36aFU4gchBsyjqq28AacvXawkAxJyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEZ2jyqgpCDZlDgAX69qAyONPLJtbunJE+cdtt1HhMDvEPnXJEzNCRG7DnPk4ZOlm3PgcnMsTUcUEvQL5tRrvNn7wH4YzzDlsF//DYyAPZqCsRovtBTHvduNHy+PpRiSDckT50Lo3h7NtfqUOrUHmFzkre5zzJM8yUCXWHsmUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XU7Akxis; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XU7Akxis"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso3802445ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746716448; x=1747321248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaDQuSmU6yJ5IUs4m+YlbKlu2TNPWtfrQAZlJGyILvk=;
        b=XU7AkxisVBjGZZho99hmhk3vt17JTGWS+zcqzyysYSZjHukpu+b3vNHlH8NQsBrLQ6
         sBezNvFuqq2vkZzhpsDrC7zlMzn5+9OWvKYQCjoY80iSmHgrA/RothEe3zbfkI41MUXb
         im5yUG+UpC5wxT0sw2yI3FRe71quTDIlFQpzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716448; x=1747321248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaDQuSmU6yJ5IUs4m+YlbKlu2TNPWtfrQAZlJGyILvk=;
        b=hhO/OBuBet4dkgx4WDWt+wK09IoYEgxPDTqj5o2bw6ziv+eLFwc86sfVu5L0jmzT8a
         2DQJD+DCkPdlF/1Z+ionaaciBIRxHyXQ+RBAaI8OeKz3V6JSuItrKoRrfWPeqbCw1Aff
         KNqDql7SiEkW+rr7fwRcgpIZAb9JuCh+OufRLfhLg9o7pTOPjUu+gozuatuijTnYg14O
         4Dx6AFWsH6JkgzbBrwvDqCkYjqvZVEnJi7h/Kv/EWJDHgdVD4PDOVBtiOFknULOcCL3M
         N5B6AInM9IHpvFhE1Env4Y7CtmcsQvKHyP8oEkBIT6GCC1zK65I5ZH7WaKEhVJu52oC8
         JnEw==
X-Forwarded-Encrypted: i=1; AJvYcCXwH+kRCtPctrcAnHzhViNCoWMq3IB1fnctYuzAq4lnElMfrIKNmPSRWu1BhS1e3mVqfQYr+qW9UmlwhrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzShqnTBH1d/4dcLVMbAVZfv83QUyhhkHD3z1UlpyqJqlaSbkl2
	m3bpZ8wVSY5Bcu6JRJ4iB/CTniPQxiNakMONnYBetXXZhO1fLT0S419tkzRbvq4=
X-Gm-Gg: ASbGncthUqK8mkuOfe3uzzpaHM2XVIpFc22UP4VgInXVbtl+HdLfGNIhq6a4GDRwmmO
	TI1CVHSu4lWlW1tncHIPBrqahpFO2YYbsoINYNPzgWTCmXPylu9HTCElDkd+XriCXKa0TXe4UVJ
	VanZpFw3uregECuadTDAQKCK/ixb5AcATIDhhV7Zamleh9PQ4xTriIUtJRglw77H9EPIfNjp4YO
	6acwiMmoxcGVZOmB/z45zb00a2xqtlUiePNmV3gmFafuoHKHHjrd6H5vHsAiPYi0yHpVepKbQ5I
	z6/BdOb0viqhTqfC+ytwzIY0roviOvk4+Jl5qLLa3zLwcFqyppA=
X-Google-Smtp-Source: AGHT+IE/XgtNYN0EtpMRL67XznMJq44ZZbXSNS4qg3wRIrU5gb+loCCKNTbLb3TOZ1VVWtQF37EIyg==
X-Received: by 2002:a05:6e02:3c87:b0:3d8:1a87:89ce with SMTP id e9e14a558f8ab-3da7854d5b7mr52089525ab.3.1746716444166;
        Thu, 08 May 2025 08:00:44 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da721e7e92sm11526345ab.60.2025.05.08.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:00:43 -0700 (PDT)
Message-ID: <2f15967d-0bc8-4f91-9924-6312caa63036@linuxfoundation.org>
Date: Thu, 8 May 2025 09:00:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/97] 6.1.138-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250507183806.987408728@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507183806.987408728@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 12:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.138 release.
> There are 97 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.138-rc1.gz
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
