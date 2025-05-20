Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127E2517B9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775686; cv=none; b=Ra+QABSkoYoyoeiOhnnRCxEch0gsD+AD2hrLo8kjDGl83Ll/65ysDCiGU8sHCOa5c1r63FeQBx5azHREBaIjaIapAD8rsTxzZFx9jFl2ZyxxqGwcp631EBHLQLG+bSZLsU93uRuNAx28qNEzpIfIhD+WWY2NQzrAt0rh3I1Vxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775686; c=relaxed/simple;
	bh=zojOLtY76gZFr763PmUNcvbsKlkE+bDQBNyoxBicd40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hr7xpb9INvzh5QbKhoInrXsWZJOUIDw8anK6311+5ysr6DZMBzopI1PUML27OS6LPlXvoXApoAxJP1LCN/Uqt2bNDDfrAyqLFgau8zVVOWvNjox/J3/op0PO2l3cQf07jp0FBNQeF2+5KzIeD+Jk4MwCr7GG5jD5b0MlXjK4MKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bi5Mo1du; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bi5Mo1du"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8647a81e683so152081839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747775683; x=1748380483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIN71OkdIhhPkkUBL5dzqoGGUrchQUGD2wwVLvrOvHE=;
        b=Bi5Mo1duWNgViwkgxLuX5lUZrQrsJQarCRVH7p1/4keD8qerOu0J6BoGqHzHAGxrD8
         BY5x6IPWX1rMCNpYhAmPW2quX7mI+FwEh4szt0HxXBxM4M9x/9kcoan61OLBdWTO/z2q
         HocD0MHnOZm/vjf5qMcmnb2/YjcH/c9dOGByM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775683; x=1748380483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIN71OkdIhhPkkUBL5dzqoGGUrchQUGD2wwVLvrOvHE=;
        b=CB3TZ5y11RxG9euY3inf/OqaGF6wCycQu03QYh6C2xUwwj3HAAjmCbSnQUMSGUNgla
         DcIkZaMCYHL2sxdb9NtKPQcKbTmGogUvMimbMR4fLcxVbpfFkLjhFiHVJKIH2vRAlVbh
         nFbfpysOo8IU86ZjJ4Y56MGZ0HzskC6FmowP2OHjDDL/HI2XmeKPbych/YitHTwlEUL3
         THIzmecv/RWJw5lcCww4SKitOlzi7LRIMmzAlpTud3uO/nuh0fgqH0aHYVu/cP3fA8Q9
         2lJjgHi6a8yy1oa7IuFj5uIlIlL0T/wlHk+5qkhoK316Yw8gL0x2Y8tYHPYsEOvyU7Kq
         pEjA==
X-Forwarded-Encrypted: i=1; AJvYcCWwj7eOIC2iJRnXH30e0caglFbKHsIFK1F28us5yaE1jAgfDbe2ZGKlR+XmPv5rBjZHGRVFUwWVS/XSTzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEkGS9taDkMXN8PjcTcLVAMeTsckXa0vGnYbDRd7zSH8Ht6fA6
	1jCPR90MBHiJHdWkk8nYQGqr9jttjl1h+kxazqAYBHqR0LkE7VcFzgtD5URiCJAhhiE=
X-Gm-Gg: ASbGnctoEnyAwxwBCqYiHEg33OLAlq4QIgQI3GeFZXVgDBPrjrh2H1jJeI77rCtj8nB
	VgbSgHkmrZPkJV+ZCjak86yZUpIZ751Ha7ryjxJbR+4gIuprXknfWa5DixDmD54d1gqHGTLCWCW
	+Hd9EeV8/sALwWOY4Mkb6y8T6wdam1GswI22GrjBVNUNS+V9S/Oel6/0HgwGCVahstCUrfjPk0a
	QOmRpCxDWIJyGXCy2mlHkp4Ej8zhv/QIhV2uwsKtBMK85h1g0dfQVXHtHoTOUbC/TTpjnOg8VLO
	JiqT96+zWjq9T0VDAFqejMJLaBNM2xCvmbnQYAP4UX+uGGZQyS2cmKvCSDDQFg==
X-Google-Smtp-Source: AGHT+IF5gRFWN0+dvmw2Qvtr6a2oalq16YVeLrmVGDkTHf9V1z0FLFjowunDN2PSJeB2qQecf7b4bw==
X-Received: by 2002:a05:6602:3991:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-86a23256b96mr2323304839f.12.1747775682783;
        Tue, 20 May 2025 14:14:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea966sm2393379173.138.2025.05.20.14.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 14:14:42 -0700 (PDT)
Message-ID: <f9779eb7-9a73-4f1d-90be-54bcaac26bfc@linuxfoundation.org>
Date: Tue, 20 May 2025 15:14:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/143] 6.12.30-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520125810.036375422@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520125810.036375422@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 07:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.30 release.
> There are 143 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.30-rc1.gz
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
