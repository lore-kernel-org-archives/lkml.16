Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68DB4B1E76
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747571130; cv=none; b=jf3W3iuLGtFLZNl4gfW8+NfYvxDDZbsSagj4M9vD7KwBuPx/4j+zCWYGDrIDSiufBzT4xidX4DKxRGwve/szLZY5R1anBIhs+OEhv60jzb6wEukrejscz7Xi4UzZqQRpfvo7nWQprwwFruQKHDgtNa9N9CiCl7l+B41zE1KCkLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747571130; c=relaxed/simple;
	bh=TAWgpRmwYMw/qkZeOsP3R9YHhY28Gsr6D6NbTTP2l2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZQ+WxFuvDqqWP6d47NVN3vRbrzIJTEKeB/NfYsSGC06ROxTlGaeIOQEvGOMjBPlUyW3aliBP6ZgCW4tMAOsiBZvv/0DaAscp/Rak1o5AgCBcSAE+QKuvPy+kuY7rgn0s5/TMR9v0OY5tJBjUA1VbaFrY90oHPv50qUKHCMhKQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KT3+Aam8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KT3+Aam8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6006cf5000aso410575a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747571127; x=1748175927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b0C+N1MGk3L3UYNtmMUl4q0v98TtNimJbMTrpDgkZPs=;
        b=KT3+Aam8j8UNar4q2GxNkG4hwGmmHcnfZ0WqACmreR7oiPEL0CHX628VnfYTlEDqVD
         wmfm2kvnEyM3FiN/m68rRXR7PFYstHiGGt0x0N4PqlZIoAvC00CvxmUh/7e5W1tEMpGU
         zEJ4f+80HnatwSmRORlmqGlX1ROC7qOAigyBv28oPyYIIyf8CE5ukRMeoyEPeFgK2fiq
         mEz5dJPl7WFKi/+eWG3xDpK9mAwKDABPe4MRpFC3fbZQk01PdJexrIO1mQRLfikMxr4Z
         x1vRoI0Ac7AU6M1Twa/vSmOEkNJo5JZb2JxG6nqjbdgAZDUbUYd4PGv5kMM3erBh8vaE
         XKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747571127; x=1748175927;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0C+N1MGk3L3UYNtmMUl4q0v98TtNimJbMTrpDgkZPs=;
        b=pO9ETL25NxHhHF/wH/OYo3hxkurMk5dLthq53DCmLTGVldvOt+c80nUqIm8Kyy+51+
         xq0YBbkdpMZUkFuHGp0Xsfip2qewb5QrmI2C7CcfbWAXiUgcJbJnxS5Cqut4frLo8k+m
         NEPZJFjfFAlwzraE88p4qKLbDUwXrCgkd4EfrnsMRVT9cazcjltLDUTt3nEcE+EVZU5T
         VNkxf6uMmRsIzGGVta9SslmHGUA17Qb6MVN0agDFcvjTiUmbjmg/VBqh05ntLAKTOZOC
         5Ir/4gxXY8oWZMjwarmK5VtFTa9k3n4n4PWc8AqNPeu8m33lJelLrtnJ7PTVncZikMEC
         U5fQ==
X-Gm-Message-State: AOJu0YxAYgf5ObMLwoP/VOcRDXwBQxJ93wbkVwLsNXhe0adQoJ3Nicb5
	JIJRlcej5Wva9B3RkpXXHAgBRBoJjHB2spW4uoNC7m0sMJxK0ZKcJm8Trg3do9MT8qw=
X-Gm-Gg: ASbGncsypJxplrHgR1WJbQbnqLFqpybh97gjLGPAsSFgFcYrNFQi9vlYmVYBLdAP3cY
	Iuul0zthQYYZDlkmnCtZhseItDmF7LDYxVFE/+5wWSvFtczJVUiIsieJBdgGl20co1qqWLXHiOp
	LKZvQjLR0I77VkUlxYHz15WzAWLk8SwAeo9m6ErS59TV/DsJI8HJQ3vQB0BKSMoRXGe65lSSLRZ
	M8wvwmFZirxTcEkaGAs5zopi7zsPqAF3mjuKVyf1l34NTmO8ah7k+2Hz9SUvehZRDg1oLgu6kGz
	EJQNmYjPUzq1+rg6dx3iXgEKjoAelr08dNhepy04nak5Z7pip50aCnNlp+eBFNvCsf0F2UU=
X-Google-Smtp-Source: AGHT+IGiMoAlJq3JQIUg0FDNpIVthn3EFkCMEOauwiFI6xXaIT4C+9Tq12dc24jCSe4K6UfBfRsL0Q==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id a640c23a62f3a-ad52d4ce281mr275412466b.8.1747571126620;
        Sun, 18 May 2025 05:25:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278274sm438362666b.86.2025.05.18.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 05:25:25 -0700 (PDT)
Message-ID: <efdfa6fe-2d9f-4c68-93db-08df05af6922@linaro.org>
Date: Sun, 18 May 2025 14:25:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ
To: Andrew Davis <afd@ti.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20250516141722.13772-1-afd@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250516141722.13772-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2025 16:17, Andrew Davis wrote:
> If either REGMAP_IRQ or REGMAP_MDIO are set then REGMAP is also set.
> This then enables the selecting of IRQ_DOMAIN or MDIO_BUS from REGMAP
> based on the above two symbols respectively. This makes it very easy
> to end up with "circular dependencies".
> 
> Instead select the IRQ_DOMAIN or MDIO_BUS from the symbols that make
> use of them. This is almost equivalent to before but makes it less
> likely to end up with false circular dependency detections.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Sending as RFC as I haven't tested all the possible permutations
> on config options right now to make sure this causes no changes,
> but wanted to suggest this as a possible solution to the circular
> dependency described here[0].


Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Closes: https://lore.kernel.org/r/bfe991fa-f54c-4d58-b2e0-34c4e4eb48f4@linaro.org/
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks ok and seems to solve issues I saw.

This is a potential dependency for a mux patch I want to send to Greg
for upcoming merge window, so it would be great if this was marked as fixes
and got to current RC. Or optionally I could take it with mentioned
mux patch:
https://lore.kernel.org/all/20250515140555.325601-2-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
