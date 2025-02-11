Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F21F12ED;
	Tue, 11 Feb 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266111; cv=none; b=Tu36wrJRMeiPQdsnD6LxdxxVQCi3H5oa9s1JkOlhiubKd3lLC2nZtyqs2mvLES0FYl3Wx7QrvMBzIV/nNvdnaPBw9y52CL2XQEg2FOcX66WaB8B1bwrUrkGFRgCuMCCJ6yJ7h5+RzN13SU7uUb+3kgsFtHexQ3BK7QGedpsNZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266111; c=relaxed/simple;
	bh=co1cSWx5jjebn1be3GgShvFIPNk5ZGYkgJ/NYGsS+K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaXYmb3rBo0+/tZOg+8bfHD2k5ItOJmIWwXcqNTxY8E3LXS96Tih7NJMcyLN84Mqjd6OxwR/ee6Diz/bqN9/LLuTMeV+vLfpBezGYh4whVyJ0ThAJKDO2GBPBySj9FyJUf8dKXNT4wU3rBUUB/d8sUOmCvpSjheB1uDG7CYLiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OAtSrdHC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OAtSrdHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739266107;
	bh=co1cSWx5jjebn1be3GgShvFIPNk5ZGYkgJ/NYGsS+K0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OAtSrdHCu2ucm3/qoKlfHhdLzbcY9eYa0S8LB/9+ydqOk4eKkVem/z2aQsOojjCtP
	 zTWtpglOAYoQdqUIwH21A3yn3k+mMqHtcG7ozrGKjRemj+Z7JquQpgOJkSgkN0s6a0
	 1VrBNBOXSqCVASYcH1Z6jEIy2xmrYYspCA+qhQuujmPdV3KLUmdP7uNchNxZxk40S2
	 vuIFaZwRhU5YGwGH3YyXqbWTV6wKvEhusmo2vgMTr5EJY9Dp8xnE86QOi1moZs6qFf
	 6eoQzryxc+dgYY+po2U9B3Cuj4+DRQhMd78XCPGTVpiikSwGFGDkqtLlO1LrYrKSa8
	 GGPXXiOXWqcEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73FC917E0EAD;
	Tue, 11 Feb 2025 10:28:26 +0100 (CET)
Message-ID: <9cbd03f7-c3e4-433b-96ee-3b9683fccdd2@collabora.com>
Date: Tue, 11 Feb 2025 10:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
 <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/02/25 09:31, Krzysztof Kozlowski ha scritto:
> On Fri, Feb 07, 2025 at 04:18:32PM +0100, Louis-Alexis Eyraud wrote:
>> Add a new gpu node in mt8370.dtsi to enable support for the
>> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
>> Panfrost driver.
>>
>> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
>> following message:
>> ```
>> panfrost 13000000.gpu: clock rate = 390000000
>> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
>> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>>     80000400
>> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>>     Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
>> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
>> ```
>>
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> @@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
>>   				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>   };
>>   
>> +&gpu {
>> +	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
> 
> It's up to platform maintainers, but IMHO this is discouraged practice.
> If you ever need to override compatible, this means the node is not
> really shared between this and base SoC (base DTSI).
> 

That's true, indeed, but this is a special case, where the GPU actually is really
architecturally and generationally the same, difference being that one core is
lasered off from the lower binned silicon.

I appreciate you pointing that out, and effectively we shall not create any
misunderstanding on this practice, which shall remain discouraged.

Speaking of which!

Louis, since you anyway have to send a v4, please add a comment before that
gpu node override saying:

/*
  * Please note that overriding compatibles is a discouraged practice and is a
  * clear indication of nodes not being, well, compatible!
  *
  * This is a special case, where the GPU is the same as MT8188, but with one
  * of the cores fused out in this lower-binned SoC.
  */
&gpu {
  ....etc


Thanks,
Angelo
