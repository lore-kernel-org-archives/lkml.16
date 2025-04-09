Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BD81C5F25
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224322; cv=none; b=Y/khUsC+k7uzRgiluLCDjQVIBltnEQ+Qcy7CWROogTWppWCmv/JUKn4cOLygCOO6T6J8ViXkvpfvQEQmLaScsu6fUI8Y2u8EBnlxjNYjnx5eOt0crhH7cgE8Ccxg3LGRX2J0qfMhbxUZY/gnSSGMTyF2uBmqneuY6umvqGjH4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224322; c=relaxed/simple;
	bh=DE94AF+o8GAnUH4MVceaHQSwr76zM1gbMHM/bt4QTz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p14ftYGnIequiLi3ftkz9Q7rgOBhjWZltolced4lZVAvIklmsiOuuebrnK3XoMtxNWA200M+XYPLGRZ7EUx7T6aIrGRibjkmot/VqzOX9+tIaXQtFWp4+K0g7TKRE+ng8+dlgESzz434hhggAvV9gqsByj7XQgF8TAJ4lnOV+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GKMEDyiq; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GKMEDyiq"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ce87d31480so174095ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224319; x=1744829119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SovPoqcq00HkS54A0arEix/uaJanWscLaN21MAd/PrQ=;
        b=GKMEDyiqddNw7n/PoowaEB/HtzAGonpt0OtZlRwnPpVFqUlzW5yLtNMjnrvTm1bwyF
         vJc1AnXMDw8aaGh3z4gv22ZJUrixQf6gmPLFU1AoQqYaDtHlVLPS8rBjCtbtROwFlfB8
         ITjPacSJPs374FSBWSeGkLOQnr0SHPdeXuQ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224319; x=1744829119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SovPoqcq00HkS54A0arEix/uaJanWscLaN21MAd/PrQ=;
        b=GnXJqCaRK83SVjclCz1cvxHJlzY5obp7DYoevFIZ1dv2m9qbW/ImrPbR7wWoKRNKow
         cw0snLT6P2VtMK8jFoCPxi6R4nM+i0azUNBkwZyuE3CX5xxfkvNNHhTu1SbPP3v/qmQ5
         yv+36jAWgVg8m51tNeJosvXBYMKyUIOKldI9rSDPZZV2DWwXs/HMwYJ9h/CiA8pzrN2J
         SeZiiUpBVJ8fweMOstLMMyX74br2cHCW0YLh0Ky9cPOwEiOatE192yl3HrxqcRf2Hke+
         /+7iVTjHa9CrC6kW8UJPPtAXgZqhDgkYwV486W7ulggr2o7tp2AHhPJxQSoJamA9I9Ap
         92Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXXsFrbefA1CmTB0ibwk5lehVhB65rAb1UHAaDpbQHQ5mrQ2j4UeSOv/g5nGUmSI5HVwUmxJ7CR7e4s8GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEi8UkU3ja6YA1mc97uKk0epe2r146sMv7bfUt7jt6ecyVT7EE
	Tg6Ade9eqqFHi2tg7AW8M/AKu82hriFR7g4B50nkeXwj+6G7oIu2y4kPamPMjIM=
X-Gm-Gg: ASbGncuLY8EZmLN7GMtPx9N2dl2RCk0qouhFZKDqebzB3+Ezaf5dFnxoxcNzru5JShh
	8nhUsOwe46yxaJobqt8el20lqeBQexoJAcXF19MBlg4IjwOwRymaNUyxFldaeuc6nHL2rvctwap
	U4CAdtz9+LQd3opjzvhovW6gVp7d27XuSDTiI4VbmiZKeYn1LqfjHrKMMaOgIf5jDgWnubY36zf
	7RZ3CmeQZ2jA/bEoIdBiONvtJhid2SdyYPFvxuKWn4pKpgj7wIY9nDFv2B4ukot8e0Xp8/1+jk5
	ReQMffm6eKZPYWdpvPrEQv0PuyGw+578VT58SVxE33znebCYuBimX/xVJ0CCag==
X-Google-Smtp-Source: AGHT+IFt7sGM71TKjQg4Zk+NkDUv8HxSgsY1JlES7yCnZRK+kvYxcZDFPFxB0ZS7tX5AtgSmKJPbcQ==
X-Received: by 2002:a05:6e02:3c86:b0:3d4:36c3:7fe3 with SMTP id e9e14a558f8ab-3d7e46f8e7bmr1712175ab.9.1744224318764;
        Wed, 09 Apr 2025 11:45:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc594eb2sm3769065ab.70.2025.04.09.11.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:45:18 -0700 (PDT)
Message-ID: <4455cd1a-cb95-4a8a-81ad-ff2cfb6c96ac@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:45:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.13 000/500] 6.13.11-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250408154123.083425991@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250408154123.083425991@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 09:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.13.11 release.
> There are 500 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 10 Apr 2025 15:40:28 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.13.11-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.13.y
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
