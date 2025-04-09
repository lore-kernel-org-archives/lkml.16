Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE0267B00
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224733; cv=none; b=jPPHZU2oDtz68/X+7aaqz5PIDYf7IKr75jNR1v0T+L0KaC+lk4OW59wL1BwlFvul8LLD8/ikdcfisE44w1p5s+6Sxciyrz3BHMwBdjxIWKxGs1Wc5iVHl7dhd/D8F+qt/XBUM5SeyhgRFJ6kCfc0CKKvtOB78Oi2627hSTctUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224733; c=relaxed/simple;
	bh=UYddorqevsRwxFwmg1do08PnXxZnhargYzpzeVk9+Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZo2eTzMpUbk+jisa1tcft3TzIAvCp/fB6bQZaY9SO3AJML0RQFns1dfabPld9jWt15mrRAjXjnJSju0BrLPoiY4cy7ElUZS1GVAb1AGzUGLzlby0H+j2RDvGNt5HYQrRvnW8t77kfTuCpumQhsl0GNxYzPtg1HgIYeMSa+OE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KtWfgqwM; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KtWfgqwM"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3feaedb39e9so2130071b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224731; x=1744829531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6GibFRXqwcx9teBdvxC1Ow1/QUI0XP30meo2aqGd17M=;
        b=KtWfgqwMxjgv3tYpbz0XKxyPVTiAuA/9tq5neQ7x8o5D6hiFfwGsql9rTyN5cF3kbb
         qlqlgGGtsF10wdfvHwJjlM2zxaG+GAQ9waUa6USDAOpni4Sh1gDEmw8+7ylEDXxYmf6D
         3A9Vz5VLpzti4uVkTQAYmZ4Zkm00vjLjdQ96k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224731; x=1744829531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GibFRXqwcx9teBdvxC1Ow1/QUI0XP30meo2aqGd17M=;
        b=Lv0oXYN3M7UDjtzOcxDc+1tkjf4Cqm4s3v8sEs1Bvs5VW3EUSlYTMPbJQcgbZHrloY
         Ml+M3NevudtoVKrjs3noad6nz5UJ1wI3+Tw5agycytzHY3qjDeSJ3lWacVsDVKLE1dZX
         ek4tXqqlKujow21KJmi+ykh1Hz/qAD2Fv1PzXu8/KwNmdY+gVL+gfwhLLAvak3V0uujO
         quwrGUimOCDBKDELUcccOgs/F2QXGvUiF1H645Wk9t6DCIrjn4W7hntd0wyuPfaOiPQG
         GYmsWINRDZqc5QLFp7sw6V/9QgSptIG6JC2KBi/fixMBQv6umaPJGjp2gVpFgw+aCs2z
         QNpA==
X-Forwarded-Encrypted: i=1; AJvYcCU5vtCTrfXk3/SbQBnDQiyCpnI3mg9kcnnVAmSht4L3Yn6gDaJi4BnNew7LKqIYwckkzYv2kkQNTVqOWNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2OzI8bjAMKg6rZAP8GCfUeeWX9d+o3YW6zLvYAXxxj0/8DQ1
	NKsZEIlVOI7EDNwmz71ym3eSMddYUGCYOaBtKf5P0HU/cJONyov6nSvHTqCtjeI=
X-Gm-Gg: ASbGncvbU1nsGL3hMTgIS5KILDcupvy1DMgyLD0ITDRHENd1R0nXQ1qmX4gZmn7L7cI
	TSX3tGhJBqPz7MaX0akNtyMFarjwZ7M0mWGXuPxvBPn6a6D07ItnCHMPm5ZUvRGEnxxqkK8ocZV
	7DI/HEn0P8ksaa7vFwKW2mvvdUTsr+S1lql0A6C9NR4q3RtB+BbAmqsslIvb50PVte0q9R5m8P0
	ZuteEsoGAE0B4Vf8hBrbhs17Bv8frbOn7+WjD5mJ8V/5IctPClpD0Sljc3EpgNH1rAyQ9PcqF1Q
	THXhtLuGIHKyduV+TRXvPcm4aF9rhm4yd7Q6D5hxUFFjPZAqETg=
X-Google-Smtp-Source: AGHT+IFoOWUYGnhxYrZFsDOJwhFDr8tTOXYJZckfR4G3iPbT4vRE7iwS/DWM3qg2w//4iHId28KWdA==
X-Received: by 2002:a05:6808:218f:b0:3f8:498c:9ef7 with SMTP id 5614622812f47-400740bf168mr1827591b6e.24.1744224730849;
        Wed, 09 Apr 2025 11:52:10 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400762eb331sm254058b6e.29.2025.04.09.11.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:52:10 -0700 (PDT)
Message-ID: <c1b5c202-5899-4a2e-abc9-93bd4b17ac87@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:52:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/269] 6.6.87-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250409115840.028123334@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250409115840.028123334@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 06:02, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.87 release.
> There are 269 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Apr 2025 11:58:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.87-rc2.gz
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
