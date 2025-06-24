Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FED1F9F70
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749534; cv=none; b=GnkRXlQE9G+3+eqPTW98g6T7k4Qh4hhzXFBolbdtP1ef1Nrr8BIPC9VdtXAi+kS7vC5bZtTVmxkoUTFfKFmuJcB5DH1smk6gOUPxi0D7uPdlHZHkRH0Elp34p7H+07PB3M221r1Tcjf4mGW7x+oVrL/eW+RTncbvA32DD4ncwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749534; c=relaxed/simple;
	bh=lLTXEYlUZ4GhNVH36tePDrs71r0Tbb+UAAbvWJzpRwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHQ9oHp6PaZRaOivej5jmM08X3cFtu7tPcDUjVwDVs7WF8Vn0jST95g7Da+/wVKYlkKZqOGW8ar/rQDmxJ8L5aTFsk4eRFAqHIuWbycRbnnDIxE0w0NXqpDG4yMxRhuR46w/2SJWCR20PiDM72WiYQTjXCEmbdsITWdnP7EWY8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KqtDCytv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KqtDCytv"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad89ee255easo911824466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749532; x=1751354332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OVh4Jh0rNBjL9Id+4yEZcEDrJ76F7tEWKqVxELxixE=;
        b=KqtDCytv6sULEM/q6YZzp3fQFpTRasjQLiaQXGyA9CWdOrVxOqje62v7NQ0wRJ1xvX
         8fhSujsUQwUWpigKFHe+YLktEVtj0m5MDx/EOHmeuM7vBNCjHYv0HITGPXyVkKfKfloT
         YX68FDgDgC9i01H63/dFN0ExThSeD0S0NzBtih2SDbIX7TaoBLpBMh7UmaH2VHNRxDKu
         HClYjijxO3g/BvFsj1sOE++fFP8m5U879B1HAkH3/an8hkf8A03j8N8V5WwErzLNMKKZ
         HpaNXGKE50To9EnNShX/s90Ne7p5db3fU2uttith7ltm6ShIryFBEalzwt3Otsh7Hh+6
         TEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749532; x=1751354332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OVh4Jh0rNBjL9Id+4yEZcEDrJ76F7tEWKqVxELxixE=;
        b=BomlgRph5t4UNlLxukn8vhWKgcDsjVWI+93UKpBkeGKjLBJUHKMQJnQrZTnf4x24tl
         /664d/t1y+cSk1u8DKZ3GNxH0896EmwE7hlCoqOAW1gdqmp4VZy53losNcGc0q1ZO4Yg
         XnzBZjDIJOw8S3TkaMkxZF8lPlQonsrrmCLEGl+dr+EozgEnnsqml5Hup2R04jO9C97N
         tenHnxbfgODe+01X+yQGsFehiwzpKxaQVl4GrwWppYGz4SQK+1OTRZH/WuLNdOG9jQEb
         v/Hps3zPRp3qarBq0xr4hRehLGmXUQiaK3Xcu5ery2WWfivItpPhiHb9q4dJKVTdto6j
         h/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgby5/zwu75C89I093wWyJYhC88o30aRLPq8O/ylMrLt7ORbeDKO18rhSHGnr56uHtiyVq8lfdJGEMBC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rQZjDL0yqEBEpGtechGermZMuyC6Z1r56MeUeL5UPaH6pn/E
	u5mgWTna4zr7b8WoGVjjTFfpcxX9WsWbyU8jHiSMczf9zu1UubKPTH2J2sa12xhA6B8=
X-Gm-Gg: ASbGnculokDSFD8wGksRVKGJd+CUt1a6i9QUzl9IZFZ+e0rhOO8S9qeHBCOSjRwPLge
	kFmTnmohHoaziSzLn9qsiWe7r+5NdPlNWESiM1F3LG3JIXaD0sqpQeLZ2ZuZ7SgN0MgXIDNK+2o
	x444QvbaM49XMSGymoXHRjSx5sYZk9I4a9sO1J6STqq7d6320fN4UX3QKPD8XpdS4IPL0lndMXo
	rNFLP4iUt5lJ0Ca7iPwj1NW6FPKkudNIn6aMAEZB5yDdMZtIJ6M29bNb6/YIp1SlHKO2siBaV9L
	HNTDp9tc2yH0R0do8SqmVMli8re7FiD/LW0hBzrHzc2X3ydXMT62fI1GgZxqcWrQFPFrwW4=
X-Google-Smtp-Source: AGHT+IGI8iwrZ7v404228P/a1AWPFqYItuYifRpy4WeOeTkndey/Diu8iL6ffoSt7fIYpvcvq1pPSg==
X-Received: by 2002:a17:907:c16:b0:ae0:ac28:ec21 with SMTP id a640c23a62f3a-ae0ac28fbcdmr130864566b.13.1750749531544;
        Tue, 24 Jun 2025 00:18:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054082d0esm830333266b.79.2025.06.24.00.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:18:51 -0700 (PDT)
Message-ID: <1524eb69-e3d1-42f5-94fb-cc783b471807@tuxon.dev>
Date: Tue, 24 Jun 2025 10:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] SAMA7D65 Add support for Crypto, CAN and PWM
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11.06.2025 22:47, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add crypto support
>   ARM: dts: microchip: sama7d65: Add PWM support
>   ARM: dts: microchip: sama7d65: Add CAN bus support
>   ARM: dts: microchip: sama7d65: Clean up extra space
>   ARM: dts: microchip: sama7d65: Enable CAN bus

Applied to at91-dt, thanks!
