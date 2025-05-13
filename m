Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E2812CD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157542; cv=none; b=e5vHjEE4I1mEKpeSK3SKEzAJSILpBsbBE6GPHZSQWFEz2srl9hZDUPHijSQ5bRZl29sGTxjDovSpnqSOW0sei0zPmmvc18uEPBsmKkAf/dIc7fo4kLYqlaUeOiL2q4HOIH+JDTPX+VXMIcwuHDi3iUo6YR4+Rgr5V9Wo0EgLQrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157542; c=relaxed/simple;
	bh=xkx8Y1zm0IbWHQo28qfYmM0rx/fAXJplkL8G5rh9aeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTz09EKFRniS+u987sBDwyaW1fVwp+u5vGv7GqpR7tzzZTvnpqbC8DMhCXcSyvmKEZJ00mLbLCwNlV4TXkVYACIOURk3lY1MWZS6SLdepIT/DK8bOFYBxvigINMl2juxNeyHha4oQ0qurVAWuV7vnS+onFXzCVbOwrwM8apCnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nr/IAFe9; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nr/IAFe9"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85df99da233so607478439f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747157539; x=1747762339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+MbZDnbUPKSUoUZsaJjBizYbNkZOWSQfb1Bn7Itqcg=;
        b=Nr/IAFe9rHCpvcf7LEV/1se67Ru16kfFwfh+Vo/AX3hTYa8LWYUSnBBYhDGn70D+R+
         MGtPHFZNAG5EcrHiprDl73Th6FStm0SPLeFXY/5A7kh2X7LkPghZVQ9VYAjJrxcD1ZKZ
         7T8VB5JLUvlcMLiRkzRZqcvbnvK7gfzG9+lX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157539; x=1747762339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+MbZDnbUPKSUoUZsaJjBizYbNkZOWSQfb1Bn7Itqcg=;
        b=Of/YhifR4OlOay8/fxRUvSg26YnvzD6tEs2S3UP07IlS2kN3M6GreQYjQDQT95FSQW
         LN/wNgxISoDmLCwM0ybJRnd47NwNLT8aXE1OzMHfiZtipbuD4HzbzFMHnXNELiGswoZL
         s92+tMV7P34aFntrKrJM2vVLmimKpnuuTKbbnOb3cUfk9i/fEc68PlQvtHY/CC5D6jSb
         mbcUyhgtTCR/gTKRlcvuea2eaGmht7UIcQ1yMj8s+57pzFT46Uy7M+VDlvUFOOaVBNcP
         HGEdhDP1+99BqbbmU8yIUo5kdMLIQaYAPhrxp/918lxlfbq08YuVz24iRIhcVPtIPUqz
         p84w==
X-Forwarded-Encrypted: i=1; AJvYcCWFnNcFU6NDLFUb1XYu9OpTwiWN9yht7kcoMVIDLKjnuCpt1YeVFdoAkS+x5TTysNokAuKth0hVWj8Fo0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4H/0bSYHaU1RU8drOZc1BGKqIabameQ60+vTT6oOUoERdDwG
	+aMhlJvrbzovQ8TkRtlqcZOkhRzrCGdEff9XcPzEcZiiPUSs2G9ACpU7/voy5wAhxNNLlf0dDI7
	b
X-Gm-Gg: ASbGncvNCEv9Ow5V4+0rK9xrfTi2X5zPo4cks/dbrAEFjgLE2woa7zx+x/WXWGMOK0p
	KYW2mJO51sm6e8FFz1LOeexbiqoVSPq7qhH1y0EaeTlrKCSnG3IKp03JtCS4ZdGYQ3giAFje/bM
	1f8rOjI+DYpr9X5rtTQUT6ZPN6d88wz9cPev44urdDfhKzwTuD+qBVUtn7paE/7ZFCI4l0qE1Of
	GlakWGDZgN7YvUnIpvwpkT1J/fLKfswK3Guv/53RYf9KDtPd8+/f9j5YXAgiTzKww1gWWRp33bk
	h9OTrjRiEIS3hgPtMxjdw//5YdlS5yd4azsy5I81toJ0c5TyVZc7sSFiTpc0vg==
X-Google-Smtp-Source: AGHT+IFWdHjRRXf8QVQEUR5t3ZnpDNlogFJNUICkx9nlc80riFRqz3gqNSj0dPMtDWrDfIPLhITPkA==
X-Received: by 2002:a05:6e02:178f:b0:3d6:cbad:235c with SMTP id e9e14a558f8ab-3db6f7ad141mr4886995ab.6.1747157528157;
        Tue, 13 May 2025 10:32:08 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2262d462sm2229617173.84.2025.05.13.10.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:32:07 -0700 (PDT)
Message-ID: <50ab86c1-4b23-4ebe-ad87-7c8f3f90e7e5@linuxfoundation.org>
Date: Tue, 13 May 2025 11:32:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/92] 6.1.139-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250512172023.126467649@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250512172023.126467649@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 11:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.139 release.
> There are 92 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.139-rc1.gz
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
