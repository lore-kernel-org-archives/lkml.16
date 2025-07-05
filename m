Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25294175A5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700762; cv=none; b=cVPSOMQYZ+3alkIgpkk50seL2EjBZrjvHJdhikM5Sf4an9B7d0pT3IBVTisb5XqsCMFGK99jYtRFiQDpJDg9d8VI0AzUuHT7R4/UcZONYh6DuXgLKrbvp/JQyXqFeDIpqdmUe4Jwko2sDBnb343s7HQpmzrb6y9AhGH8k2FNdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700762; c=relaxed/simple;
	bh=l1rQoQVa2ndGcvWoVAsqpdUY17FPSHUf1rwLp3qlXSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z1ApGGKq3w59+QuJec0Re+nJfNUN52v0kc8CGqvsggrgPYqD06VXtg6P3btWyDCvaakHjBeHr0PEwblBMLk7EwAIqZg4CTuWMmigiZKFQM2OjMxwaCtMq3KqwSDowc43Bt9IF574251n61j2Gh/u4rex0SbetHQT8ZoJm1FIGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hKO9sjLz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hKO9sjLz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso261075866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700759; x=1752305559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRBmqpVTxqQUQSugi6++6zjAMo33X4fuKAzeU/I+2SQ=;
        b=hKO9sjLzWgVUdmM4Rf+ktW+9+c71K7Ay1phlnTOeySs4+e9xIFcB729KaNfl0YSSVA
         ty97c+rkHg2WfT+oKHqeOIq6E+l2JNg1QbP35H6189jSgzD075vQ+jaHRmfj9cZg2YYU
         b0CzLijr6d9jxQsWyF5C2wicNRUnl8vhZakB+kxg3uhUkgkOnpXyvSbz1S+jAfiz6oZP
         Jbk3XhTvp5H6Gvcan+3Wi9FnVIKqFrkz3Rhi7qvJAPF5O4qg8hDO39w7pVCWPF2+4hOU
         SfHW3rLEXAOAQGSNIjenQXyXgX89yWFO0+zvkLFB6x7ZcZG2vpea5SiEf1rB0ou9WCN8
         lmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700759; x=1752305559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRBmqpVTxqQUQSugi6++6zjAMo33X4fuKAzeU/I+2SQ=;
        b=hLFfpJVrLOXsaZFNmNo5SciKqdIt1MR4//eXQRoHv+x+Wj5z5BfTVgEugZvxupKN8I
         ZAyNxR7aXMihcUhVLxcZEB3iuxsQTbwhIm3R5DhZPNux1JdVxO9DvfNXBlrqCcZvlYgT
         yCjVzS4q/m/oU5JIeMQBC7gNPzDVj1IFWmrmeVlgFF3x8WYlwSYSI02A/2dJBDRhDqJC
         UJw+OXGR7a3sx8zo19l1oacF4SdKTwTmYz1L+D6FvbIy/Gop6rs8LH3XT1amToVlZgbh
         HBkBBFJwY/EwjuzY19yg1Z+e2mebw+pMLEJqzyxfzbXeGX/HLMJrt9BVM8KSoDV1ONk5
         o89Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqD2lNic1JSZRN8bW5ukLugnxPKfMHLTQg+dfzhGB4dpx5ULTd5Ewb2IcDL6rPjPq6kQiarhoC1knZGdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXaWrcB3KRWVLOdldy58wDwpDIlye8iIBlfEp7yVKXY7ZI0+Wi
	y6d0+NRG94UfIurUZEN3dPTZUTsJD6FOHKedgX42Coe8xP1BHk521YNbM6QqpdoxItI=
X-Gm-Gg: ASbGncuHLFhz3q9xTssQmfoenVaL7zsEgRSSYH/jgA14cCTtfQSd5N3IQa2hDYU5Hhq
	8D6B7Pzv6inq5JeJsvA3chuqQP1RvoFULZa0Q1ah/XJwncLXGUnAiRIfTaLPM2Eq74NuxWPp8Ps
	SVhsjY+/iThr75Jjd4OOZVlJj+6lNE4BDNa9z09NCoxC4lKoJmO/mrVEbEFg8DPr6t8NV1duuOH
	fR24XdwmEZjYWQeC6/ceDcUbvCVluuT/m+XJd/G5HyrPRm/vZ9wJ/adw8meSf/tfuBJV/NgZ7+f
	MzUDf1aPKPBIDuM9bwcVrHvgPHloYJVGtPzKfnRi7JmigHKknKERDrUFtcGLtB/Yx4U3/w==
X-Google-Smtp-Source: AGHT+IEs70bmSg33x6Aa+G47FWLw9oUy7Z23mFZgwi21TG9W6JihA6+ud5CNq1C0RxyIqlIE9DyHqg==
X-Received: by 2002:a17:907:f806:b0:ad8:8cd8:a3b7 with SMTP id a640c23a62f3a-ae3fe489847mr456652166b.23.1751700759229;
        Sat, 05 Jul 2025 00:32:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6949cb2sm303805066b.67.2025.07.05.00.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:32:38 -0700 (PDT)
Message-ID: <69f543ba-30a0-43ae-841a-19b209937b14@tuxon.dev>
Date: Sat, 5 Jul 2025 10:32:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Applied to at91-dt, thanks!
