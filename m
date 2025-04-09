Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32227EC92
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224880; cv=none; b=iIa8UUpexwSSSwhNpQ/X/2321YoN+Q1J+iHRp+pazX8y6OyDNgLdPWKVWSZXpNx74c6bkoZ38xVfugZGI8wWzIM2D2efPhXSH341VL1Dg+2K2IG7qx2f5wmWJbk34Q03hi8jeTOynEdbm40Y0bTn+r8fOzNJvEoAu2s4nkL8Hcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224880; c=relaxed/simple;
	bh=BItrTn2IJIH0MdLppMsWlQgxElkb3NvoIdETrPiCE0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jkln/eptFT6PnpQI7+w/I8BdLC9wOmPWcfUP7PH/YPst9cVoK2bj0Wec0UCKSq3CwzNznP20GkL/Lcp3K34aPOiU5751K2O8NRc8lWwMayhRnXN3K5dppqw3toPHtTxk+BWGuOf0kHneT61SpGc2YpNdy1+Yu8sTc0ydOIdC4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f2OwgbzV; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f2OwgbzV"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-861525e9b0aso4248439f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224877; x=1744829677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7HCUg9+RtKDsPTNL/2WrP5NNIONueuTQQ7XmSzDe9Y=;
        b=f2OwgbzV1zXXF7U1vpHEmCcmt1TFyCwBw9v8Iu01ONlVjzTG/8rioTCvehVDeNjM+R
         57GDnG5RE7/NlvPSDenOeAWRQyBBMdhbhBJvWFCWQ+wbCaFaOVcYOMsZFa7jf5+n4Az7
         sQPwqqr9SHSSqu20pTCxRlC/Coesoruh8i1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224877; x=1744829677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7HCUg9+RtKDsPTNL/2WrP5NNIONueuTQQ7XmSzDe9Y=;
        b=Cf2QBBPbqNhQ3jD6vGaEJ5t99dSySwnGCbFC3DK3mISm3gtwR3NK9c6ls5M+NNtD7W
         wQGMMIpret0aBZtunqLL2mAE5FI5r33dRIWrBA4JOLy43GeKByS3zORTJokGZvGJfMg+
         hUAp21UWtecIem6w7zVlD9A76FJZEvvwc0RWjUhydTaN5HVc3lOPL7j8cFt2mz/cINo/
         vJmdOZ9cOevkMsnnfP6AKkl6By4N5DsgUDBD2QlEkDPhyH/4sHFEB0CUFeIsT+vpYoSL
         PaE8hG2+ItaQEJ9Fxg7WuA1NOyx1mnM751OVLTUGgJuNKOf9qXbJMQhb5qS2kGyg2xj0
         dTuw==
X-Forwarded-Encrypted: i=1; AJvYcCVnQajq/JBnME1s/AqKwnkTozjncjCK9SneG7wa7rx1DUv9/UoQp3p78+AaKg6kQk4OZbcNPv+mXz/lqmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWKu39Gq4uC4mxWOZ1QTIuAQDJEBCPwY/AF+UrOrI9QqJHbtd
	Y4roFcxFmqA9NTcLdmqrjmQSIhjV24gIibjP3ClLke22uz/kd/1Isn6C6N2W/as=
X-Gm-Gg: ASbGncuZwzxOKSPwYjYjX+1M0NDniXBLghqZfaJK/A8RZUDC22zzTpAuDuBFCv6dn6T
	Bh2r58y7HJrpMpyZ1IUDdkrjjPtp5DbmC1nQ7xZIxmTQNJKqS4sgQE/PKKYYQJsuvpkdska6DT/
	bRwsm0mT2SNNFWCZWJjpCB6lAoSwlPoJVCgfomyqZr1JeyBv064D1D3CfBDbvDD7a7bEt02oRum
	TNO09467j8NOLQdCzt+zCbbj/wZv1CmEYCBF+ROQ+Tnj0rxlTZXY8pxvQjK7B1qKhc1awAjcV+C
	5IYEfJXKdrvhRIHWjjYBV3w3FGYM0EkPJklJI8ObHmKXDo9Zdbc=
X-Google-Smtp-Source: AGHT+IH5i6yQTBGbz82VtAMEMdTBDeDBWpGhiHzbBDbPeaa1aVN55DG89VDgZRcqxydWuF8KbdUa8A==
X-Received: by 2002:a05:6e02:1522:b0:3d4:6fb7:3a36 with SMTP id e9e14a558f8ab-3d7e478131cmr1913715ab.20.1744224877086;
        Wed, 09 Apr 2025 11:54:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e0271bsm369857173.96.2025.04.09.11.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:54:36 -0700 (PDT)
Message-ID: <51c911d6-a7bd-40e1-97b8-f73d94d2e9ce@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:54:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.4 000/154] 5.4.292-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250408104815.295196624@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250408104815.295196624@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 04:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.292 release.
> There are 154 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.292-rc1.gz
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
