Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C61A0730
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970806; cv=none; b=VpzOIovtmP1LfwdYoXXagHQYjaxcKfkroXcnUwG2D8Vwp31lHHZao410CbiJisZ6drnZjklkdSXOgEeXnmGRThtA45WMqH+xXAHibMdWfi/eHaJEToBmGxsFn37glecbBWmqnD6+BwEL47HLVhr9XSgQlJ3itirnlAfkxwqm2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970806; c=relaxed/simple;
	bh=sBXM3gHgjvKEO8hWEaFtjRYI585AMHNix0vtsLpfcVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FifTN5p0QYVI09G08peo9wo0JeCQAXacXq9Tv/0WWpWbYWTzfAlsonfvT2JLnfIrpK6etflWA2BI0luL990nHcDLUEarG+TGb4ByNmVRqe/wpJ77Ckj4OJVoPaH0qDbLdQDPLzWy7exVnL6mSfVmsWsLr2WqWMeBvG9NJCGr8d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JTx8qfys; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JTx8qfys"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc729471e3so17343845ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970803; x=1749575603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A/eTuTh2X5YBHZFcRJOaPXK1QUqrMPM1Unydtq2yn0=;
        b=JTx8qfysD1+QjrReV+uUoCXtOIu0DGYhuiC6+dmjhzKqQL5sm6nNK6EeVF55jf5rry
         TjDDMB/EtKaEg5b7793w3ApG0QVIy6pE4ucUe3ev7yCWSfNBbHFpayteZx2F/UtU1Pu4
         eBrPhOGeNRqJCoLMgx1ncOVKJeaQvT/GdFC1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970803; x=1749575603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A/eTuTh2X5YBHZFcRJOaPXK1QUqrMPM1Unydtq2yn0=;
        b=KGGYU5Af3rAwg3Li9GBsia6MJUt6G93TyU2JwUzMRg4t99pCatQSR8Y8V+wtxYoTe/
         e3lcT8EigUL9gY63botRMVF76n530QGVQl1p0lXmkxP7xhwjXbZsndqaO+LdVCkr1//Z
         2ErwvghMMcyHKxT7onUjIduMiOh3igZWvF6WyYmT84gniVIkzxMwl+eHqElEU7T9FS6p
         OVZWaFJvBjo+hpyv1f3CcX/9+ez8QQzl7IYIBbrs6tb8prDAXkl7S3h8KMu4ADpg4jkG
         mQlL5kUddaXUFXn3f5+LEEs+gnx3TpFbykg5nvEJCnLJLk6IxSAOqPwMEwogf8jPEmGf
         C+GA==
X-Forwarded-Encrypted: i=1; AJvYcCUnEQq1Ni42q8W3qByzNJ507PTEF4kBCj6iFeVg1QSrfaE0EqAQOfIqTNH9ypyFWkoUeBsBIs87xtCrP1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bSoWQ6KoPBMaa8RXDYWkCPZ30YB4NLVk9Xsn5SV1PTrHRlM6
	67gBT1eTUHTmSBCdTSDQT97bqUQg2hcvXK6u8cnLl+7GOX45RNXaquYNFkT+r70Fr8k=
X-Gm-Gg: ASbGncvjDKogC8xTe1f0BimM3PJovkWB6xdaVsr1Iiq1cjTMk1YNHdvxSOQjsNpMq8h
	+ckyev6KxXAhAMyL6ZZmxe30SuOcYb7qXZ0IoS0R86poArkwNnVC+ar/RS+hIAfRMiO6QRFKvPS
	Tswc94PBErmmr5Z5NMV75TrL60QGDfASSUKtzvK6boCS3c6MADbwShWv6ysxhy5dm6CqzeRUczD
	AI3EPhPgpfOBiPJ4KkAOBTuKZHZQyBB+A4ksXkqm7lcHjzdzNlxXN8pPv6G2/7Ww0d7nyKZ9jsu
	zdNCv13JVuMp5bMYk2fsKcrWd+NDk2hoXOKC0wGuDQg9aLsuuAF+T/9qKsjMaw==
X-Google-Smtp-Source: AGHT+IHIw1R3UTJPgqPx+MyExssPYvY5omY+CdwwyLuqJPu3o2bPRg5Ahq3s7i1xBS5XVSTi+FsSGw==
X-Received: by 2002:a05:6e02:440d:20b0:3dd:b556:18c5 with SMTP id e9e14a558f8ab-3ddb5561a42mr50229445ab.21.1748970802790;
        Tue, 03 Jun 2025 10:13:22 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddbe2cec9dsm252565ab.10.2025.06.03.10.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:13:22 -0700 (PDT)
Message-ID: <491ec349-54f8-49c4-a740-b89a7b79da72@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:13:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.4 000/204] 5.4.294-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134255.449974357@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134255.449974357@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:45, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.294 release.
> There are 204 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.294-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
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
