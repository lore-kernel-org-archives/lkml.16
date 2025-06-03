Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079841C861B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970711; cv=none; b=tLtG8EcCAA7+IVFk5+2SCPGUAVNpmhRxLPAXUA7esPL5BATevjdP+L12lUsTeB7OyllomsqG6fqJkNX7UaxXn8z/ymnA6qyGFnacTXYOf8IHtoW8tCUoNxVUJyJGVhRT6UNRhg9fW9GtPSR9ddvjE7EYSjMD25LhgxTjmPpznwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970711; c=relaxed/simple;
	bh=XYzDGnf3mKCdGs9+tHTXd4bAWYwkXt+9ly1lKcLWNGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWT/oY6ps8M+AAlcJCNyvtYCOdIGHB9GeipJvlyfRqYrNNZSB3PsEK6BT47hp0ly0ing7OFqTUK8XtaZv3aKTfKcxsy8mlSO3tz7tP+gIGte7oA6xTfna3hkwisP0qqYXECcKF49zF+bUVVn1TKKl1ByyB1xkvv1aJUK4tXcdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RG7edKiO; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RG7edKiO"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86cf51b9a0dso136163439f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970709; x=1749575509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ddho11kBYwcIVoWA2nW5ayFJCxEdDqgwiaQXUL60Pv8=;
        b=RG7edKiOtSpt7X8mi9g3lN9yQfTLjfScGgc6reJ6adPHGd7Dz9AkNIpZELApkFqtDc
         QCDQOfWLu4T/hTxbpWZ6EKNhF4GFF3TUN0nJNVvLBWFpRsky5DNly5momn0mw7UHMyLm
         b5v6mCuAdKaENZSxJi89PJFpDqZSFqmYpy+Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970709; x=1749575509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddho11kBYwcIVoWA2nW5ayFJCxEdDqgwiaQXUL60Pv8=;
        b=d+j3tzw6kZ81fQEcwHDGAX9QPn5pZqwo8QxkBVQHp7Q/kl4TAxtLl9UCINMEutLo1a
         6kFqFeWeOTQmkxI02tYK2Cj+teLKMKy/cfmA/PWZQtgXk7Y4PR0UqM59HbA9mju8fUi6
         NXlOwRy8PVSD23vRDQvVs498zM4l9oaw/4mJGV/yR6NTTtj7YXdkmwvlyajc2ScjX630
         NCECiAfsPKOIW8+42Ei8wS79Ncz5/0C1vEOvsSub6BcngdahGx+OQ3ee4iO44twQAEIk
         cROE+ceznDF92s2BQ6QPdl87uURkYA1PRPCWtrtkOCSivgAYSnpI7t7KJR7mrKWS1B/b
         YAyw==
X-Forwarded-Encrypted: i=1; AJvYcCUD6xod2h1+D2UvpZG7GqpY0MpNT/hAh6aBVAJldcr00yUepF01HuMgmobtX1LLH9YMk0YaOTk0EtHRXVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdmolzWg14YqWcI39O3/LDxjED6sSDTgubGA7C2YK7lMQIxuzG
	rZx84UbKO82rlt75pM7eSkpMY2it/2ndc7Jd58/2p7wq8YTGd1fPwx7UujkEYo6A+V4=
X-Gm-Gg: ASbGncsOEs23nrsERvWNl+tAzxh9dhPXA/gNEumCkdvxnIGPeR77FF+p3bKk2mz7Wcp
	xje0p+mpc6+8KZwWmVkv8R0uTFHpIVte51JEpg3TQ0g9YLyEkAElYOGOoi2ngC8dYqS1DaNku+W
	/CSWD8yFQ1pASolTRfWmx0omwtk/2JHzEiQyThYrh51cHH6MUz+LugmHwyzuoPb3IN5K/4R/HYc
	DZ/W2MACRDp9HHFtFa674wgcsQbitgzTALrdZ3lN77l8pG0JotlPgVGzTMMGg7th14owUUcGcEe
	5+rCHgtqeShdlOFfygi0vhXX2N1w6p2jxEfM+nFglLm3lX7wTjSXIVtLvVOTQtpYDw2X6NJk
X-Google-Smtp-Source: AGHT+IFIdTophs/miB9/xlTl4jvLK4OEGz+hDmt2vEX1tqhdKuzEzU5rVnUz68MbL2Fv5abeXaVDuw==
X-Received: by 2002:a6b:5c13:0:b0:873:f22:f95 with SMTP id ca18e2360f4ac-8730f2210e1mr304766639f.3.1748970708939;
        Tue, 03 Jun 2025 10:11:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7dff2afsm2340661173.5.2025.06.03.10.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:11:48 -0700 (PDT)
Message-ID: <7237061b-9b75-4bf3-8d47-4eaf456e8958@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:11:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/444] 6.6.93-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134340.906731340@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134340.906731340@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.93 release.
> There are 444 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.93-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
