Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B5A235058
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063462; cv=none; b=ET9bmBS/miYvxIkLT/6x8m5joVapo/WbJFZLyIOlVfRXafECZH4/wlqIeTGd+eUaXKlbdklBF3z1vGP9ZKPI8M79eFvgVmvkQiHWZSro6XES1PO2DX+6FznwQs8rs6u2B1s2vXl2ZFseuty2mRPL7tD16ZCjOe36qzbPNwSC2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063462; c=relaxed/simple;
	bh=5M1AcZxtN0jg4H4pYrEdM/NNBhp3NndMx9rgVnjXMmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GMpyMV8hRGxGwV6eXbo7fqQh/ytlGVzR0FroGrFK3wZb4oZUbvAc7f33mLsjTskGvhJAZn4UcEB/UwtFBserWaVPzsRv2BFfExvGFKV3WiijiuM71Zlg1zDcpCnDRunZDHdxFfvd4EUxiro3bpZVqhDmnttdusQITutzg4yfhzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YK/oavKY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YK/oavKY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad2216ef31cso492837966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747063459; x=1747668259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJ0pZeoCKCfyAqX8wSUvG3d18OLltfb6qKEIEaqAKws=;
        b=YK/oavKYnB/+O+qpjfrA5VE3xiuhOQ+oguclPJchQQHoBXiXm1JJ1oH3Ak7TgN4jVg
         UxC9QGQ+NFKAPuOL2jqZqIaH5ingmoAOsaOR6yARjNjqiIBmOJa2LvPpgktpVnxcc87z
         k7m01nxTYoM0EU/39JbWAii9wChd0bTNnoc9EOagB+t7/jGYt7IB++CnUevUC4tZdUJc
         mXf3JjOJCwie/9Y6VhjPbslIJdq/I0QPnUw+Bh7EUbVjnTSzcraUdGMo3HZSbPryC1mK
         YftAUZNd8n2/koKsebBZNKXuVxNQ7R00AjAZdsDdsqSDOyvHShn0V5bt5H3cTftFc8BA
         gL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063459; x=1747668259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ0pZeoCKCfyAqX8wSUvG3d18OLltfb6qKEIEaqAKws=;
        b=DEsuGCiBRe3y2W3cEPGlGmkZCeru176qDZgwvYROBNZOT0iRPSikQjGvmrEeTeaLru
         xNRuQcqgH/kN0HqVqJo2sVTGL6ZWWrTFW8IzOxFDcFMsBy2tU+ZFsoAhcXWqnebLRYDw
         NIniARAFjFLmuyeNKtL+gItGEaN05XloxaGIl2q7RjqjqdHTLG2H3qKxms7Cl3BWUzfD
         MvbsjUjfobdtyX2nIZZgKR1vybnQpSPL0iOfi5aRJuIMli8bee25ypf9apIW5j4264F2
         fvFUrHlrHbBVnPtDzVJgiEo1F7uXA2EWpG2ONF0AaNQrlHB/tnGMmOwYxyimmEvxGuge
         bZLg==
X-Forwarded-Encrypted: i=1; AJvYcCWiMBhzzUZFANjtBbJFprUkhgbA6ORuSFlQy8aytjLWrlvy7/Y4J4+hnT+Rou0KtWE+n11DuB9DTkKYGWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YycAEv/Th/HOzz0QwPay6foBz9dr66ZGdjIB1g/BBq77CkyM3vL
	h4Yfz2IVWLpHTCulJmzI9oBKrg/EBpKmlX9o6KJX/WggXCCT3E/eMfpggkw94kY=
X-Gm-Gg: ASbGncun8/XwKJOjd0TW9HdtBezyJT+9VdcLGFdU8Rpq21pA8woORgunrebPfFKQU+V
	8adpoRHWY5HSEZyKXWQ7KDFiJOGqcwB3GTmD4rA51lbM2a28q4B5siZyc4NOa06pcnq4pQKVmoX
	LC4tabWY7UaY/R/kWE8rnhEZ+xlD9BeV/xM2+kSzHCjneAylKcipc+bmRy8d92iTLKbVsFcevHE
	ostaSB3/rBmgwG2mgGkOpL5NHln81ZwpZHts9npV/nzJ+AdEoa8sZgYkj9hgUMEFBRZbYq90cmv
	TWv/9CiaOao2pEIUbbEkYIxAInLfLL4hUstVp3/iVuBmiHT0v/7O57c27HM=
X-Google-Smtp-Source: AGHT+IFiscgJH74JtDHKRPJ6WOnSp0Qwetiugaufm74/HPiww3G05l9dWnAAkpOvvIaNJe+iKRRcsg==
X-Received: by 2002:a17:906:620a:b0:ad2:2d74:a1b with SMTP id a640c23a62f3a-ad22d74107dmr898443366b.45.1747063458757;
        Mon, 12 May 2025 08:24:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24121e992sm361199266b.14.2025.05.12.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 08:24:18 -0700 (PDT)
Message-ID: <c1f42c52-0cbd-4673-90cf-3e1c4de38e92@tuxon.dev>
Date: Mon, 12 May 2025 18:24:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7g54_curiosity: Add
 fixed-partitions for spi-nor flash
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250429064547.5807-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250429064547.5807-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.04.2025 09:45, Mihai Sain wrote:
> Add fixed-partitions for spi-nor flash to match the at91 boot flow
> and layout of the nand flash.
> Partitions can be listed from /proc/mtd:
> 
> [root@sama7g54 ~]$ cat /proc/mtd | grep qspi
> mtd6: 00040000 00001000 "qspi1: at91bootstrap"
> mtd7: 00100000 00001000 "qspi1: u-boot"
> mtd8: 00040000 00001000 "qspi1: u-boot env"
> mtd9: 00080000 00001000 "qspi1: device tree"
> mtd10: 00600000 00001000 "qspi1: kernel"
> 
> [root@sama7g54 ~]$ mtdinfo /dev/mtd10
> mtd10
> Name:                           qspi1: kernel
> Type:                           nor
> Eraseblock size:                4096 bytes, 4.0 KiB
> Amount of eraseblocks:          1536 (6291456 bytes, 6.0 MiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:                  1 byte
> Character device major/minor:   90:20
> Bad blocks are allowed:         false
> Device is writable:             true
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

Applied to at91-dt, thanks!
