Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305B224FD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384162; cv=none; b=F7Y3a/H8WM6aPbrda+6tpMgk4OBa6XZIUndnhSEiR9ecGiM7530/lR5/8TBXMvaIslXRe57eKmj3NWqHw4GlXWU2netBJfdCEBIFED4sFvwv9yKOtKkZbeSmdoC5JGocVoxKnM9lSybmdCQv02APniAlz+Y2IYTkKyY87vfYtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384162; c=relaxed/simple;
	bh=LwspOpz/q8M8FYndGmv1U/jrdz9q+/K4Pl8pt+T3NVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enkf4ww/o2xBoq7LHkNA8ljcrkcGneCaO4xGzTOc2s7v+ULKp0LbXZIVLZPap3zGdsNpJyOfO1C2iNMlFBXniYY+VXuDi3Qt3C4tI6JIfujnPLS2WlPHN8H5Ahm67R+sjYxVLJno+Fq/5jTXegZ+Df9RRZXMQyGYmaqSF3ZT9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D4Eg4CZP; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D4Eg4CZP"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85db3475637so10572539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748384159; x=1748988959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wuJpTcAx5O0GZhvVZEyTNMJ0cZvEH7zszqLSKSVXyo=;
        b=D4Eg4CZPKpl7HE4BvgxJxOv4v9/6tYTI21EdCnMVvDyCTC/ZuJwNlxzaIO1y2OSCFj
         vbYET5kn7MR4/W6GMLQQiFSKNiXtZ4u0m2Y5eNN4wiQA/oevsfq9Q3iTP9UK8mCOn+FT
         skGPV+LgYC9wuSgL7znYp1KHCcBIEDUn9sEgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384159; x=1748988959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wuJpTcAx5O0GZhvVZEyTNMJ0cZvEH7zszqLSKSVXyo=;
        b=Sx1tWDeYcvN/7seD6ShK/SP2M3lmnl6QIcVHXxoAbaOslLXBFZNDtkfehvp0sguUg6
         2tccNVk9YHdy8XHRP9PK/PohZ+cUkTEKPMfeUiu+2Bx7aMsoetFIv0Fjrv9ZLXS+xtBQ
         gECegHDvLeyjE+S42sPWPy+bNFD9Tcs6g81yHoGDHCc7K8YeAGV7tcNk6QkBXpuJnGbF
         x8g9rU/DDdzVbc2azR+y6WTgKrPeVw0SquK3TwYOgIK/5pl0abRhQi5RSFOaY71YupWC
         gLLPD5FmmyazulH7Qks/I3cJ0MSUWedtvGwIr9liU1zcGBa0HZ9mOsNGDGUhC8Cr1JYf
         oCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWpyf5EwRfKqfoteOfPXjt3DbyHL9JNehHP7rKUDvmyN3GoqzbOLPmrCWAz8oqhYgwwSSMLemZkP0FFWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygPxJ6nxQNvRlxBrgjDjWnLqMJf6biwdllI9FGPh3tlPuHkHcx
	FE1NHO+ABUcjUxiEG2ZQgcQZFSES0HrC00py1NJq0S2AhiUXPefOICJi7/yP5Jf6MmE=
X-Gm-Gg: ASbGncunICvUNQ+S3kmEnut5A9em3xki909F1dS7Rh++huelEHr7BL3osVM/ufFPotX
	SGRPaeGxLAXWEqumseb51TJC0IxRoPjFXbNnTbVmDXXhuevQRdCemDKB52CodHWW5DhEPmFzTT0
	rF9WUjLuNv+5APhSN2UihBmLKjistGhg3TmarlVTaqscyWEwrdUmCae1OyTQ/KqXSPqj113KtIH
	k4ce+T2fXq47zvRyrs9abHtBw/t1DpqepFX8sTJ5p4euEMiIQLsu7zCLvPa9O74LvoxDqCT37Jw
	UKhUL0mhAWdTG8lQdDdsqpRQdrd3qF8tHLiBku7Ro4fiwRCP7C+04x1aXnR7sA==
X-Google-Smtp-Source: AGHT+IHbTz9EFncYF8rjj/KzAc3qGEa/ILP+C+ivpNQ25TSNUWFF1L/0Lxejv1TK90rByVWMwd61rg==
X-Received: by 2002:a92:cb50:0:b0:3dc:9b89:6a3b with SMTP id e9e14a558f8ab-3dd8767decbmr21819055ab.8.1748384159428;
        Tue, 27 May 2025 15:15:59 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdba6ac283sm64592173.129.2025.05.27.15.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:15:58 -0700 (PDT)
Message-ID: <85e05d82-08ff-4c69-a6bf-e8d697c73faa@linuxfoundation.org>
Date: Tue, 27 May 2025 16:15:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/626] 6.12.31-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250527162445.028718347@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250527162445.028718347@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 10:18, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.31 release.
> There are 626 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.31-rc1.gz
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
