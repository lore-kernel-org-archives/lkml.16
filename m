Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B722FE0F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541417; cv=none; b=V2spGPwMamoVf3sF3jomnwkcXc+U8l0yqJi0/98QqM/qgDrenmJfaQHX/0XBuSx8gD0NhPuCV6OhJqwrmkWDWHLj1C1j9/BkZnvifiQnRuXaX4w3bP43FTExwtc/+lTJ/p4+K6SCnwMaXGRSbXRDCYh/1uPh2Ge5LaBAKIlnUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541417; c=relaxed/simple;
	bh=kS9GiviriiCchrXct0uEKMDSd5rA7xErne29tXNsIjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llbcwWCQriYa5IRPEwW22OlurLCEgAMZs8UnChdw81A4/VW0rXqjcL1hWUgmLoT03y6uubNVVapsEx5lQ9msBeXy9yik5XqNX8U4Pzn4hp+AsyqUBBx3JbNh8s0JBf5mCLCcAV3ZHmEupM7LZgPpRlQ1VmqGa7dqa+7pjZeEWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6M5c+0K; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6M5c+0K"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6faa60c983fso11193986d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748541414; x=1749146214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cnq3317eLDD3aX+MPu1x7nQnkfxgO3IBGujg8LJkV6U=;
        b=T6M5c+0KpJoPw6T3s1dzxMIQTzAqHfa6Hnz3do3TKGJrakZZhcci7Xt8b0GYawYRQO
         kmrSnVA8GPUS20gdUm4or5JUweJ5YKOBYGqSWRAzZDSg1eL59RkR1bq4JhlgQ7dvaz1j
         3TvmeD5mDxyILHoR9/ZHJSbjd2eXF4MTZABOsZHqedy4Bwk2DojIogjtMoPLQSquAfbQ
         M72AjWpzppzplvD58MUjdQnaOx+oGYnkFXTYtOKQF5NwbYdsRQM9SlMQepNpvXNZDFzG
         KsrnI8QvKiKfSk5zEMdJftHxw4vT6CLkEPNayYzOIyLndjU640ufbVZA3jc+94m7Fvny
         nAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541414; x=1749146214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cnq3317eLDD3aX+MPu1x7nQnkfxgO3IBGujg8LJkV6U=;
        b=KjGJrZvxidvsBxi5iYJ5Mi23JTQnJgre4lvm6+MMY/PilDx19bqqxxm2hrV2tug8hE
         4EdfyHUBbR5ov3F9mx5yjfbefgYUgYIDXQ6Rj5GZDAIzjDQ1W1MkTPJ8O8wgk0s2PYcL
         +BJhnuCEJszAgm+0vuwgdr/t9qAW/0HyXROf7mTUr/jeBpXudBiUpwco7D5ezkGqiFjk
         ycGtJZW7CBt1Wpge5sHatEHejIMWjspEyyQGxfuaelRUE4YvNd2GY/8EONtOmpUalI0f
         xBa0yFFTw/H63psJx9WG4kAE0b2rYF0Y1x2ivY8T7kgNZjilSyE2jV5aAmFyv2V9iTnN
         hHmw==
X-Forwarded-Encrypted: i=1; AJvYcCVNxslOjYZZVa22EI2/bHuTcLwc1ThAkcsIe3zlQFoZ/Mw0RR7oQc0Wrm0HdGBZQA+hvh1B1/HTjQqxwcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ8NYVCfoG6N0LpPWEG2wsXevQl2+0CRycuROUK15lIZljKlsk
	olNyZmQRl4jRMGmUlsuuHLWaMfoOidB6hRoJ/yoTdt/cyrgOFpKimMuPIUFwqihSqLI=
X-Gm-Gg: ASbGncvM4S6zxG+nAMB3yjEfh1LdSfqLQAHN6tvs8NGPjNslq4kDq7/G7Oqxlytzfxe
	6exSjVVe+Cb6Hbdbujbim9YgPZWf7+CXAAQ4Jb+quDbyVAjsyKq3EqQOkOfyGWq6Dx34uta/Bq3
	oQGUWE/qCyBQ24yBZNoluIzP0h9ExPqZTIgGg/1bgUU+IhE8V6lOpI4sj5J7zeAVYmkK7mcmR1z
	/bsesTRqrHI2pcXtfl73HhWcodS6bgdGnnjyTeR/3EFKJxFBDFX+WO3TFisMUEmwWrTvlamG7ih
	8H/MoQRk84mlO6RcqsQrEcl2154XLP0HS1r2c5M6VcQnairRRE7y/zAMNYwiQ/H5wAX2JyO/b+u
	yqF3mmkgDjTwdIVXQb1TG8AobGg==
X-Google-Smtp-Source: AGHT+IFRbPY9FcCpkFcar+WohXHkz8dPIXN2wRIAXXxo4Xlx3qkGIE/m8rbx0C9NzOjslxqzybdnaQ==
X-Received: by 2002:a05:6214:f6a:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6facebf8bb8mr9098066d6.42.1748541414556;
        Thu, 29 May 2025 10:56:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d79:3250:12f6:aa0:e9ea:e0da? ([2a01:e0a:d79:3250:12f6:aa0:e9ea:e0da])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fac6e1c68fsm11859116d6.110.2025.05.29.10.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:56:53 -0700 (PDT)
Message-ID: <62092013-1c15-4b43-b045-f8915bfc2d2c@linaro.org>
Date: Thu, 29 May 2025 19:56:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
 <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
 <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
 <20250528192450.GA15816@www.linux-watchdog.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250528192450.GA15816@www.linux-watchdog.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wim,

thanks for the update

   -- Daniel

On 5/28/25 21:24, Wim Van Sebroeck wrote:
> Hi Daniel,
> 
>> Hi Guenter, Wim,
>>
>> On 14/05/2025 20:09, Guenter Roeck wrote:
>>
>> [ ... ]
>>
>>> AFAICS the patches do have Reviewed-by: tags, so this is just
>>> waiting for Wim
>>> to pick it up.
>>
>> I fetched the watchdog tree and saw it was updated from May 23th but
>> I don't see this watchdog series.
>>
>> Is it possible to give a status about it ?
> 
> commit bd3f54ec559b554671e5a683e05794abe3a609df
> Author: Daniel Lezcano <daniel.lezcano@linaro.org>
> Date:   Thu Apr 10 10:26:14 2025 +0200
> 
>      watchdog: Add the Watchdog Timer for the NXP S32 platform
> 
> 
> It's in linux-watchdog-next since the 24th.
> It will be sent to Linus probably this weekend.
> 
> Kind regards,
> Wim.
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
