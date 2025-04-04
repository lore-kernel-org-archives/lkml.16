Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1121F3BBD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777865; cv=none; b=hmW4KM3dkw2bIwIrsu5LXEI7QPA12CyUQGwPFacmIRvXiU42EjuWaT9xH85TZaOeeb9gC5L6h+1f/mf/Ij7H/qHZqL+mb1XajnkV7Us4TZp57UvaOS8DEWr+ukPpjfD09lKk8NdvOLezK3mvwQGQPkb7WTWt/wLqpx9e/kqYAo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777865; c=relaxed/simple;
	bh=E6utw/gDQf+fI4uGLBdnXPibG1fX3thq787NQIaKJ5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz3lhs1FeFM7Ixdvm6/9p4FVeA7zkySbuqUeXmMczwojRj+dyQ1/rfWGlRHIFt5Vc9hhh7W2X6FOlPD9w7odDtnz+lQa0WvDSCFzE1R4XuO0Ws+e+rBvj8XYjGfYO3KU9gboUVR2Opmva7+YV6R3TwQyhrnoDF5sVcF/rAtP8ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZC3eerwY; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZC3eerwY"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso19116315ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743777861; x=1744382661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7j6X65sUf/Y74e3CXgX1WG8fpjUk7SSrlyn4gxiEzw=;
        b=ZC3eerwYx39T5BfKtQb39p6wikDB4pcOM2T9SzXdyMu4WIMZerTvetQgc2EzVSwLK8
         cRuE816czvho7qunitzWT7nTpvAj7LccFp6C/HwGK89nrActqujBgtfEW+VSCVXOtKsR
         YNVKz67w3CX6MVTXw7y/7QPu6CLizYtYKjTpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777861; x=1744382661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7j6X65sUf/Y74e3CXgX1WG8fpjUk7SSrlyn4gxiEzw=;
        b=e6y5atPxFIQA1aIt2UgplQl9p4P8aKi1pHXX3C1ASIK4oasHWvV+Ly1BnmmtXhSbwC
         a0jBmJXC6B1Kf4itmez1j3Uarm++Qhkw5vHtplqhn6sjTlF7VrvUpXYb6X61uX2jqzI/
         7NYKL65J7WK5VYLdBjNB9SI6CgNeUPnzLbcuP4xPr3RbQnTjB4WUmi3KdcRLw2klhdf1
         Kuftl4SQNGNtkfFrCng27AaoODG1l/2fPHDMFwNrCZ3PHo1a9Nbh7MPnCN0HdERU7gOi
         ntRV46RA+Ewn54rBYSc8q0J78J+YFfbCoRKOvr1/2SAgLbOIXY8hVB4zF8UhQGbdrRoT
         RbEg==
X-Forwarded-Encrypted: i=1; AJvYcCW3HtJYixmqYgW0ox1GjEq9FvOU5PXTH6IIk2S4gCamVBC9qDcUITFYRYAKqMSeX1Em99vZj7cyWeO1HeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJAUmtr37NTGIV2eCvNcs9ZK0qhznYju42bDGFSQ7l2CMzolK
	z3zHBSUk85wbuOyYI2Z5HTcaAfHBWswvbKgkJEnSskNAE4dA2QNRpBbrgaAUutc=
X-Gm-Gg: ASbGnct9CYLXBgAaEkulvhXqM8IERsm2+LZsGNBT+deRl8MRNubiGRuBh81QSx62XT0
	eUNjR16HU3Zel2q9h1E6W2D5KlUNqx0lWQkzu9FxN/q+hAp09hRyBty7BU/ZhPG70AubDFiDm8h
	IAvzYFtZ/57EOHuoA08XCAnrV7OVVYeDGitKJF5ah1u2sA4Zc1yPgut6L72AHK/bSD5xB4LGsij
	R5lQvWaAAuBTeLRUanjDebyKJoeLLaIwgcIoGdRQ8K7H9YJYz3nRPrL9pRghSFWG5zUrMUPc0qf
	U858uSCs3c7YOnJ0LylpTu+FNN15qMuyCI0SSxG545opTf0oLd5E9Rs=
X-Google-Smtp-Source: AGHT+IEHkqDh9oJa2S3GGKDi+GP2V7X1hMJDHi7lwm71y2eKrCoA2PqIlJS9fMSkYj3RVmu94fwG0A==
X-Received: by 2002:a05:6e02:1d9b:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3d6e3f6573dmr40989205ab.14.1743777860986;
        Fri, 04 Apr 2025 07:44:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d6de79f070sm8236735ab.12.2025.04.04.07.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:44:20 -0700 (PDT)
Message-ID: <3936bdd4-b776-49a5-b997-a7c6139c5f85@linuxfoundation.org>
Date: Fri, 4 Apr 2025 08:44:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 00/21] 6.14.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250403151621.130541515@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250403151621.130541515@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 09:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.1 release.
> There are 21 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.1-rc1.gz
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
