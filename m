Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5F2750F2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715679; cv=none; b=S+Lmg3pboSlBpvB+HWn6W44enRCbULeECJHUbMa5RAPNozBNMZc0IVvGexFk+p1wPHTHdu9lR0MSVI/PQP3NMNKKUOZw2WjvPXI6wV4/xRLU0l77Cdfg6JEU6DAX4IJuWsdpOMnT8uYFXPSMcVSCaHJpKiDxE1Ftvn2JAW9ACf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715679; c=relaxed/simple;
	bh=OP0WRNpQ3AhTCII2JqnV9mcyFJ8DbeYGPnHp7gBLYfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Db25L151KQwTGnlR9dSib1T1nIq0jxG9Vx+/bGElNtEgDFuJx4rT8cBzqnDsLqlORYGcLtZgE9fHeuccFhKCUxmf9LAIVXrFD7X4KTWEuDCV5+l1vPOHcopzAgdC+U62O/ZorBJOEsSTCVy+voljzJN7sRSEdNm51krpAGF3nuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QkzQtZO8; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QkzQtZO8"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso82357fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746715676; x=1747320476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbKXS17FLCeINM3f26BpfyHxYt8ulznWKq5GCJKKZ7s=;
        b=QkzQtZO8aY6n3+WjKEIL7hwWinNpcpRYlo4iqe/lflSF9tRKi/cvmluvESHQi1feNi
         9iRHotQSUD4gIyl32OQV9tzXIvCaVzNzZmnN1dKRkJixlXjtQi+feAlCtfmMQ/ctMN6h
         ZoEIMxcI60owOdTWdo3u5OqfdKfEppQnGcx0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715676; x=1747320476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbKXS17FLCeINM3f26BpfyHxYt8ulznWKq5GCJKKZ7s=;
        b=RSOmktbasfvjkh0tJyLe7QPO7hTuxVE0VHyEr9lHhFjTchzf4BIBoXWhgg/8E5YXKm
         CzeuEI+jV8/6htTE0PldHjJ2LQ9HqMxrjTz/NjovBVE1qFNER4Z0quZyHcZRAb0nMz4y
         PqklXecZNQdx8XamF2L/NBbCS5W3KTzAtpIU/ca+csIz10GgCEfYIBl5dPZUm6l7tsUp
         jt9RO9wF27xSVuZVxFPYWiFNXUvspH+fnDkMSHSqq49SVw/jRP7IFvoSivha2tN0YLOZ
         yEs8gjhV+22NASIsMXViiJU0iBTj20bedU0R3VwfFTama0nzkxC6OtVXbp0mR6YJJT3p
         bdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXglT8tsBKCkfvZwPMzzWUcxKcW1O2KlrOWy0PV6dMeB4Ui/RGxSYRJ4/JsCGaPs+bXI5FJrIZaD1BtAHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkld1ifTZVIvtsycvXdd5A1vylIahhocxUXRfpPHP4ZGDB6hI
	bqYgtmGO3CVgw3u9Hby+QHHU4a7eiOgGmD+R+RQ8tUhDSNoKaTZKr2t/81BgEz0=
X-Gm-Gg: ASbGncsdkdOICVwNNU4Vf7D2KM+vR8UeK2I0aJVbS0hndiOgp7AB99O9/hynfdnciBC
	nDRWULeXk7VW7euttUhy8s6RsLRgAP3/G1e4LRac1kwdeUNR3VqhuPMV2hJEiEW5Csi1tJ0Dg37
	R5u9ftEErXMbVaXBBMxlM7dEYmJgFc53h3RijgMZVAxSQAE/qqeR2JdHAcorp5ZHRdXWnufwWIb
	7h+d1XdGR/cGphRLFjEfIx0sArRQFd1ecK1xJQvQAeFnuX/iTVd5x8m8DhV9P5DomFiPqIsAchb
	Kus/aNumRf6qQvia1h+x7wZfgnss8h1qNS7zEhi/Ffrefj6h7FE=
X-Google-Smtp-Source: AGHT+IGEA5a4mOTrYmH7D6XLU6ZecdwkH7ReVPSCIEcHWSuV4+go/qkk5dvHLhAUPmYAL8ZzKUhwxw==
X-Received: by 2002:a05:6871:20d:b0:2d4:d393:8e47 with SMTP id 586e51a60fabf-2db5bd5c4d3mr4693133fac.4.1746715676231;
        Thu, 08 May 2025 07:47:56 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a91977bsm3220210173.54.2025.05.08.07.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:47:55 -0700 (PDT)
Message-ID: <e6503d21-6e95-44d4-bf84-9412d61d7605@linuxfoundation.org>
Date: Thu, 8 May 2025 08:47:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/164] 6.12.28-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250507183820.781599563@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507183820.781599563@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 12:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.28 release.
> There are 164 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.28-rc1.gz
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
