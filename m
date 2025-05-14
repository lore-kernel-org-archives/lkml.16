Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704831DF75D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236631; cv=none; b=cAy8RLJSjSUBC8YHhsalRTnR7FRYguwyq2Jl0DX6IvrQzOt4C0W3+F3sXhelXajHCzcwoU2hF/VQufv2YGmkBM3maoLZTaqWhJ7WIGD+rOnbiyW9Ix1hz3dk+G/NNkfE6lyNXtrlhB+bZKRBiBQ2bfYIrRA/gNWkmjbukWTa7G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236631; c=relaxed/simple;
	bh=moZFEINmCupMyzsdUOqHVB3JKm+jOMrn4fBI7Ik9468=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TW2E2Ar96pTW6We8bjdaUJD4JTsoJ+JFRDknwJbFxFoLm/Vtskarf9MjyE9mTlbbcnrRYSx5VmqiPm0+1rmvER/l0tIF2J1GT5QEdaDQDj5X5LM5wS5K7hRI21mVZsrFFFsVqh1DqFCR3+U/iYSpMrBSs8TxJfrejjmHEZQVSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zo1rjdwM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zo1rjdwM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso838209f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236628; x=1747841428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nycOpyBxI5sRC+H1LR7ey+jyRhRD4iCs0HcWJtxwtvU=;
        b=zo1rjdwMWVdUfHn0DPJL2RiafHIcfHF1pyTtVUPGCApTtGkNU+K2QRtfk68+B0TgPV
         aod01e7J8yAiBTBpAFH8dL4PYOn7KI5RstxdaEgOhACd0S/uolb+NYgLIKGCMJxoxane
         qZFU7/Zf1yBj/xxfbzig5EpoIUyPQqrMJO5xSCUEo3qF/Y1DiBA4PdAhLU8qduMI6VJG
         VaAIUKkiRsa8XMTRSUDwM9XDxHLQnqYgotwwZR03w0/tBW5VsYejn0pkLrgz0engiLMY
         r4TrWT35P3tC+znhTFSVbluC83y1+5XuNA4iRsVn1LtfArZ6Kt2n6P+z8I0OvcO5Q5Vy
         ygGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236628; x=1747841428;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nycOpyBxI5sRC+H1LR7ey+jyRhRD4iCs0HcWJtxwtvU=;
        b=jtnTwCPyqeb0pcTW5j42gL3VNaRFR865XPjeL+yABvXCwY+iq+8MEhu7nfnXxRVXnN
         iyFRS8zoAg0/HtjUjV2yzAaBt717n0wqrfPHUo52fE/Pkx7omIXu6eGdab5E5WOxZIcZ
         1gXVmrNagaSCgpQB5goHMJE7ieSWyGzeb3UFi4JO9aSweLtkSJcJo2TvLfxa56uahGHv
         l1sULzFBXghI1do8jvvvoBIhhv+OfYTR7UV80oFnJjjc9lq+dETrgWGCSajjS+kfYd9Z
         AKU3lfvhii7zvW4+cHNmMckiVxSUsp6lHzkS5woKYPjGfHRFodotH7lkvfNB73HQZZYM
         W6vA==
X-Forwarded-Encrypted: i=1; AJvYcCWeRvkTlqaoIqDyNu4Lv0vvKBrySgpJpkWqen0By1y+UTBNXSuZukmosKtI/TgrHw84bfQbq8sAEsyxggk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPhr76bBgZjnzLKpu8cS55GZwj9ssOAhZ+bQ4lIlUFoEKYrE4R
	fIE/46oiVlhTyvKDUpRq+nO/zNjUL1HS5EcRCrg9kNSG+U74voKKp5nfk37PGGY=
X-Gm-Gg: ASbGncsxbp9zUpne1f/XbglIv2qBAvCk/cCT99GlbDEhaiobHsdUcNCMAX6UtjtzGHO
	M+144Yj5mwv67PzSFvX1OVvo6nNdwZHYsFrjpfRjlpZfZhaR7jrXjhcocANHsZwlrK5I8KHNJom
	4DwomlXt36e4J9xeK7zY408VDccwWInuwfz46RaH8tVQv/eiKXDQLrBWzR6Ki4FbFNZ/2UXCynE
	6+Pk4meUSQrbvMbeaXj2Qfdt2Z5U86ltz+u5vaIl0u4cfL3Czr564kPoFb7R/zy8InJB2Z4fSFk
	8d9eS4XEz3qxfWMGEmf5oYSYYjUI3sr85InzG4W5d40OIzPxX5juMdAOjxMMMsdzvPuiAbjkLwG
	zUPNpnsPpKARM9m4k9qredFo=
X-Google-Smtp-Source: AGHT+IHTYDs/TaBgsdW3hxCoxJZWvcRCJr5SkxDS89aSiJtpbn9D4/TYDukFeKcnbKmAmLbDJRJzOg==
X-Received: by 2002:a05:6000:2486:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a340d159e1mr7054344f8f.6.1747236627686;
        Wed, 14 May 2025 08:30:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c599sm20435689f8f.94.2025.05.14.08.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:30:26 -0700 (PDT)
Message-ID: <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
Date: Wed, 14 May 2025 17:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 10:26, Daniel Lezcano wrote:
> The NXP S32 watchdog, referenced in the documentation as the Software
> Watchdog Timer is actually a hardware watchdog. The system has one
> watchdog per core but an assertation does not directly reset the
> system as this behavior relies on a particular setup and another
> component which is not part of these changes. However the first
> watchdog on the system, tied with the Cortex-M4 #0 is a particular
> case where it will reset the system directly. This is enough for the
> watchdog purpose on Linux.
> 
> The watchdog relies on the default timeout described in the device
> tree but if another timeout is needed at boot time, it can be changed
> with the module parameter.
> 
> If the kernel has to service the watchdog in place of the userspace,
> it can specify the 'early-enable' option at boot time.
> 
> And finally, if starting the watchdog has no wayback then the option
> 'nowayout' can be also specified in the boot option.
> 
> Changelog:
> 
>   - v4:
>      - Update the watchdog timeout when the callback is called (Alexandru-Catalin Ionita)
>      - Fix the clocks bindings to have all the clocks described (Krzysztof Kozlowski)
> 
>   - v3:
>      - Add the clocks for the module and the register (Ghennadi Procopciuc)
>      - Use the clock name from the driver
>      - Removed Review-by tag from Krzysztof Kozlowski as the bindings changed
> 
>   - v2:
>      - Removed debugfs code as considered pointless for a such simple
>        driver (Arnd Bergmann)
>      - Replaced __raw_readl / __raw_writel by readl and writel (Arnd Bergmann)
>      - Reordered alphabetically the headers (Guenter Roeck)
>      - Enclosed macro parameter into parenthesis (Guenter Roeck)
>      - Fixed checkpatch reported errors (Guenter Roeck)
>      - Clarified a ping on a stopped timer does not affect it (Guenter Roeck)
>      - Used wdt_is_running() to save an extra IO (Guenter Roeck)
>      - Fixed a misleading comment about starting the watchdog at boot time (Guenter Roeck)
>      - Replaced allocation size sizeof(struct ...) by sizeof(*var) (Krzysztof Kozlowski)
>      - Drop old way of describing the module and use table module device (Krzysztof Kozlowski)
>      - Replaced additionalProperties by unevaluatedProperties (Rob Herring)
>      - Removed the DT bindings description as it is obvious (Ghennadi Procopciuc)
>      - Fixed DT bindings compatible string (Krzysztof Kozlowski)
> 
>   - v1: initial posting
> 
> Daniel Lezcano (2):
>    dt-bindings: watchdog: Add NXP Software Watchdog Timer
>    watchdog: Add the Watchdog Timer for the NXP S32 platform
> 
>   .../bindings/watchdog/nxp,s32g2-swt.yaml      |  54 +++
>   drivers/watchdog/Kconfig                      |   9 +
>   drivers/watchdog/Makefile                     |   1 +
>   drivers/watchdog/s32g_wdt.c                   | 315 ++++++++++++++++++
>   4 files changed, 379 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
>   create mode 100644 drivers/watchdog/s32g_wdt.c

Hi,

Gentle ping, we are close to the merge window.

Thanks!

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
