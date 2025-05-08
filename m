Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE506278E79
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716509; cv=none; b=rAamhyUAjRXEr/ADvOABi9g/jll3Ra/BmW4cdvKWU2DrMbdQL0qdy+x7zVGVfrjfCotJEqFgHYjY8EzA6pKDTq0Szx/y6sN3LagOP9Kfyb7XE1hg+RUnlAq4sI1n5vEt0qg2x0Aaj+G8QlFh2NgpPgNDpt/TWlla0Y4nUFv7wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716509; c=relaxed/simple;
	bh=JqqemTbAWfFy3G2dBsz3H7ba/gEl9MKRPBZd0Jm+alI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrYo5JU80y+NoJGR4TrI84AUZazE5/XJ2qWqvWR7gsJ1hU6CN3QT72cdkUufj/XFU0AIHBwJozID/TbWO7iEQB/jZOZIWb/ZEwlFKQD7WZs6/3lM29L0WTQ2wkY2FJBKJwyj+uT/9hTn3m74kPz/ibekZL5oyrBzpTquTlUNXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ItugGacY; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ItugGacY"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d93deba52fso2992535ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746716507; x=1747321307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mDu99DgpRCVho8Q8v6dvmbfmspAGucRRs+7nWo0w14=;
        b=ItugGacYx3OrjYjbQgjQejjGAune0Rb+0/LoMEIk/hH9qtaUlUvhvf0ANMW0lbShGZ
         Tw2NEvexL3BHKu97dyMKq4ymVMKtgEw4ljBW96xKfLuTyNCDJQTj1WXUUHpTfREgaIlz
         hVl30on3JDI9le27xOatR/FTT3K0g/M2KOJy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716507; x=1747321307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mDu99DgpRCVho8Q8v6dvmbfmspAGucRRs+7nWo0w14=;
        b=pi3HkqBfBxPcq2LYfmYIfcUlmwThZYpBYZVRnP81XnDveuCFXFUuaVAPVBVd7QA2WR
         Gi4Mu2Nk3E+8uceAJon0NfjRpKHywt2hU3kMKNmucPByxXId3AITZugRvmyC6+gcIq6l
         MMctrGhNVCvXRmNViEDP4qeKJrAVYTrI9DsjawtPA7y/U8x7mfbX4HBqi19C6dgh7fie
         vNDalamSrLwjL/S9tvjeXMkcAcT67Abj11ewN5CreaTdRigZ7NzXn9bQt3mJcNIggCvF
         Og4sLhfBXvtoeN9uol+i2dYuPOKuhc9Oe8vixU4tPCxEQV+Bejm0Mf93NZgadAAMInHr
         26nA==
X-Forwarded-Encrypted: i=1; AJvYcCV94/YsaaJ5lCB+RDbOTAgnSXibxgOf9ViV5v5E+NP/I26fJUuoz1TKXUu1K4RrWH8vNF9Nnkk2h3LTmfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymds5uA+gPZWU6UGKwepPcf2cAkKUnVVSx5oRA95wmsX3p59zA
	/5wYrsLxUX3kx2uelDqSInNUQ6ydpNb3tGqz/Jc0QWW2VDNO7Isz8M3bjwLJKEk=
X-Gm-Gg: ASbGncujc8B5zPwilcws6WvRs74y/ofz0jd4draiskL/NugM1dzZO42hOtAP+WzA9C2
	CLKg8SYfBNUUKPiPSwUTnItBwHF5Yc3Cx3ZfyjMsmxm5UP0OyiY7GNd/JJDreFVkjLGRDxRUWNb
	o7yC01reR6U3RTLAodu1YpZUIk0CPzo54Ua+TnKi426Vmzv4cjm7uBEPLgM0YMvqImE9hdZy/fy
	1b05VHxpTnyzq+6yH4JLsbnqYbNMYMXnBpTjMBU/m/y8KDYoVw8EnevZerf7UJxHnyw6t+xNCoD
	x61P7IZAl8+2cem/d4ntddRq4AfbCtLplPvwgejESgYjeCY10K8=
X-Google-Smtp-Source: AGHT+IEjElot/pRkGn8TyU+I4k+4o5FHfUYNKSw5kW2R7zgt8vtADtTFXrdJYKCaroVX1HTvdtiKdg==
X-Received: by 2002:a05:6e02:b2f:b0:3d9:36bd:8c5f with SMTP id e9e14a558f8ab-3da739082a0mr87711895ab.11.1746716506710;
        Thu, 08 May 2025 08:01:46 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cfb51sm3211127173.3.2025.05.08.08.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:01:46 -0700 (PDT)
Message-ID: <33b5edff-4842-4145-9ac8-805e62c40bf7@linuxfoundation.org>
Date: Thu, 8 May 2025 09:01:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 00/55] 5.15.182-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250507183759.048732653@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507183759.048732653@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 12:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.182 release.
> There are 55 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.182-rc1.gz
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
