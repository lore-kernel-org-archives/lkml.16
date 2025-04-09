Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C9277801
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224794; cv=none; b=Yv22wOk0gzju1z6MaFKbXZokmjOpF+AQbGsHrfSTizo1qc64eDS6Bb3cPpUSJUu0XyikVjXYMAi2KZ2DOmj27oGQNuQTI3uA8i9B0yKauha4saizqTE7B5uaIeXt0DLYRsaI3MooFSu9o8+DKKf8q3ZJQ3ykYboF6riF9tDuUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224794; c=relaxed/simple;
	bh=ev34B4BdC9WbGNJUDSR2Oo2ko6MrEuWxcqh2POvhMM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6cSozr1b5XCLuyQb5Q09JnG5k11ItZoDBUr3/ivmZTT7EIdQ+nanpQDidKuuDutjPL152Nv51eox6/zxSkRkAKf8dsa/SFSWX+S/DwBF4dSEpPyyGtyVwTjzERgNqBwbEYBlH1I/G1APeJAfPvBQLfbqm6O4rWb4ZN9Lse0mgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cfIimZFQ; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cfIimZFQ"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f8d2f8d890so3996376b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224792; x=1744829592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uprOTrpUfog8eVjEhCIqe4mihJSdQCDY4xj+acLb2lY=;
        b=cfIimZFQwaR/6uJN5YEUoEDS181WmG+MXHHlskBDii9T8w49dJvp9brLNUDLkRKO87
         BdPFsABJM0Ihw4dYO0Y2Sl6qLxTutywHh8mY+FpvkhfVBVPop76TGvdR8tD4rXCHtuH/
         AnLrZu9TIqe7/2MWW1zpcXMCPp59A0CGlwhio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224792; x=1744829592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uprOTrpUfog8eVjEhCIqe4mihJSdQCDY4xj+acLb2lY=;
        b=EeSQt+iRP7WCN8Auvmde95RIL2Pu1scdvOvQgKxoIqze8X2tNLjKwI5F9BuWMPmgDM
         o6JxqUjHc5HDqlefpk/3PbcpzCol4Vt6YJ0aWx0pce/nr6ahJJkrL6W2BLBhYVrkHeCD
         garsFDtEUbDs4eRLeoXn1NP9FJApelBumapaulaLW52AmccfI3wpqq97PzJcwjMUM++s
         YdQRMbPfgx/rfUTMZcK8GrpcVtsl0wAATZ6RSB6F5Dyw7yHAjkbAZevLw7M+oxImdOSI
         g1lmaw9BJVl6Bxu8vxgytg49vXSXBFIdU75g+4TEdeizdFsQS+ZEnoCLh946/xGXJKKr
         p92A==
X-Forwarded-Encrypted: i=1; AJvYcCWxb2SJs1I0DQKEOaDmJKunMvYyUh+5XuTcR5ExzrY0u4IaPKLvr8VjRQJQnIuM/6tEUz60saBDuJ8defw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJn61ZMaC1DHHr0TRsMUxa7LIOD1eMAAta2Jrc0jfDZ6PCjozP
	qe/IQd7tSVQNfY0boYjH9SrsBWLR0qNUAGsWynHCV9uSXc+MaRU9q5M1gCRX5nI=
X-Gm-Gg: ASbGncvk44JYnhaU0EZg6SzuOocgAUUro1saD1ikOwtWswHE8SyQx9GgGIi3CNuyVCF
	6nCnN0g9f6/N3ISYyXjJU8AAIdai9dN4c7oE9E1qNE85YHd9PScK/u71kU2Q32GtPpoyxUznYCl
	FbS1uN90zqcF2BH9xACBdLj2xQH359HuV4nykwImSexdYvTyBLW6OB0RqAYbk9mew3BUQs6OhLC
	Ll545pcJttTV1IUmSnf/mh7X4UKNVQdg+ipbJ9NzA/ivwIFv3LhAqBHb3PwKaoll1tJHEMwJ0FQ
	SxEiurTH0fo9/8YEFRCo1VHlDpEF+2QN8dRsU63JYXPRVG/4Ts4=
X-Google-Smtp-Source: AGHT+IFogSAftN0uvxAUx3F88QuzGur+Ouhi5sC7Ds4Nb4RZ5YSZlk1EYlRWrYgi5Mtw/kI0xiptgA==
X-Received: by 2002:a05:6808:2a8c:b0:3f9:3c2a:e40 with SMTP id 5614622812f47-400740a0265mr1871379b6e.26.1744224792049;
        Wed, 09 Apr 2025 11:53:12 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400762d4861sm259007b6e.23.2025.04.09.11.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:53:11 -0700 (PDT)
Message-ID: <84e6a13c-1dc0-4405-ad56-442e5f288aa7@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:53:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/281] 5.15.180-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250409115832.538646489@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250409115832.538646489@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 06:02, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.180 release.
> There are 281 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Apr 2025 11:58:00 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.180-rc2.gz
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
