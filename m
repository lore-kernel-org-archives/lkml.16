Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474E029CB4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580869; cv=none; b=MAfKnkYZiEPsN84fZzqtIE7RIf98qoQol/Fdihf7igdre4XGtdYscPGdA1/+e+SUqqYIR0733d0uyXStYKoMDx9o5E1FYtUS06KzUQhYSyzulTl4STKy3Fe0mXQa1S3H77G4u/2O0FWfFQDx5HlBoFNCuog3qjNy3nzM95Gkmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580869; c=relaxed/simple;
	bh=Q0g2Zhkq4WLWccNiTfJX8qbXkS51qMJT0rZHNTxXi1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oK6DD5TtoGfk3SsXqDLVI77ChQo+2tu5aokycitx29BAiaVo0CfuxmBWldTXjwYJfkZkW0Mcj/UEH68Gun2h9eqcbf0DQUDZNuSCZWHzp/ty6FEa8HdvNihw5O+LvWWkPj7E2ynKMbu+oCLHdH/jEb+oBO1D1CbOCHuKr5yJOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WK4dItlE; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WK4dItlE"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso1920105ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751580867; x=1752185667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMHiazTRC4iQAueFQNRIE7L4iJerZdQRrKQ3VEF49ZU=;
        b=WK4dItlEsfGJ22l1QIEJnTEbEOSsVJQHA9rUjfbPoZmLjWlhMyGVafER3Q2Hg+l5l0
         k+kou1tAnTQhIgJ2KWpJ4SDReifi6D+1aUfAyz/FNhlZ7CM2pzP4mZA6Ao4PnqKV2pWe
         oBGTmI5tzfysZTrruOz5rOROEmjM4xmf+jpXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580867; x=1752185667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMHiazTRC4iQAueFQNRIE7L4iJerZdQRrKQ3VEF49ZU=;
        b=Hk3lHQkjrR/B5ruiGB9tjd2iHOCx5NkjzdOZQXfXHpFwq2kmH5KrREx6Tl3TOyEsqg
         Ke+RAVP0Zeq5wJTXRsfDBSnVLMEW7A7Xnj9eZiiHjZyWUY5K0QWZKd28vvFL7UDtiahK
         aDDw93sAr+oVNaQLi5ANMJnFpD4uzv8BStubwmPU5lZn9IW2M0GpZwknje0DVgroJi2R
         qJmKWNULHlKPmzSNnDwM/pe5Eu1FAe6DNIcAsV7DCsaA8yz9PRFW0JlYgFYLYxhucsTP
         hWxsW1PrKU7ziHoknFzke1f71DErID+chZGL1ktGVXo/VjO8xtGxs9o9YnUYFY8keLKs
         sZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXx1aU++DeBcWrjRZ3Vyv3zmAYpTLwDpuntT/Y66MtbTtPCFMCU7FbwrlKIx1Ry6COBMP9Sp1lSBQ6oXX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw09mDQiTZvcjV1ah5XaPVQdWolCcs6suljNuZ8zIc7/ADiGhHk
	R2LlJqmqsvqPSIQlpUF8ErnD1XJrKNuPP1ThY/rREL943IcALohUPK0K6W1FPa/TVIo=
X-Gm-Gg: ASbGncueQpf8TnDDu4acCHRFEWqOsPmc2yezxDOvfTOnzG0MOGMBbdDUfNLL8vaZWLX
	D7DrwO6bI+0dRTSaGc7I1E1H6D7ykbjCRFePJwtTEuBKRR3nuaz9Fx7l0BRXLPVrXLe8ctI7TKx
	8XOjFoQsmqUtgXKh5xyEEgu2ZuPe76BQaDKLGDKfoFqjhzVXsay2JRV2rMM+zooh5y1G25GzXpy
	jONo92pBYKxone4/JPVvlFGYF2AwxxSKy2kIewPk9wm60Pm3YiwD4BghpNGsLfrldDOCI4zn/iM
	WpK+wWY/oLOMsoQHLNaBen0RMnQjw1hvHf4aLu1hZP1I5DSX8q7DpFjOt8slqNA0FCZHzeffWw=
	=
X-Google-Smtp-Source: AGHT+IGKLsYwNxaeU1iL2zR7dYli0csm1SLeIM5zBOhqUdaib/shcWJHmANH9UBvLtxtMQRqBqR0DA==
X-Received: by 2002:a92:c248:0:b0:3df:49b4:8cd6 with SMTP id e9e14a558f8ab-3e1354fff90mr2023985ab.7.1751580867397;
        Thu, 03 Jul 2025 15:14:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e1004ceafesm2134355ab.61.2025.07.03.15.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:14:27 -0700 (PDT)
Message-ID: <b6644009-7494-44d9-8480-5042bca1b952@linuxfoundation.org>
Date: Thu, 3 Jul 2025 16:14:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/218] 6.12.36-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250703143955.956569535@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250703143955.956569535@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 08:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.36 release.
> There are 218 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.36-rc1.gz
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
