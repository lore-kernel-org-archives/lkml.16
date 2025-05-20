Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ADD1F03D4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775817; cv=none; b=U8wARDNjEVUyFeDy5TT1S4a+W3rv0FBLYaUHrDV61XPntHKJPQ+JZtly3C/zW6uK8G9TFM1uLOoGBLigivnOkLrYaC40F1F412uGALrNmwKEtlzl1BIpnZISCW2uOQqB7hZ++vrSn/G/NxOobdwe56lCA804WTWpDL8Xmt1Yrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775817; c=relaxed/simple;
	bh=tmAXI5Vz6kKlh04iIaEoTryqP3ZZCQEc8B5PrHjzjGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1O/opWD+M8ZQjbz8vxThDEAVdVm41fsSC/CaC+DGhL/Gu2VSOd2izbo4wEe8GDDjdRf1sX64GZMwhLfNtTN+mZ/mTy5ZsnN/5Ts6G/REYOLui0YEyCq9Io9GSx6PARnZ+5E/y/FHaDUDax62V5/cvz54R80B+bawI5HhbUm6xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CC029M17; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CC029M17"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso144057239f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747775814; x=1748380614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGTzXh3InLODqO504vLG8maKIJQ4gfFaDVwDUD+ra6A=;
        b=CC029M17lJB3d/9Lq4eYrwr3yYZ9lvmeASAqS8qT4bET/DaSDc8pppVKZafML2V750
         yOuvHjb03sSxOfOMgh5U42r1o+k/LtZ5dMxqwpFzZexzIvMDTOX8e6FGnJDDSNVTvxll
         w0pWemy2fmoPHHTjVWNi6HyBoOSqLTvepLuxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775814; x=1748380614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGTzXh3InLODqO504vLG8maKIJQ4gfFaDVwDUD+ra6A=;
        b=nWutQW3qvQT9UW4eza7H5GUwsnnNTIAOWCC3gxoJW8kJJnM41s4PZaCq2mqiVqUrS7
         STPuvP201uE1vlAG5AsuTlmrkn/1O8WNjM100XkdGvWu/BTjGMnC4Iwj/SsNiApUkTMN
         PxAv34BBnyD1Giy2CL9bJtkLdlzevDVK0tw3mV2iQH1XOHZHNIG7hDgrudSjfV3YGnab
         wpEphr2VjoX9OED+HxvzuymX1u92vwxcW7KbQgHhySuWIf0KoadjWIcBGfimec/IrR3r
         FnHGZI5F2FISJms4p97L+OnU1cCOFTuMQNRh+rEbnh0DQmTcxLsf0/817V5sJdTGQlcc
         uqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMoyKhWIOJvgPEC544I5KFESa2RsXXH3X++eWDzOEbHE8xs5QCFu1mGCpNz1yalqOWRjXM1aTceWt2z1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYek50a+jwSbk7+zrXoSbejtWiOTNAS50APoTaRMPW1gSTuXNE
	KpeqgOGEa9kgBa5MNlBwG2kzAov4VStzoJjxhcaHBD41UdurZjO0NU1LET7rnUvihC8=
X-Gm-Gg: ASbGncu3QcBSxhXaRu8J8hCHesbu3PsX9+WKbhrFzWs/O25Q3wOYjDhj2v+ouRbfNXx
	qdCb5BYdANlH2Cb+NAPJFJmjM5t4KlGGB5EckBzieDLqiHmrjw5NODkwFrlg7XaLwsxhoa300dv
	wdertQlWsnsdCYOzMW7GtIzFRQAHeyQP6p9c+LKeyC2sILHXs6Qf/7uKWN2HRmCDGJYijtqKZsS
	uvqEbk28HhGscSvSveU3FRRSFLroE1vjmioNKkfOhnVNTjX10EJH/25Rv7ID7Ncf1jNl4yAqNWI
	zK2Spcin3qo0G7O/W8JIayo1feYM35sk/rfeusT/zw7C+GkIddDadq+ue2Pr+Q==
X-Google-Smtp-Source: AGHT+IEMRyI+8zulQv0se3ozP6ij1ybvQAhG+E/hVHlSg6txJKueo5YQaKNLbqitTbAHP3RIFXXtIA==
X-Received: by 2002:a05:6602:3944:b0:867:3670:5d49 with SMTP id ca18e2360f4ac-86a24bfbfdcmr2441929939f.7.1747775814121;
        Tue, 20 May 2025 14:16:54 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4eaa3csm2357278173.143.2025.05.20.14.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 14:16:53 -0700 (PDT)
Message-ID: <010b13ee-d640-4563-9215-a78c4c4015da@linuxfoundation.org>
Date: Tue, 20 May 2025 15:16:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/117] 6.6.92-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520125803.981048184@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520125803.981048184@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 07:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.92 release.
> There are 117 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.92-rc1.gz
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
