Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F631F3B96;
	Wed, 14 May 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230176; cv=none; b=RnjtthFeEm3oaXQapMCgdx99JMVo94c99Lcd9vPA/4NUUf8KzC5P6xB28IfJ7VeJMrOdKCfrWgiys2K7AfnxkGc6MNAGGdg5uAjBUHeAGR27OikOfiE4wiIe3EiwOiGyAdkbBYRZX6gF44oKnYCkvnmd2CfjfiV8HgmdD91ZZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230176; c=relaxed/simple;
	bh=zGDHISwiklmAPNsLhUlC8G4oLC3Tw+fvyfAEuP5U/EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ioh1WLN/N+fwaBsLnHOmHHnfYLG5TMegMcxOjHSlcBfZ4xO1ngxHayLGcEd8dUQQS94iFwYd6kOGcjNPvQP1BAfFPreOOCguVgg1TAM3DS0n+uF2/eCuKLaseTfzlZmkgjBeWJCDayMmeFYI/hrOQjkqy+toZjVbIoPfbIKcIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Snorc9S/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Snorc9S/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230172;
	bh=zGDHISwiklmAPNsLhUlC8G4oLC3Tw+fvyfAEuP5U/EU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Snorc9S/rqdNvQgdHb9V1D8LQrEyTbwW0N58KtKNqtTrl9MjGZYGdCyO8nBmBq8LK
	 d3salbJWhRQOlp7NZ/m3fvJyiy9vVVMdEUEwKuH/7o+miJ9Vt7LCG34qJ/Evz07713
	 DcRk0PQwEZ9auJEOD8zXzQ7oPr6NGNDf8SDGWMr5IOppq8uLPmEoeN2QBMUzh0nDyk
	 4HChRMAWbb/wOZNPH3ph43rkYUuV1+dMilL/lU3NE1M/Zv55NBfUjLQXjEuGzNLisq
	 rAtqfI8gUxPazjNqwoP/mBgYqoz+DW615rHRL+6JBkup86Gx8om016eO8u0i41oCA+
	 1Jvn1vgAVCkXg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EEFF17E07C9;
	Wed, 14 May 2025 15:42:51 +0200 (CEST)
Message-ID: <2734351a-7214-4c60-b61f-432aace5a040@collabora.com>
Date: Wed, 14 May 2025 15:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/05/25 12:57, Krzysztof Kozlowski ha scritto:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


