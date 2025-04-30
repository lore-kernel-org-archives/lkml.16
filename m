Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800525DAF0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028671; cv=none; b=KEWaiDCUYl7UMVW83klryxWw9vBRvzXsipe0YuX/nD/L50BUdrLUBNaUG+oq+Rc3GMr/nRTlfAOW9XshKT6E0Le7mUbDDaRl/vCcaYUnrfB/9EXWAX3Ce2So0uo0y+cUPUr2bFPJ/B+BbT1G0kJgSS6jEH3Dfj3vns4PsoOpuGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028671; c=relaxed/simple;
	bh=icooOvG1MON2fuybzZe5mX+3Hn69WjdTbAsnDAWzhG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6KuXh0HauaUJcJMXnTMK4j7VcFO9J9br9EbrLBa+YG+SzVXAAPaA+x+17e4TUXlms0KzTW30QEgQ6xEbUIupSnP0tCAZ3Q4/XYD+nVu01p4XeXjvHUXQrE1R6EqOPJ/7AHihUZC27JXCpYoUrUAXNMeyPOQUS4rB8Xk+Q52zus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hboNLRR7; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hboNLRR7"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d81768268dso65309505ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746028669; x=1746633469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in+6deFjqSfAc1zu7tlNRMCOyeC3LE1Gyw7rsr3duwk=;
        b=hboNLRR7Izfk1ounpUeXUkcdKfplJJiUj12JXKyxtXmlWVXlkTPvzbDRCHEu4ByWuo
         lnJQrHLtbZzxx8rL2tP+pPTEAzTk4LjYgh6bIEXIa+5zhN4viLzOhIWwSPvczWEVRyGM
         lb4PtKzV1bMwYfKr7OExb62dw44Thld66FhAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028669; x=1746633469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in+6deFjqSfAc1zu7tlNRMCOyeC3LE1Gyw7rsr3duwk=;
        b=LoWAxO6hxlkvrQHrnmxizi/o/eVDT9OhpUfO3/CehEe77Sei5sBtlzjCMZdOkJT8nn
         UJwqqT4eo4NffjdkDZyOxUGPLw+Mq69lWUbOReyfD1dey5YVw2szRMioYOzDLNGXE/PG
         ktQCU6IhewJfb7Av99SzSN2iKOTwsGITHMmqjL9nLpkcSKOBPKw/uwjbO+8n3ytkQE5m
         pwSKtn+ITnQdeMtnn9rgGLXulKXbph+WVa4yWopBr/ZHtzFKwEuC5s9Y/bly8t0AQj5V
         B/I6CzNmdl1Kyb7uSvETWCkumvxUR7GkHw2l1v3iAppmYODoaNtautGnajtoFq2iUyCo
         aRlA==
X-Forwarded-Encrypted: i=1; AJvYcCXU00Zd3dtEHG1JIdoqHtp9EbLrTmpBYQ2VWcU1dthiY8lB+Ugy+pgmg98bPpvL4NYOV0FOJ/qsiUUu96k=@vger.kernel.org
X-Gm-Message-State: AOJu0YygaH3ntNXLlrtcO9wgEglNY+awR1d6w8+/z7VxgPUdTE4q9sHw
	Q0tFPbgWrFYnkvuDvFItnFFVhwaGBzyn6qL5T3wGLZtrHwbnyxvau67sN5XRdzw=
X-Gm-Gg: ASbGncu3RrkdEXBlLX9/k86emz7fB9knlWPbNT/xDbxhrDNIqOMLOT6kPp64QnUw082
	AafNKYH9qsCJWGMpRX/u5ZNiKm6gvhWdUbOTL8WvQHD0tXOZETxn9HsoPEi6cSc7sst9DYluALz
	+BImGMrdlmvrNGh+W1S/AxpMa9IyHg6Z25M/yxhJjnVkMA70apXyqkGRKzmlPGA6S4ssRN8o/7I
	LDf0T7DwypWQ4tvcC9IllHxObzR40eiLlcUeUOmXs0BwuCowaAL4GPlQRKPdtC3xw3HUARJGflp
	SwWBtK3QhDS6txyDCZxaq8N0eP/kUDrBQTCzTT4HUgVPluMKVH8=
X-Google-Smtp-Source: AGHT+IGYNWe6JaNQWYYAzHPd9GJwHWYQBcIrp/Fmzu3Vd7QqTXMxBqlXe2nDlYYI8grBym/KiaLjMg==
X-Received: by 2002:a92:c267:0:b0:3d6:cbad:235c with SMTP id e9e14a558f8ab-3d967fafbf1mr31807335ab.6.1746028669266;
        Wed, 30 Apr 2025 08:57:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862e0eee0sm809734173.25.2025.04.30.08.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:57:48 -0700 (PDT)
Message-ID: <b40593ee-e527-48db-8e53-6973b3b94858@linuxfoundation.org>
Date: Wed, 30 Apr 2025 09:57:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/311] 6.14.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429161121.011111832@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429161121.011111832@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 10:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.5 release.
> There are 311 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.5-rc1.gz
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
