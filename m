Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74A4430;
	Wed, 23 Apr 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403091; cv=none; b=dLDblRsk0GBlRJXCG8iE13qLn5YlCoGCXGvKp3cTRtgKzFRfOWpyT2ecCnsYRyaN4u+wDaTLmz7C7L4VmhwwA3XTWadOfLnqmpWjHFFmKEPETk4rtmVL1zH2a4lw0KwBj8bV9jSRxvGM4A6n1lPV9J7GBYjtcYDQgh8fmmzqJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403091; c=relaxed/simple;
	bh=BT0URqQuwfsACm4vF9xOCdDJ48YY41muRXdHRTohRGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6UqAtLXLeFu1+m6NPJyhIPf9fxhHkn6PBrUs3ARAgq60ScC0UXatZQfeu9ib8UgRAAuk7x3Rk8aiYJmQgIV+8ilKr/qYk45rfeC5jlAK5vRu22620rSkCSS+JlCD32+kXOzQPPIzzL85A9c6Zx+qM/0vEv/YREwmzLZ1vFxRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fcWNNml/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fcWNNml/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745403087;
	bh=BT0URqQuwfsACm4vF9xOCdDJ48YY41muRXdHRTohRGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcWNNml/dvVcgeCLvWLmhaz+03YnE1QwDR5CzBDMX7VIzBW2poxomoLaLFVapa6Yg
	 DYsiJVRG4LJpw5j+bEX6ALNndC6qa7blbyD29czqnVIkznj2YMTjHQLcSgoJ/v4UbE
	 aoLuv8uFTZ30H30ZMPs/sWmL0lxIkcQ17tRPb4zuLuT6ov5mi8e0ENnCkVudcEglFm
	 JUxiF93CwtpVHdAD8o541/A5qJj/ViwWJETMCUW0BkyvOEXi9S10q9DhRX4lL0tHig
	 Fo+jzXe82zzKWFalAmKRmCA/3+udRtEpf+glAWmdT0uCBRA8yav3KiQ3xGVhIogxK+
	 GIiAKS0ja2Ofg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5943E17E0FF6;
	Wed, 23 Apr 2025 12:11:27 +0200 (CEST)
Message-ID: <77edf457-75f3-439a-b3b4-b4b03e319ca4@collabora.com>
Date: Wed, 23 Apr 2025 12:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Add display
 on DSI0
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250224-mt8395-genio-1200-evk-enable-dsi-panel-v1-1-74f31cf48a43@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250224-mt8395-genio-1200-evk-enable-dsi-panel-v1-1-74f31cf48a43@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/02/25 14:34, Louis-Alexis Eyraud ha scritto:
> This board has a Startek KD070FHFID078 MIPI-DSI panel on the DSI0
> connector, so add and configure the pipeline connecting VDOSYS0
> components to DSI0, with the needed pinctrl and display nodes in
> devicetree.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> I've tested this patch on a Mediatek Genio 1200 EVK P1V2 board,
> with a kernel based on linux-next (tag: next-20250224) plus the
> following patchsets:
> - MediaTek MT8195/MT8395 Display Controller Graph [1]
> - Add driver for Himax HX8279 DriverIC panels [2]
> 
Applied, thanks!

Cheers,
Angelo
