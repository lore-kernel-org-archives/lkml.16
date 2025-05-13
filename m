Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645652BFC72
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157439; cv=none; b=K72WtnVEYMK+1SQNrm9PvFdZwBW+NdRFNraMfqjVrkfVHlX8rrB2vdzVnc34T3US4oJtzLUsaGVpTMZNlZ5is68zwMkujSPPbf92ipBhZMokoiiF9RZSdWLNamGX6MqnLXLTxmCQLD6xZvN5KHI+X6686H+kusVGRYv4FZleHnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157439; c=relaxed/simple;
	bh=1iKDHQ7jXvke4sxSCXjYm0GynBjrTYyOGP275PTOFfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5YA8KP1zXm0x2q0EEidrXHisLFdtXz2dtkKg5rEP/CiL80NL6g7bT0qOGY0gExkLqOr96BlUgN8C7loKT6C5Q/skssoPiBLVEnnH1Ux7sOokhYkj42/m5zTkEhET3F5Uy0StfBqg99lSUliD4r+AjrSR6shEXYUfYQFyQTAjmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VsGe6OfE; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VsGe6OfE"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d96d16b375so28146555ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747157436; x=1747762236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tW6PygMdjeagRmJ6icjOyCgBVvMDYmBZ2dFiMgydeM=;
        b=VsGe6OfEoYw/3FDhDqPWJa4jARAC7F2gNSTfsiuvDBTqFcwAeJuNYo+Sb6dLsF6mOP
         7e+SSyw7v+r+EkxlxGbbjvc/zk93FSHGWATuSwfRIr02132oX+1cNdQB3L75RhCxxaW1
         4w8rsYXSmlicwpJG7Q6vmAOaYxJmMMEipt9RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157436; x=1747762236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tW6PygMdjeagRmJ6icjOyCgBVvMDYmBZ2dFiMgydeM=;
        b=U2ZuZZMAxF4bvMjPdvT81pYWsxqxjqnKRu+khmk6MMrIOOn4QF1CBsAVHlMRAhQYs6
         qq1t+qKnwCfE+dk6oH6KfOfO750/XVk7jn+iZrzmKdGQ/DiBUUQJxnRVJkDCKSM0DM8N
         r0Wg8rgMk20n9kJdPKGNyzA2UickmMe871yxmYdx8NJnjZmEuA9AWw2uMTY0xEBOPGv3
         BSA+Jd6dHrhVQKQZkrGqa69UvqU4wfNzsPDzVjN/TkUkH54k9KyXssKeN6dBzPM2fGAV
         ChRNiP9TMkHngN0CH4QUddw8grAeOKWBQVSszMhw2z+oC2iLTqvF7Sdrrm3/yOOGN4DR
         3/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPP2GyWtCIfS4AaNe7biHV7fSJ2z3yfYWyYlTtZ4puqShdHMlLbzTlwWavWmZ7m/6hKV4Gklvppa8g5ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfO8B1QmPiGWR0udXeoFiCLXDQ1g6O3Vuatdk13SOIzuH7axqG
	3jMQuXORrafJAqpHPFNYU1GtLOumbq26gL+GMIunzWbC+wni9TjiGoE+a4hO7NM=
X-Gm-Gg: ASbGncsHz+UfgLMHjbFrmTc9ctFi+SezTBO9IP0EuOC4RGunpzFWxsboTT88blst5rS
	7gBG1nNVnZSxXdtWKFGyexn0ONu5mtmvBoo7+TPjaKMiJtynDTT4MJ9H26zDrcgTD2ORlkdyiif
	dBabIlyMG68cPiJ5P4IVta6/Mt1mVcyDwtJqfUAzj7gogQbUuFZPI0FlRWJZgcrU5krf8xMvuZB
	kCXe4iTE3uufDcEZXm/L40woMGD1Fh94Y1RCV3ziyrnqq+6/HYbGSrXUvnFGt3TiL9dZ/3xp3HY
	PUE9PNhKnDzh8jOTV97YuR0y0QZDPs7MYyOeffYxGZw/FHHP9SFh6UDwfEbRFQ==
X-Google-Smtp-Source: AGHT+IF33HkKIK0AZPxW0+9c8b+moPUF3LhmDZ8Yvqpj+8WXLkf1qZtasqM1OUW5b7g99xgQbCY/hA==
X-Received: by 2002:a05:6e02:178d:b0:3d3:fdcc:8fb8 with SMTP id e9e14a558f8ab-3db6f7a04c9mr3577145ab.10.1747157436272;
        Tue, 13 May 2025 10:30:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224a1415sm2209822173.14.2025.05.13.10.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:30:35 -0700 (PDT)
Message-ID: <79f86562-af5d-474d-a971-7ae20c5cf011@linuxfoundation.org>
Date: Tue, 13 May 2025 11:30:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250512172044.326436266@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250512172044.326436266@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 11:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.7 release.
> There are 197 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.7-rc1.gz
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
