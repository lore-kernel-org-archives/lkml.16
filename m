Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB381B87EB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700775; cv=none; b=QuoVLuHoET6Nf0V/0ub51qa5x8HF/j1CCn+6y0ccenrg/UEnEa9gQlJvCiJAXPKgVWxiqdzrq9BX2CJIZdFw/4w4pIOr6J00gwIAttrIAIt0RrbBx37urkvu8IzpvL9CEoH4ZOrSnMbtjvC1lAeBsLP2g/gX2Ybp1upPP80vvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700775; c=relaxed/simple;
	bh=UEWdtFYVv5xswZzUo6j7gc3O3mQD6Ix16Qjm+RL/zoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TYBpaBdeh1JaMFxVMWtZePE0SOQEsK4A3sH9xqAvxOrqh9wgd3+K2xiJT1geidG3BSz5TJWHz2QWAZBrQyySFDvRZ9uj4KRJO2Oo1UewoMgjZKGJYlO6MDCndFHLYd76d+flMOCafxRdKRssC6t6pqT3eokKrsiv2hy/UA+Oddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=adVATb9y; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="adVATb9y"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0c4945c76so225545266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700772; x=1752305572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhylvSenSTzbTSHgGzTYtUpcoD6+sjQINmEOCQtWK6w=;
        b=adVATb9yNk0bjrR/e/O/SmU86XzEgkGIR+tezDGg1eowq4gt+1r7ivbrUmgb5uSCUA
         uD2EarSNsENbNJhjHeF0+z8TEaFkNEqDqzrlyi5rJH/Y992avffKgDCTBwRhk4IIXlm6
         DLYMkxH7uHHE7Hg8hD9kzhHm1Kyp6yMU9PtSthh3IYxFiO2YKviMX36wIoIrJFJUXS59
         j37YuMXDSpVXuggyrujUtuuWY3Ab5b6BPrrO8UNavtorPH4LXP4riiSjjcyoTEINCUtV
         vflGaK0TzF47MDraJKoojFllbDvOEeEzQF8YR0pEIeVQpqx05WqhUv5NdTxwMwh/Xl+B
         0RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700772; x=1752305572;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhylvSenSTzbTSHgGzTYtUpcoD6+sjQINmEOCQtWK6w=;
        b=CNxfmK+ZE6raQ+2RcqVgJWlFtP5eSCRss42D8L79Mr3EWPh+CFFScldgBGUwo8t1J9
         xFBPgf6T8gMJvZpoGwZOv6AHZfNdukGC3nF/PKPa4g2suhBTL2LMfs639pwGrTWb3bx4
         dI+qL/hq7w0jb26IGfOe79fWASa3nrksgigKTSnh6g9Izxo53mHSqqRaufLWTVZTO5aw
         +krTDae8vJ9RN5SuArGAioCeshxxaBAxR/aKxR7YBNIekiwxsNvWtbOwgrs4kn1mbdFB
         VRjyv22F9IRCWEzCg/yg4LdqCYIH3OFoaGSrXktZtUUlpwWsv1NYDBcMZ9SLU1DlalTW
         P44A==
X-Forwarded-Encrypted: i=1; AJvYcCXdY21Gc5J4feDtdBcU7w+xjZuopeqDaoigc9xSj6IGgnMuMQxIlXdxcrZhW19zcqlx5eChdiBvKGiMkzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTp+IYXcOMdaZfnih0qxUL6JKc9KTD/l0fF7rZst16ylDkTgI2
	fWdxCwU7T+urmQVj35hiMEUmU/KgS/+2PDZBgzAx6RZaKFQ6MHd/A4BYkqZ7nlClsKQ=
X-Gm-Gg: ASbGnctjbypFu4qChEH36NQiKPSPHwYYUqOKVCy4RzndvpjaUl34NRPaDnJp5pur9on
	ve99aSf8eH92STnilU3RqqHEzGhz0hPAqzzwevLvSBx1CxF61sW1BWGONi31w/f5c3qC9K3dI5A
	pO6miU+gRmaTFGocDyruXzXdYzZCqwnGwTtobbXipzE+XdNEFsmMNoY8z/lZXr6asTw+I5WqMfO
	AzwQx/tcGhPgouPJaXrT+7AbI/R2o/OJ+umOt3PenDEsW0PXhiT4l2dJSnxTpJwCH2J8C0nrtDl
	Ag2lPZhgcEpnR2ANslK+/S2PN8YTQPkosGLUzzwIndTg8QoXGIXfF7DsSstlxKmGMNPoQA==
X-Google-Smtp-Source: AGHT+IGypJ6ZzkoJSLfm7mtSoGrYFW/oBciDR2Yh9zboCch1QPddzX5kM1vpeJocDK+Uauw6ezziIQ==
X-Received: by 2002:a17:907:798d:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ae3fe599332mr424341866b.37.1751700771848;
        Sat, 05 Jul 2025 00:32:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e785sm300317266b.155.2025.07.05.00.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:32:51 -0700 (PDT)
Message-ID: <a70087a3-b9d4-48d0-b03d-8d48468b79b3@tuxon.dev>
Date: Sat, 5 Jul 2025 10:32:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-2-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!
