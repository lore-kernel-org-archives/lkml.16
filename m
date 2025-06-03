Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332711A0730
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970778; cv=none; b=q16eYAL4wM4fSbOYEoTTHZzSO1TUdQGAt+tqpRx/uDduqwZbxz4ECroL2ECMePIsgQZv+eh0sXamAR5huAdeFzy29I9m2vL0cZMoVcQQ5T65suJVtFGy0baL0Jy13UQLNymb2ECjA83j21BOAqHExSzj7o/GXr5TlkGRrfqgXKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970778; c=relaxed/simple;
	bh=SI1mAy6K4lm5YNnUqqJj/WtqEcaaqnPOHPfCDszHvUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIDpGvBNwpGkyJbqx9MXsbBYuRyCCXNiwnU6hgskvFEsM7tcg3Bx+L9qRkoUO54N5Q+3lsqqGLJj/SiCp0GPB/VGuhHeHKcelmJvMV/kAHber5FkXJj/vN+qrPu9SceUt2f/5lfl4AOPBeqK9Er3ehLrrVNmF3VPkeXrFma3t6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SHSISCRh; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SHSISCRh"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dc7830a386so18569505ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970776; x=1749575576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxipSsAkichQGT02oXY7CtjNAbrB7m+GC/cvW2mwdPc=;
        b=SHSISCRh1dbcY7v6lsttTaqbGekRx9j4ftmV6VH4pglxdATjJX8kJPmMvrZ43X1iRd
         Qjyc9znX1bij7aZd5DVP2Y5KN6/uKmCDNOVfIe46d3p7LArWn+MskF6jRZUewqm3chQ1
         Ukn1l0SNvCsTlczSUfLPR+bGeWfH/lf6405Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970776; x=1749575576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxipSsAkichQGT02oXY7CtjNAbrB7m+GC/cvW2mwdPc=;
        b=kIQBoChHBBrB/lGMCAdLw5zKNA5uRMc1aY2YUMwLK3ljH0aAPJOZpuAN9xV4Ozexw+
         Ux7+bskTKmv5Ofdk/N5LiKYIIoqbMO3spIi2Nb3uF9lYqBWnctqFv3CrO6sAPm8uDTpD
         VrUh8nd9mIUWzEqXYPC/sBaPFyBZdP+0hGFKGjBCTccwYlaecwBGS6eSX/LpTAitMkCK
         7o3kIAp9ZjX2+d1reK4naiyy+Jb9dc0vByGYq0xHiZC4Xj1vet8r4LZkxdjLXJqsEc+p
         tbGx3ceYXDn9lSPHfq3TG7KQ5CAfxvA1GjguEbTHf+VBSN5n2/U2ADrExnSxPM4W03jf
         VcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXSw3kfs9yaZnERmZBnGwp4UzSRkwCn185GZ82yEJAmakhsaa7bu0WAIy6mo90CMhJakMPBqqLDgW36w8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjj9z5ET3ZfPuGDsSpB0cqyScNfiAkl4uNcm18/ZVJ5NEg7L8f
	qytqZfUmulspndPQgM4RnvCAhRu/2Aunpw3kUUwdSW4v0iA3+RiVAwpuaKLGLPScEp8=
X-Gm-Gg: ASbGnctUoNlFJ8FD0L/zUitX+ivEk+Uj/LP3TscYpwall+LhK/mB0qBpN2d8NV4FU7l
	22oSv/UxjyK8BzUHIxdn06T1JIpOu4n3LP7UWPSfdqEV+Q7dD3yFEe6GtGK7V4oSvXOBGv7y+Fa
	CxLKYboTNT4UP4uRdhQpkYHcVganqJaHS8Nw4rebGCaqMvz93R0aIkwJUllsvUjb9ZCxhnoKitS
	79j+c7Soghwldl1y2JAsc3wfgyU4IirY9r424T/lAMdFup8FdqK7305o6P8brO/RJEwn5EkxpMQ
	641gRXnyq8WnlXdcbtEL63Zf75KU8806sZvGP7bV1XXRSyG3s66hJb1hWvWChg+TAUKgCrhT
X-Google-Smtp-Source: AGHT+IESXIfXyJ7aYiQmXE3EiJ7rnApNSIGacwWXavrUtkBPmHYuCguUJ/DRscPqaTB80ts933EkpA==
X-Received: by 2002:a05:6e02:2704:b0:3dd:8663:d19e with SMTP id e9e14a558f8ab-3dda3370d40mr111673775ab.10.1748970775694;
        Tue, 03 Jun 2025 10:12:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7f22536sm2408814173.134.2025.06.03.10.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:12:55 -0700 (PDT)
Message-ID: <4517feb0-04a7-4413-ada4-582602abbbdd@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:12:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/207] 5.15.185-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134258.769974467@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134258.769974467@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.185 release.
> There are 207 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.185-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
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
