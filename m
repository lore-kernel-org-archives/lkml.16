Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36466347C7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028739; cv=none; b=lLB8vy+2oTTogGRuf+NFyaETj4NwpMY7ZaabkR8TkckK4Haa8HyPCLbBcgRTAzWN1VjJCoXtSf0Fy1uDx1+F9wEAnBkKmcw5SOlxb7Rxv417RJqazuR1WQZy26/BrldpPLnyx4VVCsoLovp3b8+hOVb8R5t5uRwnzkId+n2OO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028739; c=relaxed/simple;
	bh=vsv5PKy7raDqzHvOX0Ep59/qaAv2tKKgt5lzO89vjIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwVPQbynNQWyyh69s9mzPs/Q81pNf/mHdzQpORXIPSpHu8mgL1WnwYqNIgheShqDPGp49LBz/7yHUp7MkJYUxYipGs964lo80AvLOz5XdAAQ2qpAovE8GM64JQTzlk7OXwJjt6M9hFU1fXnTlP/YwJ1pzo8wTSlDZCFaTzUEGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Drj/PTs3; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Drj/PTs3"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so24492005ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746028735; x=1746633535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oxFBEyqGTgNk/NkYnmbUallUIhueyR2i9uRq7jDxM8=;
        b=Drj/PTs3+l7WMoyxtnfngC+WE1VG9Xis2WeYNrEA2XLyTn7CeSUVU3FhOSR0J8uxNQ
         7A2x3ZbGPFPkh7zKkKGoITlWjKlSh4F3XAGhiUFwrIoUijHTq1fZh/djGAwBBJgh/ZPA
         EOhAoRr7lBCdrSU/V+Oc7q62e15JnN88PHho8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028735; x=1746633535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oxFBEyqGTgNk/NkYnmbUallUIhueyR2i9uRq7jDxM8=;
        b=wYPdpD9N6AbhxWCcvMudBEKwGC2btOaJzI3NvyWQgQ4qd6H0rpljGvw2UnLBNzIQob
         Pph2P226dbIbkrU2hxHiMyRhft/S6/aoT1xLHPKbiWJ6OIBNQVgTs1SKrx4e8+hluDZ1
         fp9l+cB83I91CX6WjU0cudIRobhQZUPQlFKbUcTF2h36yREox70pyI5wvaHIjSi0JEhW
         +tQxcmwt1z07l6sfyfuwCyuT+Yno2CaLv4peQHnNivnIPZEuuljVAII1YRGFWOD02zTC
         Zpuvvgd0ax/15Pqy//E6f3K62YSOI30IeW3peeoO2X8bMLOjLJq4yKv8MZzpKFiarVy1
         0N+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5eRiadEhQbFHiyr2POPrfNZDJZhRbws19eFl/q3qFEqD8XG16Kq9p4cJPxVYhI9X2XqzlsKSE07xH6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXPxskYJNvYeqY26rTd+/ga6vfbOu2kOaPomxd99O8i/wJ1ta
	5fMMhEWHYWwObrk9gOpo8aGD6mvKfu/2SZqNz165xy4PbvrCQtvz/eJrqcagd74=
X-Gm-Gg: ASbGncuXrJRvf53JauckFAch2BWq2gEQOIWUTIoo87sRIUA2j/9vIEY0uZNMD88iy9B
	/N7E0mmbXzCIRA9AzqFZXQkl3qY+B88ywOTrHeijtqHrBLfBzxYvNIabYOWxhrElftbu5FDhfPV
	kMoyFOd2KG5eZAEGSBxYeruVdJrbjh9zKBBvqsrKGLBOSr42RBKfYXwEIvGQIv3u1aRXE/2b3+3
	tQ4X8s1LnpjruClAeQNAPy0fZpxzipkYIQJV3dNUOot5F9keNN6H2e1LzjX2w3hbq4tUGTj2Ywu
	BOn+ifGJ6SJjnEtdAG3CUQ/hopnzRNx4L4cC7AM4lyEAuSgmY4Y=
X-Google-Smtp-Source: AGHT+IG6FTX2nEYxeimfrY7yoxrShI0y64r96IWSWY/xeIKXCYHxTWjWbue3hjv6fR8whb0OHlHN+Q==
X-Received: by 2002:a05:6e02:270a:b0:3d8:20fb:f060 with SMTP id e9e14a558f8ab-3d967fa3a4dmr31584155ab.4.1746028735325;
        Wed, 30 Apr 2025 08:58:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f2a2d32sm8991965ab.1.2025.04.30.08.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:58:54 -0700 (PDT)
Message-ID: <c97a7512-a350-4b13-92b4-52a03e2c0992@linuxfoundation.org>
Date: Wed, 30 Apr 2025 09:58:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/204] 6.6.89-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429161059.396852607@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429161059.396852607@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 10:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.89 release.
> There are 204 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.89-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
