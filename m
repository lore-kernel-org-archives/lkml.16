Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A792517B9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775552; cv=none; b=hWOou9AakX3ZguqnkRvtYHGkEo4SSUXaeNi5R165qCg9L/kKhty1OtMLNarO5rNhu7XFzWH1leSoFWkdvzrocGtbbbRW4GpJfnutUijEcdS2L7AU72htQnAYbGWYu4M+3xzWrEAQvyAMA6B9n+ez+0mXozjG2PCzFGX7pivdPgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775552; c=relaxed/simple;
	bh=JxHtbcJN/O4Vpsg3y6yxolxHrOTOCH+dF8W4h1Bq0C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P982chwFY0b2KI3jhDSb8unB3QL36MHUkkEjw3jWwIFAFu/vo6C4JGk2/LDZFEWkv9HXm8JzIUVsu8kx5OOAWFhEH1jR2PbmIYFpZnr81dMCOPYfzZI+xLHms0av+kCIS0Oe9UdqzWePYzXZsY+9c3nLBfyyNEtkVGHj1Px54tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R9A58QQJ; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R9A58QQJ"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8613f456960so182140839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747775550; x=1748380350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMrFfTENF4F3SCjFNJP/23CVdgvfjcCcQGdu8rVvJBA=;
        b=R9A58QQJgGJUeQMKdzodAysPhRA7TVHXYfJjdaOSbZn5nqOY9kxD+tItCCBQr1SeAi
         sF4b2NMS1dXYzunHn6zA0YlpU5otKL5wjMBS44CCzKOseyKp4SwfhX4Tq7LCMTahsN7g
         UvEU5f9HmSV4ULTeSQCPXJngfwYw6CiY3Dp9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775550; x=1748380350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMrFfTENF4F3SCjFNJP/23CVdgvfjcCcQGdu8rVvJBA=;
        b=i6bVrANcRfKIoEeTRuhwC+OXYB26tg5Z4SoH9or3Sa+7izFmxhfKwKu5wTVLrWtITI
         quj1O31RfZPdvDDdhLJkjx5ClwoQc/kQX7DF9R3hyevwWxTTvOAFpQbis0sNAn0X6Mv9
         uPTnrUQSiwnrSiBBZZE7M0EMmdZa7Ys3jXFt9bKCZNkhVM9mYjaUOcnN3p4mK/yG9Dh5
         OXIeVHLYplHWQwxDNd8x2s/YtOD6vXytlbOUiuYUVJTrh6O/JriNWMaovPO4LAPnrWoa
         eeL7map0kDnb/TUHXE8fdToFbRNZCNquzgAy7IFXle/0xF3xxQTs2I2nCCrEYhebV7kJ
         iaQA==
X-Forwarded-Encrypted: i=1; AJvYcCWC/zbRIcp/UArlWuqTA0k3R6WoNuwFQjbeLitFfDa/FnBU0h+FTqU2EER+XTcuZj64TQ961eNI8gdkXKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ56xXEd5pqX7PvQrfj6+RQMNWzvn7JBPVlrrhyxtWu/+KaAK2
	z9XfOrAHflQ05o1GSlAp9PCcHPgtknDlLBiQVdQvEt5MJGC8ZT5iJ6yYp1gMuRnuCV0=
X-Gm-Gg: ASbGnct4hdqvt+Un5GAXZyW52y91zatfF9/oGz/KzdjC7sjJecm7MOLHjwnuI872Hku
	KfyZCvgsTM9sWaBNz2OD/XKadb4EQ7zRCmFa6kqL8O6xMJ++N5fkbvWmIrzGRJQYBv4LUZzraez
	LUQy2VhPIZFEYGMwaPu2sekSQR195cOLU2Qr0LC4TcgLuMFL/Bv8bmFMIf6mxf1pzQ3bRdeQL21
	w9BlSOzjGRU5J9yG+JgTgH6tPp2cQmDIa2918SDuFci6ktVr8dRY5iPcV3oxtx7h9vzdoVnlZlI
	5wosKxI78TYwKlmkkT75lXri0dPMYEFrS+a1OzrfxQXjKFBZaRhGHh/DYXUNNA==
X-Google-Smtp-Source: AGHT+IH1LDM15vwRPpbt5rCMjiAO4KoSLMc0NMXg9FmElbvwrQgJ4BrS4fhsC8wXOY8J96B+wGJ9fA==
X-Received: by 2002:a05:6602:3791:b0:861:d71f:33e3 with SMTP id ca18e2360f4ac-86a23199f69mr2609760039f.5.1747775549724;
        Tue, 20 May 2025 14:12:29 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a46dsm2397257173.16.2025.05.20.14.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 14:12:29 -0700 (PDT)
Message-ID: <b316a79c-1146-4bb7-baf2-6f0727f87a0d@linuxfoundation.org>
Date: Tue, 20 May 2025 15:12:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/145] 6.14.8-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520125810.535475500@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520125810.535475500@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 07:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.8 release.
> There are 145 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.8-rc1.gz
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
