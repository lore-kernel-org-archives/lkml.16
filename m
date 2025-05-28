Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A89245022
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417491; cv=none; b=KjPb+2WEkYB/wvMItGDpgT0qT7CdUOWDAg49ue3tj/x+r4A5tUSQDJ1H6oWdAd/nWCwZIFoJsgOdcqa4lAnHHecGas8nM1e00+WLJeCGsls0u7MtLwdeF7T2Cyv/4Xy07PBhRht0lra5hMh1bgtYISxC8NfUSlvnB8D3SwPAfD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417491; c=relaxed/simple;
	bh=UvIexZRUn+BGBcUY9tnDQQ7cZOqImj0Tt0QmErOJPf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daxcxHzXGS5yah68WQVCFMc8zYeqazMtha0Qd+AqcGpJZKvOGCXLqzpKLIbgPi2V0em0HdNtjY2c7zddnpi7OHFroXRPPgnG9i8nV5l/ZeEjkp/rg1emgHxv6ZlZLA6XV5po4HpUwTO8rRo7IGrtKrkdD1JsImbPDJhZgmxCJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKuCL8M5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKuCL8M5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748417488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnNK+PMtqB0rA55xSs019Lt6frpG94moy6NPZkqGYPI=;
	b=YKuCL8M5WMZT2/XOTG4zsyCbhCDIIqOJeSGrPmUbBZfmTYRW7uXSv7Xxkqx1QVkJ1LUWca
	bX9OvwK690DqpLLeJZmZoJ/qcSi4hhZ2W+3xBGb5B84nbwyC8oYxzKalFHBVYLdBPDDWxq
	CwV19C3urr1r0iiWs4aWR6aHz8pnCQQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-gKnOC9X2MUm3QcNFmjE_yA-1; Wed, 28 May 2025 03:31:25 -0400
X-MC-Unique: gKnOC9X2MUm3QcNFmjE_yA-1
X-Mimecast-MFC-AGG-ID: gKnOC9X2MUm3QcNFmjE_yA_1748417484
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso30876495e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417484; x=1749022284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnNK+PMtqB0rA55xSs019Lt6frpG94moy6NPZkqGYPI=;
        b=vLfwCNySB/xMOgqJOVUrUXH8IV+Pz/6QPcUCTWaJ6reYgKU+goy7wWesLiqbQR6c7c
         8jvCLwIofGiiJQi9RlkLLrEqyGPr5tTx2sqfLUVfmzCSr8/KDYNqrLxlEWRL3u7/UHyB
         yj9EKohf1JPfkVcO0MWCvi7Kc9wyyEu87JfRsi8xDzmFLK9JHmIzqMJqcGsAb63O5AoX
         me1aSQzWSLGcz83R7dEjx/nF5tF7gpznYTkWYTEQtXx5OFOo/pH1j7tYJZzwjggDwo8V
         JN28osLpnpmbdFI18mATiZGFuWnCTWCV66GtlkOgxepHMWzTSMuFyYmHni0492EfkqM+
         rdSA==
X-Forwarded-Encrypted: i=1; AJvYcCV4dIBNR81UtcnA5rvtjzmdMh0pa7Mp4QXEDDGn13LLEdGeeRXNs1qsV8YTLz3OgpMKa5dA2jJORdFD4+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlK7Rbxo1eHsAXjy4A1P1L/3d7G0k+QeD2+f2ey+fdA1/vOe3/
	3DhY7mTY+NKL+Ic6k0Ju1KOT34RgrdiqOZDbaojuhMI3Hd4yWMKI1BsvdD5AfLf2rLMROeQiR5s
	kEryKZeH37wHiozrD9RSt9tSVL0cb4wAHc7jSZx+C2qGpzfyPNbxe5pChf0pcWOd5mQ==
X-Gm-Gg: ASbGncvxetWwAVcjvf2fsalLt9vXUcgWacqN+5k/7tEOlbsUeBF4iRwzyaTIwOV2Kvn
	WsF1wyZPHLH70fEUlLIsOupyKuUiuLl3O8UIwTbR7iRRQTdfYOoaJu8tT6bnkYFyuFtcCus6kU9
	XAo72YJIyhNICc7ntxiqMjKe5qvgGgyYJsvu5BSPRptaQgYZZ/ZkS232qdkErDPBsFiem6KsFit
	q/2cSmvfZHHSbBQpWpJLiKH7DBp1scAhcN6JPjr01mTJp6S3sPNceVvkf8sSRIAva4LLtPqbJ63
	Tn3/kBKTrAqHKbCUK7eZtFsXJ9PWBxvqEbbApZddA8TiFCUCea4/H8HaoY4=
X-Received: by 2002:a05:600c:4fd6:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-44c91cc3dc0mr138588435e9.8.1748417484072;
        Wed, 28 May 2025 00:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdJu619yR1tj683v5lEJt4BlhCq4Yc5mhZCTSaskqgJ5HAGUteqarVvWl0xRjxTsnjM5kpEw==
X-Received: by 2002:a05:600c:4fd6:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-44c91cc3dc0mr138588065e9.8.1748417483603;
        Wed, 28 May 2025 00:31:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006498c83sm12303485e9.5.2025.05.28.00.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:31:23 -0700 (PDT)
Message-ID: <8b3cdc35-8bcc-41f6-84ec-aee50638b929@redhat.com>
Date: Wed, 28 May 2025 09:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 00/13] Add support for PSE budget evaluation
 strategy
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250524-feature_poe_port_prio-v12-0-d65fd61df7a7@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250524-feature_poe_port_prio-v12-0-d65fd61df7a7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/24/25 12:56 PM, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> This series brings support for budget evaluation strategy in the PSE
> subsystem. PSE controllers can set priorities to decide which ports should
> be turned off in case of special events like over-current.
> 
> This patch series adds support for two budget evaluation strategy.
> 1. Static Method:
> 
>    This method involves distributing power based on PD classification.
>    It’s straightforward and stable, the PSE core keeping track of the
>    budget and subtracting the power requested by each PD’s class.
> 
>    Advantages: Every PD gets its promised power at any time, which
>    guarantees reliability.
> 
>    Disadvantages: PD classification steps are large, meaning devices
>    request much more power than they actually need. As a result, the power
>    supply may only operate at, say, 50% capacity, which is inefficient and
>    wastes money.
> 
> 2. Dynamic Method:
> 
>    To address the inefficiencies of the static method, vendors like
>    Microchip have introduced dynamic power budgeting, as seen in the
>    PD692x0 firmware. This method monitors the current consumption per port
>    and subtracts it from the available power budget. When the budget is
>    exceeded, lower-priority ports are shut down.
> 
>    Advantages: This method optimizes resource utilization, saving costs.
> 
>    Disadvantages: Low-priority devices may experience instability.
> 
> The UAPI allows adding support for software port priority mode managed from
> userspace later if needed.
> 
> Patches 1-2: Add support for interrupt event report in PSE core, ethtool
> 	     and ethtool specs.
> Patch 3: Adds support for interrupt and event report in TPS23881 driver.
> Patches 4,5: Add support for PSE power domain in PSE core and ethtool.
> Patches 6-8: Add support for budget evaluation strategy in PSE core,
> 	     ethtool and ethtool specs.
> Patches 9-11: Add support for port priority and power supplies in PD692x0
> 	      drivers.
> Patches 12,13: Add support for port priority in TPS23881 drivers.
> 
> Signed-off-by: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

I'm sorry, even if this has been posted (just) before the merge window,
I think an uAPI extension this late is a bit too dangerous, please
repost when net-next will reopen after the merge window.

Thanks,

Paolo

