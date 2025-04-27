Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568AA86323
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745761401; cv=none; b=qp+d0kzwDZ00XB/fHWI6mf7thJ6xvzf6tLUQ5qJ31b7b7x5l9PmWWezIBUDGZFT1oamhXr2HrtX1RtKm5gkM0oZgK3N8+DrPPXmtD1CaHAleX9iGjEAxPumvR29HDDjINS+7mDxMH99azNAnRs42BqsEd4iQcNN23roq1S5xyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745761401; c=relaxed/simple;
	bh=REZ0z+XUzHW/ptwizPeESYAMDlgEamrUX13FRsJPeO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8/3EesA9kHp+71YQqwx+Vt2nDWVXrbW9bM60Rqx4DT26gT2u9cDhZmh0B4OYN34OT8X6G4JVBRcYdq2WsFSstC6REa6lfR/kG49T8vp+p4y4BxpX0iyz1Dlmmrs6Dg8biKqI8smjc7yu+r3lmY3BsQpeWTA07ktttcnqDRuhFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NoabVIaX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NoabVIaX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so680367166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761398; x=1746366198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4+/5/aJ00yUVo743NQIajtPIPLeDpfyWDZMv+sSR0I=;
        b=NoabVIaX/mUUlaXpXXTOxHW6OsMQf+NouNsY2/GwxWZZc7hbDnucB1DuatPnBJOd0d
         9OoFs3OsZ91n2tha3E2YCuPptq8Jyk2UEw1WMbKqC83T2Qu892v4cM0fp6qAYmg5M6Jx
         DwsvuZHqU7g5YgDsahiu2W6zWrSNnqyQJld2YX6ZvxtqfbHA+yia2MO64fvTskKmewR2
         /AFZ3kOUW1MqFQnXh6AsceEU9zw1xCgif0yiZm358IFJI/pr973HF8tpPh5RipoeUUbq
         nbLVhTDdlar8DW5KnzhYjVLJX9bw5ZDLCP/tJAJ/3ooonWLot2QSazFRKGAduaI364J3
         1QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761398; x=1746366198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4+/5/aJ00yUVo743NQIajtPIPLeDpfyWDZMv+sSR0I=;
        b=F9pVeSd70D91GQgLS7j7U6QQGfZXrTM9inl7qhaSxZ4uopZ8gtoLUm7iIW4NMQR3Ou
         ttDi0uu9rLG2J43MndMtUeze90Z4zh3DXUj360J2WqNybrmQNa555tfkGOX9UaXyFXl3
         UTxhV6nD60v4dpfuasKNw7z0C5yFSfnW+MsXwM/AVI8dsoMO2AToGUN019C0GS/RLssX
         Rjpd25jXZF/C6a/c1ZnoxeMTe130Z2v93b2kQDCWnOskElPoARsWf+s7EfxnO5zMkRpK
         ABIEVDtJyvSmpv9vneXGwVrwbLYx0vZs+AERv/euM/xtd7tOwgRGjizF49jAOH8Q26JO
         4iOg==
X-Forwarded-Encrypted: i=1; AJvYcCXoCrFB1PezqUVpbRsBP1moM09LepSlx3hjZKdIhn9kWnFIYUMrKWFgnstDMRRAP2Bogq7plXxCDUn1cH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNujO0UBB3qOnyedK3yhgkxWodHANai9+q/P2o0KTlT2yjSLE
	u73WygclF/1yRxz1w+6HbwOWnTwQL3+C+eE2B82bbIRNy/NYcjUHlfyDpqU2PdI=
X-Gm-Gg: ASbGncv3DtSwU6CVaMCH9gm63AuW2RiTC3fcfafdN/a0vBCHNBYW0thpeXkpleqWKpZ
	lTpUZ89XhwpXWU0zUMeqEe/yidC+1ajFN6fUpK8RF5saPcXnQRhs8+uVsuKOjzjbrQXAmK+bvwK
	yn5tHqSWPrFJFz0xdr+mXFljPXWkPTnSGDsoPmszuB8tSt4xY4eXIctzAYo5EfZGGpId/rbIxvy
	m0SMXMcXPGyO4zZGyCXRvghmHX8+iorvfqNK0HBC6gRSAaZnuxTq0ulJ+q71GJX3QhV7VWVdAuy
	BsPTXIdUi5LdSdKx3+cHp60JpSCo9e65huMxuHaUGdVWAm6+5O1uPOWYo4yh
X-Google-Smtp-Source: AGHT+IGRwUVwOyuzymMCwS+0qn15iMV9FUUdCVvXLMQI1GdB2QpaBU0EsMQ7nsFAnRwnHK8jvuB1mg==
X-Received: by 2002:a17:906:1548:b0:ace:3f00:25f5 with SMTP id a640c23a62f3a-ace848c23f1mr395019466b.2.1745761397537;
        Sun, 27 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf82f9sm442101266b.88.2025.04.27.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:43:16 -0700 (PDT)
Message-ID: <33e56253-32ee-4eff-a7cd-fcf91ca4f37a@tuxon.dev>
Date: Sun, 27 Apr 2025 16:43:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: microchip: sama7d65: Add MCP16502 to
 sama7d65 curiosity
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: Nicolas.Ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
 <6e52883b-2811-4ac2-9763-5974ca463274@tuxon.dev>
 <af92ffff-f900-4f29-8d26-2516a3c91805@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <af92ffff-f900-4f29-8d26-2516a3c91805@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 14.04.2025 18:38, Ryan.Wanner@microchip.com wrote:
>>> +                     vldo2: LDO2 {
>>> +                             regulator-name = "LDO2";
>>> +                             regulator-min-microvolt = <1200000>;
>>> +                             regulator-max-microvolt = <3700000>;
>>> +
>>> +                             regulator-state-standby {
>>> +                                     regulator-suspend-microvolt = <1800000>;
>> I can't find the schematics for this board. Is there a reason for keeping
>> this @1.8V in suspend?
> Sorry this was an error on my part, there is no reason to have this
> @1.8V in suspend mode.

OK, I'll drop it while applying, thank you!
