Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EA1C84C0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781178; cv=none; b=S1g/nIGMxAbdAvwmSSFW9Fo4ldIY0qjWaneFZh0OKruX6xOFQ79w64SkKgts1iFfTVsVxvi7ze8FRkShDPUgMdQHgbUn6If1UBgde+9fq7B21/WaVaAtrkD6PmeRy8+Z+k8EvN2mOcGCp7paN/fTROP0Q9SQTJhdtYvnGwsSIuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781178; c=relaxed/simple;
	bh=xU1qrpva3srGXzaRllUISS4qZ9R1FkREbCpATdGX090=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3rdK8EoiDtlTlYnPWzcesLlpyw09+RKnEmb1XKFaM08IwJy8o1+LffZzk8MWM87wZoVPXVfoXpCUgaYkmwzpGQT3rA7KjxPDGH7ICUrOLrrfcAnSsT9v/6lv2MNGhhGvdsCNjP05Lx9U/QdMYnmaOABYDbeO40wgPo8mnwtLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JIuesaM7; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JIuesaM7"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso556663439f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747781175; x=1748385975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBK2iNtnFXG+56awWUtYZcqCou699Pnyv5HV8iziaWs=;
        b=JIuesaM7weI+iM93RjfzACOI6VFPOqHYt52beJBVKQN+EBwLUnKywffDLZJTQMxmOM
         zf09Q1sTkNDkxl9/IGuUAaeLAy8CkEyCuytFaR0hSoxiorXMsTqv0g1L2lte7x2lgkkp
         EQgpXhYrsBxxknpdnrdgLOLZbthEBfxIFk4+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781175; x=1748385975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBK2iNtnFXG+56awWUtYZcqCou699Pnyv5HV8iziaWs=;
        b=aZuQ092O25j2BHsJAkU9u8IIAa297fnv2ILo7BYvhYu09wI0UWYU4/ShZlmbunmeK4
         HWUXk9HZsl2IX8igOdmfLII2/tAx/2nQAIm5H8d3JnYRFuWJMNIYgMoCdSriZM5++XR3
         9suY+cvogTEiW/vr82epOSz4wJdEE7t42nOLaCWamo/OSaHiH8X5t7ZjJoXYvSs40YV4
         KDnL2hOW8IZ5ChxvDvjxi1sxuwu31vq6br9bvsYnt2YdrMHz6pSLGqEF5cEVQ4zRwJKc
         +xRb1nO03KT/UBQFLdgHs4VjB2v7PA/rUzbcMMGnNxN0top1YOcU3xXAw20nta/D5J4P
         Nyfg==
X-Forwarded-Encrypted: i=1; AJvYcCVeYE3TCYl0TEibk9zGIpklrg70sGV+Yjjxm7iK3gxyWvOPL8E+q3lkhejikQRMGRStgZ47pb3fday+bbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjYFFpsWh+KDzwknlarqTpVBFAAQGYL6DHzr3Tc59r/n9MX0x
	Ha5hZCLe8Gw9Kry6Az5NQw0dFyAkzu3qkk38ne+ViGeMhhsyI/cHbmzzb4YxVJNdEg8=
X-Gm-Gg: ASbGncsGAE6buF6cYYXJhUnISo+jq7Ws8o/iScQmpXKpPKedODguYtzpJXD1S8Ue3vS
	S7uGdLEpxUpyimhnpZCkoAko+fv3ZVOOwUr6k1WAy38S3Fb6aGtis2UvIzmsBgBCYXSAj4bztXv
	2y3grCvM7NbwhRlm7g4uLrmAQgZqseSMGFmMXNfOPqoqDsDqLg4QnYuiDPtY2IpPP0JBZtvt8U+
	ZlgHYlKRlwyr1JWggD6L4esYUqpqo3om6L3yZ3jVV04PK5TR5ZFhy0dLpknBiL+if4w5N3gKRb7
	HgFRX81YNwN6ZNBQt0EVEh1gpGibym0JLvU4SPicyHw3Gkz6KlW7LR0TrkEplazwG126atPL
X-Google-Smtp-Source: AGHT+IGaYckQ1ocB0rCSKdcZon0qF7utkxxlGcyX9+/b8GAs+CN77IZYj8Y6+RKi+IUPbifSGPiiMA==
X-Received: by 2002:a05:6602:4808:b0:867:6680:8191 with SMTP id ca18e2360f4ac-86a2306ee1cmr2732619239f.0.1747781174829;
        Tue, 20 May 2025 15:46:14 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbe649f14asm1726634173.79.2025.05.20.15.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 15:46:14 -0700 (PDT)
Message-ID: <d2cd655a-7375-4870-b6a0-757721ae183f@linuxfoundation.org>
Date: Tue, 20 May 2025 16:46:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 00/59] 5.15.184-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520125753.836407405@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520125753.836407405@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 07:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.184 release.
> There are 59 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.184-rc1.gz
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
