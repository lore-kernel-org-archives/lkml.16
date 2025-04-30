Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5AB25E45B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028593; cv=none; b=qBXLGh9y+JHEkkTzsODhXRhoWSagXw9FIQZljNmq6pJXMykpka+nky6+gHeYf4BKrqe6NgGBWWonfzXeuh/IVSgOmu9g9sZXqYFc/CxvaRFOR4dUH6+7MixXLl+4fYO5PWh0AtJxgVcd6EcqI+BKtyF4w4HT+JIRfAoyiZkJze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028593; c=relaxed/simple;
	bh=pA7CR67AeI1bkOqd63U+4Afv5eGza7jJuigYQSok1LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ac9J+mhuxU5WHiuROtiuexrswMyAAOhficyoQwm68thtC5IzcaFBSf9iApZ952B74c3bc0i9KQWEGyveAqT+UzOwx6fZyjcg+Q4xSPpabNijtBWyNwGnh5e17XbJ42T8pX+MPw4PRAcnkmwpS1KyF/wmlNgPOK62O1/mqzHeHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U+OLe5QP; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U+OLe5QP"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d9030c2b73so34315ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746028591; x=1746633391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3812M1CMfafLY/AjSDZ4rQrf9LGvmm52EF3l0G3ANU=;
        b=U+OLe5QPPMsP9e+ZsaxUupe5xpKVDgcSxpJEsfWn3s54mnqGkXnc90FTSDaZA4v6A4
         v1MjfxbAp83qEaRoop9llZ5VO6p+Ec5ij3bGr2u7g6XcMvzvEAg53oXhq+jHneXYTQfb
         BEnIYGh7PBSzZbQkey5mtlZDu61fbznPTYdM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028591; x=1746633391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3812M1CMfafLY/AjSDZ4rQrf9LGvmm52EF3l0G3ANU=;
        b=qq4SpzEzSj1eZ+wk+QBgCNhF9kpGJeoMFtrNjRmJx2TxgNbLCWgf4A3nutsiYHPpsx
         X9xf3Uh2EcuRybYtJxVYXqE5sN0B7q48XRMDTaz8Hs5WyfJEnSqLG/zS+Pp6+vgELpTO
         Go+BjJkHkXPR8Yjmf7EZtmhnjA6ZobasaxmgbpFShrOmQu8ZR5p1uJHK7XPl9+ZxPjwQ
         5ROwJxWvSg0YcE+PCdz9MZCAB46mXAucoiLADgfxaCg6TFb58CwbSyS/lQZl+uVeMzmx
         H/kLs0illj7gr6oRvq1Cs+bgWsA1/g+CP59Ok/si2SBn8ZwKOb2ldja42lEibtNUQAnI
         u8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYBikHyqsSDic+YPT69ENOaHCX/1axb6jJQIOAD0AEMiCRHZZPy6rbwn0dC1/vieVfDWLjBeR1wBsz1lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGn++/8JrLpVAjPZOsE6JyzAJ1kD+YA7zdIIJhyjbj8/LGXIoo
	q1ancnuW8aLEH2tX4WvWNjfKGUthjDhiOHwXpK0JgTR5aGx6B5+eJZrnED3lmnU=
X-Gm-Gg: ASbGncvGLdmwORFkT2DplvzL/N20OoM9xVoX1dVBjp1ti2g/zSQLZBHpeRyg/9LMUyF
	SSw0zc8rpq0P8qJuey4hFj+jxE6/swG4Aw13FEYhAgLZ4yUgFD3ZfB7GYnrsNzlM9dvDIg3O8Fp
	pkCmeCIFMTU9nclIxOf9qiZRyfj8X3b0cTNHFiX6K9g7neOeEU2cVQfYfTMtANoliF3tB9T76Fz
	APrI/HWIR+kgpWSu1t0Wk3OR0yqN3a1kTkheiJEcIgRZbVCRVzoLRnvvdL90T1RK7usM+Qq6iAF
	PyKvOVA85RRT2c+XHXD+I/fhe6wmAJXKKBilSDOE+XHtmFGcIkmYhn5AUnL+Pg==
X-Google-Smtp-Source: AGHT+IHMjiMeFah9B5OAFcO3f5dp76g+Jm+Si6IcQcOXU2QHU5UbtHuX2e+Jro56r9zfGV6MceYJdQ==
X-Received: by 2002:a92:c24e:0:b0:3d8:1f87:9433 with SMTP id e9e14a558f8ab-3d9676d0ce3mr35554665ab.11.1746028591040;
        Wed, 30 Apr 2025 08:56:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f2b34c5sm8803235ab.21.2025.04.30.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:56:30 -0700 (PDT)
Message-ID: <49a90b7e-05ae-420c-8976-7fd1e43459dc@linuxfoundation.org>
Date: Wed, 30 Apr 2025 09:56:29 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/373] 5.15.181-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429161123.119104857@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429161123.119104857@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 10:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.181 release.
> There are 373 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.181-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
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
