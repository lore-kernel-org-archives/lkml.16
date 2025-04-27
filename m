Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EEE13A265
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745761493; cv=none; b=AZ1mNeu5TJHZJYveptijHks6zl8ONv57i+emmnXBSIv+fwd1mbjNeLGhUaHsm9ru52RQA49ZNg4W+7DC1StgHBviUX8nl47m0+TFVFQjWeNvi5tXE1GyvCk2+jHb4jl6G8Gg502u0b7RhoK/mcYGM1/IbysX0vQK93GJt5BfCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745761493; c=relaxed/simple;
	bh=xy57p6rT8p7fmNxJxy0pnmjoSVioB4G0/E5Pz5KlrRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSLGQfQR3itVzrMkyylE6HmcV6Tzn97f+HsBoDzSDJI5d/Ss6Xmm5gMw4wfiqRdFiOG12qpZjDJ5zgv2adGHcV3U1l1vJKzKsWv3ZqIfX9kzUm9G4+YzbAuELGdbs9rD5uxP9JgXmBSMdpODspfoMc9Dvji4dBC1HrEGWAFtpLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iqv8MutM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iqv8MutM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso644065166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761490; x=1746366290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+Wfmpz8YwSC/QTc9cmf3K4nEaVMfqyTaWeqvvdrAgc=;
        b=Iqv8MutMhB5WCzIf03Vg7/CUTPnOPNbw+RPlqpRt4UpdmTKtYiv8NI4a/O9pVQtpcB
         rwHOjHLqwQsOxr7qiEENCchqzKcl9dSqO1MeA2W2w236exbrMqC2726eiHE+q7ztLuSQ
         95jYzsdKs2gcjzAFWQMiSUwb7677WiKHkv31QfqIBlw16sXK3Tzr7xSH9+tgOhrdwYPX
         /Qs2dU6a+73wTrBkB21fni7Mz5CU3+RtmcOiOMswcXTQ+ld3gwU5S2aN2BbCAtTKobt+
         xRydQWh01GUnMCsNYfe2J8q1xdaVONgkvDiiZ7UHs0ArQLOxN2k6ADdSp/kI9WQZuVSo
         fyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761490; x=1746366290;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+Wfmpz8YwSC/QTc9cmf3K4nEaVMfqyTaWeqvvdrAgc=;
        b=TOAFWn4j5IZyOeMLQOFsDKpbCwuKpUP/CdeO/PONVUur45iPwUiobSMahlPCvGwIDb
         nV+g2bBOiU+tNSUcA/BWs2hfMZFI7SZKq5ypsNG/cE+gTwDx71wnYa5/twR2Mp+v/EIV
         unfWYpEj9p2IZhknHhyJnKcBT59OILHC3ya6bHMR14Ibu6ddKq2354ZAOIha5ynDoCmd
         ceyAznjLtE2aEnEpqgEIQ1kBYaJQUaJ4gCkE3rwvKeM0Ou62VI8mm/IK76FZ+HsWQNHz
         7NMsf3rltw35NOG5mpk53Sr5Z8ugIhZ01ciPtK9Hn2t3R9fwVy1zEmjdC6/k8tvpPIWc
         hLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSyrcEkD4fPE0WFeJT+7BwJLqk6TgakzWMrp3zGPxsEx1rBL/GtZPOltQuNmr3MMgt9cWe+sOoYMX1CUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJ2/bf+t70RcVAFToA15cal0viJuh8V6UrrwxYzAjCgW0gm8B
	+Kbsn+JKEWgKc1MtN4zDDJ1z960a7Ysg5aTfR8XLlOarsqgx0vXnDM3WqmKhcBo=
X-Gm-Gg: ASbGnctfWWiFei8/vDaZKHYcoqgsSG/YzIpAHlipYsj3GNYMVP14Y683sB++eI+Cemx
	cC84SHk6msOKXoRzbb5PmlBBuoUYpS0x9DmT3XDbREqtTCGmPnmpSh2RP4iV9czZD7ruuT5uKB4
	pvQ51RluL4A0npQEM/R1I6R2q+bwML7s2UXJTn7f3dFppq4DIsfcb4m+zHPHlBoIIwBzHYBXIF3
	r1WXpRgVCbSsJpkY1Q02o7WLT6HkYL4kc9yCOPys1RXc2SEVb+XIp0eC9CU5G06eBJzGfYfxCG8
	O4JIQt4sip+dx/Mo3H/4OUyKubTti8fep/kxaJp31KRIYZJPdw==
X-Google-Smtp-Source: AGHT+IEOypUTitKBpixzEKZqDNNK3xNvWnlomy9oSqUcmZFU4mdU5oeaOXGJJJq0BB7OQNIo/j8EWA==
X-Received: by 2002:a17:906:dc8b:b0:ac3:26ff:11a0 with SMTP id a640c23a62f3a-ace7133c83emr870058566b.38.1745761489851;
        Sun, 27 Apr 2025 06:44:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41a850sm447491766b.32.2025.04.27.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:44:49 -0700 (PDT)
Message-ID: <b50ca268-1eb5-4f73-bfb6-db4273cd6894@tuxon.dev>
Date: Sun, 27 Apr 2025 16:44:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Enable FLEXCOMs and GMAC for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable GMAC interface
>   ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
>   ARM: dts: microchip: sama7d65_curiosity: add EEPROM

Applied to at91-dt, with specified adjustments, thank you!
