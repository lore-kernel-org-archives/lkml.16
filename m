Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FA26F44A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442789; cv=none; b=Cc0i7G/6VXteUd1jxstPvK/8XD6lEZVy5srquKIcVVdadwBTMvarwQ3LNl/HJZ6I2CRU2p4RLnWxrWq6HPHWE/7lgO4SYHMVNB20RQOr1yf0FNrzuKHII3CepKdze+aW27sCMRcVVHtQQEkw/0EX9iQNBbZrbP3O0OXm5gj/kYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442789; c=relaxed/simple;
	bh=E//82LOYPiTmGcYh2jIvd7jDfS8n/1+ryqbT7Uroeh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnkgszII1Ehyh/qT1zNuJLDkz9vEELW+WOyDwQgMhs7vbK2SocA7TFjf8ernUjDbH+BENZ4QIGQ0ojHT0Jj4ShUHmuFs6EUG+EqzjsEQsUXqUdExMHrr93AiHrynpCAFjiX/APifmawptKDJs2nmKdC93r/IIsz0Q6FB5oT1i/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZybXzxhK; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZybXzxhK"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d450154245so2681745ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745442786; x=1746047586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJl4xnZJ7CK5VljYcazrir4C/qZU01ruca5B4HK79Vk=;
        b=ZybXzxhKJf4v6sYq6+lA/s3fZIYwqEBqdI0FZIEanOBm32HKNBbyt8MI3yEsYJyN3w
         jOU7UyEgraL/vBNDNoMARWIRKZiskN0akybUWhxTMb1A1WYEsOexJJBRLweAC9bqIJ/t
         TwPRIJGTh8e/e5vraa4Fba2z6poa1qWdliC0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442786; x=1746047586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJl4xnZJ7CK5VljYcazrir4C/qZU01ruca5B4HK79Vk=;
        b=Diqz2OYU+LXEjZObG6uAGwOYdSG5pRpEf4CbVOa0xiEkSyytbqnQ+Vt/G2zbBS3jxQ
         r/DxPanYLfwGAf2Mu3aOPFZiJPeiKrdkBEwGRfs7c7UWMr0A26o3/lZZmN4J34IJly73
         bVtM65zrz3O2z4udc+M82V+fFDKkYDxckTBktosItROK87DGpLtfObIBUj4rtVNiaKN5
         JPzt2FYJckwDn+U4wSKq9i/IN/gz6TCajMNqhYUCr7PwhB5/ioXpOEaPPCV4HceIgGNs
         SMUc9s/JfuEPlBFObvKP9cHgXvi0hWLKGOpGTrfe3jyrLsQLMaS3J85za7O7OgbBBMrG
         eMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm0vxM2OjYKtbHpIzaeJroEroPZRes3MBEmzZLbWGTMCdJEqtfcL1FXZ2uR6LXMNqfc/GcOvt3Y3JnNjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztnVleyNs+gTj3Q3T/uJnJWsSeb6z3kwsKNBM/jBnd/JXadlKx
	7rXtGf2zRWgpxi8P4EG1cEcfjpPiwg7ZOrIqLHurqXSSYn56NfZpZoE7MmRLo5A=
X-Gm-Gg: ASbGncsLvn7NqUxLTRGxXUPdPcICVm9th9a0kst1igehos3ultf/JcPcUGcjgjtM1ce
	um076kkxw6oBZEuqgTRX35RnYrbpeqLyg8OXpv6kqmzEYESxgC/QJTJNHg0p1zAYup6aHS93d9/
	MXad4nyJ+rASvQdnn2fywTAz83MOdJVUAhpjUkbpUXZaMipTSWNzcRK1lO5/1S9yXOhlq1VHGSf
	894RdMcZTJ0GnyubHWswRIn4eGPkL/QHjEF2yAziau2YSzuN0ovWOfuMN7IjPELjLwrwXYzbJLq
	hl1bA5kSZRboBUIsW2CokeXhvykDWXWnsQQ81fvu9+Mbyi1C89o=
X-Google-Smtp-Source: AGHT+IEyZDCabZuyz0Qo8Ncebji6UII8VsX1nanFNy6fPYhte3F9BgT0IArHsl2sKVHW0CRT8FjE0g==
X-Received: by 2002:a05:6e02:1d9d:b0:3d8:1b25:cc2 with SMTP id e9e14a558f8ab-3d9303a0901mr2127865ab.8.1745442785773;
        Wed, 23 Apr 2025 14:13:05 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a37f9c7bsm2977167173.37.2025.04.23.14.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:13:05 -0700 (PDT)
Message-ID: <23e1eb72-c445-4aec-9077-cbca66525f48@linuxfoundation.org>
Date: Wed, 23 Apr 2025 15:13:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/241] 6.14.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250423142620.525425242@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250423142620.525425242@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 08:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.4 release.
> There are 241 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.4-rc1.gz
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
