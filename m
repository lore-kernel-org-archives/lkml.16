Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC581AA1D8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970639; cv=none; b=HYSrjrnAjmZFC9W+7GKiUyP0I+z86yWYllTnGSzOEQLRerHBUlEos5SbHxB3R4FRioPy1e56D2OZyfhC/URBQYdhODzylT7m9Wf0C8APXo0AgBF02JY9Lldre025/PRIc4UEltL5fcs0ULvFqgB+pnuS7VUFsmeGY+eK/xmX6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970639; c=relaxed/simple;
	bh=Y45fMnHMCP8TQX3oVIJIMV8ISnwVRnVRll8M0o7pQf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM47giUIUygHJN6vPEkAWGV47vCpKtDnNx6s8uEl9ungbv9+UvwtZpIsPZPi9beoyRfaZAkeuP+Jg2wE4IDy/FJ0S2drWUKomPd+ZOFddzwh/3ECmIfw975v10eeYrPOudSIGwX0of4yw86YDCVleTiGT0XffrZyH3vt+lTi3uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y/nV0V1D; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y/nV0V1D"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso299705ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970636; x=1749575436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJ2V51PhfTVTchVMF1vi5xy+6A1bllD/3ZSU6+R/gkA=;
        b=Y/nV0V1DkYRxlAdFNo6pYZwPb2pef1xgqENkfYMFnTHEH72WpIhnm2UcNP4erLjIOd
         MCbRHvy/etOpHYY6mBxeBIGAon23Jkps5HYHt/A/alto6mCoiOulUR75aTAiaGVXJXnz
         cdDFPXH8ce+Xf7vkvFrdAYLPeAoSedAU8LoyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970636; x=1749575436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ2V51PhfTVTchVMF1vi5xy+6A1bllD/3ZSU6+R/gkA=;
        b=ZkaBVj8ZeQ2pRa+eNAYYnM1UY+a97/53ub0Dp3lGkRYqMIkE+NV+2TWbjW13DG8JO2
         SLDdMbA1f6l7sJDkq2oUhssT2hL+1JsgsHuULCIJEz5eY5q+cau7wzM74MyYctdTfysP
         b3wiyBYzpBaP3sfOXs/viKgJn0yWpyb9VO5EnbLIHVaI8NvZLrjV1XhHXESnXs2K+NLG
         T6i1ks4Btk7WsalMulHyx0NnuvSAy0qVLK2VjLlrGcEEoruqEnE/CXRftvaT3ihmLHU9
         BKCzTdb/79B+Lx6K2OKLho+ZZ7VWtna3nrouBaVJfonOIj0rGydvgcmYQ3y2pn+zDvAj
         NlRw==
X-Forwarded-Encrypted: i=1; AJvYcCX+wktIocZrl4apIM1xGAXI6TCa2mEsxrlZgmvgvgiahWK/HOLZYej+Fej4CbRbwQXCGzow9wO+DZWofoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJe+9klsUsVrh+2qwDQbTEj5aTIP7Hfg7dPp5TBnAW9ytcLd3
	w4LQpaHG62u45ZVegJN1nBrmiBWT/CH4a2lxzehfdTTQMfb0j9Al3+gGzC8/xP9CtYM=
X-Gm-Gg: ASbGncuTM1Teu5CQzsOPLhsWZrMHyniJaDxeQo99qq9DxUB+8SCCyMIZl4vsBn2VplG
	wcY/fSppybM67kZPzK+cI9+DGBlzItDNXtHqZdfGqnp85hq/UHIummBm8oUW6gsfStSSlBKmRhD
	sWk46ip0GK/j09CpPkjZrs0FSiL/uRsWxB7agBnHreu+6U0BmzC23DR09emVl0gBdNfMS0YeNRQ
	fnnj/8OfZMw3q1IMR+NL3d0x9WPT4y18hMbyz8GtOEHQiC93+U/W4dQwNQ18ByhxeYl3vVmRc9j
	ct3oMwtlQgbVZfLeggXLpCnvbnB4ufA5BskcaJaPYScvyuK8454eAmirwVjytA==
X-Google-Smtp-Source: AGHT+IHCZSnIzYj+uUj9RtM2lKYcL7O0GbB3CDdlfDJe6XzzQYpAbREB6rRXkkRITOQuY/SMAth45A==
X-Received: by 2002:a05:6e02:681:b0:3dc:9d32:6373 with SMTP id e9e14a558f8ab-3ddb7808fc6mr26858405ab.2.1748970636272;
        Tue, 03 Jun 2025 10:10:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd9353e3c0sm27240925ab.28.2025.06.03.10.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:10:35 -0700 (PDT)
Message-ID: <460dbb46-ee6d-48ff-9d9a-779254dfd23c@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:10:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 00/73] 6.14.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134241.673490006@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134241.673490006@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.10 release.
> There are 73 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.10-rc1.gz
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
