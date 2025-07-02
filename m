Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153C219A7A;
	Wed,  2 Jul 2025 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439033; cv=none; b=KG/VaM9Jj0hoMgJimH9lAFnhHAXzlS8Cd14Nem//XfHfCX5lYfAi0oI/+cJnbASt6/xLv1XJfdxX5u5S3k73nAQVM18KP9NM10t3GQv14phhyR5IZIYWdyu9asNCO0mxZYojOe8nmYNhtGCzd6QkNGNU8NWdUtdaClLOp9Qi03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439033; c=relaxed/simple;
	bh=f5xtgW85Pmdkf7NAY39l9hBBBHkw6klVthxbcAS/Ie4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1L4e9EkRjJjn8FVSCpYshGoqmlTpZoxwHTnFAxs8F/+WdG7FfqXDWIypGlgw9BIwiJymgP8lkMVCHolWwxpNfwNcLzlTUZb8a/KkX+VcNKV3VaTrb/CPEgkMi4szroTR5BYYyZpvLWYRmb3fGZlRlHLaYwBDNgjNSYdnaVNCg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sipMSGhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sipMSGhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD4DC4CEEE;
	Wed,  2 Jul 2025 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439031;
	bh=f5xtgW85Pmdkf7NAY39l9hBBBHkw6klVthxbcAS/Ie4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sipMSGhkq0VFiX5ymwlHzS/MjVKHUxSc88FYG16G//+tL5CwjMpqo6nNNc9snQj/b
	 +aSjM5thzzVDm1yZqRiqMepTU/vLbHrUfW7dXcuhqEC/RQ47wHd3K+459C3VOqIpAB
	 QN6CcOlzsQOefhEAy4biMovrYq4dWOXQGGqnSBu2CkQ5c+0a/LvKr/qQKePDEDH7w+
	 dsZDwGfkVIz8YmMGCVwXzx+yVc6NxmwktV2/VTwR7ObkylMx3zxrxoavuDXSLWRefq
	 vDL7xxF9dXWflHtbn18QLotOSMyOXX+Yactxsg+0tlBfCW3rlPxYaAuL3q9pVQiw1R
	 4Q/D2LMrJ1cKg==
Date: Wed, 2 Jul 2025 08:50:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	ulf.hansson@linaro.org, arnd@arndb.de, m.wilczynski@samsung.com, nm@ti.com, 
	khilman@baylibre.com, kabel@kernel.org, quic_hyiwei@quicinc.com, pjp@fedoraproject.org, 
	tudor.ambarus@linaro.org, drew@pdp7.com, u.kleine-koenig@baylibre.com, 
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, laura.nao@collabora.com, 
	kernel@collabora.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)
Message-ID: <20250702-debonair-lynx-of-serenity-ee7138@krzk-bin>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
 <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>

On Tue, Jul 01, 2025 at 05:11:48PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the new MediaTek Hardware Voter, found in
> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
> the MT6991 Dimensity 9400 for Smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> new file mode 100644
> index 000000000000..173b74c23a91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 Collabora Ltd
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Hardware Voter (HWV)
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-function MCU
> +  used to collect votes from both the Application Processor and from the
> +  various other remote processors present in the SoC, and transparently
> +  turn on or off various hardware resources (for example, power domains
> +  or system clocks) based on aggregation of votes done in the HWV MCU's
> +  internal state machine, therefore guaranteeing synchronization of the
> +  hardware resource requests between all components of the SoC and hence
> +  avoiding, for example, unclocked or unpowered access to the hardware.
> +
> +properties:
> +  $nodename:
> +    pattern: "^system-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mediatek,mt6991-hardware-voter
> +
> +  reg:
> +    items:
> +      - description: Address and size of the Hardware Voter MMIO
> +

No resources here, so this should go to power controller

> +  power-controller:
> +    $ref: /schemas/power/mediatek,power-controller.yaml
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> + - |
> +   scp_hwv: system-controller@14500000 {
> +     compatible = "mediatek,mt6991-hardware-voter";
> +     reg = <0 0x14500000 0 0x3000>;
> +
> +     power-controller {
> +       compatible = "mediatek,mt8196-hwv-scp-power-controller";

mt8196 in mt6991 is very confusing.

Anyway, this does not address my comment at all. You again create some
sort of syscon for voting, so no. You are supposed to use generic API
for voting: clocks, power domains, interconnects - whatever is there
applicable or necessary.

Best regards,
Krzysztof

