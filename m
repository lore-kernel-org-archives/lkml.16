Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED452D4B6C;
	Thu,  3 Jul 2025 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533564; cv=none; b=TXOGw6nhBP2uvoHPunW3HndxA8nfajukEVLIa48egMIlaRQCxdIZrqeAGnlRqFlapVOHFgaxM8V8k4/IgeXF0mlPpLSKPejE3UsZn/JradpA+nrdk9kcBUXsSOXe+KqR+wVhNN0uDf9VCWpBqWBBAv6NINaTvTLD4CEpqrzwd3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533564; c=relaxed/simple;
	bh=o7ihHA2Q35n6QKlFvsZKa9COyquLcNt5mCn8m+1tFU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyDMAMCL6FNYGaRBZ49UO8VVQpSq88CpaaYzOWb2eeYQ0JrndicDZBrmrGt9zAD1deOGfrMDN/mMBhAWHZ3OTG4NbzkcWWuY7bX2vo9hI/KmhOPw/LvqOYAeaHsZ1uiieG1UKMnTjVhKqVQaL6Qe1ccYr164JipFnXIl3onM2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jD2rqfu8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jD2rqfu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751533554;
	bh=o7ihHA2Q35n6QKlFvsZKa9COyquLcNt5mCn8m+1tFU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jD2rqfu8XGYNUbVU7GBmmeROYTve58GYtMAlKIznmihPhxQr0RthkFGL10O/fgbFc
	 2y2G6+HFHYkbohoVTDR5PxfvNLW9FNZUG/VqqnE4jt2ysvXAbflmEYHyBNVjDGwPhn
	 sDzox8Wisz+jgc5HOP1FKtgMQWaHZDqsBeFbzGqYDK2T6h2Lpla3Uu4bVtzomaboIK
	 jp7edKX2qlTrbS828NQJyFrZ+92m1WG+FPbD3bOYBixS7kDsYyg93bMVhVXCLx6ms5
	 c5WAF9pukJnAm4c7UMVSZLa0xpv2PaKE+RlHmVMSvwse7uMlC4hdj1IW92x646BqMl
	 6DrvKRLIb0LCw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 807BB17E07C9;
	Thu,  3 Jul 2025 11:05:53 +0200 (CEST)
Message-ID: <61784658-c71d-458b-8934-5f5db2330bc0@collabora.com>
Date: Thu, 3 Jul 2025 11:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "hailong.fan" <hailong.fan@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250703075632.20758-1-hailong.fan@mediatek.com>
 <20250703075632.20758-2-hailong.fan@mediatek.com>
 <defd70cb-4351-4b0b-b4d0-dd1ff831615c@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <defd70cb-4351-4b0b-b4d0-dd1ff831615c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/07/25 10:08, Krzysztof Kozlowski ha scritto:
> On 03/07/2025 09:56, hailong.fan wrote:
>> From: Hailong Fan <hailong.fan@mediatek.com>
>>
>> This patch adds mt8196 dsp document. The dsp is used for Sound Open
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>> Firmware driver node. It includes registers,  clocks, memory regions,
>> and mailbox for dsp.
>>
>> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
>> ---
>>   .../bindings/sound/mediatek,mt8196-dsp.yaml   | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
>> new file mode 100644
>> index 000000000000..68f594f476e8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml

Wrong folder; this should go to dsp/mediatek,mt8196-dsp.yaml ....

...but then I don't get why MT8196 wasn't simply added to mediatek,mt8186-dsp.yaml.

>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-dsp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek mt8196 DSP core
>> +
>> +maintainers:
>> +  - Hailong Fan <hailong.fan@mediatek.com>
>> +
>> +description: The MediaTek mt8196 SoC mt8196 contain a DSP core used for advanced
> 
> Missing blank line. Look at other bindings. Also does not look wrapped
> at 80 (see Linux coding style doc).
> 

There's also a typo, "mt8196 SoC mt8196"

> 
>> +  pre- and post- audio processing.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-dsp
>> +
>> +  reg:
>> +    items:
>> +      - description: DSP configuration registers
>> +      - description: DSP SRAM
>> +      - description: DSP secure registers
>> +      - description: DSP bus registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: cfg
>> +      - const: sram
>> +      - const: sec
>> +      - const: bus
>> +
>> +  clocks:
>> +    items:
>> +      - description: mux for dsp clock
>> +      - description: 26M clock
>> +      - description: ADSP PLL clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: adsp_sel
> 
> Isn't this called audiodsp in other bindings?
> 
>> +      - const: clk26m
> 
> Don't use frequencies. How is the pin or input called in datasheet? How
> other devices call it?

In the datasheet, this is called.... CLK26M (really).

Cheers,
Angelo

> 
>> +      - const: adsppll
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof


