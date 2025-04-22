Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270527BF74;
	Tue, 22 Apr 2025 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328593; cv=none; b=gxMJccTWxf3Zf4luEDpzM4cNgMHFLtAHnvByVch2JzBoPIn3/Gjl1VzPVKTspiSR1KBvenJhe524E9SqK1PVXDTdRrN3TWGzLsoT9CgT4rpx3+CC08COn3qR8ApbeoeWX+6+IOj4fEDc4ei4d+/VXeEeA/qAOBMZteM4Q2FJmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328593; c=relaxed/simple;
	bh=PS9A2so4Ht/r0sk6C7KPxy+lOlrbJ9bDV6SgknfZNy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvrLocn5SrBlJV6Dk7m/K0pDnIgZKenrxWIND0h1w6GOc7uxAv5ccTxm/Dca+abH8JLbihRjaANcVqLbbucsejEeF7cyDLkz3V9+mNCdq7J9YptauNGTh3BdQfqXdeN+h3sT0Bw8h1g85kE+cwlKdVpkSZCclcBsid4zGy9eyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IvYnRjFW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IvYnRjFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328589;
	bh=PS9A2so4Ht/r0sk6C7KPxy+lOlrbJ9bDV6SgknfZNy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IvYnRjFWbSZamcdfKDfe1bpuO1ZOxCPLlQu1QNggSf2YBfYRvA4xgyl1IOTF104Pq
	 w/9lGvG8Dr214i+diVRHUuAkif3NeDHkW8IEx+qn1fxAPW1xLpbwhf64P5GfrahQvC
	 i+w484vblnIJYfIPSGcJ0VQGfVGyyWqVI3Z58EtVjkhgg2g6iU4m0vamPmSiw9Ptqd
	 4PKOpySmYTH0S7FR9KuOWONk1pgL32WY5W+3ntdhfFnfOVQ7oRf7ioG6o91Lv51/ct
	 E6QvUxNp+C5KXgHUJEaiVNYQeDID0IaixsrU1pn1bnW5zpnwSYfyzO0UCAr6DbsUiD
	 /OYX/TgNmfrdA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBA9D17E0B9D;
	Tue, 22 Apr 2025 15:29:48 +0200 (CEST)
Message-ID: <e086c8aa-944d-42db-b163-023571dcc740@collabora.com>
Date: Tue, 22 Apr 2025 15:29:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> Just move the common parts to a new dtsi and keep differences (only
> i2c for lan-sfp) in dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>

