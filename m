Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9C12CD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157508; cv=none; b=EyljTt0fTnnsvkfnFpV4XmiN4khQohn7xX2eG5DG9CWZQz2hL5DnUQYZYkUhrWRfWf1lycMmK4bPZ6ldJHb/GDBLIHy1K8AWAbxoA7eqTMpRtmcFHrNiTKj4LPs6h6nQddzxypxWLpiqWBmdqxqlDZwriT85ZYJMP6mkqucL/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157508; c=relaxed/simple;
	bh=SxZIwTrJ62NdlaBYSELFNzFfvVHXOji3aJBLXzgDJCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdFupsWc9UHljvdafMeKOiPytJE/7M/57z9jzfZEV45zUd3LE1Dw89aBYzOOJcr4tjCJAan1GGIGQH5pQDl5bWsnVQoDYRjWk7u0ejiT7cYtsjgoijy4GEpA6z4a6+Ju2nJeNcTA1BBfOUKjX7b1r4Tqa6LBzxUHnD+Im5eOGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZydaXYus; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZydaXYus"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-864a22fcdf2so3897439f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747157503; x=1747762303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nG0XYUWg69EbLL/G8YlTfCVljzU0GFu4+p99ldKTo0Q=;
        b=ZydaXYusUo6CNd3608mYXrc/HReOEslmaAeWFK0lwqWfWb1vYuHakq5NR69bQTSyg0
         UnwWIj0THn5qxoaU271ModTQzAbNY6nPyCLAa2mCw3HKw5mhtGIwx2pOcW/oR5Ji4U2v
         IxOmAR2j0CB8SX2eXysLFXdRywqdlRT8TuiGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157503; x=1747762303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nG0XYUWg69EbLL/G8YlTfCVljzU0GFu4+p99ldKTo0Q=;
        b=hP1uYOP5nYkP3a+sAKalkwiakfgeaZFzJHQXlE/VzEMf4Y/FMn28iqlZmZ0GKzAUh9
         L2J1wL3MLpCXqQUuUanc2JpOXymRrhdrRVrBEVr2nNVATW/gNgKoN3zo79fm2QB1zoEj
         OM8i36BF0c0/WkKw3BUpGZWBKzqZiI/AkFOwUUWH6aCJx/zmEk+E9o4uINpTCJfrvE1h
         UxBtpPGYh0mmCMXoNZPwLCGWeQX5aY+4IFxQwnAKGhyxBAtcnrD9XUCIZYhjxd80BBMx
         l51K7sAiHvrY7eflBmrzHUs2WVGNJY5U780OtxwtvtOcBE81A/fJA3/iUckRthEIyKYX
         sgEw==
X-Forwarded-Encrypted: i=1; AJvYcCVC78VUGpH5nh3hxAegvyy0AAF/xQRb+97ArWcYes8whFlrz3d4sjFVnFy6/C8aW5szceLmlfAwSuNMFKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5Gu5wk2oA3h78yVl3eON/HICO7+LYUNs4BeybC0shRsCsWYK
	MTxuPaq30fj5FHc64pZ7PNnqcBGYIRI7Yhml146ZrUlb1s3QKtdUl6g6gEsxdRI=
X-Gm-Gg: ASbGncsRX6xzzsXtEqMIP4BJhhbs0dlQbg2ZIOJjXKSvRpREO/16/we6O5gfLU8PUah
	QyfuHOSGP2QbRA5JUPX5JGkZOXaM0r7Tt80brPduFEYsU4GiUBN5OHE3dM5tMjvh5JEF7Cyix05
	P/P80VgdqRfHXqESwQ6+IdBNMJ4nHAeQ1DJdHgjg7b48VmxBhDkxtkDLDuW//KslLrlxw4xqjMU
	tqcFEkKKpjgi98tYgD3Nt///WJ/nUXg/YdegB4W8TIEZIb9yaYHoYfH+LveXXQpUqUvczwK0R1U
	FVRV8uOLUNmnTYrJy1WBfGyVranKbkapOSgCE5b6uy2URAwSfVMnE6PI0hjoDA==
X-Google-Smtp-Source: AGHT+IECJgvCVtWlq+g4QK490gTQzFPaDnyF62/GyTgHPBrHCrk7yeYlgj1ujylYOHqhp+zRxL5rvg==
X-Received: by 2002:a05:6602:3b86:b0:86a:441:25ca with SMTP id ca18e2360f4ac-86a04412a9bmr205433539f.6.1747157502707;
        Tue, 13 May 2025 10:31:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22685251sm2212186173.138.2025.05.13.10.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:31:42 -0700 (PDT)
Message-ID: <ef7e1312-83b5-4635-bb8b-edbed0dc20b3@linuxfoundation.org>
Date: Tue, 13 May 2025 11:31:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/113] 6.6.91-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250512172027.691520737@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250512172027.691520737@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 11:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.91 release.
> There are 113 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.91-rc1.gz
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
