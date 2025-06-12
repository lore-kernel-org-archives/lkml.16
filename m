Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BE24337C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735952; cv=none; b=XWOMx9zXm0ueXxgVnexrxLESgChElp+G72f3i6MEx3BgJ6LWdgmUvEr5ItvIbES0GpWEOJNCwEe4iynyDb/ba7QFgcjiZZFgvf6R9aRQaYKU/IgFUgBZAfP2RGARKp83Etu7l2nKK0dvuE9QNHXpX7nQZL58xd8EIHMwMPr8LPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735952; c=relaxed/simple;
	bh=WVkogQzM2NB74PMlAZe7F+r6QnCH73UJBFVE0FbZNxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moBTzwWcirLbxBk2wSY461tR+TjS0Ow8Aby5fFy6uFz11oE6w7vBSkkm8GUvIgoRvFs006QG43IvBUOMy/UynkSdt4/uHHQlCWQ8SzpgWvffvQgvgAPVfNshkBXBzR/2eSepHZahGrodOVrCvhQBsBOuOXLbweNgZu0+Ou0k+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PB1jBxL4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PB1jBxL4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso158956f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735948; x=1750340748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFS+tzU1PTBVNIbgbt33HlW9jxX0q+T17o5SHXqVTL0=;
        b=PB1jBxL4Kj5BVlsZ+OIzBST2zQNDq5/27JtXcjIS4IvTSmU92YWByj6di5pVwPTeI3
         EzR7pecozLlFhNEKu76MjLU2mzQc7RaBMxVEhio25Bx7uqF/aVMWv5EA+M+CtvC670TT
         E0PwCEAmdi34RhdatPmw4ESOIVKjsOiTfjCG02IMzqOOyj4CbE2S4eJ5igngB/O9ZSri
         QGm4R4Imj1tY81ddPRAy1u2opSC7L69796SFBrJtYx523Gvg/YR0lVew9KdgyzYM+8st
         OGh34OQP9Uz1/gnTUniOVtcDDU2KF9taC5nF1epylc4PTXfroy95JT+lwR+DDPYEs40I
         ATjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735948; x=1750340748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFS+tzU1PTBVNIbgbt33HlW9jxX0q+T17o5SHXqVTL0=;
        b=GCxSoxYkUikIAutj26cTx/FAbBPxrUP9pQb6O9gUuaVotvAe7YE/1iGsvq78OiphO1
         uerE6jnkTtAXlQT3vCS1bA6vK1x8V5qj7aoSacsKxrWB5tZHVXpzFdLywWM38Chk4Jrz
         VufvHtxgkPjmhBm+HVpBOzOnUp1bnu6r6C9raKTWxfdkXIyOOZFtuV1+AnTVvVD/kY3f
         ZNsLDG4m5mlX9fcJRXZMTBfgMCssf9lH9LCUqrZAkwqIoEBNAXGrt4ERWGDIA9R6EasD
         pI0p3uvkiFI6dhluiLCkui/7+NLLQkX/Ds3B6vH7K2uxOGW+PwKl6WfTyZMyuFoFC3um
         IEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA2OFaOD0jdduh6BQRkYcAub2LKaD880quz6FUfmg+YfSaXuLaN2R5KIiRhlmdWj0A+pqm8b2aEXN3p2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5BsX16yXWqGFs29XrEFYbFcEHwlVBDVQepPSNDh1/17Jwf8L
	gn+cNCjR6Qkj9zv8K5IcS0AerwVd3DRouU7y1NfB6SFNmSJpKblLZNniQ+T3QbKeM6M=
X-Gm-Gg: ASbGnctsj76PFjQYhuxHS/YXGox9BGQLhNZivnHyeInXxUE2EKnMIEhSYmMo3demUFU
	8t3ihjsmFjZpUX7tr5gbMfsxCMrc9NmyhUDVWBZIRPnvWO2QLG3iWHeE0qfkctzCHMqbFCCbwHa
	xx0w53SWdJRbkE0JfPUy+BNkrn2HA+HXpfyT0XS/K/774647Pd2lGvTx6+7x0mtuaWTBYvvc0LL
	ae1cHGukS1kUgN1dzASNH7jlmDYwvMpPveU3qNfS0Tcx+MvqST2YtXyajotJ08ZptWpKdGnOXC7
	YbH26+kMGsS72DsiR8jkMHbPWOgygh1EJmXse85kL9ZAITh9lEsUzB3saMsiQ0fTmgJAbpXgXmd
	Nntbo/qc=
X-Google-Smtp-Source: AGHT+IH4t/UQaGFpHnjGNvxWJ6BkPEz48jvJdMiP4Iqu7ZDfUHh58OSY9dXNCy83MVYJ4nUOMm6V5Q==
X-Received: by 2002:a05:6000:2303:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a5586cba07mr2265575f8f.7.1749735948418;
        Thu, 12 Jun 2025 06:45:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619ab86dsm2022108f8f.44.2025.06.12.06.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:45:47 -0700 (PDT)
Message-ID: <a92820a9-50f9-4127-96f4-47fb5715f441@linaro.org>
Date: Thu, 12 Jun 2025 15:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
To: krzk@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2025 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
Opposite...

Best regards,
Krzysztof
