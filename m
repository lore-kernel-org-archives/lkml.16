Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C12066DE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224439; cv=none; b=NTBxv+r5mfk8ECefgxZWAwyk22MpSPSr8tJ+BdOUNKA5AS4agTpQ+1iyeNGj9Zt8EopPrVNhzbtvEGy9C5uUQdetL6UMosm1K377tNMxOa+FkPU1ap1+xm0x9PLnJskrDvFq/uT0uZxYHNURFTUVemdzyW7kdyb2+6v8QtHow7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224439; c=relaxed/simple;
	bh=9uGR+HlNTOhrXA095hQNTm97hB/TKjBwj210dxqNyc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msCNj+cBxdaVJxSo5QjOInM9fkERA5kOvaPimH5r0FcdPfgnihsBCAKoFQHVK/xbjKPsnDhJVieVy5TzWeqn8rCQSldHxWkxkA4dT9TknJrBmXRfoN8AadwqNpxqrYLpbp36OHadlSz9FXz0p7Aj5Tnm7OGQyU6XSVhVvFHv8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y7yGeB3Q; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y7yGeB3Q"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d46fddf357so183775ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224435; x=1744829235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a31MfxrWak0Tuq7rl1lgBguffZPL2d36CVBR6DtahIk=;
        b=Y7yGeB3QK1itttb1RNQt+PAe9oH/2mNoTh3QKaHrCZY4/6KUUwIAGkfMn7EsNvWKk9
         3lb6Qf1oRiFgdJxnJyNZjXQhWCr6rsPT2PPE8DtKSR6dDSrd54ATvFnRcT6XXsuVOkIQ
         JYyrrciOtJI9mlyXUarGfJepz44fV+U/XIm6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224435; x=1744829235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a31MfxrWak0Tuq7rl1lgBguffZPL2d36CVBR6DtahIk=;
        b=nw8L40sd3ldP3DVOlaOo9bOGygdFoMdCKvq+dGtlbDOQndiSxRXUPmub26RxuMaxTZ
         6GfJaDmgW5w0HrwBpzQ3grUrk1fA4M+03nH2M7pHEjnRBFDacvOJhUU2JOxRFZl/CPCc
         oqxbGuArL8LzNX1qHrqjNp7aoWCAV7sojBFB5yIrmWCFdONeftEeIEL/f2Swqybf0jFD
         V4XRdeMSqu2jv3sm1XPKXFPRdbRD5ED5iygQPDygZOMdMGhLO8Y6laOQyog4UFgNCK4f
         3bjHxF8gHOLWQqzr6TMn0SBeXuSbFtOuh/nMq0V4bWX2AYTGXdKsuequbHUstM/9J/DE
         SpXA==
X-Forwarded-Encrypted: i=1; AJvYcCWWQSQSq+KzeXquzy+sGx1i2McKvK7FGycBrwTUAr8Qfmj/0JWUJc6VX36YlAy/6WDBtarOGzxIYWp6E4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2hHULXSOJ41XRX4ipfhg6bdFOz3aS92FkzULGSVbCAkEs+yZ
	ESEoW9+OMvLKjC8Es4ruSzwh5jbwRrW1kbr5T2LyOYakp/74xAKuuR5l1Sa+Dcg=
X-Gm-Gg: ASbGnctqxB1s6+4ZqQH6sUPGT6UlzrljQRJz65ttY/SAq/lidbpu7kRt93oTzmX7rmG
	yfSiz9en7HZUEW8HOUoDGfVZ7HSwFjXsr8+kzGA5CKbJG1vNyCiuPLPaT2hEPFlbrnCD5jXwCay
	ebFMjDOtdIh0k5vK0meqTZEhD+/f6Qf4re/n/kdrrvY8wtmtOyY9rJAUxFNFqqgnF8MQepQ6Ga0
	j9ucLEtXdocDYDjrV+abVhoSqYha00bCYcXi/UcnWOVqjvKY71g/Hz147gCOhoxEiY8x0cGwGmS
	k+/iilVI7pll00x0MSmPpED+QK99t4fT9jk1TloUb8xfuPWsjSc=
X-Google-Smtp-Source: AGHT+IE1GYrAa2BVgNVP9u5xF/JM4y9iYhKK1RMzet910nVc/m6SR/0Qfa9Lmpa3lh20JCyNmvbQxA==
X-Received: by 2002:a05:6e02:2281:b0:3d3:dece:3dab with SMTP id e9e14a558f8ab-3d7e46e42d0mr2327065ab.1.1744224435402;
        Wed, 09 Apr 2025 11:47:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc5828cesm3913995ab.47.2025.04.09.11.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:47:15 -0700 (PDT)
Message-ID: <2dee54f1-e333-4466-beff-c4b202c9644d@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:47:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/423] 6.12.23-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250408154121.378213016@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250408154121.378213016@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 09:53, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.23 release.
> There are 423 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 10 Apr 2025 15:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.23-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
