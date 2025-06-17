Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D62264B0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195097; cv=none; b=ZZOUAv5YsPJmaE3zhzxXSjtt7qg/aW012GRA0KHgFTxDKPnoujCmFxTfrTGRXKQl0FuhK8OnvYUs1hQkr3RTfY9hgoQS9DOIjjq/Tn3qtqojh1zVVndpCGZGJHeXg5dz/YJ91Eu/R6XogX89+VwmxtmMYg5ci8s7VUgxrmFsG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195097; c=relaxed/simple;
	bh=TVwhUKNJWh38SAaQKE/6I1lTgFb1qJ4jUs+nTHCo20k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMNjchDP0XaDzYJELocW3cxciyPZeYRYipc9UlKCp8HUTHsmvYiIhtG+aWVQn/JIfxGHLre30DLN98e3N1eLP/ufTznUGpcaF4/6CsFZpMj5JW2yjLXh9Rb2TH4aTlvvzdXUzVno3SWlZgNsA9KIMVLySjpY4Lr/tw21imq1uKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eWFBnTA2; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eWFBnTA2"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso20724345ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750195094; x=1750799894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAXYvMlPvJqgHUS0OPvSDVehGX+5oMCjweHYTWvK2RM=;
        b=eWFBnTA29LDnfvJg4ysQlG6NsPZIwMkwuXntp8iBzEsOTDJQxfmXoxcMhJGbrZKHA/
         /j+tdAzvaMVmt7fss5f82KSgskbQ6XrBj+HZWGvEUFaxaGjPankrYskI0xJQs/KwiUfL
         Wgza4AegK9FPpM/OJIGQWF8UHxEqhYVGuQEDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195094; x=1750799894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAXYvMlPvJqgHUS0OPvSDVehGX+5oMCjweHYTWvK2RM=;
        b=u2QCr7b7h9LXy+AM0u3nSrioI2EGZLMUaY7eoJz009RhnHVg2DOXPDr9eCd2Eo340/
         84WYK9OAw+ZN5BGmdfGjRu6eYDY1J6QaU5KrFuzQswZ9wxxIwMRIZeDfn5LqcnhFL71+
         B2i2l3ATmmgL/SDVj+ghrZ4UNLTEn8UcIYFQGgfAnwbETf684GJEhiSY8btk4Ez9Mp47
         y0JcXzLE2xARDr9j2c0iE1FWSB5ClmjQPnSG3kd8kyShe6gQLXmsqjiILW+0GYB+Atme
         iEFur+e7XDD0jzcO1WtbXlBO5wicm3+L7OuieLjG9PB6P/WS73FzR6R49bd7oqTewLzA
         0KsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXitra74CfalksWYiiP7DYfc/vWBwtYiK2cmmkqqAYdW8kx7hl3YtPMnYIaefwLKOBfeiW72HFcQgzLT4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOQXhPCLcPAXeYUvKNIP+/lmmbEph0S9MTi+CRUxdX+xhr81G
	R2ZMwnlUlgDrEc0mVgMLN0x4iCZSetD5HL8PIY8xbuqGMKqQPEn2eL5kvPg6v1L4mtQ=
X-Gm-Gg: ASbGnct7RHwwEHt8HsUmLO9aww2+EDJnxcyW7b4m4vnTFqp3vL1XMta+I6SL770V6JH
	TTysnlfJeA8/OMmcZ/v2LkaEjB4zX70Xmxo77oNvHQMvyHwml4Ab/T/FWzG8ZtoPQJxStt2ev47
	zYHSuDpmvS1EBCKYv9SUzOvyRyAMhZETmgibOZIv3rh3wfI/VQ1QJZ+m8GPDaK61PJmb1lBkFL1
	U+UwzNdg7WJetIiaDV1oVJ2G5WsYmoCK3QQVtDMeVdmcBlWwiLwFl6AXTs64idSeCXEkzPLYDdn
	sHh3ur82treY/Ll7ugyxIlhNR+nsJk1iPorYCbzdW1LMYhwHSPZeg2x4INfog/uXmNRgJNV3Mw=
	=
X-Google-Smtp-Source: AGHT+IFQzbyhjfoaqCDmfEEPJM4MU0tVI/KTSBMdCJnveuC+5xBGYbQnQS4n5WKSyNltmb2v+iUGFw==
X-Received: by 2002:a05:6e02:11:b0:3dc:804b:2e74 with SMTP id e9e14a558f8ab-3de07d6429bmr174884875ab.19.1750195094480;
        Tue, 17 Jun 2025 14:18:14 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149c68bfcsm2392917173.66.2025.06.17.14.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:18:14 -0700 (PDT)
Message-ID: <f373f634-8d37-4670-b119-940a8fc161f0@linuxfoundation.org>
Date: Tue, 17 Jun 2025 15:18:13 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/512] 6.12.34-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250617152419.512865572@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250617152419.512865572@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 09:19, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.34 release.
> There are 512 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Jun 2025 15:22:45 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.34-rc1.gz
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
