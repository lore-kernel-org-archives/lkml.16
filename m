Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398D18DB18
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157650; cv=none; b=pJVZQ9SjudQ0JcJ+M4pZszvzDqwtsOw2pp5hcFu4L7RthhtyfgvDlYdvIGh+Jq8hdBsqRPX57agsKNmPjKwvUsXB3SwT4WCapZw8bI0SmDaflvFcgr503mS5S1p3DlvHhsDHMQBoq3M+UH3SgKysU1xkU69dpx9MOHBRHdLtSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157650; c=relaxed/simple;
	bh=ORgTGq0r7wJyiDFtwXEgoHBuy3lcDA/b8RLDPsQ9cJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAStgD0fE7ShYe1l8BBoFrrQ7SpqMrt58Mtda3+5o7ZXWZmibgjrX/IPdCmA5CYE38LJUEZUlClhKOmBbA1sNrEcNS9SiHyvGa4e9vcrtAzsvqaTzHkd2oiFKXBwLbBAraFuoSf6bGPHRA5IyAiDSqbMWw9w+3E17qV0YSiEk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4SGPOlG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4SGPOlG"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476af5479feso70120101cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747157646; x=1747762446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yHcz6mMYEIJbmi3MxPPcq/Bqop867905UG+HusUSuA=;
        b=Q4SGPOlGmaFLR5N0nLVwdhkX5EiH9Ohde38uQJWaQp69xAXKViPsAegHT0ZKVARlDk
         cd2tAhMaeMP2jJgyIzeBuDD8jWlNiGJpUB886JmIAdPAVIgmr4H7W6z19Er0glbndU2p
         a29y19CkU5Kyg8za4Su1AqgBXE7jITYNTpeO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747157646; x=1747762446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yHcz6mMYEIJbmi3MxPPcq/Bqop867905UG+HusUSuA=;
        b=kbJAnnlFMYPhl/Dyt+0GHHYZMBy7psWudtE/p7cY801YmIa61tBa21rnWo+u6FuG50
         cT3k9UOOoHIE7rS2WKJIiPFZzA0HhJhGjyz4gwIkLQWudVAv4fMDCF4A7ECwZxCp6O7P
         aYgUtbbqZe3LduMkW9GfeELNpgbLEmchGIRKuwWhLm8Rjxlau84UBlV1D0jE0135dNV3
         ECdLSB9r53xXx5XVJEcNoXdOm4BIMI4s8mFOkykHOtLZfdhNTfL+M1B72wdGG8yaAuLB
         8a+cboyfBT2kd+qzzP5Vy7X8t9DPEFh6FtaWMRdNte4/zW/GEkip5Nd0dP/fUmp1lAWv
         941Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKe/VhzeWsxktgQtbbUG9EMsE4ZD0MZmDfN6DPEPZNFGqWJU2a7Xhm8Sj6G5DWERhl4Sdrnj7cnGqYXRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUt+XeHyQKYxQ/9rnbRAVCCeL6JANWngC8PpxkrUPLu+IWSoZs
	5Gnl1H+S2u2QE6q+lGd1ksCpkCXMXvaK0xJHQY8bo6hkx83GDlCI9otZBH3k+qm9SUx45jswzFB
	q
X-Gm-Gg: ASbGnctcilKMsV2xwcUJ29h6Jq/1hnCpjQRGSCGTu4WTlg4bZFI4z1rCiDNvQLShmEK
	8H2xBLwRcQBw8cHx+txjszuuxq1cAwcjdrxVrTTTFY/rCafKgeqVnbfSO0UeqhUNqmtIIq5z8em
	hPFt5sGvUnRgqttXll0pfX3ndRgylJmoh3UwJdHn1qj7v0SJlq6E70fo1t4D03lJOglB2sIafgF
	bQ2rS8S4z9+xO0+XRTGCSJNq26IJb3yC2wgF6YSHM+PhGU5jkKTIYHRyCOVi44JT74EZFRAjF9Q
	va4xMhRMo4vV4R4biNyyPg0NcOKxZTRr5o/oAXtNN5dy2jay5IFed9m/wtpQLg==
X-Google-Smtp-Source: AGHT+IHnUVXnn/cpedUFGgvCl0xpvLpgIL/c/z6hDeUnR2wDQyCd57P1RCSfX1X7sblLh0kPIHFq+A==
X-Received: by 2002:a05:6e02:1887:b0:3d6:d145:2ffb with SMTP id e9e14a558f8ab-3db6f80b0c0mr5126025ab.21.1747157635105;
        Tue, 13 May 2025 10:33:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22658dd0sm2157241173.114.2025.05.13.10.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:33:54 -0700 (PDT)
Message-ID: <08f7e5bc-1a20-45ed-9334-3c2f90504b83@linuxfoundation.org>
Date: Tue, 13 May 2025 11:33:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 00/54] 5.15.183-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250512172015.643809034@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250512172015.643809034@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 11:29, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.183 release.
> There are 54 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.183-rc1.gz
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
