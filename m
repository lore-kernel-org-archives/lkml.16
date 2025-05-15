Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83097207DE2;
	Thu, 15 May 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320809; cv=none; b=FGAwYvEE6oZipIzV6k0+S6d5VkSdFkpXP5B8ouR/g1aggAXH9opFL541hFyBnvzNE9vezUMYrgzwqWqpQfUPoewbG2NkIYAsrx2tytuY4ByNRjstIEogYIPS+cy0XDsh9gEAnR78GrSIeXTN3Lczndy8tRyzHkz4t/n/4mTnjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320809; c=relaxed/simple;
	bh=HpQRl43T3yE7eJuYJAXq7uvNAvyBKP3XkwGFJiWhycM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MouLGLMeKpysb6OnxBYDiMHQeDcVs5mW7ejhmM0sD/z6yeH8X8dFrHwp+nqDkWfTWGtAXshKSTe25y/wFXOd+JyZcrlYOCGhdnTGxZ3KCxhZUuhcioTUqDNkkgMzkcHedpniPbhRNClswc8Z+Ert+SsYYx21pqUNwyf4F9SKeqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pr+dR13n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pr+dR13n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320805;
	bh=HpQRl43T3yE7eJuYJAXq7uvNAvyBKP3XkwGFJiWhycM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pr+dR13n4yOyDf4BqB5b+ZxTRwYBoLgRHSm9VECFKNQl8TWz3tXg0E4/bYhGiajqO
	 jZHyV21wg+e+pbvg8LKtAjt4YUrJ0R9EOmHg6kh0cVeB3nUaKR8TBrJ39u93Yfy6V8
	 BtMw2z1OLYXU/db8iG05px3LYYqUrFN+TJA8QGEiXZIijf36YHLmyj3MbTg8vLIzRd
	 Qoh2ehDg07ud7V5PF6uO3YXQkeV1Ys3bOK2zguLts63pTQonFtPjG3s7uQIO8VO7YF
	 Y1ctfZnKyYX+KzMTC4vxYBE0lxsLh23E9FaoXerQ3f0h4Llw+KVCILvh0N5KkqTeTI
	 VSLAMO4cTUBOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E966A17E0062;
	Thu, 15 May 2025 16:53:24 +0200 (CEST)
Message-ID: <b693991a-db50-4871-91a4-20d9859a2f43@collabora.com>
Date: Thu, 15 May 2025 16:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add missing
 #reset-cells property
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/25 15:31, Julien Massot ha scritto:
> The binding now require the '#reset-cells' property but the
> devicetree has not been updated which trigger dtb-check errors.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")

That's not really a fix though, so after you drop the Fixes tag.....

> Signed-off-by: Julien Massot <julien.massot@collabora.com>

....you can get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


