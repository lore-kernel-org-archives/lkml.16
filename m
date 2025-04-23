Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CDD1E5B85
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442931; cv=none; b=MLzvbHi21qGGXqNcw40aNIo8efbqkdG3xChUHVy5VFEzNy5ANO54ogFf7Xf5Qge6XtMFQmv4TpjLf5FFo2m+ogSxvGtR3yHRuxUAyejnlbSPsrM0DenzaD34OuWq2ZO0NV2lvxFlpBS6jZ3uh2YFRm/3tiX4CiLxdV8OIjkbYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442931; c=relaxed/simple;
	bh=3wg5ZZBKnTg2ncyGfVaRhOLARfZpulIN3duBvh+GAG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGro6PeHM6zB9MYeKH2302C0ZZdgb7Hh6lot+PaZbZzMsc33fmO33Ha5OQOorjXszzwti5+efgC5Yg7l3xpODOsWL79/YUdLIn65hL1d+v0eETNs1ZsNtCuAavuU8SlDFMPvRiTSoaJiMFLaIUaNZbkITCPHNje6GiYi1Cw8M0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T407grr8; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T407grr8"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8640d43f5e0so28370039f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745442928; x=1746047728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9b74JLWsSCMyjNH83DE/ETA732OO42vrMEekT3J9SKg=;
        b=T407grr8ZE6KuuGnnPCMtmSaMJVSGlHMgCu2xyw+Cp0zYHDDPN+zjwH2vQpl0BnK03
         jlroBOT4KGuHO8HaC+6qn2TwgS93kV1ZfoblTw/owd0Jol9UDWmdFBPxE4M34dRsdYTz
         KR79Egq1GyCpp+OKbuKPWzwnYJACW3KrfsNr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442928; x=1746047728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9b74JLWsSCMyjNH83DE/ETA732OO42vrMEekT3J9SKg=;
        b=AN6EyEtThDAs6fEa5GLRt96uko2JP7iDDYTH+38sYtPZZQJkkecOgh3RK8IM66ey0Q
         1dxouLI6fRF1zZFlhfuG5jsDUWJrGNTXcfRUuJ19Px7r0n6Phdj7A1+YT3S1Gpb8QpY7
         IkXQcsPU9Rx2pnx4Js5gdXFLZrR4PWvlbrUPIW0zttXUmBKWQ5130RB7qJrD7lVGvFKT
         Gol6f094Zci4v+7n8Y956wbUBupiihHUHm9kJphW2IWCQfNgDNGS9ILG1NtrtaMUPJyJ
         roHcLkSDTnrV1c2sogd+/868LwUQZ8nkEWROwBbUmjcxChtUo1J58HAk2qk9cnkhykuQ
         R48Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx0iyK2kZsRoyu5FxTJ/voH0BdMwD9jdEWjs/xbRO/WV5B5NcwYN4vo+2p1WoxTQ1uHvRiZZqKipVVEMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynSwLxHi0mVBf63enM37lJch1YYHI/RzQVHdX3S2rDgnIGSgmI
	5mJZEJAK2nUQ0SLuCF5vyro7WDtDE+XnGHwYSghV50ZpDH9wtB/qcJod5ZfpHDQ=
X-Gm-Gg: ASbGncsWOqzWa+fy8cGmIYQXldtSPbEOrWt+CW9BikgWRhdOyi/MjZ7xddzuUZLrWlm
	EAKbRxkr+LNdljH4XcHkfjYre9c+loiiSo6LZZ+2XP3tdPl8afR391DzZrHpaqTAUCjJIXo4s2x
	zPYZrCRKzR/1pAoB/sqaWO+GTAvofRvh13atmWhuTYtmJ5ynWtbofDTPoeuPU0R0QMsSoDQr717
	QnQcyfdzgp7fJmrWFQBzSuKa9Ac+rJwVq6xK5LX7iHcr8gVelGE7y12GhLaBNifK+3iHNFDmsij
	0c17VrhSgeDouLC8pJqg9XxYVYzsMz0Jo+jHv2IRi0KED6Do7iE=
X-Google-Smtp-Source: AGHT+IFDN0xZmCbclTEpZ4bYvv9YC8mSFQM8qjVUhB6DvAy9T+2/8p/39df5wnTMEJTBducPcLAdJw==
X-Received: by 2002:a05:6e02:3c87:b0:3d8:1e96:1f0 with SMTP id e9e14a558f8ab-3d930422374mr1767695ab.20.1745442928314;
        Wed, 23 Apr 2025 14:15:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a3955530sm2920111173.106.2025.04.23.14.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:15:27 -0700 (PDT)
Message-ID: <f26e49f8-1b0a-4aed-b322-4243c4687e5a@linuxfoundation.org>
Date: Wed, 23 Apr 2025 15:15:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/393] 6.6.88-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250423142643.246005366@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250423142643.246005366@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 08:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.88 release.
> There are 393 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.88-rc1.gz
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
