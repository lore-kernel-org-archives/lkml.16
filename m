Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C18215047
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995621; cv=none; b=d6J+eRM9TcmGKH3mWsuqoLfRrkXK4cejki2kIHyWpnj6ler8jPm25DRWKU5KUDdzRorShrZpuxJNxGyJG9TklQpxm7/AdWtSUG6OPZ+2N0b72fH6+NxIHjFi771j14T1nNXrQdJRTGNTJZxT/f93Pt6WHg62yc4iXGdw/ebQ7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995621; c=relaxed/simple;
	bh=Q+BDfiFW+VoaSQMQ8aLv84jJcRC/wcDH4vCfEdzdhsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAOtprB+UIH9SyMRi2cG6omB1Gv7VO8bjikcjJIeGyfi3zhUa6bJ6FxlB2zwYdiboXt7JGEy2eIOj4yHdPSi8Uik7/ijuSX+qQyXNJA+97+lk3DX56Jm8ek6v6T+4ubJtdlC2LsGLnK0aIUv7HrVf4ssm4BrYX5KTuHcE0Ywdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VYdjuPUv; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VYdjuPUv"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85b41281b50so62216439f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744995618; x=1745600418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61d/sKYxMGCNUNhoeDAO2XryMeoJdihIOmj+N3+Z7lM=;
        b=VYdjuPUvOtnvpBflcaFGWJLfR0lQmatYeQ7Sido/SsNIevJXCoIPYErvAAa/EJObbj
         uUKuQAZdMiy+5lnpUSu8ohaj7cJFNfzaH9inCrsfl7KUvVEHvEFsUzhyPzdLmsxQR+UK
         ZoU5CT3aCq1dqvZQX28lSiDiLoovDLxZc2/gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995618; x=1745600418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61d/sKYxMGCNUNhoeDAO2XryMeoJdihIOmj+N3+Z7lM=;
        b=M3vm40RUOydObjjCxOWdElGq2PY2h/eiYKmxrbB2QV1DMSaB9eQ3WOpq9XZ1k803th
         u8dvoWOAHrPbzDOJS3km2CYnVHXx0olCud+2RAM+NstYaSfWQ78F/O/87yeXdp0e7pmV
         NFEKPBhfsK/JMq/+b3doeRtIY3GUCHLCUjg7TsS54aXQele4QvHPLJ8oQK0qvmAipZ6J
         GlfZRf7utwYuEAcHrurJxGivEP0EQ9D/Ko/f5IGcr9yFnfeylNTBgRWyuUvf+bJUrkI9
         l9wlnZ1vA/50vZK9l5vuMTU0uYpya4cISeX8hEZAJRnEIOuVY1WAedS0nPKpCN6iUAhV
         3BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWofMZk9ANsHq7H3i0icr0YcfPIokZquFYsAvplzHmCa4UAGntC4OIM6Gr+zP2BNHUZLkURmup0uyLkEGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWCif2xAxhfkWd8HOGI3gNbih41bdNjDyTr4PM8eWwjRdomCs
	Vn9M9iAsuS7Gq9ei60JVkqNVuM/iOR9+4t89zI3pUcH6l8dfY+O1TemNptMoOvs=
X-Gm-Gg: ASbGncvQM0G4v4lyjeWM26r7Mfb7Vw9JDZrDfzdPBbcsT0I3u9ks8ADJ2pU4ogutrWJ
	EXmo5AlpCBXj3fhpZKUqaBLDbO0yejPdZSsijpz1pubdjYBzDkHzG2R9JPDzWtJACYsO0OSZTFg
	hySdJ0UCUW7+W6X7nvDSzE6FOsfDITUvHZzd/oY3icUPsycWjH91oJN3YJWdkMnh9tht2xD9PBv
	tE1Oq/e1yHE1EHtGkkAx1lvII/8krHSKpPk6j+03x5BkdJN09XEKOjAVeIwZDftDSED2v9PADxj
	fnbyiu2lTi2iFxOG/2qEandiXBmIfNXadnW8/yYJ+iwagnG/YZ7T6cJmaTtwoA==
X-Google-Smtp-Source: AGHT+IEyIUcHLda0Oi5Dxfiv38uolw830VjeERY0b9n6LCLvY8kI6O/HApmGqXlxMWs/ME3XOMIDvQ==
X-Received: by 2002:a05:6e02:216d:b0:3d4:3ab3:5574 with SMTP id e9e14a558f8ab-3d88ed654ddmr36402815ab.3.1744995618252;
        Fri, 18 Apr 2025 10:00:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a37cb87fsm528003173.14.2025.04.18.10.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:00:17 -0700 (PDT)
Message-ID: <d1a6d53a-21c7-4500-a060-26c15c4f32c3@linuxfoundation.org>
Date: Fri, 18 Apr 2025 11:00:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.13 000/413] 6.13.12-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250418110411.049004302@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250418110411.049004302@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 05:05, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.13.12 release.
> There are 413 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 20 Apr 2025 11:02:49 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.13.12-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.13.y
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
