Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E52AE6F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986652; cv=none; b=ILzynTmUWp+fjb4LtLqFMkII6r2Q8Ue5l9pwCnM+ZDxED6Col3xuFjsH1mnz8GZwJiRj73HOBYhY3+dpcrjKxez8SteV8LkAXcSmY5D0nHOwQumcTjQ/eeNKsKd+MSYWFr5H9gtRuyhy0tsJwhNPHyehAKqbUdHS8eTcRgeGwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986652; c=relaxed/simple;
	bh=oVL2kU5gjstzBGfXvp9kTBe+PNQYdWCgXca3RUgd+N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8XTS/zcr7MhcGlTa39C991ccswzC+k2CYL1K0keAMkWJx8/crzspbFZMXnxMkOrmZnjSWYnlyxiSeOKV1V33e5LLXv9oNF3UUufi/BkUMvNF6ZCL+qWhaYwgumlvNFAmYMu8VrKSnHdLxVJCgKZA/I8aHimwKyZPyIlEEUU5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IeWa26oS; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IeWa26oS"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86135ac9542so61413639f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744986648; x=1745591448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5zbYlhCEZEOrkhXJJRlzWrW7M63mHM4S+7WR1Jrdgk=;
        b=IeWa26oSrWib5Z7OZoCykBgsO6okKwOrqpYx7aO3u/5tyYhWP24CMJAO6VxBMVpcPl
         kj0FvYcM0vo76UTGamV+HghUVndMrfqom0keSblRNzvFXrbvwJyRS6YN1ybJUUgQ1+qT
         /zLUh0uNs7N9J4r/4J4nNMOYYzgDty1DK8jOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986648; x=1745591448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5zbYlhCEZEOrkhXJJRlzWrW7M63mHM4S+7WR1Jrdgk=;
        b=CLaxAXLxBIphC/VBmvh5a13jx3Jgvoskug6AipvgBeh53s5py3pLTR3TRqgqZtOYrp
         lGfIzOMhhNMiBv7agzwCk0JCap0wRQk88dn0yDOra483blT5DXeur9TaLhHcM94SHPEx
         5hgNcqJ5WqmPdFIC49XWuer3PRZ+v2iQ+ejdetyXbax4afiKaJ9tK8hojv6ccNjyspbL
         5veOjD9ursBsF4miU733XF1XHj+PsrExvWZCV+HDDykA0W71ftdr7LqfGcNuOT//pVet
         7QEoON7dVwp5QuSSFhvQo8jXf+UI+V4mZrb476TYBvq/cw+fogjSwl5AXYYxc+nQ2qL+
         9uIw==
X-Forwarded-Encrypted: i=1; AJvYcCXPEPs4R3fke+rKfG8aRvBle01a14iKlAzTve183YGmZl1gOl4MWTDhE7c2f88pa/vfaYQqlyYzAVSIt7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDRu+6IYW3htMJylOqr5ILUZMBVXSK/MEALFW9rzow/zQD3hUI
	wEMZ5TMBYK75yHCF6x5aXnbV1YDJB9ndDnhOqfo0GzH/UAlbkp6pICZ03A9o52p+E18aXoROqWr
	2
X-Gm-Gg: ASbGncsSvv9hb9RymVhl2us7kvZ3ggyuABCHs+UgjugkozzrrvX1vyhZvd9UqzCv9Cu
	gVivVfmEZ0vw/m2v1drC4cSiNov5PoFxGVlL8rV7rodOmzXxdzWNsMaaQH529IPsv1Fg7jJPPKB
	U3egLTxAX8SBUDfwD1xDUBizlq0KkC86AAz5yZA7Zr+1n1wW3tFSPNG80thZksVZlT2FudHn2Gc
	lWSS+n1/f0YflV4it/unn9/Z8ku60NHgO2U8foUUo5bchRbXAAg67b3Jtg33NLA88k1ihwuRFFV
	XJUTxg/DfAxiXpphHkHXaNJyWfeHcWQM/5Tf6eKoKxkLOlORDHpzYL0gSE/7tg==
X-Google-Smtp-Source: AGHT+IHg6AQYt64hVTa2MyJj6PvmJcGkPqJ51JrQFjKLFrY6PtlcvN7ICxYBR+rpFCkNIDuYhjWG3A==
X-Received: by 2002:a5e:d718:0:b0:85e:22b3:812b with SMTP id ca18e2360f4ac-861d8a19580mr353447539f.8.1744986648413;
        Fri, 18 Apr 2025 07:30:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a37cbb44sm468122173.26.2025.04.18.07.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 07:30:48 -0700 (PDT)
Message-ID: <5c0ae486-f29e-4a7d-bca1-434c82d06b23@linuxfoundation.org>
Date: Fri, 18 Apr 2025 08:30:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/393] 6.12.24-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250417175107.546547190@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250417175107.546547190@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 11:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.24 release.
> There are 393 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 19 Apr 2025 17:49:48 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.24-rc1.gz
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
