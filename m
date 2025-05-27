Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6074D2147EF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384081; cv=none; b=VnOViplc0nYNllRODeMMERtk9VuQLzUEVvs6MQvKqv5iSwrEWJ7t1dqqfVCyOQKSKsSJd6t6Lp/ieQGPAKduwi0OjGYhRCi9s/O1T3Lk36EH1A7GwWiMcVzNTzp2acQxPf9Lw2pGGmcDT1knDtceqqmauoW6E/rXi805zniZpNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384081; c=relaxed/simple;
	bh=9udHDpAYAvxKPviZiivuKs3/emxHMcNVOQEErxHRjS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7rNvDBQWQFsWKbRmjxIoKPSyLkBLNJ/8P3K/jBKleCbwbus+5gxAcJMOCSAwTb9tw7KmT6tm/FHr5I5cKePo9BJEIu5DTt9+hWSu4jshspK/yj56VlSEUMtKcoYTfLFVwl3CGEeiNFReu8KxRZsLnXg/kluah7Z3ja29Lwd6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TmmbvuLt; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TmmbvuLt"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso9463465ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748384078; x=1748988878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFjcs9eaUw90jHcgEZEicT+OU2FTsE9C+Uzz54aKOIs=;
        b=TmmbvuLtdXl7o4JRVz2LZ/G2bp64Vclb/7DjFeYJvzFH3QXo0H4dEfEhE6Y4fnExFV
         Wj0FGZk9MzlBL+I1oyf+qw+GXXsCH7sWvJvaaJy5Wa45ugwbulEJ/D3b/RqwTRxcDmhA
         +vLqzEtkniBdcboC7IiKmslBbHLLYPAWROTpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384078; x=1748988878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFjcs9eaUw90jHcgEZEicT+OU2FTsE9C+Uzz54aKOIs=;
        b=LiU8/z2DX8Hj96ugvY80U81Kp4Y6I1/S+yiG++DPMNsqSDk21G3F75nhDRSBsnb0Gj
         WDp36pkP1D2+GBL7yySeNBQe/GThoJ/SO/sLp23/MkO/COOS1ZSErilqg7R9qD5170Y8
         fw4AjXOviBHO/Zwh6DWZvQUnX+V+ecVEvYUEYHLtcWLJVAcNtRzW9K/4LrOfQ/knBoiH
         ix3iGNd08SAoKCQQIFatrBahucT+VKhQDzvcnKHnApPGxamI5gygN0pTx/OHFGgvJxdy
         TY9EdsuCfvRhNqPgYng9J3Oe2gpWYYXh6mssjmuVR8lp3D8pJGnVfZHS2qI3hfcBw/9h
         WgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvdlPiSDVhYZb3HRbQneJ4xdcKlLez90SVJhxh2SV1PByIB3dX6QmX/3vV32YtP75U0lAH1nd3/432utc=@vger.kernel.org
X-Gm-Message-State: AOJu0YySP5uwIGWj2/jGJ64nAxJDeVDkZg9xlS00XXMx8glH+Z4MK45c
	9FDyBG/2/HzCq/I4UpNJEXsOFeiQ+izhpgOycyUeJj9qpYNgw+X4vm9u71MgCNYq1Xk2ZOX1IFt
	N1NNq
X-Gm-Gg: ASbGncv+pTfe3P/yhoG/lHPcGuOsKP7DF9ZK3NNa2En7Sf8v4O+n6KdSPibzcRqgpoo
	kIc/fZyzXJ/3kYWhaQ0YC6ETlG4oKdFJllDhEq7I7m++OHv1Xd5SYTq61CtwWcoHzNb2E+dJwfD
	4HOQOGvHAWSI+NYDdSUKjQMCSKdIk5MqsiEk4cWG2ApvDyKMiXy0I22QGGhdaOwd+Cgl4KwMB66
	XyVt/VtmLrJJcsUXBQ/uDopJdHHdy1SDEPMV1ttcgu7+5Ew2fm4XtZC2Dy83lbljPKynwdtJPcP
	YDLgiMMrN1BqX9Z2u0oiDT4hIbX35ibfLtRveTt5Es/YgZD6JU6ZajN2+9ucp7vmZggFQpJL
X-Google-Smtp-Source: AGHT+IE7r/xzWEX6isdmF1z1Xc3VKhaKMmnxHU3LTROHn0/Zm9/kosE8qJWqlOrrf4zs/FMpG2JziA==
X-Received: by 2002:a05:6e02:1488:b0:3dc:8746:962b with SMTP id e9e14a558f8ab-3dc9b6e58d3mr143356275ab.15.1748384078310;
        Tue, 27 May 2025 15:14:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd89b833a5sm635645ab.23.2025.05.27.15.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:14:37 -0700 (PDT)
Message-ID: <94de490a-3cf3-44f1-aab3-32309725725f@linuxfoundation.org>
Date: Tue, 27 May 2025 16:14:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/783] 6.14.9-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250527162513.035720581@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250527162513.035720581@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 10:16, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.9 release.
> There are 783 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.9-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
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
