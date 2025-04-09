Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B927816F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224759; cv=none; b=Tfr22N0aTfpsyp5eTv0Cux1afkbH9iaaKoYKYRwxCvFJO1J9QEmNT0zjiYa5bNOxBlvZXlugI74DBLLPULhSXBDmqGM7nRHaXCyrlpBm3R66rrswwqBRg+TwMJhEKGtoM+FRZXPgVKw8kY0nOOEci5w1cBjgMUF2bQZ/TMaJyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224759; c=relaxed/simple;
	bh=pLt7GiueBlfEk7bEqYSj6/150Oe2cspFuNbigDQxZMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lu9Tr4tfbeABxqjg6/iL+IL7OYnVK+sdkrYqdtW9DF4vRNIgvw1pxBRu7MASjMdbhZs0e2/YB0Qh1AhS1MOo4+ejziPsTFqDws1Ww4iaEyC2ydZ4MB+SI2yH8fVtyc1b0/mNJfOjQ2rPTOP14iQmDGZ3b8fzN6D5QboQe6Hxp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OC09pHcc; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OC09pHcc"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c172f1de1so10476a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224757; x=1744829557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08HrC4TNhMaF2kgAGKOzCB9x+b2Lv0SOP0JhsgwzY5s=;
        b=OC09pHccqol73I4WIRGW0GAWmDlEWCDdiMkllOiHZMN1f0af8dg91uwoathD+YcjmL
         Otl0NUI23X4sA7Vm5XR/57fT4sgXZ4G31D4Jo4PT/x2xBQl+RNie9W2oPP2S/IIfrvJc
         0Qt4HzIzbcvCYK2c8+S1A/we/13rVUKNFDDrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224757; x=1744829557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08HrC4TNhMaF2kgAGKOzCB9x+b2Lv0SOP0JhsgwzY5s=;
        b=ltNo3TD0cbXKlbzCMbwLH8xThUNuWPlgo97IrHC/bTS0wt+DNeHuoCnaM3V4t2kWrQ
         vaEMklz16ueSBRPFsHVRga5IRWJgx77MZvcrXBDKXAB3In0xqw4Wxx3PJWPbihb4KGSd
         Dh7zbG3shLgY71iU0orVt9l7EdBoDivrxiaxQ/8Q2LBW3VAb9e5dhkOwARrEZbF/fxKA
         gI8WKuzxH5kAnCt8o8nW+R/kbAovj54unAQlByoQ9AClcH/kVMzEnzYyfCVYYXnWhmSZ
         300m5isXzvzWLkvsQNO2UYSXDMukiKOp0qwOa5XDYBWd5yRQVoZJJ5h75G/ruyrYNEB7
         VJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUsRqoHVEbD9yHx2UjRNEzzG0PwN/ecgrLLeh+1+yZ1ooHiilZB9i4fJJF07R+dYt8n+G5ezWbgp2IbJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMAj8Mfd/CPcNqOEi791EDYgZQYAmWMOE6U45bmGZyVK9WAMB
	YabFNKV3pfS2bn6brcU3oobLhWW2pz6aRsbk2ejfIm+UP3vQBp7NZRAHWtR7+/0=
X-Gm-Gg: ASbGnctq65iNkB5sivuazPhLE/3axAtCL3ysGxIxE+MGsIEmkUgg+1zZzqViqBxWOq7
	IXdfLPsFjWPnX+1jVXEb6nC5pDM68RrZl0au6N8/fW4DqmpR+wK3bDvZDrxL0hnLuazROf8LPg3
	2CaJf+kgcFfsrkseTVc+WRXd9HJ82Y+gD4k6u5hfwu+pDAMcqmigd0not1eXvMUmXypSkKscaGv
	uD+LS20L4iy5ljKdiAEQ57rFrgsmbW0IzpaFIFz2WGDcerqZYMN0tUh5S5DFZQihnh+wLuOuib0
	L79H4uGscyXfn4+r9oZq+f1NvCYawklWvdMajwkncWUSTiL8v28=
X-Google-Smtp-Source: AGHT+IFE4WLk96sOEuDaUbLNglaG8LWOuDvoLplefjWi18rbkgHxYdcBhfLP+c4HletU/vfeakO66Q==
X-Received: by 2002:a05:6830:6304:b0:72b:9fb2:2abd with SMTP id 46e09a7af769-72e7bb2c8a0mr19492a34.20.1744224757172;
        Wed, 09 Apr 2025 11:52:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8d90bsm280459a34.34.2025.04.09.11.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:52:36 -0700 (PDT)
Message-ID: <52fb54ef-4f30-4585-b5ff-6e52310ac43e@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:52:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/205] 6.1.134-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250409115832.610030955@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250409115832.610030955@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 06:02, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.134 release.
> There are 205 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Apr 2025 11:58:02 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.134-rc2.gz
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
