Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597301DDC28
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195056; cv=none; b=HJrt7qivOEb0hHw6JZi3i45quB/UISXGe72ujvnPX7T1vKCKf0W7SaOdViUtQGcC6CBNR5lBzCKB4108amDOiJlIuETohc0+rpiNsAtiab6suwc2o/rG712M9kZ/M4FRCzHUWaNiFiPoTrJ8cIalsidupvdTZzquPzSbvCvUpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195056; c=relaxed/simple;
	bh=C3zqzvgxnqkEbq6gbzY5/vJOF5ioN1uUUpyG3ec7Dwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtPBzModbeGfENAAQ9I9UqR1yAW91qjKpmkBUcc1vTISHGb9Ay9IFy274NLTS5ZMpEDDgE3G1uA+R83fXjbPsd9TBqrAyNkVtMQTYTcSwyFkL6+49kFOFIEzadnAr080jCU5XQEQUfPe6iN65OSq5llB5mbkqbF1EmL/ulSCBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F7ThKIyE; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F7ThKIyE"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3de18fdeab0so21781585ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750195053; x=1750799853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3o2EErfEHnz3hmNQBgh5TFWazInBuO1PKdU15xcdgw=;
        b=F7ThKIyEVePaKLkoeEVUdQTxW23Icn8gtKbD7mHVSAOVw6dxGefDiiSUC8OezMd0lK
         UOppLtppe/HXqYks1xgrdASr3bQDd9VPVGTfo8LGo/uYSWetXmI1Ye2mftD+OgC361F6
         Ze2LixocxkIOT1eZJjGjTvMf8MM3SLJDapfa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195053; x=1750799853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3o2EErfEHnz3hmNQBgh5TFWazInBuO1PKdU15xcdgw=;
        b=n5Xu9jcp3f+DeazSmfg4S/GUs88C2JoZ3u1YLUgJotxkJxk9Ec2QxJk7n4zJ5yoszw
         bQXmrmmvUNmc88j+Feqkz84GPVjinJ4ysIimoEQzmO8B80X4QClHgSI1Lzlh7WaLadnY
         Xyvs4+H8zJUDn+CABaQP86FC2wh48VRYRAQ2XahuK7/uJneL6P9hu+zRuFTxdugcPB/z
         Z0kl5xz05xLMk25cPblWgdY5M80ZFTSCtpK92a7Fs2/uoWoAw5zdZCrRjeDWkytTtyGP
         UEzDKeo7evzXdlwFXJ8WtwqbX+TzYSR2CWm7aZHjMAt8nAYB2rrLrVOi6u9RvbnWJ9Hg
         erZg==
X-Forwarded-Encrypted: i=1; AJvYcCWtyxQIqv5YiYcAj6FL9ezKGASZdVI3FfyEAUU1favULQIELmvMIAu8JHnKaxOyEfpoe6ZN6Z7RdOFMQwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7GiLArLNI+Kh/uWo2UsUeM4HAVuEj5RjD1pVdO6OKsQKuWD+
	pL8dUqq6FaAWTTjytoek47NAmDHjQU6GEGFVbZdPwIoS4IhApJBTspvd9XzY0lHLGWs=
X-Gm-Gg: ASbGnctAQhkAj1AYvZDR4JsanOAM9+0jtq6xvKyPZZs5X8DQEUrTjZwrpxNU/4iGEBX
	yBYJlk5jHWOdqIXgbUMFmfmTTrFIarYENYQENoTTr63RO7pyGI5SUhUr9Y1eRY07hqc0pTRD1S3
	y+YKSsYwMHNfUOO/nrk5NRSaU3yZw+M1aM2H/LIlB7GeETGdTd6hxWpejNi1AtS4Zi7fMiyFNTd
	8JjFUs+imIkz2azEQbk7qDwz1A0snKIPCL33yrQzmlW3mnEc9mBFnA5fxpNz9dF0ZkQo/mk+Jpm
	flSbAesk+/4YQQ8W3Yaxrx1L/6mM5IVEzlxdaWo8fhXyKlfDSsDTgsN359QoShLrQaC7Q4lVMQ=
	=
X-Google-Smtp-Source: AGHT+IEBgMyPOW6hAMXcdTuzK8RVSxmS3n+6K8lB0g5WvUu0MVvxKgSVKQVBgJhZmKEfgPNtN6loXA==
X-Received: by 2002:a05:6e02:19ca:b0:3dc:8075:ccde with SMTP id e9e14a558f8ab-3de07c272dfmr162449005ab.4.1750195053421;
        Tue, 17 Jun 2025 14:17:33 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b4406sm28236045ab.1.2025.06.17.14.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:17:32 -0700 (PDT)
Message-ID: <31757a3e-7c44-479d-a75f-baba2d436658@linuxfoundation.org>
Date: Tue, 17 Jun 2025 15:17:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 000/780] 6.15.3-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250617152451.485330293@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250617152451.485330293@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 09:15, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.3 release.
> There are 780 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Jun 2025 15:22:30 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.3-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
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
