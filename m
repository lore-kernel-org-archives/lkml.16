Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0C155C82
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970672; cv=none; b=ple6mxyeXybenxSLBTzjSFziOGsmU57Z3QVtmp5yeXMxXsEVwLO8bSpto48xTYeUSLfGYf+7kWTknjKjvaz4yu7jnXIP1JbepR8NQcFLhtlOXReNHQbLBhDt0lNlqNZNkr60n8riZmeCHWmCNJSc7Mvl/CbppRNVxXkMQbJB1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970672; c=relaxed/simple;
	bh=aQQBhohjQIsXAAA8OWEgSE8iiPBsicB0x/KzfQnnE5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiYre8kLceDvXtewiv7amGCyib6l5zh+BzF0+XmLTm0ytdvlOsZCCMRJSOqV42zhHxAM8L8Iyzpizg6t9DVJJr42SL508P8cbl1Nw1k6Cmcn/qGrnnHMHI5hjnbn/ItueW0poXjVfULwXPa6s4VIILeyH7E0WTjx0+pgS8bwKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NvEGN18E; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NvEGN18E"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1463187a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970669; x=1749575469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/FLJ6X+Z+KwzpsNzy53QG41bQPIW8972QpUYS6LZE=;
        b=NvEGN18E/otVeBOK87tugNiW9nCX3BcnkRXOs8WitbRoMdQOmcRI9bf0T+somVyoMT
         FIuCeGyF8H9DPSYmtQLWY8Nt55AS5dpsSy+MEEmvl4Dyh93fowYpdYy/vvR1uag4enkt
         EEKtFOiXuOSTOwvKrEUooh1ePbLNkyDQIkldo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970669; x=1749575469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/FLJ6X+Z+KwzpsNzy53QG41bQPIW8972QpUYS6LZE=;
        b=apE5sb+Yg6e43J6JWwLtz0OH/iQMZ2HMwWALE1HelnK3j/BSXTcECS5GXEMCuzvrb1
         XUT8CcGNdYapjYIeq5T7YkpWipBORthLIEhYkP/0Q9x4oQ0rMv9aV8RI9N56q4/dmlZS
         wcScyFzNmKyVjTvGehJKHy5dppBVNUwVgj7SetIznEcIwj1DAoJOhFP/jibyBVr9jM7x
         3tmlFxmDmRLslEE7gKm5tJhwyC67GklCzOBVn+Tf6PDJHWmorQmhv4i+06jcUUc7X1jn
         kYglTdG/vgx/6J2DfU26FONOLWg2hDDEW8aL2qf5X1zws3hoN0GPrZg/pgEr5EL2WhD2
         4IOA==
X-Forwarded-Encrypted: i=1; AJvYcCV4+8JLLmklZKrdgSFtDKYhUBwZRVRpNMbYVHvF2j8OOsHVji6XHZtLvGzjgZuKCQkzhPrISlCop+dbFnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdDM1hsiB+9hvW8ae9f+Yeeh8uDDlREfsbrq0w2DSJVs/2pnF
	0e08hmcimfUBKmtWQ9/YSM953g0BO1Pr1tQTPI3g4uhlWQowwoEjJI19l5M8sgN0HUK1GSxyFyP
	3lOwa
X-Gm-Gg: ASbGncsxgyeXNYxmQPAhqfE2D1MIoOzHKmfLQRIK+aqLjl951wFPI0n6fOMPtDW+kOM
	GJ7COEldpv9vmK76bMqFeA0Ln8ZodlQjbZspW4jhXZlpXTyMQEvzusXRTWP4L6yIUUR2VYGrHaF
	+w8oTqg5N7tFagYiqNyOwmhJhQnSi9i81412RU0ZfMP2G2cvcCE6ndCKFb12FqLCyK6sgIg1dpu
	z2cliOmO1Y71k9CzLN8vsPATarWlyz3BJJ9ZeOpQ8EwYUfFeZAeaFJ/iSvK7UJCI//AKyx2LJEd
	zIaXCDCmYH9sDgy0juW4WSCUPKjAEhAK8w1iRFpSDNWkJuu/uyaa0p51ijY+TwskA2vauMCI
X-Google-Smtp-Source: AGHT+IHan2FSKbS0x4O5vzploOaIxfhJ7Es6upmUdxSGvzf3ySgMu6gpZ24LXAKPXHs/2zci6fpapg==
X-Received: by 2002:a05:6e02:4416:20b0:3dc:8b29:30bc with SMTP id e9e14a558f8ab-3dd9cc15926mr127450175ab.21.1748970658903;
        Tue, 03 Jun 2025 10:10:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd9353d994sm27175185ab.18.2025.06.03.10.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:10:58 -0700 (PDT)
Message-ID: <bfa7e3c8-b497-4b06-b7de-db6f97ade6bb@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:10:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 00/55] 6.12.32-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134238.271281478@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134238.271281478@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:47, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.32 release.
> There are 55 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.32-rc1.gz
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
