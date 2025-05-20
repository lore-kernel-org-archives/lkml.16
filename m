Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683EB253B40
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775986; cv=none; b=DSKvKm7J+gsj1xof6lARcXs7g7t2gjxyYRrr7O4H8wlaTp7NhmfVmxHpvbBZ9A+y6QGEpvaMfn/DzcV0mAGK4INYSVqKP7BySD94fglGYVYD4ZpLfINvwpGm50Yys+1qqme7TPX6c+Ix+AH29NrYqkWcZKbvruaS5tRkPAAbSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775986; c=relaxed/simple;
	bh=eSdCjtp/1fPo3n/voZuF4t/69QdVtMMYeXdvN1m3saQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBGrBCrho3UM19d5Bj28NG6OOZv74iTPL5kk76Ji55pxowv0kpNhv7gyOYX8KOISdU4l2Qjwn2J56IfGpdJ1PV9b05f4uXtp/spXmscylkp22/+YVP8mytm/a2X45KW1P7CFFjP8o53OPIrK1VpSyBErNCmGPmVwuvlMYWobjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bilz7y8F; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bilz7y8F"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8647e143f28so457235339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747775983; x=1748380783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YCTd9DwztrmkYxeGkW5TVua7369Pn3fqP+RCzxS4Co=;
        b=bilz7y8FcMa0/I06KAdpC3hETZnKmT2ppzWQYYv0oOlbE5ACC2ta9mJ+yEqVwXNF+B
         4gXaSSxRg1ocSxmjgdyiO/jRRvorn5A6NBRB85BMWaXKRW8/Lf/Qso7MMuAu1XNIDEK0
         prWjVtKFl91XY/0d0qlZssdTmmYm+aLOxtrlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775983; x=1748380783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YCTd9DwztrmkYxeGkW5TVua7369Pn3fqP+RCzxS4Co=;
        b=RysbJL0gFsHNA87fXcPNWdFE2unj5zDiEZGLIIq2Y6zLM4eYIXGML47Dz3WCIRtmSw
         SR4VBYeA4ABkQTFIrJqXzhO+JedYYB9BqytYTEFcm4rZi8ozkderc240wK1AgBJBfs/I
         7VRtzgjG54+VWmF84hBes8o99eHl0xOGgyA1fYRDRKeknCpC8jg1W/TtNPlF9GAWQG/n
         dEaawb+9GJ788lb9nnKNPUrqZqjK5CCqZZO6T87IYX+GCdFBRUHIj7AL317wVL07uhaU
         fAVTpe+Yg6ffYKYhJh7fRTVlEp5pABSaOLwJbPqrPFtay7OFBbV++BAtkFohq7AGh8+s
         yq3w==
X-Forwarded-Encrypted: i=1; AJvYcCVgOskSN40n8Au3/ZEPDPz1tWYnS+c8jn9DO3xfgyJM75aHAhmtsXyf/V+Ye6gYf8dmrPTGFPAg6HHA3l0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRjkbHp8oFWVjnLGYyTKZ0MQZTV37BZgjXrUmTDwn7bf76wuR
	i101Jy7+J07/xtBZbVYVs479+nRsXJNEgByVQU56qgPRcn+YmGPPTwl2OwtD7U5OZW8=
X-Gm-Gg: ASbGncsA4OTNR0wWjK7B3vaOlgFbqOu6aXcsIxiGGWzzmdIhhVsAIUjLni1URGVmISq
	fwt47vLw1ZuenegHFMHJF5wdppuwLE7LYW3EDEnJ0n7mHsItDOWyojRqc89Tqi2i37TDKiO1e2O
	E9cVRgoqmu0qMCicmhWBIzksudwkpTJJLGr6Q4saIswzV+ApxJPGr3XykWXKWYXarO0mG951LXq
	AtxYhhVMa9JLifSHwFOy1uOfE5KodcVo70jNbQ15queCgdkxUEl0T1R3sKBjUVK0dFH4Hl6zfww
	STVtDen5322i6i0VQ+l97vKRCp6wGv/Zgvmm42d0LlA0K1CbcClarlkSXm+K55F8I6v1v3nA
X-Google-Smtp-Source: AGHT+IGHZLwTf8LjSiEncxDrt7PbnARYCjK2hr9FZIftt2iQNbyIYNrlmrCAsmfEOVXuFPxxdltMeQ==
X-Received: by 2002:a05:6e02:2592:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3db843313f3mr233401395ab.18.1747775983457;
        Tue, 20 May 2025 14:19:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ddea4sm2410313173.69.2025.05.20.14.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 14:19:43 -0700 (PDT)
Message-ID: <eba8ae12-eb72-4913-9983-c9d600ba41d7@linuxfoundation.org>
Date: Tue, 20 May 2025 15:19:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/97] 6.1.140-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520125800.653047540@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520125800.653047540@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 07:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.140 release.
> There are 97 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.140-rc1.gz
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
