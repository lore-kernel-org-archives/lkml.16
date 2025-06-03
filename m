Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4721B0F0A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970745; cv=none; b=ta26Zx+booQgFPmsgAfA8qHC69c1UCwMGrxZYIzVIfaV8Ir+unk/GhKq19Dbz6i8Bz9N8k7dzVGP14nh3gFLEGqxHYIya8wk/V2gLfn5rdQLqpjTefQZw6mpSI3uWEZI9FOL7aaZVciYPihNBA0foHQFmd10svBqI4Qjaa5UO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970745; c=relaxed/simple;
	bh=aBZTPoy+j2RvyY9xp9Dng4bIGIWmvFpCRUS3iPsWumc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLc6n5uXoNJhRjvP8AGcAezvAC5XOMjUkULCfHI7LEB5fI/tVL0Z/7qBQwWbXQwQgQLDJSDqxO7UBM9nPxc2ZH9+JnEecnvFIT4Tez1sP0+d1hKqk4ObD/G1Sh5Bj8JMGzx+8NuYp3+wlgvtYKhyKjBT7TyjtcMxsGgR+vVQvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eVL5SC6z; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eVL5SC6z"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86d074fc24bso133490139f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970743; x=1749575543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MwMXq01gJ1aVcg4TMQoAlvogQ3BB/CkVvLj7iIXR30=;
        b=eVL5SC6zU6Rcoa7EShwOPo8Zp94K4PDHtVqb6DlpCyYzVgSlCRDoLOW49Ho4UoTSbq
         LJdE7xe0b3PRsMfDhAN72pLIb+gSE0NObtKM/arYcdvR0++bXar7fMo5sfFnNHIlt9SO
         iIWfS1tI8hW73l5y575Q9bWX7tbTnghtwjTqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970743; x=1749575543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MwMXq01gJ1aVcg4TMQoAlvogQ3BB/CkVvLj7iIXR30=;
        b=J/DJy1OawWQPQnBr2xryj4YEhjKWI1bf9APazMezNWkBCF7U4nhAQzSzozS2mYeb0C
         sIvf5oOulXe1ytyTsJEQ41m4yrLRcNpHdeJfAOgFqekBDTzAAbTF7n+QR/QV5WG647qI
         3JQDttLJ8bptD3HAtB/tdJ1tZCiLvAdFY1DAVzk7JxwpDtOc7ex2/p/XWWBA0Dcnt9hk
         MhNzQpVP4vzR37FyX/RMmKnbReC7XXOpvfifVfn1SDO41GgRUyFNCyJhtPX0xVAkUE1s
         xTxAd9Ml5a/GxiiurU8eTQdQ7qMadgaUw9elX4IhUyR8xo2A+yTD/HTOzs0KMiIyVk0S
         0mYg==
X-Forwarded-Encrypted: i=1; AJvYcCXlT/TQbhCCjxd1M1KgsVzEKQNL8W2+tKhGR0h8S/ubYraIoH1OK019ZpDDAhICfurAswuJPmss8t5tq64=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+l/NJyxzO7pLxGjJus6GzGnJKUlwfeuWreZHQXOVdQVBPlVF
	wfXAQb82J4R6aPkkufZpMz1L0992Jog5DwBbkq9pzs3pjrx2L0mFG/beYTgkvwXpp5o=
X-Gm-Gg: ASbGnctZykgKuMrxSOSU/XVt5pgHXXPV6qpAc27+afAFqkmV7bI53rwDbhMz6+yDtY6
	8OI1uug2joQSYxyt9i16jsr9F2bzBRaXVmbL1YzCP1sV42UfuOn6exTF/hphcDowMTFmx3qgsg5
	zOEUmV6UfkqJKUzzkrYq68tTRokbgScOfT7KhGZiQelz0KPrG5Urb5i5YBzyMU1LYeZxhTqeZqf
	i8yle7TTakSzUx2RSy9RQDoy+M8ZhRFNh7GLHbXsTEHRa8WUM7yTqpviu7pMmmViUAQLoEtL6zH
	a0Scdp4sGZCglsVKF+VWLJdadKTkphJ7Tm0/e9dwkN5o3xLVwuUb6H/qlQD1Aw==
X-Google-Smtp-Source: AGHT+IFqdE/Rv34mnRjjnq3frW36aEbqp6DknO1kuzPgluh1D3x0RxohnU3W0kvIiYd58v8VDK1dDQ==
X-Received: by 2002:a05:6602:2c15:b0:86a:1fce:f1a6 with SMTP id ca18e2360f4ac-86d050945fdmr1683962039f.5.1748970742966;
        Tue, 03 Jun 2025 10:12:22 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7dfe577sm2349735173.11.2025.06.03.10.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:12:22 -0700 (PDT)
Message-ID: <afd3f81a-237e-4076-9e35-f478bb1b9844@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:12:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/325] 6.1.141-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134319.723650984@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134319.723650984@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.141 release.
> There are 325 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.141-rc1.gz
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
