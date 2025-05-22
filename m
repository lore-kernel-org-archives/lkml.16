Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F88634F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927091; cv=none; b=OolqPq/Nb/rxCC9LgQhmw7POuCpEZqngbL53pt3exNHlB47LFDAakSNTf781bLrcJqVdIMuIbqCE2JRWkktgiYBR8bu8JAf6MExQSVsfwTfS7jeQN6k7Pl/aprBZ7xFiVsN2Tnd+lFfuXKrdAuk9hF1cpWzcDUUbqXMD0p0vPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927091; c=relaxed/simple;
	bh=n3WzFJZrJyJy3TRd5omO9YN7XI0Mkwu2gw8e8lrvv2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGoe0vwXceFZ8e/GCRLMIeA0gtRpENzTdNSu8LgknhHzDXbohSuWonMIeYzj/K3119f7t5qON5Z7WtYtHe42WdkFJxA/QC+JE71hz/5VG+5CXykKWh+sSPcwq3biKYyN6tW8wnNzr1lowDe2sh0OlibEdBNtwfpnupA11VrvG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s+CKhy5C; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s+CKhy5C"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54f67db99so928622685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747927088; x=1748531888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wG8eMfbS1Z2h99L0XVTgKxECmu1kCXg6XXKVFHh4NHw=;
        b=s+CKhy5CcIK902m8CfdzFw2LphNNt//rzxkIkEzjX00qD3UzrXMvFHfSM9cTeZzHNS
         CXSPtmgUNojzXz5zNu5SoLq0L/v3OZ6wWcQXDFKF7QRvV/KFrcfRacXo65KbjyJeSwv/
         7TPBuR4pgeJV80YMPdlCbU9fpafhMG+haVrPHofOPP/h8W+YsuQFnv2L8JhAjs6xfjkF
         bt7YZDplaYc1Bkfl9N0bkpup8DgbDhj3QTS4MkAay6IYlCzbAoHNuPVL8seqXXoDAfoo
         1HK0tgjWfk04m1DHI7b9GA170GWmxZ+j3/Mvfp7MxW90P6634pAe6MhrCvk+7VV06OeK
         DKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927088; x=1748531888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wG8eMfbS1Z2h99L0XVTgKxECmu1kCXg6XXKVFHh4NHw=;
        b=nRE+e2HT2XZUUN2kEmhfAigqct8D2zAhm3hQuldLeoH+IGmzN0+pfSVt0SsA6n/wqY
         BuKcLgdq3VmQDQMKJ8ELPZ4IC2b+KNL20zYcfRwac3rjAqwEaMQYNEidwIqX7X/4SQoB
         GvEXnAGgojTEg9eDVatr1uUjQ0JKb692S10vuvAyeUJd6DZaBfzBkChROWd7jUa5XPRf
         o3rP6bVXFF5emdmkqdJT7IIYfQA0c4cSXZWQ/2UmHOBcv6scRl3Zva1Iuvy1guSbafXb
         NfW0HdhkOZwn7s/OCRyoPKfOj4TFg5yVnBE+ByqhKZkvC14XSssb2YER48qeexC4PJFi
         1UvA==
X-Forwarded-Encrypted: i=1; AJvYcCWEGcfBbqb5Ntvr2vgvu5p5LdhaXpzvQu3LxreD3DldoxyQEvz7vOqVaOqd4ywzFn3dYz0Zg9UFMwkPH4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDwbgTuWZ8hnmPoK0G2rhIipviw+Du+QNreLh8hlpOZlKF6F59
	sE2AbUaO7ekfFCZ+agk5wPZbScyYOaIzCSzSkaqqt1FuyFZVmE9JMYbRwChIGRpHx90jyOz5Uri
	3U6pm
X-Gm-Gg: ASbGncuihaOpRG3VHlqVCUu2mk50liGSel6zFcw1JMvpkzWZNK+smC7BoaIynk2oFaq
	BDEm1SXNzgFO/I67ocn31t0UmhtoqUu4xLrqgPxXAscPbMvyXJL7v/CSU+Lt9O31a4m7RArBIc/
	eJVkxIidnVg/fBDbohtv1oNGheWamut4ivX9simu/v10FMosiXTLaNEYGxMY0Sgjdgd/JeiDEXo
	zvySP7YAyAzOx/4UZF0plEspTP9gjyMH8/pvyY8nUcJeerNxGlQ4RQaq+CYVlOhDlRTqQ0xRXll
	wbQ8fMX8y4MaL2na1TWUXh3krbO382XmNcDW7jfswXcTX9J241x29cDxrWwXRuzfOQ6rV+udIKT
	k8dyrXvpaF0sGAxFs17aL7ReFzElu
X-Google-Smtp-Source: AGHT+IG4cmOcmx7gmFRPhK4CoG7looRWEaWGa32WYscTOU9GGWS+L94+fsjsZe/U24v6RyYPVb5H1Q==
X-Received: by 2002:a05:6871:781:b0:2da:87a2:f223 with SMTP id 586e51a60fabf-2e3c28935c4mr15226304fac.11.1747927077489;
        Thu, 22 May 2025 08:17:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3407:53d5:68cd:400d? ([2600:8803:e7e4:1d00:3407:53d5:68cd:400d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b21e70sm3073148fac.41.2025.05.22.08.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:17:57 -0700 (PDT)
Message-ID: <a364f588-03aa-4fac-a35e-d1cf201e924f@baylibre.com>
Date: Thu, 22 May 2025 10:17:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pwm: adi,axi-pwmgen: fix clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
 <20250522-pwm-axi-pwmgen-add-external-clock-v2-2-086ea9e6ecf0@baylibre.com>
 <4ed39a7f-bfca-4095-98ea-56b3c183b8f1@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <4ed39a7f-bfca-4095-98ea-56b3c183b8f1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 10:00 AM, Krzysztof Kozlowski wrote:
> On 22/05/2025 16:49, David Lechner wrote:
>> Fix a shortcoming in the bindings that doesn't allow for a separate
>> external clock.
>>
>> The AXI PWMGEN IP block has a compile option ASYNC_CLK_EN that allows
>> the use of an external clock for the PWM output separate from the AXI
>> clock that runs the peripheral.
>>
>> This was missed in the original bindings and so users were writing dts
>> files where the one and only clock specified would be the external
>> clock, if there was one, incorrectly missing the separate AXI clock.
>>
>> The correct bindings are that the AXI clock is always required and the
>> external clock is optional (must be given only when HDL compile option
>> ASYNC_CLK_EN=1).
>>
>> Fixes: 1edf2c2a2841 ("dt-bindings: pwm: Add AXI PWM generator")
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> Please test your patches. This does not pass build (binding_check). :/
> 

Oh no, I knew I was forgetting something. :-(

Maybe time to see about building this into b4 prep --check so it won't
be so easy to forget.

The correct will be:


  clock-names:
    oneOf:
      - const: axi
      - items:
          - const: axi
          - const: ext



