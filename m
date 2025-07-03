Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E6239E76
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581148; cv=none; b=BndWdqAW4cwWay2xVXF78HIEL54GK+p24d/1CckOO8Sfdj7dZ4h5htgWNNEidWp2P2pkD77lj7RRhcPSN/LiXrwjtv65EqcJtFTdQdpilv2jCDoVDxVSXn6MthIiE9hiPeuvJUhGN6C29FNlrBjFMFVrdEJA0kqH1DUeOG5SmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581148; c=relaxed/simple;
	bh=bsQzXNp8DClq+bAKZa3sdGA9BUSFmOPEFWdTtJqquII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sx4ENUKFEE5ftvp5cS3rblpHdWhhy8Gg6o/56x2ygvaFL75vxP5Lokpp06sQ7vhx+vY29GCv6yxbka8gArfgdStFQnn76dLnvbiXE9SicBu+JQmrQAYTlvsldwjxFs78gJZHh0+4FV+o0BcNPX9uJ9c/6Im7LZKQSJRjsgfEjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hY8v05Ic; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hY8v05Ic"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3df2ddd39c6so1546745ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751581145; x=1752185945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/ohUAJwNxFFjxA7YgIpc1NqK4PGnlTrw2zPL9RW/ps=;
        b=hY8v05IcJdcYv1Qx0OqiqVEUTfTC9LfjHDyvDy/hG3sKE1VkCpfVXNl1jDAzIrcSIB
         Ou8Hca+iBZbPqo2M+/uhpT5qPQoa+qls4RZcQd4J+OQqmgeuV4WkzusyHFTxtIkEVerb
         7PuHIDNf7AvDdMH+5KTf6ajyUpHA7AAs37QTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581145; x=1752185945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/ohUAJwNxFFjxA7YgIpc1NqK4PGnlTrw2zPL9RW/ps=;
        b=H8DgGV+Ro+VKGIzRmVb9YsKrlNWnj5ml3yy0kNNzYKy4dU1ADSdxBC/2MIXyDr/r07
         7ptGkQsMMamvutIan+UwL8L3XOdFrfNuxNM5TnEgTShbM5WMLaZuJ4hXGOoWoRzwNVjM
         HBA1wTScMM7Qt35XNvLI7bJf+eR0utLD18EXBpSVAUZtf1eoiZvdi1g49LjVF5lK4mhn
         g8Wjii81YUWooTRUP9aJLbBE/Qklz9k4G0yP+EJB5ZNTRi7l5qF7PJ5w9iLdIQidgT3s
         OZUw7klnLGD9MDBB9OOQ1Aa2JSzS52T3ubsazgTdSoBHjmS1u1qrUJnFGX/ntY+F66cy
         l38A==
X-Forwarded-Encrypted: i=1; AJvYcCVDhfgb4U6b4z3xEuswTPr9CFBHEKUWTbO6XG65gH4/b3ORhZWgBH+K3riBRdmOkdN+LUXj8wjIFzureXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDzJtA7Y9VuCAuViMqm+CJIuwEc4WZ7wMY8lk9XDXfG2bCwcK
	TN+D9e/4H1yOOCsuOjKswnxnyWAUtIWPGLaR3BuOmCyA6xj5yyxlrwW4l0jdN2+KttM=
X-Gm-Gg: ASbGnctqDBnDRvIZaU6VOvnCscNeQuw1i8Z5AGXj7tUnTxlm84ZIr0KLlmvxrvpREFk
	IiOjQ4iC2zR/NMLwjHZ913OL1wM0gNj3/mcYtWyZaBxHPQCa9f+qnb14lESQA147ieIOqwv0XJp
	WqV6PITzWQKkt06ynbU38yLc5bSs2y6nuwJLvCat93fGeZVW5yFjWRIp2LJDr+Qrr/Xda7XV1Sl
	oRNkyxGpCUTDuTjUnLqp6rggZA+pUMo4BuMrE50U8JjINN0el18Z8h39BNlL/qypX9p3W99Uq9n
	H/REDRuYKs112q3pu+AQu+OWWnJULOW5rUhfVRurrF6XTMaCR2hr+z2+wTZHKHvgDHT9FcnVRw=
	=
X-Google-Smtp-Source: AGHT+IFkjsoDOoPrzIbbcNU8K6UylrmjRvuaaN9lDoZeoFFVq77lPnUcgvPUJ5086KzCi0xghesVaA==
X-Received: by 2002:a05:6e02:2189:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3e1354bfa00mr2010855ab.9.1751581144798;
        Thu, 03 Jul 2025 15:19:04 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b599a3f9sm160059173.12.2025.07.03.15.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:19:04 -0700 (PDT)
Message-ID: <70155955-936f-4280-a0ae-c1e48af3ef28@linuxfoundation.org>
Date: Thu, 3 Jul 2025 16:19:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/132] 6.1.143-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250703143939.370927276@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250703143939.370927276@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 08:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.143 release.
> There are 132 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.143-rc1.gz
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
