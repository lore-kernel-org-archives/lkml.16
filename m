Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A83267712;
	Mon, 14 Apr 2025 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626329; cv=none; b=PAlbT38ZJsDKtEswPLr1+CR65GLHGz2U1EnoeLlBOSoCih5X7mcf/F7hafTp49slaoVVcNCDsGUFHho+ybzX2EEMakSlbYMeMiluSCSetwERVEP2kiMrSlPQjjT76PCT9J1ZYP57/hyJbzEG2XAFmsNLw0g/DyUg1CqqTQLDG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626329; c=relaxed/simple;
	bh=oNovNC7Tc5LqT/Tmjvy+D6kZkuhR+8/8x/Z4YPaWM+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpipOctNY7osNynO4ExSWCDpwpmJk5iHwgohffCer0mVm/+/mTc+Ede8ZmHLSjvmy3U3FPnXnTyts3zonH5OcGK7Tdv5iczB9QAT8nfzDJs8ou4DCNEWLZm9H0k9B/gTDBlnrm5rjjqq577YfBGPUSw7X4ig9WGoHQ8lbtNnfdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TGlGR5BI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TGlGR5BI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744626324;
	bh=oNovNC7Tc5LqT/Tmjvy+D6kZkuhR+8/8x/Z4YPaWM+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TGlGR5BI5wWU982+Co1FkL4MEWOr6ukC6p0+7hQ0e72iwzO4JfKHUT0rBMTwt9AJQ
	 RYcdJNJwB3L26X0BjLXO6pbsO2C1jySokkDhDGX9oxV1NK+lsXDME+NnCien0vI+cc
	 rYVyteZwOCurZFAY5zvZHTyy6LJzDMp3DibyIcdffH0lks6poPioJR/HYJ0QDUtnKS
	 UQmCLC3zaFfwY7mAfg6+TWwlTjt96uqDmkV5HlCLIvSAKtVWmEU+0Kc/s4nQe9b1Ie
	 1/XpVpGYkd/VDju6iRXSUi+pkcVSNdIxvTAP5NeQ3ju3WN49IdTkYyuUqATgs0u+QX
	 lDXhjeLyKhpgA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD01817E1034;
	Mon, 14 Apr 2025 12:25:23 +0200 (CEST)
Message-ID: <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
Date: Mon, 14 Apr 2025 12:25:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller
To: Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250413085806.8544-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/04/25 10:58, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
> Add binding for it.

That's the wrong binding... check mfd/syscon.yaml :-)

P.S.: Is there any reset controller in topmisc? Any clock?
       If yes, syscon.yaml is also wrong, and you need a driver for that.
       Remember: If it turns out *later* that this has clk/resets and the
       bindings are already set for just a syscon, it's gonna be way harder!

Cheers,
Angelo

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   .../power/mediatek,power-controller.yaml      | 35 +++++++++++++------
>   1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 591a080ca3ff..60d2fc7963e5 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -22,17 +22,27 @@ properties:
>       pattern: '^power-controller(@[0-9a-f]+)?$'
>   
>     compatible:
> -    enum:
> -      - mediatek,mt6735-power-controller
> -      - mediatek,mt6795-power-controller
> -      - mediatek,mt8167-power-controller
> -      - mediatek,mt8173-power-controller
> -      - mediatek,mt8183-power-controller
> -      - mediatek,mt8186-power-controller
> -      - mediatek,mt8188-power-controller
> -      - mediatek,mt8192-power-controller
> -      - mediatek,mt8195-power-controller
> -      - mediatek,mt8365-power-controller
> +    oneOf:
> +      - items:
> +        - enum:
> +          - mediatek,mt6735-power-controller
> +          - mediatek,mt6795-power-controller
> +          - mediatek,mt8167-power-controller
> +          - mediatek,mt8173-power-controller
> +          - mediatek,mt8183-power-controller
> +          - mediatek,mt8186-power-controller
> +          - mediatek,mt8188-power-controller
> +          - mediatek,mt8192-power-controller
> +          - mediatek,mt8195-power-controller
> +          - mediatek,mt8365-power-controller
> +      - items:
> +        - enum:
> +          - mediatek,mt7988-topmisc
> +        - const: syscon
> +        - const: mediatek,mt7988-power-controller
> +
> +  reg:
> +    maxItems: 1
>   
>     '#power-domain-cells':
>       const: 1
> @@ -43,6 +53,9 @@ properties:
>     '#size-cells':
>       const: 0
>   
> +  '#clock-cells':
> +    const: 1
> +
>   patternProperties:
>     "^power-domain@[0-9a-f]+$":
>       $ref: "#/$defs/power-domain-node"


