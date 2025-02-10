Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30D1D47C7;
	Mon, 10 Feb 2025 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184762; cv=none; b=cJ41Jg9Ku1SoZdTYFFzYlEYV2RSVAyNt3hCRU9qHhFj48/26fB0KU9CKRoB1QOrivgbPmamsYLIXVPuajS6AieEobWeFRFoVCe8+cP5DiRm5QYWZeD6ZeIvBkes+XTHfaLhtnFA3mjxeZ9uwXfH/nLJjxXcB+tJolx3AT55tduI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184762; c=relaxed/simple;
	bh=+ERl9kEBufIqPZbxt5b8EpdlICT5V6kGi6RjzSJytjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noMjYkCl9EnOEXnNYi7o29I2cOGJqliKPortcmb8zXbzmJ3PN44+qkEaMOLdmu7WyE3MLrNp6WxuxLTsZdXn4njAket1AyvneCwaK2ZSSgy5ePm9u1+i241dzdL5w7TP0ybaF+RXtd6M3+jym6BOuJHXrUpNiMKW1e6JplxQWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BPoRnHoq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BPoRnHoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739184752;
	bh=+ERl9kEBufIqPZbxt5b8EpdlICT5V6kGi6RjzSJytjM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BPoRnHoqhxjCaf9kNNWoiz5gLry2Y+uXoaNX6kMI0uYEe6bkaBubpcjlZueMgkfEP
	 dRP/gXRa0smDDUBpyJjD06d7IT5w7LRBu0LiqGlO3hk2OHhZ8rI4RHsS4yodBdMVrE
	 ks48gmZmh2QADXrXQZ3O/99poFv0qS1Atg69vQJxN/JyXXB6AsGAe0Emxmg9fiKv++
	 nS/hS4KdEQnhixYpkJKyIsgEjlDC5LHCrC7QbUP13A2RXdkAD20CNQdosFxjpJzQa6
	 VBq/JxpRSddJ8FGPfO+xkM5NZHnkyDhhZeOd8A1lRSE2Ss8C+KqzWX0D0wcjwhFe2D
	 fFsu2gZV2gPmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7E7A17E0EA4;
	Mon, 10 Feb 2025 11:52:31 +0100 (CET)
Message-ID: <30580863-0110-4375-8e99-3265a608d4d1@collabora.com>
Date: Mon, 10 Feb 2025 11:52:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a new gpu node in mt8370.dtsi to enable support for the
> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
> Panfrost driver.
> 
> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
> following message:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>     80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>     Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

