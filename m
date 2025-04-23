Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9F242D8C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443050; cv=none; b=TYYAoDvVZtF60NgZ/nm3R+8v58S7wHaHRm/hD1XlnL8pyi7DS7X9zz6/EGfY9JrTeNXYp/hTp8Gg1oVpDTp9ybTCnr46T+UGuVspDa/gSh/bGLl+01t4bUYGpaUO6J9sZeA6V5I+xnutt5mlYT/99fMxJlG3IIImJpF+2+rL6Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443050; c=relaxed/simple;
	bh=U5ZhDPfpS+YKKIq8omJZ8lYB+4B7ZbQsmohNqr+ETkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bS83EMQ6sV7+LjlYajyxXM/R9EJXhzSlO+xTjGCd3qSVGB8TPKvvGw/2uZenJwtpZYVFLPEaNwhAGX3b1+6RAjlTTCU6Qa0/prjdoZtIceX94u9zH0/7mfrWGP95b49g6/n6onMl4J1HggIw8heYvbfUrcc1Q4+KvC1SprTrCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X3DYDO1U; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X3DYDO1U"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d7f11295f6so1334565ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745443046; x=1746047846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chdVg3DD/9/cLpbZdSTropk2aaUqeVP24/sslKciaJE=;
        b=X3DYDO1Ue2k9bnxDoJoFt7TCp2EvJReukkfo6oc+xMXvx0LhCOhneIA9ANMyfc5QpL
         LrNyq/uR+jYaMW912xGgH6dac8n0sLrCW4OcTFDPSnyavpQdimAsP07rH0ehrFpXKIpp
         qBJH80CAc5zRV/jBX9BoHFryBIbOIhQfbP3xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443046; x=1746047846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chdVg3DD/9/cLpbZdSTropk2aaUqeVP24/sslKciaJE=;
        b=LVOMLdco/N2b7XJ9Ez8n+pUI5Hx5qwUYQIjS23WWv5ZweStfI8tfdbhoPMam1qDl92
         0X3m0melNOxl/MR+2WDpOSZ/1srxtnW2aeFD1qX0nUob2Uqi8kaXDdM92WcxPIWHm5lf
         5rzO5d0Or0KZE/06EZlY4H1FDwQOP/9FrE1HnY/T00R+EoRIXMe62O78MwpKjpnV2zJ8
         TcPNKeHzIeRQZP50MrJQufaEvNoPBPUPZyIXaWpN5f+4h7a6VECss1pfcU2FHZ766BJh
         gaWRl6zVjGK8B74IZ0vwPwVzmBnOkyzcaw0DWnpMQFV+Cxi//f7f46fWoKrbF4YWCKM5
         zlXw==
X-Forwarded-Encrypted: i=1; AJvYcCW12hUrWIqqRwGnzonu08fwFfmBsIrPnzmHdERw5FW9U9jE/xap0MqGp3RYW+dlbm/naSw7d4SBR43Iqk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4UNlYihex1D/jCX4UzKSGQ6ArdJlHH3K+mOqw5tMWO7mn4xxR
	csGtH4Am5otgtVIW0LTzgYJXXbkmaLkl4yhvBUdW9cdIBiQxWjvWurzspYNzfEQ=
X-Gm-Gg: ASbGnct9f4y797YkSOdyjH6vuIa9ZyG3Vj0S+ROFN7Kk8tk4jmDP9vxKfsE+ri67TrO
	sHHIBlpX8NQE41tzL09/b0Wc9kybOOPd+CaFtwIQA/e0eenNPz1SFSq78bvCw4H3LbrD3SjHLSR
	bz3h+RVuxqVFdRhdqTRRemLZZpfsdxDHcCeKitoVocuhUPv9Ixdj3SyghfXDyQpfbyDTqfcedCA
	SyAEqX8y8qEE2y/LNlDmkcrfYKP36PXJtIB71zU/crXPrgbL5jA66NNrpU1rVoKIa8m56WqytKp
	gihsnfznPsT2QA+pPFtz4XV5DS+yGi9TTK1n4FWl2u4x677LDx2WdweY58vOtw==
X-Google-Smtp-Source: AGHT+IHCn2m04+D1m+Vyv0CL9LnnBZoMW4EoCPPLnYGeV85B+zuoNK55CnRyXvy7a+pwH0vkMd410Q==
X-Received: by 2002:a05:6e02:1564:b0:3cf:bc71:94f5 with SMTP id e9e14a558f8ab-3d93041dbdbmr1891995ab.22.1745443046107;
        Wed, 23 Apr 2025 14:17:26 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9275bceeasm5249825ab.37.2025.04.23.14.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:17:25 -0700 (PDT)
Message-ID: <6c7b5a49-2890-4db9-afab-5af337207916@linuxfoundation.org>
Date: Wed, 23 Apr 2025 15:17:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/291] 6.1.135-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250423142624.409452181@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250423142624.409452181@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 08:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.135 release.
> There are 291 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.135-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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
