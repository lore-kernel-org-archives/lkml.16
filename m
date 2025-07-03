Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD22405F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580967; cv=none; b=PM0xHs1ff7dh8jHz9cvnM0OO65MH9JC6hW9u8eRwx7OA0wK7xg/DkebXhPC0Gka/DfSG9uG1RKuyMvtHVinqsu9PkKrITGx4VLCGnuqOdGXBlyghUkDMvmC13SDRrSzMLfox6Tw5xf1qcRKl6r+7fawa5zOQ8ZElfxyq+tNBTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580967; c=relaxed/simple;
	bh=30eSpXy4De1lX70AW8XZs3ihzdfzo6XZ/C3uT7syH5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kb/syES9tVvbkbYNhWzJYX2QuZZPJqe8NUebBxp0VrXqTw8imOx9krHbIHSIA3gFUKr7iz4crzmW6fTFCdCAD+lu7uzuxd2U/wqwRiudWMWGVnNBAqQsiHntpHFKRg3WFwDdZAj4Yr+lz7/fJe/ZcP6SwmFde53DNOGcQiH9Tpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fYhX5tbs; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fYhX5tbs"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8733548c627so11380139f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751580965; x=1752185765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+8Lqju2v3JEpna1RtwZcpnJkSUldnP87c8e45HlgwE=;
        b=fYhX5tbs92CWzBQmSLFcJXeDUk0wDZ9Pkn43DBwPUwlNvNbDsRWitjCRMqg2Kuk/3K
         6PYf57yOluThqbuFPNfCizmJhLknZ3mdDujxWuBq03+QORyi05KJypAqkP8ksiPrl5iD
         fcf1Z6JcuY2vP9sJ81KCMc0zG/tOfGHSeSuB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580965; x=1752185765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+8Lqju2v3JEpna1RtwZcpnJkSUldnP87c8e45HlgwE=;
        b=QjfT0SQIvKYj/faYAfKWvMeIvE2cnXYUTs3XlCLLRP3K/VQ/xAR8qPv49Uq5roP2B2
         7wt0tEj4Z8K9WZmGdSiDEuNZXyO+4OhaRgRynHQKgg+kIQtpcBnGoJiQeacMEta+bHTx
         A0z4IHRYq0KmhA8y2q9d0xr0gREgree/VZKrLqCVLMeiBIUnaIGb7mSH3J/uibYNfCJd
         ZGZRa0XaUqNuS6XLhvtpA2vzDhxKXkcz4Uq3QoKmQgftu1GyauzasN3oiluy4l/w8kPW
         ZvnIZoOSYQs24qkdSUTIsvBEXMcFgWt6JklMt6Qz8plQn37OXQNdKINDa2cwCWnnIB5o
         d6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVyKlONUTN4ktBwoqbARN6BYCJJI7sfzZgedF7DRPnmkPhuQ99DVNdmFJUGgFw4NWmj7sorV2I7/ot9glU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaL9cveCZs26MhgByKCYMzhduz8L5+P65I0G0Jf1VTr73+y/J7
	UgB3k9enWPDTDXPn9Jg7ZlER+0yV5mjiJWreVX5Fv1teKGFhk20Rpajw+sqioaBz0vo=
X-Gm-Gg: ASbGncuCDbZyj0/85pbCqk3KYmDWjeSn24dFZNjlu8NINIEOUXJru4L0pCd4VRk9hkq
	eRqZj7Ac2rMV79b2ARh6i+jbbmLug/H4efJhtjjVQM5kdthnCN2qTB/chGlkncnDAZCI4zO9A9u
	xEwHRm7BpiXW6p3hHsuZ+UNN0tdFfW64n2HTNumyHWgBs4hoXzTsF9O6xDCm3avKGTeRrLY67I7
	sif4qGQVZ+IJ6FMdIkdvl7Y1eO37Mf3VieSlHvFfUTZCoJaHqRYqVvlkR5pZUwdVlPIpaFZ/+p6
	2ysCW4AsQFPuzAkMF/R+Shd3F14IGdo+SglRjHdXY93ScTkEkN/2qspa/rr3NjLXW94JCtkDvA=
	=
X-Google-Smtp-Source: AGHT+IG4hKTQLow1Kg67H0QZK1tw9mJw0uWny6JBPFtWfdVzPOL4FEhBvhn/KJThkLj9LlPS0fuDrg==
X-Received: by 2002:a05:6e02:1c06:b0:3dc:7f3b:aca9 with SMTP id e9e14a558f8ab-3e135576383mr2032415ab.14.1751580965094;
        Thu, 03 Jul 2025 15:16:05 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e0f9b8cdb0sm2167885ab.17.2025.07.03.15.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:16:04 -0700 (PDT)
Message-ID: <1a3a5dba-b42d-4f4d-8441-ec34fb37d10d@linuxfoundation.org>
Date: Thu, 3 Jul 2025 16:16:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/139] 6.6.96-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250703143941.182414597@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250703143941.182414597@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 08:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.96 release.
> There are 139 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.96-rc1.gz
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
