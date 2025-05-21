Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE322B59D;
	Wed, 21 May 2025 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817005; cv=none; b=dScmo7xSZeVBCdRz2WzywGBTY9yMYruJsPVt92yb8/lbTx1THD01m6pA2hXqmxOgMuRtJbm849nIAtRxVQlSbPCkXT9kk25Lm8H1pagwgT0cKxAsNXEEYQbxTtaszN5791H0KjvS5GoKi837mM+ai5W7VLnDfJUV0xuUK3vtN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817005; c=relaxed/simple;
	bh=9X4AwLZlGBar+bM/Xw9R6KRT90pYbUVpPgLXzn3SK2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DM5ajhHl0dGPql5cfScWGFdvDmnQuPgkDHmUZ+SQw6deWrbQcSGibqMD39NbBqWbRjhtOtYFWNIWKyLsTmLyNHupWAOQwUh20aeFuV/FZBaA3Z8HwGAAFHcncZ0CAexv0uzKGHeF+wQkiUHKKbFfxavf8IMiVBtAhjgf8ysLu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=mvEUbNZR; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mvEUbNZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747816996; x=1748421796; i=wahrenst@gmx.net;
	bh=9X4AwLZlGBar+bM/Xw9R6KRT90pYbUVpPgLXzn3SK2Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mvEUbNZRPSruuJmCOuz0yv8xe0pMx6Ka/wXVBMiFW7x/9+OEe5KxPqfBoTu4J9EV
	 yvDtI27X8LLtjzfWCCl620oSoY4TW3qejH0WS3D8wp+RNWnZDaPdc6j4ky47RDgAC
	 WkNOu/8Z7cUuxiznpOm4XBeQnChPZ1BPmFF1HTB78SF9+j7NEwy3bnD8FKHjOXvcz
	 jduPF37aN4j/laoPzLbwNPB0HttMtLl1ZhKOFeJJW4vkqUjp9LxpRGf8Kn637jr65
	 vL28ucVpehoT2lwWbo4K/Wimqhd6wo6BYILiExrauaBwpVyCtavCZVUti6K7cWlD0
	 FM7criDzDTIZ804xew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1uz4oU1moI-013Hww; Wed, 21
 May 2025 10:43:16 +0200
Message-ID: <f726766f-29ed-45d7-b6ea-a78b0ee82cf0@gmx.net>
Date: Wed, 21 May 2025 10:43:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-aux to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521004634.1792167-1-robh@kernel.org>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250521004634.1792167-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:yXAdK3YajtukF5g06xV/psZcbHT4KoM4MuiqxNJHn+dnWh4elfV
 qOaSjL/Rg1q5CrtIXIj04KBL8481jj5YiVIWOEggKYwTIvfx8t+RfBboDHFyFP3RqSxEzFY
 p0RET54OEIS7w9VryuzCAQp3Q1OoiYjv5hFqHBM1GlMqvuLVe0a/Ysp9wH+y3q99xc+PFt0
 k0pGrxhkKBemTK6CkWXkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LOt0DK2UpQI=;oItIS52uS510wP97iuEORSh31+R
 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
 +auYg5/G+LDMM=

Hi Rob,

Am 21.05.25 um 02:46 schrieb Rob Herring (Arm):
> Convert the Broadcom BCM2835 auxiliary peripheral clock binding to DT
> schema format. It's a straight forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
a similar patch has already been applied:

https://lore.kernel.org/all/20250503080949.3945-1-wahrenst@gmx.net/
