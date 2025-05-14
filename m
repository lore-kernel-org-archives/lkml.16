Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DA18B464
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234455; cv=none; b=O8FuJ0HIP4qBOPrCx/YuxH/2K+umOOnFYjzukUoaPiriuavec4DoeNwKiHzhMMVB+H6yXnYpE9Ssk72+6o7v6ipwCpxiuCdej0YlQab2X17nlNgLpL0l23/PN6GTS1q9AyOHhh+7G6rQndduan69KdGZOS0Vo0K2LO5QRdVpsPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234455; c=relaxed/simple;
	bh=w7qoMHBMOqC0vvUKqOZPKfiIjqaN5yfSLSpZnJF2eF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7+W1MyiRE6ejmP9O0mdY4fhFOJ8r6MQATyNWHlV13Bc3HfJ54R+IPrArF1ic1Dc/6qJ0EpTa9JZm3tyzdfvOOIfpHQ5KiKHkeEQubGwFuzCVrrK96OZp4w2YgKILmjwsWzNzN/OpV9voTVoCpYiklOgi1S7bwwrrqHM0NnJb5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2ewC/mk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2ewC/mk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad2452e877aso714977866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747234451; x=1747839251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wkf8rb/WvEcawzV/eYsPzEKfwzwmCl8b0fe0pKNAHM=;
        b=C2ewC/mkPwv4jMAQ/Emo/YX2Gihy87ol1yAfltgUgqLKlN1U7bkSMeMZgq5F8dN/mq
         SeuL1naEjge9B5aKJIEo1SJ4M+dBR4v2+0kjlk+3gHwwjjQ84As8Nczcs8WaUVj9f0h/
         Q1BBWER5d9yFUsOP/oKiPK/O2VjsuNQdPzCQu7L8Z+v479r7NfspUW/i8L/GMqsQf6u2
         js6UCFwx8inEFyvGu0RH3DbYMkSe4wFA9VelEJp0RSYxJIlzhg9Is29DuRtfiVuhpj26
         lFCLwdH+bapd7CPUk1blBbRVbWtybQWN0oxcOA74gtSjGFHBmBYX8i2a9NXrwz2zScV9
         os0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234451; x=1747839251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wkf8rb/WvEcawzV/eYsPzEKfwzwmCl8b0fe0pKNAHM=;
        b=wb+AzbzMuScTy0okzmCTfffDNsd3Byy1ggsF38hNzKvLDFhhj6uoWfoMN4aXCLoo0p
         pbMClTxCjbNhbk0wPNS517HfDFXfAeHxp0c+1XP7ef3pAyNNtOxqGmHbIqxrrQviRUls
         fYs5jOl8sI96734+BKr/8vGuRK8Me/YK+c5uEEwnVwngU5bR1tpaBsrfvzY1il13NEPz
         kp9dYkAu5CUBFYPK5O/uv7z/OCHhLZdnlT/Cg1OZlA4xJtn2BkkgChmBWfsI2zdaGLWe
         xJjeoy2FD4GouZaSI6LZnrEg5r0rciuvIEMagXbP1CS8lFOaPy2J6t+aGTpdJN/jl1DH
         o0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXggTMfR8RK3AqKVjtejCFiAE9Geoqac6+9Vz7qIe0gcmktn/qBM6SGIitnAypx669o6cTw96cQH0brmU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuXJMxmYjvhrcpI9PPN4ebJjZbdeGq2sDXAL5QxtKC6/IJh1Eb
	jsRYBM3wHSk2VXqHCILXog8Phq0aQG/sIFti00PmjG9lGv5oIT3glGk5iozvupI=
X-Gm-Gg: ASbGnctD8Br2YAhnxKtf5k4WoxCI3BMy/AR8pJ6w3WkGrto6wRcv0x/CGvmJz0R7zKu
	DRw65bfe7VLj3xoHLd658yd+Uaw2U86nKlarLZD85zZGFE8Uua/TdcKrGmNHKkmJpXaT2IPR7j6
	lxc0ReR/D18geGX9GWheUleA5G7538ottB0eV1rA9r0gasqx8W2oysp/lu0KvBXyCF6XG18wfqG
	RE/AdKFXz6R0YyfDo4KtlIPUd0dLjwYnxVP2CDzw06SkhmKSywESL9rjmvXuXPZIYX8grO7g2DV
	dhXtKOSZCP3vd+DjATUoBWQOfxW9A9CZWENm+KvxbFHYj6OWG0TWYbpFpJxeUcqokQrJA+4Y6YU
	n9DmPIIY/Zg0U
X-Google-Smtp-Source: AGHT+IHisVoXhE3+Euo/Kfj1mcUaVq8+QWNTO5B+q59E7ELxOHelWmYLRUFGUoCsEikCXUP0Pehyfw==
X-Received: by 2002:a17:907:9727:b0:ace:8398:b772 with SMTP id a640c23a62f3a-ad4f7113f45mr438476666b.14.1747234450892;
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bde09sm944356866b.125.2025.05.14.07.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Message-ID: <bdbf5357-beae-4e01-9a9e-f02d21f30eae@linaro.org>
Date: Wed, 14 May 2025 16:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Alexey Charkov <alchark@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
 <aCNqCrBqGSxRGMKd@mai.linaro.org>
 <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/25 18:08, Alexey Charkov wrote:
> On Tue, May 13, 2025 at 7:49 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
>>> Rewrite the textual description for the VIA/WonderMedia timer
>>> as YAML schema.
>>>
>>> The IP can generate up to four interrupts from four respective match
>>> registers, so reflect that in the schema.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
>>> ---
>>> Changes in v3:
>>> - Added Rob's review tag (thanks Rob)
>>> - Rebased on top of next-20250506 to pull in MAINTAINERS updates
>>> - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com
>>>
>>> Changes in v2:
>>> - split out this binding change from the big series affecting multiple
>>>    subsystems unnecessarily (thanks Rob)
>>> - added description for the four possible interrupts (thanks Rob)
>>> - added overall description of the IC block
>>>
>>> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
>>> ---
>>
>> The patch does not apply.
>>
>> --- MAINTAINERS
>> +++ MAINTAINERS
>> @@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
>>   F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
>>   F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>>   F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
>>
>>          ^^^^^^ those bindings are not in my tree
> 
> This series is based on next-20250506. Happy to rebase onto 6.15-rc1,
> but these will result in a (trivial) conflict when merging the
> different trees into -next and to master. Please let me know if that's
> better.

Usually the conflicts are solved from bottom to top when trees are pulled.

If I solve the conflict at my level, it is probable another conflict 
will happen when the tree is pulled

Please rebase against v6.15-rc5

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
