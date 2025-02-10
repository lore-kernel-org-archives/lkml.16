Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD924F597
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197243; cv=none; b=KCPoEtCJJAb72lTByMXRO/bju2Hx3lP5pVeePFOAVcRc35H7LrkHJxBUlJ4AOkSLDsaD9ZgB3DXg7uKWGhZyzT/E2jpc0Qz0XbhC0XJMqSMzEZJ5cXJYIaL1WjSwMcFgc5OIJGOIaurEZG5pARSeGjiHOCCYzQPwZhWDFfXPdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197243; c=relaxed/simple;
	bh=snXgSgFdqsMqouHX+FEXJR3/7OW6oISDWHweXCSyk4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMLsfLw+jY6k4gVZk5ZqkqoUBFsjBnH/qjSjWi7v3GMdKfuPoe2cFdVe/HtkcEjwB4Ue7aLzHtgA6MU/Y893ArSHnstJow7lhP/sSKmJmFvUvvtI51fqoL6l1qdGgWkNrljlHKf6WI/pOorj4CjgtL8q8DgaStI5+YlGMnczQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iA+xuQmo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iA+xuQmo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso44220235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739197238; x=1739802038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgszuVpBHpm7kgwMFZqetPdXB23RF5n9Jkx4SmORsb8=;
        b=iA+xuQmo87q9X4gEevCI84c6VZzujpaHhxUbxzgSlB279tOK/MqKd1xE8yza4XOYp9
         8ig1Vzt8JA7QHXdrD2ltWHN3UARXl8T3MqTjUo5d1Gd2xftducDpOJOCr3ou1A3b7FoK
         Uww1bwPaBetjm7gwoEk0c/VtJukDWRGlmy6mTFzGjKTHUoBsefXbPbU5tL54gh0/Je/+
         tsKQssZzYx69eqF1pNPGc0b5fZdba9Ry3x7tjHrgjXE0zATMicKSl/uYrkHqFb87r9eW
         DIfHgtDdUzXmm/yWM/1S0TklWgHXkMndEV7frfjyXOkk4jM1jDfNj1DM99jxqexcbks+
         NImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197238; x=1739802038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgszuVpBHpm7kgwMFZqetPdXB23RF5n9Jkx4SmORsb8=;
        b=hC3toUkE3nsiNEl15XWgrnYb2s+1bSN1ux0wndvRy09BBC5b2t+cnI6BCk1EOZ+P66
         GB5Quw032l4G2a/b75azmGvNcIj3xBSG0QeUPSnkIVfHWTziq/L63wzcwQAirSZvtXAU
         piqch6MWGP9Jzi6Oqs1iMn+iLcHJ4brBL+icgW3VP1mwoN2OqfI2nW6366+ZwpD/FuvW
         /kdueOd2WfIUOO8qBC5y7P4xMXOhwxWiKB5r+M36MtZ1dzsGwsgqA+F87IV8V5yWeoTw
         skCZKOQOywukAgThBFyi/EUoKtNUHxZv/E9LKA5E9HIHd7wVtyVC9PlXZC2KePgarQCI
         xZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIQUCZSCOnzmIgf2BXentahlNcygkBcXwGn6lMq9h72etE3jukAtK9o7YumYc+kvVxUVi27iKa12+0hyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6CG5ta0aFjw6FkMtw9u9eEEa0h6RL1SNvxV5v9k6RbnqDWVc
	T9h63U1z/ZVqY941z47QgjD1CNCrHx8VMU1nKedPsKkcCVcweNE9QUSgbD7Nc4M=
X-Gm-Gg: ASbGnctEu2TjV/e8htiJd0pQ4JNWjqrK9ZYrdqjLlRwnJewaJmu01SDtgnkIpsoTePL
	tozNiqRASEOEMq6LuAF7LQY7palsijVqWILWdNcv4UtmbLlI/Lq40AGTBS00D1H4WK8w3Lh+lr6
	PZ9eD8pfKbn2vCJsh4SevBh3iM7kVIZjOVklwE2z4sgDjBpXDLW03mYFklzowbe/93uj7Qi+3lL
	VoJui7hBM3psH2gRGK2xbL87xUavWMmHytgCSx75TiocGyywQC7TqG+u8WVOyo2CS4cDG5lJmWR
	gxF9TG3bQXqIj/yPjZrRIHsamUqF2ZMF9sPN/LNDg0D0XFmMfnuhM/2L7PXN
X-Google-Smtp-Source: AGHT+IGKStkLxD9udujUP1zu76uCLYtJOZTx3Zzwydhoh1KZeTcF+eyoEegxFpUsUPG4WioYRaf5+A==
X-Received: by 2002:a05:600c:899:b0:439:3d5c:8bfb with SMTP id 5b1f17b1804b1-4393d5c8d77mr45714375e9.22.1739197237724;
        Mon, 10 Feb 2025 06:20:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm184114345e9.3.2025.02.10.06.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:20:37 -0800 (PST)
Message-ID: <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
Date: Mon, 10 Feb 2025 15:20:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/02/2025 15:06, Andrew Jones wrote:
> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
>>
>>
>> On 10/02/2025 11:16, Anup Patel wrote:
>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>
>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>>>> Probing unaligned accesses on boot is time consuming. Provide a
>>>>> function which will be used to look up the access type in a table
>>>>> by id registers. Vendors which provide table entries can then skip
>>>>> the probing.
>>>>
>>>> The access checker in my experience is only time consuming on slow
>>>> hardware. Hardware that supports fast unaligned accesses isn't really
>>>> impacted by this? Avoiding a list of hardware that has slow/fast
>>>> unaligned accesses in the kernel was the main reason for dynamically
>>>> checking. We did introduce the config option to compile the kernel with
>>>> assumed slow/fast accesses, which of course has the downside of
>>>> recompiling the kernel and I assume that you already considered that.
>>>
>>> The kconfig option does not align with the vision of running the same
>>> kernel image across platforms.
>>
>> I'd would be advocating to remove compile time options as well and use
>> another way to skip the probe (see below).
>>
>>>
>>>>
>>>> Instead of having a table in the kernel, something that would be more
>>>> platform agnostic would be to have an extension that signals this
>>>> information. That seems like it would accomplish the same goal and
>>>> leverage the existing infrastructure in the kernel, albeit with the need
>>>> to make a new extension.
>>>>
>>>
>>> IMO, expecting an ISA extension to be defined for all possible
>>> microarchitectural choices is not going to scale so it is better
>>> to have infrastructure in kernel itself to infer microarchitectural
>>> choices based on RISC-V implementation ID.
>>
>> Since adding an extension seems quite unlikely, and that a device-tree
>> property is likely DT centric and not applicable to ACPI as well, was a
>> command line argument considered ?
>>
> 
> I did consider adding a command line option in addition to the table,
> allowing platforms which neither have a table entry [yet] nor want to do
> the speed test, to set whatever they like. In the end, I dropped it, since
> I don't have a use case at this time. However, if we really don't want a
> table, then I can look into the command line option instead.

Sorry if I wasn't clear, I wasn't considering this as a replacement for
your table but rather as a replacement to Charlie's compile time define
to skip misaligned speed probing since it is like "lpj=<x>". You can
specify it on command line if you want to skip the loop time detection
of loops per jiffies and have faster boot.

Regarding your table, it feels like a bit going back to old hardcoded
platform description ;). I think some kind of auto-detection of speed
(not builtin the kernel) for platforms could be good as well to skip
probing.

A DT property also seems ok to me since the goal is to describe
hardware. Would a common DT/ACPI property be appropriate ? The
device_property API unified both so if we used some common property to
describe the misaligned access speed (both in DT cpu node/ ACPI CPU
device package), we could keep a single parsing method. But I'm no ACPI
expert so I don't know if that really make sense.

Thanks,

Clément

> 
> Thanks,
> drew

