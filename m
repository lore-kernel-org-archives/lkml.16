Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998791D5CDE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157466; cv=none; b=YpnbDESD33McMQi2QppiELqPPDWWGH6a7CmD4Hc64ZHBQziFwe8wT+LBdzNNVgaiYa3phV4yHNze1EstOV5c/1cAWuj3mEmVxmvMmKcwqHzLQIajpAMTdb8XO3H0jf9CWCNuxiTij4ktEfwPQwAjovtz+CsX6MccvvqnRUdKld8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157466; c=relaxed/simple;
	bh=EKZGO4knTlWgvD7ViYHkL4Rd21IweRpy1rbhQfQGqWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/IIFF64eXsTzm6LKHcCpQohPlH1kWSThH7lB0S6EILD1J7ZJPTTHyzPSG/Womz6P5esdPyPGFUJLXGhSQi0uVU4nPDk6hNGcmRQ6VezE+Xu8QAgRQPf9JU9rL1cXx+9CyjlNqTC8XIcW3tSxFp/IK925TNv2+6VhGh52sXslnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iVtTAc7B; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iVtTAc7B"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85e751cffbeso508895839f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747157463; x=1747762263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBntU9Zb457F3v0HGH06DfYXgcqKhRbeHf7CeDFOHkY=;
        b=iVtTAc7BFnhzR5qOwpJM3dUN68Jx7ioWB+IrMRBoz6Z2HLiHgg8qjLuVZefCfQ0Lrt
         6+hfgIPd3Cpz9kpVNC91a/HRaOjXtg4F8qlKh4HGl4bEH2KmNixr693OCalrNADKwSzu
         AtXo8JwHO9y20vVEXjhfrZSZj+sL64yL5JiZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157463; x=1747762263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBntU9Zb457F3v0HGH06DfYXgcqKhRbeHf7CeDFOHkY=;
        b=ZnyynH3xufhCabzk7YRXQ9Prl0SGtOtUKLAYohWS2XqvkrQNFmmYA+tHU1oDdSLkxy
         UJOqlwjZCEWbXXNuCxSKNfMSDhUJw0xqjyMyE+CC2TnC+Kod9nI/BJuaLIlGryqU2TAP
         TVKnSBDbZrRU5o2NbE4Cj1VTEj0khmROnU0WhRIkbHUnuRYolI8eLwIgjcvR789Qyuof
         mCAm5QH/91UDsx+J6plWkpU4G2ohrxnnFOOyU8whj4AEiW3W8LDpEGNEvW7spYxEE1Mq
         HVC7pPzyuIJcbryZHZxd0t4zb7651NFOhEoHpOjivYtVtSDZkuDbAc3lEAyX5as7NIEE
         /yzA==
X-Forwarded-Encrypted: i=1; AJvYcCUyu7csUvKeGifJE2j+y+pJCY7B4kTYQPUiEjga2pgrYh2q21FmsxW1+ChxoTo4JuMGglDdxGhepTJ0X4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzno37Ru+ldmbaDYhDmfMPnOBAj4mbI+GHKpHUpgGdmu3WQXVoU
	qodHMZxfPswB8bLPaJkLL8c1xFewJSd1I4knBNkRfcTGWfbdo5LaUH4VofbkVm0=
X-Gm-Gg: ASbGncskxQrvsx+THfy3WTOlv/nV7l7qpW6wYxYZtwO94l53t6nnsml8nZIvrxqJL2P
	bFmC221LmLeZ8MkNhqRe+C78mm2huggfxgsaaHvuEkNtcP5rt1VqNBuzENAqig5J5BbxFsiwrp/
	X6I+02yAa+hFMk/P5+mmKuPqBrDp8L6ne8QxJzg4/87L9fhcc9fokZY/xzlFu3LEmCK5o5Fy93q
	37EAd5BnSfvPzscJ5X0T1WREJxBu19iD0hvUwNn3RVEH4IAY3dTyd79l/DEMMyLoo0XjjvpfsPD
	GLPklJzWN3HhMbsDqFWnZDx6EXHFiADi+aPk7wfzd1U48Qx+e4gpFKK50orU5sauxfZyKiuz
X-Google-Smtp-Source: AGHT+IFfXGh5EzpevJ90lLPFiR7gOTOcforPZ1I0Vvr8Lq/brdcUSs21qS3Q2pEIsSdxIfk2vUq18w==
X-Received: by 2002:a05:6e02:194b:b0:3d0:1fc4:edf0 with SMTP id e9e14a558f8ab-3db6f7f465dmr3573645ab.15.1747157462597;
        Tue, 13 May 2025 10:31:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e113335sm28971905ab.31.2025.05.13.10.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:31:02 -0700 (PDT)
Message-ID: <3f88e8e3-1c8b-4ce4-a5f9-4c9646b6c28b@linuxfoundation.org>
Date: Tue, 13 May 2025 11:31:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/184] 6.12.29-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250512172041.624042835@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250512172041.624042835@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 11:43, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.29 release.
> There are 184 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.29-rc1.gz
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
